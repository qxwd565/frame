/** Resources live in the corresponding expansion API's frame/ directory. */
import index from './frame-api-index.json?ver=hscard-3058f5ccf1f1cda6' with {type:'json'};
const META = 'meta[name="hscard-resource-base"]';
export const FRAME_API_BASE = 'https://raw.githubusercontent.com/qxwd565/legacy/main/frame/';
const EARLY_PREFIX='historical-frames/early-native/', EARLY_ROUTES=EARLY_PREFIX+'routes.json.gz';
let cachedBase = null;
let earlyRoutes = null;

export function resourceBase() {
  if (cachedBase) return cachedBase;
  const value = globalThis.document?.querySelector(META)?.content?.trim() || FRAME_API_BASE;
  let url;
  try { url = new URL(value); } catch { throw new Error('Invalid HSCARD_ASSET_BASE_URL'); }
  if (!['https:', 'http:'].includes(url.protocol) || url.username || url.password || url.hash || url.search || !url.pathname.endsWith('/')) {
    throw new Error('Invalid HSCARD_ASSET_BASE_URL: expected absolute HTTP(S) directory URL');
  }
  if (url.protocol === 'http:' && globalThis.location?.protocol === 'https:') throw new Error('Insecure HSCARD_ASSET_BASE_URL: HTTPS required');
  cachedBase = url;
  return cachedBase;
}

function validPath(path) {
  if (typeof path !== 'string' || !path || path.startsWith('/') || path.includes('..') || path.includes('\\') || /(?:^|\/)\./.test(path) || /[?#%\x00-\x1f]/.test(path)) {
    throw new Error('Invalid HScard resource path');
  }
}

function indexedURL(path,record){
    const repo = record && index.repositories[record.repository];
    if (!repo || !/^[a-f0-9]{40}$/.test(repo.commit)) throw Error('Unpublished expansion frame resource: ' + path);
    const expected = `https://raw.githubusercontent.com/${index.owner}/${record.repository}/${repo.commit}/frame/`;
    if (repo.base !== expected) throw Error('Invalid expansion frame origin');
    return new URL(path.split('/').map(encodeURIComponent).join('/'), repo.base);
}

export function resourceURL(path) {
  validPath(path);
  const root = resourceBase();
  if (root.href === FRAME_API_BASE && !path.endsWith('/')) {
    return indexedURL(path,index.files[path]);
  }
  const url = new URL(path, root);
  if (!url.href.startsWith(root.href)) throw new Error('HScard resource outside asset directory');
  return url;
}

async function earlyRecord(path){
  if(!earlyRoutes)earlyRoutes=(async()=>{
    const response=await resourceFetch(resourceURL(EARLY_ROUTES));
    if(!response.ok)throw Error('Original frame routes HTTP '+response.status);
    const routes=await new Response(response.body.pipeThrough(new DecompressionStream('gzip'))).json();
    if(routes.schema!==1||!routes.files||typeof routes.files!=='object'||Array.isArray(routes.files))throw Error('Invalid original frame routes');
    return routes.files;
  })().catch(error=>{earlyRoutes=null;throw error;});
  const record=(await earlyRoutes)[path];
  if(!record||!Number.isSafeInteger(record.bytes)||record.bytes<0||!/^[a-f0-9]{64}$/.test(record.sha256||''))throw Error('Unpublished expansion frame resource: '+path);
  return record;
}

/** Also resolves relative paths inside historical catalogs. Their original
 * filenames and checksums are retained even when dependencies live in a
 * different expansion. No global fetch hook and no silent old-CDN fallback. */
export async function resourceFetch(input, options = {}) {
  const source = new URL(input), root = resourceBase();
  let path;
  if (source.href.startsWith(root.href)) path = decodeURIComponent(source.pathname.slice(root.pathname.length));
  else if (root.href === FRAME_API_BASE) {
    for (const repo of Object.values(index.repositories)) {
      if (source.href.startsWith(repo.base)) { path = decodeURIComponent(source.pathname.slice(new URL(repo.base).pathname.length)); break; }
    }
  }
  if (!path) throw Error('Resource outside configured frame APIs');
  validPath(path);
  let record=index.files[path];
  if(!record&&root.href===FRAME_API_BASE&&path.startsWith(EARLY_PREFIX))record=await earlyRecord(path);
  const url = root.href===FRAME_API_BASE&&record?indexedURL(path,record):resourceURL(path);
  if (root.href !== FRAME_API_BASE) url.search = source.search;
  // Match <link as="fetch" crossorigin="anonymous"> so its response is reused.
  // Cross-origin frame APIs still receive no credentials.
  const response = await fetch(url, {...options, credentials:'same-origin'});
  if (!response.ok) return response;
  if (!record) return response; // Explicit custom resource roots may contain new resources.
  const bytes = await response.arrayBuffer();
  const hash = Array.from(new Uint8Array(await crypto.subtle.digest('SHA-256', bytes)), b => b.toString(16).padStart(2, '0')).join('');
  if (bytes.byteLength !== record.bytes || hash !== record.sha256) throw Error('Expansion frame resource integrity failure: ' + path);
  return new Response(bytes, {status:response.status, headers:response.headers});
}
