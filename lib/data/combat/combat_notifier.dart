import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/combat/resolved_stats.dart';
import '../../app/providers.dart';
import '../models/module_enums.dart';
 
enum CombatPhase { idle, battling, victory, defeat }
 
enum Ability { strike, shield, repair }
 
enum StatusKind { overheat, stun, shield, emp }
 
class StatusEffect {
  final StatusKind kind;
  int ticksLeft;
  final int magnitude;
  StatusEffect(this.kind, this.ticksLeft, this.magnitude);
  
  StatusEffect copy() => StatusEffect(kind, ticksLeft, magnitude);
}
 
const kAbilityCooldown = <Ability, double>{
  Ability.strike: 3.0,
  Ability.shield: 6.0,
  Ability.repair: 8.0,
};
 
class CombatState {
  const CombatState({
    this.phase = CombatPhase.idle,
    this.playerHp = 0, this.playerMaxHp = 0,
    this.enemyHp = 0, this.enemyMaxHp = 0,
    this.playerAtk = 0, this.playerDef = 0,
    this.enemyAtk = 0, this.enemyDef = 0,
    this.log = const [], this.turnCount = 0,
    this.level = 1, this.lastReward = 0,
    this.playerRegen = 0,
    this.cooldowns = const {}, this.shieldHp = 0,
    this.charge = 0.0,
    this.playerStatuses = const [],
    this.enemyStatuses = const [],
    this.playerType = DamageType.kinetic,
    this.enemyType = DamageType.kinetic,
    this.bossWindup = false,
  });
 
  final CombatPhase phase;
  final int playerHp, playerMaxHp, enemyHp, enemyMaxHp;
  final int playerAtk, playerDef, enemyAtk, enemyDef;
  final List<String> log;
  final int turnCount;
  final int level;
  final int lastReward;
  final int playerRegen;
  final Map<Ability, double> cooldowns;
  final int shieldHp;
  final double charge;
  final List<StatusEffect> playerStatuses;
  final List<StatusEffect> enemyStatuses;
  final DamageType playerType;
  final DamageType enemyType;
  final bool bossWindup;
 
  double get playerHpFraction =>
      playerMaxHp == 0 ? 0 : (playerHp / playerMaxHp).clamp(0.0, 1.0);
  double get enemyHpFraction =>
      enemyMaxHp == 0 ? 0 : (enemyHp / enemyMaxHp).clamp(0.0, 1.0);
 
  CombatState copyWith({
    CombatPhase? phase, int? playerHp, int? playerMaxHp,
    int? enemyHp, int? enemyMaxHp, int? playerAtk, int? playerDef,
    int? enemyAtk, int? enemyDef, List<String>? log, int? turnCount,
    int? level, int? lastReward, int? playerRegen,
    Map<Ability, double>? cooldowns, int? shieldHp,
    double? charge, List<StatusEffect>? playerStatuses, List<StatusEffect>? enemyStatuses,
    DamageType? playerType, DamageType? enemyType, bool? bossWindup,
  }) => CombatState(
    phase: phase ?? this.phase,
    playerHp: playerHp ?? this.playerHp,
    playerMaxHp: playerMaxHp ?? this.playerMaxHp,
    enemyHp: enemyHp ?? this.enemyHp,
    enemyMaxHp: enemyMaxHp ?? this.enemyMaxHp,
    playerAtk: playerAtk ?? this.playerAtk,
    playerDef: playerDef ?? this.playerDef,
    enemyAtk: enemyAtk ?? this.enemyAtk,
    enemyDef: enemyDef ?? this.enemyDef,
    log: log ?? this.log,
    turnCount: turnCount ?? this.turnCount,
    level: level ?? this.level,
    lastReward: lastReward ?? this.lastReward,
    playerRegen: playerRegen ?? this.playerRegen,
    cooldowns: cooldowns ?? this.cooldowns,
    shieldHp: shieldHp ?? this.shieldHp,
    charge: charge ?? this.charge,
    playerStatuses: playerStatuses ?? this.playerStatuses,
    enemyStatuses: enemyStatuses ?? this.enemyStatuses,
    playerType: playerType ?? this.playerType,
    enemyType: enemyType ?? this.enemyType,
    bossWindup: bossWindup ?? this.bossWindup,
  );
}
 
