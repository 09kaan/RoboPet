import 'package:flame/game.dart';
import 'package:flame/camera.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'rooms/living_room.dart';
import 'rooms/fabricator_room.dart';
import 'rooms/laboratory_room.dart';
import 'rooms/combat_room.dart'; // 👈 1) combat world import
import '../data/models/placed_decor.dart';
import '../app/providers.dart';

enum Room { living, fabricator, laboratory, combat } // 👈 2) combat eklendi

const kOverlayNav = 'nav';
const kOverlayFabricator = 'fabricator';
const kOverlayLoadout = 'loadout';
const kOverlayCombat = 'combat'; // 👈 3) combat overlay sabiti

class RoboPetGame extends FlameGame {
  RoboPetGame() : super(camera: CameraComponent());
  late final WidgetRef ref;

  late final LivingRoomWorld _living;
  late final FabricatorRoomWorld _fabricator;
  late final LaboratoryRoomWorld _laboratory;
  late final CombatRoomWorld _combat; // 👈 4) combat world alanı

  Room _activeRoom = Room.living;
  Room get activeRoom => _activeRoom;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    _living = LivingRoomWorld();
    _fabricator = FabricatorRoomWorld();
    _laboratory = LaboratoryRoomWorld();
    _combat = CombatRoomWorld(); // 👈 5) combat world oluştur
    world = _living;
    camera.world = _living;
    overlays.add(kOverlayNav);
    overlays.add('careHud');
  }

  void navigateTo(Room room) {
    if (room == _activeRoom) return;
    _toggleRoomOverlay(_activeRoom, false);
    final next = _worldFor(room);
    world = next;
    camera.world = next;
    _activeRoom = room;
    _toggleRoomOverlay(room, true);
  }

  void _toggleRoomOverlay(Room room, bool show) {
    final key = switch (room) {
      Room.fabricator => kOverlayFabricator,
      Room.laboratory => kOverlayLoadout,
      Room.combat => kOverlayCombat, // 👈 6a) combat overlay'i aç/kapat
      Room.living => null,
    };
    if (key == null) return;
    show ? overlays.add(key) : overlays.remove(key);
  }

  World _worldFor(Room room) => switch (room) {
    Room.living => _living,
    Room.fabricator => _fabricator,
    Room.laboratory => _laboratory,
    Room.combat => _combat, // 👈 6b) combat world seçimi
  };

  FabricatorRoomWorld get fabricatorWorld => _fabricator;
  CombatRoomWorld get combatWorld => _combat; // 👈 combatWorld getter
 
  bool decorateMode = false;
  void toggleDecorate() {
    decorateMode = !decorateMode;
    (world as LivingRoomWorld).setEditMode(decorateMode);
    if (decorateMode) { overlays.add('shop'); } else { overlays.remove('shop'); }
  }
 
  Future<void> onDecorMoved(PlacedDecor p) =>
      ref.read(decorRepositoryProvider).update(p);
 
  void openDogActions()  => overlays.add('dogActions');
  void closeDogActions() => overlays.remove('dogActions');
}