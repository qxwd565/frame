<?php
/**
 * Simple local card storage.
 *
 * @package HScard
 */

namespace HScard;

use WP_Error;

if ( ! defined( 'ABSPATH' ) ) {
	exit;
}

final class Card_Store {
	const TABLE_SUFFIX          = 'hscard_cards';
	const SCHEMA_VERSION_OPTION = 'hscard_schema_version';
	const SCHEMA_VERSION        = 4;

	private $request_cache         = array();
	private static $failure_reason = '';
	private static $table_status   = array();

	public static function table_name() {
		global $wpdb;
		return $wpdb->prefix . self::TABLE_SUFFIX;
	}

	public static function install() {
		global $wpdb;

		self::$failure_reason = '';
		$table                = self::table_name();
		if ( self::table_exists( $table ) ) {
			return self::upgrade_schema( $table );
		}

		$created = $wpdb->query( self::create_sql( $table, $wpdb->get_charset_collate() ) ); // phpcs:ignore WordPress.DB.PreparedSQL.NotPrepared
		if ( false === $created ) {
			self::set_database_failure( __( '새 카드 테이블을 생성하지 못했습니다.', 'hscard' ) );
			return false;
		}
		self::$table_status[ $table ] = true;
		update_option( self::SCHEMA_VERSION_OPTION, self::SCHEMA_VERSION, false );

		return true;
	}

	/**
	 * Upgrades the existing live table once when an older plugin is replaced.
	 *
	 * @return bool
	 */
	public static function maybe_upgrade() {
		if ( self::SCHEMA_VERSION <= absint( get_option( self::SCHEMA_VERSION_OPTION, 0 ) ) ) {
			return true;
		}

		$table = self::table_name();
		return self::table_exists( $table ) ? self::upgrade_schema( $table ) : self::install();
	}

	public function failure_reason() {
		return self::$failure_reason;
	}

	public function find_cards( array $card_ids ) {
		global $wpdb;

		$ids     = array();
		$missing = array();
		foreach ( $card_ids as $card_id ) {
			$card_id = absint( $card_id );
			if ( $card_id > 0 ) {
				$ids[ $card_id ] = true;
				if ( ! array_key_exists( $card_id, $this->request_cache ) ) {
					$missing[ $card_id ] = $card_id;
				}
			}
		}
		if ( $missing ) {
			$placeholders = implode( ',', array_fill( 0, count( $missing ), '%d' ) );
			$sql          = "SELECT card_id,card_code,card_class,name,mana_cost,rarity_id,image_url,crop_image_url,art_url,card_type,card_text,attack,health,durability,armor,tribe,spell_school FROM %i WHERE card_id IN ({$placeholders})";
			$arguments    = array_merge( array( self::table_name() ), array_values( $missing ) );
			$records      = $wpdb->get_results( $wpdb->prepare( $sql, $arguments ), ARRAY_A ); // phpcs:ignore WordPress.DB.PreparedSQL.NotPrepared -- Identifier and ID values are prepared above; only placeholders are composed.
			if ( is_array( $records ) && '' === (string) $wpdb->last_error ) {
				foreach ( $missing as $id ) {
					// Remember genuine misses, but never cache a database failure.
					$this->request_cache[ $id ] = null;
				}
				foreach ( $records as $record ) {
					$id                         = absint( $record['card_id'] );
					$this->request_cache[ $id ] = array(
						'id'           => $id,
						'card_code'    => (string) $record['card_code'],
						'card_class'   => (string) $record['card_class'],
						'name'         => (string) $record['name'],
						'mana'         => max( 0, (int) $record['mana_cost'] ),
						'rarity_id'    => absint( $record['rarity_id'] ),
						'image'        => (string) $record['image_url'],
						'crop_image'   => (string) $record['crop_image_url'],
						'art'          => (string) $record['art_url'],
						'card_type'    => (string) $record['card_type'],
						'card_text'    => (string) $record['card_text'],
						'attack'       => max( 0, (int) $record['attack'] ),
						'health'       => max( 0, (int) $record['health'] ),
						'durability'   => max( 0, (int) $record['durability'] ),
						'armor'        => max( 0, (int) $record['armor'] ),
						'tribe'        => (string) $record['tribe'],
						'spell_school' => (string) $record['spell_school'],
					);
				}
			}
		}

		$cards = array();
		foreach ( array_keys( $ids ) as $id ) {
			if ( isset( $this->request_cache[ $id ] ) ) {
				$cards[ $id ] = $this->request_cache[ $id ];
			}
		}
		return $cards;
	}

