import fs from 'node:fs/promises';
import path from 'node:path';
import crypto from 'node:crypto';
import {fileURLToPath} from 'node:url';

const plugin = process.argv[2] ? path.resolve(process.argv[2]) : fileURLToPath(new URL('../plugin/hscard/', import.meta.url));
const assets = path.join(plugin, 'assets/unity');
const files = (await fs.readdir(assets)).filter(name => /\.(mjs|js|css)$/.test(name)).sort();
const version = /\?ver=hscard-[A-Za-z0-9.-]+/g;
const canonical = source => source.replaceAll('\r\n', '\n').replace(version, '?ver=hscard-build');
const sources = new Map(await Promise.all(files.map(async name => [name, await fs.readFile(path.join(assets, name), 'utf8')])));
const digest = crypto.createHash('sha256');
for (const [name, source] of sources) digest.update(name + '\0' + canonical(source) + '\0');
const revision = 'hscard-' + digest.digest('hex').slice(0, 16);
let changed = 0;
async function stamp(file, source) {
  const next = source.replace(version, '?ver=' + revision);
  if (next !== source) { await fs.writeFile(file, next); changed++; }
}
for (const [name, source] of sources) await stamp(path.join(assets, name), source);
// The device-loss fixture must patch the exact module instance used by the entry.
for (const name of await fs.readdir(path.join(plugin, 'tests'))) {
  if (!name.endsWith('.html')) continue;
  const file = path.join(plugin, 'tests', name);
  await stamp(file, await fs.readFile(file, 'utf8'));
}
console.log(JSON.stringify({revision, files: files.length, changed}));
