<?php
/**
 * API-owned, date-specific card changes.
 *
 * The plugin contains no card-specific patch rules. API repositories own
 * data/<cardId>.json and the compact generated history.json index. The index
 * is cached as a small WordPress transient, not downloaded for every deck.
 *
 * @package HScard
 */
namespace HScard;

if ( ! defined( 'ABSPATH' ) ) { exit; }

final class Card_History {
	const CACHE_SECONDS = 900;
	const MAX_RESPONSE_BYTES = 524288;
	private $index_cache = array();

	/** Return changed fields for the requested date, keyed by numeric DBF ID. */
	public function corrections( array $cards, $published_date ) {
		$date = substr( trim( (string) $published_date ), 0, 10 );
		if ( ! self::valid_date( $date ) || ! $cards ) { return array(); }

		$sources = Json_Sources::all();
		$groups = Json_Sources::source_groups_for_cards( $cards, $sources );
		$result = array();
		$resolved_codes = array();
		$conflicts = array();
		foreach ( $groups as $source_id => $requested ) {
			if ( ! isset( $sources[ $source_id ] ) ) { continue; }
			$index = $this->load_index( $source_id, $sources[ $source_id ] );
			if ( ! $index ) { continue; }
			foreach ( $requested as $dbf_id => $code ) {
				$record = isset( $index[ $dbf_id ] ) ? $index[ $dbf_id ] : null;
				if ( ! is_array( $record ) || ! isset( $record['id'], $record['history'] ) || ! is_string( $record['id'] ) || ! preg_match( '/\A[A-Za-z0-9_]{1,96}\z/D', $record['id'] ) || ( '' !== $code && $code !== $record['id'] ) || ! is_array( $record['history'] ) ) { continue; }
				// A blank legacy ID can be recovered by exact DBF identity. Never
				// merge histories if enabled sources disagree about that identity.
				if ( isset( $resolved_codes[ $dbf_id ] ) && $resolved_codes[ $dbf_id ] !== $record['id'] ) {
					$conflicts[ $dbf_id ] = true;
					continue;
				}
				$resolved_codes[ $dbf_id ] = $record['id'];
				$changes = self::resolve( $record['history'], $date );
				$changes['card_code'] = $record['id'];
				if ( isset( $changes['art'] ) ) {
					$changes['art'] = $this->art_url( $changes['art'], $source_id, $sources[ $source_id ] );
					if ( '' === $changes['art'] ) { unset( $changes['art'] ); }
				}
				// First source wins per field only for the same verified identity.
				$result[ $dbf_id ] = isset( $result[ $dbf_id ] ) ? $result[ $dbf_id ] + $changes : $changes;
			}
		}
		return array_diff_key( $result, $conflicts );
	}

	/** Translate an API-owned art filename to the source's image URL. */
	private function art_url( $path, $source_id, array $source ) {
		if ( ! is_string( $path ) || '' === $path ) { return ''; }
		if ( preg_match( '~^https://[a-z0-9._-]+(?::443)?/[^\s<>\x00-\x1f]+$~i', $path ) ) { return esc_url_raw( $path ); }
		if ( ! preg_match( '~^art/[A-Za-z0-9_-]+(?:/[A-Za-z0-9_-]+)*\.(?:png|jpg|webp)$~i', $path ) ) { return ''; }
		$source_url = 'local' === ( isset( $source['mode'] ) ? $source['mode'] : '' )
			? ( isset( $source['art_base'] ) && $source['art_base'] ? (string) $source['art_base'] : (string) ( isset( $source['url'] ) ? $source['url'] : '' ) )
			: Json_Sources::url( $source_id, $source );
		if ( ! preg_match( '~^https://[^?#]+/[^/]+\.json(?:\?.*)?$~i', $source_url ) ) { return ''; }
		return esc_url_raw( substr( $source_url, 0, strrpos( strtok( $source_url, '?' ), '/' ) + 1 ) . $path );
	}

