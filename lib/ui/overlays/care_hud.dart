import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../app/providers.dart';
import '../../../data/models/robot_instance.dart';
 
class CareHud extends ConsumerWidget {
  const CareHud({super.key});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final robot = ref.watch(activeRobotStreamProvider).value;
    final eco = ref.watch(currenciesStreamProvider).valueOrNull; // adapt to your economy state
    
    if (robot == null) return const SizedBox.shrink();
    final warn = _firstCritical(robot);
    
    return Align(
      alignment: Alignment.topCenter,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            // Row 1: currencies
            Row(children: [
              _Currency(icon: Icons.settings, value: eco?.scrap ?? 0),       // scrap
              const Spacer(),
              _Currency(icon: Icons.diamond,  value: eco?.premiumGems ?? 0, color: const Color(0xFFFF3CAC)), // gems
            ]),
            const SizedBox(height: 8),
            // Row 2: care bars
            Row(children: [
              _StatBar(icon: Icons.restaurant, value: robot.oil.value.round()),
              const SizedBox(width: 8),
              _StatBar(icon: Icons.favorite,   value: robot.entertainment.value.round()),
              const SizedBox(width: 8),
              _StatBar(icon: Icons.bolt,       value: robot.battery.value.round()),
            ]),
            if (warn != null)
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text(warn, style: const TextStyle(
                    color: Color(0xFFFF3CAC), fontSize: 12,
                    fontWeight: FontWeight.bold)),
              ),
          ]),
        ),
      ),
    );
  }
  
  String? _firstCritical(RobotInstance s) {
    if (s.battery.value < 20) return 'Low battery! Charge your pet.';
    if (s.oil.value < 20) return 'Your pet is hungry!';
    if (s.entertainment.value < 20) return 'Your pet feels lonely.';
    return null;
  }
}
 
class _StatBar extends StatelessWidget {
  const _StatBar({required this.icon, required this.value});
  final IconData icon;
  final int value;
  
  static Color _colorFor(double v) {
    if (v < 20) return const Color(0xFFFF3CAC); // critical
    if (v < 50) return const Color(0xFFFFB627); // warning
    return const Color(0xFF7CFF6B);             // good
  }
  
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Icon(icon, size: 13, color: Colors.white70),
          const SizedBox(width: 4),
          Text('$value', style: const TextStyle(
              color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600)),
        ]),
        const SizedBox(height: 3),
        // Animates from the previous value to the new one on every change
        TweenAnimationBuilder<double>(
          tween: Tween(begin: 0, end: value.toDouble()),
          duration: const Duration(milliseconds: 450),
          curve: Curves.easeOut,
          builder: (context, v, _) => ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: LinearProgressIndicator(
              value: v / 100.0,
              minHeight: 8,
              backgroundColor: const Color(0x33FFFFFF),
              valueColor: AlwaysStoppedAnimation<Color>(_colorFor(v)),
            ),
          ),
        ),
      ]),
    );
  }
}
 
class _Currency extends StatelessWidget {
  const _Currency({
    required this.icon,
    required this.value,
    this.color = const Color(0xFF22E1FF),
  });
  final IconData icon;
  final int value;
  final Color color;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xAA0B0E1A),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withOpacity(0.6)),
      ),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Icon(icon, size: 14, color: color),
        const SizedBox(width: 4),
        Text('$value', style: const TextStyle(
            color: Colors.white, fontSize: 12)),
      ]),
    );
  }
}
