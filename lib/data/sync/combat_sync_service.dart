import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';
 
import '../models/combat_snapshot.dart';
import '../models/module_instance.dart';
import '../../domain/combat/resolved_stats.dart';
 
class CombatSyncService {
  CombatSyncService({required this.isar, required this.db, required this.uid});
 
  final Isar isar;
  final FirebaseFirestore db;
  final String uid;
 
  Future<CombatSnapshot> push({
    required String robotInstanceId,
    required ResolvedCombatStats stats,
    required List<ModuleInstance> equipped,
  }) async {
    final snap = CombatSnapshot()
      ..snapshotId = const Uuid().v4()
      ..ownerUid = uid
      ..robotInstanceId = robotInstanceId
      ..resolvedHp = stats.hp
      ..resolvedAttack = stats.attack
      ..resolvedDefense = stats.defense
      ..resolvedSpeed = stats.speed
      ..equippedDefIds = equipped.map((m) => m.defId).toList()
      ..createdAt = DateTime.now().toUtc()
      ..schemaVersion = 3;
 
    await isar.writeTxn(() => isar.combatSnapshots.put(snap));
 
    await db.doc('users/$uid/combatSnapshot/active').set({
      'snapshotId': snap.snapshotId,
      'resolvedHp': snap.resolvedHp,
      'resolvedAttack': snap.resolvedAttack,
      'resolvedDefense': snap.resolvedDefense,
      'resolvedSpeed': snap.resolvedSpeed,
      'equippedDefIds': snap.equippedDefIds,
      'robotInstanceId': snap.robotInstanceId,
      'createdAt': FieldValue.serverTimestamp(),
    });
 
    return snap;
  }
}
