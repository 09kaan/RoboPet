import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../../app/providers.dart';
import '../../data/models/game_item.dart';
import '../../data/models/module_instance.dart';
import '../../data/models/player_profile.dart';

final economyProvider = Provider<EconomyService>((ref) {
  return EconomyService(
    isar: ref.watch(isarProvider),
    session: ref.watch(sessionProvider).valueOrNull?.uid,
  );
});

const kKeyPriceScrap = <KeyTier, int>{
  KeyTier.basic: 40,
  KeyTier.rare: 120,
};

const kKeyPriceGems = <KeyTier, int>{
  KeyTier.epic: 5,
};

const kCrateWeights = <KeyTier, Map<Rarity, int>>{
  KeyTier.basic: {Rarity.common: 75, Rarity.rare: 22, Rarity.epic: 3},
  KeyTier.rare: {Rarity.common: 35, Rarity.rare: 55, Rarity.epic: 9, Rarity.legendary: 1},
  KeyTier.epic: {Rarity.rare: 40, Rarity.epic: 50, Rarity.legendary: 10},
};

class EconomyService {
  final Isar isar;
  final String? sessionUid;

  EconomyService({required this.isar, required this.sessionUid});

  Future<void> grantStarterPack() async {
    if (sessionUid == null) return;
    await isar.writeTxn(() async {
      final profile = await isar.playerProfiles.filter().playerIdEqualTo(sessionUid!).findFirst();
      if (profile == null || profile.starterGranted) return;

      profile.currencies.scrap += 60;
      profile.currencies.basicKeys += 1;
      profile.starterGranted = true;
      await isar.playerProfiles.put(profile);

      // Give starter core
      final starterItem = catalogById('core_kinetic_basic');
      await _grantItemInternal(starterItem);
    });
  }

  Future<void> addScrap(int amount) async {
    if (sessionUid == null || amount <= 0) return;
    await isar.writeTxn(() async {
      final profile = await isar.playerProfiles.filter().playerIdEqualTo(sessionUid!).findFirst();
      if (profile != null) {
        profile.currencies.scrap += amount;
        await isar.playerProfiles.put(profile);
      }
    });
  }

  Future<bool> buyKeyWithScrap(KeyTier tier) async {
    if (sessionUid == null) return false;
    final price = kKeyPriceScrap[tier];
    if (price == null) return false;

    return await isar.writeTxn(() async {
      final profile = await isar.playerProfiles.filter().playerIdEqualTo(sessionUid!).findFirst();
      if (profile == null || profile.currencies.scrap < price) return false;

      profile.currencies.scrap -= price;
      
      switch (tier) {
        case KeyTier.basic:
          profile.currencies.basicKeys += 1;
          break;
        case KeyTier.rare:
          profile.currencies.rareKeys += 1;
          break;
        case KeyTier.epic:
          profile.currencies.epicKeys += 1;
          break;
      }
      
      await isar.playerProfiles.put(profile);
      return true;
    });
  }

  Future<GameItem?> openCrate(KeyTier tier) async {
    if (sessionUid == null) return null;
    
    // First, try to spend the key
    final success = await isar.writeTxn(() async {
      final profile = await isar.playerProfiles.filter().playerIdEqualTo(sessionUid!).findFirst();
      if (profile == null) return false;

      switch (tier) {
        case KeyTier.basic:
          if (profile.currencies.basicKeys <= 0) return false;
          profile.currencies.basicKeys -= 1;
          break;
        case KeyTier.rare:
          if (profile.currencies.rareKeys <= 0) return false;
          profile.currencies.rareKeys -= 1;
          break;
        case KeyTier.epic:
          if (profile.currencies.epicKeys <= 0) return false;
          profile.currencies.epicKeys -= 1;
          break;
      }
      await isar.playerProfiles.put(profile);
      return true;
    });

    if (!success) return null;

    // We spent the key, now roll loot
    final weights = kCrateWeights[tier]!;
    final rarity = _rollRarity(weights);
    
    final pool = kCatalog.where((it) => it.rarity == rarity).toList();
    if (pool.isEmpty) return null;
    
    final item = pool[Random().nextInt(pool.length)];
    
    await isar.writeTxn(() async {
      await _grantItemInternal(item);
    });

    return item;
  }

  Rarity _rollRarity(Map<Rarity, int> weights) {
    final total = weights.values.fold<int>(0, (a, b) => a + b);
    var roll = Random().nextInt(total);
    for (final e in weights.entries) {
      if (roll < e.value) return e.key;
      roll -= e.value;
    }
    return weights.keys.first;
  }

  /// Internal method. Must be called inside a writeTxn!
  Future<void> _grantItemInternal(GameItem item) async {
    if (item.kind == ItemKind.module) {
      final instance = ModuleInstance()
        ..instanceId = 'mod_${DateTime.now().millisecondsSinceEpoch}_${Random().nextInt(9999)}'
        ..defId = item.id
        ..rarity = item.rarity
        ..acquiredAt = DateTime.now().toUtc();
      await isar.moduleInstances.put(instance);
    } else if (item.kind == ItemKind.consumable) {
      final profile = await isar.playerProfiles.filter().playerIdEqualTo(sessionUid!).findFirst();
      if (profile != null) {
        final count = profile.consumables[item.id] ?? 0;
        profile.consumables[item.id] = count + 1;
        await isar.playerProfiles.put(profile);
      }
    } else if (item.kind == ItemKind.cosmetic) {
      final profile = await isar.playerProfiles.filter().playerIdEqualTo(sessionUid!).findFirst();
      if (profile != null) {
        if (!profile.ownedDecor.contains(item.id)) {
          final updatedDecor = List<String>.from(profile.ownedDecor)..add(item.id);
          profile.ownedDecor = updatedDecor;
          await isar.playerProfiles.put(profile);
        }
      }
    }
  }
}
