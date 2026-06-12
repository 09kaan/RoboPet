import 'robot_instance.dart'; // For Rarity

enum ItemKind { module, consumable, cosmetic }
enum KeyTier { basic, rare, epic }

enum ModuleSlot { wheels, armor, sensor, core, utility }

// We already have Rarity enum in robot_instance.dart, we will reuse it.
// enum Rarity { common, rare, epic, legendary }

enum DamageType { kinetic, fire, emp, acid }

enum StatMod { atkFlat, atkPct, defFlat, defPct, maxHpFlat, spdFlat, critPct, cooldownPct, chargeRateFlat }

class Modifier {
  final StatMod stat;
  final double value; // flat = points, pct = percent (10 means +10%)
  const Modifier(this.stat, this.value);
}

enum ConsumableEffect { healHp, restoreEnergy, grantScrap, fillCharge }

class ConsumableSpec {
  final ConsumableEffect effect;
  final int amount;
  const ConsumableSpec(this.effect, this.amount);
}

class GameItem {
  final String id;
  final String name;
  final ItemKind kind;
  final Rarity rarity;
  final ModuleSlot? slot;          // for modules
  final DamageType? element;       // for cores
  final List<Modifier> modifiers;  // modules: detailed stat changes
  final ConsumableSpec? consumable;// consumables
  final String description;

  const GameItem({
    required this.id,
    required this.name,
    required this.kind,
    required this.rarity,
    this.slot,
    this.element,
    this.modifiers = const [],
    this.consumable,
    this.description = '',
  });
}

