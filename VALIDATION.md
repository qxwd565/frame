# WebGPU preview validation — 2026-11-09 KST

## Expansion API resource migration — 2026-11-09 KST

Published 3,112 original resource files (192,456,842 bytes) to `frame/` in 19
expansion API repositories. Each remote commit changes only that directory.
Read every file back from its pinned public GitHub URL: all 3,112 matched the
local original byte-for-byte and passed size/SHA-256 checks (142.5 seconds).
The resource source directory is no longer tracked in this development branch;
the existing local extraction is retained for rebuilds. No new asset copy or
checkout was created. The old CDN build now mirrors verified API bytes when
needed by an older installed plugin.

JavaScript and PHP checked all 3,112 routes, including shared historical
dependencies, path rejection, corrupted responses and retained custom mirrors.
The actual Chrome/WebGPU renderer produced pixel-identical local/API outputs
for 16 normal/golden cases: beta 2013-08-17 and 2013-10-03, the old race plate,
Hunter and Demon Hunter spells, both DK ornaments, and current minions.
The API run issued 233 requests and no old-CDN or local-resource requests.
The 2,185 PHP preview cases, all 1,065 preview hashes/sizes, enqueue revision,
and native shader-time checks also passed. The API index participates in the
module content revision, so route changes invalidate imported modules.

This migration preserves the renderer's existing pixels. It does **not**
establish parity of the current-shader substitutions with original beta game
shaders, nor extend the existing historical frame coverage. Those limitations
below still apply. Installing the new ZIP on the user's WordPress site was not
performed in this change.

This is a preview, not a completed visual-parity or production acceptance claim.
Original production `main` and `hsdeck-frame.pages.dev` are unchanged.

## Compiler and pipeline

- Current installed Unity build: 6000.3.11.3145967.
- 162 shader definitions, 3,586 variant references, 1,052 unique programs.
- 1,052/1,052 Naga conversions and real Chrome WebGPU shader modules passed.
- 1,406/1,406 compatible vertex/fragment combinations created WebGPU pipelines.
  The two scalar depth-output variants used an unblended single-channel target;
  color variants used RGBA8. This tests pair compatibility, not every possible
  material state or physical GPU.
- Compiler output was rebuilt twice with identical SHA-256:
  `50ed81e2e13f6122821eef5974f98b61038ffbf97cab7a90cbd61f2d6be2fd16`.
- Scratch registers are function-local so uniformity analysis can follow the
  original control flow. Derivative diagnostics were not disabled. Mip bias,
  resource slots, blend/depth/stencil state, UVs and time uniforms are retained.

## Source assets and actual rendering

- 107 mesh payloads and 260 texture payloads matched a fresh installed-game
  extraction byte for byte; no missing sources. Mesh payloads include vertex
  attributes and indices; texture payloads include native formats and mipmaps.
- Texture dimensions: 143 at 1024×1024; 8 at 512×512; 62 at 256×256;
  42 at 128×128; one each at 64×64, 32×32 and 1024×512; two at 256×128.
- 30 scene/time cases rendered with no uncaptured WebGPU errors: current
  minion/spell/weapon/hero/location, ordinary/golden, historical components,
  beta 3664/3890, name/description/race/stat text, and quantity ribbons.
- The existing WebGL renderer was used only as an isolated test reference.
  Production code and the CDN have no WebGL renderer or GLSL archive.
- For current frames and later historical components, mean absolute RGBA
  differences against the reference were below 0.002 on the 0–255 scale.
  The actual EX1_350 golden API material was tested at t=0 and t=1.25 seconds:
  mean errors 0.00778 and 0.00825, with visibly changing animation pixels.
- Beta frames preserve original geometry/textures/layouts but now use current
  shader counterparts. Their mean errors remain 0.129–0.424 against old-engine
  shaders. This remaining difference is NOT declared exact reproduction.
- Main frame atlases remain 1024×1024. This is not a claim that every mask or
  every historical texture has that resolution.

## CDN and page integration

The isolated HTTPS base is
https://hsdeck-frame-webgpu.pages.dev/v7.14.4-webgpu-20261109/assets/unity/.
Actual HTTP/CORS/SHA-256 checks passed for representative manifests, a WGSL
program and native texture. The full 30-case rendering matrix also passed
against this CDN without WebGPU errors.

The actual page entry module loaded 10 repeated EX1_350 cards from live APIs,
toggled ordinary/golden twice, handled hover/scroll and recovered after a forced
device loss. One canvas remained, and the old renderer's tracked targets,
meshes and textures were all zero. This was a browser fixture, not WordPress.

## Controlled performance and lifetime check

