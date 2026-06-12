import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../data/auth/auth_service.dart';
import '../data/gacha/gacha_service.dart';
import '../data/sync/economy_sync_service.dart';
import '../data/models/player_profile.dart';
import '../data/models/robot_instance.dart';
import '../data/models/module_instance.dart';
import '../data/models/game_item.dart';
import '../data/robot_factory.dart';
import '../data/robot_repository.dart';
import '../domain/clock.dart';
import '../data/combat/combat_notifier.dart';
import '../data/sync/combat_sync_service.dart';
import '../data/decor/decor_repository.dart';
import '../domain/combat/stat_resolver.dart';
import '../domain/economy/economy_provider.dart';

/// Provided via override in main() (Phase 1).
final isarProvider = Provider<Isar>((ref) => throw UnimplementedError());

final firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);
final firestoreProvider =
    Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

final authServiceProvider = Provider<AuthService>(
  (ref) => AuthService(ref.watch(firebaseAuthProvider)),
);

/// Ensures an anonymous session, returns the User (with uid).
final sessionProvider = FutureProvider<User>((ref) async {
  return ref.watch(authServiceProvider).ensureSignedIn();
});

/// Built once we have a uid; owns Isar<->Firestore sync.
final economySyncProvider = Provider<EconomySyncService>((ref) {
  final user = ref.watch(sessionProvider).requireValue;
  return EconomySyncService(
    isar: ref.watch(isarProvider),
    db: ref.watch(firestoreProvider),
    uid: user.uid,
  );
});

/// Kicks off hydration + keeps the economy stream alive for the app's life.
final economyBootstrapProvider = FutureProvider<void>((ref) async {
  final sync = ref.watch(economySyncProvider);
  await sync.hydrateOnLogin();
  final sub = sync.watchEconomy().listen((_) {});
  ref.onDispose(sub.cancel);
});

/// UI reads currencies from the single local source of truth (Isar).
final currenciesStreamProvider = StreamProvider<Currencies>((ref) {
  final isar = ref.watch(isarProvider);
  final user = ref.watch(sessionProvider).requireValue;
  return isar.playerProfiles
      .filter()
      .playerIdEqualTo(user.uid)
      .watch(fireImmediately: true)
      .map((rows) => rows.isEmpty ? Currencies() : rows.first.currencies);
});

final functionsProvider = Provider<FirebaseFunctions>(
  (ref) => FirebaseFunctions.instanceFor(region: 'us-central1'),
);
 
final gachaServiceProvider = Provider<GachaService>(
  (ref) => GachaService(ref.watch(functionsProvider)),
);
 
/// All owned modules, live from Isar (hydrated by EconomySyncService).
final inventoryProvider = StreamProvider<List<ModuleInstance>>((ref) {
  final isar = ref.watch(isarProvider);
  return isar.moduleInstances
      .where()
      .sortByAcquiredAtDesc()
      .watch(fireImmediately: true);
});
 
/// Modules currently equipped on a given robot, grouped by slot.
final equippedModulesProvider =
    Provider.family<Map<ModuleSlot, ModuleInstance>, String>((ref, robotId) {
  final all = ref.watch(inventoryProvider).valueOrNull ?? const [];
  final map = <ModuleSlot, ModuleInstance>{};
  for (final m in all.where((m) => m.equippedRobotId == robotId)) {
    final slot = m.def?.slot;
    if (slot != null) map[slot] = m;
  }
  return map;
});
 
/// Imperative roll trigger for the UI. The result module shows up in
/// inventoryProvider automatically via the economy stream.
final rollGachaProvider = FutureProvider.autoDispose<GachaResult>((ref) async {
  return ref.watch(gachaServiceProvider).roll();
});

final clockProvider = Provider<Clock>((ref) => const SystemClock());

final robotRepositoryProvider = Provider<RobotRepository>((ref) {
  return RobotRepository(
    ref.watch(isarProvider),
    clock: ref.watch(clockProvider),
  );
});
 
final careTickerProvider = Provider<void>((ref) {
  final repo = ref.watch(robotRepositoryProvider);
  final timer = Timer.periodic(const Duration(seconds: 30), (_) {
    repo.loadActiveAndReconcile();
  });
  ref.onDispose(timer.cancel);
});

/// First-launch seeding + the initial offline catch-up.
/// Returns the active robot's Isar id (the key for watchObject).
final activeRobotIdProvider = FutureProvider<int?>((ref) async {
  final isar = ref.watch(isarProvider);
  final repo = ref.watch(robotRepositoryProvider);
  final clock = ref.watch(clockProvider);

  // Wait for auth & economy sync first
  await ref.watch(economyBootstrapProvider.future);
  final user = await ref.watch(sessionProvider.future);

  // Seed a starter pet + profile the very first time.
  if (await isar.robotInstances.count() == 0) {
    final robot = RobotFactory.starter(
      instanceId: 'starter-001',
      now: clock.now(),
    );
    await isar.writeTxn(() async {
      await isar.robotInstances.put(robot);
      var profile = await isar.playerProfiles.filter().playerIdEqualTo(user.uid).findFirst();
      if (profile != null) {
        profile.activeRobotId = robot.instanceId;
        await isar.playerProfiles.put(profile);
      }
    });
    
    // Also grant the economy starter pack (scrap, keys, starter core)
    await ref.read(economyProvider).grantStarterPack();
  }

  // Compute offline progression at launch, return the active id.
  final active = await repo.loadActiveAndReconcile();
  return active?.id;
});

/// Reactive stream of the active robot. Emits on every DB write
/// (decay tick, care action, offline catch-up) -> UI rebuilds.
final activeRobotStreamProvider = StreamProvider<RobotInstance?>((ref) async* {
  final isar = ref.watch(isarProvider);
  final id = await ref.watch(activeRobotIdProvider.future);
  if (id == null) {
    yield null;
    return;
  }
  yield* isar.robotInstances.watchObject(id, fireImmediately: true);
});
 
// Combat state.
final combatProvider = StateNotifierProvider<CombatNotifier, CombatState>((ref) {
  final isar = ref.watch(isarProvider);
  final user = ref.watch(sessionProvider).valueOrNull;
  int initialLevel = 1;
  if (user != null) {
    final profile = isar.playerProfiles.filter().playerIdEqualTo(user.uid).findFirstSync();
    if (profile != null) initialLevel = profile.combatLevel;
  }
  return CombatNotifier(ref, initialLevel: initialLevel);
});
 
// Resolved stats for the active robot.
final resolvedStatsProvider = Provider<ResolvedCombatStats>((ref) {
  const robotId = 'robot_0'; // swap with ref.watch(activeRobotIdProvider)
  final equipped = ref.watch(equippedModulesProvider(robotId));
  return resolveStats(equipped.values.toList());
});
 
// CombatSyncService.
final combatSyncProvider = Provider<CombatSyncService>((ref) {
  final user = ref.watch(sessionProvider).requireValue;
  return CombatSyncService(
    isar: ref.watch(isarProvider),
    db: ref.watch(firestoreProvider),
    uid: user.uid,
  );
});
 
final decorRepositoryProvider = Provider<DecorRepository>((ref) {
  final isar = ref.watch(isarProvider);
  return DecorRepository(isar);
});
