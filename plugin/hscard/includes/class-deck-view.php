<?php
/**
 * Builds and renders one tile for each decoded main-deck card ID.
 *
 * @package HScard
 */

namespace HScard;

if ( ! defined( 'ABSPATH' ) ) {
	exit;
}

/**
 * Builds semantic, accessible deck-list markup.
 */
final class Deck_View {
	const ACTIVE_VIEW_VERSION = 2;
	const LEGENDARY_RARITY_ID = 5;
	const DECK_CLASSES        = array(
		'death-knight' => true,
		'demon-hunter' => true,
		'druid'        => true,
		'hunter'       => true,
		'mage'         => true,
		'paladin'      => true,
		'priest'       => true,
		'rogue'        => true,
		'shaman'       => true,
		'warlock'      => true,
		'warrior'      => true,
	);

	/**
	 * Renders one decoded deck.
	 *
	 * @param array  $counts           Card quantities keyed by DBF ID.
	 * @param array  $cards            Card records keyed by DBF ID.
		 * @param string $code             Original deck code.
	 * @param string $alignment        Deck alignment.
	 * @param array  $sideboard_owners Child-to-owner DBF ID map.
	 * @param array  $art_overrides    Card artwork overrides.
	 * @param string $deck_title       Authored or automatic deck title.
	 * @param string $deck_class       Decoded hero class slug.
	 * @param string $shared_title_group Shared source-paragraph group identifier.
	 * @param bool   $is_custom         Whether this is a `+` custom companion deck.
	 * @return string Rendered deck HTML.
	 */
	public function render( array $counts, array $cards, $code, $alignment = 'left', array $sideboard_owners = array(), array $art_overrides = array(), $deck_title = '', $deck_class = '', $shared_title_group = '', $is_custom = false, $effective_date = '', $frame_profile = 'current', $single_card = false ) {
		$rows = array();
		$card_urls = ! $single_card && class_exists( 'HScard\\Card_Posts', false ) ? Card_Posts::urls( $cards ) : array();
		foreach ( $counts as $id => $count ) {
			$id = absint( $id );
			if ( ! isset( $cards[ $id ] ) ) {
				return '';
			}

			// The server provides identity/initial placeholders only.
			// Dates-v1 card data is resolved once by card-snapshots.mjs.
			$row = Render_Spec::placeholder( $cards[ $id ], $effective_date );
			$row['count'] = max( 1, (int) $count );
			$art_id = isset( $art_overrides[ $id ] ) ? absint( $art_overrides[ $id ] ) : 0;
			if ( $art_id > 0 && isset( $cards[ $art_id ] ) ) {
				$row['native_art_override'] = $art_id;
				$row['image']      = (string) $cards[ $art_id ]['image'];
				$row['crop_image'] = (string) $cards[ $art_id ]['crop_image'];
				$row['art']        = isset( $cards[ $art_id ]['art'] ) ? (string) $cards[ $art_id ]['art'] : '';
			}
			$rows[ $id ] = $row;
		}
		$this->assemble_zilliax( $rows, $sideboard_owners );

		uasort(
			$rows,
			static function ( $left, $right ) {
				if ( $left['mana'] !== $right['mana'] ) {
					return $left['mana'] <=> $right['mana'];
				}
				$name = strnatcasecmp( $left['display_name'], $right['display_name'] );
				return 0 !== $name ? $name : ( $left['id'] <=> $right['id'] );
			}
		);
		$rows = $this->group_sideboards( $rows, $sideboard_owners );

		$alignment          = in_array( $alignment, array( 'left', 'center', 'right' ), true ) ? $alignment : 'left';
		$deck_title         = sanitize_text_field( (string) $deck_title );
		$deck_identity      = self::deck_identity( $deck_title );
		$deck_name          = $deck_identity['name'];
		$deck_subtitle      = $deck_identity['subtitle'];
		$deck_class         = sanitize_key( (string) $deck_class );
		$deck_class         = isset( self::DECK_CLASSES[ $deck_class ] ) ? $deck_class : '';
		$shared_title_group = sanitize_key( (string) $shared_title_group );
		$section_class      = 'hscard-deck-list is-align-' . $alignment . ( '' !== $deck_class ? ' is-class-' . $deck_class : '' ) . ( $is_custom ? ' is-custom-deck' : '' );
		if ( $single_card ) { $section_class .= ' hscard-single-card'; }
		/**
		 * Filters the expansion icon displayed before a rendered deck subtitle.
		 *
		 * @since 7.10.32
		 *
		 * @param string $icon_url     Current expansion-icon URL.
		 * @param int    $post_id      Current post ID.
		 * @param string $deck_subtitle Authored text after the heading colon.
		 * @param string $deck_name     Authored text before the heading colon.
		 */
		$expansion_icon_url = apply_filters( 'hscard_deck_expansion_icon_url', '', get_the_ID(), $deck_subtitle, $deck_name );
		$expansion_icon_url = is_string( $expansion_icon_url ) ? trim( $expansion_icon_url ) : '';
		$heading_class      = 'hscard-deck-name' . ( '' !== $expansion_icon_url ? ' has-expansion-icon' : '' );
		$aria_label         = '' !== $deck_title
			? sprintf( /* translators: %s: deck title. */ __( '%s 덱 목록', 'hscard' ), $deck_title )
			: __( '덱 목록', 'hscard' );
		if ( $single_card ) { $aria_label = $deck_title; }
		$surfaces = array();
		$document_urls = Json_Sources::card_urls_for_cards( $rows );
		$documents = class_exists( 'HScard\\Card_Documents', false ) ? Card_Documents::for_cards( $rows, $document_urls ) : array();
		$has_golden = false;
		foreach ( $rows as $row_index => $row ) {
			$surface = class_exists( 'HScard\\Native_Cards', false ) ? Native_Cards::surface( $row, $frame_profile, $row_index < 2 ) : '';
			$surfaces[] = $surface;
			$has_golden = $has_golden || false !== strpos( $surface, 'data-hscard-golden-scene=' );
		}
		if ( $has_golden ) { $heading_class .= ' has-golden-toggle'; }

		ob_start();
		?>
		<section class="<?php echo esc_attr( $section_class . ' hscard-deck-list--v2' ); ?>" aria-label="<?php echo esc_attr( $aria_label ); ?>" data-deck-code="<?php echo esc_attr( (string) $code ); ?>"
			data-hscard-date="<?php echo esc_attr( (string) $effective_date ); ?>"
			data-hscard-frame-profile="<?php echo esc_attr( (string) $frame_profile ); ?>"
			data-hscard-card-urls="<?php echo esc_attr( wp_json_encode( $document_urls ) ); ?>"
			data-hscard-documents="<?php echo esc_attr( wp_json_encode( $documents, JSON_HEX_TAG | JSON_HEX_AMP | JSON_HEX_APOS | JSON_HEX_QUOT ) ); ?>"
			data-hscard-sideboard-owners="<?php echo esc_attr( wp_json_encode( $sideboard_owners ) ); ?>"
			<?php if ( '' !== $shared_title_group ) : ?>
				data-hscard-shared-title-group="<?php echo esc_attr( $shared_title_group ); ?>"
			<?php endif; ?>
		>
			<div class="hscard-deck-layout hscard-deck-layout--v2">
				<header class="<?php echo esc_attr( $heading_class ); ?>">
					<span class="hscard-deck-heading-text">
						<?php if ( '' !== $expansion_icon_url ) : ?>
							<img class="hscard-deck-expansion-icon" src="<?php echo esc_url( $expansion_icon_url ); ?>" alt="" width="16" height="16" decoding="async">
						<?php endif; ?>
						<span class="hscard-deck-name-label"><?php echo esc_html( $deck_title ); ?></span>
					</span>
					<?php if ( $has_golden ) : ?><button type="button" class="hscard-golden-toggle" data-hscard-golden-toggle aria-pressed="false" hidden><?php esc_html_e( '황금 카드', 'hscard' ); ?></button><?php endif; ?>
				</header>
				<div class="hscard-deck-body">
					<ol class="hscard-deck-cards hscard-deck-column">
						<?php foreach ( array_values( $rows ) as $row_index => $row ) : ?>
							<?php $surface = $surfaces[ $row_index ]; ?>
							<li data-hscard-dbf-id="<?php echo absint( $row['id'] ); ?>" data-hscard-owner-dbf="<?php echo isset( $row['sideboard_owner'] ) ? absint( $row['sideboard_owner'] ) : 0; ?>" class="hscard-deck-card is-snapshot-pending<?php echo '' !== $surface ? ' has-card-surface' : ''; ?>"><?php echo $this->tile( $row ) . $surface; // phpcs:ignore WordPress.Security.EscapeOutput.OutputNotEscaped ?>
							<?php if ( isset( $card_urls[ $row['id'] ] ) ) : ?><div class="hscard-card-navigation"><a class="hscard-card-link" href="<?php echo esc_url( $card_urls[ $row['id'] ] ); ?>" aria-label="<?php echo esc_attr( $row['display_name'] ); ?>"></a></div><?php endif; ?></li>
						<?php endforeach; ?>
					</ol>
				</div>
				<?php if ( ! $single_card ) : ?><footer class="hscard-deck-summary">
					<button type="button" class="hscard-deck-copy-area" data-hscard-save-code aria-label="<?php esc_attr_e( '덱 코드 복사', 'hscard' ); ?>">
						<span class="hscard-deck-copy-label"><?php esc_html_e( '복사', 'hscard' ); ?></span>
					</button>
				</footer><?php endif; ?>
			</div>
			<span class="hscard-deck-copy-status" role="status" aria-live="polite"></span>
		</section>
		<?php
		return (string) ob_get_clean();
	}

