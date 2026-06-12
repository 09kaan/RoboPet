import 'dart:async';
import 'package:flutter/foundation.dart';
 
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:isar/isar.dart';
import '../models/game_item.dart';
import '../models/module_instance.dart';
import '../models/player_profile.dart';
import '../models/robot_instance.dart';
import '../../domain/decor/decor_def.dart';
import 'cloud_profile_mapper.dart';
 
/// Owns the bidirectional, conflict-free sync between Isar and Firestore.
///   Economy: cloud -> local (cloud wins, version-guarded).
///   Care:    local -> cloud (read-only mirror; disjoint field set).
class EconomySyncService {
  EconomySyncService({
    required Isar isar,
    required FirebaseFirestore db,
    required String uid,
  })  : _isar = isar,
        _db = db,
        _uid = uid;
 
  final Isar _isar;
  final FirebaseFirestore _db;
  final String _uid;
 
  DocumentReference<Map<String, dynamic>> get _profileRef =>
      _db.doc('users/$_uid/meta/profile');
 
  CollectionReference<Map<String, dynamic>> _sub(String name) =>
      _db.collection('users/$_uid/$name');
 
  // ---- Lifecycle ---------------------------------------------------------
 
  /// Called once after auth resolves. Creates the profile if missing,
  /// then pulls cloud economy into Isar.
  Future<void> hydrateOnLogin() async {
    final snap = await _profileRef.get();
    if (!snap.exists) {
      await _seedNewPlayer();
    } else {
      await _applyCloudEconomy(snap.data()!);
    }
    await _hydrateModules();
  }
 
  /// Live economy subscription. Any server mutation (gacha, minigame reward)
  /// streams straight into Isar so the UI updates with zero extra plumbing.
  Stream<void> watchEconomy() =>
      _profileRef.snapshots().asyncMap((snap) async {
        final data = snap.data();
        if (data != null) await _applyCloudEconomy(data);
      });
 
  // ---- Cloud -> local (economy) -----------------------------------------
 
  Future<void> _applyCloudEconomy(Map<String, dynamic> data) async {
    final cloudVersion = (data['economyVersion'] as num?)?.toInt() ?? 0;
    await _isar.writeTxn(() async {
      var profile =
          await _isar.playerProfiles.filter().playerIdEqualTo(_uid).findFirst();
      profile ??= PlayerProfile()..playerId = _uid;
 
      // Staleness guard: never regress to an older economy snapshot.
      if (cloudVersion >= profile.economyVersion) {
        CloudProfileMapper.applyEconomy(profile, data);
        await _isar.playerProfiles.put(profile);
      }
    });
  }
 
  Future<bool> spend({required CurrencyType currency, required int amount, required String reason}) async {
    final ok = await _db.runTransaction((tx) async {
      final snap = await tx.get(_profileRef);
      if (!snap.exists) return false;
      final data = snap.data()!;
      final balances = Map<String, dynamic>.from(data['currencies'] as Map? ?? {});
      
      final currencyKey = currency.name;
      final current = (balances[currencyKey] as num?)?.toInt() ?? 0;
      if (current < amount) return false;
      
      balances[currencyKey] = current - amount;
      data['currencies'] = balances;
      data['economyVersion'] = ((data['economyVersion'] as num?)?.toInt() ?? 0) + 1;
      
      tx.set(_profileRef, data, SetOptions(merge: true));
      return true;
    });
    return ok;
  }
 
  Future<void> grantScrap(int amount) async {
    await _isar.writeTxn(() async {
      var profile = await _isar.playerProfiles.filter().playerIdEqualTo(_uid).findFirst();
      if (profile != null) {
        profile.currencies.scrap += amount;
        profile.economyVersion += 1;
        await _isar.playerProfiles.put(profile);
      }
    });
 
    try {
      await _db.runTransaction((tx) async {
        tx.update(_profileRef, {
          'currencies.scrap': FieldValue.increment(amount),
          'economyVersion': FieldValue.increment(1),
        });
      });
    } catch (e) {
      debugPrint('Failed to grant scrap: $e');
    }
  }
 
