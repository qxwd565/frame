<?php
/** Published WordPress posts for imported, collectible parent cards. @package HScard */
namespace HScard;
use WP_Error;
if ( ! defined( 'ABSPATH' ) ) { exit; }

final class Card_Posts {
 const META = '_hscard_card_code';
 const DBF_META = '_hscard_card_dbf';
 const INACTIVE_META = '_hscard_card_inactive';
 const QUEUE = 'hscard_card_post_queue';
 const ERRORS = 'hscard_card_post_errors';
 const BACKFILL = 'hscard_card_posts_version';
 const BACKFILL_VERSION = 2;
 const CRON = 'hscard_sync_card_posts';

 public function register_hooks() {
  add_action( 'hscard_cards_changed', array( __CLASS__, 'queue' ) );
  add_action( 'hscard_card_document_ready', array( __CLASS__, 'document_ready' ) );
  add_action( self::CRON, array( __CLASS__, 'run_batch' ) );
  add_action( 'admin_init', array( __CLASS__, 'backfill' ) );
  add_action( 'init', array( __CLASS__, 'schedule' ) );
  add_action( 'admin_notices', array( __CLASS__, 'notice' ) );
  add_shortcode( 'hscard_card', array( __CLASS__, 'render' ) );
  add_filter( 'post_link', array( __CLASS__, 'permalink' ), 100, 2 );
  add_action( 'parse_request', array( __CLASS__, 'resolve_request' ) );
 }

 /** Only collectible, renderable cards get their own posts. */
 public static function eligible( array $card ) {
  return ! empty( $card['collectible'] ) && isset( $card['card_code'] )
   && preg_match( '/\A[A-Za-z0-9_]{1,96}\z/D', $card['card_code'] )
   && in_array( strtoupper( $card['card_type'] ?? '' ), array( 'MINION', 'SPELL', 'WEAPON', 'HERO', 'LOCATION' ), true );
 }

 /** Short queue edits share a lock; slow WordPress post writes do not hold it. */
 private static function locked( $name, $callback ) {
  global $wpdb;
  $lock = 'hscard_posts_' . substr( hash( 'sha256', ( defined( 'DB_NAME' ) ? DB_NAME : '' ) . $wpdb->prefix . $name ), 0, 40 );
  if ( 1 !== (int) $wpdb->get_var( $wpdb->prepare( 'SELECT GET_LOCK(%s, %d)', $lock, 'queue' === $name ? 5 : 0 ) ) ) { return false; }
  try { return $callback(); }
  finally { $wpdb->get_var( $wpdb->prepare( 'SELECT RELEASE_LOCK(%s)', $lock ) ); }
 }

 public static function queue( array $ids ) {
  $saved = self::locked( 'queue', static function () use ( $ids ) {
   wp_cache_delete( self::QUEUE, 'options' );
   $queue = (array) get_option( self::QUEUE, array() );
   $token = wp_generate_uuid4();
   foreach ( $ids as $id ) { if ( absint( $id ) ) {
    $id = absint( $id );
    $queue[ $id ] = array( 'token' => $token, 'tries' => 0, 'author' => get_current_user_id() ?: ( $queue[ $id ]['author'] ?? 0 ) );
   } }
   update_option( self::QUEUE, $queue, false );
   return get_option( self::QUEUE, array() ) === $queue;
  } );
  if ( ! $saved ) { update_option( self::ERRORS, array( 0 => '카드 게시글 작업을 예약하지 못했습니다. JSON을 다시 가져오세요.' ), false ); }
  self::schedule();
  return $saved;
 }

 public static function schedule() {
  $next = 0;
  foreach ( (array) get_option( self::QUEUE, array() ) as $job ) {
   $due = max( time() + 1, (int) ( $job['waiting_date'] ?? 0 ) );
   $next = $next ? min( $next, $due ) : $due;
  }
  $scheduled = wp_next_scheduled( self::CRON );
  if ( $next && ( ! $scheduled || $next < $scheduled ) ) {
   if ( $scheduled ) { wp_unschedule_event( $scheduled, self::CRON ); }
   wp_schedule_single_event( $next, self::CRON );
  }
 }

 /** Replacement ZIPs do not run activation hooks. Backfill tracked imports once. */
 public static function backfill() {
  if ( ! current_user_can( 'manage_options' ) || self::BACKFILL_VERSION === (int) get_option( self::BACKFILL, 0 ) ) { return; }
  $refs = self::imported_refs();
  if ( self::queue( array_keys( $refs ) ) ) { update_option( self::BACKFILL, self::BACKFILL_VERSION, false ); }
 }

