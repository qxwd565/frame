<?php
// WordPress enqueue contract; no database or server installation required.
define('ABSPATH', __DIR__);
define('HSCARD_PATH', dirname(__DIR__) . '/');
define('HSCARD_VERSION', '7.14.6-webgpu-beta3664-art-preview');
$calls = array();
function plugins_url($file, $plugin) { return 'https://example.test/hscard/' . $file; }
function wp_enqueue_script_module($id, $url, $deps, $version) {
    $GLOBALS['calls'][] = array('script', $version);
}
function wp_enqueue_style($id, $url, $deps, $version) {
    $GLOBALS['calls'][] = array('style', $version);
}
require HSCARD_PATH . 'includes/class-native-cards.php';
\HScard\Native_Cards::enqueue();
\HScard\Native_Cards::enqueue();
$expected = HSCARD_VERSION . '-' . substr(hash_file('sha256', HSCARD_PATH . 'assets/unity/deck-cards.js'), 0, 16);
if (count($calls) !== 4) { throw new RuntimeException('Missing enqueue calls'); }
foreach ($calls as $call) {
    if ($call[1] !== $expected) { throw new RuntimeException('Missing content revision: ' . $call[0]); }
}
echo json_encode(array('ok' => true, 'revision' => $expected, 'calls' => count($calls))) . PHP_EOL;
