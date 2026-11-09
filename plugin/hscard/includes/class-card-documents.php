<?php
/** Prewarm original dated documents; never fetch remote data while rendering a post. */
namespace HScard;
if ( ! defined( 'ABSPATH' ) ) { exit; }

final class Card_Documents {
 const QUEUE = 'hscard_document_queue';
 const CRON = 'hscard_warm_documents';
 const BACKFILL = 'hscard_document_cache_version';
 const PREFIX = 'hscard_document_';

 public static function register() {
  add_action( self::CRON, array( __CLASS__, 'run' ) );
  add_action( 'hscard_cards_changed', array( __CLASS__, 'changed' ) );
  add_action( 'admin_init', array( __CLASS__, 'backfill' ) );
 }
 private static function key( $url ) { return self::PREFIX . hash( 'sha256', $url ); }
 private static function locked( $name, $callback ) {
  global $wpdb;
  $lock = 'hscard_docs_' . substr( hash( 'sha256', ( defined( 'DB_NAME' ) ? DB_NAME : '' ) . $wpdb->prefix . $name ), 0, 40 );
  if ( 1 !== (int) $wpdb->get_var( $wpdb->prepare( 'SELECT GET_LOCK(%s, %d)', $lock, 'queue' === $name ? 2 : 0 ) ) ) { return false; }
  try { return $callback(); }
  finally { $wpdb->get_var( $wpdb->prepare( 'SELECT RELEASE_LOCK(%s)', $lock ) ); }
 }
 private static function read_queue() {
  wp_cache_delete( self::QUEUE, 'options' );
  return (array) get_option( self::QUEUE, array() );
 }
 private static function schedule() {
  if ( get_option( self::QUEUE, array() ) && ! wp_next_scheduled( self::CRON ) ) { wp_schedule_single_event( time() + 1, self::CRON ); }
 }
 private static function queue( array $urls, $force = false, $priority = false ) {
  if ( ! $urls ) { return true; }
  $ok = self::locked( 'queue', static function () use ( $urls, $force, $priority ) {
   $queue = self::read_queue();
   foreach ( array_unique( $urls ) as $url ) {
    if ( ! preg_match( '~\Ahttps://[^?#]+/data/[A-Za-z0-9_]{1,96}\.json\z~D', $url ) ) { continue; }
    $key = self::key( $url );
    if ( $force ) { delete_transient( $key ); }
    if ( isset( $queue[ $key ] ) && ! $force ) { continue; }
    if ( count( $queue ) >= 5000 && ! isset( $queue[ $key ] ) ) { continue; }
    $queue[ $key ] = array( 'url' => $url, 'token' => wp_generate_uuid4(), 'tries' => 0 );
   }
   if ( $priority ) {
    $front = array();foreach ( $urls as $url ) { $key = self::key( $url );if ( isset( $queue[ $key ] ) ) { $front[ $key ] = $queue[ $key ]; } }
    $queue = $front + $queue;
   }
   update_option( self::QUEUE, $queue, false );
   return get_option( self::QUEUE, array() ) === $queue;
  } );
  self::schedule();return $ok;
 }
 public static function changed( array $ids ) {
  require_once HSCARD_PATH . 'includes/class-card-store.php';
  $cards = ( new Card_Store() )->find_cards( $ids );
  return self::queue( Json_Sources::card_urls_for_cards( $cards ), true );
 }
 /** Same-version ZIP replacement also warms existing imports automatically. */
 public static function backfill() {
  if ( ! current_user_can( 'manage_options' ) || 1 === (int) get_option( self::BACKFILL, 0 ) ) { return; }
  $ids = array();
  foreach ( (array) get_option( 'hscard_imported_sets', array() ) as $set ) {
   foreach ( (array) ( $set['cards'] ?? array() ) as $id => $code ) { $ids[ absint( $id ) ] = true; }
  }
  if ( self::changed( array_keys( $ids ) ) ) { update_option( self::BACKFILL, 1, false ); }
 }
 /** Original JSON goes into HTML unchanged, keyed by its exact source URL. */
 public static function for_cards( array $cards, array $urls ) {
  $documents = array();$missing = array();$bytes = 0;$sources = Json_Sources::all();
  if ( function_exists( 'wp_prime_option_caches' ) && ! wp_using_ext_object_cache() ) {
   $keys = array();foreach ( $urls as $url ) { $key = self::key( $url );$keys[] = '_transient_' . $key;$keys[] = '_transient_timeout_' . $key; }
   wp_prime_option_caches( $keys );
  }
  foreach ( $cards as $id => $card ) {
   // Deck display order is a list after sideboard grouping, not DBF-keyed.
   $id = absint( $card['id'] ?? $id );
   $url = $urls[ $id ] ?? '';if ( ! $url || isset( $documents[ $url ] ) ) { continue; }
   $raw = '';
   foreach ( $sources as $sid => $source ) {
    if ( 'local' === ( $source['mode'] ?? '' ) && Json_Sources::card_url( $sid, $source, $card['card_code'] ?? '' ) === $url ) { $raw = Json_Sources::card_content( $sid, $card['card_code'] );break; }
   }
   if ( '' === $raw ) {
    $cached = get_transient( self::key( $url ) );
    if ( is_array( $cached ) && $url === ( $cached['url'] ?? '' ) ) { $raw = $cached['body'] ?? ''; }
    if ( ! is_array( $cached ) || (int) ( $cached['checked'] ?? 0 ) < time() - 300 ) { $missing[] = $url; }
   }
   if ( ! $raw ) { continue; }
   if ( ! Json_Sources::valid_card_content( $raw ) ) { $missing[] = $url;continue; }
   $document = json_decode( $raw );
   // Match the browser's limit after JSON encoding, including escaping.
   $length = strlen( wp_json_encode( $url ) ) + strlen( wp_json_encode( $document, JSON_HEX_TAG | JSON_HEX_AMP | JSON_HEX_APOS | JSON_HEX_QUOT ) ) + 2;
   if ( $bytes + $length + 2 > 1048576 ) { continue; }
   $documents[ $url ] = $document;$bytes += $length;
  }
  self::queue( $missing, false, true );return $documents;
 }
 public static function run() {
  self::locked( 'runner', static function () {
   $batch = self::locked( 'queue', static function () { return array_slice( self::read_queue(), 0, 4, true ); } );
   foreach ( is_array( $batch ) ? $batch : array() as $key => $job ) {
    $response = wp_safe_remote_get( $job['url'], array( 'timeout' => 5, 'redirection' => 0, 'limit_response_size' => 1048577, 'headers' => array( 'Accept' => 'application/json' ) ) );
    $raw = ! is_wp_error( $response ) && 200 === (int) wp_remote_retrieve_response_code( $response ) ? wp_remote_retrieve_body( $response ) : '';
    $valid = Json_Sources::valid_card_content( $raw );
    self::locked( 'queue', static function () use ( $key, $job, $raw, $valid ) {
     $queue = self::read_queue();
     if ( ( $queue[ $key ]['token'] ?? '' ) !== $job['token'] ) { return; }
     if ( $valid ) {
      set_transient( $key, array( 'url' => $job['url'], 'body' => $raw, 'checked' => time() ), 30 * DAY_IN_SECONDS );
      unset( $queue[ $key ] );
     } elseif ( ++$queue[ $key ]['tries'] >= 3 ) {
      $previous = get_transient( $key );
      set_transient( $key, array( 'url' => $job['url'], 'body' => is_array( $previous ) ? ( $previous['body'] ?? '' ) : '', 'checked' => time() ), DAY_IN_SECONDS );
      unset( $queue[ $key ] );
     }
     update_option( self::QUEUE, $queue, false );
    } );
   }
  } );
  self::schedule();
 }
}
