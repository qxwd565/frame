<?php
/** Manage the public WebGPU texture/mesh/shader CDN location. @package HScard */
namespace HScard;
if ( ! defined( 'ABSPATH' ) ) { exit; }
final class Resource_Settings {
 public function register_hooks() {
  add_action( 'admin_init', array( $this, 'register' ) );
  add_action( 'admin_menu', array( $this, 'menu' ) );
 }
 public function register() {
  register_setting( 'hscard_assets', 'hscard_resource_base_url', array(
    'type' => 'string', 'sanitize_callback' => array( $this, 'sanitize' ), 'default' => '' ) );
 }
 public function sanitize( $value ) {
  $url = trim( is_string( $value ) ? $value : '' );
  if ( '' === $url ) { return ''; }
  $parts = wp_parse_url( $url );
  if ( ! is_array( $parts ) || ( $parts['scheme'] ?? '' ) !== 'https' || empty( $parts['host'] ) || isset( $parts['user'] ) || isset( $parts['pass'] ) || isset( $parts['query'] ) || isset( $parts['fragment'] ) ) {
   add_settings_error( 'hscard_assets', 'hscard_assets_invalid', 'HTTPS 정적 리소스 폴더 주소를 입력하세요.' );
   return (string) get_option( 'hscard_resource_base_url', '' );
  }
  return trailingslashit( esc_url_raw( $url ) );
 }
 public function menu() {
  add_options_page( 'HScard 3D 리소스', 'HScard 3D 리소스', 'manage_options', 'hscard-3d-assets', array( $this, 'page' ) );
 }
 public function page() {
  if ( ! current_user_can( 'manage_options' ) ) { return; }
  if ( ! class_exists( 'HScard\Native_Cards' ) ) { require_once HSCARD_PATH . 'includes/class-native-cards.php'; }
  $current = Native_Cards::resource_base();
  echo '<div class="wrap"><h1>HScard 3D 리소스 주소</h1>';
  settings_errors( 'hscard_assets' );
  echo '<p>기본값은 확장팩 API의 frame/ 폴더입니다. 플러그인에 포함된 목록으로 시기별 원본과 연결 파일을 읽습니다. 별도 통합 미러를 운영할 때만 주소를 입력하세요.</p>';
  if ( defined( 'HSCARD_RESOURCE_BASE_URL' ) ) {
   echo '<p><strong>wp-config.php의 HSCARD_RESOURCE_BASE_URL 상수가 우선 적용됩니다.</strong></p>';
  }
  echo '<form action="options.php" method="post">';settings_fields( 'hscard_assets' );
  echo '<p><label for="hscard-resource-base">공개 리소스 기본 URL</label></p>';
  printf( '<input id="hscard-resource-base" class="large-text code" name="hscard_resource_base_url" type="url" placeholder="https://example.com/frame/" value="%s" spellcheck="false">', esc_attr( (string) get_option( 'hscard_resource_base_url', '' ) ) );
  echo '<p>현재 적용 주소: <code>' . esc_html( $current ?: '미설정 — WebGPU 3D 리소스를 불러올 수 없습니다' ) . '</code></p>';
  submit_button( '설정 저장' );echo '</form></div>';
 }
}
