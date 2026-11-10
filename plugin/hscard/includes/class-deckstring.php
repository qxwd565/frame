<?php
/**
 * Strict local Hearthstone deckstring decoder.
 *
 * @package HScard
 */

namespace HScard;

use InvalidArgumentException;

if ( ! defined( 'ABSPATH' ) ) {
	exit;
}

final class Deckstring {
	const MAX_ENCODED       = 16384;
	const MAX_DECODED       = 8192;
	const MAX_ITEMS         = 512;
	const MAX_COUNT         = 1000;
	const MAX_TOTAL         = 2048;
	const MAX_VARINT        = 2147483647;
	const ZILLIAX_OWNER_IDS = array(
		102983 => 102983,
		110440 => 110440,
		110441 => 110441,
		110442 => 110442,
		110443 => 110443,
		110444 => 110444,
		110445 => 110445,
		110446 => 110446,
		112530 => 112530,
	);

	private $sideboard_owners = array();
	private $art_overrides    = array();
	private $heroes           = array();

	public function code_from_html( $html ) {
		$text = html_entity_decode( wp_strip_all_tags( (string) $html ), ENT_QUOTES | ENT_HTML5, 'UTF-8' );
		$code = preg_replace( '/\s+/u', '', str_replace( "\xC2\xA0", '', $text ) );
		return is_string( $code ) ? $code : '';
	}

	public function decode( $code ) {
		$this->sideboard_owners = array();
		$this->art_overrides    = array();
		$this->heroes           = array();
		$data                   = $this->decode_base64( (string) $code );
		$offset                 = 0;
		$length                 = strlen( $data );

		if ( 0 === $length || 0 !== ord( $data[ $offset++ ] ) || 1 !== $this->read_varint( $data, $offset, $length ) ) {
			throw new InvalidArgumentException( 'Invalid deck header.' );
		}
		$format = $this->read_varint( $data, $offset, $length );
		if ( $format < 1 || $format > 4 ) {
			throw new InvalidArgumentException( 'Unsupported deck format.' );
		}

		$hero_count = $this->read_bounded( $data, $offset, $length, 16 );
		if ( $hero_count < 1 ) {
			throw new InvalidArgumentException( 'Missing deck hero.' );
		}
		$heroes = array();
		for ( $index = 0; $index < $hero_count; $index++ ) {
			$hero = $this->read_positive( $data, $offset, $length );
			if ( isset( $heroes[ $hero ] ) ) {
				throw new InvalidArgumentException( 'Duplicate deck hero.' );
			}
			$heroes[ $hero ] = true;
		}
		$cards = array();
		$total = 0;
		$this->read_main_group( $data, $offset, $length, 1, $cards, $total );
		$this->read_main_group( $data, $offset, $length, 2, $cards, $total );
		$this->read_main_group( $data, $offset, $length, null, $cards, $total );
		if ( empty( $cards ) ) {
			throw new InvalidArgumentException( 'Empty deck.' );
		}

		if ( $offset < $length ) {
			$sideboard = ord( $data[ $offset++ ] );
			if ( 0 !== $sideboard && 1 !== $sideboard ) {
				throw new InvalidArgumentException( 'Invalid sideboard marker.' );
			}
			if ( 1 === $sideboard ) {
				$entries    = array();
				$side_total = 0;
				$this->read_sideboard_group( $data, $offset, $length, 1, $entries, $side_total );
				$this->read_sideboard_group( $data, $offset, $length, 2, $entries, $side_total );
				$this->read_sideboard_group( $data, $offset, $length, null, $entries, $side_total );
				foreach ( $entries as $entry ) {
					$owner = $this->display_owner( $entry['owner'], $cards );
					if ( null === $owner ) {
						continue;
					}
					$id                            = $entry['id'];
					$cards[ $id ]                  = isset( $cards[ $id ] ) ? $cards[ $id ] + $entry['count'] : $entry['count'];
					$this->sideboard_owners[ $id ] = $owner;
				}
			}
		}
		if ( $offset !== $length ) {
			throw new InvalidArgumentException( 'Trailing deck data.' );
		}

		$this->heroes = array_map( 'intval', array_keys( $heroes ) );
		sort( $this->heroes, SORT_NUMERIC );
		ksort( $cards, SORT_NUMERIC );
		return $cards;
	}

	/**
	 * Returns hero DBF IDs from the most recently decoded deck.
	 *
	 * @return int[]
	 */
	public function heroes() {
		return $this->heroes;
	}

	public function sideboard_owners() {
		return $this->sideboard_owners;
	}

	/**
	 * Returns main-card ID to deckstring-selected artwork-card ID mappings.
	 *
	 * Some Zilliax deckstrings keep the collectible base card in the main
	 * deck and store the selected assembled appearance as the sideboard owner.
	 *
	 * @return array
	 */
	public function art_overrides() {
		return $this->art_overrides;
	}

