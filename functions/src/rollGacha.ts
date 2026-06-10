import { onCall, HttpsError } from 'firebase-functions/v2/https';
import { getRemoteConfig } from 'firebase-admin/remote-config';
import { getFirestore, FieldValue, Timestamp } from 'firebase-admin/firestore';
import { initializeApp } from 'firebase-admin/app';
import { randomInt, randomUUID } from 'crypto';
 
initializeApp();
const db = getFirestore();
 
type Rarity = 'common' | 'rare' | 'epic';
interface LootTable {
  version: number;
  cost: { currency: string; amount: number };
  pity: { epicAt: number };
  weights: Record<Rarity, number>;
  pools: Record<Rarity, string[]>;
}
 
async function loadLootTable(): Promise<LootTable> {
  const tmpl = await getRemoteConfig().getServerTemplate();
  const cfg = tmpl.evaluate();
  const raw = cfg.getString('loot_table_standard_v1');
  if (!raw) throw new HttpsError('failed-precondition', 'Loot table missing.');
  return JSON.parse(raw) as LootTable;
}
 
/** Crypto-seeded weighted rarity draw. */
function drawRarity(weights: Record<Rarity, number>): Rarity {
  const total = weights.common + weights.rare + weights.epic;
  let roll = randomInt(total); // [0, total)
  for (const r of ['common', 'rare', 'epic'] as Rarity[]) {
    if (roll < weights[r]) return r;
    roll -= weights[r];
  }
  return 'common';
}
 
export const rollGacha = onCall({ region: 'us-central1' }, async (req) => {
  const uid = req.auth?.uid;
  if (!uid) throw new HttpsError('unauthenticated', 'Sign in required.');
 
  const loot = await loadLootTable();
  const profileRef = db.doc(`users/${uid}/meta/profile`);
  const moduleId = randomUUID();
  const moduleRef = db.doc(`users/${uid}/modules/${moduleId}`);
  const pullRef = db.doc(`users/${uid}/pulls/${moduleId}`);
 
  return db.runTransaction(async (tx) => {
    const snap = await tx.get(profileRef);
    if (!snap.exists) throw new HttpsError('not-found', 'Profile missing.');
    const data = snap.data()!;
 
    // 1) Validate & deduct currency.
    const balance = (data.currencies?.[loot.cost.currency] ?? 0) as number;
    if (balance < loot.cost.amount) {
      throw new HttpsError('failed-precondition', 'Insufficient currency.');
    }
 
    // 2) Pity: force epic at threshold, else weighted draw.
    const pity = (data.pity?.epicCounter ?? 0) as number;
    const forcedEpic = pity + 1 >= loot.pity.epicAt;
    const rarity: Rarity = forcedEpic ? 'epic' : drawRarity(loot.weights);
 
    // 3) Pick a def from the pool (crypto index).
    const pool = loot.pools[rarity];
    if (!pool || pool.length === 0) {
      throw new HttpsError('internal', `Empty pool: ${rarity}`);
    }
    const defId = pool[randomInt(pool.length)];
    const nextPity = rarity === 'epic' ? 0 : pity + 1;
 
    // 4) Apply all writes atomically.
    tx.update(profileRef, {
      [`currencies.${loot.cost.currency}`]: FieldValue.increment(-loot.cost.amount),
      'pity.epicCounter': nextPity,
      economyVersion: FieldValue.increment(1),
    });
    tx.set(moduleRef, {
      defId,
      rarity,
      level: 1,
      equippedRobotId: null,
      acquiredAt: Timestamp.now(),
    });
    tx.set(pullRef, {
      defId,
      rarity,
      tableVersion: loot.version,
      cost: loot.cost,
      forcedEpic,
      at: Timestamp.now(),
    });
 
    return { instanceId: moduleId, defId, rarity, forcedEpic, pity: nextPity };
  });
});
