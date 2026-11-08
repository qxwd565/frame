<?php
/**
 * Block-AST deck-code transformation.
 *
 * @package HScard
 */

namespace HScard;

use InvalidArgumentException;

if ( ! defined( 'ABSPATH' ) ) {
	exit;
}

final class Content_Filter {
	private $deckstring;
	private $store;
	private $history;
	private $view;

	public function __construct( Deckstring $deckstring, Card_Store $store, Card_History $history, Deck_View $view ) {
		$this->deckstring = $deckstring;
		$this->store      = $store;
		$this->history    = $history;
		$this->view       = $view;
	}

	public function register_hooks() {
		add_filter( 'the_content', array( $this, 'filter' ), 8 );
		add_filter( 'the_content', array( $this, 'remove_leading_autop_break' ), 12 );
	}

	public function remove_leading_autop_break( $content ) {
		if ( false === strpos( (string) $content, 'hscard-deck-list' ) ) {
			return $content;
		}

		return preg_replace(
			'/<br\s*\/?>\s*(?=<section\b[^>]*class="[^"]*\bhscard-deck-list\b[^"]*")/i',
			'',
			(string) $content
		);
	}

	public function filter( $content ) {
		if ( ! $this->is_main_post() || false === strpos( (string) $content, 'AAE' ) ) {
			return $content;
		}

		$blocks         = parse_blocks( $content );
		$published_date = get_post_field( 'post_date', get_the_ID(), 'raw' );
		$changed        = $this->transform_document( $blocks, $published_date );
		return $changed ? serialize_blocks( $blocks ) : $content;
	}

	private function transform_document( array &$blocks, $published_date ) {
		$flow = array();
		$this->collect_flow_blocks( $blocks, $flow );

		$decoded_decks = array();
		$decoded_cache = array();
		$lookup_ids    = array();
		$count         = count( $flow );
		for ( $index = 0; $index < $count; $index++ ) {
			if ( ! isset( $flow[ $index ]['innerHTML'] ) || ! empty( $flow[ $index ]['context_only'] ) ) {
				continue;
			}

			$block_decks = $this->decoded_decks_from_block( $flow[ $index ], $decoded_cache );
			if ( empty( $block_decks ) ) {
				continue;
			}

			foreach ( $block_decks as $decoded ) {
				foreach ( array_keys( $decoded['card_counts'] ) as $card_id ) {
					$card_id = absint( $card_id );
					if ( $card_id > 0 ) {
						$lookup_ids[ $card_id ] = true;
					}
				}
				foreach ( $decoded['art_overrides'] as $art_id ) {
					$art_id = absint( $art_id );
					if ( $art_id > 0 ) {
						$lookup_ids[ $art_id ] = true;
					}
				}
			}
			$decoded_decks[ $index ] = $block_decks;
		}

		if ( empty( $decoded_decks ) ) {
			return false;
		}

		$all_cards   = $this->store->find_cards( array_keys( $lookup_ids ) );
		$replacement = $this->store->original_printing_replacements( $all_cards );
		$id_map      = array();
		foreach ( $replacement as $core_id => $card ) {
			$original_id                  = absint( $card['id'] );
			$id_map[ absint( $core_id ) ] = $original_id;
			$all_cards[ $original_id ]    = $card;
		}
		// Resolve nearby dates before replacing any source blocks with deck HTML.
		$deck_dates       = $this->deck_dates( $flow, $decoded_decks, $published_date );
		$date_corrections = array();
		$default_title    = null;
		$changed          = false;
		foreach ( $decoded_decks as $index => $block_decks ) {
			$date          = substr( (string) $deck_dates[ $index ], 0, 10 );
			$frame_profile = Frame_Profiles::for_date( $date );
			if ( ! isset( $date_corrections[ $date ] ) ) {
				if ( count( $date_corrections ) >= 64 ) {
					$date_corrections = array();
				}
				$date_corrections[ $date ] = $this->history->corrections( $all_cards, $date );
			}
			$all_corrections    = $date_corrections[ $date ];
			$alignment          = $this->block_alignment( $flow[ $index ] );
			$rendered_sections  = array();
			$has_custom_pair    = 2 === count( $block_decks )
				&& empty( $block_decks[0]['is_custom'] )
				&& ! empty( $block_decks[1]['is_custom'] );
			$shared_title_group = $has_custom_pair ? 'source-' . absint( $index ) : '';
			foreach ( $block_decks as $decoded ) {
				$card_counts      = self::remap_counts( $decoded['card_counts'], $id_map );
				$sideboard_owners = self::remap_sideboard_owners( $decoded['sideboard_owners'], $id_map );
				$art_overrides    = self::remap_art_overrides( $decoded['art_overrides'], $id_map );
				$needed_ids       = $card_counts;
				foreach ( $art_overrides as $art_id ) {
					$needed_ids[ absint( $art_id ) ] = true;
				}
				$cards      = array_intersect_key( $all_cards, $needed_ids );
				$deck_cards = array_intersect_key( $all_cards, $card_counts );
				if ( count( $deck_cards ) !== count( $card_counts ) ) {
					// Preserve the entire source paragraph if any companion is unavailable.
					$rendered_sections = array();
					break;
				}

				$corrections = array_intersect_key( $all_corrections, $deck_cards );
				$deck_class  = self::deck_class_from_heroes( $decoded['heroes'] );
				if ( '' === $decoded['title'] && null === $default_title ) {
					$default_title = get_the_date( 'Y년 n월 j일', get_the_ID() );
				}
				$deck_title = '' !== $decoded['title'] ? $decoded['title'] : $default_title;
				$output     = $this->view->render(
					$card_counts,
					$cards,
					$corrections,
					$decoded['code'],
					$alignment,
					$sideboard_owners,
					$art_overrides,
					$deck_title,
					$deck_class,
					$shared_title_group,
					! empty( $decoded['is_custom'] ),
					$date,
					$frame_profile
				);
				if ( '' !== $output ) {
					$rendered_sections[] = array(
						'html'      => $output,
						'is_custom' => ! empty( $decoded['is_custom'] ),
					);
				}
			}

			if ( empty( $rendered_sections ) ) {
				continue;
			}

			$flow[ $index ] = $this->html_block( $this->rendered_deck_groups( $rendered_sections ) );
			$changed        = true;
		}

		return $changed;
	}

