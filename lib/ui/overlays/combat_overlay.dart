import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
 
import '../../../app/providers.dart';
import '../../../data/combat/combat_notifier.dart';
import '../../../domain/combat/resolved_stats.dart';
import '../../../game/robot_game.dart';
import '../../../data/models/module_enums.dart';
import '../theme.dart';
 
class CombatOverlay extends ConsumerStatefulWidget {
  const CombatOverlay({super.key, required this.game});
  final RoboPetGame game;
  @override
  ConsumerState<CombatOverlay> createState() => _CombatOverlayState();
}
 
class _CombatOverlayState extends ConsumerState<CombatOverlay> {
  static const _turnInterval = Duration(milliseconds: 1600);
  Timer? _timer;
  Timer? _cdTimer;
 
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _startBattle());
  }
 
  void _startBattle() {
    final playerStats = ref.read(resolvedStatsProvider);
    ref.read(combatProvider.notifier).startBattle(player: playerStats);
    _timer?.cancel();
    _cdTimer?.cancel();
    _timer = Timer.periodic(_turnInterval, (_) => _tick());
    _cdTimer = Timer.periodic(const Duration(milliseconds: 100), (_) {
      ref.read(combatProvider.notifier).tickCooldowns(0.1);
    });
  }
 
  void _tick() {
    final notifier = ref.read(combatProvider.notifier);
    final hit = notifier.tick();
    if (!hit) return;
    final state = ref.read(combatProvider);
    if (state.phase == CombatPhase.battling) {
      widget.game.combatWorld
          .showHit(attackerIsPlayer: state.turnCount % 2 == 1);
    } else {
      _timer?.cancel();
      widget.game.combatWorld
          .showOutcome(playerWon: state.phase == CombatPhase.victory);
    }
  }
 
  @override
  void dispose() { _timer?.cancel(); _cdTimer?.cancel(); super.dispose(); }
 
  void _retreat() {
    _timer?.cancel();
    _cdTimer?.cancel();
    ref.read(combatProvider.notifier).reset();
    widget.game.combatWorld.reset();
    widget.game.navigateTo(Room.laboratory);
  }
 
  void _retryOrNext() {
    _timer?.cancel();
    _cdTimer?.cancel();
    widget.game.combatWorld.reset();
    final playerStats = ref.read(resolvedStatsProvider);
    ref.read(combatProvider.notifier).retry(playerStats);
    _startBattle();
  }
 
  @override
  Widget build(BuildContext context) {
    final cs = ref.watch(combatProvider);
    final playerStats = ref.watch(resolvedStatsProvider);
    return Stack(children: [
      Positioned(
        top: MediaQuery.of(context).padding.top + 52,
        left: 12, right: 12,
        child: _StatsRow(
          playerHpFrac: cs.playerHpFraction,
          enemyHpFrac: cs.enemyHpFraction,
          playerStats: playerStats,
          enemyStats: ResolvedCombatStats.ghost,
          playerShield: cs.shieldHp,
          playerStatuses: cs.playerStatuses,
          enemyStatuses: cs.enemyStatuses,
          playerType: cs.playerType,
          enemyType: cs.enemyType)),
      if (cs.bossWindup)
        Positioned(
          top: 150, left: 20, right: 20,
          child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: const Duration(milliseconds: 500),
            builder: (context, val, child) => Transform.scale(
              scale: 0.9 + 0.1 * val,
              child: Opacity(
                opacity: 0.7 + 0.3 * val,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.redAccent.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [BoxShadow(color: Colors.red, blurRadius: 20)],
                  ),
                  alignment: Alignment.center,
                  child: const Text('⚠️ BOSS CHARGING - SHIELD NOW!',
                      style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
                ),
              ),
            ),
          ),
        ),
      Positioned(
        bottom: 88, left: 12, right: 12,
        child: _BattleLog(log: cs.log)),
      if (cs.phase == CombatPhase.victory || cs.phase == CombatPhase.defeat)
        Center(child: _OutcomeBanner(
            won: cs.phase == CombatPhase.victory, 
            onRetreat: _retreat, 
            onRetry: _retryOrNext)),
      if (cs.phase == CombatPhase.battling)
        Positioned(
          bottom: 210, left: 12, right: 12,
          child: _OverchargeBar(state: cs, notifier: ref.read(combatProvider.notifier))),
      if (cs.phase == CombatPhase.battling)
        Positioned(
          bottom: 120, left: 12, right: 12,
          child: _AbilityBar(state: cs, notifier: ref.read(combatProvider.notifier))),
      if (cs.phase == CombatPhase.battling)
        Positioned(
          bottom: 70, right: 12,
          child: TextButton(
            onPressed: _retreat,
            child: const Text('Retreat',
                style: TextStyle(color: Colors.white38, fontSize: 12)))),
    ]);
  }
}
 
