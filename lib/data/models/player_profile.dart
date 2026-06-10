import 'package:isar/isar.dart';
 
part 'player_profile.g.dart';
 
@collection
class PlayerProfile {
  Id id = Isar.autoIncrement;
 
  /// Firebase uid (replaces the Phase 1 'local-player' constant).
  @Index(unique: true, replace: true)
  late String playerId;
 
  String displayName = 'Operator';
 
  /// Monotonic counter mirrored from Firestore. The client NEVER increments
  /// this locally; it only adopts a value >= the one it already has.
  int economyVersion = 0;
 
  /// Embedded, server-authoritative balances.
  Currencies currencies = Currencies();
 
  /// Pity mirror (display only; server is authoritative).
  int epicPityCounter = 0;
 
  String? activeRobotId;
  
  int combatLevel = 1;
 
  List<String> ownedDecor = [];
 
  int schemaVersion = 2;
}
 
@embedded
class Currencies {
  int scrap = 0;        // soft currency (idle / care)
  int rareCogs = 0;     // earned premium (Sudoku) -> Epic pulls
  int premiumGems = 0;  // earned-only in v1 (no IAP)
}
