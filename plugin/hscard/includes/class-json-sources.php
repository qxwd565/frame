<?php
/** Editable catalog of remote and locally managed HScard schema:1 JSON files. @package HScard */
namespace HScard;
use WP_Error;
if ( ! defined( 'ABSPATH' ) ) { exit; }

final class Json_Sources {
 const OPTION = 'hscard_json_sources';
 const ORDER_OPTION = 'hscard_json_source_order';
 const REPOSITORY_PREFIX = 'https://raw.githubusercontent.com/qxwd565/';
 const REPOSITORY_SUFFIX = '/main/cards.json';
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

 /** Display order is separate from source content and card-resolution priority. */
 public static function ordered() {
  $sources = self::all();
  $order = get_option( self::ORDER_OPTION, array() );
  $sorted = array();
  foreach ( is_array( $order ) ? $order : array() as $id ) {
   if ( is_string( $id ) && isset( $sources[ $id ] ) ) { $sorted[ $id ] = $sources[ $id ]; }
  }
  return $sorted + $sources;
 }

 public static function reorder( array $ids ) {
  $sources = self::ordered();
  if ( ! $ids || count( $ids ) > self::MAX_SOURCES ) { return new WP_Error( 'hscard_order', '순서 목록이 올바르지 않습니다.' ); }
  $selected = array();
  foreach ( $ids as $id ) {
   if ( ! self::is_valid_id( $id ) || ! isset( $sources[ $id ] ) || isset( $selected[ $id ] ) ) {
    return new WP_Error( 'hscard_order', '목록이 변경되었습니다. 새로고침 후 다시 정렬하세요.' );
   }
   $selected[ $id ] = true;
  }
  // Search results reorder only their existing slots. Hidden/new sources stay.
  $order = array(); $next = 0;
  foreach ( array_keys( $sources ) as $id ) { $order[] = isset( $selected[ $id ] ) ? $ids[ $next++ ] : $id; }
  update_option( self::ORDER_OPTION, $order, false );
  if ( get_option( self::ORDER_OPTION, array() ) !== $order ) { return new WP_Error( 'hscard_order', '순서를 저장하지 못했습니다. 다시 시도하세요.' ); }
  return $order;
 }

 public static function repository_url( $repository ) {
  if ( ! is_string( $repository ) ) { return new WP_Error( 'hscard_repository', '저장소 이름을 입력하세요.' ); }
  $repository = trim( $repository );
  if ( ! preg_match( '/\A[A-Za-z0-9_.-]{1,100}\z/D', $repository ) || in_array( $repository, array( '.', '..' ), true ) ) {
   return new WP_Error( 'hscard_repository', '저장소 이름에는 영문, 숫자, 점, 밑줄, 하이픈만 사용할 수 있습니다.' );
  }
  return self::REPOSITORY_PREFIX . $repository . self::REPOSITORY_SUFFIX;
 }

