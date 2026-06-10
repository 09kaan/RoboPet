import 'care_stat.dart';
import 'decay_config.dart';
import 'reconcile_result.dart';
 
/// Pure, deterministic timestamp-delta simulation.
///
/// Given the previous tick time, the current time, and the stats, it returns
/// the new stat values + currency earned. Identical results whether called
/// once over a long gap (offline catch-up) or repeatedly over short gaps
/// (foreground smoothing).
class DecayEngine {
  final DecayConfig config;
  const DecayEngine([this.config = const DecayConfig()]);
 
  ReconcileResult reconcile({
    required DateTime lastTickAt,
    required DateTime now,
    required Map<String, CareStat> stats,
    double scrapPerSecond = 0.0,
  }) {
    final lastUtc = lastTickAt.toUtc();
    final nowUtc = now.toUtc();
    final rawElapsed = nowUtc.difference(lastUtc);
 
    // Monotonic guard: never advance backwards (clock rollback / TZ change).
    if (rawElapsed <= Duration.zero) {
      return ReconcileResult(
        stats: Map<String, CareStat>.unmodifiable(stats),
        elapsed: Duration.zero,
        decayApplied: Duration.zero,
        earnWindow: Duration.zero,
        scrapEarned: 0,
        depletedStats: const <String>{},
        lastTickAt: lastUtc, // unchanged
      );
    }
 
    final decayWindow = _cap(rawElapsed, config.decayCap);
    final earnWindow = _cap(rawElapsed, config.idleEarnCap);
    final decaySeconds = _toSeconds(decayWindow);
 
    final newStats = <String, CareStat>{};
    final depleted = <String>{};
    stats.forEach((key, stat) {
      final emptyAt = stat.secondsUntilEmpty();
      if (emptyAt != null && emptyAt <= decaySeconds) depleted.add(key);
      newStats[key] = stat.copyWith(value: stat.valueAfter(decaySeconds));
    });
 
    final scrapEarned = (scrapPerSecond * _toSeconds(earnWindow)).floor();
 
    return ReconcileResult(
      stats: Map<String, CareStat>.unmodifiable(newStats),
      elapsed: rawElapsed,
      decayApplied: decayWindow,
      earnWindow: earnWindow,
      scrapEarned: scrapEarned,
      depletedStats: Set<String>.unmodifiable(depleted),
      lastTickAt: nowUtc,
    );
  }
 
  static Duration _cap(Duration value, Duration? cap) =>
      cap == null ? value : (value < cap ? value : cap);
 
  static double _toSeconds(Duration d) =>
      d.inMicroseconds / Duration.microsecondsPerSecond;
}
