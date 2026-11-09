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

## Controlled local performance and lifetime check

Chrome headless, Windows, NVIDIA Pascal WebGPU adapter; local HTTP resources,
436×682 card targets. Resource initialization and API download happened before
these timings; they are not cold-page loading measurements.

| Measurement | Result |
| --- | ---: |
| First prepared/rendered card | 326 ms |
| 30 cards prepared/rendered | 1,767 ms |
| 15 animated cards among 30, median frame | 97.7 ms / 10.2 FPS |
| Present-only scrolling, median | 2.6 ms |

After removing all 30 cards and repeating preparation/removal three times,
mesh/texture/target counts did not grow. Renderer disposal left all three
tracked counts at zero. Texture accounting is conservative and is not a driver
VRAM measurement. 60 FPS has NOT been achieved in the measured mixed deck.

## Remaining acceptance work

- Resolve the beta/current-shader visual differences against native captures.
- Improve multi-card animation throughput and measure cold/warm whole-page
  loading, transferred bytes and the same WebGL workload on multiple devices.
- Validate actual WordPress install/activation and live theme integration.
- Exercise device loss/recovery and prolonged real-site scrolling/toggling.
- Compare against direct in-game captures, not only the prior renderer.

PHP and JavaScript syntax checks passed. Dates-v1 Backstab snapshots were checked
at 2013-08-17, 2013-10-03 and back to 2013-08-17 without state contamination.
