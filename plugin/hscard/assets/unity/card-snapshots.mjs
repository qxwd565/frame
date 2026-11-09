/**
 * HScard strict dates-v1 card snapshots.
 * data/<CARD_ID>.json is the ONLY source of date-dependent card fields.
 * cards.json is a separate set inventory and must never be used as a fallback.
 *
 * All renderers, deck tiles and future card galleries share this module.
 */
const rawCache = new Map();
const snapshotCache = new Map();
const deckSources = new WeakMap();
const DATE = /^(\d{4})-(\d{2})-(\d{2})$/;
const SAFE_ID = /^[A-Za-z0-9_]{1,96}$/;
const MAX_BODY_BYTES = 1024 * 1024;
const MAX_HISTORY_ENTRIES = 500;
const MAX_CACHE = 512;
const FETCH_LIMIT = 8;
const pending = [];
let active = 0;

export function validKoreanDate(value) {
  const m = typeof value === 'string' && DATE.exec(value);
  if (!m) return false;
  const y = Number(m[1]), month = Number(m[2]), day = Number(m[3]);
  const date = new Date(Date.UTC(y, month - 1, day));
  return date.getUTCFullYear() === y && date.getUTCMonth() === month - 1 && date.getUTCDate() === day;
}

function object(value) {
  return value !== null && typeof value === 'object' && !Array.isArray(value);
}

function cloneValue(value) {
  if (Array.isArray(value)) return value.map(cloneValue);
  if (object(value)) {
    const result = Object.create(null);
    for (const [key, part] of Object.entries(value)) {
      if (key !== '__proto__' && key !== 'constructor' && key !== 'prototype') result[key] = cloneValue(part);
    }
    return result;
  }
  return value;
}

/**
 * No legacy conversion: `card`, `patches`, `history` and undated card records
 * are rejected. Every entry after the first is an atomic field replacement.
 */
export function prepareHistory(json) {
  if (!object(json) || Object.hasOwn(json, 'card') || Object.hasOwn(json, 'patches') || Object.hasOwn(json, 'history')) {
    throw new Error('Unsupported legacy card JSON; a date-keyed document is required');
  }
  const entries = Object.entries(json).filter(([key]) => validKoreanDate(key));
  if (!entries.length || entries.length > MAX_HISTORY_ENTRIES) throw new Error('Missing or excessive date-keyed card records');
  entries.sort(([a], [b]) => a.localeCompare(b));
  // First entry must be complete enough to render without any later patch.
  if (!object(entries[0][1]) || typeof entries[0][1].name !== 'string' || typeof entries[0][1].type !== 'string') {
    throw new Error('First dated record must contain name and type');
  }
  for (const [date, delta] of entries) {
    if (!object(delta)) throw new Error('Invalid dated card values at ' + date);
    for (const key of Object.keys(delta)) {
      if (key === '__proto__' || key === 'constructor' || key === 'prototype') throw new Error('Unsafe card field');
    }
  }
  const meta = object(json.meta) ? cloneValue(json.meta) : (object(json.metadata) ? cloneValue(json.metadata) : Object.create(null));
  for (const [key,value] of Object.entries(json)) {
    if (!validKoreanDate(key) && key !== 'meta' && key !== 'metadata' && key !== '__proto__' && key !== 'constructor' && key !== 'prototype') meta[key] = cloneValue(value);
  }
  // Metadata is NOT merged into the snapshot: fields added later must not
  // accidentally appear in historical cards.
  return {entries, meta};
}

export function snapshotOnDate(history, target) {
  if (!validKoreanDate(target)) throw new Error('Invalid Korean calendar date');
  const {entries, meta} = history;
  if (!Array.isArray(entries) || !entries.length) throw new Error('Invalid prepared history');
  if (target < entries[0][0]) return null; // The card did not exist yet.
  const state = Object.create(null);
  for (const [date, delta] of entries) {
    if (date > target) break;
    for (const [key, value] of Object.entries(delta)) {
      if (key === '__proto__' || key === 'constructor' || key === 'prototype') throw new Error('Unsafe card field');
      if (key === 'mana' || key === 'cost') {
        // Both field spellings denote one stat. Mixing them across dates
        // must never resurrect an older mana value.
        if (value === null) { delete state.mana; delete state.cost; }
        else { state.mana = cloneValue(value); state.cost = cloneValue(value); }
      } else if (value === null) delete state[key];
      else state[key] = cloneValue(value); // Arrays and objects REPLACE, never merge.
    }
  }
  if (typeof state.name !== 'string' || typeof state.type !== 'string') {
    throw new Error('Initial date record is missing required name/type');
  }
  return {state, meta, firstDate: entries[0][0], target};
}

