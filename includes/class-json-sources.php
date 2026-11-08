<?php
/** Editable catalog of remote and locally managed HScard schema:1 JSON files. @package HScard */
namespace HScard;
use WP_Error;
if ( ! defined( 'ABSPATH' ) ) { exit; }

final class Json_Sources {
 const OPTION = 'hscard_json_sources';
 const CONTENT_PREFIX = 'hscard_managed_json_';
 const MAX_SOURCES = 100;
 const MAX_JSON_BYTES = 16777216;
 const FRONTEND_LIMIT = 51;

 /** Existing installations get two familiar sources plus every previously imported URL. */
 private static function initial_sources() {
  $sources = array(
   'legacy' => array( 'label' => '레거시', 'url' => 'https://raw.githubusercontent.com/qxwd565/legacy/main/cards.json', 'art_base' => '', 'mode' => 'remote', 'enabled' => 1, 'set' => 'legacy', 'count' => 0 ),
   'timeways' => array( 'label' => '시간의 길 (Across The Timeways)', 'url' => 'https://raw.githubusercontent.com/qxwd565/Across-The-Timeways/main/cards.json', 'art_base' => '', 'mode' => 'remote', 'enabled' => 1, 'set' => 'Across The Timeways', 'count' => 0 ),
  );
  $imports = get_option( 'hscard_imported_sets', array() );
  foreach ( is_array( $imports ) ? $imports : array() as $set => $item ) {
   if ( ! is_array( $item ) || empty( $item['url'] ) || ! is_string( $item['url'] ) ) { continue; }
   $url = self::legacy_url( $item['url'] );
   if ( '' === $url ) { continue; }
   $matching = '';
   foreach ( $sources as $id => $source ) { if ( $source['url'] === $url ) { $matching = $id; break; } }
   if ( '' !== $matching ) { $sources[ $matching ]['set'] = (string) $set; $sources[ $matching ]['count'] = absint( isset( $item['count'] ) ? $item['count'] : 0 ); continue; }
   if ( count( $sources ) >= self::MAX_SOURCES ) { break; }
   $id = 'src_' . substr( hash( 'sha256', $url ), 0, 16 );
   $sources[ $id ] = array( 'label' => (string) $set, 'url' => $url, 'art_base' => '', 'mode' => 'remote', 'enabled' => 1, 'set' => (string) $set, 'count' => absint( isset( $item['count'] ) ? $item['count'] : 0 ) );
  }
  return $sources;
 }

 public static function legacy_url( $url ) {
  return str_replace( '/qxwd565/Hearthstone-legacy-API/', '/qxwd565/legacy/', (string) $url );
 }

 /** No writes happen during frontend requests. A saved empty registry stays empty. */
 public static function all() {
  $value = get_option( self::OPTION, null );
  return is_array( $value ) ? $value : self::initial_sources();
 }

 public static function save( array $sources ) {
  return update_option( self::OPTION, $sources, false );
 }

 public static function new_id( array $sources ) {
  do { $id = 'src_' . strtolower( wp_generate_password( 16, false, false ) ); } while ( isset( $sources[ $id ] ) );
  return $id;
 }

 public static function is_valid_id( $id ) {
  return is_string( $id ) && 1 === preg_match( '/\A[a-z0-9_-]{1,40}\z/D', $id );
 }

 public static function content( $id ) {
  if ( ! self::is_valid_id( $id ) ) { return ''; }
  $content = get_option( self::CONTENT_PREFIX . $id, '' );
  return is_string( $content ) ? $content : '';
 }

 public static function save_content( $id, $content ) {
  if ( ! self::is_valid_id( $id ) || ! is_string( $content ) || strlen( $content ) > self::MAX_JSON_BYTES ) { return false; }
  update_option( self::CONTENT_PREFIX . $id, $content, false );
  return self::content( $id ) === $content;
 }

 public static function delete_content( $id ) {
  if ( self::is_valid_id( $id ) ) { delete_option( self::CONTENT_PREFIX . $id ); }
 }

 public static function public_url( $id ) {
  return rest_url( 'hscard/v1/json/' . rawurlencode( $id ) );
 }

 public static function url( $id, array $item ) {
  if ( 'local' === ( isset( $item['mode'] ) ? $item['mode'] : 'remote' ) ) { return self::public_url( $id ); }
  return self::legacy_url( isset( $item['url'] ) ? (string) $item['url'] : '' );
 }

