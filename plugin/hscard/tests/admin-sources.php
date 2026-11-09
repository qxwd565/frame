<?php
// Exercise production handlers/markup with in-memory WordPress option/HTTP seams.
define('ABSPATH', __DIR__);
define('HSCARD_PATH', dirname(__DIR__) . '/');
define('HSCARD_VERSION', '7.14.4-webgpu-dates-v1-preview');
define('MINUTE_IN_SECONDS', 60);
class WP_Error { private $message; public function __construct($code,$message){$this->message=$message;} public function get_error_message(){return $this->message;} }
class Test_Response extends Exception { public $payload; public $status; public function __construct($payload,$status=200){$this->payload=$payload;$this->status=$status;} }
class Test_Redirect extends Exception {}
function is_wp_error($x){return $x instanceof WP_Error;}
function get_option($key,$default=false){return $GLOBALS['options'][$key]??$default;}
function update_option($key,$value,$autoload=null){if(($GLOBALS['failed_write']??'')===$key)return false;$GLOBALS['options'][$key]=$value;return true;}
function current_user_can($cap){return $GLOBALS['allowed']??true;}
function wp_unslash($x){return $x;}
function wp_create_nonce($action){return 'test-nonce';}
function check_ajax_referer($action,$key){if(($_POST[$key]??'')!=='test-nonce')wp_send_json_error(array('message'=>'nonce'),403);}
function check_admin_referer($action){check_ajax_referer($action,'_wpnonce');}
function wp_send_json_error($data,$status=400){throw new Test_Response(array('success'=>false,'data'=>$data),$status);}
function wp_send_json_success($data){throw new Test_Response(array('success'=>true,'data'=>$data));}
function wp_die($message){throw new Test_Response(array('message'=>$message),403);}
function __( $s,$domain='' ){return $s;}
function esc_attr($s){return htmlspecialchars((string)$s,ENT_QUOTES);}
function esc_html($s){return esc_attr($s);}
function esc_html__($s,$domain=''){return esc_html($s);}
function esc_url($s){return esc_attr($s);}
function esc_url_raw($s){return $s;}
function sanitize_text_field($s){return strip_tags($s);}
function sanitize_key($s){return preg_replace('/[^a-z0-9_-]/','',strtolower($s));}
function wp_parse_url($s,$part=-1){return parse_url($s,$part);}
function absint($n){return abs((int)$n);}
function get_current_user_id(){return 1;}
function do_action(...$args){}
function set_transient($k,$v,$ttl){$GLOBALS['notice']=$v;}
function wp_safe_redirect($url){throw new Test_Redirect($url);}
function wp_generate_password($length,$special=false,$extra=false){return substr(bin2hex(random_bytes(20)),0,$length);}
function admin_url($s){return '/wp-admin/'.$s;}
function rest_url($s){return '/wp-json/'.$s;}
function add_query_arg($a,$url){return $url.'?'.http_build_query($a);}
function wp_nonce_url($url,$action){return $url;}
function wp_nonce_field($action){echo '<input type="hidden" name="_wpnonce" value="test-nonce">';}
function number_format_i18n($x){return (string)$x;}
function checked($x,$y=true){if($x==$y)echo 'checked';}
function selected($x,$y){if($x==$y)echo 'selected';}
function submit_button($text,$type='primary',$name='submit',$wrap=true){echo '<button class="button" name="'.$name.'" type="submit">'.esc_html($text).'</button>';}
function plugins_url($s,$file){return '/plugin/'.$s;}
function wp_enqueue_script(...$args){$GLOBALS['script']=$args;}
function wp_enqueue_style(...$args){$GLOBALS['style']=$args;}
require HSCARD_PATH.'includes/class-json-sources.php';
require HSCARD_PATH.'admin/class-admin-page.php';
use HScard\Json_Sources;
use HScard\Admin_Page;
function verify($ok,$message){if(!$ok)throw new RuntimeException($message);}
$original=array();
foreach(array('legacy'=>'고전','naxx'=>'낙스라마스의 저주','gvg'=>'고블린 대 노움','brm'=>'검은바위 산') as $id=>$name){$original[$id]=array('label'=>$name,'url'=>Json_Sources::repository_url($id),'mode'=>'remote','enabled'=>1,'count'=>35,'set'=>$id,'art_base'=>'');}
$GLOBALS['options']=array(Json_Sources::OPTION=>$original);
verify(array_keys(Json_Sources::ordered())===array_keys($original),'Initial order changed');
verify(Json_Sources::reorder(array('brm','gvg','naxx','legacy'))===array('brm','gvg','naxx','legacy'),'Full reorder');
verify(Json_Sources::reorder(array('legacy','gvg'))===array('brm','legacy','naxx','gvg'),'Filtered slots changed');
verify(get_option(Json_Sources::OPTION)===$original,'Reorder overwrote source content');
$before=get_option(Json_Sources::ORDER_OPTION);
foreach(array(array(),array('missing'),array('gvg','gvg'),array(array('gvg')),array('../gvg')) as $ids){verify(is_wp_error(Json_Sources::reorder($ids)),'Invalid order accepted');verify(get_option(Json_Sources::ORDER_OPTION)===$before,'Partial write on error');}
$changed=$original;unset($changed['naxx']);$changed['new']=$original['gvg'];$changed['gvg']['count']=99;Json_Sources::save($changed);
verify(array_keys(Json_Sources::ordered())===array('brm','legacy','gvg','new'),'Deleted/new sources handled incorrectly');
verify(Json_Sources::ordered()['gvg']['count']===99,'Updated source lost');
$GLOBALS['failed_write']=Json_Sources::ORDER_OPTION;verify(is_wp_error(Json_Sources::reorder(array('new','brm'))),'Storage error reported success');unset($GLOBALS['failed_write']);
foreach(array('legacy','Curse-of-Naxxramas',' A.B_1-2 ','.github') as $repo){verify(Json_Sources::repository_url($repo)===Json_Sources::REPOSITORY_PREFIX.trim($repo).Json_Sources::REPOSITORY_SUFFIX,'Wrong URL');}
foreach(array('', '.', '..','../legacy','owner/repo','https://example.test/cards.json','abc?x=1','한글',str_repeat('a',101),array('x')) as $repo){verify(is_wp_error(Json_Sources::repository_url($repo)),'Unsafe repository accepted');}
$admin=new Admin_Page();
$_SERVER['REQUEST_METHOD']='POST';$_POST=array('nonce'=>'test-nonce','order'=>array('new','gvg','legacy','brm'));
try{$admin->reorder_sources();}catch(Test_Response $r){verify($r->status===200&&$r->payload['success'],'AJAX save failed');}
verify(array_keys(Json_Sources::ordered())===array('new','gvg','legacy','brm'),'AJAX order not persisted');
foreach(array('permission','method','nonce','invalid') as $case){
 $GLOBALS['allowed']=$case!=='permission';$_SERVER['REQUEST_METHOD']=$case==='method'?'GET':'POST';$_POST=array('nonce'=>$case==='nonce'?'bad':'test-nonce','order'=>$case==='invalid'?'legacy':array('legacy'));
 try{$admin->reorder_sources();throw new RuntimeException('Unauthorized write');}catch(Test_Response $r){verify(!$r->payload['success']&&$r->status>=400,'Bad rejection');}
}
$GLOBALS['allowed']=true;$_SERVER['REQUEST_METHOD']='POST';
$_POST=array('_wpnonce'=>'test-nonce','source_label'=>'검사','source_repository'=>'Curse-of-Naxxramas','hscard_add_method'=>'url','source_enabled'=>'1');
try{$admin->save_source();}catch(Test_Redirect $r){verify(!$GLOBALS['notice']['error'],'Repository save failed');}
$saved=Json_Sources::all();$newId=array_key_last($saved);verify($saved[$newId]['url']===Json_Sources::repository_url('Curse-of-Naxxramas'),'Server did not construct URL');
verify($saved[$newId]['set']==='Curse-of-Naxxramas'&&Json_Sources::repository_set_id($saved[$newId])==='Curse-of-Naxxramas','Repository set ID not assigned at creation');
try{$admin->save_source();}catch(Test_Redirect $r){verify($GLOBALS['notice']['error'],'Duplicate source accepted');}
verify(Json_Sources::all()===$saved,'Duplicate changed source data');
$_POST=array('_wpnonce'=>'test-nonce','source_id'=>$newId,'source_label'=>'기존 연결','source_url'=>'https://example.test/custom/cards.json','source_enabled'=>'1');
try{$admin->save_source();}catch(Test_Redirect $r){verify(!$GLOBALS['notice']['error'],'Existing URL edit failed');}
verify(Json_Sources::all()[$newId]['url']==='https://example.test/custom/cards.json','Existing custom URL changed');
verify(Json_Sources::all()[$newId]['set']==='Curse-of-Naxxramas','URL edit renamed the set');
$admin->enqueue_styles('toplevel_page_hscard-api');verify($GLOBALS['script'][2]===array('jquery-ui-sortable'),'WordPress sortable dependency missing');verify($GLOBALS['script'][3]===$GLOBALS['style'][3]&&$GLOBALS['script'][3]!==HSCARD_VERSION,'Admin asset revisions missing');
$_GET=array();$GLOBALS['options']=array(Json_Sources::OPTION=>$original);
$method=new ReflectionMethod($admin,'render_source_form');$method->setAccessible(true);
ob_start();$method->invoke($admin,'',array());$form=ob_get_clean();
verify(strpos($form,'name="source_repository"')!==false&&strpos($form,'name="source_url"')===false,'New form requires full URL');
ob_start();$method->invoke($admin,'legacy',$original['legacy']);$edit=ob_get_clean();verify(strpos($edit,'name="source_url"')!==false,'Existing form changed');
$method=new ReflectionMethod($admin,'render_sources');$method->setAccessible(true);ob_start();$method->invoke($admin,$original,array());$list=ob_get_clean();
verify(substr_count($list,'data-source-id=')===4&&strpos($list,'data-order-nonce="test-nonce"')!==false,'Missing sortable markup');
$fixtureSources=$original;$fixtureSources['managed']=array_merge($original['naxx'],array('repository'=>'Curse-of-Naxxramas','set'=>'Curse-of-Naxxramas'));
$method=new ReflectionMethod($admin,'render_set_form');$method->setAccessible(true);ob_start();$method->invoke($admin,'',array(),$fixtureSources);$setForm=ob_get_clean();
verify(strpos($setForm,'data-set-id="Curse-of-Naxxramas"')!==false&&strpos($setForm,'data-hscard-auto-set')!==false,'Automatic set form metadata missing');
if(in_array('--fixture',$argv,true)){echo '<!doctype html><meta charset="utf-8"><link rel="stylesheet" href="/plugin/admin/css/data-manager.css"><style>body{font:13px Arial;margin:20px;background:#f0f0f1}.button{background:white;border:1px solid #2271b1;color:#2271b1;border-radius:3px;padding:6px 10px}.hscard-sort-handle .dashicons:before{content:"☰"}input,textarea{padding:8px;border:1px solid #8c8f94;border-radius:4px}</style><div class="hscard-manager">'.$list.$form.$setForm.'</div>';}
else echo json_encode(array('ok'=>true,'ordering'=>'full/filtered/reload/add/delete/storage failure','security'=>'capability/nonce/method/IDs','repository'=>'validation/server expansion/duplicate/edit preservation','markup'=>true)).PHP_EOL;