 /** Only newly repository-managed sources opt in; old set IDs stay intact. */
 public static function repository_set_id( array $source ) {
  $repository = isset( $source['repository'] ) ? $source['repository'] : '';
  return is_wp_error( self::repository_url( $repository ) ) ? '' : trim( $repository );
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
 public static function source_groups_for_cards( array $cards, array $sources, $include_fallback = false ) {
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

 /**
  * Exact per-card dates-v1 source URLs. No scanning every cards.json or
  * render.json, no history.json, and never guess a card's source from its class.
  * Inventories remain as ID/set lookup tables only.
  */
 public static function card_urls_for_cards( array $cards ) {
  $sources = self::all();
  $groups = self::source_groups_for_cards( $cards, $sources, false );
  $urls = array();
  foreach ( $groups as $source_id => $members ) {
   if ( ! isset( $sources[ $source_id ] ) ) { continue; }
   $source = $sources[ $source_id ];
   foreach ( $members as $id => $code ) {
    $id = absint( $id );
    if ( isset( $urls[ $id ] ) || ! is_string( $code ) || ! preg_match( '/\A[A-Za-z0-9_]{1,96}\z/D', $code ) ) { continue; }
    $url = self::card_url( $source_id, $source, $code );
    if ( $url ) { $urls[ $id ] = $url; }
   }
  }
  // Older installations may have complete cards in the database but no
  // per-card source map or an original art URL. In that case an exact,
  // UNIQUE match between the already imported card set and the configured
  // source set is deterministic provenance, not a repository-wide guess.
  // Keep the strict dates-v1 per-card JSON contract; never read old patches.
  foreach ( $cards as $dbf_id => $card ) {
   $id = absint( isset( $card['id'] ) ? $card['id'] : $dbf_id );
   if ( ! $id || isset( $urls[ $id ] ) || ! is_array( $card ) ) { continue; }
   $code = isset( $card['card_code'] ) ? (string) $card['card_code'] : '';
   if ( ! preg_match( '/\A[A-Za-z0-9_]{1,96}\z/D', $code ) ) { continue; }
   $native = isset( $card['native_meta'] ) && is_string( $card['native_meta'] ) ? json_decode( $card['native_meta'], true ) : null;
   $set = is_array( $native ) && isset( $native['set'] ) && is_string( $native['set'] ) ? trim( $native['set'] ) : '';
   if ( '' === $set ) { continue; }
   $matched = array();
   foreach ( $sources as $sid => $source ) {
    if ( ! self::is_valid_id( $sid ) || ! is_array( $source ) || empty( $source['enabled'] ) ) { continue; }
    $source_set = isset( $source['set'] ) && is_string( $source['set'] ) ? trim( $source['set'] ) : '';
    if ( '' === $source_set || 0 !== strcasecmp( $set, $source_set ) ) { continue; }
    $url = self::card_url( $sid, $source, $code );
    if ( $url ) { $matched[] = $url; }
   }
   if ( 1 === count( $matched ) ) { $urls[ $id ] = $matched[0]; }
  }

  // Some upgraded installations predate source_id attribution: only infer
  // from an EXACT imported art URL prefix. Never fall back across all sets.
  foreach ( $cards as $dbf_id => $card ) {
   $id = absint( isset( $card['id'] ) ? $card['id'] : $dbf_id );
   if ( ! $id || isset( $urls[ $id ] ) || ! is_array( $card ) ) { continue; }
   $code = isset( $card['card_code'] ) ? (string) $card['card_code'] : '';
   $art = isset( $card['art'] ) ? (string) $card['art'] : '';
   if ( ! preg_match( '/\A[A-Za-z0-9_]{1,96}\z/D', $code ) || ! $art ) { continue; }
   foreach ( $sources as $sid => $source ) {
    if ( ! is_array( $source ) || empty( $source['enabled'] ) || 'local' === ( isset( $source['mode'] ) ? $source['mode'] : '' ) ) { continue; }
    $base = self::url( $sid, $source );
    $path = strtok( $base, '?' );
    if ( ! is_string( $path ) || ! preg_match( '~^(https://[^?#]+/)cards\.json$~i', $path, $m ) ) { continue; }
    if ( 0 === strpos( $art, $m[1] . 'art/' ) ) {
     $url = self::card_url( $sid, $source, $code );
     if ( $url ) { $urls[ $id ] = $url; }
     break;
    }
   }
  }
  return $urls;
 }

 public static function card_url( $source_id, array $source, $card_id ) {
  if ( ! self::is_valid_id( $source_id ) || ! is_string( $card_id ) || ! preg_match( '/\A[A-Za-z0-9_]{1,96}\z/D', $card_id ) || empty( $source['enabled'] ) ) { return ''; }
  if ( 'local' === ( isset( $source['mode'] ) ? $source['mode'] : 'remote' ) ) {
   return rest_url( 'hscard/v1/card/' . rawurlencode( $source_id ) . '/' . rawurlencode( $card_id ) );
  }
  $url = self::url( $source_id, $source );
  $path = strtok( $url, '?' );
  if ( ! is_string( $path ) || ! preg_match( '~^https://[^?#]+/cards\.json$~i', $path ) ) { return ''; }
  return esc_url_raw( substr( $path, 0, strrpos( $path, '/' ) + 1 ) . 'data/' . $card_id . '.json' );
 }

 private static function card_option_key( $source_id, $card_id ) {
  return 'hscard_dated_' . substr( hash( 'sha256', $source_id . '/' . $card_id ), 0, 40 );
 }
 public static function card_content( $source_id, $card_id ) {
  $content = get_option( self::card_option_key( $source_id, $card_id ), '' );
  return is_string( $content ) ? $content : '';
 }
 public static function save_card_content( $source_id, $card_id, $content ) {
  if ( ! self::is_valid_id( $source_id ) || ! is_string( $card_id ) || ! preg_match( '/\A[A-Za-z0-9_]{1,96}\z/D', $card_id ) || ! is_string( $content ) || strlen( $content ) > 1048576 ) { return false; }
  $doc = json_decode( $content );
  if ( ! is_object( $doc ) || property_exists( $doc, 'card' ) || property_exists( $doc, 'patches' ) || property_exists( $doc, 'history' ) ) { return false; }
  $valid_count = 0;
  foreach ( $doc as $date => $changes ) {
   if ( preg_match( '/\A[0-9]{4}-[0-9]{2}-[0-9]{2}\z/D', (string) $date ) ) {
    $d = explode( '-', $date );
    if ( ! checkdate( (int) $d[1], (int) $d[2], (int) $d[0] ) || ! is_object( $changes ) ) { return false; }
    $valid_count++;
   }
  }
  if ( ! $valid_count ) { return false; }
  $dates = array();
  foreach ( $doc as $date => $change ) { if ( preg_match( '/\A[0-9]{4}-[0-9]{2}-[0-9]{2}\z/D', (string) $date ) ) { $dates[] = $date; } }
  sort( $dates, SORT_STRING );
  $first = $doc->{ $dates[0] };
  if ( ! isset( $first->name, $first->type ) || ! is_string( $first->name ) || ! is_string( $first->type ) ) { return false; }
  update_option( self::card_option_key( $source_id, $card_id ), $content, false );
  return self::card_content( $source_id, $card_id ) === $content;
 }

 public static function serve_card_json( $request ) {
  $id = (string) $request['source']; $code = (string) $request['code'];
  $sources = self::all();
  if ( ! isset( $sources[ $id ] ) || empty( $sources[ $id ]['enabled'] ) || 'local' !== ( isset( $sources[ $id ]['mode'] ) ? $sources[ $id ]['mode'] : '' ) ) {
   return new WP_Error( 'hscard_source_not_found', '카드 소스를 찾을 수 없습니다.', array( 'status' => 404 ) );
  }
  $raw = self::card_content( $id, $code );
  if ( ! $raw ) { return new WP_Error( 'hscard_card_not_found', '날짜별 카드 JSON이 등록되지 않았습니다.', array( 'status' => 404 ) ); }
  $data = json_decode( $raw, true );
  if ( ! is_array( $data ) ) { return new WP_Error( 'hscard_bad_card', '카드 JSON 파싱 실패', array( 'status' => 500 ) ); }
  $res = rest_ensure_response( $data );
  $res->header( 'Cache-Control', 'no-store, max-age=0' );
  return $res;
 }

 public static function register_routes() {
  register_rest_route( 'hscard/v1', '/card/(?P<source>[a-z0-9_-]{1,40})/(?P<code>[A-Za-z0-9_]{1,96})', array( 'methods' => 'GET', 'callback' => array( __CLASS__, 'serve_card_json' ), 'permission_callback' => '__return_true' ) );
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
