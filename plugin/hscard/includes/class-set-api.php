<?php
/** Validates and imports an HScard schema:1 JSON document. @package HScard */
namespace HScard;
use WP_Error;
if ( ! defined( 'ABSPATH' ) ) { exit; }

final class Set_API {
 const MAX_BYTES = 16777216;
 const MAX_CARDS = 5000;
 private function fail( $message ) { return new WP_Error( 'hscard_set_api', $message ); }

 /** Normalize GitHub's file view to a raw HTTPS JSON URL. */
 public function validate_url( $url ) {
  $url = trim( (string) $url );
  if ( preg_match( '~\Ahttps://github\.com/([A-Za-z0-9_.-]+)/([A-Za-z0-9_.-]+)/blob/([^/?#]+)/([^?#]+)(?:\?[^#]*)?\z~i', $url, $match ) ) {
   $url = 'https://raw.githubusercontent.com/' . $match[1] . '/' . $match[2] . '/' . $match[3] . '/' . $match[4];
  }
  $url = str_replace( '/qxwd565/Hearthstone-legacy-API/', '/qxwd565/legacy/', $url );
  $parts = wp_parse_url( $url );
  if ( ! is_array( $parts ) || 'https' !== strtolower( isset( $parts['scheme'] ) ? $parts['scheme'] : '' ) || empty( $parts['host'] ) || empty( $parts['path'] ) || ! preg_match( '~\.json\z~i', $parts['path'] ) || isset( $parts['user'] ) || isset( $parts['pass'] ) || isset( $parts['fragment'] ) ) {
   return $this->fail( __( 'JSON 주소는 공개 HTTPS .json 파일 주소여야 합니다.', 'hscard' ) );
  }
  return esc_url_raw( $url );
 }

 public function fetch_raw( $url ) {
  $url = $this->validate_url( $url );
  if ( is_wp_error( $url ) ) { return $url; }
  $response = wp_safe_remote_get( $url, array(
   'timeout' => 30, 'redirection' => 0, 'limit_response_size' => self::MAX_BYTES + 1,
   'headers' => array( 'Accept' => 'application/json' ), 'user-agent' => 'HScard/' . HSCARD_VERSION,
  ) );
  if ( is_wp_error( $response ) ) { return $this->fail( __( '카드 데이터 URL에 연결하지 못했습니다.', 'hscard' ) ); }
  $status = (int) wp_remote_retrieve_response_code( $response );
  if ( 200 !== $status ) { return $this->fail( sprintf( __( 'JSON 요청 실패 (HTTP %d).', 'hscard' ), $status ) ); }
  $body = wp_remote_retrieve_body( $response );
  if ( ! is_string( $body ) || strlen( $body ) > self::MAX_BYTES ) { return $this->fail( __( 'JSON이 비어 있거나 최대 크기(16MB)를 초과했습니다.', 'hscard' ) ); }
  return $body;
 }

 /** Existing import contract, retained for callers outside the new manager. */
 public function fetch( $url ) {
  $valid_url = $this->validate_url( $url );
  if ( is_wp_error( $valid_url ) ) { return $valid_url; }
  $raw = $this->fetch_raw( $valid_url );
  return is_wp_error( $raw ) ? $raw : $this->parse_json( $raw, $valid_url );
 }

