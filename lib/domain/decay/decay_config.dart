/// Tunable knobs for offline progression. In production these come from
/// Firebase Remote Config; here they have sensible defaults.
class DecayConfig {
  /// Decay stops accruing after this much offline time (grace period),
  /// so a player returning from vacation isn't punished with a dead robot.
  /// null = decay applies for the full elapsed duration.
  final Duration? decayCap;
 
  /// Idle currency only accrues up to this much offline time.
  /// null = currency accrues for the full elapsed duration.
  final Duration? idleEarnCap;
 
  const DecayConfig({
    this.decayCap = const Duration(hours: 12),
    this.idleEarnCap = const Duration(hours: 8),
  });
 
  /// No caps -- useful for tests and pure linear-decay reasoning.
  static const DecayConfig unlimited =
      DecayConfig(decayCap: null, idleEarnCap: null);
}