	/** Look up existing numeric IDs by string card code before a set import. */
	public function find_code_ids( array $card_codes ) {
		global $wpdb;
		$codes = array();
		foreach ( $card_codes as $code ) {
			if ( is_string( $code ) && preg_match( '/\A[A-Za-z0-9_]{1,96}\z/D', $code ) ) { $codes[ $code ] = $code; }
		}
		$found = array();
		foreach ( array_chunk( array_values( $codes ), 200 ) as $chunk ) {
			$placeholders = implode( ',', array_fill( 0, count( $chunk ), '%s' ) );
			$sql = "SELECT card_id,card_code FROM %i WHERE card_code IN ({$placeholders})";
			$args = array_merge( array( self::table_name() ), $chunk );
			$records = $wpdb->get_results( $wpdb->prepare( $sql, $args ), ARRAY_A ); // phpcs:ignore WordPress.DB.PreparedSQL.NotPrepared -- Values and identifier have individual placeholders.
			if ( ! is_array( $records ) || '' !== (string) $wpdb->last_error ) {
				return new WP_Error( 'hscard_code_lookup_failed', __( '카드 문자열 ID 중복 검사에 실패했습니다.', 'hscard' ) );
			}
			foreach ( $records as $record ) {
				$found[ $record['card_code'] ][ absint( $record['card_id'] ) ] = true;
			}
		}
		return $found;
	}

	/**
	 * Finds the earliest collectible non-Core printing for loaded Core cards.
	 *
	 * Exact card names are used as the identity. The lowest non-Core card ID is
	 * deterministic and represents the earliest locally available printing.
	 * Cards without a locally stored non-Core counterpart are left untouched.
	 *
	 * @param array $cards Card records keyed by card ID.
	 * @return array Replacement card records keyed by Core card ID.
	 */
	public function original_printing_replacements( array $cards ) {
		global $wpdb;

		$core_names = array();
		foreach ( $cards as $card_id => $card ) {
			if ( ! is_array( $card ) || ! self::is_core_printing( $card ) ) {
				continue;
			}
			$name = isset( $card['name'] ) ? trim( (string) $card['name'] ) : '';
			$key  = self::normalise_card_name( $name );
			if ( '' !== $key ) {
				if ( ! isset( $core_names[ $key ] ) ) {
					$core_names[ $key ] = array(
						'ids'  => array(),
						'name' => $name,
					);
				}
				$core_names[ $key ]['ids'][ absint( $card_id ) ] = true;
			}
		}
		if ( empty( $core_names ) ) {
			return array();
		}

		$names        = array_values( array_unique( array_column( $core_names, 'name' ) ) );
		$placeholders = implode( ',', array_fill( 0, count( $names ), '%s' ) );
		$sql          = "SELECT card_id,card_code,card_class,name,mana_cost,rarity_id,collectible,image_url,crop_image_url,art_url,card_type,card_text,attack,health,durability,armor,tribe,spell_school FROM %i WHERE collectible = 1 AND name IN ({$placeholders}) ORDER BY card_id ASC";
		$arguments    = array_merge( array( self::table_name() ), $names );
		$records      = $wpdb->get_results( $wpdb->prepare( $sql, $arguments ), ARRAY_A ); // phpcs:ignore WordPress.DB.PreparedSQL.NotPrepared -- Identifier and names use placeholders.
		$candidates   = self::records_to_cards( $records );
		$preferred    = array();

		foreach ( $candidates as $candidate ) {
			$key = self::normalise_card_name( isset( $candidate['name'] ) ? $candidate['name'] : '' );
			if ( isset( $core_names[ $key ] ) && ! isset( $preferred[ $key ] ) && ! self::is_core_printing( $candidate ) ) {
				$preferred[ $key ] = $candidate;
			}
		}

		$replacements = array();
		foreach ( $core_names as $key => $core ) {
			if ( ! isset( $preferred[ $key ] ) ) {
				continue;
			}
			foreach ( array_keys( $core['ids'] ) as $core_id ) {
				if ( $core_id !== $preferred[ $key ]['id'] ) {
					$replacements[ $core_id ] = $preferred[ $key ];
				}
			}
		}

		return $replacements;
	}

