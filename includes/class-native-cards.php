<?php
/** Reusable desktop card frames. @package HScard */
namespace HScard;
if ( ! defined( 'ABSPATH' ) ) { exit; }

final class Native_Cards {
 public static function enqueue() {
  $revision = 'hsplus-cards-31';
  wp_enqueue_script_module( 'hscard-native-cards', plugins_url( 'assets/unity/deck-cards.js', HSCARD_PATH . 'hscard.php' ), array(), $revision );
  wp_enqueue_style( 'hscard-native-cards', plugins_url( 'assets/unity/deck-cards.css', HSCARD_PATH . 'hscard.php' ), array(), $revision );
 }
 public static function surface( array $card, $frame_profile = 'current' ) {
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
  // (72), including one-copy cards. The WebGL scene uses the same extent.
  $height = 682;
  $class = isset( $card['card_class'] ) ? strtoupper( preg_replace( '/[^A-Za-z]/', '', (string) $card['card_class'] ) ) : 'NEUTRAL';
  $classes = array( 'NEUTRAL', 'DEATHKNIGHT', 'DEMONHUNTER', 'DRUID', 'HUNTER', 'MAGE', 'PALADIN', 'PRIEST', 'ROGUE', 'SHAMAN', 'WARLOCK', 'WARRIOR' );
  if ( ! in_array( $class, $classes, true ) ) { $class = 'NEUTRAL'; }
  $race = empty( $card['tribe'] ) ? '0' : ( false !== strpos( (string) $card['tribe'], ',' ) ? '2' : '1' );
  $label = sprintf( __( '%1$s, 마나 %2$d, %3$d장', 'hscard' ), $card['display_name'], $card['mana'], $card['count'] );
  ob_start(); ?>
  <figure data-hscard-card="<?php echo esc_attr( $card_data ); ?>" class="hscard-card-surface<?php echo ! empty( $card['is_sideboard'] ) ? ' is-sideboard' : ''; ?>" data-hscard-frame-kind="<?php echo esc_attr( $kind ); ?>" data-hscard-frame-rarity="<?php echo esc_attr( $rarity ); ?>" data-hscard-frame-class="<?php echo esc_attr( $class ); ?>" data-hscard-frame-race="<?php echo esc_attr( $race ); ?>" data-hscard-frame-school="<?php echo empty( $card['spell_school'] ) ? '0' : '1'; ?>" data-hscard-frame-attack="<?php echo empty( $card['attack'] ) ? '0' : '1'; ?>" data-hscard-frame-armor="<?php echo empty( $card['armor'] ) ? '0' : '1'; ?>" data-hscard-golden-scene="1">
   <div class="hscard-card-placeholder" style="aspect-ratio:436/<?php echo absint( $height ); ?>" role="img" aria-label="<?php echo esc_attr( $label ); ?>" aria-busy="true">
   </div>
  </figure>
  <?php return (string) ob_get_clean();
 }
}