const kBeats = <DamageType, DamageType>{
  DamageType.kinetic: DamageType.acid,
  DamageType.acid: DamageType.fire,
  DamageType.fire: DamageType.emp,
  DamageType.emp: DamageType.kinetic,
};
 
double weaknessMultiplier(DamageType attacker, DamageType defender) =>
    kBeats[attacker] == defender ? 1.5 : 1.0;
    
DamageType enemyTypeForLevel(int level) =>
    DamageType.values[(level - 1) % DamageType.values.length];
    
bool isBossLevel(int level) => level % 5 == 0;
 
class EnemyConfig {
  final int hp, atk, def, spd;
  const EnemyConfig({required this.hp, required this.atk, required this.def, required this.spd});
}
 
EnemyConfig enemyForLevel(int level) {
  final l = (level - 1).clamp(0, 999);
  return EnemyConfig(
    hp: 55 + l * 25,
    atk: 9 + l * 3,
    def: 5 + l * 2,
    spd: 9 + l,
  );
}
 
class CombatNotifier extends StateNotifier<CombatState> {
  CombatNotifier(this.ref, {int initialLevel = 1}) : super(CombatState(level: initialLevel));
  final Ref ref;
 
  void startBattle({required ResolvedCombatStats player}) {
    final cfg = enemyForLevel(state.level);
    state = state.copyWith(
      phase: CombatPhase.battling,
      playerHp: player.hp, playerMaxHp: player.hp,
      enemyHp: cfg.hp, enemyMaxHp: cfg.hp,
      playerAtk: player.attack, playerDef: player.defense,
      playerRegen: player.energyRegen,
      enemyAtk: cfg.atk, enemyDef: cfg.def,
      cooldowns: {}, shieldHp: 0, charge: 0.0,
      playerStatuses: [], enemyStatuses: [],
      playerType: player.element, enemyType: enemyTypeForLevel(state.level),
      bossWindup: false,
      log: ['Battle started against Lv ${state.level} Enemy!']);
  }
 
  void retry(ResolvedCombatStats player) {
    startBattle(player: player);
  }
 
  void useAbility(Ability a) {
    if (state.phase != CombatPhase.battling) return;
    if ((state.cooldowns[a] ?? 0) > 0) return;
 
    final log = List<String>.from(state.log);
    var newState = state;
    switch (a) {
      case Ability.strike:
        final pDmg = _damage(state.playerAtk, state.enemyDef, state.playerType, state.enemyType);
        final eHp = (state.enemyHp - pDmg).clamp(0, state.enemyMaxHp);
        log.add('Strike deals $pDmg DMG!');
        newState = newState.copyWith(enemyHp: eHp);
        break;
      case Ability.shield:
        newState = newState.copyWith(shieldHp: state.shieldHp + 25);
        log.add('Shield active! (+25 absorb)');
        break;
      case Ability.repair:
        final hp = (state.playerHp + 30).clamp(0, state.playerMaxHp);
        newState = newState.copyWith(playerHp: hp);
        log.add('Repaired for 30 HP!');
        break;
    }
 
    final cd = Map<Ability, double>.from(state.cooldowns)..[a] = kAbilityCooldown[a]!;
    state = newState.copyWith(cooldowns: cd, log: log);
 
    if (state.enemyHp <= 0) {
      _winBattle();
    }
  }
 
  void tickCooldowns(double dt) {
    if (state.phase != CombatPhase.battling) return;
    final cd = Map<Ability, double>.from(state.cooldowns);
    bool changed = false;
    for (final a in cd.keys.toList()) {
      if (cd[a]! > 0) {
        cd[a] = (cd[a]! - dt).clamp(0, 999);
        changed = true;
      }
    }
    if (changed) state = state.copyWith(cooldowns: cd);
  }
 