	/**
	 * Normalizes database rows for original-printing resolution.
	 *
	 * @param mixed $records Database rows.
	 * @return array[] Card records.
	 */
	private static function records_to_cards( $records ) {
		$cards = array();
		if ( ! is_array( $records ) ) {
			return $cards;
		}

		foreach ( $records as $record ) {
			$cards[] = array(
				'id'           => absint( $record['card_id'] ),
				'card_code'    => (string) $record['card_code'],
				'card_class'   => (string) $record['card_class'],
				'name'         => (string) $record['name'],
				'mana'         => max( 0, (int) $record['mana_cost'] ),
				'rarity_id'    => absint( $record['rarity_id'] ),
				'collectible'  => isset( $record['collectible'] ) ? absint( $record['collectible'] ) : 1,
				'image'        => (string) $record['image_url'],
				'crop_image'   => (string) $record['crop_image_url'],
				'art'          => (string) $record['art_url'],
				'card_type'    => (string) $record['card_type'],
				'card_text'    => (string) $record['card_text'],
				'attack'       => max( 0, (int) $record['attack'] ),
				'health'       => max( 0, (int) $record['health'] ),
				'durability'   => max( 0, (int) $record['durability'] ),
				'armor'        => max( 0, (int) $record['armor'] ),
				'tribe'        => (string) $record['tribe'],
				'spell_school' => (string) $record['spell_school'],
			);
		}

		return $cards;
	}

	private static function is_core_printing( array $card ) {
		foreach ( array( 'crop_image', 'image' ) as $key ) {
			$path = isset( $card[ $key ] ) ? wp_parse_url( (string) $card[ $key ], PHP_URL_PATH ) : '';
			if ( is_string( $path ) && 0 === stripos( rawurldecode( pathinfo( $path, PATHINFO_FILENAME ) ), 'CORE_' ) ) {
				return true;
			}
		}
		return false;
	}

	private static function normalise_card_name( $name ) {
		$name = preg_replace( '/\s+/u', ' ', trim( (string) $name ) );
		return function_exists( 'mb_strtolower' ) ? mb_strtolower( (string) $name, 'UTF-8' ) : strtolower( (string) $name );
	}

