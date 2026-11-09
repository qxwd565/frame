import {resourceURL, resourceFetch} from './resource-url.mjs?ver=hscard-cbbc17dca2417691';
// Reads the unmodified HS Plus resource snapshots. No card-specific scenes are used.
const HAND_PREFABS = Object.freeze({
  MINION: 'Card_Hand_Ally', SPELL: 'Card_Hand_Ability',
  WEAPON: 'Card_Hand_Weapon', LOCATION: 'Card_Hand_Location',
  HERO: 'Card_Hand_Hero'
});

async function readGzipJson(bytes) {
  const stream = new Blob([bytes]).stream().pipeThrough(new DecompressionStream('gzip'));
  return JSON.parse(await new Response(stream).text());
}

async function unpack(value) {
  if (typeof value !== 'string') throw Error('Missing embedded HS Plus resource');
  const binary = atob(value), input = new Uint8Array(binary.length);
  for (let i = 0; i < binary.length; i++) input[i] = binary.charCodeAt(i);
  const output = await new Response(new Blob([input]).stream().pipeThrough(new DecompressionStream('gzip'))).arrayBuffer();
  if (output.byteLength > 128 * 1024 * 1024) throw Error('HS Plus resource exceeds size limit');
  return output;
}

class BinaryReader {
  constructor(buffer) { this.buffer = buffer; this.view = new DataView(buffer); this.offset = 0; }
  take(n) { if (!Number.isSafeInteger(n) || n < 0 || n > this.buffer.byteLength - this.offset) throw Error('Truncated HS Plus resource'); const at = this.offset; this.offset += n; return at; }
  int() { return this.view.getInt32(this.take(4), true); }
  string() {
    let size = 0, shift = 0, b;
    do { if (shift >= 35) throw Error('Invalid string length'); b = this.view.getUint8(this.take(1)); size += (b & 127) * 2 ** shift; shift += 7; } while (b & 128);
    return new TextDecoder('utf-8', {fatal:true}).decode(new Uint8Array(this.buffer, this.take(size), size));
  }
  floats(n) { const at = this.take(n * 4), result = new Float32Array(n); for (let i = 0; i < n; i++) { result[i] = this.view.getFloat32(at + i * 4, true); if (!Number.isFinite(result[i])) throw Error('Non-finite mesh coordinate'); } return result; }
  done() { if (this.offset !== this.buffer.byteLength) throw Error('Trailing HS Plus resource data'); }
}

export function decodeMesh(bytes) {
  const r = new BinaryReader(bytes);
  if (r.int() !== 0x314d5048) throw Error('Invalid HS Plus mesh');
  const count = r.int(), attributes = r.int(), values = new Map();
  if (count < 1 || count > 1000000 || attributes < 1 || attributes > 16) throw Error('Invalid HS Plus mesh budget');
  for (let i = 0; i < attributes; i++) {
    const name = r.string(), size = r.int();
    if (name.length > 40 || size !== count * 4 || values.has(name)) throw Error('Invalid HS Plus vertex layout');
    values.set(name, r.floats(size));
  }
  const n = r.int();
  if (n < 3 || n > 6000000 || n % 3) throw Error('Invalid HS Plus triangle count');
  const indices = new Uint32Array(n);
  for (let i = 0; i < n; i++) { const value = r.int(); if (value < 0 || value >= count) throw Error('Invalid HS Plus vertex index'); indices[i] = value; }
  r.done();
  if (!values.has('POSITION0')) throw Error('Missing HS Plus vertex positions');
  return {count, attributes:values, indices};
}

export function decodeTexture(bytes) {
  const r = new BinaryReader(bytes);
  if (r.int() !== 0x31545048) throw Error('Invalid HS Plus texture');
  const width = r.int(), height = r.int(), format = r.int(), count = r.int(), levels = [];
  if (width < 1 || height < 1 || width > 16384 || height > 16384 || count < 1 || count > 15) throw Error('Invalid HS Plus texture budget');
  for (let i = 0; i < count; i++) { const n = r.int(); if (n < 1 || n > 128 * 1024 * 1024) throw Error('Invalid HS Plus mip level'); levels.push(new Uint8Array(r.buffer, r.take(n), n)); }
  r.done();
  return {width, height, format, levels};
}

