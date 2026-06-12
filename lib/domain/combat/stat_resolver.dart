import '../../data/models/module_instance.dart';
import '../../data/models/game_item.dart';
import 'resolved_stats.dart';
 
/// Base stats every robot starts with before module bonuses.
const _kBase = (
  hp: 100.0, attack: 15.0, defense: 10.0, speed: 10.0, energyRegen: 2.0);
 
double _applyStat(double base, double flatSum, double pctSum) {
  final cappedPct = pctSum.clamp(-60.0, 60.0); // keep stacking sane
  return (base + flatSum) * (1 + cappedPct / 100);
}

ResolvedCombatStats resolveStats(List<ModuleInstance> equippedModules) {
  final equipped = equippedModules.map((m) => m.def).whereType<GameItem>().toList();

  double flat(StatMod s) => equipped
      .expand((it) => it.modifiers)
      .where((m) => m.stat == s)
      .fold(0.0, (a, m) => a + m.value);

  var element = DamageType.kinetic;
  for (final item in equipped) {
    if (item.slot == ModuleSlot.core && item.element != null) {
      element = item.element!;
    }
  }

  return ResolvedCombatStats(
    hp: _applyStat(_kBase.hp, flat(StatMod.maxHpFlat), 0).round(),
    attack: _applyStat(_kBase.attack, flat(StatMod.atkFlat), flat(StatMod.atkPct)).round(),
    defense: _applyStat(_kBase.defense, flat(StatMod.defFlat), flat(StatMod.defPct)).round(),
    speed: _applyStat(_kBase.speed, flat(StatMod.spdFlat), 0).round(),
    energyRegen: _applyStat(_kBase.energyRegen, flat(StatMod.chargeRateFlat), 0).round(),
    element: element,
  );
}