Windows, Chrome headless, NVIDIA Pascal, local HTTP, 436×682 targets, 30 cards
with 15 animated. Three alternating runs used the same texture-sharing behavior
as the page. Median results before/after batched uniforms and format-aware GPU
cache accounting:

| Measurement | Before | After |
| --- | ---: | ---: |
| First card (after resource/API initialization) | 229.4 ms | 255.8 ms |
| 30 cards prepared/rendered | 599.3 ms | 683.2 ms |
| Animation frame | 15.3 ms | 14.5 ms |
| Presentation-only scroll | 2.7 ms | 3.0 ms |

These small/mixed changes do not establish an overall speed improvement.
The earlier ~10 FPS harness omitted the page's shared texture resolver and is
not a valid measurement of the actual page. Corrected after-change frame medians
were 14.1–15.5 ms (65–71 FPS). This repeats one actual golden material and does
not establish performance for 30 distinct cards or every device.
A separate 10-card CDN entry test took 8.23 seconds from entry to full display.

After 30-card removal and three further prepare/remove cycles, retained cache
counts were stable. Renderer disposal left tracked mesh/texture/target counts
at zero. Uploaded mip payload was about 50.1 MiB, not a driver VRAM measurement.

## Remaining acceptance work

Animation speed audit, 2026-11-09: the installed game's
`ShaderTime.UpdateShaderAnimationTime` advances its global by deltaTime/20.
The native mana/stat scroller instead reads `_Time.x` and multiplies the original
material's XSpeed=5 and YSpeed=0.2. Uniform tests at 0/1/10/60 seconds verified the
Unity `(t/20,t,2t,3t)` vector and unchanged speed values for all six normal/golden
mana/health/attack bindings. Reference: [Unity shader variables](https://docs.unity.com/en-us/engine/6000.0/manual/materials-and-shaders/shaders/reference/sl-unity-shader-variables).

The page previously used the rAF timestamp captured before asynchronous card
preparation; its next update could count loading time as visible animation time.
It now samples the monotonic clock after preparation. With a forced 350 ms first
prepare delay, the entry fixture measured a maximum startup delta discrepancy
of 1.8 ms, normal playback at 1.000407x and golden at 0.999500x over one-second
intervals. Offscreen updates remained zero and device recovery passed. These
are browser timing/native-data checks, not a simultaneous native-game recording.

Normal-frame animation correction, 2026-11-09: the page scheduler incorrectly
assumed only golden cards animate. It now uses the selected native shaders'
time uniforms and material animation data, with the same paused/offscreen clock
for both finishes. Original shader math, meshes and textures are unchanged.
GPU readbacks confirmed moving mana/attack/health pixels in current, 3664 and
3890 normal minions, and mana/rarity effects in historical spells/weapons.
The 10-card entry fixture recorded 310 normal-card updates in 500 ms, zero
updates during a settled offscreen interval, then resumed. Golden round trips,
hover and device-loss recovery passed with no errors. This is not a general FPS
claim; the older 15-of-30 animation benchmark above omits normal stat effects.

Live-page cache diagnosis, 2026-11-09: the installed entry matched this branch,
but WordPress.com served Chrome a stale compressed response for the unchanged
`?ver=7.14.4-webgpu-dates-v1-preview` URL. It requested the removed packed
`webgpu/wgsl-programs.json.gz` (404), leaving static previews instead of WebGPU.
Replacing only the entry/CSS query in the public rogue page's HTML, while still
loading the installed site's scripts and live CDN/API, rendered all 50 cards:
one canvas, no HTTP failures or console exceptions. A second run substituted
this branch's local JS/CSS in that live DOM and also rendered 50/50 cards.
These controlled browser overrides did not modify the WordPress server.

The plugin now versions the root script/CSS by entry content, and the ZIP builder
stamps the complete module graph by a shared content digest. The public plugin
version is unchanged. Dependency-only and CSS-only edits both invalidate the
entry; unchanged builds are idempotent; 36 relative module references agree.
The 10-card fixture again passed normal/golden round trips, hover/scroll and
forced device recovery with no errors and zero old tracked GPU resources.
Reinstallation and any full-page cache purge on the live server remain pending.

- Resolve the beta/current-shader visual differences against native captures.
- Measure varied multi-card animation, cold/warm whole-page
  loading, transferred bytes and the same WebGL workload on multiple devices.
- Validate actual WordPress install/activation and live theme integration.
- Exercise prolonged real-site scrolling/toggling and additional GPU adapters.
- Compare against direct in-game captures, not only the prior renderer.

PHP and JavaScript syntax checks passed. Dates-v1 Backstab snapshots were checked
at 2013-08-17, 2013-10-03 and back to 2013-08-17 without state contamination.

## Persistent native loading frames and fixed ribbon anchors, 2026-11-09

The live rogue page still requested removed `frame-previews/spell-rogue.webp`
files (origin HTTP 404, proxied by WordPress). Removed PHP preview image markup,
hydration URL rewriting, the preview index and generator, and 1,065 unused
preview entries from the resource router. Old cached markup is hidden by the
compatibility stylesheet and removed at scan. Original native resource bytes
and expansion API commits are unchanged; retired local preview files are in
the task's trash folder, not the active source/package.

Dated metadata now starts the native frame independently of artwork/fonts.
Filling retains the prepared frame, every node/mesh and GPU target; only portrait
material and text change. Stale fills are checked after asynchronous shader work
and before GPU submission. A finish toggle retains the previous completed card
until the new native finish is ready. Animation clocks/speeds remain unchanged.

All types/finishes/rarities share one 436x682 projection and fixed quantity ribbon
center/bottom. Removed whole-scene type/column CSS translations. Quantity-one
cards reserve the same space without a ribbon; hover omits quantity decoration.

Checks performed on Windows in Chrome WebGPU:
- 36 current/historical normal/golden rare/legendary type cases retained frame,
  node, mesh and target identities. All ribbon-only GPU readbacks had the same
  pixel hash. Filled artwork/text changed output; cancelled fills did not.
- Ten-card entry with deliberately delayed art/fonts: 20 persistent fills across
  initial loading and forced device recovery; two normal/golden round trips,
  hover/scroll, no offscreen updates, zero old tracked GPU objects after recovery.
  Normal/golden animation rate stayed within 0.1% of wall time in this run.
- Ten simulated artwork 404s retained ten native frames and no preview images.
- Six widths (375, 820, 821, 1024, 1440, 1920): four desktop columns, exact row/
  column anchors, no horizontal overflow or old five-column offsets. Mobile
  layout unchanged. PHP checked 900 markup combinations with zero image tags.
- Candidate JS/CSS in the actual public rogue-page DOM: 16 normal and 16 golden
  cards, one canvas, zero failed cards or console exceptions. Browser-only
  overrides did not install the plugin or change the WordPress server.
- All PHP/JS syntax, resource routing/hash checks for 2,047 files across 19 APIs,
  cache revision checks and native shader timing checks passed.

No new in-game pixel-parity claim, full WordPress activation test or other-GPU
acceptance is made. Full-page caches containing old HTML/scripts must be refreshed
when installing the replacement ZIP. Native loading still requires dated metadata
and the original frame resources; it does not use an immediate substitute bitmap.

## Admin source ordering and repository-name entry, 2026-11-09

The JSON-source list has a WordPress jQuery UI drag handle, keyboard arrow moves
and up/down actions in its existing menu. Ordering is saved separately from
source content; filtered results reorder only their existing slots, new sources
append and deleted sources cannot be resurrected by a stale order request.
New remote sources accept a repository name and construct the qxwd565 main
cards.json URL on the server, with a matching live URL preview. Existing custom
URLs and local upload/text modes retain their behavior. Admin JS/CSS have
content-based cache revisions without changing the plugin version.

PHP handler tests passed full/filtered ordering, reload, add/delete, rejected
duplicate/invalid IDs, write failure, capability/nonce/method checks, repository
validation, actual source creation, duplicate URL rejection and existing URL
editing. All 19 PHP files and changed JS files passed syntax checks. Chrome
with the actual WordPress jQuery UI scripts passed a real mouse drag, keyboard
focus restoration, failed-save rollback, mobile menu moves at 390 px, and
repository preview/mode switching. Browser AJAX was simulated; handlers used
in-memory WordPress option stubs. No live WordPress admin installation or DB
mutation was performed. Existing WebGPU/native resource files are unchanged.

## Automatic repository-based set IDs, 2026-11-09

New repository connections store the entered repository name as their set ID.
The importer retains that ID across header changes and repeated imports; older
connections retain their existing IDs. The blank-set form fills and locks the ID
when a repository-managed connection is selected, and the server derives it
independently of submitted form values. Per-card IDs, native game sets and
watermarks are unaffected. Existing source keys and dated-card URLs remain valid.

`repository-set-id.php` exercised the production parser/importer/source mapping
with in-memory WordPress/card-store seams: different JSON header vs repository,
reimport with changed header and mana, old-source compatibility, conflicts,
server-derived form IDs, dot/100-character repository names and detachment.
Chrome passed automatic ID selection/manual fallback alongside source ordering,
repository completion and mobile controls. PHP/JS syntax checks passed. No live
WordPress database was changed during these tests.
