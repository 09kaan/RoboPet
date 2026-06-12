import 'package:isar/isar.dart';
import 'game_item.dart';
import 'robot_instance.dart';
 
part 'module_instance.g.dart';
 
/// A single OWNED module (a roll result). Cloud-authoritative: written by the
/// rollGacha Cloud Function and streamed into Isar by EconomySyncService.
@collection
class ModuleInstance {
  Id id = Isar.autoIncrement;
 
  /// Firestore document id (users/{uid}/modules/{instanceId}).
  @Index(unique: true, replace: true)
  late String instanceId;
 
  /// Points at a kModuleCatalog entry / Remote Config def.
  late String defId;
 
  @Enumerated(EnumType.name)
  Rarity rarity = Rarity.common;
 
  int level = 1;
 
  /// Robot instanceId this module is equipped on, or null if in storage.
  @Index()
  String? equippedRobotId;
 
  late DateTime acquiredAt;
 
  int schemaVersion = 2;
 
  /// Convenience: resolve the static def. Returns null if defId is unknown
  /// (e.g. a newer server def the client hasn't shipped yet).
  @ignore
  GameItem? get def {
    try {
      return catalogById(defId);
    } catch (e) {
      return null;
    }
  }
}
