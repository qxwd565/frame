import assert from 'node:assert/strict';
import fs from 'node:fs/promises';
import crypto from 'node:crypto';
import {resourceURL, resourceFetch, FRAME_API_BASE} from '../assets/unity/resource-url.mjs';
import {HistoricalFrames} from '../assets/unity/historical-frames.mjs';
import index from '../assets/unity/frame-api-index.json' with {type:'json'};

const source = new URL('../../../v7.14.4-webgpu-20261109/assets/unity/', import.meta.url);
const requests = [], originalFetch = globalThis.fetch;
const reverse = new Map();
for (const [name, record] of Object.entries(index.files)) {
  const url = resourceURL(name);
  assert.ok(url.href.startsWith(index.repositories[record.repository].base));
  assert.ok(!url.href.includes('/qxwd565/frame/'));
  reverse.set(url.href, name);
  const bytes = await fs.readFile(new URL(name, source));
  assert.equal(bytes.length, record.bytes, name);
  assert.equal(crypto.createHash('sha256').update(bytes).digest('hex'), record.sha256, name);
}
for (const name of ['../secret', '/secret', '%2e%2e/secret', 'x\\y', 'x?y', 'x#y']) assert.throws(() => resourceURL(name));
assert.throws(() => resourceURL('not-published.bin'), /Unpublished/);
assert.equal(resourceURL('historical-frames/').href, FRAME_API_BASE + 'historical-frames/');
try {
  globalThis.fetch = async (url, options) => {
    const name = reverse.get(url.href);
    assert.ok(name, 'All original relative dependencies must route to a published API: ' + url);
    assert.equal(options.credentials, 'same-origin', 'Match anonymous preload; remote APIs still receive no credentials');
    requests.push(name);
    return new Response(await fs.readFile(new URL(name, source)));
  };
  const history = await HistoricalFrames.load();
  for (const edition of ['2019', 'Darkmoon', 'DeathKnight252', 'DeathKnight254']) {
    const library = await history.library(edition);
    assert.equal(library.header.edition, edition);
    assert.ok(library.assets.size > 0);
  }
  for (const name of ['native-minion-profiles.json', 'minion(2013-08-17).json.gz',
    'minion(2013-10-03).patch.json.gz', 'minion-fonts(2013-10-03).json.gz',
    'components/texts/ios-1.1.6069-minion.json.gz']) {
    assert.ok((await resourceFetch(new URL(name + '?rev=old-cache-key', history.base))).ok);
  }
  assert.ok(requests.length >= 10);
  globalThis.fetch = async () => new Response('corrupted');
  await assert.rejects(resourceFetch(resourceURL('frames-constructed.json.gz')), /integrity failure/);
  await assert.rejects(resourceFetch('https://example.test/other.bin'), /outside/);
  globalThis.fetch = async () => new Response('missing', {status:404});
  assert.equal((await resourceFetch(resourceURL('frames-constructed.json.gz'))).status, 404);
} finally { globalThis.fetch = originalFetch; }
console.log(JSON.stringify({ok:true, originalFiles:Object.keys(index.files).length,
  repositories:Object.keys(index.repositories).length, crossRepositoryRequests:requests.length,
  corruptionRejected:true, pathTraversalRejected:true}));
