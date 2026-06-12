import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../game/robot_game.dart';
import '../../../game/rooms/living_room.dart';
import '../../../app/providers.dart';
 
class DogActionBar extends ConsumerWidget {
  const DogActionBar({super.key, required this.game});
  final RoboPetGame game;
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final robotId = ref.watch(activeRobotStreamProvider).value?.instanceId;
    final repo = ref.read(robotRepositoryProvider);
    final eco = ref.read(economySyncProvider);
    
    Widget btn(String icon, String label, VoidCallback onTap) =>
        GestureDetector(
          onTap: () { onTap(); game.closeDogActions(); },
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Text(icon, style: const TextStyle(fontSize: 28)),
            Text(label, style: const TextStyle(
                color: Colors.white, fontSize: 12)),
          ]),
        );
        
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.only(bottom: 90),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        decoration: BoxDecoration(
          color: const Color(0xEE0B0E1A),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFF22E1FF)),
        ),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          btn('🍔', 'Feed',   () async { 
            if (robotId != null) {
              final changed = await repo.clean(robotId); // Maps to Oil (Feed)
              if (changed) { eco.grantScrap(4); _showScrap(context, 4); }
            }
            game.combatWorld; // access getter just in case
            // The dog is in the LivingRoomWorld, we can just use the active world
            final world = game.world;
            if (world is LivingRoomWorld) world.dog?.reactEat();
          }),
          const SizedBox(width: 28),
          btn('🖐️',  'Pet',    () async { 
            if (robotId != null) {
              final changed = await repo.play(robotId);  // Maps to Entertainment (Pet)
              if (changed) { eco.grantScrap(8); _showScrap(context, 8); }
            }
            final world = game.world;
            if (world is LivingRoomWorld) world.dog?.reactHappy(); 
          }),
          const SizedBox(width: 28),
          btn('🔋', 'Charge', () async { 
            if (robotId != null) {
              final changed = await repo.feed(robotId);  // Maps to Battery (Charge)
              if (changed) { eco.grantScrap(6); _showScrap(context, 6); }
            }
            final world = game.world;
            if (world is LivingRoomWorld) world.dog?.reactHappy(); 
          }),
        ]),
      ),
    );
  }

  void _showScrap(BuildContext context, int amount) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('+$amount Scrap!'),
        duration: const Duration(seconds: 1),
        backgroundColor: const Color(0xFF22E1FF).withOpacity(0.8),
      ),
    );
  }
}
