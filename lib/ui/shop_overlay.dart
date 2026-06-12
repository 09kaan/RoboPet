import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app/providers.dart';
import '../data/models/game_item.dart';
import '../domain/economy/economy_provider.dart';
import 'theme.dart';

class ShopOverlay extends ConsumerWidget {
  const ShopOverlay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eco = ref.read(economyProvider);
    final currencies = ref.watch(currenciesStreamProvider).valueOrNull;

    if (currencies == null) return const SizedBox();

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(16),
      child: GlassPanel(
        padding: const EdgeInsets.all(24),
        borderColor: AppColors.cyan.withOpacity(0.5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('SHOP & CRATES', style: Theme.of(context).textTheme.headlineSmall),
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _CurrencyBadge(icon: Icons.settings, label: '${currencies.scrap}', color: AppColors.cyan),
                _CurrencyBadge(icon: Icons.key, label: '${currencies.basicKeys}', color: AppColors.green),
                _CurrencyBadge(icon: Icons.key, label: '${currencies.rareKeys}', color: AppColors.amber),
                _CurrencyBadge(icon: Icons.key, label: '${currencies.epicKeys}', color: AppColors.pink),
              ],
            ),
            const SizedBox(height: 24),
            _ShopItem(
              title: 'Basic Key',
              price: '${kKeyPriceScrap[KeyTier.basic]} Scrap',
              color: AppColors.green,
              onBuy: () async {
                final success = await eco.buyKeyWithScrap(KeyTier.basic);
                if (!success) _showErr(context, 'Not enough Scrap!');
              },
            ),
            const SizedBox(height: 12),
            _ShopItem(
              title: 'Rare Key',
              price: '${kKeyPriceScrap[KeyTier.rare]} Scrap',
              color: AppColors.amber,
              onBuy: () async {
                final success = await eco.buyKeyWithScrap(KeyTier.rare);
                if (!success) _showErr(context, 'Not enough Scrap!');
              },
            ),
            const SizedBox(height: 24),
            const Divider(color: Colors.white24),
            const SizedBox(height: 16),
            _CrateItem(
              title: 'Open Basic Crate',
              cost: '1 Basic Key',
              color: AppColors.green,
              onOpen: () async {
                final item = await eco.openCrate(KeyTier.basic);
                if (item != null) _showLoot(context, item);
                else _showErr(context, 'No Basic Key!');
              },
            ),
            const SizedBox(height: 12),
            _CrateItem(
              title: 'Open Rare Crate',
              cost: '1 Rare Key',
              color: AppColors.amber,
              onOpen: () async {
                final item = await eco.openCrate(KeyTier.rare);
                if (item != null) _showLoot(context, item);
                else _showErr(context, 'No Rare Key!');
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showErr(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg), backgroundColor: Colors.red));
  }

  void _showLoot(BuildContext context, GameItem item) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: GlassPanel(
          padding: const EdgeInsets.all(24),
          borderColor: AppColors.cyan,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('LOOT ACQUIRED!', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: AppColors.cyan)),
              const SizedBox(height: 16),
              Text(item.name, style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 8),
              Text(item.description, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Awesome'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _CurrencyBadge extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _CurrencyBadge({required this.icon, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color, size: 16),
        const SizedBox(width: 4),
        Text(label, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: color)),
      ],
    );
  }
}

class _ShopItem extends StatelessWidget {
  final String title;
  final String price;
  final Color color;
  final VoidCallback onBuy;

  const _ShopItem({required this.title, required this.price, required this.color, required this.onBuy});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.5)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: color.withOpacity(0.2)),
            onPressed: onBuy,
            child: Text('Buy ($price)'),
          ),
        ],
      ),
    );
  }
}

class _CrateItem extends StatelessWidget {
  final String title;
  final String cost;
  final Color color;
  final VoidCallback onOpen;

  const _CrateItem({required this.title, required this.cost, required this.color, required this.onOpen});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color, width: 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: color),
            onPressed: onOpen,
            child: Text('Open ($cost)', style: const TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