	/**
	 * Finds the nearest date within three preceding nonempty blocks.
	 * Undated headings delimit sections; deck codes are never date sources.
	 *
	 * @param array  $flow           Flattened source blocks.
	 * @param array  $decoded_decks  Decks indexed by source block.
	 * @param string $published_date Publication date, also supplying omitted years.
	 * @return array Effective dates indexed by deck block.
	 */
	private function deck_dates( array $flow, array $decoded_decks, $published_date ) {
		$dates        = array();
		$texts        = array();
		$parsed_dates = array();
		foreach ( $decoded_decks as $index => $decks ) {
			$dates[ $index ] = $published_date;
			$remaining       = 3;
			for ( $previous = $index - 1; $previous >= 0 && $remaining > 0; --$previous ) {
				// A decoded deck consumes proximity but cannot supply a date.
				if ( isset( $decoded_decks[ $previous ] ) ) {
					--$remaining;
					continue;
				}
				if ( ! isset( $texts[ $previous ] ) ) {
					$html               = isset( $flow[ $previous ]['innerHTML'] ) ? $flow[ $previous ]['innerHTML'] : '';
					$texts[ $previous ] = trim( html_entity_decode( wp_strip_all_tags( preg_replace( '/<\/?(?:p|div|br|li|h[1-6])\b[^>]*>/i', ' ', $html ) ), ENT_QUOTES | ENT_HTML5, 'UTF-8' ) );
				}
				$text = $texts[ $previous ];
				if ( '' === $text ) {
					continue;
				}
				--$remaining;
				if ( false !== strpos( $text, 'AAE' ) ) {
					continue;
				}
				if ( ! array_key_exists( $previous, $parsed_dates ) ) {
					$parsed_dates[ $previous ] = $this->date_from_text( $text, $published_date );
				}
				$date = $parsed_dates[ $previous ];
				if ( null !== $date ) {
					if ( '' !== $date ) {
						$dates[ $index ] = $date;
					}
					break;
				}
				if ( 'core/heading' === $flow[ $previous ]['blockName'] || preg_match( '/<h[1-6]\b/i', $flow[ $previous ]['innerHTML'] ) ) {
					break;
				}
			}
		}
		// The theme can supply the same canonical date used in its visible deck
		// timeline: add_filter('hscard_deck_effective_date', ..., 10, 3).
		// Existing nearby-date fallback is retained when no valid date is given.
		foreach ( $dates as $index => $date ) {
			$selected = apply_filters( 'hscard_deck_effective_date', $date, get_the_ID(), $index );
			if ( is_string( $selected ) && preg_match( '/^([12]\d{3})-(\d{2})-(\d{2})$/D', $selected, $match )
				&& checkdate( (int) $match[2], (int) $match[3], (int) $match[1] ) ) {
				$dates[ $index ] = $selected;
			}
		}
		return $dates;
	}

