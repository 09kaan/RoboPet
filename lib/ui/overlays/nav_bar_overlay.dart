import 'package:flutter/material.dart';
import '../../../game/robot_game.dart';
import '../../../game/rooms/living_room.dart';
import '../theme.dart';
 
const bool kDecorEnabled = false; // set true to bring Decorate back
 
class NavBarOverlay extends StatefulWidget {
  const NavBarOverlay({super.key, required this.game});
  final RoboPetGame game;
 
  @override
  State<NavBarOverlay> createState() => _NavBarOverlayState();
}
 
class _NavBarOverlayState extends State<NavBarOverlay> {
  @override
  Widget build(BuildContext context) {
    final game = widget.game;
    final isLivingRoom = game.activeRoom == Room.living;
 
    return Stack(
      children: [
        if (isLivingRoom)
          Positioned(
            right: 16,
            bottom: 90 + MediaQuery.of(context).padding.bottom,
            child: Row(
              children: [
                if (kDecorEnabled)
                  FloatingActionButton.extended(
                    heroTag: 'decor_btn',
                    backgroundColor: game.decorateMode ? AppColors.cyan : Colors.white24,
                    onPressed: () {
                      setState(() {
                        game.toggleDecorate();
                      });
                    },
                    icon: Icon(game.decorateMode ? Icons.check : Icons.format_paint, color: game.decorateMode ? Colors.black : Colors.white),
                    label: Text(game.decorateMode ? 'Done' : 'Decorate', style: TextStyle(color: game.decorateMode ? Colors.black : Colors.white)),
                  ),
              ],
            ),
          ),
        Positioned(
          bottom: 0, left: 0, right: 0,
          child: Container(
            height: 72 + MediaQuery.of(context).padding.bottom,
            decoration: BoxDecoration(
              color: Colors.black87,
              border: Border(top: BorderSide(color: AppColors.cyan.withOpacity(0.3)))),
            child: SafeArea(
              top: false,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _NavTab(icon: Icons.home_filled,
                      label: 'Living Room', room: Room.living, game: game),
                  _NavTab(icon: Icons.precision_manufacturing,
                      label: 'Fabricator', room: Room.fabricator, game: game),
                  _NavTab(icon: Icons.science,
                      label: 'Laboratory', room: Room.laboratory, game: game),
                ])))),
      ],
    );
  }
}
 
class _NavTab extends StatelessWidget {
  const _NavTab({required this.icon, required this.label,
      required this.room, required this.game});
  final IconData icon; final String label;
  final Room room; final RoboPetGame game;
 
  @override
  Widget build(BuildContext context) {
    final active = game.activeRoom == room;
    final color = active ? AppColors.cyan : Colors.white38;
    return GestureDetector(
      onTap: () {
        game.overlays.remove('shop'); // clean up shop overlay if open
        game.navigateTo(room);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 26),
          const SizedBox(height: 3),
          Text(label, style: TextStyle(
              color: color, fontSize: 10, fontWeight: FontWeight.w600)),
        ]));
  }
}
