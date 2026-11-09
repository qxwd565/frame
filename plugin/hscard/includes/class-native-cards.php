<?php
/** Reusable desktop card frames. @package HScard */
namespace HScard;
if ( ! defined( 'ABSPATH' ) ) { exit; }

final class Native_Cards {
 const WEBGPU_RESOURCE_BASE = 'https://hsdeck-frame-webgpu.pages.dev/v7.14.4-webgpu-20261109/assets/unity/';
 /** Asset URL ends with /assets/unity/. WordPress code and preview index stay local. */
 public static function resource_base() {
  $url = defined( 'HSCARD_RESOURCE_BASE_URL' ) ? (string) HSCARD_RESOURCE_BASE_URL : (string) get_option( 'hscard_resource_base_url', '' );
  $url = trim( $url );
  // Known previous releases cannot supply WGSL. Preserve custom endpoints and
  // explicit wp-config overrides; migrate only the official old defaults.
  if ( ! defined( 'HSCARD_RESOURCE_BASE_URL' ) && in_array( rtrim( $url, '/' ), array( '', 'https://hsdeck-frame.pages.dev/v7.12.14/assets/unity', 'https://hsdeck-3d-assets.pages.dev/v7.12.14/assets/unity' ), true ) ) {
   $url = self::WEBGPU_RESOURCE_BASE;
  }
  if ( '' === $url ) { return ''; }
  if ( ! filter_var( $url, FILTER_VALIDATE_URL ) ) { return ''; }
  $parts = wp_parse_url( $url );
  if ( ! is_array( $parts ) || empty( $parts['host'] ) || ! in_array( $parts['scheme'] ?? '', array( 'http', 'https' ), true ) || isset( $parts['user'] ) || isset( $parts['pass'] ) || isset( $parts['query'] ) || isset( $parts['fragment'] ) ) { return ''; }
  if ( is_ssl() && ( $parts['scheme'] ?? '' ) !== 'https' ) { return ''; }
  return trailingslashit( esc_url_raw( $url ) );
 }
 public static function enqueue() {
  // A same-version ZIP replacement must invalidate the site's long-lived JS
  // cache too. The entry file contains the generated dependency-graph revision.
  static $revision = null;
  if ( null === $revision ) {
   $entry = HSCARD_PATH . 'assets/unity/deck-cards.js';
   $hash = is_readable( $entry ) ? hash_file( 'sha256', $entry ) : false;
   $revision = HSCARD_VERSION . ( $hash ? '-' . substr( $hash, 0, 16 ) : '' );
  }
  wp_enqueue_script_module( 'hscard-native-cards', plugins_url( 'assets/unity/deck-cards.js', HSCARD_PATH . 'hscard.php' ), array(), $revision );
  wp_enqueue_style( 'hscard-native-cards', plugins_url( 'assets/unity/deck-cards.css', HSCARD_PATH . 'hscard.php' ), array(), $revision );
 }
 /** Begin the engine's critical fetches in the document head. The exact
  * same URLs are used by deck-cards.js, so the browser reuses the responses. */
 public static function preload() {
  $origin = self::resource_base();
  if ( '' === $origin ) { return; }
  printf( '<meta name="hscard-resource-base" content="%s">' . "\n", esc_attr( $origin ) );
  $host = wp_parse_url( $origin );
  if ( is_array( $host ) && ! empty( $host['host'] ) && ! empty( $host['scheme'] ) ) {
   $site = $host['scheme'] . '://' . $host['host'] . ( isset( $host['port'] ) ? ':' . absint( $host['port'] ) : '' );
   printf( '<link rel="preconnect" href="%s" crossorigin>' . "\n", esc_url( $site ) );
  }
  foreach ( array( 'frames-constructed.json.gz' => '7.12.07', 'freetype-bridge.wasm' => '', 'original-fonts.json.gz' => '', 'webgpu/program-index.json.gz' => '' ) as $file => $rev ) {
   $url = $origin . $file;
   if ( '' !== $rev ) { $url = add_query_arg( 'rev', $rev, $url ); }
   printf( '<link rel="preload" href="%s" as="fetch" crossorigin="anonymous">' . "\n", esc_url( $url ) );
  }
 }
 public static function surface( array $card, $frame_profile = 'current', $eager = false ) {
  // Only this resolved specification describes what the reader should see.
  // The browser may load remote native geometry metadata, never recalculate
  // historical values from a second card API copy.
  $details = Render_Spec::payload( $card, $frame_profile );
  $card_data = wp_json_encode( $details, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES );
  $kind = strtoupper( isset( $card['card_type'] ) ? (string) $card['card_type'] : '' );
  $heights = array( 'MINION' => 560, 'SPELL' => 549, 'WEAPON' => 551, 'LOCATION' => 610, 'HERO' => 560 );
  if ( ! isset( $heights[ $kind ] ) ) {
   $label = sprintf( __( '%1$s, 마나 %2$d, %3$d장', 'hscard' ), $card['display_name'], $card['mana'], $card['count'] );
   ob_start(); ?>
   <figure data-hscard-card="<?php echo esc_attr( $card_data ); ?>" class="hscard-card-surface is-frame-unavailable<?php echo ! empty( $card['is_sideboard'] ) ? ' is-sideboard' : ''; ?>">
   <div class="hscard-card-placeholder" style="aspect-ratio:436/682" role="img" aria-label="<?php echo esc_attr( $label ); ?>"></div>
   </figure>
   <?php return (string) ob_get_clean();
  }
  $rarities = array( 1 => 'FREE', 2 => 'COMMON', 3 => 'RARE', 4 => 'EPIC', 5 => 'LEGENDARY' );
  $rarity_id = isset( $card['rarity_id'] ) ? absint( $card['rarity_id'] ) : 0;
  $rarity = isset( $rarities[ $rarity_id ] ) ? $rarities[ $rarity_id ] : 'FREE';
  // Maximum native card fit (610) plus the shared transparent ribbon area
  // (72), including one-copy cards. The WebGPU scene uses the same extent.
  $height = 682;
  $class = isset( $card['card_class'] ) ? strtoupper( preg_replace( '/[^A-Za-z]/', '', (string) $card['card_class'] ) ) : 'NEUTRAL';
  $classes = array( 'NEUTRAL', 'DEATHKNIGHT', 'DEMONHUNTER', 'DRUID', 'HUNTER', 'MAGE', 'PALADIN', 'PRIEST', 'ROGUE', 'SHAMAN', 'WARLOCK', 'WARRIOR' );
  if ( ! in_array( $class, $classes, true ) ) { $class = 'NEUTRAL'; }
  $race = empty( $card['tribe'] ) ? '0' : ( false !== strpos( (string) $card['tribe'], ',' ) ? '2' : '1' );
  $label = sprintf( __( '%1$s, 마나 %2$d, %3$d장', 'hscard' ), $card['display_name'], $card['mana'], $card['count'] );
  // The static preview is intentionally independent of JS, WebGPU and card APIs.
  // Browser paints it as soon as the server sends HTML. Full native geometry
  // takes over after its first successful GPU present.
  $variant = 'MINION' === $kind ? (int) $race : ( 'SPELL' === $kind ? (int) ! empty( $card['spell_school'] ) : ( 'HERO' === $kind ? (int) ! empty( $card['armor'] ) : 0 ) );
  $preview_url = self::preview_url( $kind, $class, $rarity, $variant, $frame_profile, $details['date'] );
  ob_start(); ?>
  <figure data-hscard-card="<?php echo esc_attr( $card_data ); ?>" class="hscard-card-surface<?php echo ! empty( $card['is_sideboard'] ) ? ' is-sideboard' : ''; ?>" data-hscard-frame-kind="<?php echo esc_attr( $kind ); ?>" data-hscard-frame-rarity="<?php echo esc_attr( $rarity ); ?>" data-hscard-frame-class="<?php echo esc_attr( $class ); ?>" data-hscard-frame-race="<?php echo esc_attr( $race ); ?>" data-hscard-frame-school="<?php echo empty( $card['spell_school'] ) ? '0' : '1'; ?>" data-hscard-frame-attack="<?php echo empty( $card['attack'] ) ? '0' : '1'; ?>" data-hscard-frame-armor="<?php echo empty( $card['armor'] ) ? '0' : '1'; ?>" data-hscard-golden-scene="1">
   <div class="hscard-card-placeholder" style="aspect-ratio:436/<?php echo absint( $height ); ?>" role="img" aria-label="<?php echo esc_attr( $label ); ?>" aria-busy="true">
     <?php if ( '' !== $preview_url ) : ?>
     <img class="hscard-frame-preview" src="<?php echo esc_url( $preview_url ); ?>" width="256" height="400" alt="" loading="<?php echo $eager ? 'eager' : 'lazy'; ?>" <?php if ( $eager ) : ?>fetchpriority="high"<?php endif; ?> decoding="async" draggable="false">
     <?php endif; ?>
   </div>
  </figure>
  <?php return (string) ob_get_clean();
 }
 /** Build-generated native loading scenes. Content-addressed filenames avoid
  * stale CDN atlas previews after a same-version ZIP replacement. */
 private static function preview_url( $kind, $class, $rarity, $variant, $profile, $date ) {
  static $manifest = null;
  if ( null === $manifest ) {
   $path = HSCARD_PATH . 'assets/unity/frame-previews/index.json';
   $manifest = is_readable( $path ) ? json_decode( file_get_contents( $path ), true ) : array();
  }
  $key = implode( ':', array( $kind, $class, $rarity, $variant ) );
  $row = $manifest['entries'][ $key ] ?? null;
  if ( ! is_array( $row ) ) { return ''; }
  $file = $row['current'];
  if ( 'historical' === $profile && preg_match( '/^\d{4}-\d{2}-\d{2}$/', $date ) ) {
   foreach ( $row['history'] as $period ) {
    if ( $period['from'] > $date ) { break; }
    $file = $period['file'];
   }
  }
  $base = self::resource_base();
  return '' !== $base && preg_match( '/^[a-f0-9]{24}\.webp$/', $file ) ? $base . 'frame-previews/' . $file : '';
 }
}
