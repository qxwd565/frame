<?php
/**
 * HScard composition root.
 *
 * @package HScard
 */

namespace HScard;

if ( ! defined( 'ABSPATH' ) ) {
	exit;
}

final class Plugin {
	public function boot() {
		require_once HSCARD_PATH . 'includes/class-json-sources.php';
		require_once HSCARD_PATH . 'includes/class-card-posts.php';
		( new Card_Posts() )->register_hooks();
		add_action( 'rest_api_init', array( 'HScard\\Json_Sources', 'register_routes' ) );
		require_once HSCARD_PATH . 'includes/class-post-metadata.php';
		( new Post_Metadata() )->register_hooks();

		if ( is_admin() ) {
			require_once HSCARD_PATH . 'includes/class-resource-settings.php';
			( new Resource_Settings() )->register_hooks();
			$this->boot_admin();
		} else {
			add_action( 'wp', array( $this, 'boot_frontend' ) );
		}
	}

	public static function activate() {
		require_once HSCARD_PATH . 'includes/class-card-store.php';
		Card_Store::install();
	}

	public function boot_frontend() {
		if ( ! is_singular( array( 'post', 'page' ) ) ) {
			return;
		}

		$post = get_queried_object();
		if ( ! $post instanceof \WP_Post ) {
			return;
		}

		$content = (string) $post->post_content;
		$card_post = Card_Posts::is_card_post( $post->ID );
		if ( ! $card_post && ( strlen( $content ) < 16 || false === strpos( $content, 'AAE' ) ) ) {
			return;
		}

		require_once HSCARD_PATH . 'includes/class-card-store.php';
		if ( ! Card_Store::maybe_upgrade() ) { return; }
		require_once HSCARD_PATH . 'includes/class-deckstring.php';
		require_once HSCARD_PATH . 'includes/class-frame-profiles.php';
		require_once HSCARD_PATH . 'includes/class-render-spec.php';
		require_once HSCARD_PATH . 'includes/class-deck-view.php';
		require_once HSCARD_PATH . 'includes/class-native-cards.php';
		if ( $card_post ) { add_action( 'wp_enqueue_scripts', array( 'HScard\\Card_Posts', 'enqueue_shared_styles' ) ); }
		add_action( 'wp_enqueue_scripts', array( 'HScard\\Native_Cards', 'enqueue' ) );
		add_action( 'wp_head', array( 'HScard\\Native_Cards', 'preload' ), 2 );
		require_once HSCARD_PATH . 'includes/class-content-filter.php';

		if ( ! $card_post ) { ( new Content_Filter( new Deckstring(), new Card_Store(), new Deck_View() ) )->register_hooks(); }
	}

	private function boot_admin() {
		require_once HSCARD_PATH . 'includes/class-card-store.php';
		require_once HSCARD_PATH . 'admin/class-admin-page.php';
		Card_Store::maybe_upgrade();
		( new Admin_Page() )->register_hooks();
	}
}
