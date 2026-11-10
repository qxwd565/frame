<?php
// No preview image request, regardless of type, date, class or rarity.
define('ABSPATH', __DIR__);
define('HSCARD_PATH', dirname(__DIR__) . '/');
function absint($x) { return abs((int) $x); }
function esc_attr($x) { return htmlspecialchars((string) $x, ENT_QUOTES); }
function __($x, $domain = '') { return $x; }
function wp_json_encode($x, $flags = 0) { return json_encode($x, $flags); }
require HSCARD_PATH . 'includes/class-render-spec.php';
require HSCARD_PATH . 'includes/class-native-cards.php';
$cases = 0;
foreach (array('MINION','SPELL','WEAPON','HERO','LOCATION') as $kind) {
 foreach (array('NEUTRAL','DRUID','HUNTER','MAGE','PALADIN','PRIEST','ROGUE','SHAMAN','WARLOCK','WARRIOR','DEATHKNIGHT','DEMONHUNTER') as $class) {
  foreach (array(1,2,3,4,5) as $rarity) {
   foreach (array('2013-08-17','2013-10-03','2026-11-09') as $date) {
    $card = array('id'=>1,'card_code'=>'TEST','display_name'=>'검사','mana'=>0,'count'=>2,
      'card_type'=>$kind,'card_class'=>$class,'rarity_id'=>$rarity,'render_date'=>$date);
    $html = \HScard\Native_Cards::surface($card, '2026-11-09' === $date ? 'current' : 'historical', true);
    if (preg_match('/<img|frame-previews|\bsrc=/i', $html)) { throw new RuntimeException('Obsolete image request'); }
    if (false === strpos($html,'aspect-ratio:436/682') || false === strpos($html,'aria-busy="true"')) { throw new RuntimeException('Missing fixed scene anchor'); }
    if (false === strpos($html,'data-hscard-frame-class="'.$class.'"')) { throw new RuntimeException('Class metadata lost'); }
    $cases++;
   }
  }
 }
}
echo json_encode(array('ok'=>true,'cases'=>$cases,'previewImages'=>0)) . PHP_EOL;
