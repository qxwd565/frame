<?php
/**
 * Resolve one card's historical values once, before drawing either its deck
 * tile or its original Unity-compatible WebGL scene.
 *
 * Card changes are supplied exclusively by the API's history.json; this class
 * has no card-name or patch-date rules. One deck date is shared with its frame
 * profile and all output surfaces.
 *
 * @package HScard
 */
namespace HScard;

if ( ! defined( 'ABSPATH' ) ) { exit; }

final class Render_Spec {
	const SCHEMA = 1;

	/**
	 * Apply the API's changes to the stored card record. Date is already
	 * selected by Content_Filter. This is the only historical field merge.
	 */
	public static function apply( array $card, array $changes, $date ) {
		$card['name']         = isset( $card['name'] ) ? (string) $card['name'] : '';
		$card['display_name'] = $card['name'];
		$card['render_date']  = (string) $date;
		$card['dated_fields'] = array();
		// Recover legacy identity for every render surface without writing to
		// the database or replacing an existing nonempty string ID.
		if ( ( ! isset( $card['card_code'] ) || '' === trim( (string) $card['card_code'] ) ) && isset( $changes['card_code'] ) && is_string( $changes['card_code'] ) && preg_match( '/\A[A-Za-z0-9_]{1,96}\z/D', $changes['card_code'] ) ) {
			$card['card_code'] = $changes['card_code'];
		}
		foreach ( array( 'cost' => 'mana', 'attack' => 'attack', 'health' => 'health', 'durability' => 'durability', 'armor' => 'armor' ) as $field => $column ) {
			if ( isset( $changes[ $field ] ) && is_int( $changes[ $field ] ) ) {
				$card[ $column ] = $changes[ $field ];
				$card['dated_fields'][] = $field;
			}
		}
		if ( isset( $changes['name'] ) && is_string( $changes['name'] ) && '' !== trim( $changes['name'] ) ) {
			$card['display_name'] = sanitize_text_field( $changes['name'] );
			$card['dated_fields'][] = 'name';
		}
		if ( isset( $changes['text'] ) && is_string( $changes['text'] ) ) {
			$card['card_text'] = $changes['text'];
			$card['dated_fields'][] = 'text';
		}
		if ( isset( $changes['race'] ) && is_string( $changes['race'] ) ) {
			$card['tribe'] = sanitize_text_field( $changes['race'] );
			$card['dated_fields'][] = 'race';
		}
		if ( isset( $changes['spellSchool'] ) && is_string( $changes['spellSchool'] ) ) {
			$card['spell_school'] = sanitize_text_field( $changes['spellSchool'] );
			$card['dated_fields'][] = 'spellSchool';
		}
		if ( ! empty( $changes['art'] ) && is_string( $changes['art'] ) ) {
			// Resolved history art must point at a real, safely encoded HTTPS file.
			$art = esc_url_raw( $changes['art'] );
			if ( preg_match( '~^https://~i', $art ) ) {
				$card['art']          = $art;
				$card['crop_image']   = $art;
				$card['dated_fields'][] = 'art';
			}
		}
		// History may also change frame-affecting attributes. Keep these edits
		// alongside the dated values rather than deriving them in JavaScript.
		foreach ( array( 'type' => 'card_type', 'cardClass' => 'card_class', 'watermark' => 'render_watermark' ) as $key => $field ) {
			if ( isset( $changes[ $key ] ) && is_string( $changes[ $key ] ) ) {
				$card[ $field ] = sanitize_text_field( $changes[ $key ] );
				$card['dated_fields'][] = $key;
			}
		}
		if ( isset( $changes['rarity'] ) && is_string( $changes['rarity'] ) ) {
			$rarities = array( 'FREE' => 1, 'COMMON' => 2, 'RARE' => 3, 'EPIC' => 4, 'LEGENDARY' => 5 );
			$key = strtoupper( $changes['rarity'] );
			if ( isset( $rarities[ $key ] ) ) {
				$card['rarity_id'] = $rarities[ $key ];
				$card['dated_fields'][] = 'rarity';
			}
		}
		foreach ( array( 'nativeTags' => 'render_tags', 'mechanics' => 'render_mechanics' ) as $key => $field ) {
			if ( isset( $changes[ $key ] ) && is_array( $changes[ $key ] ) ) {
				$card[ $field ] = $changes[ $key ];
				$card['dated_fields'][] = $key;
			}
		}
		$card['native_cost_override'] = in_array( 'cost', $card['dated_fields'], true );
		return $card;
	}

