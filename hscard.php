<?php
/**
 * Plugin Name: HScard
 * Plugin URI: https://hsdeck.com/
 * Description: Lightweight local Hearthstone card data and deck-list rendering for HSdeck.
 * Version: 7.12.16
 * Requires at least: 6.6
 * Requires PHP: 7.4
 * Author: HSdeck
 * License: GPL-2.0-or-later
 * License URI: https://www.gnu.org/licenses/gpl-2.0.html
 * Text Domain: hscard
 * Update URI: https://hsdeck.com/hscard/
 *
 * @package HScard
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit;
}

define( 'HSCARD_VERSION', '7.12.16' );
define( 'HSCARD_PATH', plugin_dir_path( __FILE__ ) );

require_once HSCARD_PATH . 'includes/class-plugin.php';

register_activation_hook( __FILE__, array( 'HScard\\Plugin', 'activate' ) );

( new HScard\Plugin() )->boot();
