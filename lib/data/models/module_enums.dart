/// Equipment slots on a robot. Matches the TDD loadout schema.
enum ModuleSlot { wheels, armor, sensor, core, utility }
 
/// Drop rarities. Order matters for comparisons / sorting.
enum ModuleRarity { common, rare, epic }
 
/// Which derived combat stat a modifier touches.
enum StatKey { hp, attack, defense, speed, energyRegen }
 
/// A single additive/multiplicative modifier contributed by a module.
/// resolveStats applies: (base + sum(flat)) * (1 + sum(pct)).
class StatModifier {
  const StatModifier(this.stat, {this.flat = 0, this.pct = 0});
  final StatKey stat;
  final double flat; // absolute add
  final double pct;  // fractional, e.g. 0.15 == +15%
}
 
/// Combat element / damage type for Rock-Paper-Scissors mechanics.
enum DamageType { kinetic, emp, fire, acid }
