/// A source of "now". Injected so time is controllable in tests.
abstract class Clock {
  DateTime now();
}
 
class SystemClock implements Clock {
  const SystemClock();
  @override
  DateTime now() => DateTime.now().toUtc();
}
 
/// Test double: a clock you can set and advance deterministically.
class FixedClock implements Clock {
  FixedClock(this._now);
  DateTime _now;
 
  void set(DateTime t) => _now = t.toUtc();
  void advance(Duration d) => _now = _now.add(d);
 
  @override
  DateTime now() => _now.toUtc();
}