	/**
	 * Reads a Korean date or date range, retaining its first day for history.
	 *
	 * @param string $text           Nearby visible text.
	 * @param string $published_date Publication date for an omitted start year.
	 * @return string|null ISO date, empty string for invalid dates, or null when absent.
	 */
	private function date_from_text( $text, $published_date ) {
		$day = '(?:(\d{4})\s*년\s*)?(\d{1,2})\s*월\s*(\d{1,2})\s*일';
		if ( ! preg_match_all( '/(?<![\d년])' . $day . '(?:\s*(?:[~～–—-]|부터)\s*' . $day . ')?/u', $text, $matches, PREG_SET_ORDER ) ) {
			return null;
		}
		$match = end( $matches );
		$year  = '' !== $match[1] ? (int) $match[1] : (int) substr( $published_date, 0, 4 );
		$month = (int) $match[2];
		$day   = (int) $match[3];
		if ( '' === $match[1] ) {
			$year = $this->nearest_date_year( $month, $day, $published_date );
		}
		if ( ! checkdate( $month, $day, $year ) ) {
			return '';
		}
		if ( isset( $match[6] ) ) {
			$end_year = '' !== $match[4] ? (int) $match[4] : $year;
			if ( '' === $match[4] ) {
				$end_year = $this->nearest_date_year( (int) $match[5], (int) $match[6], sprintf( '%04d-%02d-%02d', $year, $month, $day ) );
			}
			if ( ! checkdate( (int) $match[5], (int) $match[6], $end_year ) || $end_year < $year || ( $end_year === $year && ( (int) $match[5] * 100 + (int) $match[6] ) < $month * 100 + $day ) ) {
				return '';
			}
		}
		return sprintf( '%04d-%02d-%02d', $year, $month, $day );
	}

	/**
	 * Finds the earliest valid occurrence of a month/day on or after a date.
	 *
	 * @param int    $month      Requested month.
	 * @param int    $day        Requested day.
	 * @param string $not_before Inclusive local calendar date, in ISO format.
	 * @return int Resolved year, or zero for an impossible date.
	 */
	private function nearest_date_year( $month, $day, $not_before ) {
		// A leap-year check rejects impossible month/day pairs before searching.
		if ( ! checkdate( $month, $day, 2000 ) ) {
			return 0;
		}
		$year = (int) substr( $not_before, 0, 4 );
		if ( $month * 100 + $day < (int) substr( $not_before, 5, 2 ) * 100 + (int) substr( $not_before, 8, 2 ) ) {
			++$year;
		}
		// Gregorian leap days recur within eight years, including century gaps.
		$last_year = min( 9999, $year + 8 );
		for ( ; $year > 0 && $year <= $last_year; ++$year ) {
			if ( checkdate( $month, $day, $year ) ) {
				return $year;
			}
		}
		return 0;
	}