	/** Load compact generated data; locally edited JSON is read from its option. */
	private function load_index( $source_id, array $source ) {
		if ( array_key_exists( $source_id, $this->index_cache ) ) { return $this->index_cache[ $source_id ]; }
		if ( empty( $source['enabled'] ) ) { return array(); }
		if ( 'local' === ( isset( $source['mode'] ) ? $source['mode'] : '' ) ) {
			$data = json_decode( Json_Sources::content( $source_id ), true );
			$index = array();
			foreach ( is_array( $data ) && isset( $data['cards'] ) && is_array( $data['cards'] ) ? $data['cards'] : array() as $card ) {
				if ( is_array( $card ) && isset( $card['dbfId'], $card['id'], $card['history'] ) && is_array( $card['history'] ) ) {
					$index[ absint( $card['dbfId'] ) ] = array( 'id' => (string) $card['id'], 'history' => $card['history'] );
				}
			}
			return $this->index_cache[ $source_id ] = $index;
		}

		$url = Json_Sources::url( $source_id, $source );
		if ( ! is_string( $url ) || ! preg_match( '~^https://[^?#]+/cards\.json(?:\?[^#]*)?$~i', $url ) ) {
			return $this->index_cache[ $source_id ] = array();
		}
		$history_url = preg_replace( '~cards\.json(?=\?|$)~i', 'history.json', $url );
		$key = 'hscard_hist_v2_' . substr( hash( 'sha256', $history_url ), 0, 32 );
		$cached = get_transient( $key );
		if ( is_array( $cached ) ) { return $this->index_cache[ $source_id ] = $cached; }
		$response = wp_safe_remote_get( $history_url, array(
			'timeout' => 4,
			'redirection' => 2,
			'limit_response_size' => self::MAX_RESPONSE_BYTES,
			'headers' => array( 'Accept' => 'application/json' ),
			'user-agent' => 'HScard/' . HSCARD_VERSION,
		) );
		if ( is_wp_error( $response ) || 200 !== (int) wp_remote_retrieve_response_code( $response ) ) {
			set_transient( $key, array(), 120 );
			return $this->index_cache[ $source_id ] = array();
		}
		$raw = wp_remote_retrieve_body( $response );
		if ( ! is_string( $raw ) || strlen( $raw ) > self::MAX_RESPONSE_BYTES ) {
			return $this->index_cache[ $source_id ] = array();
		}
		$data = json_decode( $raw, true );
		if ( ! is_array( $data ) || ! isset( $data['schema'], $data['cards'] ) || 1 !== $data['schema'] || ! is_array( $data['cards'] ) || count( $data['cards'] ) > 5000 ) {
			return $this->index_cache[ $source_id ] = array();
		}
		$index = array();
		foreach ( $data['cards'] as $id => $card ) {
			$id = absint( $id );
			if ( $id && is_array( $card ) && isset( $card['id'], $card['history'] ) && is_string( $card['id'] ) && is_array( $card['history'] ) ) {
				$index[ $id ] = array( 'id' => $card['id'], 'history' => $card['history'] );
			}
		}
		set_transient( $key, $index, self::CACHE_SECONDS );
		return $this->index_cache[ $source_id ] = $index;
	}

	/**
	 * API entries describe an earlier state: matching 'from' is inclusive and
	 * 'before' exclusive. The first matching entry wins per changed field.
	 */
	public static function resolve( array $history, $date ) {
		if ( ! self::valid_date( $date ) ) { return array(); }
		$resolved = array();
		$allowed = array( 'name', 'cost', 'text', 'attack', 'health', 'durability', 'armor', 'race', 'spellSchool', 'art', 'legacyArt', 'type', 'cardClass', 'rarity', 'watermark', 'mechanics', 'nativeTags' );
		foreach ( $history as $revision ) {
			if ( ! is_array( $revision ) || empty( $revision['changes'] ) || ! is_array( $revision['changes'] ) ) { continue; }
			if ( isset( $revision['from'] ) && ( ! self::valid_date( $revision['from'] ) || $date < $revision['from'] ) ) { continue; }
			if ( isset( $revision['before'] ) && ( ! self::valid_date( $revision['before'] ) || $date >= $revision['before'] ) ) { continue; }
			foreach ( $allowed as $key ) {
				if ( ! array_key_exists( $key, $resolved ) && array_key_exists( $key, $revision['changes'] ) ) {
					$value = $revision['changes'][ $key ];
					if ( in_array( $key, array( 'cost', 'attack', 'health', 'durability', 'armor' ), true ) ) {
						if ( is_int( $value ) && $value >= 0 && $value <= 32767 ) { $resolved[ $key ] = $value; }
					} elseif ( 'legacyArt' === $key ) {
						if ( is_bool( $value ) ) { $resolved[ $key ] = $value; }
					} elseif ( 'mechanics' === $key && is_array( $value ) && count( $value ) <= 100 ) {
						$resolved[ $key ] = array_values( array_filter( $value, 'is_string' ) );
					} elseif ( 'nativeTags' === $key && is_array( $value ) && count( $value ) <= 256 ) {
						$valid_tags = array();
						foreach ( $value as $tag ) {
							if ( is_array( $tag ) && isset( $tag['id'], $tag['value'] ) && is_numeric( $tag['id'] ) && is_numeric( $tag['value'] ) ) {
								$valid_tags[] = array( 'id' => (int) $tag['id'], 'value' => (int) $tag['value'] );
							}
						}
						$resolved[ $key ] = $valid_tags;
					} elseif ( is_string( $value ) && strlen( $value ) <= 10000 ) {
						$resolved[ $key ] = $value;
					}
				}
			}
		}
		return $resolved;
	}

	private static function valid_date( $date ) {
		if ( ! is_string( $date ) || ! preg_match( '/^([12]\d{3})-(\d{2})-(\d{2})$/D', $date, $m ) ) { return false; }
		return checkdate( (int) $m[2], (int) $m[3], (int) $m[1] );
	}
}
