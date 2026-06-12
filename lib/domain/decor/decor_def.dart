import 'package:flame/components.dart';
 
enum CurrencyType { scrap, premiumGems, basicKeys, rareKeys, epicKeys }
enum DecorCategory { seating, screen, plant, lighting, storage, rug, wallArt }
 
class DecorDef {
  final String id;
  final String name;
  final String asset;            // example: decor/couch.png
  final DecorCategory category;
  final CurrencyType currency;   // scrap or premiumGems
  final int price;
  final Vector2 defaultSize;
  final Vector2 defaultPos;
  final int layer;               // render priority inside the room
  const DecorDef({
    required this.id,
    required this.name,
    required this.asset,
    required this.category,
    required this.currency,
    required this.price,
    required this.defaultSize,
    required this.defaultPos,
    this.layer = 0,
  });
}
 
final kLivingRoomDecor = <DecorDef>[
  DecorDef(id: 'couch', name: 'Neon Couch', asset: 'decor/couch.png',
    category: DecorCategory.seating, currency: CurrencyType.scrap, price: 120,
    defaultSize: Vector2(150, 70), defaultPos: Vector2(0, 300), layer: 0),
  DecorDef(id: 'holo_tv', name: 'Holo TV', asset: 'decor/holo_tv.png',
    category: DecorCategory.screen, currency: CurrencyType.premiumGems, price: 15,
    defaultSize: Vector2(140, 90), defaultPos: Vector2(0, -120), layer: -2),
  DecorDef(id: 'plant', name: 'Potted Plant', asset: 'decor/plant.png',
    category: DecorCategory.plant, currency: CurrencyType.scrap, price: 60,
    defaultSize: Vector2(50, 80), defaultPos: Vector2(140, 320), layer: 1),
  DecorDef(id: 'lamp', name: 'Floor Lamp', asset: 'decor/lamp.png',
    category: DecorCategory.lighting, currency: CurrencyType.scrap, price: 80,
    defaultSize: Vector2(40, 110), defaultPos: Vector2(-150, 320), layer: 1),
  DecorDef(id: 'rug', name: 'Round Rug', asset: 'decor/rug.png',
    category: DecorCategory.rug, currency: CurrencyType.scrap, price: 40,
    defaultSize: Vector2(220, 70), defaultPos: Vector2(0, 340), layer: -5),
  DecorDef(id: 'neon_sign', name: 'Neon Sign', asset: 'decor/neon_sign.png',
    category: DecorCategory.wallArt, currency: CurrencyType.premiumGems, price: 10,
    defaultSize: Vector2(90, 40), defaultPos: Vector2(120, -180), layer: -3),
];
 
DecorDef decorById(String id) => kLivingRoomDecor.firstWhere((d) => d.id == id);
