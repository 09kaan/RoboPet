import 'package:isar/isar.dart';
 
part 'combat_snapshot.g.dart';
 
@collection
class CombatSnapshot {
  Id id = Isar.autoIncrement;
 
  @Index(unique: true, replace: true)
  late String snapshotId;
 
  late String ownerUid;
  late String robotInstanceId;
 
  int resolvedHp = 100;
  int resolvedAttack = 15;
  int resolvedDefense = 10;
  int resolvedSpeed = 10;
 
  List<String> equippedDefIds = [];
 
  late DateTime createdAt;
  int schemaVersion = 3;
}
