<?php
/**
 * Legacy slugless Hearthstone post-metadata compatibility.
 *
 * @package HScard
 */

namespace HScard;

if ( ! defined( 'ABSPATH' ) ) {
	exit;
}

final class Post_Metadata {
	const STANDARD_YEAR_META_KEY = 'hscard_standard_year';
	const EXPANSION_META_KEY     = 'hscard_expansion';

	/**
	 * Registers compatibility metadata without editor or list-screen UI.
	 */
	public function register_hooks() {
		add_action( 'init', array( $this, 'register_meta' ) );
	}

	/**
	 * Preserves existing REST and stored-data contracts for legacy consumers.
	 */
	public function register_meta() {
		$arguments = array(
			'type'              => 'string',
			'single'            => true,
			'default'           => '',
			'show_in_rest'      => true,
			'sanitize_callback' => array( $this, 'sanitize_meta_value' ),
			'auth_callback'     => array( $this, 'can_edit_meta' ),
		);

		register_post_meta( 'post', self::STANDARD_YEAR_META_KEY, $arguments );
		register_post_meta( 'post', self::EXPANSION_META_KEY, $arguments );
	}

	/**
	 * Preserves the legacy comma-separated REST sanitization contract.
	 *
	 * @param mixed $value Raw metadata value.
	 * @return string Normalized metadata value.
	 */
	public function sanitize_meta_value( $value ) {
		if ( ! is_scalar( $value ) ) {
			return '';
		}

		$parts = preg_split( '/\s*[,，]\s*/u', (string) $value, -1, PREG_SPLIT_NO_EMPTY );
		if ( ! is_array( $parts ) ) {
			return '';
		}

		$values = array();
		foreach ( $parts as $part ) {
			$part = trim( sanitize_text_field( $part ) );
			if ( '' !== $part && ! in_array( $part, $values, true ) ) {
				$values[] = $part;
			}
		}

		return implode( ', ', $values );
	}

	/**
	 * Checks whether the current user can edit metadata on the post.
	 *
	 * @param bool   $allowed  Existing authorization result.
	 * @param string $meta_key Metadata key.
	 * @param int    $post_id  Post ID.
	 * @return bool Whether metadata may be edited.
	 */
	public function can_edit_meta( $allowed, $meta_key, $post_id ) {
		unset( $allowed, $meta_key );

		return $post_id
			? current_user_can( 'edit_post', $post_id )
			: current_user_can( 'edit_posts' );
	}
}