  Future<void> grantCogs(int amount) async {
    await _isar.writeTxn(() async {
      var profile = await _isar.playerProfiles.filter().playerIdEqualTo(_uid).findFirst();
      if (profile != null) {
        profile.currencies.rareCogs += amount;
        profile.economyVersion += 1;
        await _isar.playerProfiles.put(profile);
      }
    });
 
    try {
      await _db.runTransaction((tx) async {
        tx.update(_profileRef, {
          'currencies.rareCogs': FieldValue.increment(amount),
          'economyVersion': FieldValue.increment(1),
        });
      });
    } catch (e) {
      debugPrint('Failed to grant cogs: $e');
    }
  }
 
  Future<void> grantDecor(String id) async {
    await _db.runTransaction((tx) async {
      final snap = await tx.get(_profileRef);
      if (!snap.exists) return;
      final data = snap.data()!;
      final owned = List<String>.from(data['ownedDecor'] ?? []);
      if (!owned.contains(id)) {
        owned.add(id);
        data['ownedDecor'] = owned;
        data['economyVersion'] = ((data['economyVersion'] as num?)?.toInt() ?? 0) + 1;
        tx.set(_profileRef, data, SetOptions(merge: true));
      }
    });
  }

  Future<void> syncModuleToCloud(ModuleInstance module) async {
    final uid = _uid;
    if (uid == null) return;
    final docId = module.instanceId;
    await _db.collection('users').doc(uid).collection('modules').doc(docId).set({
      'defId': module.defId,
      'level': module.level,
      'isEquipped': module.isEquipped,
    }, SetOptions(merge: true));
  }
 
  Future<void> saveCombatLevel(int level) async {
    // Local optimistic
    await _isar.writeTxn(() async {
      var profile = await _isar.playerProfiles.filter().playerIdEqualTo(_uid).findFirst();
      if (profile != null && profile.combatLevel < level) {
        profile.combatLevel = level;
        profile.economyVersion += 1;
        await _isar.playerProfiles.put(profile);
      }
    });
 
    try {
      await _db.runTransaction((tx) async {
        final snap = await tx.get(_profileRef);
        if (!snap.exists) return;
        final current = (snap.data()?['combatLevel'] as num?)?.toInt() ?? 1;
        if (current < level) {
          tx.update(_profileRef, {
            'combatLevel': level,
            'economyVersion': FieldValue.increment(1),
          });
        }
      });
    } catch (e) {
      debugPrint('Failed to save combat level: $e');
    }
  }
 
  Future<void> _hydrateModules() async {
    final qs = await _sub('modules').get();
    await _isar.writeTxn(() async {
      for (final doc in qs.docs) {
        final d = doc.data();
        final existing = await _isar.moduleInstances
            .filter()
            .instanceIdEqualTo(doc.id)
            .findFirst();
        final m = existing ?? ModuleInstance()
          ..instanceId = doc.id
          ..defId = d['defId'] as String
          ..rarity = _rarityFrom(d['rarity'] as String?)
          ..level = (d['level'] as num?)?.toInt() ?? 1
          ..equippedRobotId = (d['equippedRobotId'] as String?) ?? existing?.equippedRobotId
          ..acquiredAt = _ts(d['acquiredAt'])
          ..schemaVersion = 2;
        await _isar.moduleInstances.put(m);
      }
    });
  }
 
  // ---- Local -> cloud (care mirror) -------------------------------------
 
  /// Push the read-only care snapshot. The security rules permit ONLY this
  /// (careMirror + displayName), so it can never collide with economy writes.
  Future<void> pushCareMirror(RobotInstance r) async {
    await _db.doc('users/$_uid/robots/${r.instanceId}').set({
      'careMirror': {
        'battery': r.battery.value,
        'oil': r.oil.value,
        'entertainment': r.entertainment.value,
        'lastTickAt': r.lastTickAt.toUtc().toIso8601String(),
      },
    }, SetOptions(merge: true));
  }
 
  // ---- Seed --------------------------------------------------------------
 
  Future<void> _seedNewPlayer() async {
    // First-run write: doc doesn't exist yet, contains zeroed balances.
    await _profileRef.set(CloudProfileMapper.seedPayload(_uid));
    final snap = await _profileRef.get();
    await _applyCloudEconomy(snap.data()!);
  }
 
  // ---- helpers -----------------------------------------------------------
 
  static DateTime _ts(Object? v) {
    if (v is Timestamp) return v.toDate().toUtc();
    if (v is String) return DateTime.parse(v).toUtc();
    return DateTime.now().toUtc();
  }
 
  static Rarity _rarityFrom(String? name) => Rarity.values
      .firstWhere((e) => e.name == name, orElse: () => Rarity.common);
}