	/**
	 * Serialize the finalized row (after Zilliax and art overrides) into one
	 * canonical, date-qualified card spec. The browser may add native graphics
	 * metadata but MUST NOT reselect these resolved card fields from the API.
	 */
	public static function payload( array $card, $frame_profile ) {
		$rarities = array( 1 => 'FREE', 2 => 'COMMON', 3 => 'RARE', 4 => 'EPIC', 5 => 'LEGENDARY' );
		$rarity_id = isset( $card['rarity_id'] ) ? absint( $card['rarity_id'] ) : 0;
		return array(
			'specVersion'  => self::SCHEMA,
			'type'         => isset( $card['card_type'] ) ? strtoupper( (string) $card['card_type'] ) : '',
			// Preserve an absent class so the matched API record can supply it.
			'cardClass'    => isset( $card['card_class'] ) ? strtoupper( preg_replace( '/[^A-Za-z]/', '', (string) $card['card_class'] ) ) : '',
			'rarity'       => isset( $rarities[ $rarity_id ] ) ? $rarities[ $rarity_id ] : 'FREE',
			'watermark'    => isset( $card['render_watermark'] ) ? (string) $card['render_watermark'] : null,
			'nativeTags'   => isset( $card['render_tags'] ) ? $card['render_tags'] : null,
			'mechanics'    => isset( $card['render_mechanics'] ) ? $card['render_mechanics'] : null,
			'date'         => isset( $card['render_date'] ) ? (string) $card['render_date'] : '',
			'frameProfile' => (string) $frame_profile,
			'quantity'     => max( 1, absint( isset( $card['count'] ) ? $card['count'] : 1 ) ),
			'dbfId'        => absint( $card['id'] ),
			'id'           => isset( $card['card_code'] ) ? (string) $card['card_code'] : '',
			'name'         => (string) $card['display_name'],
			'text'         => isset( $card['card_text'] ) ? (string) $card['card_text'] : '',
			'lockedText'   => in_array( 'text', isset( $card['dated_fields'] ) ? $card['dated_fields'] : array(), true ),
			'cost'         => max( 0, (int) $card['mana'] ),
			'attack'       => isset( $card['attack'] ) ? max( 0, (int) $card['attack'] ) : 0,
			'health'       => isset( $card['health'] ) ? max( 0, (int) $card['health'] ) : 0,
			'durability'   => isset( $card['durability'] ) ? max( 0, (int) $card['durability'] ) : 0,
			'armor'        => isset( $card['armor'] ) ? max( 0, (int) $card['armor'] ) : 0,
			'race'         => isset( $card['tribe'] ) ? (string) $card['tribe'] : '',
			'school'       => isset( $card['spell_school'] ) ? (string) $card['spell_school'] : '',
			'art'          => isset( $card['art'] ) ? esc_url_raw( str_replace( '/qxwd565/Hearthstone-legacy-API/', '/qxwd565/legacy/', $card['art'] ) ) : '',
			// A hand-selected portrait or a historical override must never be
			// replaced by the current remote API artwork.
			'lockedArt'    => ! empty( $card['native_art_override'] ) || in_array( 'art', isset( $card['dated_fields'] ) ? $card['dated_fields'] : array(), true ),
		);
	}
}
