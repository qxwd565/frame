import assert from 'node:assert/strict';
import fs from 'node:fs/promises';
import {revisionFor} from '../../../tools/prepare-plugin-assets.mjs';
const assets = new URL('../assets/unity/', import.meta.url);
const names = (await fs.readdir(assets)).filter(name => /\.(mjs|js|css)$/.test(name) || name === 'frame-api-index.json');
const sources = new Map(await Promise.all(names.map(async name => [name, await fs.readFile(new URL(name,assets),'utf8')])));
const baseline = revisionFor(sources);
assert.equal(revisionFor(sources),baseline);
assert.equal(revisionFor(new Map([...sources].reverse())),baseline);
for (const name of ['wgsl-programs.mjs','deck-cards.css','frame-api-index.json']) {
 const edited = new Map(sources);edited.set(name,edited.get(name)+'\n ');
 assert.notEqual(revisionFor(edited),baseline,name+': must invalidate imported modules');
}
const stamped = new Map([...sources].map(([name,source])=>[name,source.replace(/\?ver=hscard-[A-Za-z0-9.-]+/g,'?ver=hscard-another-build')]));
assert.equal(revisionFor(stamped),baseline,'Stamping must not change canonical revision');
let imports=0;
for (const [name,source] of sources) {
 if(!/\.m?js$/.test(name))continue;
 for(const match of source.matchAll(/['"]\.\/([^'"?]+\.(?:m?js|json))(\?[^'"]*)?['"]/g)) {
  assert.equal(match[2],'?ver='+baseline,name+': stale dependency revision');
  await fs.access(new URL(match[1],assets));imports++;
 }
}
console.log(JSON.stringify({ok:true,imports,idempotent:true,dependencyInvalidation:true,cssInvalidation:true,apiIndexInvalidation:true,temporaryFiles:0}));
