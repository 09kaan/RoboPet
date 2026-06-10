import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart' show Paint, Color, TextStyle;
import '../../domain/decor/decor_def.dart';
import '../../data/models/placed_decor.dart';
import '../robot_game.dart';
 
class DecorComponent extends SpriteComponent
    with DragCallbacks, HasGameReference<RoboPetGame> {
  DecorComponent({required this.def, required this.placed})
      : super(anchor: Anchor.bottomCenter, priority: def.layer);
      
  final DecorDef def;
  final PlacedDecor placed;
  bool editable = false;
  
  @override
  Future<void> onLoad() async {
    size = def.defaultSize * placed.scale;
    position = Vector2(placed.x, placed.y);
    if (placed.flipped) flipHorizontally();
    
    try {
      sprite = await Sprite.load(def.asset);   // gercek PNG varsa kullan
    } catch (_) {
      // PLACEHOLDER: renkli kutu + isim
      add(RectangleComponent(
        size: size,
        paint: Paint()..color = const Color(0xFF394067),
      ));
      add(TextComponent(
        text: def.name,
        anchor: Anchor.center,
        position: size / 2,
        textRenderer: TextPaint(
          style: const TextStyle(color: Color(0xFF9FB4FF), fontSize: 11),
        ),
      ));
    }
  }
  
  @override
  bool containsLocalPoint(Vector2 p) => editable && super.containsLocalPoint(p);
  
  @override
  void onDragUpdate(DragUpdateEvent event) {
    if (!editable) return;
    position += event.localDelta;
    position.x = position.x.clamp(-180, 180);
    position.y = position.y.clamp(-300, 345);
  }
  
  @override
  void onDragEnd(DragEndEvent event) {
    if (!editable) return;
    placed
      ..x = position.x
      ..y = position.y;
    game.onDecorMoved(placed);   // kalici yap
  }
}
