# HSdeck HScard architecture (7.12.10)

- `cards.json`: API current card catalog used by WordPress imports.
- `data/<cardId>.json`: archival card detail; `card.history` owns dated deltas.
- `history.json`: generated small date lookup; PHP validates DBF ID and card ID.
  Older database rows with an empty string ID are resolved by their exact DBF
  ID against imported provenance and this index, without frontend database
  writes. Conflicting nonempty IDs or ambiguous source identities are rejected.
- `render.json`: generated compact current card geometry metadata for WebGL;
  historical names, stats and texts are not recalculated in JavaScript.
- A single GitHub build script generates both runtime indexes from the
  approved current card catalog and historical deltas. Current card catalog
  fields are not overwritten by raw client snapshots.
- The theme can supply each deck date with `hscard_deck_effective_date`.
- `Content_Filter` resolves a date once per deck, `Card_History` loads the
  relevant API history, and `Render_Spec::apply` prepares the canonical card.
- `Deck_View` uses that same resolved record for tiles and Unity-compatible
  native card rendering. `Json_Sources` selects only registered sources with
  matching imported DBF IDs; unknown IDs keep the full-source fallback.
- `Frame_Profiles` currently has only `current` until verified original
  historic frame resources are installed; no invented historical rendering.
- GPU canvas, frame textures, real-time gold animations and native quantity
  ribbon remain untouched by the data-source optimization.

The runtime endpoints are not disposable duplicates: each has a separate
consumer. Deleting any of them without changing its consumer breaks loading.

## Loading frames (2026-11-08, Asia/Seoul)

Desktop loading and finished cards use the same native WebGL frame composer,
historical selection, geometry and placement. The loading card retains only its
name and a blank portrait; the final card reuses the same non-artwork frame
parts and fills the portrait and card text after their data is available.
The quantity ribbon is only drawn for the finished card. Stale results are not
published, and an existing card remains visible while its replacement loads.