	/**
	 * Splits one authored `deck name: subtitle` heading into two lines.
	 *
	 * @param string $deck_title Complete authored deck title.
	 * @return string[] Display deck name and optional subtitle.
	 */
	private static function deck_identity( $deck_title ) {
		$identity = array(
			'name'     => $deck_title,
			'subtitle' => '',
		);

		if ( preg_match( '/^(\S(?:.*?\S)?)\s*[:：]\s*(\S(?:.*\S)?)$/u', $deck_title, $match ) ) {
			$name     = trim( $match[1] );
			$subtitle = trim( $match[2] );
			if ( '' !== $name && '' !== $subtitle ) {
				$identity['name']     = $name;
				$identity['subtitle'] = $subtitle;
			}
		}

		return $identity;
	}

	/**
	 * Uses the two selected Zilliax module costs for the assembled card.
	 *
	 * Selected artwork replaces the owner artwork. Module rows remain visible; their historically corrected costs are summed for the owner.
	 *
	 * @param array $rows   Rows keyed by DBF ID.
	 * @param array $owners Child DBF ID to owner DBF ID map.
	 */
	private function assemble_zilliax( array &$rows, array $owners ) {
		$modules = array();
		foreach ( $owners as $child => $owner ) {
			$child = absint( $child );
			$owner = absint( $owner );
			if (
				! isset( Deckstring::ZILLIAX_OWNER_IDS[ $owner ] )
				|| ! isset( $rows[ $child ], $rows[ $owner ] )
			) {
				continue;
			}
			if ( $child === $owner ) {
				continue;
			}
			if ( isset( Deckstring::ZILLIAX_OWNER_IDS[ $child ] ) ) {
				$rows[ $owner ]['native_art_override'] = $child;
				$rows[ $owner ]['image']      = $rows[ $child ]['image'];
				$rows[ $owner ]['crop_image'] = $rows[ $child ]['crop_image'];
				$rows[ $owner ]['art']        = isset( $rows[ $child ]['art'] ) ? $rows[ $child ]['art'] : '';
				unset( $rows[ $child ] );
				continue;
			}
			if ( ! isset( $modules[ $owner ] ) ) {
				$modules[ $owner ] = array(
					'count' => 0,
					'mana'  => 0,
				);
			}
			++$modules[ $owner ]['count'];
			$modules[ $owner ]['mana'] += (int) $rows[ $child ]['mana'];
		}

		foreach ( $modules as $owner => $module ) {
			if ( 2 === $module['count'] ) {
				$rows[ $owner ]['mana'] = max( 0, $module['mana'] );
				$rows[ $owner ]['native_cost_override'] = true;
			}
		}
	}

