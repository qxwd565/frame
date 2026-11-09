<?php
// Server-side markup and generated-preview integrity, without a WordPress DB.
define('ABSPATH', __DIR__);
define('HSCARD_PATH', dirname(__DIR__) . '/');
function absint($x) { return abs((int) $x); }
function esc_attr($x) { return htmlspecialchars((string) $x, ENT_QUOTES); }
function esc_url($x) { return esc_attr($x); }
function esc_url_raw($x) { return $x; }
function __($x, $domain = '') { return $x; }
function wp_json_encode($x, $flags = 0) { return json_encode($x, $flags); }
function plugins_url($file, $plugin) { return '/plugin/' . $file; }
function get_option($name, $fallback = '') { return $fallback; }
function wp_parse_url($url) { return parse_url($url); }
function is_ssl() { return false; }
function trailingslashit($url) { return rtrim($url, '/') . '/'; }
require HSCARD_PATH . 'includes/class-render-spec.php';
require HSCARD_PATH . 'includes/class-native-cards.php';
$root = HSCARD_PATH . '../../v7.14.4-webgpu-20261109/assets/unity/frame-previews/';
$manifest = json_decode(file_get_contents(HSCARD_PATH . 'assets/unity/frame-previews/index.json'), true);
$files = array(); $cases = 0;
foreach ($manifest['entries'] as $key => $entry) {
    list($kind, $class, $rarity, $variant) = explode(':', $key);
    $rarities = array('FREE' => 1, 'COMMON' => 2, 'RARE' => 3, 'EPIC' => 4, 'LEGENDARY' => 5);
    $card = array('id' => 1, 'card_code' => 'TEST', 'display_name' => '검사', 'mana' => 0, 'count' => 1,
        'card_type' => $kind, 'card_class' => $class, 'rarity_id' => $rarities[$rarity],
        'tribe' => 'MINION' === $kind ? array('', '야수', '야수,악마')[(int)$variant] : '',
        'spell_school' => 'SPELL' === $kind && $variant ? '비전' : '',
        'armor' => 'HERO' === $kind ? (int)$variant : 0);
    foreach (array_merge(array(array('from' => '', 'file' => $entry['current'])), $entry['history']) as $period) {
        $card['render_date'] = $period['from'];
        $html = \HScard\Native_Cards::surface($card, $period['from'] ? 'historical' : 'current', true);
        if (false === strpos($html, '/' . $period['file'] . '"')) { throw new RuntimeException('Wrong frame: ' . $key . ' ' . $period['from']); }
        if (false === strpos($html, 'aspect-ratio:436/682')) { throw new RuntimeException('Wrong projection'); }
        $files[$period['file']] = true; $cases++;
    }
}
foreach (array_keys($files) as $file) {
    if (substr(hash_file('sha256', $root . $file), 0, 24) . '.webp' !== $file) { throw new RuntimeException('Wrong preview content: ' . $file); }
    $size = getimagesize($root . $file);
    if ($size[0] !== 256 || $size[1] !== 400 || $size['mime'] !== 'image/webp') { throw new RuntimeException('Wrong preview size'); }
}
echo json_encode(array('ok' => true, 'markupCases' => $cases, 'images' => count($files))) . PHP_EOL;
