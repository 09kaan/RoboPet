import '../../data/models/module_instance.dart';
import '../../data/models/module_enums.dart';
import 'resolved_stats.dart';
 
/// Base stats every robot starts with before module bonuses.
const _kBase = (
  hp: 100.0, attack: 15.0, defense: 10.0, speed: 10.0, energyRegen: 2.0);
 
/// Formula: (base + sumFlat) * (1 + sumPct) -- per stat, per module.
ResolvedCombatStats resolveStats(List<ModuleInstance> equippedModules) {
  final flat = <StatKey, double>{};
  final pct = <StatKey, double>{};
 
  var element = DamageType.kinetic;
 
  for (final m in equippedModules) {
    final def = m.def;
    if (def == null) continue;
    
    if (def.slot == ModuleSlot.core && def.element != null) {
      element = def.element!;
    }
    
    for (final mod in def.modifiers) {
      flat[mod.stat] = (flat[mod.stat] ?? 0) + mod.flat;
      pct[mod.stat] = (pct[mod.stat] ?? 0) + mod.pct;
    }
  }
 
  int r(StatKey key, double base) =>
      ((base + (flat[key] ?? 0)) * (1 + (pct[key] ?? 0))).round();
 
  return ResolvedCombatStats(
    hp: r(StatKey.hp, _kBase.hp),
    attack: r(StatKey.attack, _kBase.attack),
    defense: r(StatKey.defense, _kBase.defense),
    speed: r(StatKey.speed, _kBase.speed),
    energyRegen: r(StatKey.energyRegen, _kBase.energyRegen),
    element: element,
  );
}
