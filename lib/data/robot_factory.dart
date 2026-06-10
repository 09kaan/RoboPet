import 'models/robot_instance.dart';
 
class RobotFactory {
  /// A fresh, fully-charged starter rover. [now] should be UTC.
  static RobotInstance starter({
    required String instanceId,
    required DateTime now,
    String speciesId = 'rover_scout',
    String nickname = 'Sparky',
    bool isActive = true,
  }) {
    final utc = now.toUtc();
    return RobotInstance()
      ..instanceId = instanceId
      ..speciesId = speciesId
      ..nickname = nickname
      ..rarity = Rarity.common
      ..robotClass = RobotClass.scout
      ..battery = (CareStatData()
        ..value = 100
        ..max = 100
        ..drainPerSecond = 0.0008) // ~ -2.9/hour
      ..oil = (CareStatData()
        ..value = 100
        ..max = 100
        ..drainPerSecond = 0.0005)
      ..entertainment = (CareStatData()
        ..value = 100
        ..max = 100
        ..drainPerSecond = 0.0011)
      ..combat = (CombatStatsData()
        ..hp = 100
        ..attack = 20
        ..defense = 15
        ..speed = 18)
      ..createdAt = utc
      ..lastTickAt = utc
      ..isActive = isActive
      ..scrapPerSecond = 0.05
      ..schemaVersion = 1;
  }
}
