# HSdeck Cloudflare CDN deployment

## Current responsibilities

- `hsdeck.com`: existing WordPress website (unchanged).
- `api.hsdeck.com`: card JSON, first using the existing `qxwd565/legacy` Worker.
- `art.hsdeck.com`: normal artwork and golden resources, same Legacy Worker.
- `assets.hsdeck.com`: HScard Unity renderer modules, frames, textures, shader data, WASM and other static assets in this repository.

The `legacy` Worker repo implements host-specific aliases:
- `https://api.hsdeck.com/legacy/cards-date.json` maps to Legacy `/cards-date.json`
- `https://api.hsdeck.com/legacy/data/BT_035.json` maps to Legacy `/data/BT_035.json`
- `https://art.hsdeck.com/legacy/BT_035.png` maps to Legacy `/art/BT_035.png`
- `https://art.hsdeck.com/legacy/golden/cards/BT_035.json` maps to Legacy `/golden/cards/BT_035.json`
- All existing original Legacy Worker and GitHub Pages paths remain unchanged.

In this repo `wrangler.toml` deploys `assets/`, giving these paths:
- `https://assets.hsdeck.com/unity/deck-cards.js`
- `https://assets.hsdeck.com/unity/card-renderer.mjs`
- `https://assets.hsdeck.com/unity/shader-programs.json.gz`
- `https://assets.hsdeck.com/unity/freetype-bridge.wasm`

## One-time Cloudflare account steps (not possible through a GitHub commit)

1. Add and activate `hsdeck.com` as a Cloudflare zone. Preserve existing WordPress records, and check MX/TXT before changing nameservers at the registrar.
2. On existing Cloudflare Worker `legacy`, add **both** custom domains `api.hsdeck.com` and `art.hsdeck.com`.
3. Create a new Workers project from GitHub repository `qxwd565/HSdeck-plugin`, branch `main`, deploying with `npx wrangler deploy` using the included `wrangler.toml`.
4. Add custom domain `assets.hsdeck.com` to that new `hsdeck-assets` Worker.
5. Verify examples above return 200, the expected file content, and the `Access-Control-Allow-Origin: *` header before changing plugin URLs.
6. Only then add/select a CDN base URL for the plugin. Do not switch the live plugin before CDN verification.

Do **not** add `[[routes]]` to Wrangler for these custom domains until the Cloudflare zone is active; deployment could fail before the zone exists.

This preparation does not change the PHP/JS plugin's existing live URLs, which continue to load locally. Other expansion API repositories are not automatically migrated by this configuration.