class _StatsRow extends StatelessWidget {
  const _StatsRow({required this.playerHpFrac, required this.enemyHpFrac,
      required this.playerStats, required this.enemyStats, this.playerShield = 0,
      this.playerStatuses = const [], this.enemyStatuses = const [],
      this.playerType = DamageType.kinetic, this.enemyType = DamageType.kinetic});
  final double playerHpFrac, enemyHpFrac;
  final ResolvedCombatStats playerStats, enemyStats;
  final int playerShield;
  final List<StatusEffect> playerStatuses, enemyStatuses;
  final DamageType playerType, enemyType;
  
  @override
  Widget build(BuildContext context) {
    final playerAdv = kBeats[playerType] == enemyType;
    final enemyAdv = kBeats[enemyType] == playerType;
    
    return Row(children: [
      Expanded(child: _FighterCard(label: 'YOUR ROBOT', color: AppColors.cyan,
          hpFrac: playerHpFrac, atk: playerStats.attack, def: playerStats.defense, shield: playerShield, statuses: playerStatuses, type: playerType, hasAdvantage: playerAdv)),
      const SizedBox(width: 10),
      const Text('VS', style: TextStyle(
          color: Colors.white38, fontSize: 11, fontWeight: FontWeight.bold)),
      const SizedBox(width: 10),
      Expanded(child: _FighterCard(label: 'GHOST', color: AppColors.magenta,
          hpFrac: enemyHpFrac, atk: enemyStats.attack, def: enemyStats.defense, statuses: enemyStatuses, type: enemyType, hasAdvantage: enemyAdv)),
    ]);
  }
}
 
class _FighterCard extends StatelessWidget {
  const _FighterCard({required this.label, required this.color,
      required this.hpFrac, required this.atk, required this.def, this.shield = 0, this.statuses = const [],
      required this.type, this.hasAdvantage = false});
  final String label; final Color color;
  final double hpFrac; final int atk, def, shield;
  final List<StatusEffect> statuses;
  final DamageType type;
  final bool hasAdvantage;
  
  String _typeIcon(DamageType t) {
    switch(t) {
      case DamageType.kinetic: return '⚙️';
      case DamageType.emp: return '⚡';
      case DamageType.fire: return '🔥';
      case DamageType.acid: return '🧪';
    }
  }
 
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Colors.black54,
      border: Border.all(color: shield > 0 ? Colors.cyanAccent : color.withOpacity(0.5), width: shield > 0 ? 2 : 1),
      borderRadius: BorderRadius.circular(8),
      boxShadow: hasAdvantage ? [BoxShadow(color: Colors.white24, blurRadius: 8, spreadRadius: 2)] : [],
    ),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text('${_typeIcon(type)} ', style: const TextStyle(fontSize: 10)),
              Text(label, style: TextStyle(
                  color: color, fontSize: 9, letterSpacing: 1.5, fontWeight: FontWeight.bold)),
              if (hasAdvantage)
                const Text(' ⬆️', style: TextStyle(fontSize: 10)),
            ],
          ),
          if (shield > 0)
            Text('🛡️ $shield', style: const TextStyle(color: Colors.cyanAccent, fontSize: 9, fontWeight: FontWeight.bold)),
        ],
      ),
      const SizedBox(height: 4),
      Stack(children: [
        Container(height: 6, decoration: BoxDecoration(
            color: Colors.white12, borderRadius: BorderRadius.circular(3))),
        FractionallySizedBox(widthFactor: hpFrac,
          child: Container(height: 6, decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(3),
              boxShadow: [BoxShadow(color: color.withOpacity(0.5), blurRadius: 4)]))),
      ]),
      const SizedBox(height: 4),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text('ATK $atk', style: const TextStyle(color: Colors.white54, fontSize: 9)),
        Text('DEF $def', style: const TextStyle(color: Colors.white54, fontSize: 9)),
      ]),
      if (statuses.isNotEmpty)
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Wrap(
            spacing: 4,
            children: statuses.map((s) => _StatusIcon(effect: s)).toList(),
          ),
        ),
    ]));
}
 
