=== HScard ===
Contributors: hsdeck
Tags: hearthstone, deck, deckstring, webgpu
Requires at least: 6.6
Requires PHP: 7.4
Stable tag: 7.14.6-webgpu-beta3664-art-preview
License: GPLv2 or later
License URI: https://www.gnu.org/licenses/gpl-2.0.html

IMPORTANT: WEBGPU EXPERIMENTAL STAGING ONLY. NOT FOR PRODUCTION.

== Description ==

HScard displays HSdeck decks with a WebGPU-only preview 3D card engine. All 1,052 current-game WGSL programs and 1,406 compatible shader pairs passed real browser compilation/pipeline checks. Native in-game parity and WordPress production acceptance are not complete; beta frames retain measurable differences. The dated card data layer supports ONLY the dates-v1 `data/<CARD_ID>.json` format. No `card`+`patches` or `history.json` fallback exists.

== Installation ==

Install this ZIP only on a backup/test WordPress instance, not a live site. Existing database card inventory and WordPress settings are retained. The WebGPU-only renderer has no WebGL fallback.

== Data format ==

```
{
 "2013-08-17":{"name":"Card Name","type":"MINION","mana":5,"attack":4,"health":6,"text":"Taunt"},
 "2014-01-17":{"mana":6},
 "2015-04-01":{"text":"","mana":0}
}
```

Dates are Asia/Seoul calendar dates. Later records are field-only deltas. Zero/false/empty string are valid, `null` deletes a field, arrays/objects replace rather than deep-merge, and cards don't exist prior to their first date. `cards.json` remains inventory for card IDs and sets only, never historical card data.

== Details ==

Source, data format, test fixtures and measured limitations:
https://github.com/qxwd565/frame/tree/webgpu-native-resources-20261109/plugin/hscard


== WebGPU 3D assets (expansion APIs) ==
Mesh/texture/shader/font/historical frame files live in each expansion API's frame/ directory.
Beta and original snapshots live at https://github.com/qxwd565/legacy/tree/main/frame
assets/unity/frame-api-index.json pins every file to its repository commit and SHA-256.
The browser and PHP resource preloads use the same index, including shared dependencies.
Loading displays the native frame itself; its target and geometry remain while artwork and text fill in.
The official previous CDN defaults migrate automatically; explicit custom hosts are retained.
Custom resource hosts remain configurable in Settings > HScard 3D resources.
The plugin stores no GitHub tokens. A private GitHub repository is not publicly readable.
Animated WebGPU cards will not render without the remote asset host.
Do not edit shader or mesh bytes when moving the files.
