import 'dart:math';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart' show Colors;
import '../robot_game.dart';
 
/// Animation states for the robot dog.
enum DogAnim { idle, walk, happy, eat, sleep, lowPower, attack }
 
/// One animation: folder name + frame count + seconds per frame + loop.
class _AnimSpec {
  final String folder;
  final int frames;
  final double step;
  final bool loop;
  const _AnimSpec(this.folder, this.frames, this.step, {this.loop = true});
}
 
class RobotDog extends SpriteAnimationGroupComponent<DogAnim> 
    with HasGameReference<RoboPetGame>, TapCallbacks {
  final bool autoWander;
  RobotDog({required Vector2 position, double wanderRange = 130, this.autoWander = true})
      : _wanderRange = wanderRange,
        super(
          position: position,
          size: Vector2.all(160),
          anchor: Anchor.bottomCenter,
          priority: 10,
        );
 
  // ---- Set frame counts to match YOUR exported PNGs (default 8). ----
  static const Map<DogAnim, _AnimSpec> _config = {
    DogAnim.idle:     _AnimSpec('idle', 8, 0.12),
    DogAnim.walk:     _AnimSpec('walk', 8, 0.08),
    DogAnim.happy:    _AnimSpec('happy', 8, 0.09),
    DogAnim.eat:      _AnimSpec('eat', 8, 0.10),
    DogAnim.sleep:    _AnimSpec('sleep', 8, 0.22),
    DogAnim.lowPower: _AnimSpec('low_power', 8, 0.14),
    DogAnim.attack:   _AnimSpec('attack', 8, 0.07, loop: false),
  };
 
  // Wander tuning (matches the old placeholder cube).
  static const double _speed = 55.0;
  static const double _pauseMin = 1.2;
  static const double _pauseMax = 3.0;
  final double _wanderRange;
  
  static const double kFloorMinY = 180;
  static const double kFloorMaxY = 320;
 
  final _rng = Random();
  Vector2 _target = Vector2.zero();
  double _pauseTimer = 0;
  bool _pausing = true;
  bool _wandering = true;
  bool _facingRight = true;
  bool _asleep = false;
 
  // Hover effect properties
  double _hoverT = 0;
  double? _hoverOriginY;
 
  Future<void> reactFor(DogAnim anim, double seconds) async {
    if (_asleep) return;
    stopWander();
    _setAnim(anim);
    await Future<void>.delayed(
        Duration(milliseconds: (seconds * 1000).round()));
    _setAnim(DogAnim.idle);
    startWander();
  }
 
  Future<void> reactEat()   => reactFor(DogAnim.eat, 2.5);
  Future<void> reactHappy() => reactFor(DogAnim.happy, 2.0);
 
  @override
  void onTapUp(TapUpEvent event) {
    if (game.decorateMode) return;   // ignore taps while decorating
    game.openDogActions();
  }
 
  @override
  Future<void> onLoad() async {
    final Map<DogAnim, SpriteAnimation> loaded = {};
    for (final entry in _config.entries) {
      try {
        final frames = <Sprite>[];
        for (var i = 0; i < entry.value.frames; i++) {
          frames.add(await Sprite.load('dog/${entry.value.folder}/$i.png'));
        }
        loaded[entry.key] = SpriteAnimation.spriteList(
          frames,
          stepTime: entry.value.step,
          loop: entry.value.loop,
        );
      } catch (_) {
        // This animation has no PNGs yet -> skip it gracefully.
      }
    }
    animations = loaded;
    current = loaded.containsKey(DogAnim.idle)
        ? DogAnim.idle
        : (loaded.isNotEmpty ? loaded.keys.first : null);
 
    _target = position.clone();
    _hoverOriginY = position.y;
    startWander();
  }
 
  @override
  void update(double dt) {
    super.update(dt);
    if (!autoWander) {
      _hoverT += dt;
      if (_hoverOriginY != null) {
        position.y = _hoverOriginY! + 6 * sin(_hoverT * 2.5);
      }
      return;
    }
    if (!_wandering) return;
 
    if (_pausing) {
      _pauseTimer -= dt;
      if (_pauseTimer <= 0) {
        _pausing = false;
        _target = Vector2(
          (_rng.nextDouble() * 2 - 1) * _wanderRange,
          kFloorMinY + _rng.nextDouble() * (kFloorMaxY - kFloorMinY),
        );
        _faceTowards(_target.x);
        _setAnim(DogAnim.walk);
      }
    } else {
      final dir = _target - position;
      if (dir.length < 2) {
        position.setFrom(_target);
        _pausing = true;
        _schedulePause();
        _setAnim(DogAnim.idle);
      } else {
        position += dir.normalized() * _speed * dt;
      }
    }
  }
 
  void _schedulePause() =>
      _pauseTimer = _pauseMin + _rng.nextDouble() * (_pauseMax - _pauseMin);
 
  void _faceTowards(double targetX) {
    final goRight = targetX >= position.x;
    if (goRight != _facingRight) {
      _facingRight = goRight;
      flipHorizontallyAroundCenter();
    }
  }
 
  void _setAnim(DogAnim a) {
    final map = animations;
    if (map != null && map.containsKey(a) && current != a) {
      current = a;
    }
  }
 
  // ---- Optional hooks for later care logic ----
 
  void startWander() {
    if (!autoWander) return;
    _wandering = true;
    _pausing = true;
    _schedulePause();
  }
 
  void stopWander() => _wandering = false;
 
  void applyCareState({required int energy, required bool asleep}) {
    _asleep = asleep;
    if (asleep) {
      stopWander();
      _setAnim(DogAnim.sleep);
    } else if (energy < 20) {
      stopWander();
      _setAnim(DogAnim.lowPower);
    } else if (current == DogAnim.sleep || current == DogAnim.lowPower) {
      _setAnim(DogAnim.idle);
      startWander();
    }
  }
 
  // Code-based hurt: white flash + shake (no hurt sprite needed).
  void hit() {
    add(ColorEffect(
      Colors.white,
      EffectController(duration: 0.08, alternate: true),
      opacityTo: 0.85,
    ));
    add(MoveEffect.by(
      Vector2(_facingRight ? -8 : 8, 0),
      EffectController(duration: 0.05, alternate: true, repeatCount: 3),
    ));
  }
}
