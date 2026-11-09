/** HScard static asset origin. Modules remain on WordPress; textures, meshes and shaders are external. */
const META = 'meta[name="hscard-resource-base"]';
let cachedBase = null;

export function resourceBase() {
  if (cachedBase) return cachedBase;
  const value = document.querySelector(META)?.content?.trim() || '';
  if (!value) throw new Error('HSCARD_ASSET_BASE_URL not configured. Configure HScard 3D Assets in WordPress Settings.');
  let url;
  try { url = new URL(value); } catch { throw new Error('Invalid HSCARD_ASSET_BASE_URL'); }
  if (!['https:', 'http:'].includes(url.protocol) || url.username || url.password || url.hash || url.search || !url.pathname.endsWith('/')) {
    throw new Error('Invalid HSCARD_ASSET_BASE_URL: expected absolute HTTP(S) directory URL');
  }
  if (url.protocol === 'http:' && location.protocol === 'https:') throw new Error('Insecure HSCARD_ASSET_BASE_URL: HTTPS required');
  cachedBase = url;
  return cachedBase;
}

export function resourceURL(path) {
  if (typeof path !== 'string' || !path || path.startsWith('/') || path.startsWith('\\') || path.includes('..') || path.includes('\\') || /(?:^|\/)\./.test(path) || path.includes('?') || path.includes('#')) {
    throw new Error('Invalid HScard resource path');
  }
  const root = resourceBase();
  const url = new URL(path, root);
  if (!url.href.startsWith(root.href)) throw new Error('HScard resource outside asset directory');
  return url;
}
