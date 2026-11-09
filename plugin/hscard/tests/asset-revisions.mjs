import assert from 'node:assert/strict';
import fs from 'node:fs/promises';
import os from 'node:os';
import path from 'node:path';
import {fileURLToPath} from 'node:url';
import {execFileSync} from 'node:child_process';

// A dependency-only or CSS-only update must invalidate the entry, even when
// WordPress keeps the plugin's public version unchanged. Work in a scratch copy.
const plugin = fileURLToPath(new URL('../', import.meta.url));
const prepare = fileURLToPath(new URL('../../../tools/prepare-plugin-assets.mjs', import.meta.url));
const scratch = await fs.mkdtemp(path.join(os.tmpdir(), 'hscard-revision-'));
try {
  const assets = path.join(scratch, 'assets/unity');
  await fs.mkdir(assets, {recursive: true});
  await fs.mkdir(path.join(scratch, 'tests'));
  for (const name of await fs.readdir(path.join(plugin, 'assets/unity'))) {
    if (/\.(mjs|js|css)$/.test(name)) await fs.copyFile(path.join(plugin, 'assets/unity', name), path.join(assets, name));
  }
  const build = () => JSON.parse(execFileSync(process.execPath, [prepare, scratch], {encoding: 'utf8'}));
  const entry = () => fs.readFile(path.join(assets, 'deck-cards.js'), 'utf8');
  const first = build(), original = await entry();
  assert.equal(build().changed, 0, 'Rebuilding unchanged files must be idempotent');
  await fs.appendFile(path.join(assets, 'wgsl-programs.mjs'), '\n// Dependency-only cache regression.\n');
  const dependency = build();
  assert.notEqual(dependency.revision, first.revision);
  assert.notEqual(await entry(), original);
  await fs.appendFile(path.join(assets, 'deck-cards.css'), '\n/* CSS-only cache regression. */\n');
  const css = build();
  assert.notEqual(css.revision, dependency.revision);
  assert.equal(build().changed, 0);
  let imports = 0;
  for (const name of await fs.readdir(assets)) {
    const source = await fs.readFile(path.join(assets, name), 'utf8');
    for (const match of source.matchAll(/['"]\.\/([^'"?]+\.m?js)(\?[^'"]*)?['"]/g)) {
      assert.equal(match[2], '?ver=' + css.revision, name + ': missing/stale dependency revision');
      await fs.access(path.join(assets, match[1]));
      imports++;
    }
  }
  console.log(JSON.stringify({ok: true, imports, idempotent: true, dependencyInvalidation: true, cssInvalidation: true}));
} finally {
  assert.equal(path.dirname(path.resolve(scratch)), path.resolve(os.tmpdir()));
  assert.ok(path.basename(scratch).startsWith('hscard-revision-'));
  await fs.rm(scratch, {recursive: true, force: true});
}
