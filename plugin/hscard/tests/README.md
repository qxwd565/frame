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
   - `http://127.0.0.1:19420/work/loading-order.html?names=2500`: four dated
     frames with 100 ms added per fetch and a further 2500 ms name-mesh delay.
     Checks first-frame/content times, frame-first ordering and deferred fonts.
     `mixed` adds spell/weapon/minion frames; `date=2013-10-03` selects 3890;
     `date=2026-11-09` uses current frames. No performance threshold is inferred
     for production. The entry fixture also removes/replaces a card while its
     frame is preparing and checks that the abandoned target is never attached.
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
# Card-post WordPress integration

`card-posts-wordpress.php` requires an isolated local WordPress installation at
`.build/wp-card-pages/wordpress` and `http://127.0.0.1:19460`. Set `HSCARD_TEST_WP`
to that directory and `HSCARD_TEST_CATALOG` to a legacy `cards.json` containing
EX1_350, CS2_072 and EX1_165a. The test resets only its generated local fixtures.
It runs production imports and real WordPress post/meta/permalink/shortcode APIs;
SQLite can be used, with the test's serial advisory-lock seam documented inline.
Enable the local HSdeck theme to cover its category/date permalink filters.
It also checks the single `카드`/`card` category, classic/REST editor enforcement,
earliest JSON history date and site-timezone GMT values, deferred publication
until that date is known, background/local document updates, version-1 post
migration, and preservation of unrelated posts and authored content.

With that site served locally, `node tests/card-posts-browser.mjs` exercises the
actual WebGPU renderer, desktop click and mobile tap. `CHROME_PATH` optionally
specifies Chrome. It uses a private `.build/card-posts-chrome` profile, closes its
own browser and writes one detail screenshot under `.build`. These tools and
fixtures are excluded from the plugin ZIP. They do not access production admin.

`card-documents-wordpress.php` uses the same isolated WordPress installation.
It checks that foreground HTML rendering performs no remote HTTP requests,
background warming preserves original dated documents, late import results are
discarded, failed refreshes retain valid data, and local documents are embedded
and HTML-escaped. Its HTTP transport and SQLite advisory locks are explicit test
seams; it does not test production MySQL contention or the site's cron runner.

`node tests/inline-card-documents.mjs` checks zero initial card-API requests from
embedded documents, exact historical rarity/race/text, unreleased cards, and
normal API recovery for invalid or unregistered documents. Server caching only
changes transport: the existing JavaScript date reducer remains authoritative.
After warming the isolated site's original dated documents, set
`HSCARD_TEST_INLINE=1` when running `card-posts-browser.mjs`. It blocks card JSON
requests and requires desktop rendering, card-post navigation and mobile taps
to work with zero attempted card-API requests.
