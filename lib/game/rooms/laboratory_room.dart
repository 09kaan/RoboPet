import 'package:flame/components.dart';
import 'package:flutter/material.dart' show Color, Paint;
import '../components/robot_dog.dart';
 
class LaboratoryRoomWorld extends World {
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    add(SpriteComponent(
      sprite: await Sprite.load('rooms/laboratory.png'),
      size: Vector2(400, 700),
      position: Vector2(-200, -350),
      priority: -10,
    ));
    // Add the wandering dog
    add(RobotDog(position: Vector2(0, 190), wanderRange: 110));
  }
}