 /** Wake only cards belonging to this exact document, never a same-ID mirror. */
 public static function document_ready( $url ) {
  require_once HSCARD_PATH . 'includes/class-card-store.php';
  $code = pathinfo( (string) wp_parse_url( $url, PHP_URL_PATH ), PATHINFO_FILENAME );
  $store = new Card_Store();$found = $store->find_code_ids( array( $code ) );
  if ( is_wp_error( $found ) || empty( $found[ $code ] ) ) { return; }
  $cards = $store->find_cards( array_keys( $found[ $code ] ) );
  $urls = Json_Sources::card_urls_for_cards( $cards );$ids = array();
  foreach ( $urls as $id => $source ) { if ( $source === $url && self::eligible( $cards[ $id ] ) ) { $ids[] = $id; } }
  if ( $ids ) { self::queue( $ids ); }
 }

 private static function category_id() {
  $term = get_term_by( 'name', '카드', 'category' );
  if ( ! $term ) {
   // Reuse the named category. WordPress or the user owns its slug.
   $created = wp_insert_term( '카드', 'category' );
   if ( is_wp_error( $created ) ) {
    if ( 'term_exists' !== $created->get_error_code() ) { return $created; }
    $term = get_term( (int) $created->get_error_data(), 'category' );
   } else { $term = get_term( (int) $created['term_id'], 'category' ); }
  }
  if ( is_wp_error( $term ) || ! $term ) { return new WP_Error( 'hscard_card_category', '카드 카테고리를 확인하지 못했습니다.' ); }
  return (int) $term->term_id;
 }

 /** Assign during automatic synchronization, never intercept editor saves. */
 private static function assign_category( $post_id, $category ) {
  $current = wp_get_post_categories( $post_id );
  if ( is_wp_error( $current ) ) { return $current; }
  if ( array( $category ) === array_map( 'intval', $current ) ) { return true; }
  $result = wp_set_post_categories( $post_id, array( $category ) );
  return is_wp_error( $result ) ? $result : ( $result ? true : new WP_Error( 'hscard_card_category', '카드 카테고리를 저장하지 못했습니다.' ) );
 }

 private static function imported_refs() {
  $refs = array();
  foreach ( (array) get_option( 'hscard_imported_sets', array() ) as $set ) {
   if ( ! is_array( $set ) || empty( $set['cards'] ) || ! is_array( $set['cards'] ) ) { continue; }
   foreach ( $set['cards'] as $id => $code ) { $refs[ absint( $id ) ] = $code; }
  }
  return $refs;
 }

 public static function run_batch() {
  self::locked( 'runner', static function () {
   global $wpdb;
   require_once HSCARD_PATH . 'includes/class-card-store.php';
   if ( ! Card_Store::maybe_upgrade() ) { return; }
   $waiting = (array) get_option( self::QUEUE, array() );
   $batch = array_slice( array_filter( $waiting, static function ( $job ) { return (int) ( $job['waiting_date'] ?? 0 ) <= time(); } ), 0, 25, true );
   $cards = ( new Card_Store() )->find_cards( array_keys( $batch ) );
   if ( '' !== (string) $wpdb->last_error ) { return; }
   $refs = self::imported_refs();
   if ( '' !== (string) $wpdb->last_error ) { return; }
   $results = array();
   $started = microtime( true );
   foreach ( $batch as $id => $job ) {
    $card = isset( $cards[ $id ], $refs[ $id ] ) && $cards[ $id ]['card_code'] === $refs[ $id ] ? $cards[ $id ] : array();
    $results[ $id ] = self::sync_card( $id, $card, $job['author'] ?? 0 );
    if ( microtime( true ) - $started > 8 ) { break; }
   }
   self::locked( 'queue', static function () use ( $batch, $results ) {
    wp_cache_delete( self::QUEUE, 'options' );
    wp_cache_delete( self::ERRORS, 'options' );
    $queue = (array) get_option( self::QUEUE, array() );
    $errors = (array) get_option( self::ERRORS, array() );
    foreach ( $results as $id => $result ) {
     // An import may have queued a newer revision while this batch was writing.
     if ( ! isset( $queue[ $id ] ) || $queue[ $id ]['token'] !== $batch[ $id ]['token'] ) { continue; }
     $job = $queue[ $id ]; unset( $queue[ $id ] );
     if ( is_wp_error( $result ) ) {
      $errors[ $id ] = $result->get_error_message();
      if ( 'hscard_card_date_pending' === $result->get_error_code() ) {
       // Ready documents wake immediately. A bounded retry also recovers a
       // full document queue or transient failure without a one-second spin.
       $job['waiting_date'] = time() + 300;$queue[ $id ] = $job;
      } elseif ( ++$job['tries'] < 3 ) { $queue[ $id ] = $job; }
     } else { unset( $errors[ $id ] ); }
    }
    update_option( self::QUEUE, $queue, false );
    update_option( self::ERRORS, array_slice( $errors, -20, null, true ), false );
   } );
  } );
  self::schedule();
 }

