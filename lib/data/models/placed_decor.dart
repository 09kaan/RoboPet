import 'package:isar/isar.dart';
 
part 'placed_decor.g.dart';
 
@collection
class PlacedDecor {
  Id isarId = Isar.autoIncrement;
  @Index() late String itemId;   // matches DecorDef.id
  late String room;              // for now: living
  late double x;
  late double y;
  double scale = 1.0;
  bool flipped = false;
  int layer = 0;
}
