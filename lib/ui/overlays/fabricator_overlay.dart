import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../app/providers.dart';
import '../../../data/gacha/gacha_service.dart';
import '../../../data/models/module_instance.dart';
import '../../../game/robot_game.dart';
import '../theme.dart';
 
class FabricatorOverlay extends ConsumerStatefulWidget {
  const FabricatorOverlay({super.key, required this.game});
  final RoboPetGame game;
  @override
  ConsumerState<FabricatorOverlay> createState() => _FabricatorOverlayState();
}
 
class _FabricatorOverlayState extends ConsumerState<FabricatorOverlay> {
  bool _rolling = false;
  String? _lastRarity; String? _lastDefId; String? _error;
 
  Future<void> _roll() async {
    setState(() { _rolling = true; _error = null; });
    try {
      final result = await ref.read(gachaServiceProvider).roll();
      
      final isar = ref.read(isarProvider);
      isar.writeTxnSync(() {
        isar.moduleInstances.putSync(ModuleInstance()
          ..instanceId = result.instanceId
          ..defId = result.defId
          ..rarity = result.rarity
          ..level = 1
          ..acquiredAt = DateTime.now().toUtc()
          ..schemaVersion = 2);
      });
      
      setState(() { _lastRarity = result.rarity.name; _lastDefId = result.defId; });
      widget.game.fabricatorWorld.triggerReveal(result.rarity.name);
    } on GachaException catch (e) {
      setState(() => _error = e.message);
    } finally {
      setState(() => _rolling = false);
    }
  }
 
  @override
  Widget build(BuildContext context) {
    final cogs = ref.watch(currenciesStreamProvider).valueOrNull?.rareCogs ?? 0;
    return Positioned(
      bottom: 88, left: 20, right: 20,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        if (_lastRarity != null)
          _RevealCard(rarity: _lastRarity!, defId: _lastDefId!),
        if (_error != null)
          Padding(padding: const EdgeInsets.only(bottom: 8),
            child: Text(_error!, style:
                const TextStyle(color: Colors.redAccent, fontSize: 13))),
        _GlowButton(
          label: _rolling ? 'Fabricating...' : 'Fabricate   1 RareCog',
          enabled: cogs >= 1 && !_rolling,
          color: AppColors.magenta, onTap: _roll),
        Text('$cogs RareCogs available',
          style: TextStyle(color: AppColors.cyan, fontSize: 11)),
      ]));
  }
}
 
class _RevealCard extends StatelessWidget {
  const _RevealCard({required this.rarity, required this.defId});
  final String rarity; final String defId;
  static const _colors = {
    'common': Color(0xFFAAAAAA), 'rare': Color(0xFF4488FF), 'epic': Color(0xFFCC44FF) };
  @override
  Widget build(BuildContext context) {
    final c = _colors[rarity] ?? _colors['common']!;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.black87, border: Border.all(color: c, width: 1.5),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: c.withOpacity(0.3), blurRadius: 16)]),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(Icons.memory, color: c, size: 22),
        const SizedBox(width: 10),
        Text(defId.replaceAll('_', ' ').toUpperCase(),
          style: TextStyle(color: c, fontWeight: FontWeight.bold,
              fontSize: 13, letterSpacing: 1.2)),
        const SizedBox(width: 10),
        Text(rarity.toUpperCase(), style: TextStyle(
            color: c.withOpacity(0.7), fontSize: 10, letterSpacing: 1.5)),
      ]));
  }
}
 
class _GlowButton extends StatelessWidget {
  const _GlowButton({required this.label, required this.enabled,
      required this.color, required this.onTap});
  final String label; final bool enabled;
  final Color color; final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(vertical: 14),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: enabled ? color.withOpacity(0.15) : Colors.white10,
          border: Border.all(color: enabled ? color : Colors.white24),
          borderRadius: BorderRadius.circular(10),
          boxShadow: enabled ? [BoxShadow(color: color.withOpacity(0.35), blurRadius: 18)] : 
[]),
        child: Text(label, style: TextStyle(
            color: enabled ? color : Colors.white30,
            fontWeight: FontWeight.bold, fontSize: 14))));
  }
}
