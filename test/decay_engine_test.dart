import 'package:test/test.dart';
 
import 'package:robopet/domain/decay/care_stat.dart';
import 'package:robopet/domain/decay/decay_config.dart';
import 'package:robopet/domain/decay/decay_engine.dart';
 
void main() {
  final base = DateTime.utc(2026, 1, 1, 12, 0, 0);
 
  // Round numbers for easy mental math: battery drains 1/s, oil 0.5/s.
  Map<String, CareStat> freshStats() => {
        'battery': const CareStat(value: 100, max: 100, drainPerSecond: 1.0),
        'oil': const CareStat(value: 50, max: 100, drainPerSecond: 0.5),
      };
 
  group('DecayEngine.reconcile', () {
    test('applies linear decay over elapsed time', () {
      const engine = DecayEngine(DecayConfig.unlimited);
      final r = engine.reconcile(
        lastTickAt: base,
        now: base.add(const Duration(seconds: 10)),
        stats: freshStats(),
      );
      expect(r.stats['battery']!.value, closeTo(90, 1e-9));
      expect(r.stats['oil']!.value, closeTo(45, 1e-9));
      expect(r.elapsed, const Duration(seconds: 10));
      expect(r.neglected, isFalse);
    });
 
    test('clamps at zero -- never goes negative', () {
      const engine = DecayEngine(DecayConfig.unlimited);
      final r = engine.reconcile(
        lastTickAt: base,
        now: base.add(const Duration(seconds: 1000)),
        stats: freshStats(),
      );
      expect(r.stats['battery']!.value, 0);
      expect(r.stats['oil']!.value, 0);
    });
 
    test('monotonic guard: a backwards clock is a no-op', () {
      const engine = DecayEngine(DecayConfig.unlimited);
      final r = engine.reconcile(
        lastTickAt: base,
        now: base.subtract(const Duration(hours: 5)),
        stats: freshStats(),
      );
      expect(r.isNoOp, isTrue);
      expect(r.stats['battery']!.value, 100);
      expect(r.lastTickAt, base); // did NOT move backwards
    });
 
    test('decay cap (grace period) freezes decay after the cap', () {
      const engine = DecayEngine(
          DecayConfig(decayCap: Duration(seconds: 30), idleEarnCap: null));
      final r = engine.reconcile(
        lastTickAt: base,
        now: base.add(const Duration(hours: 10)),
        stats: freshStats(),
      );
      // Only 30s of decay applied: 100 - 1*30 = 70.
      expect(r.stats['battery']!.value, closeTo(70, 1e-9));
      expect(r.decayApplied, const Duration(seconds: 30));
    });
 
    test('idle earnings are capped by idleEarnCap', () {
      const engine = DecayEngine(
          DecayConfig(decayCap: null, idleEarnCap: Duration(hours: 8)));
      final r = engine.reconcile(
        lastTickAt: base,
        now: base.add(const Duration(hours: 24)),
        stats: freshStats(),
        scrapPerSecond: 1.0, // 1 scrap/second
      );
      expect(r.scrapEarned, 8 * 3600); // capped to 8 hours
      expect(r.earnWindow, const Duration(hours: 8));
    });
 
    test('flags neglect when a stat depletes during the gap', () {
      const engine = DecayEngine(DecayConfig.unlimited);
      final r = engine.reconcile(
        lastTickAt: base,
        now: base.add(const Duration(seconds: 200)),
        stats: freshStats(), // oil empties @100s, battery @100s
      );
      expect(r.neglected, isTrue);
      expect(r.depletedStats, containsAll(<String>['battery', 'oil']));
    });
 
    test('foreground ticks == one offline catch-up (determinism)', () {
      const engine = DecayEngine(DecayConfig.unlimited);
 
      final once = engine.reconcile(
        lastTickAt: base,
        now: base.add(const Duration(seconds: 10)),
        stats: freshStats(),
      );
 
      var current = freshStats();
      var t = base;
      for (var i = 0; i < 10; i++) {
        final next = t.add(const Duration(seconds: 1));
        final r = engine.reconcile(lastTickAt: t, now: next, stats: current);
        current = Map<String, CareStat>.of(r.stats);
        t = next;
      }
 
      expect(current['battery']!.value,
          closeTo(once.stats['battery']!.value, 1e-9));
      expect(current['oil']!.value, closeTo(once.stats['oil']!.value, 1e-9));
    });
  });
}
