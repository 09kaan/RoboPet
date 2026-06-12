import '../models/player_profile.dart';
 
class CloudProfileMapper {
  /// Reads the Firestore `meta/profile` doc into a local PlayerProfile.
  /// Cloud is authoritative for economy, so we overwrite economy fields.
  static void applyEconomy(PlayerProfile target, Map<String, dynamic> data) {
    final c = (data['currencies'] as Map?) ?? const {};
    target.currencies
      ..scrap = _asInt(c['scrap'])
      ..rareCogs = _asInt(c['rareCogs'])
      ..premiumGems = _asInt(c['premiumGems'])
      ..basicKeys = _asInt(c['basicKeys'])
      ..rareKeys = _asInt(c['rareKeys'])
      ..epicKeys = _asInt(c['epicKeys']);
    target.epicPityCounter = _asInt((data['pity'] as Map?)?['epicCounter']);
    target.economyVersion = _asInt(data['economyVersion']);
    target.displayName = (data['displayName'] as String?) ?? target.displayName;
    target.activeRobotId = data['activeRobotId'] as String?;
    target.combatLevel = _asInt(data['combatLevel'] ?? 1);
    if (data['ownedDecor'] != null) {
      target.ownedDecor = List<String>.from(data['ownedDecor']);
    }
  }
 
  /// Seed payload for a brand-new player (client-written ONCE on first run;
  /// allowed because the doc does not yet exist and contains no economy gains).
  static Map<String, dynamic> seedPayload(String uid) => {
        'playerId': uid,
        'displayName': 'Operator',
        'schemaVersion': 2,
        'economyVersion': 1,
        'currencies': {'scrap': 0, 'rareCogs': 0, 'premiumGems': 0, 'basicKeys': 1, 'rareKeys': 1, 'epicKeys': 1},
        'pity': {'epicCounter': 0},
        'activeRobotId': null,
        'combatLevel': 1,
        'ownedDecor': [],
      };
 
  static int _asInt(Object? v) => (v as num?)?.toInt() ?? 0;
}
