# Browser verification

These files are development-only and are excluded from the WordPress ZIP.
Run `node tests/asset-revisions.mjs` to check unchanged builds and dependency/CSS
cache invalidation, including the module import graph, without changing sources.
Run `php tests/enqueue-revision.php` for PHP's matching script/style cache key.
Run `php tests/frame-previews.php` to verify every generated preview hash,
dimension and PHP date/class/rarity/plate selection. `preview-layout.html` shows
mixed original loading frames without any card API, engine or font request.
At widths 821 and above it must show four columns without horizontal overflow;
the plugin's mobile preview rules remain unchanged below that breakpoint.
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
   - `http://127.0.0.1:19420/work/entry.html`: real page entry module, live API/CDN,
     normal/golden toggles, hover, scrolling and deliberate device loss/recovery.
     Use a viewport at least 821 px wide. The 10-card fixture repeats EX1_350.
     It also checks ongoing normal-frame animation and zero offscreen updates.
     A deliberately delayed first preparation checks startup clock jumps; normal
     and golden playback must advance at wall-clock speed within 5% tolerance.
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