 /**
  * Match actual DBF/card IDs to imported API sources once for both native
  * rendering and dated-history lookup. Local JSON overrides come first.
  */
 public static function source_groups_for_cards( array $cards, array $sources, $include_fallback = true ) {
  $by_code = array();
  foreach ( $cards as $id => $card ) {
   $id = absint( is_array( $card ) && isset( $card['id'] ) ? $card['id'] : $id );
   if ( $id && is_array( $card ) ) {
    // Older imports have a DBF ID but no string ID. Keep them eligible for
    // identity resolution against imported provenance or the API index.
    $by_code[ $id ] = isset( $card['card_code'] ) ? trim( (string) $card['card_code'] ) : '';
   }
  }
  $groups = array();
  $located = array();
  $imports = get_option( 'hscard_imported_sets', array() );
  foreach ( is_array( $imports ) ? $imports : array() as $set ) {
   if ( ! is_array( $set ) || empty( $set['cards'] ) || ! is_array( $set['cards'] ) ) { continue; }
   $source_id = isset( $set['source_id'] ) ? (string) $set['source_id'] : '';
   if ( ! isset( $sources[ $source_id ] ) && ! empty( $set['url'] ) ) {
    foreach ( $sources as $candidate_id => $source ) {
     if ( is_array( $source ) && self::url( $candidate_id, $source ) === self::legacy_url( (string) $set['url'] ) ) {
      $source_id = $candidate_id;
      break;
     }
    }
   }
   if ( ! isset( $sources[ $source_id ] ) || empty( $sources[ $source_id ]['enabled'] ) ) { continue; }
   foreach ( $set['cards'] as $id => $code ) {
    $id = absint( $id );
    if ( isset( $by_code[ $id ] ) && is_string( $code ) && preg_match( '/\A[A-Za-z0-9_]{1,96}\z/D', $code ) && ( '' === $by_code[ $id ] || $by_code[ $id ] === $code ) ) {
     $groups[ $source_id ][ $id ] = $code;
     $located[ $id ] = true;
    }
   }
  }
  if ( $include_fallback ) {
   $unknown = array_diff_key( $by_code, $located );
   if ( $unknown ) {
    foreach ( array( 'legacy', 'timeways' ) as $source_id ) {
     if ( isset( $sources[ $source_id ] ) && ! empty( $sources[ $source_id ]['enabled'] ) ) {
      $groups[ $source_id ] = isset( $groups[ $source_id ] ) ? $groups[ $source_id ] + $unknown : $unknown;
     }
    }
   }
  }
  uksort( $groups, static function ( $left, $right ) use ( $sources ) {
   $l = isset( $sources[ $left ]['mode'] ) && 'local' === $sources[ $left ]['mode'] ? 1 : 0;
   $r = isset( $sources[ $right ]['mode'] ) && 'local' === $sources[ $right ]['mode'] ? 1 : 0;
   return $r <=> $l;
  } );
  return $groups;
 }

 public static function frontend_urls() {
  $local = array(); $remote = array();
  foreach ( self::all() as $id => $source ) {
   if ( ! self::is_valid_id( $id ) || ! is_array( $source ) || empty( $source['enabled'] ) ) { continue; }
   $url = self::url( $id, $source );
   if ( '' === $url ) { continue; }
   if ( 'local' === ( isset( $source['mode'] ) ? $source['mode'] : '' ) ) { $local[] = $url; }
   else { $remote[] = $url; }
  }
  return array_slice( array_values( array_unique( array_merge( $local, $remote ) ) ), 0, self::FRONTEND_LIMIT );
 }

 /** Avoid downloading every enabled expansion catalog for a single deck. */
 public static function frontend_urls_for_cards( array $cards ) {
  if ( ! $cards ) { return array(); }
  $sources = self::all();
  $groups = self::source_groups_for_cards( $cards, $sources, false );
  $matched = array();
  foreach ( $groups as $group ) { foreach ( $group as $id => $_code ) { $matched[ absint( $id ) ] = true; } }
  $wanted = array();
  foreach ( $cards as $id => $card ) {
   if ( ! is_array( $card ) ) { continue; }
   $id = absint( isset( $card['id'] ) ? $card['id'] : $id );
   if ( $id ) { $wanted[ $id ] = true; }
  }
  // Cards imported by older versions may need the full source search fallback.
  if ( ! $wanted || count( $matched ) < count( $wanted ) ) { return self::frontend_urls(); }
  $urls = array();
  foreach ( array_keys( $groups ) as $id ) {
   if ( ! isset( $sources[ $id ] ) ) { continue; }
   $url = self::url( $id, $sources[ $id ] );
   if ( $url ) { $urls[] = $url; }
  }
  return array_slice( array_values( array_unique( $urls ) ), 0, self::FRONTEND_LIMIT );
 }

 public static function register_routes() {
  register_rest_route( 'hscard/v1', '/json/(?P<id>[a-z0-9_-]{1,40})', array(
   'methods' => 'GET', 'callback' => array( __CLASS__, 'serve_json' ), 'permission_callback' => '__return_true',
  ) );
 }

 /** Card data is public by design; JSON editing and the storage option remain administrator-only. */
 public static function serve_json( $request ) {
  $id = (string) $request['id'];
  $sources = self::all();
  if ( ! isset( $sources[ $id ] ) || ! is_array( $sources[ $id ] ) || empty( $sources[ $id ]['enabled'] ) || 'local' !== ( isset( $sources[ $id ]['mode'] ) ? $sources[ $id ]['mode'] : '' ) ) {
   return new WP_Error( 'hscard_source_not_found', __( 'JSON 소스를 찾을 수 없습니다.', 'hscard' ), array( 'status' => 404 ) );
  }
  $data = json_decode( self::content( $id ), true );
  if ( ! is_array( $data ) || ! isset( $data['schema'], $data['set'], $data['cards'] ) || 1 !== $data['schema'] || ! is_array( $data['cards'] ) ) {
   return new WP_Error( 'hscard_source_invalid', __( '저장된 JSON 형식이 올바르지 않습니다.', 'hscard' ), array( 'status' => 500 ) );
  }
  $source = $sources[ $id ];
  $data['hscardLocal'] = true;
  $art_base = ! empty( $source['art_base'] ) ? $source['art_base'] : ( isset( $source['url'] ) ? $source['url'] : '' );
  if ( is_string( $art_base ) && '' !== $art_base ) { $data['artBaseUrl'] = $art_base; }
  $response = rest_ensure_response( $data );
  $response->header( 'Cache-Control', 'no-store, max-age=0' );
  return $response;
 }
}