export function originalClasses(card) {
  const names = ['NEUTRAL','DEATHKNIGHT','DRUID','HUNTER','MAGE','PALADIN','PRIEST','ROGUE','SHAMAN','WARLOCK','WARRIOR','HUNTER','NEUTRAL','NEUTRAL','DEMONHUNTER'];
  let mask = Number(card.tags?.[476] || 0) >>> 0, tag = 1;
  const classes = [];
  while (mask) {
    if (mask & 1) { if (tag >= names.length) throw Error('Unsupported HS Plus class tag'); classes.push(names[tag]); }
    tag++; mask >>>= 1;
  }
  // A single-class tag from a current catalog must not override a resolved
  // historical class. Keep native multi-class masks when compatible with the
  // resolved class (or when NEUTRAL represents a multi-class card).
  const primary = card.cardClass || 'NEUTRAL';
  if (classes.length > 1 && (primary === 'NEUTRAL' || classes.includes(primary))) return classes;
  return [primary];
}

export function sourceCard(info, golden = false) {
  if (!info?.native || info.native.descriptionError || typeof golden !== 'boolean') throw Error('Card has no supported original HS Plus text');
  const tags = info.native.tags || {}, tag = n => Number(tags[n] || 0);
  const races = info.races?.length ? info.races : info.race ? [info.race] : [];
  return {id:info.id, dbfId:info.dbfId, kind:info.type, cardClass:info.cardClass, golden,
    name:info.native.name, text:info.native.description, rarity:info.rarity || 'FREE',
    race:races.join(','), school:info.spellSchool || '', set:info.set || '',
    watermark:info.native.watermark || '', cost:tag(48), attack:tag(47), health:tag(45),
    durability:tag(187), armor:tag(292), tags};
}

function uniqueBy(values, key, label) {
  const result = new Map();
  for (const value of values) {
    const id = key(value);
    if (typeof id !== 'string' || !id || result.has(id)) throw Error('Invalid or duplicate ' + label);
    result.set(id, value);
  }
  return result;
}

export class HSPlusSources {
  static async load(frameBytes, textBytes) {
    const [frames, text] = await Promise.all([readGzipJson(frameBytes), readGzipJson(textBytes)]);
    return new HSPlusSources(frames, text);
  }

  constructor(frames, text) {
    if (frames.schema !== 1 || text.schema !== 1 || !Array.isArray(frames.prefabs) ||
        !Array.isArray(frames.assets) || !Array.isArray(text.prefabs)) throw Error('Unsupported HS Plus resource schema');
    this.frames = frames;
    this.text = text;
    this.framePrefabs = uniqueBy(frames.prefabs, x => x.name, 'frame prefab');
    this.textPrefabs = uniqueBy(text.prefabs, x => x.name, 'text prefab');
    this.assets = uniqueBy(frames.assets, x => x.key.toLowerCase(), 'asset');
    this.textureLoads = new Map();
    this.textureBytes = 0;
  }

  card(kind, golden = false) {
    const base = HAND_PREFABS[kind];
    if (!base || typeof golden !== 'boolean') throw Error('Unsupported constructed card type');
    const name = base + (golden ? '_Premium' : '');
    const frame = this.framePrefabs.get(name), text = this.textPrefabs.get(name);
    if (!frame || !text || !Array.isArray(frame.nodes) || !Array.isArray(text.bindings)) throw Error('Missing HS Plus prefab ' + name);
    return {name, frame, text};
  }