	/**
	 * Places sideboard rows immediately after their owner card.
	 *
	 * @param array $rows   Sorted card rows.
	 * @param array $owners Child-to-owner DBF ID map.
	 * @return array Grouped card rows.
	 */
	private function group_sideboards( array $rows, array $owners ) {
		$main     = array();
		$children = array();
		foreach ( $rows as $id => $row ) {
			$id    = absint( $id );
			$owner = isset( $owners[ $id ] ) ? absint( $owners[ $id ] ) : 0;
			if ( $owner > 0 && $owner !== $id && isset( $rows[ $owner ] ) ) {
				$row['is_sideboard']  = true;
				$row['sideboard_owner'] = $owner;
				$children[ $owner ][] = $row;
				continue;
			}
			$main[] = $row;
		}

		$grouped = array();
		foreach ( $main as $row ) {
			$id        = absint( $row['id'] );
			$grouped[] = $row;
			if ( isset( $children[ $id ] ) ) {
				foreach ( $children[ $id ] as $child ) {
					$grouped[] = $child;
				}
				unset( $children[ $id ] );
			}
		}
		foreach ( $children as $unplaced ) {
			foreach ( $unplaced as $child ) {
				$grouped[] = $child;
			}
		}

		return $grouped;
	}

	/**
	 * Renders one card tile.
	 *
	 * @param array $card Prepared card row.
	 * @return string Card tile HTML.
	 */
	private function tile( array $card ) {
		$state   = self::LEGENDARY_RARITY_ID === $card['rarity_id'] ? 'is-legendary' : ( $card['count'] >= 2 ? 'is-two' : 'is-single' );
		$art_url = (string) $card['crop_image'];
		if ( ! empty( $card['legacy_art'] ) ) {
			/**
			 * Filters the crop art used when a correction requests old artwork.
			 *
			 * The current API crop remains the fallback when no local image exists.
			 *
			 * @since 4.2.5
			 *
			 * @param string $url  Current crop-art URL.
			 * @param string $name Exact deck-card name.
			 * @param array  $card Card data used to render the tile.
			 */
			$filtered_art = apply_filters( 'hscard_deck_legacy_art_url', $art_url, (string) $card['name'], $card );
			$art_url      = is_string( $filtered_art ) ? $filtered_art : $art_url;
		}
		$art_url     = Json_Sources::legacy_url( $art_url );
		$has_art     = '' !== $art_url;
		$classes     = 'hscard-deck-tile ' . $state;
		$classes    .= ! empty( $card['is_sideboard'] ) ? ' is-sideboard' : '';
		$classes    .= $has_art ? '' : ' is-art-error';
		$count_label = 'is-legendary' === $state ? "\xE2\x98\x85" : (string) $card['count'];
		ob_start();
		?>
		<div class="<?php echo esc_attr( $classes ); ?>">
			<?php if ( $has_art ) : ?>
				<img class="hscard-deck-tile-art" src="<?php echo esc_url( $art_url ); ?>" alt="" loading="lazy" decoding="async" draggable="false">
			<?php endif; ?>
			<span class="hscard-deck-tile-cost"><?php echo esc_html( (string) $card['mana'] ); ?></span>
			<span class="hscard-deck-tile-content">
				<span class="hscard-deck-tile-name">
					<span class="hscard-deck-tile-name-text"><?php echo esc_html( $card['display_name'] ); ?></span>
				</span>
			</span>
			<span class="hscard-deck-tile-count">
				<span class="hscard-deck-tile-compact-count"><?php echo esc_html( $count_label ); ?></span>
			</span>
		</div>
		<?php
		return (string) ob_get_clean();
	}
}
