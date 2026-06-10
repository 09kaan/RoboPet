import 'dart:math';
import 'package:flame/components.dart';
import 'package:flame/particles.dart';
import 'package:flutter/material.dart' show Color, Paint;
import '../components/robot_dog.dart';
 
class CombatRoomWorld extends World {
  late final RobotDog playerDog;
  late final FighterComponent enemyFighter;
 
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    add(RectangleComponent(
      size: Vector2(400, 700), position: Vector2(-200, -350),
      paint: Paint()..color = const Color(0xFF04050A)));
    add(RectangleComponent(
      size: Vector2(360, 3), position: Vector2(-180, 80),
      paint: Paint()..color = const Color(0xFF1A2040)));
    add(RectangleComponent(
      size: Vector2(360, 1), position: Vector2(-180, 82),
      paint: Paint()..color = const Color(0xFF22E1FF)));
 
    playerDog = RobotDog(position: Vector2(-120, 250), autoWander: false);
    enemyFighter = FighterComponent(isPlayer: false, position: Vector2(90, 60));
    add(playerDog);
    add(enemyFighter);
  }
 
  void showHit({required bool attackerIsPlayer}) {
    if (attackerIsPlayer) {
      enemyFighter.flashHit();
      // dog doesn't lunge forward natively, we just let it hover
    } else {
      playerDog.hit(); // We added hit() method earlier to RobotDog
      enemyFighter.lungeForward();
    }
  }
 
  void showOutcome({required bool playerWon}) {
    if (playerWon) { playerDog.reactHappy(); enemyFighter.collapse(); }
    else           { enemyFighter.celebrate(); playerDog.applyCareState(energy: 0, asleep: false); }
  }
 
  void reset() { enemyFighter.reset(); playerDog.applyCareState(energy: 100, asleep: false); }
}
 
class FighterComponent extends RectangleComponent {
  final bool isPlayer;
  FighterComponent({required this.isPlayer, required super.position})
      : super(size: Vector2(44, 60), anchor: Anchor.bottomCenter);
 
  final _rng = Random();
  Vector2? _originPos;
  double _lunge = 0, _hitFlash = 0, _celebrateT = 0;
  bool _collapsed = false;
 
  static const _lungeDir = 30.0;
  static const _flashDur = 0.18;
  static const _lungeDur = 0.15;
 
  Color get _baseColor =>
      isPlayer ? const Color(0xFF22E1FF) : const Color(0xFFFF3CAC);
 
  @override
  void onMount() {
    super.onMount();
    _originPos = position.clone();
    paint.color = _baseColor;
  }
 
  @override
  void update(double dt) {
    super.update(dt);
    if (_lunge > 0) {
      _lunge = (_lunge - dt / _lungeDur).clamp(0, 1);
      final dir = isPlayer ? 1.0 : -1.0;
      position.x = (_originPos?.x ?? 0) + dir * _lungeDir * _lunge;
    }
    if (_hitFlash > 0) {
      _hitFlash = (_hitFlash - dt / _flashDur).clamp(0, 1);
      paint.color = Color.lerp(_baseColor, const Color(0xFFFFFFFF), _hitFlash)!;
    }
    if (_celebrateT > 0) {
      _celebrateT -= dt;
      position.y = (_originPos?.y ?? 0) + 4 * sin(_celebrateT * 8);
    }
    if (_collapsed && opacity > 0.05)
      opacity = (opacity - dt * 0.6).clamp(0.05, 1.0);
  }
 
  void lungeForward() => _lunge = 1.0;
  void flashHit() { _hitFlash = 1.0; _emitHitParticles(); }
  void celebrate() => _celebrateT = 2.5;
  void collapse() => _collapsed = true;
  void reset() {
    _collapsed = false; _lunge = 0; _hitFlash = 0; _celebrateT = 0;
    opacity = 1.0; paint.color = _baseColor;
    if (_originPos != null) position.setFrom(_originPos!);
  }
 
  void _emitHitParticles() {
    final c = _baseColor;
    parent?.add(ParticleSystemComponent(
      position: position - Vector2(0, 20),
      particle: Particle.generate(
        count: 12, lifespan: 0.45,
        generator: (i) => AcceleratedParticle(
          acceleration: Vector2((_rng.nextDouble()*2-1)*40, -30),
          speed: Vector2((_rng.nextDouble()*2-1)*70, -40-_rng.nextDouble()*40),
          child: CircleParticle(
            radius: 2+_rng.nextDouble()*2.5,
            paint: Paint()..color = c)))));
  }
}