 /** Look up requested posts together; do not issue a query per deck card. */
 private static function posts( array $ids ) {
  global $wpdb;
  if ( ! $ids ) { return array(); }
  $posts = get_posts( array(
   'post_type' => 'post', 'post_status' => array( 'publish', 'draft', 'private', 'pending', 'future', 'trash' ),
   'numberposts' => -1, 'orderby' => 'ID', 'order' => 'ASC', 'no_found_rows' => true,
   'meta_query' => array( array( 'key' => self::DBF_META, 'value' => array_map( 'absint', $ids ), 'compare' => 'IN' ) ),
  ) );
  return '' === (string) $wpdb->last_error ? $posts : new WP_Error( 'hscard_post_lookup', '카드 게시글 조회에 실패했습니다.' );
 }

 public static function sync_card( $dbf, array $card, $author = 0 ) {
  $pages = self::posts( array( $dbf ) );
  if ( is_wp_error( $pages ) ) { return $pages; }
  $page = $pages ? reset( $pages ) : null;
  if ( $page && ! get_post_meta( $page->ID, self::META, true ) ) { return new WP_Error( 'hscard_post_owner', '게시글 소유 정보를 확인하지 못했습니다.' ); }
  if ( ! self::eligible( $card ) ) {
   if ( $page && 'publish' === $page->post_status ) {
    $result = wp_update_post( array( 'ID' => $page->ID, 'post_status' => 'draft' ), true );
    if ( is_wp_error( $result ) ) { return $result; }
    update_post_meta( $page->ID, self::INACTIVE_META, 1 );
   }
   return true;
  }
  $code = $card['card_code'];
  // WordPress normalizes ASCII slugs to lowercase. The URL contains only the
  // card ID, never a numeric DBF ID, card name or translated set name.
  $slug = sanitize_title( $code );
  if ( $page && get_post_meta( $page->ID, self::META, true ) !== $code ) { return new WP_Error( 'hscard_post_identity', '카드 게시글 ID 충돌: ' . $code ); }
  if ( $page && 'trash' === $page->post_status ) { return true; }
  $occupied = get_page_by_path( $slug, OBJECT, array( 'page', 'attachment', 'post' ) );
  if ( $occupied && ( ! $page || $occupied->ID !== $page->ID ) ) { return new WP_Error( 'hscard_post_slug', '기존 글 또는 페이지와 주소가 겹칩니다: ' . $code ); }
  $status = $page ? $page->post_status : 'publish';
  if ( $page && get_post_meta( $page->ID, self::INACTIVE_META, true ) ) { $status = 'publish'; }
  $category = self::category_id();if ( is_wp_error( $category ) ) { return $category; }
  if ( $page ) { $assigned = self::assign_category( $page->ID, $category );if ( is_wp_error( $assigned ) ) { return $assigned; } }
  $first_date = Card_Documents::first_date( $card );
  if ( '' === $first_date ) { return new WP_Error( 'hscard_card_date_pending', '카드 최초 날짜를 읽은 뒤 게시글을 등록합니다: ' . $code ); }
  // JSON stores a calendar day only. Keep that date in WordPress and derive
  // GMT through the site's timezone; never invent an exact release time.
  $date = $first_date . ' 00:00:00';$gmt = get_gmt_from_date( $date );
  if ( $page && $page->post_title === $card['name'] && $page->post_name === $slug && $page->post_status === $status && $page->post_date === $date && $page->post_date_gmt === $gmt ) { return true; }
  $post = array( 'post_type' => 'post', 'post_title' => $card['name'], 'post_name' => $slug, 'post_status' => $status, 'post_parent' => 0, 'post_date' => $date, 'post_date_gmt' => $gmt, 'edit_date' => true, 'post_category' => array( $category ) );
  if ( $page ) { $post['ID'] = $page->ID; }
  else {
   $post['post_content'] = '[hscard_card]';
   $post['post_author'] = absint( $author );
   $post['comment_status'] = 'closed'; $post['ping_status'] = 'closed';
   $post['meta_input'] = array( self::META => $code, self::DBF_META => absint( $dbf ) );
  }
  $result = $page ? wp_update_post( wp_slash( $post ), true ) : wp_insert_post( wp_slash( $post ), true );
  if ( is_wp_error( $result ) ) { return $result; }
  if ( get_post( $result )->post_name !== $slug ) {
   wp_update_post( array( 'ID' => $result, 'post_status' => 'draft' ) );
   return new WP_Error( 'hscard_post_slug_race', '게시글 주소를 확보하지 못했습니다: ' . $code );
  }
  delete_post_meta( $result, self::INACTIVE_META );
  return self::assign_category( $result, $category );
 }

