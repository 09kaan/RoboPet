import 'care_stat.dart';
 
/// The immutable output of a reconciliation pass. The repository applies
/// these values back onto the persisted model.
class ReconcileResult {
  final Map<String, CareStat> stats;     // updated stat values
  final Duration elapsed;                // raw wall-clock time since lastTickAt
  final Duration decayApplied;           // elapsed, capped by decayCap
  final Duration earnWindow;             // elapsed, capped by idleEarnCap
  final int scrapEarned;                 // whole units of scrap earned away
  final Set<String> depletedStats;       // stats that hit zero during the gap
  final DateTime lastTickAt;             // new lastTickAt to persist (UTC)
 
  const ReconcileResult({
    required this.stats,
    required this.elapsed,
    required this.decayApplied,
    required this.earnWindow,
    required this.scrapEarned,
    required this.depletedStats,
    required this.lastTickAt,
  });
 
  bool get neglected => depletedStats.isNotEmpty;
  bool get isNoOp => elapsed <= Duration.zero;
}