	/**
	 * Saves imported JSON cards in the existing card table transactionally.
	 *
	 * @param array $cards Normalized cards.
	 * @return int|WP_Error
	 */
	public function save_cards( array $cards, array $remove_cards = array() ) {
		global $wpdb;

		$table_name = self::table_name();
		if ( ! self::table_exists( $table_name ) ) {
			return new WP_Error( 'hscard_storage_unavailable', __( '카드 테이블이 없습니다.', 'hscard' ) );
		}
		if ( empty( $cards ) ) {
			return new WP_Error( 'hscard_empty_page', __( '저장할 카드 페이지가 비어 있습니다.', 'hscard' ) );
		}

		if ( false === $wpdb->query( 'START TRANSACTION' ) ) {
			return new WP_Error( 'hscard_transaction_failed', __( '카드 저장 작업을 시작하지 못했습니다.', 'hscard' ) );
		}

		$total = 0;
		foreach ( array_chunk( $cards, 250 ) as $batch ) {
			$marks  = array();
			$values = array( $table_name );
			foreach ( $batch as $card ) {
				$marks[] = '(%d,%s,%s,%s,%d,%d,%d,%s,%s,%s,%s,%s,%d,%d,%d,%d,%s,%s)';
				array_push(
					$values,
					absint( $card['id'] ),
					isset( $card['card_code'] ) ? sanitize_text_field( (string) $card['card_code'] ) : '',
					isset( $card['card_class'] ) ? sanitize_key( (string) $card['card_class'] ) : '',
					sanitize_text_field( (string) $card['name'] ),
					max( 0, (int) $card['mana'] ),
					absint( $card['rarity_id'] ),
					isset( $card['collectible'] ) ? min( 1, absint( $card['collectible'] ) ) : 1,
					esc_url_raw( (string) $card['image'] ),
					esc_url_raw( (string) $card['crop_image'] ),
					esc_url_raw( isset( $card['art'] ) ? (string) $card['art'] : '' ),
					sanitize_key( isset( $card['card_type'] ) ? (string) $card['card_type'] : '' ),
					// API card markup is data; escape it at the eventual output point.
					isset( $card['card_text'] ) ? (string) $card['card_text'] : '',
					isset( $card['attack'] ) ? max( 0, (int) $card['attack'] ) : 0,
					isset( $card['health'] ) ? max( 0, (int) $card['health'] ) : 0,
					isset( $card['durability'] ) ? max( 0, (int) $card['durability'] ) : 0,
					isset( $card['armor'] ) ? max( 0, (int) $card['armor'] ) : 0,
					sanitize_text_field( isset( $card['tribe'] ) ? (string) $card['tribe'] : '' ),
					sanitize_text_field( isset( $card['spell_school'] ) ? (string) $card['spell_school'] : '' )
				);
			}

			$sql = 'INSERT INTO %i (card_id,card_code,card_class,name,mana_cost,rarity_id,collectible,image_url,crop_image_url,art_url,card_type,card_text,attack,health,durability,armor,tribe,spell_school) VALUES ' . implode( ',', $marks )
				. ' ON DUPLICATE KEY UPDATE card_code=VALUES(card_code),card_class=VALUES(card_class),name=VALUES(name),mana_cost=VALUES(mana_cost),rarity_id=VALUES(rarity_id),collectible=VALUES(collectible),image_url=VALUES(image_url),crop_image_url=VALUES(crop_image_url),art_url=VALUES(art_url),card_type=VALUES(card_type),card_text=VALUES(card_text),attack=VALUES(attack),health=VALUES(health),durability=VALUES(durability),armor=VALUES(armor),tribe=VALUES(tribe),spell_school=VALUES(spell_school)';
			if ( false === $wpdb->query( $wpdb->prepare( $sql, $values ) ) ) { // phpcs:ignore WordPress.DB.PreparedSQL.NotPrepared
				$wpdb->query( 'ROLLBACK' );
				return new WP_Error( 'hscard_page_insert_failed', __( '카드 페이지 저장에 실패했습니다.', 'hscard' ) );
			}
			$total += count( $batch );
		}

		// Replace only cards that belonged to this set and have disappeared from its JSON.
		// A matching card_code prevents accidental deletion of a reused DBF ID.
		if ( $remove_cards && ! self::delete_card_refs( $table_name, $remove_cards ) ) {
			$wpdb->query( 'ROLLBACK' );
			return new WP_Error( 'hscard_set_prune_failed', __( '세트에서 빠진 카드 삭제에 실패했습니다. 변경 사항은 취소됩니다.', 'hscard' ) );
		}

		if ( false === $wpdb->query( 'COMMIT' ) ) {
			$wpdb->query( 'ROLLBACK' );
			return new WP_Error( 'hscard_commit_failed', __( '카드 페이지 저장을 완료하지 못했습니다.', 'hscard' ) );
		}

		$this->request_cache = array();
		return $total;
	}

