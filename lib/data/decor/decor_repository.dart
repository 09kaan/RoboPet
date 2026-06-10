import 'package:isar/isar.dart';
import '../models/placed_decor.dart';
 
class DecorRepository {
  DecorRepository(this._isar);
  final Isar _isar;
 
  Future<List<PlacedDecor>> forRoom(String room) =>
      _isar.placedDecors.filter().roomEqualTo(room).findAll();
 
  Future<int> place(PlacedDecor d) =>
      _isar.writeTxn(() => _isar.placedDecors.put(d));
 
  Future<void> update(PlacedDecor d) =>
      _isar.writeTxn(() => _isar.placedDecors.put(d));
 
  Future<void> remove(int isarId) =>
      _isar.writeTxn(() => _isar.placedDecors.delete(isarId));
}
