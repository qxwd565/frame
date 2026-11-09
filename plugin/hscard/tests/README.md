# Browser verification

These files are development-only and are excluded from the WordPress ZIP.
Run `php tests/admin-sources.php` for source ordering, filtered slots, storage
failures, authorization/nonce checks, repository URL construction and existing
URL compatibility. `--fixture` emits the production source-list/new-source markup
and set form. `php tests/repository-set-id.php` exercises the real parser/importer
with storage seams: repository ID stability, old IDs, native card metadata,
dated URL routing, conflicts and server-side form derivation.
The source fixture is intended
for browser testing. Serve generated fixtures from `.build/` via `/fixtures/`.
Load WordPress's jQuery, jQuery UI core/mouse/sortable, then
`admin-sources-browser.js`, the production `admin/js/data-manager.js`, and call
`runAdminSourceChecks()`. Its `window.result.phase` asks a browser driver for a
real mouse drag and a 390 px viewport; keyboard, failed-save rollback, mobile
menu moves and repository completion run inside the fixture.

Run `node tests/frame-api-routing.mjs` and `php tests/frame-api-routing.php`
to verify all expansion routes, unchanged local bytes, cross-expansion
historical dependencies, corruption rejection and custom mirror compatibility.
`python -B tools/verify-frame-api-publication.py` from the repository root reads
every published file back into RAM and compares it byte-for-byte to the source.
With the local test server running, `node tools/verify-frame-api-render.mjs`
compares 16 normal/golden GPU outputs between local files and the real APIs.
It verifies exact pixel hashes and rejects any old-CDN request.
Run `node tests/asset-revisions.mjs` to check unchanged builds and dependency/CSS
cache invalidation, including the module import graph, without changing sources.
Run `php tests/enqueue-revision.php` for PHP's matching script/style cache key.
Run `php tests/native-frame-markup.php` for 900 type/class/rarity/date cases:
no preview image request and a shared 436x682 scene anchor. `ribbon-grid.html`
checks 375/820/821/1024/1440/1920 px, four desktop columns, shared ribbon anchors,
no old five-column offsets, no horizontal overflow, and unchanged mobile layout.
Run `node tests/shader-time.mjs` to verify normal/golden stat-effect time vectors
at 0, 1, 10 and 60 seconds and unchanged native X/Y speed values.
Use a compatible Chrome/Edge WebGPU adapter; the browser must report its actual
adapter. No software renderer is silently substituted.

1. Check out `qxwd565/frame` and open its `plugin/hscard` directory.
2. Run `node tests/serve.mjs`. An optional argument supplies another resource root.
3. Open the following localhost pages in Chrome/Edge and inspect `window.result`:
   - `http://127.0.0.1:19420/work/modules.html`: all current WGSL modules.
   - `http://127.0.0.1:19420/work/pipelines.html`: compatible shader pairs.
   - `http://127.0.0.1:19420/work/benchmark.html`: 30 cards, animated subset,
     presentation-only scrolling and resource disposal. Initial resource/API
     loading is outside its timing interval. This is not whole-page performance.
   - `http://127.0.0.1:19420/work/entry.html`: real page entry module, live card API/local native files,
     normal/golden toggles, hover, scrolling and deliberate device loss/recovery.
     Use a viewport at least 821 px wide. The 10-card fixture repeats EX1_350.
     It also checks ongoing normal-frame animation and zero offscreen updates.
     Delayed artwork/fonts verify frame/node/mesh/target retention during fill.
     A deliberately delayed first preparation checks startup clock jumps; normal
     and golden playback must advance at wall-clock speed within 5% tolerance.
   - `http://127.0.0.1:19420/work/native-frame-fill.html`: 36 current/historical
     type/finish/rarity cases, retained native frame identities, exact quantity
     ribbon pixel hashes, no recomposition, stale fill blocked before GPU submit.
   - `http://127.0.0.1:19420/work/native-frame-failure.html`: ten failed artwork
     requests preserve ten native frames with no broken preview images.
   - `http://127.0.0.1:19420/work/frame-animation.html`: GPU readback at two times;
     normal minion mana/attack/health regions must change in current, 3664 and
     3890 frames. Historical spells/weapons must retain their mana effects.

The entry/benchmark fixtures use the public legacy card and golden APIs.
They test browser integration, not WordPress installation/activation. No test
page or tool is required on a user's WordPress server.

The 30-scene pixel comparison additionally used the prior WebGL renderer in an
isolated local reference directory. Its old engine/shader files are deliberately
not republished here. See `docs/WEBGPU-STAGING-STATUS.md` for measured differences
and checks still requiring a native game or WordPress environment.