	/** Remove only tracked cards from a set, not every row in the shared card table. */
	public function delete_cards( array $card_refs ) {
		global $wpdb;
		if ( ! $card_refs ) { return 0; }
		$table = self::table_name();
		if ( ! self::table_exists( $table ) || false === $wpdb->query( 'START TRANSACTION' ) ) {
			return new WP_Error( 'hscard_delete_unavailable', __( '카드 삭제 작업을 시작하지 못했습니다.', 'hscard' ) );
		}
		if ( ! self::delete_card_refs( $table, $card_refs ) || false === $wpdb->query( 'COMMIT' ) ) {
			$wpdb->query( 'ROLLBACK' );
			return new WP_Error( 'hscard_delete_failed', __( '카드 삭제에 실패하여 변경 사항을 취소했습니다.', 'hscard' ) );
		}
		$this->request_cache = array();
		return count( $card_refs );
	}

	/** Guard every deletion by *both* DBF ID and stored Hearthstone card code. */
	private static function delete_card_refs( $table, array $card_refs ) {
		global $wpdb;
		foreach ( array_chunk( $card_refs, 100, true ) as $batch ) {
			$parts = array();
			$args = array( $table );
			foreach ( $batch as $dbf => $code ) {
				if ( absint( $dbf ) < 1 || ! is_string( $code ) || ! preg_match( '/\A[A-Za-z0-9_]{1,96}\z/D', $code ) ) { return false; }
				$parts[] = '(card_id = %d AND card_code = %s)';
				$args[]  = absint( $dbf );
				$args[]  = $code;
			}
			$sql = 'DELETE FROM %i WHERE ' . implode( ' OR ', $parts );
			if ( false === $wpdb->query( $wpdb->prepare( $sql, $args ) ) ) { return false; }
		}
		return true;
	}

	/**
	 * Adds card fields introduced after the first live schema.
	 *
	 * @param string $table Unquoted table name.
	 * @return bool
	 */
	private static function upgrade_schema( $table ) {
		global $wpdb;

		$columns = array(
			'card_code'    => "varchar(96) NOT NULL DEFAULT '' AFTER card_id",
			'card_class'   => "varchar(32) NOT NULL DEFAULT '' AFTER card_code",
			'collectible'  => 'tinyint(1) unsigned NOT NULL DEFAULT 1 AFTER rarity_id',
			'art_url'      => 'text NOT NULL AFTER crop_image_url',
			'card_type'    => "varchar(24) NOT NULL DEFAULT '' AFTER art_url",
			'card_text'    => 'text NOT NULL AFTER card_type',
			'attack'       => 'smallint(5) unsigned NOT NULL DEFAULT 0 AFTER card_text',
			'health'       => 'smallint(5) unsigned NOT NULL DEFAULT 0 AFTER attack',
			'durability'   => 'smallint(5) unsigned NOT NULL DEFAULT 0 AFTER health',
			'armor'        => 'smallint(5) unsigned NOT NULL DEFAULT 0 AFTER durability',
			'tribe'        => "varchar(64) NOT NULL DEFAULT '' AFTER armor",
			'spell_school' => "varchar(32) NOT NULL DEFAULT '' AFTER tribe",
		);
		foreach ( $columns as $column_name => $definition ) {
			$column = $wpdb->get_var( $wpdb->prepare( 'SHOW COLUMNS FROM %i WHERE Field = %s', $table, $column_name ) );
			if ( $column_name === $column ) {
				continue;
			}
			$sql = $wpdb->prepare( 'ALTER TABLE %i ADD %i ' . $definition, $table, $column_name ); // phpcs:ignore WordPress.DB.PreparedSQL.NotPrepared -- The definition is a fixed internal schema map.
			if ( false === $wpdb->query( $sql ) ) { // phpcs:ignore WordPress.DB.PreparedSQL.NotPrepared
				self::set_database_failure( __( '카드 상세 정보 필드를 추가하지 못했습니다.', 'hscard' ) );
				return false;
			}
		}

		$pattern = '%' . $wpdb->esc_like( 'TOY_330t' ) . '%';
		if ( false === $wpdb->query( $wpdb->prepare( 'UPDATE %i SET collectible=0 WHERE image_url LIKE %s OR crop_image_url LIKE %s', $table, $pattern, $pattern ) ) ) {
			self::set_database_failure( __( '기존 비수집 카드를 분류하지 못했습니다.', 'hscard' ) );
			return false;
		}

		$tile_data = get_transient( 'hscard_tile_map' );
		$ids       = array();
		foreach ( is_array( $tile_data ) && isset( $tile_data['supplements'] ) && is_array( $tile_data['supplements'] ) ? $tile_data['supplements'] : array() as $card ) {
			$card_id = is_array( $card ) && isset( $card['id'] ) ? absint( $card['id'] ) : 0;
			if ( $card_id > 0 ) {
				$ids[ $card_id ] = $card_id;
			}
		}
		if ( $ids ) {
			$placeholders = implode( ',', array_fill( 0, count( $ids ), '%d' ) );
			$sql          = "UPDATE %i SET collectible=0 WHERE card_id IN ({$placeholders})";
			$arguments    = array_merge( array( $table ), array_values( $ids ) );
			if ( false === $wpdb->query( $wpdb->prepare( $sql, $arguments ) ) ) { // phpcs:ignore WordPress.DB.PreparedSQL.NotPrepared -- Identifier and IDs use placeholders.
				self::set_database_failure( __( '기존 보조 카드 수집 여부를 저장하지 못했습니다.', 'hscard' ) );
				return false;
			}
		}

		update_option( self::SCHEMA_VERSION_OPTION, self::SCHEMA_VERSION, false );
		return true;
	}

