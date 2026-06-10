import 'package:isar/isar.dart';
 
import '../domain/clock.dart';
import '../domain/decay/care_stat.dart';
import '../domain/decay/decay_engine.dart';
import '../domain/decay/reconcile_result.dart';
import 'models/player_profile.dart';
import 'models/robot_instance.dart';
 
/// Which care stat a player action tops up.
enum CareKind { battery, oil, entertainment }

class RobotRepository {
  final Isar _isar;
  final DecayEngine _engine;
  final Clock _clock;
 
  RobotRepository(
    this._isar, {
    DecayEngine engine = const DecayEngine(),
    Clock clock = const SystemClock(),
  })  : _engine = engine,
        _clock = clock;
 
  /// Loads the active robot, applies offline catch-up, persists, returns it.
  Future<RobotInstance?> loadActiveAndReconcile() async {
    final robot =
        await _isar.robotInstances.filter().isActiveEqualTo(true).findFirst();
    if (robot == null) return null;
    final result = _reconcileInPlace(robot);
    await _persist(robot, result);
    return robot;
  }
 
  /// Settles elapsed decay, THEN adds [amount] to the chosen stat, so the
  /// boost always stacks on the correct (decayed) base value.
  Future<RobotInstance?> applyCare(
    String instanceId,
    CareKind kind, {
    double amount = 60,
  }) async {
    final robot = await _isar.robotInstances
        .filter()
        .instanceIdEqualTo(instanceId)
        .findFirst();
    if (robot == null) return null;
 
    final result = _reconcileInPlace(robot); // advance time first
 
    final stat = switch (kind) {
      CareKind.battery => robot.battery,
      CareKind.oil => robot.oil,
      CareKind.entertainment => robot.entertainment,
    };
    stat.value = (stat.value + amount).clamp(0.0, stat.max).toDouble();
    if (kind == CareKind.battery) robot.lastFedAt = _clock.now().toUtc();
 
    await _persist(robot, result);
    return robot;
  }
 
  Future<RobotInstance?> feed(String id, {double amount = 60}) =>
      applyCare(id, CareKind.battery, amount: amount);
 
  Future<RobotInstance?> clean(String id, {double amount = 60}) =>
      applyCare(id, CareKind.oil, amount: amount);
 
  Future<RobotInstance?> play(String id, {double amount = 60}) =>
      applyCare(id, CareKind.entertainment, amount: amount);
 
  // --- internals ---
 
  ReconcileResult _reconcileInPlace(RobotInstance r) {
    final result = _engine.reconcile(
      lastTickAt: r.lastTickAt,
      now: _clock.now(),
      stats: {
        'battery': _toDomain(r.battery),
        'oil': _toDomain(r.oil),
        'entertainment': _toDomain(r.entertainment),
      },
      scrapPerSecond: r.scrapPerSecond,
    );
 
    if (!result.isNoOp) {
      r.battery.value = result.stats['battery']!.value;
      r.oil.value = result.stats['oil']!.value;
      r.entertainment.value = result.stats['entertainment']!.value;
      r.lastTickAt = result.lastTickAt;
      if (result.neglected) r.neglectStrikes += 1;
    }
    return result;
  }
 
  Future<void> _persist(RobotInstance robot, ReconcileResult result) async {
    await _isar.writeTxn(() async {
      await _isar.robotInstances.put(robot);
      if (result.scrapEarned > 0) {
        final profile = await _isar.playerProfiles.where().findFirst();
        if (profile != null) {
          profile.currencies.scrap += result.scrapEarned;
          await _isar.playerProfiles.put(profile);
        }
      }
    });
  }
 
  CareStat _toDomain(CareStatData d) => CareStat(
        value: d.value,
        max: d.max,
        drainPerSecond: 0.5, // TEMPORARY FAST DRAIN FOR TESTING
      );
}
