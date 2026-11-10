<?php
/** Reusable desktop card frames. @package HScard */
namespace HScard;
if ( ! defined( 'ABSPATH' ) ) { exit; }

final class Native_Cards {
 const WEBGPU_RESOURCE_BASE = 'https://raw.githubusercontent.com/qxwd565/legacy/main/frame/';
 /** Logical root; resource_url resolves files to pinned expansion API commits. */
 public static function resource_base() {
  $url = defined( 'HSCARD_RESOURCE_BASE_URL' ) ? (string) HSCARD_RESOURCE_BASE_URL : (string) get_option( 'hscard_resource_base_url', '' );
  $url = trim( $url );
  // Known previous releases cannot supply WGSL. Preserve custom endpoints and
  // explicit wp-config overrides; migrate only the official old defaults.
  if ( ! defined( 'HSCARD_RESOURCE_BASE_URL' ) && in_array( rtrim( $url, '/' ), array( '', 'https://hsdeck-frame.pages.dev/v7.12.14/assets/unity', 'https://hsdeck-3d-assets.pages.dev/v7.12.14/assets/unity', 'https://hsdeck-frame-webgpu.pages.dev/v7.14.4-webgpu-20261109/assets/unity' ), true ) ) {
   $url = self::WEBGPU_RESOURCE_BASE;
  }
  if ( '' === $url ) { return ''; }
  if ( ! filter_var( $url, FILTER_VALIDATE_URL ) ) { return ''; }
  $parts = wp_parse_url( $url );
  if ( ! is_array( $parts ) || empty( $parts['host'] ) || ! in_array( $parts['scheme'] ?? '', array( 'http', 'https' ), true ) || isset( $parts['user'] ) || isset( $parts['pass'] ) || isset( $parts['query'] ) || isset( $parts['fragment'] ) ) { return ''; }
  if ( is_ssl() && ( $parts['scheme'] ?? '' ) !== 'https' ) { return ''; }
  return trailingslashit( esc_url_raw( $url ) );
 }
 public static function resource_url( $path ) {
  if ( ! is_string( $path ) || '' === $path || preg_match( '~(^/|\\\\|\.\.|[?#%\x00-\x1f])~', $path ) ) { return ''; }
  $base = self::resource_base();
  if ( '' === $base ) { return ''; }
  if ( self::WEBGPU_RESOURCE_BASE !== $base ) { return $base . $path; }
  static $index = null;
  if ( null === $index ) {
   $file = HSCARD_PATH . 'assets/unity/frame-api-index.json';
   $index = is_readable( $file ) ? json_decode( file_get_contents( $file ), true ) : array();
  }
  $row = $index['files'][ $path ] ?? null;
  $repo = is_array( $row ) ? ( $index['repositories'][ $row['repository'] ] ?? null ) : null;
  if ( ! is_array( $repo ) || ! preg_match( '/^[a-f0-9]{40}$/', $repo['commit'] ?? '' ) ) { return ''; }
  $expected = 'https://raw.githubusercontent.com/' . $index['owner'] . '/' . $row['repository'] . '/' . $repo['commit'] . '/frame/';
  if ( ( $repo['base'] ?? '' ) !== $expected ) { return ''; }
  return $expected . implode( '/', array_map( 'rawurlencode', explode( '/', $path ) ) );
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
  // Only frame-critical files compete at navigation time. Fonts/name meshes
  // are requested by the renderer after it has published a native frame.
  foreach ( array( 'frames-constructed.json.gz' => '7.12.07', 'text-settings.json.gz' => '', 'portrait-meshes.json.gz' => '', 'frame-fits.json.gz' => '', 'watermarks.json.gz' => '', 'shader-library.json.gz' => '', 'webgpu/program-index.json.gz' => '' ) as $file => $rev ) {
   $url = self::resource_url( $file );
   if ( '' === $url ) { continue; }
   if ( '' !== $rev && self::WEBGPU_RESOURCE_BASE !== $origin ) { $url = add_query_arg( 'rev', $rev, $url ); }
   printf( '<link rel="preload" href="%s" as="fetch" crossorigin="anonymous" media="(min-width:821px)" fetchpriority="high">' . "\n", esc_url( $url ) );
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
  // One empty DOM anchor for the persistent native scene. Never emit a separate
  // preview image: the renderer fills this frame's portrait/text in place.
  ob_start(); ?>
  <figure data-hscard-card="<?php echo esc_attr( $card_data ); ?>" class="hscard-card-surface<?php echo ! empty( $card['is_sideboard'] ) ? ' is-sideboard' : ''; ?>" data-hscard-frame-kind="<?php echo esc_attr( $kind ); ?>" data-hscard-frame-rarity="<?php echo esc_attr( $rarity ); ?>" data-hscard-frame-class="<?php echo esc_attr( $class ); ?>" data-hscard-frame-race="<?php echo esc_attr( $race ); ?>" data-hscard-frame-school="<?php echo empty( $card['spell_school'] ) ? '0' : '1'; ?>" data-hscard-frame-attack="<?php echo empty( $card['attack'] ) ? '0' : '1'; ?>" data-hscard-frame-armor="<?php echo empty( $card['armor'] ) ? '0' : '1'; ?>" data-hscard-golden-scene="1">
   <div class="hscard-card-placeholder" style="aspect-ratio:436/<?php echo absint( $height ); ?>" role="img" aria-label="<?php echo esc_attr( $label ); ?>" aria-busy="true">
   </div>
  </figure>
  <?php return (string) ob_get_clean();
 }
}