	/**
	 * Appends an immediately following custom deck below its primary deck.
	 *
	 * @param array<int,array{html:string,is_custom:bool}> $sections Rendered deck sections.
	 * @return string Grouped deck HTML.
	 */
	private function rendered_deck_groups( array $sections ) {
		$html  = '';
		$count = count( $sections );
		for ( $index = 0; $index < $count; $index++ ) {
			$section = $sections[ $index ];
			if (
				empty( $section['is_custom'] )
				&& isset( $sections[ $index + 1 ] )
				&& ! empty( $sections[ $index + 1 ]['is_custom'] )
			) {
				$html .= $this->append_custom_deck( $section['html'], $sections[ $index + 1 ]['html'] );
				++$index;
				continue;
			}
			$html .= $section['html'];
		}

		return $html;
	}

	/**
	 * Moves a custom companion's card rows into the primary deck frame.
	 *
	 * @param string $primary_html Primary deck HTML.
	 * @param string $custom_html  Custom companion deck HTML.
	 * @return string Combined deck HTML.
	 */
	private function append_custom_deck( $primary_html, $custom_html ) {
		$matched = preg_match( '/<ol class="hscard-deck-cards hscard-deck-column">.*?<\/ol>/s', $custom_html, $custom_cards );
		if ( 1 !== $matched || empty( $custom_cards[0] ) ) {
			return '<div class="hscard-deck-pair">' . $primary_html . $custom_html . '</div>';
		}

		$footer_marker = '<footer class="hscard-deck-summary">';
		$footer_offset = strpos( $primary_html, $footer_marker );
		if ( false === $footer_offset ) {
			return '<div class="hscard-deck-pair">' . $primary_html . $custom_html . '</div>';
		}

		$custom_list = str_replace(
			'hscard-deck-cards hscard-deck-column',
			'hscard-deck-cards hscard-deck-column hscard-deck-column--custom',
			$custom_cards[0]
		);
		$label       = esc_html__( '커스텀 카드', 'hscard' );
		$divider     = '<div class="hscard-deck-custom-separator" role="separator" aria-label="' . esc_attr( $label ) . '">' . $label . '</div>';

		return substr( $primary_html, 0, $footer_offset ) . $divider . $custom_list . substr( $primary_html, $footer_offset );
	}

	private static function remap_counts( array $counts, array $id_map ) {
		if ( ! $id_map ) {
			return $counts;
		}
		$remapped = array();
		foreach ( $counts as $card_id => $count ) {
			$card_id                = absint( $card_id );
			$target_id              = isset( $id_map[ $card_id ] ) ? $id_map[ $card_id ] : $card_id;
			$remapped[ $target_id ] = isset( $remapped[ $target_id ] ) ? $remapped[ $target_id ] + absint( $count ) : absint( $count );
		}
		ksort( $remapped, SORT_NUMERIC );
		return $remapped;
	}

	private static function remap_sideboard_owners( array $owners, array $id_map ) {
		if ( ! $id_map ) {
			return $owners;
		}
		$remapped = array();
		foreach ( $owners as $card_id => $owner_id ) {
			$card_id                = absint( $card_id );
			$owner_id               = absint( $owner_id );
			$target_id              = isset( $id_map[ $card_id ] ) ? $id_map[ $card_id ] : $card_id;
			$remapped[ $target_id ] = isset( $id_map[ $owner_id ] ) ? $id_map[ $owner_id ] : $owner_id;
		}
		return $remapped;
	}

	private static function remap_art_overrides( array $overrides, array $id_map ) {
		if ( ! $id_map ) {
			return $overrides;
		}
		$remapped = array();
		foreach ( $overrides as $card_id => $art_id ) {
			$card_id                = absint( $card_id );
			$target_id              = isset( $id_map[ $card_id ] ) ? $id_map[ $card_id ] : $card_id;
			$remapped[ $target_id ] = absint( $art_id );
		}
		return $remapped;
	}

