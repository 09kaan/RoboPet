import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../game/robot_game.dart';
import '../../../game/rooms/living_room.dart';
import '../../../domain/decor/decor_def.dart';
import '../../../app/providers.dart';
import '../../../data/models/player_profile.dart';
import 'package:isar/isar.dart';
 
class ShopOverlay extends ConsumerWidget {
  const ShopOverlay({super.key, required this.game});
  final RoboPetGame game;
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // using economySyncProvider for ownership and buy
    final syncService = ref.watch(economySyncProvider);
    final user = ref.watch(sessionProvider).value;
    final isar = ref.watch(isarProvider);
    final profile = user == null ? null : isar.playerProfiles.filter().playerIdEqualTo(user.uid).findFirstSync();
    
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 180,
        color: const Color(0xCC0B0E1A),
        child: ListView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.all(12),
          children: kLivingRoomDecor.map((d) {
            final owned = profile?.ownedDecor.contains(d.id) ?? false;
            return _ShopCard(
              def: d,
              owned: owned,
              onTap: () async {
                final world = game.world as LivingRoomWorld;
                if (owned) {
                  await world.addDecor(d);
                } else {
                  final ok = await syncService.spend(currency: d.currency, amount: d.price, reason: 'decor:${d.id}');
                  if (ok) {
                    await syncService.grantDecor(d.id);
                    await world.addDecor(d);
                  }
                }
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
 
class _ShopCard extends StatelessWidget {
  const _ShopCard({required this.def, required this.owned, required this.onTap});
  final DecorDef def;
  final bool owned;
  final VoidCallback onTap;
 
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E2445),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF394067)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(def.name, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
          const SizedBox(height: 10),
          if (!owned) Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(def.currency == CurrencyType.scrap ? Icons.settings : Icons.diamond, color: def.currency == CurrencyType.scrap ? Colors.grey : Colors.purpleAccent, size: 16),
              const SizedBox(width: 4),
              Text('${def.price}', style: const TextStyle(color: Colors.white70, fontSize: 13)),
            ],
          ),
          if (owned) const Text('Owned', style: TextStyle(color: Colors.greenAccent, fontSize: 12)),
          const Spacer(),
          ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              backgroundColor: owned ? const Color(0xFF394067) : const Color(0xFF22E1FF),
              foregroundColor: owned ? Colors.white : Colors.black,
              minimumSize: const Size(80, 32),
              padding: EdgeInsets.zero,
            ),
            child: Text(owned ? 'Place' : 'Buy', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
