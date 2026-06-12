import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../app/providers.dart';
import '../../../data/models/game_item.dart';
import '../../../data/models/module_instance.dart';
import '../../../game/robot_game.dart';
import '../theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
 
class LoadoutOverlay extends ConsumerWidget {
  const LoadoutOverlay({super.key, required this.game});
  final RoboPetGame game;
 
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inventory = ref.watch(inventoryProvider);
    const robotId = 'robot_0'; // swap with ref.watch(activeRobotIdProvider)
    final equipped = ref.watch(equippedModulesProvider(robotId));
    return Positioned(
      bottom: 88, left: 0, right: 0,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Text('LOADOUT', style: TextStyle(
              color: AppColors.green, fontSize: 11,
              letterSpacing: 2, fontWeight: FontWeight.bold))),
        SizedBox(
          height: 74,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            children: ModuleSlot.values.map((slot) => _SlotCard(
              slot: slot, equipped: equipped[slot],
              onTap: () => _openPicker(context, ref, slot, robotId,
                  inventory.valueOrNull ?? []),
            )).toList())),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: _DeployButton(equipped: equipped, game: game, ref: ref)),
      ]));
  }
 
  void _openPicker(BuildContext ctx, WidgetRef ref, ModuleSlot slot,
      String robotId, List<ModuleInstance> inventory) {
    showModalBottomSheet(
      context: ctx,
      backgroundColor: const Color(0xFF0D1220),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      builder: (_) => _ModulePicker(
          slot: slot,
          modules: inventory.where((m) => m.def?.slot == slot).toList(),
          robotId: robotId));
  }
}
 
class _SlotCard extends StatelessWidget {
  const _SlotCard({required this.slot, required this.equipped, required this.onTap});
  final ModuleSlot slot; final ModuleInstance? equipped; final VoidCallback onTap;
  static const _icons = {
    ModuleSlot.wheels: Icons.rotate_right, ModuleSlot.armor: Icons.shield,
    ModuleSlot.sensor: Icons.sensors, ModuleSlot.core: Icons.memory,
    ModuleSlot.utility: Icons.electrical_services };
  static const _rc = {
    'common': Color(0xFFAAAAAA), 'rare': Color(0xFF4488FF), 'epic': Color(0xFFCC44FF) };
  @override
  Widget build(BuildContext context) {
    final c = equipped != null ? (_rc[equipped!.rarity.name] ?? Colors.white30) : 
Colors.white24;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 64, height: 64, margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: Colors.black54, border: Border.all(color: c),
          borderRadius: BorderRadius.circular(10),
          boxShadow: equipped != null ? [BoxShadow(color: c.withOpacity(0.3), blurRadius: 
10)] : []),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(_icons[slot], color: c, size: 22),
          const SizedBox(height: 2),
          Text(slot.name, style: TextStyle(color: c, fontSize: 9, letterSpacing: 0.5)),
        ])));
  }
}
 
class _ModulePicker extends ConsumerWidget {
  const _ModulePicker({required this.slot, required this.modules, required this.robotId});
  final ModuleSlot slot; final List<ModuleInstance> modules; final String robotId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (modules.isEmpty) {
      return Padding(padding: const EdgeInsets.all(32),
        child: Center(child: Text('No ${slot.name} modules in storage.',
            style: const TextStyle(color: Colors.white54, fontSize: 14))));
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16), itemCount: modules.length,
      itemBuilder: (_, i) {
        final m = modules[i];
        return ListTile(
          leading: Icon(Icons.memory,
              color: m.equippedRobotId != null ? Colors.white30 : AppColors.cyan),
          title: Text(m.def?.name ?? m.defId,
              style: const TextStyle(color: Colors.white, fontSize: 13)),
          subtitle: Text(m.rarity.name.toUpperCase(),
              style: const TextStyle(color: Colors.white38, fontSize: 10)),
          trailing: m.equippedRobotId == robotId
              ? const Text('EQUIPPED', style: TextStyle(color: Colors.white30, fontSize: 10))
              : null,
          onTap: () {
            ref.read(isarProvider).writeTxnSync(() {
              m.equippedRobotId = robotId;
              ref.read(isarProvider).moduleInstances.putSync(m);
            });
            
            final uid = FirebaseAuth.instance.currentUser?.uid;
            if (uid != null) {
              FirebaseFirestore.instance
                  .doc('users/$uid/modules/${m.instanceId}')
                  .update({'equippedRobotId': robotId}).catchError((_) {});
            }
            
            Navigator.pop(context);
          });
      });
  }
}
 
class _DeployButton extends StatelessWidget {
  const _DeployButton({
      required this.equipped, required this.game, required this.ref});
  final Map<ModuleSlot, ModuleInstance> equipped;
  final RoboPetGame game;
  final WidgetRef ref;
 
  @override
  Widget build(BuildContext context) {
    final ready = equipped.isNotEmpty;
    return GestureDetector(
      onTap: ready ? () async {
        final stats = ref.read(resolvedStatsProvider);
        final syncService = ref.read(combatSyncProvider);
        unawaited(syncService.push(
          robotInstanceId: 'robot_0',
          stats: stats,
          equipped: equipped.values.toList()));
        game.navigateTo(Room.combat);
      } : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: ready ? AppColors.magenta.withOpacity(0.15) : Colors.white10,
          border: Border.all(color: ready ? AppColors.magenta : Colors.white24),
          borderRadius: BorderRadius.circular(10),
          boxShadow: ready ? [BoxShadow(color: AppColors.magenta.withOpacity(0.3), blurRadius: 14)] : []),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(Icons.sports_kabaddi,
              color: ready ? AppColors.magenta : Colors.white30, size: 18),
          const SizedBox(width: 8),
          Text(
            ready ? 'Deploy to Battle (${equipped.length} modules)'
                  : 'Equip at least 1 module to deploy',
            style: TextStyle(
              color: ready ? AppColors.magenta : Colors.white30,
              fontWeight: FontWeight.bold, fontSize: 13)),
        ])));
  }
}
