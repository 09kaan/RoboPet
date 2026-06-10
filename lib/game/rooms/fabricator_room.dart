import 'dart:math';
import 'package:flame/components.dart';
import 'package:flame/particles.dart';
import 'package:flutter/material.dart' show Color, Paint, Colors;
import '../components/robot_dog.dart';
 
class FabricatorRoomWorld extends World {
  late final GachaCrateComponent gachaCrate;
 
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    add(SpriteComponent(
      sprite: await Sprite.load('rooms/fabricator.png'),
      size: Vector2(400, 700),
      position: Vector2(-200, -350),
      priority: -10,
    ));
    gachaCrate = GachaCrateComponent(position: Vector2(0, 180));
    add(gachaCrate);
    
    // Add the wandering dog
    add(RobotDog(position: Vector2(0, 190), wanderRange: 110));
  }
 
  void triggerReveal(String rarity) => gachaCrate.reveal(rarity);
}
 
class GachaCrateComponent extends RectangleComponent with HasGameRef {
  GachaCrateComponent({required super.position})
      : super(size: Vector2(56, 56), anchor: Anchor.center);
 
  static const _idleAmpY = 8.0;
  static const _idleFreq = 1.4;
  static const _spinDuration = 0.9;
 
  double _t = 0; double _spinTimer = 0; bool _spinning = false;
  final Vector2 _origin = Vector2.zero();
  static const _colors = {
    'common': Color(0xFFAAAAAA), 'rare': Color(0xFF4488FF), 'epic': Color(0xFFCC44FF) };
 
  @override
  void onMount() { super.onMount(); _origin.setFrom(position);
    paint.color = Colors.transparent; }
 
  @override
  void update(double dt) {
    super.update(dt);
    if (_spinning) {
      _spinTimer -= dt; angle += dt * 8.0;
      if (_spinTimer <= 0) { _spinning = false; angle = 0; }
      return;
    }
    _t += dt;
    position.y = _origin.y + _idleAmpY * sin(_t * _idleFreq * 2 * pi);
  }
 
  void reveal(String rarity) {
    if (_spinning) return;
    _spinning = true; _spinTimer = _spinDuration;
    paint.color = _colors[rarity] ?? _colors['common']!;
    _emitBurst(rarity);
  }
 
  void _emitBurst(String rarity) {
    final c = _colors[rarity] ?? _colors['common']!;
    parent?.add(ParticleSystemComponent(
      position: position.clone(),
      particle: Particle.generate(
        count: 28, lifespan: 0.9,
        generator: (i) => AcceleratedParticle(
          acceleration: Vector2(
            (Random().nextDouble()*2-1)*60, -120-Random().nextDouble()*80),
          speed: Vector2(
            (Random().nextDouble()*2-1)*90, -60-Random().nextDouble()*60),
          child: CircleParticle(
            radius: 3+Random().nextDouble()*3,
            paint: Paint()..color = c)))));
  }
}