function pump() {
  while (active < FETCH_LIMIT && pending.length) {
    const {task, resolve, reject} = pending.shift();
    active++;
    Promise.resolve().then(task).then(resolve, reject).finally(() => {active--; pump();});
  }
}
function limited(task) { return new Promise((resolve,reject) => {pending.push({task,resolve,reject});pump();}); }
function bounded(map) { while (map.size > MAX_CACHE) map.delete(map.keys().next().value); }

function safeURL(url) {
  try {
    const candidate = new URL(url, typeof document !== 'undefined' ? document.baseURI : 'https://invalid.local/');
    if (candidate.protocol !== 'https:' && !(typeof location !== 'undefined' && candidate.origin === location.origin && candidate.protocol === 'http:')) return '';
    // WordPress may use either pretty REST paths or query-based REST routes.
    const validFile = /\/data\/[A-Za-z0-9_]{1,96}\.json$/.test(candidate.pathname);
    const validRestPath = /\/hscard\/v1\/card\/[a-z0-9_-]+\/[A-Za-z0-9_]+$/.test(candidate.pathname);
    const queryRoute = candidate.searchParams.get('rest_route') || '';
    const validQueryRoute = /\/hscard\/v1\/card\/[a-z0-9_-]+\/[A-Za-z0-9_]+$/.test(queryRoute);
    if (validQueryRoute && typeof location !== 'undefined' && candidate.origin !== location.origin) return '';
    return validFile || validRestPath || validQueryRoute ? candidate.href : '';
  } catch { return ''; }
}

/** Fetch once per card URL, even with simultaneous copies or dates. */
export function loadCardHistory(url) {
  const key = safeURL(url);
  if (!key) return Promise.reject(new Error('Missing or invalid dates-v1 card URL'));
  if (rawCache.has(key)) return rawCache.get(key);
  const promise = limited(async () => {
    // When a source was just migrated from old card/patches JSON, the
    // browser's HTTP cache can still hold that obsolete representation. Only
    // a strict schema mismatch triggers ONE cache-bypassing retry: no legacy
    // decoding or historical fallback is ever performed.
    const read = async(cacheMode) => {
      const res = await fetch(key, {mode:'cors', credentials:'omit', cache:cacheMode});
      if (!res.ok) throw new Error('Card dates-v1 HTTP ' + res.status);
      const length = Number(res.headers.get('content-length') || 0);
      if (length > MAX_BODY_BYTES) throw new Error('Card dates-v1 JSON too large');
      const body = await res.text();
      if (new TextEncoder().encode(body).byteLength > MAX_BODY_BYTES) throw new Error('Card dates-v1 JSON too large');
      return JSON.parse(body);
    };
    const first = await read('default');
    try { return prepareHistory(first); }
    catch (error) {
      if (!/Unsupported legacy card JSON|date-keyed card records/.test(String(error?.message||error))) throw error;
      return prepareHistory(await read('reload'));
    }
  }).catch(error => {rawCache.delete(key);throw error;});
  rawCache.set(key,promise); bounded(rawCache); return promise;
}

export async function loadCardSnapshot(url, date) {
  const key = safeURL(url);
  if (!key || !validKoreanDate(date)) throw new Error('Invalid card URL or date');
  const cacheKey = key + '@' + date;
  if (snapshotCache.has(cacheKey)) return snapshotCache.get(cacheKey);
  const promise = loadCardHistory(key).then(prepared => snapshotOnDate(prepared,date)).catch(error => {snapshotCache.delete(cacheKey);throw error;});
  snapshotCache.set(cacheKey,promise);bounded(snapshotCache);return promise;
}

export function invalidateCard(url) {
  const key = safeURL(url);
  rawCache.delete(key);
  for (const name of snapshotCache.keys()) if (name.startsWith(key + '@')) snapshotCache.delete(name);
}