  void _addCharge(double amount) {
    state = state.copyWith(charge: (state.charge + amount).clamp(0, 100));
  }
 
  void useOvercharge(double timingQuality) {
    if (state.charge < 100 || state.phase != CombatPhase.battling) return;
    final log = List<String>.from(state.log);
    
    // Miss zone
    if (timingQuality <= 0.4) {
      log.add('OVERCHARGE MISSED! 0 DMG.');
      state = state.copyWith(charge: 0, log: log);
      return;
    }
    
    final isPerfect = timingQuality > 0.7;
    final mult = (isPerfect ? 3.5 : 2.0) * weaknessMultiplier(state.playerType, state.enemyType);
    
    final dmg = ((state.playerAtk * mult) - state.enemyDef * 0.3).round().clamp(1, 9999);
    final eHp = (state.enemyHp - dmg).clamp(0, state.enemyMaxHp);
    
    if (isPerfect) {
      log.add('PERFECT HIT! Deals $dmg DMG!');
    } else {
      log.add('GOOD HIT! Deals $dmg DMG!');
    }
    
    final es = state.enemyStatuses.map((s) => s.copy()).toList();
    es.add(StatusEffect(StatusKind.overheat, 3, 6));
    
    state = state.copyWith(charge: 0, enemyHp: eHp, enemyStatuses: es, log: log);
    if (eHp <= 0) _winBattle();
  }
 
  int resolveStatuses(List<StatusEffect> list) {
    var dot = 0;
    for (final s in list) {
      if (s.kind == StatusKind.overheat) dot += s.magnitude;
      s.ticksLeft -= 1;
    }
    list.removeWhere((s) => s.ticksLeft <= 0);
    return dot;
  }
 
  bool isStunned(List<StatusEffect> l) => l.any((s) => s.kind == StatusKind.stun);
  bool regenBlocked(List<StatusEffect> l) => l.any((s) => s.kind == StatusKind.emp);
 
  bool tick() {
    if (state.phase != CombatPhase.battling) return false;
    final log = List<String>.from(state.log);
    
    final pStatuses = state.playerStatuses.map((s) => s.copy()).toList();
    final eStatuses = state.enemyStatuses.map((s) => s.copy()).toList();
    
    final pDot = resolveStatuses(pStatuses);
    final eDot = resolveStatuses(eStatuses);
    
    var eHp = state.enemyHp;
    var pHp = state.playerHp;
    
    if (eDot > 0) {
      eHp = (eHp - eDot).clamp(0, state.enemyMaxHp);
      log.add('Enemy takes $eDot overheat DMG. HP: $eHp');
      if (eHp <= 0) {
        state = state.copyWith(enemyHp: eHp, enemyStatuses: eStatuses, playerStatuses: pStatuses, log: log);
        _winBattle(log: log);
        return true;
      }
    }
    if (pDot > 0) {
      pHp = (pHp - pDot).clamp(0, state.playerMaxHp);
      log.add('You take $pDot overheat DMG. HP: $pHp');
    }
 
    if (!isStunned(pStatuses)) {
      final pDmg = _damage(state.playerAtk, state.enemyDef, state.playerType, state.enemyType);
      eHp = (eHp - pDmg).clamp(0, state.enemyMaxHp);
      log.add('Your robot deals $pDmg DMG. Enemy HP: $eHp');
      _addCharge(15);
    } else {
      log.add('Your robot is stunned!');
    }
 
    if (eHp <= 0) {
      state = state.copyWith(enemyHp: eHp, enemyStatuses: eStatuses, playerStatuses: pStatuses, log: log);
      _winBattle(log: log);
      return true;
    }

    if (state.bossWindup) {
      log.add('Boss is unleashing a massive attack!');
      state = state.copyWith(log: log);
      _resolveBossHit();
      return true;
    }
 
    var actualDmg = 0;
    if (!isStunned(eStatuses)) {
      actualDmg = _damage(state.enemyAtk, state.playerDef, state.enemyType, state.playerType);
    } else {
      log.add('Enemy is stunned!');
    }
 
    var sHp = state.shieldHp;
    if (sHp > 0 && actualDmg > 0) {
      final absorbed = actualDmg.clamp(0, sHp);
      actualDmg -= absorbed;
      sHp -= absorbed;
      if (absorbed > 0) log.add('Shield absorbed $absorbed DMG!');
    }
    
    final finalRegen = regenBlocked(pStatuses) ? 0 : state.playerRegen;
    pHp = (pHp - actualDmg + finalRegen).clamp(0, state.playerMaxHp);
    
    if (actualDmg > 0) log.add('Enemy deals $actualDmg DMG. Your HP: $pHp');
 
    if (pHp <= 0) {
      state = state.copyWith(phase: CombatPhase.defeat, playerHp: 0, shieldHp: 0,
          enemyHp: eHp, enemyStatuses: eStatuses, playerStatuses: pStatuses,
          log: log..add('Defeated! Robot went offline.'));
      return true;
    }
 
    state = state.copyWith(
      playerHp: pHp, enemyHp: eHp, shieldHp: sHp,
      playerStatuses: pStatuses, enemyStatuses: eStatuses,
      turnCount: state.turnCount + 1, log: log);

    if (isBossLevel(state.level) && state.enemyHp > 0 && state.enemyHp < state.enemyMaxHp * 0.5 && !state.bossWindup && state.turnCount % 4 == 0) {
      _startBossWindup();
    }
      
    return true;
  }