	private static function create_sql( $table, $charset ) {
		global $wpdb;
		$sql = $wpdb->prepare(
			'CREATE TABLE %i (
			card_id bigint(20) unsigned NOT NULL,
			card_code varchar(96) NOT NULL DEFAULT \'\',
			card_class varchar(32) NOT NULL DEFAULT \'\',
			name varchar(191) NOT NULL,
			mana_cost smallint(5) unsigned NOT NULL DEFAULT 0,
			rarity_id smallint(5) unsigned NOT NULL DEFAULT 0,
			collectible tinyint(1) unsigned NOT NULL DEFAULT 1,
			image_url text NOT NULL,
			crop_image_url text NOT NULL,
			art_url text NOT NULL,
			card_type varchar(24) NOT NULL DEFAULT \'\',
			card_text text NOT NULL,
			attack smallint(5) unsigned NOT NULL DEFAULT 0,
			health smallint(5) unsigned NOT NULL DEFAULT 0,
			durability smallint(5) unsigned NOT NULL DEFAULT 0,
			armor smallint(5) unsigned NOT NULL DEFAULT 0,
			tribe varchar(64) NOT NULL DEFAULT \'\',
			spell_school varchar(32) NOT NULL DEFAULT \'\',
			PRIMARY KEY (card_id)
		) ENGINE=InnoDB',
			$table
		);
		// Charset/collation comes exclusively from wpdb::get_charset_collate().
		return $sql . ' ' . $charset . ';';
	}

	private static function table_exists( $table ) {
		global $wpdb;
		if ( ! array_key_exists( $table, self::$table_status ) ) {
			self::$table_status[ $table ] = $table === $wpdb->get_var( $wpdb->prepare( 'SHOW TABLES LIKE %s', $wpdb->esc_like( $table ) ) );
		}
		return self::$table_status[ $table ];
	}

	private static function set_database_failure( $message ) {
		global $wpdb;
		self::$failure_reason = (string) $message;
		if ( '' !== (string) $wpdb->last_error ) {
			self::$failure_reason .= ' DB: ' . sanitize_text_field( (string) $wpdb->last_error );
		}
	}
}