  textConfiguration(kind, golden, role, locale = 4) {
    const {text} = this.card(kind, golden), matches = text.bindings.filter(x => x.role === role);
    if (matches.length !== 1) throw Error('Missing or ambiguous HS Plus text binding ' + role);
    const binding = matches[0];
    let key = binding.font;
    const locales = binding.settings.m_LocalizedSettings?.m_LocaleAdjustments?.Array || [];
    const localized = locales.find(x => Number(x.m_Locale) === locale);
    if (localized && String(localized.m_Font.m_PathID) !== '0') {
      const external = Number(localized.m_Font.m_FileID);
      const cab = external === 0 ? binding.source.slice(0, binding.source.lastIndexOf(':')) : binding.externals[external - 1];
      if (!cab) throw Error('Missing localized font reference');
      key = cab + ':' + localized.m_Font.m_PathID;
    }
    let found = this.text.fonts.filter(x => x.cab + ':' + x.pathId === key);
    if (found.length !== 1) throw Error('Missing or ambiguous HS Plus font');
    let selected = found[0];
    const settings = {...binding.settings};
    if (locale === 4) {
      const definitions = this.text.definitions.filter(x => x.settings.m_Name === selected.name);
      if (definitions.length > 1) throw Error('Ambiguous HS Plus font definition');
      if (definitions.length === 1) {
        const definition = definitions[0];
        for (const [name, value] of Object.entries(definition.settings)) if (name.endsWith('Modifier') || name === 'm_SingleLineAdjustment') settings[name] = value;
        found = this.text.fonts.filter(x => x.cab + ':' + x.pathId === definition.font);
        if (found.length !== 1) throw Error('Missing or ambiguous Korean font');
        selected = found[0];
      }
    }
    return {binding, font:selected.name, settings};
  }

