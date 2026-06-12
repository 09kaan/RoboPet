/// Final combat stats after module modifiers are applied.
import '../../data/models/game_item.dart';
 
class ResolvedCombatStats {
  const ResolvedCombatStats({
    required this.hp,
    required this.attack,
    required this.defense,
    required this.speed,
    required this.energyRegen,
    this.element = DamageType.kinetic,
  });
 
  final int hp;
  final int attack;
  final int defense;
  final int speed;
  final int energyRegen;
  final DamageType element;
 
  ResolvedCombatStats copyWith({
    int? hp,
    int? attack,
    int? defense,
    int? speed,
    int? energyRegen,
    DamageType? element,
  }) => ResolvedCombatStats(
    hp: hp ?? this.hp,
    attack: attack ?? this.attack,
    defense: defense ?? this.defense,
    speed: speed ?? this.speed,
    energyRegen: energyRegen ?? this.energyRegen,
    element: element ?? this.element,
  );
 
  /// Dummy ghost opponent with slightly boosted base stats.
  static const ghost = ResolvedCombatStats(
    hp: 120, attack: 18, defense: 12, speed: 10, energyRegen: 2, element: DamageType.kinetic);
 
  @override
  String toString() => 'HP:$hp ATK:$attack DEF:$defense SPD:$speed';
}
