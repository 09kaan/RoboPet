import 'package:isar/isar.dart';
 
part 'robot_instance.g.dart';
 
@collection
class RobotInstance {
  Id id = Isar.autoIncrement; // Isar's internal PK (int)
 
  /// Stable, game-level identity. Distinct from Isar's [id].
  @Index(unique: true, replace: true)
  late String instanceId;
 
  late String speciesId; // FK -> RobotSpecies definition (static content)
  String nickname = '';
 
  @Enumerated(EnumType.name) // store as string -> safe to reorder enum
  late Rarity rarity;
 
  @Enumerated(EnumType.name)
  late RobotClass robotClass; // 'class' is a reserved word in Dart
 
  int level = 1;
  int xp = 0;
  int xpToNext = 100;
 
  // --- Care stats (these decay over time) ---
  CareStatData battery = CareStatData();
  CareStatData oil = CareStatData();
  CareStatData entertainment = CareStatData();
 
  // --- Base combat stats (pre-module). Used from Phase 3 onward. ---
  CombatStatsData combat = CombatStatsData();
 
  // --- Equipped modules (fixed slot set) ---
  Loadout loadout = Loadout();
 
  List<String> abilities = [];
 
  // --- Timestamps (ALWAYS stored/treated as UTC) ---
  late DateTime createdAt;
 
  /// Drives offline reconciliation. The single source of truth for "when did
  /// we last compute this robot's state".
  late DateTime lastTickAt;
 
  DateTime? lastFedAt;
 
  // --- Flags ---
  @Index()
  bool isActive = false; // the currently focused pet
  bool isFavorite = false;
  int neglectStrikes = 0;
 
  /// Idle currency generation rate (scrap/second). Later derived from
  /// level/modules; a stored field for Phase 1.
  double scrapPerSecond = 0.05;
 
  int schemaVersion = 1; // bump + migrate on schema changes
}
 
@embedded
class CareStatData {
  double value = 0;
  double max = 100;
  double drainPerSecond = 0;
}
 
@embedded
class CombatStatsData {
  int hp = 1;
  int attack = 0;
  int defense = 0;
  int speed = 0;
  double critChance = 0;
}
 
@embedded
class Loadout {
  String? wheels;
  String? armor;
  String? sensor;
  String? core;
  String? utility;
}
 
enum Rarity { common, rare, epic, legendary }
 
enum RobotClass { scout, tank, brawler, support }
