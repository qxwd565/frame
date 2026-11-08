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
		add_action( 'rest_api_init', array( 'HScard\\Json_Sources', 'register_routes' ) );
		require_once HSCARD_PATH . 'includes/class-post-metadata.php';
		( new Post_Metadata() )->register_hooks();

		if ( is_admin() ) {
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
		if ( strlen( $content ) < 16 || false === strpos( $content, 'AAE' ) ) {
			return;
		}

		require_once HSCARD_PATH . 'includes/class-card-store.php';
		if ( ! Card_Store::maybe_upgrade() ) { return; }
		require_once HSCARD_PATH . 'includes/class-deckstring.php';
		require_once HSCARD_PATH . 'includes/class-card-history.php';
		require_once HSCARD_PATH . 'includes/class-frame-profiles.php';
		require_once HSCARD_PATH . 'includes/class-render-spec.php';
		require_once HSCARD_PATH . 'includes/class-deck-view.php';
		require_once HSCARD_PATH . 'includes/class-native-cards.php';
		add_action( 'wp_enqueue_scripts', array( 'HScard\\Native_Cards', 'enqueue' ) );
		require_once HSCARD_PATH . 'includes/class-content-filter.php';

		( new Content_Filter( new Deckstring(), new Card_Store(), new Card_History(), new Deck_View() ) )->register_hooks();
	}

	private function boot_admin() {
		require_once HSCARD_PATH . 'includes/class-card-store.php';
		require_once HSCARD_PATH . 'admin/class-admin-page.php';
		Card_Store::maybe_upgrade();
		( new Admin_Page() )->register_hooks();
	}
}