 /** Also used for uploaded and locally edited JSON; $art_url is its original hosted JSON address. */
 public function parse_json( $raw, $art_url = '' ) {
  if ( ! is_string( $raw ) || '' === trim( $raw ) || strlen( $raw ) > self::MAX_BYTES ) {
   return $this->fail( __( 'JSON 내용은 16MB 이하여야 합니다.', 'hscard' ) );
  }
  $data = json_decode( $raw, true );
  if ( JSON_ERROR_NONE !== json_last_error() || ! is_array( $data ) || ! isset( $data['schema'], $data['set'], $data['cards'] ) || 1 !== $data['schema'] || ! is_string( $data['set'] ) || ! preg_match( '/\A[A-Za-z0-9][A-Za-z0-9 _-]{0,95}\z/D', $data['set'] ) || ! is_array( $data['cards'] ) || count( $data['cards'] ) < 1 || count( $data['cards'] ) > self::MAX_CARDS ) {
   return $this->fail( __( 'schema: 1, 영문 세트명(set), 비어 있지 않은 cards 배열이 필요합니다.', 'hscard' ) );
  }
  $art_url = '' !== $art_url ? $this->validate_url( $art_url ) : '';
  if ( is_wp_error( $art_url ) ) { return $art_url; }
  $cards = array(); $codes = array(); $identifiers = array();
  foreach ( $data['cards'] as $card ) {
   $item = $this->normalise( $card, $art_url );
   if ( is_wp_error( $item ) ) { return $item; }
   if ( isset( $cards[ $item['id'] ] ) || isset( $codes[ $item['card_code'] ] ) ) {
    return $this->fail( __( '카드 ID 또는 DBF ID가 중복됩니다.', 'hscard' ) );
   }
   $cards[ $item['id'] ] = $item;
   $codes[ $item['card_code'] ] = true;
   if ( isset( $card['set'] ) && is_string( $card['set'] ) && '' !== $card['set'] ) { $identifiers[ $card['set'] ] = true; }
  }
  return array( 'set' => $data['set'], 'cards' => array_values( $cards ), 'identifiers' => array_slice( array_keys( $identifiers ), 0, 32 ) );
 }