  // Mirrors the constructed-card visibility switches in LocalCardComposer.
  // Attachments such as runes and faction banners require their own source data.
  baseFrameNodes(card) {
    const {frame} = this.card(card.kind, card.golden), nodes = new Map(frame.nodes.map(n => [n.source.toLowerCase(), n]));
    const tags = card.tags || {};
    const reference = key => {
      const target = frame.actor?.[key]?.ref;
      if (!target) return null;
      const owner = frame.nodes.find(n => (n.componentSources || []).some(x => x.toLowerCase() === target.toLowerCase()));
      return (owner?.source || target).toLowerCase();
    };
    const visibility = new Map(), toggle = (key, value) => { const ref = reference(key); if (ref) visibility.set(ref, value); };
    const hasGem = ['COMMON','RARE','EPIC','LEGENDARY'].includes(card.rarity), race = card.race || '';
    if (card.kind === 'LOCATION') toggle('m_rarityNoGemMesh', !hasGem);
    toggle('m_attackObject', card.kind === 'MINION' || card.kind === 'WEAPON' || card.kind === 'HERO' && card.attack > 0);
    toggle('m_eliteObject', card.rarity === 'LEGENDARY');
    toggle('m_racePlateObject', !!race && !race.includes(','));
    toggle('m_multiRacePlateObject', !!race && race.includes(','));
    toggle('m_cardRuneBanner', false);
    toggle('m_armorObject', card.armor > 0);
    toggle('m_tierShieldObject', false);
    toggle('m_tierStarsObject', false);
    toggle('m_baconCoinObject', false);
    toggle('m_speedWingObject', false);
    toggle('m_multiclassRibbon', originalClasses(card).length > 2);
    toggle('m_rarityGemMesh', hasGem);
    toggle('m_rarityFrameMesh', hasGem);
    const runeTypes = [];
    for (let type = 1; type <= 3; type++) {
      const count = Number(tags[2195 + type] || 0);
      if (!Number.isInteger(count) || count < 0 || count > 3 || runeTypes.length + count > 3) throw Error('Invalid rune count');
      for (let i = 0; i < count; i++) runeTypes.push(type);
    }
    const roots = frame.nodes.flatMap(n => n.components || []).filter(c => Object.hasOwn(c, 'm_runeSlotVisuals'));
    if (roots.length > 1) throw Error('Ambiguous rune root');
    if (roots.length) {
      const root = roots[0];
      const nodeFor = reference => {
        const key = reference?.ref?.toLowerCase();
        const found = frame.nodes.filter(n => n.source.toLowerCase() === key || (n.componentSources || []).some(x => x.toLowerCase() === key));
        if (found.length !== 1) throw Error('Missing or ambiguous rune node');
        return found[0];
      };
      const show = (reference, on) => { if (reference?.ref) visibility.set(nodeFor(reference).source.toLowerCase(), on); };
      show(root.m_GameObject, runeTypes.length > 0); show(root.m_visualContainer, runeTypes.length > 0);
      show(root.m_runeBannerBackground, runeTypes.length > 0); show(root.m_highlight, false);
      for (const [index, ref] of root.m_runeSlotVisuals.Array.entries()) {
        const owner = nodeFor(ref);
        const options = (owner.components || []).filter(c => c.m_GameObject?.ref === owner.source && Object.hasOwn(c, 'm_deckRuneSlots'));
        if (options.length !== 1) throw Error('Missing rune layout');
        const layout = options[0], chosen = index === runeTypes.length - 1;
        show(layout.m_deckRunesContainer, chosen);
        if (!chosen) continue;
        for (const entry of layout.m_deckRuneSlots.Array) {
          const components = (nodeFor(entry).components || []).filter(c => Object.hasOwn(c, 'm_runeAssetTable'));
          if (components.length !== 1) throw Error('Missing rune slot');
          show(components[0].m_runeRenderer, true); show(components[0].m_highlightRenderer, false);
        }
      }
    } else if (runeTypes.length) throw Error('Missing rune root');
    const cardMesh = reference('m_cardMesh'), result = [];
    for (const node of frame.nodes) {
      if ((!node.mesh && !node.particleSettings) || !node.materials || node.tag === 'FakeShadow' || node.tag === 'FakeShadowUnique') continue;
      let current = node, visible = true, forced = false;
      while (current) {
        const key = current.source.toLowerCase(), controlled = visibility.has(key), on = visibility.get(key);
        if (controlled && on) forced = true;
        if (controlled ? !on : !current.active) { visible = false; break; }
        if (current.parent && !nodes.has(current.parent.toLowerCase())) throw Error('Missing frame parent');
        current = current.parent ? nodes.get(current.parent.toLowerCase()) : null;
      }
      if (!visible || !node.enabled && !forced) continue;
      if (node.particleSettings && !node.particleFrame) throw Error('Uncaptured HS Plus particle frame');
      for (let slot = 0; slot < node.materials.length; slot++) {
        if (!node.materials[slot]) continue;
        // Back face is excluded by the source composer; portrait exceptions are
        // handled once the installed-game artwork material has been loaded.
        if (node.source.toLowerCase() === cardMesh && slot === Number(frame.actor.m_cardBackMatIdx)) continue;
        const mat = this.asset(node.materials[slot]);
        if (node.path.endsWith('/CostObject/Gem_Mana/CostGem_DropShadow_Mesh') && mat.name.startsWith('Card_Location_InHand_Shadow_Mat')) continue;
        if (node.path.endsWith('/RuneHolder_Shadow_Mesh') && mat.name.startsWith('RuneBanner_Card_Shadow_Mat')) continue;
        result.push({path:node.path,slot});
      }
    }
    const factions = [482,484,483,3457,3458,3469], faction = factions.findIndex(key => Number(tags[key] || 0)) + 1;
    const shown = {Faction_Banner:faction > 0, Tradeable_Banner:!!Number(tags[1720] || 0), Forgeable_Banner:!!Number(tags[2785] || 0), Prepareable_Banner:!!Number(tags[4354] || 0)};
    for (const container of frame.nodes.filter(n => n.nestedPrefab && shown[n.nestedPrefab])) {
      const prefab = this.framePrefabs.get(container.nestedPrefab);
      if (!prefab) throw Error('Missing HS Plus banner prefab');
      const nested = new Map(prefab.nodes.map(n => [n.source.toLowerCase(), n]));
      for (const node of prefab.nodes) {
        if (!node.mesh || !node.materials || !node.enabled || node.tag === 'FakeShadow' || node.tag === 'FakeShadowUnique') continue;
        let current = node, visible = true;
        while (current) {
          if (!current.active) { visible = false; break; }
          if (current.parent && !nested.has(current.parent.toLowerCase())) throw Error('Missing banner parent');
          current = current.parent ? nested.get(current.parent.toLowerCase()) : null;
        }
        if (!visible) continue;
        for (let slot = 0; slot < node.materials.length; slot++) {
          const key = node.materials[slot]; if (!key) continue;
          if (container.nestedPrefab === 'Faction_Banner' && node.path.endsWith('/ShadowQuad') && this.asset(key).name.startsWith('TradeableBanner_shadow')) continue;
          result.push({path:container.path + '/' + node.path,slot});
        }
      }
    }
    return result;
  }

