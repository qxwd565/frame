# HSdeck WebGPU resources

This branch contains HScard's WebGPU preview and its immutable frame resources.
WordPress/PHP and browser renderer code live in `plugin/hscard/`; the WordPress
ZIP contains only that directory's runtime files and static loading previews.
Tests and documentation stay in the development repository. The former
`qxwd565/HSdeck-plugin` URL redirects to this repository, so code and resources
are kept in separate directories here as requested.

`v7.14.4-webgpu-20261109/assets/unity/` contains the original meshes, textures,
font programs, historical component records and current-game WGSL. It contains
no WebGL renderer, GLSL program archive or old-engine shader archive.

The current Unity source build is `6000.3.11.3145967`. Main frame atlases remain
1024×1024; smaller source masks are preserved at their original sizes.

Run `node tools/build-cdn.mjs` to create the static `dist` directory. Deploy this
branch to an isolated preview project; the existing production CDN is unchanged.

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
Full plugin implementation and validation notes are in
`plugin/hscard/docs/WEBGPU-STAGING-STATUS.md`.