	private function collect_flow_blocks( array &$blocks, array &$flow ) {
		foreach ( $blocks as &$block ) {
			$name = isset( $block['blockName'] ) ? $block['blockName'] : null;
			if ( 'core/list' === $name || empty( $block['innerBlocks'] ) ) {
				$flow[] =& $block;
				continue;
			}

			$this->collect_flow_blocks( $block['innerBlocks'], $flow );
			// Gutenberg stores a quote's citation on the parent, outside innerBlocks.
			// It follows the children visually, and supplies context without being rewritten.
			if (
				in_array( $name, array( 'core/quote', 'core/pullquote' ), true )
				&& isset( $block['innerHTML'] )
				&& preg_match( '/<cite\b[^>]*>.*?<\/cite\s*>/is', $block['innerHTML'], $citation )
			) {
				$flow[] = array(
					'blockName'    => $name,
					'innerHTML'    => $citation[0],
					'context_only' => true,
				);
			}
		}
		unset( $block );
	}

	/**
	 * Decodes each deck code with its own optional inline title.
	 *
	 * @param array $block Parsed content block.
	 * @param array $cache Up to 64 decoded codes, shared within this document only.
	 * @return array[] Decoded decks, or an empty array when the block is invalid.
	 */
	private function decoded_decks_from_block( array $block, array &$cache ) {
		$html = isset( $block['innerHTML'] ) ? (string) $block['innerHTML'] : '';
		if ( false === strpos( (string) $html, 'AAE' ) ) {
			return array();
		}

		$identities = $this->same_paragraph_deck_identities( $block, $html );
		if ( null === $identities ) {
			$identities = array(
				array(
					'code'      => $this->deckstring->code_from_html( $html ),
					'title'     => '',
					'is_custom' => false,
				),
			);
		}

		$decoded_decks = array();
		foreach ( $identities as $identity ) {
			$code   = $identity['code'];
			$title  = $identity['title'];
			$length = strlen( $code );
			if ( $length < 16 || $length > Deckstring::MAX_ENCODED || 0 !== strncmp( $code, 'AAE', 3 ) ) {
				return array();
			}

			if ( isset( $cache[ $code ] ) ) {
				$decoded = $cache[ $code ];
			} else {
				try {
					$card_counts = $this->deckstring->decode( $code );
				} catch ( InvalidArgumentException $error ) {
					return array();
				}
				$decoded = array(
					'card_counts'      => $card_counts,
					'heroes'           => $this->deckstring->heroes(),
					'sideboard_owners' => $this->deckstring->sideboard_owners(),
					'art_overrides'    => $this->deckstring->art_overrides(),
				);
				if ( count( $cache ) < 64 ) {
					$cache[ $code ] = $decoded;
				}
			}

			$decoded['code']      = $code;
			$decoded['title']     = $title;
			$decoded['is_custom'] = ! empty( $identity['is_custom'] );
			$decoded_decks[]      = $decoded;
		}

		return $decoded_decks;
	}

