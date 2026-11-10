# HSdeck WebGPU renderer

This branch contains HScard's WebGPU preview and its expansion API resource index.
WordPress/PHP and browser renderer code live in `plugin/hscard/`; the WordPress
ZIP contains only runtime files and the pinned expansion resource index.
There are no separate skeleton images. The renderer displays the native frame
first, then fills its portrait and text without replacing its geometry or target.
Tests and documentation stay in the development repository. The former
`qxwd565/HSdeck-plugin` URL redirects to this repository, so code and resources
are kept in separate directories here as requested.

Original meshes, textures, font programs, historical component records and
current-game WGSL are published under `qxwd565/<expansion>/frame/`. Beta and
original snapshots live in `qxwd565/legacy/frame/`. The plugin's
`assets/unity/frame-api-index.json` records every file's owner, immutable commit,
byte size and SHA-256. Relative historical dependencies resolve through the
same index, including files shared across expansions. No card JSON is changed.
The legacy source extraction stays in its existing local directory, ignored
by Git; no new resource copy or checkout is created during publication.

The current Unity source build is `6000.3.11.3145967`. Main frame atlases remain
1024×1024; smaller source masks are preserved at their original sizes.

`python -B tools/publish-frame-apis.py` checks the existing extraction and prints
its expansion allocation. `--publish` updates only `frame/` on each target API's
main branch and updates the plugin index. It preserves all other remote files,
uses non-force pushes, and does not create a worktree or temporary index.
`tools/frame-api-layout.json` owns the source-version allocation data; it does
not claim that a source version introduced a visual change. Mixed catalogs
live in legacy and current renderer support lives with the 36.6 snapshot in
Cataclysm. Original provenance and any unknown patch dates stay intact.

`node tools/build-cdn.mjs` can rebuild the old static CDN as a compatibility
mirror by downloading the pinned API files and checking every SHA-256. The
new plugin reads the expansion APIs directly and does not require that mirror.

## Package the WordPress plugin

Run `powershell -NoProfile -ExecutionPolicy Bypass -File tools/build-plugin.ps1`
on Windows (the policy option applies only to this build process). This overwrites the
adjacent `hsdeck plugin.zip`; `-OutputZip <path>` chooses another destination.
The packager first runs `tools/prepare-plugin-assets.mjs` to stamp all browser
module imports with a shared content revision. PHP adds the entry's content hash
to its script and stylesheet URLs. Always use this packager after editing browser
code: changing the plugin version alone does not invalidate imported modules.
Tests, documentation and native resources are excluded from the WordPress ZIP.

## Rebuild shaders on Windows

- Node 24.12 or newer; `npm install --prefix tools` installs pinned naga-wasm 30.2.0.
- Unity HLSLcc commit `3ea1fcd6bd0ac445bc078de0bf32f0950188577b` and Zig 0.14.1.
- Set `HLSLCC_ROOT` and `ZIG_EXE`, then run `node tools/build-translator.mjs`.
- Run `node tools/compile-shaders.mjs`. The extracted current-game DXBC and Unity
  reflection metadata are in `tools/inputs/current-shaders.json.gz`. Original
  instruction/signature bytes are preserved while reconstructing the reflection
  chunk required by HLSLcc.
- DXBC → HLSLcc Vulkan GLSL → Naga IR validation → WGSL happens at build time.
  Only WGSL reaches WebGPU; no shader compiler is deployed to the browser.

See `VALIDATION.md` for measured results and remaining limitations. Assets remain
subject to their original owners' rights; licenses for bundled libraries are in
the versioned assets directory.

Plugin checks and browser fixtures are documented in `plugin/hscard/tests/README.md`.
`native-frame-fill.html` checks retained frame/node/mesh/target identities and
pixel-identical quantity ribbons across 36 current/historical variants. The
shared 436x682 scene fixes the ribbon center/bottom for every type, finish and
rarity; quantity-one cards reserve the same space without drawing a ribbon.
PHP emits no preview `<img>` or preview URL. Compatibility CSS and the entry
remove obsolete cached image markup, while dated metadata chooses the actual
native frame. Artwork and font requests run independently of its first draw.
Full plugin implementation and validation notes are in
`plugin/hscard/docs/WEBGPU-STAGING-STATUS.md`.
