/** Resources live in the corresponding expansion API's frame/ directory. */
import index from './frame-api-index.json?ver=hscard-045a95eb032ce0a2' with {type:'json'};
const META = 'meta[name="hscard-resource-base"]';
export const FRAME_API_BASE = 'https://raw.githubusercontent.com/qxwd565/legacy/main/frame/';
let cachedBase = null;

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

export function resourceURL(path) {
  validPath(path);
  const root = resourceBase();
  if (root.href === FRAME_API_BASE && !path.endsWith('/')) {
    const record = index.files[path], repo = record && index.repositories[record.repository];
    if (!repo || !/^[a-f0-9]{40}$/.test(repo.commit)) throw Error('Unpublished expansion frame resource: ' + path);
    const expected = `https://raw.githubusercontent.com/${index.owner}/${record.repository}/${repo.commit}/frame/`;
    if (repo.base !== expected) throw Error('Invalid expansion frame origin');
    return new URL(path.split('/').map(encodeURIComponent).join('/'), repo.base);
  }
  const url = new URL(path, root);
  if (!url.href.startsWith(root.href)) throw new Error('HScard resource outside asset directory');
  return url;
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
  const url = resourceURL(path);
  if (root.href !== FRAME_API_BASE) url.search = source.search;
  // Match <link as="fetch" crossorigin="anonymous"> so its response is reused.
  // Cross-origin frame APIs still receive no credentials.
  const response = await fetch(url, {...options, credentials:'same-origin'});
  if (!response.ok) return response;
  const record = index.files[path];
  if (!record) return response; // Explicit custom resource roots may contain new resources.
  const bytes = await response.arrayBuffer();
  const hash = Array.from(new Uint8Array(await crypto.subtle.digest('SHA-256', bytes)), b => b.toString(16).padStart(2, '0')).join('');
  if (bytes.byteLength !== record.bytes || hash !== record.sha256) throw Error('Expansion frame resource integrity failure: ' + path);
  return new Response(bytes, {status:response.status, headers:response.headers});
}
