<?php
/**
 * Remove only data owned by HScard.
 *
 * @package HScard
 */

if ( ! defined( 'WP_UNINSTALL_PLUGIN' ) ) {
	exit;
}

foreach (
	array(
		// Remove obsolete settings from earlier plugin versions on uninstall only.
		'hscard_client_id',
		'hscard_client_secret',
		'hscard_last_success',
		'hscard_sync_job',
		'hscard_schema_version',
		'hscard_imported_sets',
		'hscard_json_sources',
		'hscard_json_source_order',
		'hscard_home_covers',
		'hscard_home_cover_schema_version',
		'hscard_rewrite_version',
		// Data keys used by releases before 6.6.0.
		'hscard_v3_active',
		'hscard_v3_schema',
		'hscard_v3_sync_job',
	) as $hscard_option
) {
	delete_option( $hscard_option );
}

// Private local JSON revisions live in individual non-autoloaded options.
global $wpdb;
$hscard_managed_json_pattern = $wpdb->esc_like( 'hscard_managed_json_' ) . '%';
$hscard_managed_json_keys = $wpdb->get_col( $wpdb->prepare( 'SELECT option_name FROM %i WHERE option_name LIKE %s', $wpdb->options, $hscard_managed_json_pattern ) );
if ( is_array( $hscard_managed_json_keys ) ) {
 foreach ( $hscard_managed_json_keys as $hscard_managed_json_key ) { delete_option( $hscard_managed_json_key ); }
}

foreach ( array( 'hscard_oauth_token', 'hscard_tile_map', 'hscard_v3_oauth_token' ) as $hscard_transient ) {
	delete_transient( $hscard_transient );
}

foreach ( array( 'hscard_standard_year', 'hscard_expansion' ) as $hscard_post_meta_key ) {
	delete_post_meta_by_key( $hscard_post_meta_key );
}

register_taxonomy( 'hscard_home_cover', array( 'post' ) );
$hscard_home_covers = get_terms(
	array(
		'taxonomy'   => 'hscard_home_cover',
		'hide_empty' => false,
		'fields'     => 'ids',
	)
);
if ( is_array( $hscard_home_covers ) ) {
	foreach ( $hscard_home_covers as $hscard_home_cover_id ) {
		wp_delete_term( $hscard_home_cover_id, 'hscard_home_cover' );
	}
}

global $wpdb;
foreach ( array( 'hscard_cards', 'hscard_cards_new', 'hscard_cards_old', 'hscard_v3_cards' ) as $hscard_table_suffix ) {
	$wpdb->query( $wpdb->prepare( 'DROP TABLE IF EXISTS %i', $wpdb->prefix . $hscard_table_suffix ) );
}

foreach ( array( 'hscard_notice_', 'hscard_v3_notice_', 'hscard_import_notice_' ) as $hscard_notice_prefix ) {
	$hscard_notice_pattern  = $wpdb->esc_like( '_transient_' . $hscard_notice_prefix ) . '%';
	$hscard_timeout_pattern = $wpdb->esc_like( '_transient_timeout_' . $hscard_notice_prefix ) . '%';
	$wpdb->query( $wpdb->prepare( 'DELETE FROM %i WHERE option_name LIKE %s OR option_name LIKE %s', $wpdb->options, $hscard_notice_pattern, $hscard_timeout_pattern ) );
}
