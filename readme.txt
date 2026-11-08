=== HScard ===
Contributors: hsdeck
Tags: hearthstone, deck, deckstring
Requires at least: 6.6
Requires PHP: 7.4
Stable tag: 7.12.12
License: GPLv2 or later
License URI: https://www.gnu.org/licenses/gpl-2.0.html

HScard renders HSdeck decks and real-time, Unity-compatible Hearthstone cards.

== Description ==

Local card data, dated deck rendering and shared native card resources for HSdeck.

== Installation ==

1. Upload this plugin ZIP through Plugins > Add New > Upload Plugin.
2. Install or replace HScard, then activate it.
3. Existing card data and settings remain in the WordPress database.

Activation creates or upgrades the database schema only. It does not download,
unpack or regenerate graphics. All bundled graphics work from the plugin folder.

== Packaging ==

The ZIP contains one hscard/ folder: hscard.php, uninstall.php, readme.txt,
license.txt, includes/, admin/, assets/ and documentation. Build scripts, tests
and extraction sources stay outside the installable plugin. Native historical
resources and Korea-date records remain bundled. Shared lossless image sprites
and texture planes remove redundant pixels without discarding original assets.

== Data sources ==

* data/<cardId>.json: per-card history edits (API repository).
* cards.json: approved current card data for WordPress importing and editing.
* render.json: generated WebGL source metadata (no historical copies).
* history.json: generated compact historical deltas (not full card copies).
* history-pending.json: source-card names not yet present in a supported API set. This is an archive for future migration and is never loaded by the website.

The WordPress JSON manager retains local/remote source editing, import and deletion.
The API index build is maintained by GitHub Actions; it does not change the
existing DBF ID, card ID, artwork filename or existing historical delta values.

== Dated rendering ==

Each deck resolves its effective date once. The PHP plugin applies the API-owned
historical deltas once, then emits one CardRenderSpec shared by the deck tile and
Unity-compatible WebGL rendering. The browser fetches only the matching imported
API sources whenever IDs can be matched reliably; unfamiliar cards use the full
catalog fallback. The browser must not replace the date-qualified name, mana,
text, artwork, stats, type or rarity with current JSON catalog values.

Historical frame assets are bundled in assets/unity/historical-frames/.
Their manifest includes original source versions, component coverage, Korea
patch dates where verified, checksums and explicit uncertainty. Source versions
are not assumed to be dates when a frame design first appeared. The WebGL
renderer still uses the current profile; the archived assets are not yet wired
into historical scene composition or automatic date selection.

== Golden artwork ==

Golden artwork is loaded on demand from the matched imported API set's
golden/index.json, golden/cards/<id>.json and golden/textures/<hash>.bin
(paths are relative to the set root). Both card ID and DBF ID must match.
The existing HS Plus shaders, HPT1 textures and native animation curves are
used with their original values, UVs, samplers and noise permutation.
Requests are shared and caches bounded. Offscreen animations pause and GPU
portrait textures are released when no prepared card uses them. Missing or
failed golden resources keep the normal portrait. Historical/manual artwork
remains authoritative. Normal cards never request golden resources.

== Changelog ==

= 7.12.12 =

* Standardize the installable WordPress package and deduplicate native graphics
  losslessly (2026-11-08, Asia/Seoul). No remote resource installer is required.
* Show HSPlus native loading frames before API/artwork/WebGL initialization,
  with resolved class, rarity, normal/golden appearance and legendary dragon.
  Keep data blank except the loading name; replace each card without layout shift.
* Retain all historical resources and Korea-date records from 7.12.11
  alongside the desktop artwork/layout fixes (merged 2026-11-08, Asia/Seoul).
* Allow importing legacy DB rows with an absent card ID while preserving
  checks for genuine DBF/card-ID collisions.
* Use verified card-ID artwork fallback paths when the matching API card omits
  its art path or an unlocked current-art URL fails to load.
* Preserve explicitly selected historical artwork; show an error if no valid
  artwork can be loaded instead of rendering a white portrait.
* Keep resolved classes and compatible multi-class tags in the native frame.
* Align native card bodies and WebGL quantity ribbons in a common scene.
* Widen the desktop five-card grid and retain mobile presentation.

= 7.12.11 =

* Bundle historical frame libraries and source catalogs, older text and frame
  components, and deduplicated native 1024-pixel minion atlas snapshots.
* Include Korea-date evidence and retain unknown dates without guessing.
* Keep the current renderer and existing deck/date behavior unchanged.

= 7.12.10 =

* Share exact ID-to-source matching between history and WebGL loading.
* Reduce irrelevant expansion catalog downloads on imported decks.
* Remove legacy browser-side card-field recomputation and obsolete source docs.
* Keep PHP and browser card data authoritative for the same effective date.

== Architecture ==

See docs/ARCHITECTURE.md. Remote API build artifacts and WordPress's JSON
management remain compatible with the plugin's 7.12.09 data and database schema.