class _StatusIcon extends StatelessWidget {
  const _StatusIcon({required this.effect});
  final StatusEffect effect;
  
  @override
  Widget build(BuildContext context) {
    String icon = ''; Color c = Colors.white;
    switch (effect.kind) {
      case StatusKind.overheat: icon = '🔥'; c = Colors.orange; break;
      case StatusKind.stun: icon = '⚡'; c = Colors.yellow; break;
      case StatusKind.shield: icon = '🛡️'; c = Colors.cyan; break;
      case StatusKind.emp: icon = '🚫'; c = Colors.purple; break;
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      decoration: BoxDecoration(color: c.withOpacity(0.2), borderRadius: BorderRadius.circular(4), border: Border.all(color: c.withOpacity(0.5))),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(icon, style: const TextStyle(fontSize: 8)),
          const SizedBox(width: 2),
          Text('${effect.ticksLeft}', style: TextStyle(color: c, fontSize: 8, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
 
class _BattleLog extends StatelessWidget {
  const _BattleLog({required this.log});
  final List<String> log;
  @override
  Widget build(BuildContext context) {
    final recent = log.length > 5 ? log.sublist(log.length - 5) : log;
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.black87,
          border: Border.all(color: Colors.white12),
          borderRadius: BorderRadius.circular(8)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: recent.reversed.map((line) => Padding(
            padding: const EdgeInsets.only(bottom: 2),
            child: Text(line, style: const TextStyle(
                color: Colors.white70, fontSize: 10)))).toList()));
  }
}
 
class _OutcomeBanner extends StatelessWidget {
  const _OutcomeBanner({required this.won, required this.onRetreat, required this.onRetry});
  final bool won; final VoidCallback onRetreat, onRetry;
  @override
  Widget build(BuildContext context) {
    final c = won ? AppColors.green : Colors.redAccent;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
      decoration: BoxDecoration(
          color: Colors.black87, border: Border.all(color: c, width: 2),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: c.withOpacity(0.35), blurRadius: 24)]),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Text(won ? 'VICTORY' : 'DEFEATED',
            style: TextStyle(color: c, fontSize: 28,
                fontWeight: FontWeight.bold, letterSpacing: 3)),
        const SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: onRetreat,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: c.withOpacity(0.5)), borderRadius: BorderRadius.circular(8)),
                child: Text('Retreat',
                    style: TextStyle(color: c.withOpacity(0.8), fontWeight: FontWeight.bold)))),
            const SizedBox(width: 16),
            GestureDetector(
              onTap: onRetry,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                decoration: BoxDecoration(
                    color: c.withOpacity(0.2),
                    border: Border.all(color: c), borderRadius: BorderRadius.circular(8)),
                child: Text(won ? 'Next Level' : 'Retry',
                    style: TextStyle(color: c, fontWeight: FontWeight.bold)))),
          ],
        ),
      ]));
  }
}
 
class _AbilityBar extends StatelessWidget {
  const _AbilityBar({required this.state, required this.notifier});
  final CombatState state;
  final CombatNotifier notifier;
  
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _AbilityBtn(
          label: 'STRIKE',
          icon: Icons.flash_on,
          color: Colors.orangeAccent,
          cd: state.cooldowns[Ability.strike] ?? 0,
          maxCd: kAbilityCooldown[Ability.strike]!,
          onTap: () => notifier.useAbility(Ability.strike),
        ),
        _AbilityBtn(
          label: 'SHIELD',
          icon: Icons.security,
          color: Colors.cyanAccent,
          cd: state.cooldowns[Ability.shield] ?? 0,
          maxCd: kAbilityCooldown[Ability.shield]!,
          onTap: () => notifier.useAbility(Ability.shield),
        ),
        _AbilityBtn(
          label: 'REPAIR',
          icon: Icons.build,
          color: Colors.greenAccent,
          cd: state.cooldowns[Ability.repair] ?? 0,
          maxCd: kAbilityCooldown[Ability.repair]!,
          onTap: () => notifier.useAbility(Ability.repair),
        ),
      ],
    );
  }
}
 