	/**
	 * Reads optional `name: code` titles on each forced-break deck-code line.
	 *
	 * A title never comes from a preceding line or paragraph. Code-only wrapped
	 * paragraphs can still use the regular normalizer when this parser declines.
	 * A custom `+code` must immediately follow a primary deck; an unnamed custom
	 * deck shares that primary deck's title.
	 *
	 * @param array  $block Parsed content block.
	 * @param string $html  Block inner HTML.
	 * @return array<int,array{code:string,title:string,is_custom:bool}>|null Deck identities.
	 */
	private function same_paragraph_deck_identities( array $block, $html ) {
		$name = isset( $block['blockName'] ) ? $block['blockName'] : null;
		if ( 'core/paragraph' !== $name && 1 !== preg_match( '/^\s*<p\b[^>]*>.*<\/p>\s*$/isu', $html ) ) {
			return null;
		}
		if ( 1 !== preg_match( '/^\s*<p\b[^>]*>(.*)<\/p>\s*$/isu', $html, $paragraph ) ) {
			return null;
		}

		$parts      = preg_split( '/<br\b[^>]*>/iu', $paragraph[1] );
		$identities = array();
		foreach ( $parts as $part ) {
			$plain = html_entity_decode( wp_strip_all_tags( (string) $part ), ENT_QUOTES | ENT_HTML5, 'UTF-8' );
			$plain = trim( str_replace( "\xC2\xA0", ' ', $plain ) );
			if ( '' === $plain ) {
				continue;
			}
			$title = '';
			if ( 1 === preg_match( '/^(.+?)[:：]\s*(\+?\s*AAE[A-Za-z0-9+\/=\s]*)$/u', $plain, $named ) ) {
				$title = self::normalise_text( $named[1] );
				if ( '' === $title || self::text_length( $title ) > 120 ) {
					return null;
				}
				$title = sanitize_text_field( $title );
				$plain = $named[2];
			}
			$is_custom = 1 === preg_match( '/^\s*\+/u', $plain );
			if ( $is_custom ) {
				$plain = preg_replace( '/^\s*\+\s*/u', '', $plain, 1 );
			}
			$code = $this->deckstring->code_from_html( $plain );
			if ( 0 !== strncmp( $code, 'AAE', 3 ) ) {
				return null;
			}
			if ( $is_custom ) {
				$previous = count( $identities ) - 1;
				if ( $previous < 0 || ! empty( $identities[ $previous ]['is_custom'] ) ) {
					return null;
				}
				if ( '' === $title ) {
					$title = $identities[ $previous ]['title'];
				}
			}
			$identities[] = array(
				'code'      => $code,
				'title'     => $title,
				'is_custom' => $is_custom,
			);
		}
		return $identities ? $identities : null;
	}

	/**
	 * Resolves one deck class from decoded hero DBF IDs.
	 *
	 * Unknown heroes and mixed-class hero lists deliberately have no fallback.
	 *
	 * @param int[] $heroes Hero DBF IDs.
	 * @return string Class key, or an empty string.
	 */
	private static function deck_class_from_heroes( array $heroes ) {
		static $classes = array(
			7     => 'warrior',
			31    => 'hunter',
			274   => 'druid',
			637   => 'mage',
			671   => 'paladin',
			813   => 'priest',
			893   => 'warlock',
			930   => 'rogue',
			1066  => 'shaman',
			56550 => 'demon-hunter',
			78065 => 'death-knight',
		);
		$deck_class     = '';
		foreach ( $heroes as $hero_id ) {
			$hero_id = (int) $hero_id;
			if ( ! isset( $classes[ $hero_id ] ) ) {
				return '';
			}
			if ( '' !== $deck_class && $deck_class !== $classes[ $hero_id ] ) {
				return '';
			}
			$deck_class = $classes[ $hero_id ];
		}

		return $deck_class;
	}

	private static function normalise_text( $text ) {
		$text = preg_replace( '/\s+/u', ' ', trim( str_replace( "\xC2\xA0", ' ', (string) $text ) ) );
		return is_string( $text ) ? $text : '';
	}

	private static function text_length( $text ) {
		return function_exists( 'mb_strlen' ) ? mb_strlen( (string) $text, 'UTF-8' ) : strlen( (string) $text );
	}

	private function html_block( $html ) {
		return array(
			'blockName'    => 'core/html',
			'attrs'        => array(),
			'innerBlocks'  => array(),
			'innerHTML'    => (string) $html,
			'innerContent' => array( (string) $html ),
		);
	}

	private function block_alignment( array $block ) {
		$alignment = isset( $block['attrs']['align'] ) ? (string) $block['attrs']['align'] : '';
		if ( '' === $alignment && isset( $block['attrs']['textAlign'] ) ) {
			$alignment = (string) $block['attrs']['textAlign'];
		}
		if ( in_array( $alignment, array( 'left', 'center', 'right' ), true ) ) {
			return $alignment;
		}

		$html = isset( $block['innerHTML'] ) ? (string) $block['innerHTML'] : '';
		if ( preg_match( '/\bhas-text-align-(left|center|right)\b/', $html, $match ) ) {
			return $match[1];
		}
		return 'left';
	}

	private function is_main_post() {
		return ! is_admin() && is_singular( array( 'post', 'page' ) ) && in_the_loop() && is_main_query();
	}
}
