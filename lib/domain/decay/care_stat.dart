/// Immutable value object for a single decaying care stat.
class CareStat {
  final double value;
  final double max;
  final double drainPerSecond;
 
  const CareStat({
    required this.value,
    required this.max,
    required this.drainPerSecond,
  })  : assert(max > 0, 'max must be positive'),
        assert(drainPerSecond >= 0, 'drain must be non-negative');
 
  /// Value after [seconds] of decay, clamped to [0, max].
  double valueAfter(double seconds) =>
      (value - drainPerSecond * seconds).clamp(0.0, max).toDouble();
 
  /// Seconds until this stat reaches zero from its current value.
  /// Returns null if it never empties (no drain), 0 if already empty.
  double? secondsUntilEmpty() {
    if (drainPerSecond <= 0) return null;
    if (value <= 0) return 0;
    return value / drainPerSecond;
  }
 
  CareStat copyWith({double? value, double? max, double? drainPerSecond}) =>
      CareStat(
        value: value ?? this.value,
        max: max ?? this.max,
        drainPerSecond: drainPerSecond ?? this.drainPerSecond,
      );
}
