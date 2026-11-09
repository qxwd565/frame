<?php
/**
 * HScard dates-v1: the server serializes identity and the existing visual
 * placeholder. It NEVER attempts to reconstruct card statistics from an old
 * cards.json/history.json/patches structure. The browser uses the one shared
 * card-snapshots.mjs module for all date-specific values.
 *
 * @package HScard
 */
namespace HScard;
if ( ! defined( 'ABSPATH' ) ) { exit; }
final class Render_Spec {
 const SCHEMA = 2;
 public static function placeholder( array $card, $date ) {
  $card['name'] = isset( $card['name'] ) ? (string) $card['name'] : '';
  $card['display_name'] = $card['name'];
  $card['render_date'] = (string) $date;
  return $card;
 }
 /** Render data is provisional until the date-keyed card document is loaded. */
 public static function payload( array $card, $frame_profile ) {
  $native = isset( $card['native_meta'] ) && is_string( $card['native_meta'] ) ? json_decode( $card['native_meta'], true ) : array();
  $native = is_array( $native ) ? $native : array();
  return array(
   'specVersion' => self::SCHEMA,
   'snapshotMode' => 'dates-v1',
   'dbfId' => absint( $card['id'] ),
   'id' => isset( $card['card_code'] ) ? (string) $card['card_code'] : '',
   'date' => isset( $card['render_date'] ) ? (string) $card['render_date'] : '',
   'frameProfile' => (string) $frame_profile,
   'quantity' => max( 1, absint( isset( $card['count'] ) ? $card['count'] : 1 ) ),
   'set' => isset( $native['set'] ) && is_string( $native['set'] ) ? $native['set'] : '',
   // Only artworks may fall back to imported index metadata. Never take
   // historical stats, tags, text, race or spell school from this record.
   'art' => isset( $card['art'] ) ? esc_url_raw( $card['art'] ) : '',
   'lockedArt' => ! empty( $card['native_art_override'] ),
   'artOverride' => ! empty( $card['native_art_override'] ) ? absint( $card['native_art_override'] ) : 0,
  );
 }
}
