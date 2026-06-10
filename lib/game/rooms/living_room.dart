import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart' show Paint, FilterQuality, Color;
import '../components/robot_dog.dart';
import '../components/decor_component.dart';
import '../../domain/decor/decor_def.dart';
import '../../data/models/placed_decor.dart';
import '../../app/providers.dart';
import '../robot_game.dart';
class LivingRoomWorld extends World with HasGameReference<RoboPetGame> {
  RobotDog? dog;
  
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    final Vector2 kRoomTopLeft = Vector2(-200, -350);
    final Vector2 kRoomSize = Vector2(400, 710);
    
    try {
      final background = SpriteComponent(
        sprite: await Sprite.load('rooms/living_room_bg.png'),
        position: kRoomTopLeft,
        size: kRoomSize,
        anchor: Anchor.topLeft,
        priority: -10,
      );
      // Keep pixel art crisp when scaled up (nearest neighbor, no smoothing).
      background.paint = Paint()
        ..filterQuality = FilterQuality.none
        ..isAntiAlias = false;
      add(background);
    } catch (_) {
      // Fallback if the image is missing from assets/images/rooms/
      add(RectangleComponent(
        position: kRoomTopLeft,
        size: kRoomSize,
        paint: Paint()..color = const Color(0xFF161A2E), // dark blue placeholder
        priority: -10,
      ));
    }
    // kayitli dekorlar
    final repo = game.ref.read(decorRepositoryProvider);
    for (final p in await repo.forRoom('living')) {
      add(DecorComponent(def: decorById(p.itemId), placed: p));
    }
    
    // kopek (lower floor platform)
    dog = RobotDog(position: Vector2(0, 250));
    add(dog!);
  }
  
  Future<void> addDecor(DecorDef def) async {
    final repo = game.ref.read(decorRepositoryProvider);
    final placed = PlacedDecor()
      ..itemId = def.id
      ..room = 'living'
      ..x = def.defaultPos.x
      ..y = def.defaultPos.y
      ..layer = def.layer;
    placed.isarId = await repo.place(placed);
    add(DecorComponent(def: def, placed: placed));
  }
  
  void setEditMode(bool on) {
    children.whereType<DecorComponent>().forEach((d) => d.editable = on);
    if (on) { dog?.stopWander(); } else { dog?.startWander(); }
  }
}
