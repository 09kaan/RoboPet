import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
 
import '../../game/robot_game.dart';
import 'overlays/nav_bar_overlay.dart';
import 'overlays/fabricator_overlay.dart';
import 'overlays/loadout_overlay.dart';
import 'overlays/combat_overlay.dart';
import 'overlays/decor_shop_overlay.dart';
import 'overlays/dog_action_bar.dart';
import 'overlays/care_hud.dart';
import 'shop_overlay.dart' as eco_shop;
import '../../app/providers.dart';
import '../../game/rooms/living_room.dart';
 
class GameScreen extends ConsumerStatefulWidget {
  const GameScreen({super.key});
  @override
  ConsumerState<GameScreen> createState() => _GameScreenState();
}
 
class _GameScreenState extends ConsumerState<GameScreen> {
  late final RoboPetGame _game;
 
  late final AppLifecycleListener _lifecycle;
 
  @override
  void initState() {
    super.initState();
    _game = RoboPetGame()..ref = ref;
    
    _lifecycle = AppLifecycleListener(
      onResume: () => ref.read(robotRepositoryProvider).loadActiveAndReconcile(),
    );
  }
 
  @override
  void dispose() {
    _lifecycle.dispose();
    super.dispose();
  }
 
  @override
  Widget build(BuildContext context) {
    ref.watch(economyBootstrapProvider);
    ref.watch(careTickerProvider);
    
    // Sync animation with database state
    ref.listen(activeRobotStreamProvider, (_, asyncValue) {
      final s = asyncValue.value;
      if (s == null) return;
      final world = _game.world;
      if (world is LivingRoomWorld) {
        world.dog?.applyCareState(
          energy: s.battery.value.toInt(),
          asleep: false, // Phase 1 doesn't track asleep bool yet
        );
      }
    });
 
    return Scaffold(
      backgroundColor: Colors.black,
      body: GameWidget<RoboPetGame>(
        game: _game,
        overlayBuilderMap: {
          kOverlayNav: (ctx, game) => NavBarOverlay(game: game as RoboPetGame),
          kOverlayFabricator: (ctx, game) =>
              FabricatorOverlay(game: game as RoboPetGame),
          kOverlayLoadout: (ctx, game) =>
              LoadoutOverlay(game: game as RoboPetGame),
          kOverlayCombat: (ctx, game) =>
              CombatOverlay(game: game as RoboPetGame),
          'shop': (ctx, game) =>
              ShopOverlay(game: game as RoboPetGame),
          'ecoShop': (ctx, game) => eco_shop.ShopOverlay(game: game as RoboPetGame),
          'dogActions': (ctx, game) =>
              DogActionBar(game: game as RoboPetGame),
          'careHud': (ctx, game) => const CareHud(),
        },
      ),
    );
  }
}
