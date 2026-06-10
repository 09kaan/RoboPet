import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'models/module_instance.dart';
import 'models/player_profile.dart';
import 'models/robot_instance.dart';
import 'models/combat_snapshot.dart';
import 'models/placed_decor.dart';
 
/// Opens (and caches) the single Isar instance for the app.
class IsarService {
  IsarService._();
 
  static Isar? _isar;
 
  static Future<Isar> instance() async {
    if (_isar != null && _isar!.isOpen) return _isar!;
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [RobotInstanceSchema, PlayerProfileSchema, ModuleInstanceSchema, CombatSnapshotSchema, PlacedDecorSchema],
      directory: dir.path,
      inspector: true, // enables the Isar Inspector in debug builds
    );
    return _isar!;
  }
}