 private function normalise( $card, $url ) {
  if ( ! is_array( $card ) || ! isset( $card['id'], $card['dbfId'], $card['name'], $card['type'], $card['cost'] ) || ! is_string( $card['id'] ) || ! preg_match( '/\A[A-Za-z0-9_]{1,96}\z/D', $card['id'] ) || ! is_int( $card['dbfId'] ) || $card['dbfId'] < 1 || ! is_string( $card['name'] ) || '' === trim( $card['name'] ) || ! is_string( $card['type'] ) || ! preg_match( '/\A[A-Z_]{1,24}\z/D', $card['type'] ) || ! is_int( $card['cost'] ) || $card['cost'] < 0 || $card['cost'] > 32767 ) {
   return $this->fail( __( '카드 ID, DBF ID 또는 필수 정보가 올바르지 않습니다.', 'hscard' ) );
  }
  $class = isset( $card['cardClass'] ) ? $card['cardClass'] : 'NEUTRAL';
  if ( ! is_string( $class ) || ! preg_match( '/\A[A-Z_]{1,32}\z/D', $class ) ) { return $this->fail( __( '카드 직업 정보가 올바르지 않습니다.', 'hscard' ) ); }
  $rarity = isset( $card['rarity'] ) ? $card['rarity'] : 'FREE';
  $rarities = array( 'FREE' => 1, 'COMMON' => 2, 'RARE' => 3, 'EPIC' => 4, 'LEGENDARY' => 5 );
  if ( ! is_string( $rarity ) || ! isset( $rarities[ $rarity ] ) ) { return $this->fail( __( '카드 희귀도 정보가 올바르지 않습니다.', 'hscard' ) ); }
  foreach ( array( 'attack', 'health', 'durability', 'armor' ) as $key ) {
   if ( isset( $card[ $key ] ) && ( ! is_int( $card[ $key ] ) || $card[ $key ] < 0 || $card[ $key ] > 32767 ) ) { return $this->fail( __( '카드 능력치가 올바르지 않습니다.', 'hscard' ) ); }
  }
  if ( ( isset( $card['text'] ) && ! is_string( $card['text'] ) ) || ( isset( $card['collectible'] ) && ! is_bool( $card['collectible'] ) ) || ( isset( $card['race'] ) && ! is_string( $card['race'] ) ) || ( isset( $card['spellSchool'] ) && ! is_string( $card['spellSchool'] ) ) ) { return $this->fail( __( '카드 상세 정보가 올바르지 않습니다.', 'hscard' ) ); }
  if ( isset( $card['text'] ) && ( strlen( $card['text'] ) > 60000 || false !== strpos( $card['text'], chr( 0 ) ) ) ) { return $this->fail( __( '카드 설명이 올바르지 않습니다.', 'hscard' ) ); }
  $art = '';
  if ( isset( $card['art'] ) && '' !== $card['art'] ) {
   if ( ! is_string( $card['art'] ) || ! preg_match( '/\Aart\/([A-Za-z0-9_]{1,96})\.(png|jpg|webp)\z/D', $card['art'], $art_match ) || $art_match[1] !== $card['id'] ) { return $this->fail( __( '원화 경로가 올바르지 않습니다.', 'hscard' ) ); }
   if ( '' !== $url ) {
    $path = strtok( $url, '?' );
    $base = substr( $path, 0, strrpos( $path, '/' ) + 1 );
    $art = $base . $card['art'];
   }
  }
  // Store the native visual metadata ONCE at import time, rather than
  // downloading render.json every time somebody views a deck. Only typed,
  // size-limited fields are retained; historical corrections remain separate.
  $native_meta = array();
  $set = isset( $card['set'] ) && is_string( $card['set'] ) ? trim( $card['set'] ) : '';
  $watermark = isset( $card['watermark'] ) && is_string( $card['watermark'] ) ? trim( $card['watermark'] ) : '';
  if ( strlen( $set ) <= 96 && strlen( $watermark ) <= 128 ) {
   $native_meta['set'] = $set;
   $native_meta['watermark'] = $watermark;
  }
  if ( isset( $card['nativeTags'] ) && is_array( $card['nativeTags'] ) && count( $card['nativeTags'] ) <= 256 ) {
   $tags = array();
   foreach ( $card['nativeTags'] as $tag ) {
    if ( ! is_array( $tag ) || ! isset( $tag['id'], $tag['value'] ) || ! is_int( $tag['id'] ) || ! is_numeric( $tag['value'] ) || $tag['id'] < 0 || $tag['id'] > 100000 || abs( (float) $tag['value'] ) > 100000000 ) { continue; }
    $tags[ $tag['id'] ] = array( 'id' => $tag['id'], 'value' => (float) $tag['value'] );
   }
   $native_meta['nativeTags'] = array_values( $tags );
  }
  if ( isset( $card['mechanics'] ) && is_array( $card['mechanics'] ) && count( $card['mechanics'] ) <= 128 ) {
   $native_meta['mechanics'] = array_values( array_filter( $card['mechanics'], static function ( $name ) {
    return is_string( $name ) && preg_match( '/\A[A-Z0-9_]{1,96}\z/D', $name );
   } ) );
  }
  // The browser can skip an API lookup only when every native frame field
  // required by the renderer was captured by the import.
  $native_meta['ready'] = isset( $native_meta['nativeTags'] ) && ! empty( $native_meta['set'] ) && array_key_exists( 'watermark', $native_meta );
  return array(
   'id' => $card['dbfId'], 'card_code' => $card['id'], 'card_class' => $class,
   'name' => $card['name'], 'mana' => $card['cost'], 'rarity_id' => $rarities[ $rarity ],
   'collectible' => ! isset( $card['collectible'] ) || $card['collectible'] ? 1 : 0,
   'image' => '', 'crop_image' => $art, 'art' => $art, 'card_type' => $card['type'],
   'card_text' => isset( $card['text'] ) ? $card['text'] : '',
   'attack' => isset( $card['attack'] ) ? $card['attack'] : 0,
   'health' => isset( $card['health'] ) ? $card['health'] : 0,
   'durability' => isset( $card['durability'] ) ? $card['durability'] : 0,
   'armor' => isset( $card['armor'] ) ? $card['armor'] : 0,
   'tribe' => isset( $card['race'] ) ? $card['race'] : '', 'spell_school' => isset( $card['spellSchool'] ) ? $card['spellSchool'] : '',
   'native_meta' => wp_json_encode( $native_meta, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES ),
  );
 }
}