  void _startBossWindup() {
    state = state.copyWith(bossWindup: true, log: List.from(state.log)..add('WARNING: Boss is preparing a heavy attack!'));
  }
  
  void _resolveBossHit() {
    final blocked = state.shieldHp > 0;
    final log = List<String>.from(state.log);
    
    var raw = (state.enemyAtk * (blocked ? 0.4 : 2.5)).round();
    
    var sHp = state.shieldHp;
    if (sHp > 0) {
      final absorbed = raw.clamp(0, sHp);
      raw -= absorbed;
      sHp -= absorbed;
      log.add('Blocked heavy attack! Absorbed $absorbed DMG.');
    } else {
      log.add('Heavy attack landed unblocked! Took $raw DMG!');
    }
    
    final hp = (state.playerHp - raw).clamp(0, state.playerMaxHp);
    
    state = state.copyWith(bossWindup: false, shieldHp: sHp, playerHp: hp, log: log);
    
    if (hp <= 0) {
      state = state.copyWith(phase: CombatPhase.defeat, log: log..add('Defeated! Robot went offline.'));
    }
  }
 
  void _winBattle({List<String>? log}) {
    final boss = isBossLevel(state.level);
    final scrapReward = (10 + state.level * 5) * (boss ? 3 : 1);
    final cogsReward = boss ? 1 : 0;
    
    ref.read(economySyncProvider).grantScrap(scrapReward);
    if (cogsReward > 0) ref.read(economySyncProvider).grantCogs(cogsReward);
    
    ref.read(economySyncProvider).saveCombatLevel(state.level + 1);
    
    final l = log ?? List<String>.from(state.log);
    l.add('Victory! Enemy defeated. +$scrapReward Scrap');
    if (cogsReward > 0) l.add('Epic loot dropped! +$cogsReward Rare Cogs!');
    
    state = state.copyWith(phase: CombatPhase.victory, enemyHp: 0,
        level: state.level + 1, lastReward: scrapReward,
        log: l);
  }
 
  void reset() {
    state = CombatState(level: state.level);
  }
 
  static int _damage(int atk, int def, DamageType atkType, DamageType defType) =>
      ((atk * weaknessMultiplier(atkType, defType)) - def * 0.3).round().clamp(1, 9999);
}
