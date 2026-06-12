import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
 
import '../app/providers.dart';
import '../data/models/robot_instance.dart';
import '../data/robot_repository.dart';
import '../domain/economy/economy_provider.dart';
import '../game/robot_game.dart';
import 'shop_overlay.dart';
import 'theme.dart';
 
class PetScreen extends ConsumerWidget {
  const PetScreen({super.key});
 
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncRobot = ref.watch(activeRobotStreamProvider);
 
    return Scaffold(
      body: asyncRobot.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (robot) => robot == null
            ? const Center(child: Text('No active robot'))
            : _PetView(robot: robot),
      ),
    );
  }
}
 
class _PetView extends ConsumerWidget {
  const _PetView({required this.robot});
  final RobotInstance robot;
 
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repo = ref.read(robotRepositoryProvider);
    final eco = ref.read(economyProvider);
    
    void onCare(CareKind kind) async {
      bool changed = false;
      if (kind == CareKind.battery) changed = await repo.feed(robot.instanceId);
      if (kind == CareKind.oil) changed = await repo.clean(robot.instanceId);
      if (kind == CareKind.entertainment) changed = await repo.play(robot.instanceId);
      
      if (changed) {
        int reward = 0;
        if (kind == CareKind.battery) reward = 6;
        if (kind == CareKind.oil) reward = 4;
        if (kind == CareKind.entertainment) reward = 8;
        eco.addScrap(reward);
        
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('+$reward Scrap!'),
            duration: const Duration(seconds: 1),
            backgroundColor: AppColors.cyan.withOpacity(0.8),
          ),
        );
      }
    }
 
    return Stack(
      children: [
        const Positioned.fill(child: _HudBackground()),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18, 10, 18, 18),
            child: Column(
              children: [
                _Header(robot: robot),
                Expanded(child: RobotStage(accent: AppColors.cyan)),
                _StatCluster(robot: robot),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: _NeonButton(
                        label: 'Feed',
                        icon: Icons.bolt,
                        color: AppColors.green,
                        onTap: () => onCare(CareKind.battery),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _NeonButton(
                        label: 'Oil',
                        icon: Icons.water_drop,
                        color: AppColors.amber,
                        onTap: () => onCare(CareKind.oil),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _NeonButton(
                        label: 'Play',
                        icon: Icons.sports_esports,
                        color: AppColors.pink,
                        onTap: () => onCare(CareKind.entertainment),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _NeonButton(
                        label: 'Shop',
                        icon: Icons.store,
                        color: AppColors.cyan,
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => const ShopOverlay(),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
 
class _Header extends StatelessWidget {
  const _Header({required this.robot});
  final RobotInstance robot;
 
  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(robot.nickname.toUpperCase(), style: text.headlineSmall),
              const SizedBox(height: 2),
              Text(
                '${robot.rarity.name.toUpperCase()} • '
                '${robot.robotClass.name.toUpperCase()}',
                style: text.bodySmall?.copyWith(
                  color: AppColors.cyan,
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
        ),
        GlassPanel(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          borderColor: AppColors.cyan.withOpacity(0.6),
          glow: true,
          child: Text('LV ${robot.level}',
              style: text.titleSmall?.copyWith(color: Colors.white)),
        ),
        if (robot.neglectStrikes > 0) ...[
          const SizedBox(width: 10),
          GlassPanel(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            borderColor: AppColors.amber.withOpacity(0.7),
            child: Row(
              children: [
                const Icon(Icons.warning_amber, color: AppColors.amber, size: 16),
                const SizedBox(width: 4),
                Text('${robot.neglectStrikes}',
                    style: text.titleSmall?.copyWith(color: AppColors.amber)),
              ],
            ),
          ),
        ],
      ],
    );
  }
}
 
class _StatCluster extends StatelessWidget {
  const _StatCluster({required this.robot});
  final RobotInstance robot;
 
  @override
  Widget build(BuildContext context) {
    return GlassPanel(
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 20),
      borderColor: Colors.white.withOpacity(0.12),
      child: Column(
        children: [
          _HudStatBar(label: 'Battery', value: robot.battery.value,
              max: robot.battery.max, color: AppColors.green),
          const SizedBox(height: 16),
          _HudStatBar(label: 'Oil', value: robot.oil.value,
              max: robot.oil.max, color: AppColors.amber),
          const SizedBox(height: 16),
          _HudStatBar(label: 'Entertainment', value: robot.entertainment.value,
              max: robot.entertainment.max, color: AppColors.pink),
        ],
      ),
    );
  }
}
 
class _HudStatBar extends StatelessWidget {
  const _HudStatBar({
    required this.label,
    required this.value,
    required this.max,
    required this.color,
  });
 
  final String label;
  final double value;
  final double max;
  final Color color;
 
  @override
  Widget build(BuildContext context) {
    final pct = (value / max).clamp(0.0, 1.0);
    final text = Theme.of(context).textTheme;
 
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(label.toUpperCase(),
                style: text.titleSmall?.copyWith(letterSpacing: 1.5)),
            const Spacer(),
            Text('${(pct * 100).round()}%',
                style: text.titleSmall
                    ?.copyWith(color: color, fontWeight: FontWeight.w700)),
          ],
        ),
        const SizedBox(height: 6),
        Container(
          height: 14,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white.withOpacity(0.06),
            border: Border.all(color: color.withOpacity(0.35)),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0, end: pct),
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOut,
                builder: (context, v, _) => FractionallySizedBox(
                  widthFactor: v <= 0 ? 0.001 : v,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [color.withOpacity(0.65), color],
                      ),
                      boxShadow: [
                        BoxShadow(color: color.withOpacity(0.6), blurRadius: 10),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
 
class _NeonButton extends StatelessWidget {
  const _NeonButton({
    required this.label,
    required this.icon,
    required this.color,
    required this.onTap,
  });
 
  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;
 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          gradient: LinearGradient(
            colors: [color.withOpacity(0.20), color.withOpacity(0.04)],
          ),
          border: Border.all(color: color.withOpacity(0.85), width: 1.4),
          boxShadow: [
            BoxShadow(
                color: color.withOpacity(0.35), blurRadius: 14, spreadRadius: -2),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, color: color),
            const SizedBox(height: 4),
            Text(label.toUpperCase(),
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.5,
                  fontSize: 12,
                )),
          ],
        ),
      ),
    );
  }
}
 
class _HudBackground extends StatelessWidget {
  const _HudBackground();
 
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment(0, -0.35),
          radius: 1.1,
          colors: [Color(0xFF13243F), AppColors.bg],
        ),
      ),
      child: CustomPaint(painter: _GridPainter(), size: Size.infinite),
    );
  }
}
 
class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.cyan.withOpacity(0.05)
      ..strokeWidth = 1;
    const step = 34.0;
    for (double x = 0; x < size.width; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y < size.height; y += step) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }
 
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
