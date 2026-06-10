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
          btn('🍔', 'Feed',   () { 
            if (robotId != null) repo.clean(robotId); // Maps to Oil (Feed)
            game.combatWorld; // access getter just in case
            // The dog is in the LivingRoomWorld, we can just use the active world
            final world = game.world;
            if (world is LivingRoomWorld) world.dog?.reactEat();
          }),
          const SizedBox(width: 28),
          btn('🖐️',  'Pet',    () { 
            if (robotId != null) repo.play(robotId);  // Maps to Entertainment (Pet)
            final world = game.world;
            if (world is LivingRoomWorld) world.dog?.reactHappy(); 
          }),
          const SizedBox(width: 28),
          btn('🔋', 'Charge', () { 
            if (robotId != null) repo.feed(robotId);  // Maps to Battery (Charge)
            final world = game.world;
            if (world is LivingRoomWorld) world.dog?.reactHappy(); 
          }),
        ]),
      ),
    );
  }
}