	private function display_owner( $owner, array $cards ) {
		if ( isset( $cards[ $owner ] ) ) {
			return $owner;
		}
		if ( ! isset( self::ZILLIAX_OWNER_IDS[ $owner ] ) ) {
			return null;
		}
		foreach ( self::ZILLIAX_OWNER_IDS as $candidate ) {
			if ( isset( $cards[ $candidate ] ) ) {
				if ( $owner !== $candidate ) {
					$this->art_overrides[ $candidate ] = $owner;
				}
				return $candidate;
			}
		}
		return null;
	}

	private function decode_base64( $code ) {
		if ( '' === $code || strlen( $code ) > self::MAX_ENCODED || 1 !== preg_match( '/\A[A-Za-z0-9+\/]*={0,2}\z/D', $code ) ) {
			throw new InvalidArgumentException( 'Invalid deck base64.' );
		}
		$core    = rtrim( $code, '=' );
		$padding = strlen( $code ) - strlen( $core );
		if ( 1 === strlen( $core ) % 4 || ( $padding > 0 && 0 !== strlen( $code ) % 4 ) ) {
			throw new InvalidArgumentException( 'Invalid deck padding.' );
		}
		$decoded   = base64_decode( $code, true ); // phpcs:ignore WordPress.PHP.DiscouragedPHPFunctions.obfuscation_base64_decode -- Base64 is the official Hearthstone deckstring transport encoding.
		$canonical = false !== $decoded
			? base64_encode( $decoded ) // phpcs:ignore WordPress.PHP.DiscouragedPHPFunctions.obfuscation_base64_encode -- Re-encoding verifies that the deckstring is canonical.
			: '';
		if ( false === $decoded || strlen( $decoded ) > self::MAX_DECODED || rtrim( $canonical, '=' ) !== $core ) {
			throw new InvalidArgumentException( 'Non-canonical deck base64.' );
		}
		return $decoded;
	}

	private function read_main_group( $data, &$offset, $length, $fixed_count, array &$cards, &$total ) {
		$items = $this->read_bounded( $data, $offset, $length, self::MAX_ITEMS );
		for ( $index = 0; $index < $items; $index++ ) {
			$id    = $this->read_positive( $data, $offset, $length );
			$count = null === $fixed_count ? $this->read_bounded( $data, $offset, $length, self::MAX_COUNT ) : $fixed_count;
			if ( $count < 1 || isset( $cards[ $id ] ) || count( $cards ) >= self::MAX_ITEMS || $total > self::MAX_TOTAL - $count ) {
				throw new InvalidArgumentException( 'Invalid main card group.' );
			}
			$cards[ $id ] = $count;
			$total       += $count;
		}
	}

	private function read_sideboard_group( $data, &$offset, $length, $fixed_count, array &$entries, &$total ) {
		$items = $this->read_bounded( $data, $offset, $length, self::MAX_ITEMS );
		for ( $index = 0; $index < $items; $index++ ) {
			$id    = $this->read_positive( $data, $offset, $length );
			$count = null === $fixed_count ? $this->read_bounded( $data, $offset, $length, self::MAX_COUNT ) : $fixed_count;
			$owner = $this->read_positive( $data, $offset, $length );
			$key   = $owner . ':' . $id;
			if ( $count < 1 || isset( $entries[ $key ] ) || count( $entries ) >= self::MAX_ITEMS || $total > self::MAX_TOTAL - $count ) {
				throw new InvalidArgumentException( 'Invalid sideboard group.' );
			}
			$entries[ $key ] = array(
				'id'    => $id,
				'count' => $count,
				'owner' => $owner,
			);
			$total          += $count;
		}
	}

	private function read_positive( $data, &$offset, $length ) {
		$value = $this->read_varint( $data, $offset, $length );
		if ( $value < 1 ) {
			throw new InvalidArgumentException( 'ID must be positive.' );
		}
		return $value;
	}

	private function read_bounded( $data, &$offset, $length, $maximum ) {
		$value = $this->read_varint( $data, $offset, $length );
		if ( $value > $maximum ) {
			throw new InvalidArgumentException( 'Deck limit exceeded.' );
		}
		return $value;
	}

	private function read_varint( $data, &$offset, $length ) {
		$value = 0;
		for ( $index = 0; $index < 5; $index++ ) {
			if ( $offset >= $length ) {
				throw new InvalidArgumentException( 'Truncated deck varint.' );
			}
			$byte    = ord( $data[ $offset++ ] );
			$payload = $byte & 0x7f;
			if ( 4 === $index && $payload > 7 ) {
				throw new InvalidArgumentException( 'Deck varint overflow.' );
			}
			$value |= $payload << ( $index * 7 );
			if ( 0 === ( $byte & 0x80 ) ) {
				if ( ( $index > 0 && 0 === $payload ) || $value > self::MAX_VARINT ) {
					throw new InvalidArgumentException( 'Non-minimal deck varint.' );
				}
				return $value;
			}
		}
		throw new InvalidArgumentException( 'Deck varint too long.' );
	}
}
