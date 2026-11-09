# WebGPU preview validation — 2026-11-09 KST

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

## Four-column layout and native loading previews, 2026-11-09

The old 60 local preview images contained raw frame texture atlases, including
unassembled dragon/name-plate pieces. Replaced them with transparent snapshots
from the actual WebGPU loading-card renderer: 540 type/class/rarity/plate keys,
1,430 render jobs and 1,065 distinct content-addressed images. Native meshes,
textures, UVs, materials and shader calculations are unchanged. Historical
intervals come from the existing renderer selector, including 3664 and 3890;
20 unsupported pre-class historical combinations retain the current placeholder.
The initial image is still provisional when a dated card's metadata differs
from the imported WordPress record; the dated API remains authoritative.

Images are served with the existing native resources, not installed in the ZIP.
Only a 144 KB preview index is added to WordPress. No card API, JavaScript or
font initialization is needed to choose/display the first server-rendered image.
The preview is a 256x400 WebP snapshot; original texture resolution is unchanged.

PHP checked all 2,185 date/key markup cases, hashes and image dimensions.
Chrome checked 375/820 px mobile and 821/1024/1440/1920 px desktop: four desktop
columns, no horizontal overflow, no overlapping card rectangles even with old
five-column edge rules present. Mobile plugin rules are unchanged. A controlled
browser override of the actual rogue page's local JS and concatenated CSS
rendered the first deck's 16 cards in four columns, then 16 golden cards, with
no card failures or console exceptions. This did not update WordPress itself.

The 10-card entry check retained normal/golden toggles, hover, offscreen pause
and device recovery: zero old GPU resources and no errors. Native stat speeds
and shader clocks are unchanged. PHP syntax, JS syntax and content-based
dependency/CSS invalidation checks passed. Not compared to a new native-game
capture or an actual WordPress ZIP installation in this change.