 public static function urls( array $cards ) {
  $urls = array();
  $posts = self::posts( array_keys( $cards ) );
  if ( is_wp_error( $posts ) ) { return $urls; }
  foreach ( $posts as $page ) {
   $id = absint( get_post_meta( $page->ID, self::DBF_META, true ) );
   if ( 'publish' !== $page->post_status || ! isset( $cards[ $id ] ) || ! self::eligible( $cards[ $id ] ) || get_post_meta( $page->ID, self::META, true ) !== $cards[ $id ]['card_code'] ) { continue; }
   $urls[ $id ] = get_permalink( $page );
  }
  return $urls;
 }

 public static function is_card_post( $id ) { return '' !== (string) get_post_meta( $id, self::META, true ); }

 /** HSdeck normally loads its reusable tile styles only for deck-code articles. */
 public static function enqueue_shared_styles() {
  if ( ! function_exists( 'hsdeck_post_may_have_deck' ) ) { return; }
  $path = get_theme_file_path( 'assets/css/deck-tiles-v2.css' );
  if ( is_readable( $path ) ) {
   wp_enqueue_style( 'hsdeck-deck-tiles', get_theme_file_uri( 'assets/css/deck-tiles-v2.css' ), array( 'hsdeck-style' ), substr( hash_file( 'sha256', $path ), 0, 16 ) );
  }
 }

 /** Managed posts use the exact card code, independent of category/date permalinks. */
 public static function permalink( $url, $post ) {
  $code = get_post_meta( $post->ID, self::META, true );
  return get_option( 'permalink_structure' ) && is_string( $code ) && preg_match( '/\A[A-Za-z0-9_]{1,96}\z/D', $code )
   ? home_url( '/' . user_trailingslashit( $code, 'single' ) ) : $url;
 }

 /** Resolve only a registered card ID. Unrelated WordPress routes stay intact. */
 public static function resolve_request( $wp ) {
  $code = trim( $wp->request, '/' );
  if ( ! preg_match( '/\A[A-Za-z0-9_]{1,96}\z/D', $code ) ) { return; }
  $posts = get_posts( array( 'post_type' => 'post', 'post_status' => 'publish', 'numberposts' => 1, 'meta_key' => self::META, 'meta_value' => $code ) );
  if ( ! $posts ) { return; }
  $wp->query_vars = array( 'p' => $posts[0]->ID, 'post_type' => 'post' );
 }

 public static function render() {
  $post = get_queried_object();
  if ( ! $post instanceof \WP_Post || ! self::is_card_post( $post->ID ) || ! class_exists( 'HScard\\Deck_View', false ) ) { return ''; }
  $id = absint( get_post_meta( $post->ID, self::DBF_META, true ) );
  $cards = ( new Card_Store() )->find_cards( array( $id ) );
  if ( ! isset( $cards[ $id ] ) || ! self::eligible( $cards[ $id ] ) || $cards[ $id ]['card_code'] !== get_post_meta( $post->ID, self::META, true ) ) { return ''; }
  return ( new Deck_View() )->render( array( $id => 1 ), $cards, '', 'center', array(), array(), $cards[ $id ]['name'], '', '', false, current_time( 'Y-m-d' ), 'current', true );
 }

 public static function notice() {
  if ( ! current_user_can( 'manage_options' ) ) { return; }
  $errors = get_option( self::ERRORS, array() );
  if ( $errors ) { echo '<div class="notice notice-warning"><p>' . esc_html( '일부 카드 게시글을 만들지 못했습니다. ' . implode( ' / ', array_slice( $errors, 0, 3 ) ) ) . '</p></div>'; }
 }
}