const kCatalog = <GameItem>[
  // Cores (set element + attack and charge)
  GameItem(
    id: 'core_kinetic_basic', 
    name: 'Kinetic Core', 
    kind: ItemKind.module, 
    rarity: Rarity.common, 
    slot: ModuleSlot.core, 
    element: DamageType.kinetic, 
    modifiers: [Modifier(StatMod.atkFlat, 4)],
    description: 'Standard issue kinetic battery.',
  ),
  GameItem(
    id: 'core_emp_basic', 
    name: 'EMP Core', 
    kind: ItemKind.module, 
    rarity: Rarity.common, 
    slot: ModuleSlot.core, 
    element: DamageType.emp, 
    modifiers: [Modifier(StatMod.atkFlat, 4)],
    description: 'Entry-level electromagnetic pulse generator.',
  ),
  GameItem(
    id: 'core_fire_charged', 
    name: 'Plasma Core', 
    kind: ItemKind.module, 
    rarity: Rarity.rare, 
    slot: ModuleSlot.core, 
    element: DamageType.fire, 
    modifiers: [Modifier(StatMod.atkFlat, 7), Modifier(StatMod.chargeRateFlat, 3)],
    description: 'Runs hot, burns hotter.',
  ),
  GameItem(
    id: 'core_acid_charged', 
    name: 'Corrosive Core', 
    kind: ItemKind.module, 
    rarity: Rarity.rare, 
    slot: ModuleSlot.core, 
    element: DamageType.acid, 
    modifiers: [Modifier(StatMod.atkFlat, 7), Modifier(StatMod.chargeRateFlat, 3)],
    description: 'Spits highly corrosive acid.',
  ),
  GameItem(
    id: 'core_kinetic_prime', 
    name: 'Prime Kinetic Core', 
    kind: ItemKind.module, 
    rarity: Rarity.epic, 
    slot: ModuleSlot.core, 
    element: DamageType.kinetic, 
    modifiers: [Modifier(StatMod.atkFlat, 10), Modifier(StatMod.atkPct, 8), Modifier(StatMod.chargeRateFlat, 5)],
    description: 'Advanced kinetic driver.',
  ),
  GameItem(
    id: 'core_inferno_legend', 
    name: 'Inferno Core', 
    kind: ItemKind.module, 
    rarity: Rarity.legendary, 
    slot: ModuleSlot.core, 
    element: DamageType.fire, 
    modifiers: [Modifier(StatMod.atkFlat, 14), Modifier(StatMod.atkPct, 12), Modifier(StatMod.chargeRateFlat, 8)],
    description: 'Unleashes devastating thermal energy.',
  ),

  // Armor (defense + HP)
  GameItem(
    id: 'armor_plate_basic', 
    name: 'Plate Armor', 
    kind: ItemKind.module, 
    rarity: Rarity.common, 
    slot: ModuleSlot.armor, 
    modifiers: [Modifier(StatMod.defFlat, 4)],
    description: 'Basic protective plating.',
  ),
  GameItem(
    id: 'armor_alloy', 
    name: 'Alloy Armor', 
    kind: ItemKind.module, 
    rarity: Rarity.rare, 
    slot: ModuleSlot.armor, 
    modifiers: [Modifier(StatMod.defPct, 8), Modifier(StatMod.maxHpFlat, 25)],
    description: 'Reinforced alloy for superior protection.',
  ),
  GameItem(
    id: 'armor_reactive', 
    name: 'Reactive Armor', 
    kind: ItemKind.module, 
    rarity: Rarity.epic, 
    slot: ModuleSlot.armor, 
    modifiers: [Modifier(StatMod.defPct, 15), Modifier(StatMod.maxHpFlat, 60)],
    description: 'Explodes outward to deflect heavy impacts.',
  ),

  // Wheels (speed + a little crit)
  GameItem(
    id: 'wheels_tread_basic', 
    name: 'Tread Wheels', 
    kind: ItemKind.module, 
    rarity: Rarity.common, 
    slot: ModuleSlot.wheels, 
    modifiers: [Modifier(StatMod.spdFlat, 4)],
    description: 'Reliable rubber treads.',
  ),
  GameItem(
    id: 'wheels_hover', 
    name: 'Hover Wheels', 
    kind: ItemKind.module, 
    rarity: Rarity.rare, 
    slot: ModuleSlot.wheels, 
    modifiers: [Modifier(StatMod.spdFlat, 7), Modifier(StatMod.critPct, 4)],
    description: 'Anti-gravity propulsion.',
  ),
  GameItem(
    id: 'wheels_warp', 
    name: 'Warp Treads', 
    kind: ItemKind.module, 
    rarity: Rarity.epic, 
    slot: ModuleSlot.wheels, 
    modifiers: [Modifier(StatMod.spdFlat, 12), Modifier(StatMod.critPct, 8)],
    description: 'Bends space to move instantly.',
  ),

  // Sensor (crit, plus attack at epic)
  GameItem(
    id: 'sensor_eye_basic', 
    name: 'Optic Sensor', 
    kind: ItemKind.module, 
    rarity: Rarity.common, 
    slot: ModuleSlot.sensor, 
    modifiers: [Modifier(StatMod.critPct, 4)],
    description: 'Standard optical camera.',
  ),
  GameItem(
    id: 'sensor_radar', 
    name: 'Radar Sensor', 
    kind: ItemKind.module, 
    rarity: Rarity.rare, 
    slot: ModuleSlot.sensor, 
    modifiers: [Modifier(StatMod.critPct, 9)],
    description: 'Advanced radar detection.',
  ),
  GameItem(
    id: 'sensor_oracle', 
    name: 'Oracle Sensor', 
    kind: ItemKind.module, 
    rarity: Rarity.epic, 
    slot: ModuleSlot.sensor, 
    modifiers: [Modifier(StatMod.critPct, 12), Modifier(StatMod.atkPct, 5)],
    description: 'Predicts enemy movements before they happen.',
  ),

  // Utility (faster cooldowns; negative cooldownPct means faster)
  GameItem(
    id: 'utility_coolant_basic', 
    name: 'Coolant Unit', 
    kind: ItemKind.module, 
    rarity: Rarity.common, 
    slot: ModuleSlot.utility, 
    modifiers: [Modifier(StatMod.cooldownPct, -8)],
    description: 'Prevents overheating during intense battles.',
  ),
  GameItem(
    id: 'utility_capacitor', 
    name: 'Capacitor', 
    kind: ItemKind.module, 
    rarity: Rarity.rare, 
    slot: ModuleSlot.utility, 
    modifiers: [Modifier(StatMod.cooldownPct, -15), Modifier(StatMod.chargeRateFlat, 4)],
    description: 'Stores and releases energy rapidly.',
  ),
  GameItem(
    id: 'utility_overclock', 
    name: 'Overclock Chip', 
    kind: ItemKind.module, 
    rarity: Rarity.epic, 
    slot: ModuleSlot.utility, 
    modifiers: [Modifier(StatMod.cooldownPct, -20), Modifier(StatMod.atkPct, 6)],
    description: 'Pushes all systems beyond safe limits.',
  ),

  // Consumables (one-shot effects, not equipped)
  GameItem(
    id: 'use_repair_kit', 
    name: 'Repair Kit', 
    kind: ItemKind.consumable, 
    rarity: Rarity.common, 
    consumable: ConsumableSpec(ConsumableEffect.healHp, 30),
    description: 'Restores 30 Health instantly.',
  ),
  GameItem(
    id: 'use_energy_cell', 
    name: 'Energy Cell', 
    kind: ItemKind.consumable, 
    rarity: Rarity.common, 
    consumable: ConsumableSpec(ConsumableEffect.restoreEnergy, 40),
    description: 'Restores 40 Energy for abilities.',
  ),
  GameItem(
    id: 'use_scrap_cache', 
    name: 'Scrap Cache', 
    kind: ItemKind.consumable, 
    rarity: Rarity.rare, 
    consumable: ConsumableSpec(ConsumableEffect.grantScrap, 100),
    description: 'Grants 100 Scrap.',
  ),
  GameItem(
    id: 'use_overcharge_chip', 
    name: 'Overcharge Chip', 
    kind: ItemKind.consumable, 
    rarity: Rarity.rare, 
    consumable: ConsumableSpec(ConsumableEffect.fillCharge, 100),
    description: 'Instantly fills the combat charge meter.',
  ),

  // Cosmetics (dog skins, no stats)
  GameItem(
    id: 'skin_chrome', 
    name: 'Chrome Coat', 
    kind: ItemKind.cosmetic, 
    rarity: Rarity.rare,
    description: 'A shiny chrome finish.',
  ),
  GameItem(
    id: 'skin_neon', 
    name: 'Neon Coat', 
    kind: ItemKind.cosmetic, 
    rarity: Rarity.epic,
    description: 'Glowing neon highlights.',
  ),
  GameItem(
    id: 'skin_gold', 
    name: 'Gold Coat', 
    kind: ItemKind.cosmetic, 
    rarity: Rarity.legendary,
    description: 'Pure 24k gold plating.',
  ),
];

GameItem catalogById(String id) => kCatalog.firstWhere((it) => it.id == id);