export function cardSourceURL(element, cardId) {
  if (!SAFE_ID.test(cardId)) return '';
  const deck = element.closest?.('[data-hscard-card-urls]');
  if (!deck) return '';
  if (!deckSources.has(deck)) {
    let parsed = {};
    try {const raw = JSON.parse(deck.dataset.hscardCardUrls || '{}');if (object(raw)) parsed = raw;} catch {}
    deckSources.set(deck, parsed);
  }
  const base = deckSources.get(deck);
  const source = element.dataset.hscardCard ? (() => { try {return JSON.parse(element.dataset.hscardCard);} catch {return {};} })() : {};
  return safeURL(base[String(source.dbfId)] || '');
}

export function artUrlForSnapshot(raw, dataUrl) {
  if (typeof raw !== 'string' || !raw) return '';
  if (/^https:\/\/[^\s<>]+$/i.test(raw)) return raw;
  if (!/^art\/[A-Za-z0-9_/-]+\.(png|jpe?g|webp)$/i.test(raw) || raw.includes('..')) return '';
  try {
    const u = new URL(dataUrl);
    if (/\/data\/[A-Za-z0-9_]+\.json$/.test(u.pathname)) return new URL('../' + raw, u).href;
    return '';
  } catch {return '';}
}

/** Validates only the data needed by a renderer; the full snapshot is retained. */
export function normalizeForRender(snapshot, identity) {
  if (!snapshot) return null;
  const {state: s, meta} = snapshot;
  const type = String(s.type || '').toUpperCase();
  if (!/^[A-Z_]{1,32}$/.test(type)) throw new Error('Invalid card type');
  const number = (key, alternate) => {
    const n = Object.hasOwn(s,key) ? s[key] : (alternate && Object.hasOwn(s,alternate) ? s[alternate] : undefined);
    if (n === undefined) return undefined;
    if (typeof n !== 'number' || !Number.isInteger(n) || n < 0 || n > 32767) throw new Error('Invalid numeric card field ' + key);
    return n;
  };
  const cost = number('cost','mana');
  const attack = number('attack'),health=number('health'),durability=number('durability'),armor=number('armor');
  const validStats = {
    MINION: {attack, health}, SPELL: {}, WEAPON: {attack,durability},
    HERO: {armor}, LOCATION: {durability}, HERO_POWER: {}, ENCHANTMENT: {}
  };
  const stats = validStats[type];
  if (!stats) throw new Error('Unsupported card type ' + type);
  const className = typeof s.cardClass === 'string' ? s.cardClass : (typeof s.class === 'string' ? s.class : 'NEUTRAL');
  const races = Array.isArray(s.races) ? s.races : (typeof s.race === 'string' && s.race ? [s.race] : []);
  const tags = Array.isArray(s.nativeTags) ? s.nativeTags.filter(t => object(t) && Number.isInteger(t.id) && Number.isFinite(t.value)).map(cloneValue) : [];
  return {
    ...stats, raw: s, metadata:meta, id:identity.id, dbfId:identity.dbfId,
    type, name:s.name, text:typeof s.text==='string'?s.text:'',
    cost, cardClass:String(className).toUpperCase(),rarity:typeof s.rarity==='string'?s.rarity.toUpperCase():'FREE',
    race:typeof s.race==='string'?s.race:'', races, school:typeof s.spellSchool==='string'?s.spellSchool:(typeof s.school==='string'?s.school:''),
    art: typeof s.art==='string'?s.art:undefined,
    watermark: typeof s.watermark==='string'?s.watermark:'',
    set: typeof s.set==='string'?s.set:(typeof meta.set==='string'?meta.set:''),
    nativeTags:tags,mechanics:Array.isArray(s.mechanics)?s.mechanics.filter(x=>typeof x==='string'):[],
    classes:Array.isArray(s.classes)?s.classes.filter(x=>typeof x==='string'):[],
    runes:Array.isArray(s.runes)?s.runes.filter(x=>typeof x==='string'):(s.runes&&object(s.runes)?cloneValue(s.runes):[]),
    relatedIds:Array.isArray(s.relatedIds)?cloneValue(s.relatedIds):[],
    parentId:typeof s.parentId==='string'?s.parentId:'',
    collectible:typeof s.collectible==='boolean'?s.collectible:undefined,
  };
}

export const __test = {rawCache,snapshotCache,safeURL};
