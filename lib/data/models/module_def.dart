import 'module_enums.dart';
 
/// Immutable definition of a module type. Static data, compiled in.
class ModuleDef {
  const ModuleDef({
    required this.defId,
    required this.name,
    required this.slot,
    required this.rarity,
    required this.modifiers,
    this.element,
    this.description = '',
  });
 
  final String defId;
  final String name;
  final ModuleSlot slot;
  final ModuleRarity rarity;
  final List<StatModifier> modifiers;
  final DamageType? element;
  final String description;
}
 
/// The canonical catalog. The server's Remote Config loot table references
/// these same defIds, so client and Cloud Function never disagree.
const Map<String, ModuleDef> kModuleCatalog = {
  'basic_wheels': ModuleDef(
    defId: 'basic_wheels',
    name: 'Basic Wheels',
    slot: ModuleSlot.wheels,
    rarity: ModuleRarity.common,
    modifiers: [StatModifier(StatKey.speed, flat: 4)],
    description: 'Standard-issue rubber treads.',
  ),
  'mecanum_wheels_mk1': ModuleDef(
    defId: 'mecanum_wheels_mk1',
    name: 'Mecanum Wheels Mk.I',
    slot: ModuleSlot.wheels,
    rarity: ModuleRarity.rare,
    modifiers: [StatModifier(StatKey.speed, flat: 9, pct: 0.05)],
    description: 'Omnidirectional rollers. Strafe like a pro.',
  ),
  'scrap_plating': ModuleDef(
    defId: 'scrap_plating',
    name: 'Scrap Plating',
    slot: ModuleSlot.armor,
    rarity: ModuleRarity.common,
    modifiers: [StatModifier(StatKey.defense, flat: 6)],
    description: 'Welded junk. It mostly holds.',
  ),
  'titan_chassis': ModuleDef(
    defId: 'titan_chassis',
    name: 'Titanium Chassis',
    slot: ModuleSlot.armor,
    rarity: ModuleRarity.epic,
    modifiers: [
      StatModifier(StatKey.defense, flat: 18, pct: 0.10),
      StatModifier(StatKey.hp, flat: 40),
    ],
    description: 'Aerospace-grade frame. Tank mode engaged.',
  ),
  'lidar_array': ModuleDef(
    defId: 'lidar_array',
    name: 'LiDAR Array',
    slot: ModuleSlot.sensor,
    rarity: ModuleRarity.rare,
    modifiers: [StatModifier(StatKey.speed, pct: 0.08), StatModifier(StatKey.attack, flat: 5)],
    description: 'Sees everything. Targets first.',
  ),
  'jetson_nano_core': ModuleDef(
    defId: 'jetson_nano_core',
    name: 'Jetson Nano Logic Board',
    slot: ModuleSlot.core,
    rarity: ModuleRarity.epic,
    modifiers: [
      StatModifier(StatKey.attack, flat: 14, pct: 0.12),
      StatModifier(StatKey.energyRegen, flat: 2),
    ],
    element: DamageType.emp,
    description: 'On-board inference. Calculates the kill.',
  ),
  'plasma_core': ModuleDef(
    defId: 'plasma_core',
    name: 'Plasma Core',
    slot: ModuleSlot.core,
    rarity: ModuleRarity.rare,
    modifiers: [
      StatModifier(StatKey.attack, flat: 20),
    ],
    element: DamageType.fire,
    description: 'Runs hot, burns hotter.',
  ),
};