class _AbilityBtn extends StatelessWidget {
  const _AbilityBtn({
    required this.label, required this.icon, required this.color,
    required this.cd, required this.maxCd, required this.onTap,
  });
  final String label;
  final IconData icon;
  final Color color;
  final double cd;
  final double maxCd;
  final VoidCallback onTap;
 
  @override
  Widget build(BuildContext context) {
    final onCd = cd > 0;
    return GestureDetector(
      onTap: onCd ? null : onTap,
      child: Container(
        width: 80, height: 80,
        decoration: BoxDecoration(
          color: Colors.black87,
          shape: BoxShape.circle,
          border: Border.all(color: onCd ? Colors.white24 : color, width: onCd ? 1 : 2),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: onCd ? Colors.white24 : color, size: 28),
                const SizedBox(height: 4),
                Text(label, style: TextStyle(color: onCd ? Colors.white24 : color, fontSize: 10, fontWeight: FontWeight.bold)),
              ],
            ),
            if (onCd)
              Positioned.fill(
                child: CircularProgressIndicator(
                  value: cd / maxCd,
                  color: Colors.white38,
                  strokeWidth: 3,
                ),
              ),
            if (onCd)
              Text(cd.toStringAsFixed(1), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
 
class _OverchargeBar extends StatefulWidget {
  const _OverchargeBar({required this.state, required this.notifier});
  final CombatState state;
  final CombatNotifier notifier;
 
  @override
  State<_OverchargeBar> createState() => _OverchargeBarState();
}
 
class _OverchargeBarState extends State<_OverchargeBar> with SingleTickerProviderStateMixin {
  late AnimationController _anim;
  
  @override
  void initState() {
    super.initState();
    _anim = AnimationController(vsync: this, duration: const Duration(milliseconds: 1200))
      ..addListener(() => setState(() {}));
  }
 
  @override
  void didUpdateWidget(_OverchargeBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.state.charge >= 100 && !_anim.isAnimating) {
      _anim.repeat(reverse: true);
    } else if (widget.state.charge < 100 && _anim.isAnimating) {
      _anim.stop();
      _anim.value = 0;
    }
  }
 
  @override
  void dispose() {
    _anim.dispose();
    super.dispose();
  }
  
  void _handleTap() {
    if (widget.state.charge < 100) return;
    final dist = (_anim.value - 0.5).abs();
    final quality = (1.0 - (dist * 2)).clamp(0.0, 1.0);
    widget.notifier.useOvercharge(quality);
  }
 
  @override
  Widget build(BuildContext context) {
    final charge = widget.state.charge;
    final isFull = charge >= 100;
    
    return GestureDetector(
      onTap: _handleTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('OVERCHARGE', style: TextStyle(color: isFull ? Colors.orangeAccent : Colors.white54, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 2)),
              if (isFull) const Text('TAP NOW!', style: TextStyle(color: Colors.orangeAccent, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1)),
            ],
          ),
          const SizedBox(height: 6),
          Container(
            height: 36,
            decoration: BoxDecoration(
              color: Colors.black54,
              border: Border.all(color: isFull ? Colors.orangeAccent : Colors.white24, width: isFull ? 2 : 1),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Stack(
              children: [
                FractionallySizedBox(
                  widthFactor: (charge / 100).clamp(0.0, 1.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: isFull ? Colors.orange.withOpacity(0.1) : Colors.white12,
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
                if (isFull)
                  Align(
                    alignment: Alignment.center,
                    child: FractionallySizedBox(
                      widthFactor: 0.6,
                      child: Container(decoration: BoxDecoration(color: Colors.yellowAccent.withOpacity(0.5))),
                    ),
                  ),
                if (isFull)
                  Align(
                    alignment: Alignment.center,
                    child: FractionallySizedBox(
                      widthFactor: 0.3,
                      child: Container(decoration: BoxDecoration(color: Colors.greenAccent.withOpacity(0.7))),
                    ),
                  ),
                if (isFull)
                  Positioned(
                    left: 0, right: 0, top: -4, bottom: -4,
                    child: Align(
                      alignment: Alignment(-1.0 + (_anim.value * 2), 0),
                      child: Container(
                        width: 6, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(3)),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
