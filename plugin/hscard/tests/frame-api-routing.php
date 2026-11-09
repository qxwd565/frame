<?php
define('ABSPATH', __DIR__);
define('HSCARD_PATH', dirname(__DIR__) . '/');
function get_option($key, $default = '') { return $GLOBALS['test_base'] ?? $default; }
function is_ssl() { return true; }
function wp_parse_url($url) { return parse_url($url); }
function esc_url_raw($url) { return $url; }
function trailingslashit($value) { return rtrim($value, '/') . '/'; }
require HSCARD_PATH . 'includes/class-native-cards.php';
$index = json_decode(file_get_contents(HSCARD_PATH . 'assets/unity/frame-api-index.json'), true);
$cases = 0;
foreach ($index['files'] as $name => $row) {
    $expected = $index['repositories'][$row['repository']]['base'] . implode('/', array_map('rawurlencode', explode('/', $name)));
    if (\HScard\Native_Cards::resource_url($name) !== $expected) { throw new RuntimeException('Wrong API: ' . $name); }
    $cases++;
}
foreach (array('../secret', '/secret', '%2e%2e/secret', "x\\y", 'x?y', 'x#y') as $name) {
    if ('' !== \HScard\Native_Cards::resource_url($name)) { throw new RuntimeException('Unsafe path'); }
}
$GLOBALS['test_base'] = 'https://hsdeck-frame-webgpu.pages.dev/v7.14.4-webgpu-20261109/assets/unity/';
if (\HScard\Native_Cards::resource_base() !== \HScard\Native_Cards::WEBGPU_RESOURCE_BASE) { throw new RuntimeException('Old default not migrated'); }
$GLOBALS['test_base'] = 'https://example.test/my-mirror/';
if (\HScard\Native_Cards::resource_url('frames-constructed.json.gz') !== 'https://example.test/my-mirror/frames-constructed.json.gz') { throw new RuntimeException('Custom mirror changed'); }
echo json_encode(array('ok' => true, 'cases' => $cases, 'customMirrorPreserved' => true)) . PHP_EOL;