  asset(key) {
    const asset = this.assets.get(String(key).toLowerCase());
    if (!asset) throw Error('Missing HS Plus asset ' + key);
    return asset;
  }

  material(key) {
    const source = this.asset(key);
    if (source.type !== 21 || !source.properties) throw Error('HS Plus material must be loaded from the game: ' + key);
    const p = source.properties, saved = p.m_SavedProperties;
    const rows = value => Array.isArray(value) ? value : value?.Array;
    let keywords = [];
    if (p.m_ValidKeywords) keywords = rows(p.m_ValidKeywords);
    else if (p.m_ShaderKeywords) keywords = p.m_ShaderKeywords.split(' ').filter(Boolean);
    const values = {}, textures = {};
    for (const row of rows(saved.m_Floats)) { if (Object.hasOwn(values, row.first)) throw Error('Duplicate material value'); values[row.first] = [Number(row.second)]; }
    for (const row of rows(saved.m_Colors)) { if (Object.hasOwn(values, row.first)) throw Error('Duplicate material value'); const c = row.second; values[row.first] = [Number(c.r),Number(c.g),Number(c.b),Number(c.a)]; }
    for (const row of rows(saved.m_TexEnvs)) {
      const t = row.second, reference = t.m_Texture.ref;
      if (reference === null) continue;
      const asset = this.asset(reference);
      if (asset.type !== 28 || !(asset.textureData || asset.textureFile)) throw Error('Missing HS Plus material texture');
      if (Object.hasOwn(textures, row.first)) throw Error('Duplicate material texture');
      textures[row.first] = {key:reference, sampler:asset.sampler, st:[Number(t.m_Scale.x),Number(t.m_Scale.y),Number(t.m_Offset.x),Number(t.m_Offset.y)]};
    }
    return {shader:source.shader, keywords, values, textures};
  }

  async meshes(key) {
    const item = this.asset(key);
    if (item.type !== 43 || !Array.isArray(item.meshData)) throw Error('HS Plus mesh must be loaded from the game: ' + key);
    return Promise.all(item.meshData.map(async value => decodeMesh(await unpack(value))));
  }

  texture(key) {
    const item = this.asset(key);
    if (item.type !== 28) throw Error('HS Plus texture must be loaded from the game: ' + key);
    let entry = this.textureLoads.get(item);
    if (entry) {
      this.textureLoads.delete(item);
      this.textureLoads.set(item, entry);
      return entry.promise;
    }
    // Every card referring to the same native texture must share both the
    // download and the decoded object used as the GPU texture cache key.
    entry = {bytes: 0, pending: true};
    entry.promise = this.loadTexture(item).then(pixels => {
      entry.pending = false;
      entry.bytes = pixels.levels.reduce((sum, level) => sum + level.byteLength, 0);
      this.textureBytes += entry.bytes;
      for (const [asset, cached] of this.textureLoads) {
        if (this.textureBytes <= 64 * 1024 * 1024 && this.textureLoads.size <= 256) break;
        if (cached.pending) continue;
        this.textureLoads.delete(asset);
        this.textureBytes -= cached.bytes;
      }
      return pixels;
    }).catch(error => {
      if (this.textureLoads.get(item) === entry) this.textureLoads.delete(item);
      throw error;
    });
    this.textureLoads.set(item, entry);
    return entry.promise;
  }

  async loadTexture(item) {
    if (item.textureData) return decodeTexture(await unpack(item.textureData));
    // The installed-game texture bytes are now stored separately, so the
    // browser does not download 260 textures before the first visible card.
    if (!/^frame-textures\/[a-f0-9]{32}\.bin$/.test(item.textureFile || '')) {
      throw Error('Missing HS Plus frame texture ' + item.key);
    }
    const response = await resourceFetch(resourceURL(item.textureFile), {credentials:'same-origin'});
    if (!response.ok) throw Error('HS Plus frame texture HTTP ' + response.status);
    const stream = response.body || new Blob([await response.arrayBuffer()]).stream();
    const bytes = await new Response(stream.pipeThrough(new DecompressionStream('gzip'))).arrayBuffer();
    if (bytes.byteLength > 128 * 1024 * 1024) throw Error('HS Plus resource exceeds size limit');
    return decodeTexture(bytes);
  }
}
