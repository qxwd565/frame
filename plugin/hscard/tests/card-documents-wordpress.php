<?php
// Real WP options/transients/cron, isolated SQLite; HTTP and advisory locks are seams.
$root = getenv('HSCARD_TEST_WP');
if (!$root || false === strpos(str_replace('\\','/',$root),'/.build/wp-card-pages/wordpress')) { throw new RuntimeException('Isolated test site required'); }
require $root . '/wp-load.php';
if (home_url() !== 'http://127.0.0.1:19460') { throw new RuntimeException('Local test site required'); }
add_filter('query', static function($sql){return preg_match('/^SELECT (GET_LOCK|RELEASE_LOCK)\(/',$sql)?'SELECT 1':$sql;});
require_once HSCARD_PATH . 'includes/class-card-store.php';
require_once HSCARD_PATH . 'includes/class-deck-view.php';
require_once HSCARD_PATH . 'includes/class-render-spec.php';
require_once HSCARD_PATH . 'includes/class-native-cards.php';
use HScard\Card_Documents;
use HScard\Card_Store;
use HScard\Json_Sources;
function doc_check($ok,$message){if(!$ok)throw new RuntimeException($message);}
$cards=(new Card_Store())->find_cards(array(9,180));doc_check(count($cards)===2,'Missing imported test cards');
$urls=Json_Sources::card_urls_for_cards($cards);doc_check(count($urls)===2,'Missing source URLs');
$keys=array_map(static function($url){return Card_Documents::PREFIX . hash('sha256',$url);},$urls);
foreach($keys as $key)delete_transient($key);
delete_option(Card_Documents::QUEUE);wp_clear_scheduled_hook(Card_Documents::CRON);
$fixture=array();foreach($cards as $id=>$card){$fixture[$urls[$id]]=wp_json_encode(array(
 '2013-08-17'=>array('id'=>$card['card_code'],'dbfId'=>$id,'type'=>$card['card_type'],'name'=>$card['name'],'rarity'=>'RARE','races'=>array('DRAGON'),'text'=>'<b>원문</b><br></br>줄바꿈'),
 '2013-10-03'=>array('rarity'=>'LEGENDARY','races'=>null,'text'=>'다음 시기'),
));}
$requests=0;$fail=false;$requeue=false;
add_filter('pre_http_request',static function($pre,$args,$url)use(&$requests,&$fail,&$requeue,$fixture){
 $requests++;doc_check(isset($fixture[$url]),'Unexpected external request');
 doc_check($args['redirection']===0&&$args['limit_response_size']===1048577,'Unsafe HTTP settings');
 if($requeue){$requeue=false;Card_Documents::changed(array(9,180));}
 return array('response'=>array('code'=>$fail?503:200),'body'=>$fail?'':$fixture[$url],'headers'=>array());
},10,3);
doc_check(Card_Documents::for_cards($cards,$urls)===array()&&$requests===0,'Page render performed HTTP');
doc_check(count(get_option(Card_Documents::QUEUE))===2&&wp_next_scheduled(Card_Documents::CRON),'Cache miss not queued');
Card_Documents::run();$docs=Card_Documents::for_cards($cards,$urls);
doc_check(count($docs)===2&&$requests===2&&!get_option(Card_Documents::QUEUE),'Background warm failed');
foreach($docs as $url=>$doc)doc_check(json_encode($doc)===json_encode(json_decode($fixture[$url])),'Original dated information changed');
$html=(new HScard\Deck_View())->render(array(9=>1,180=>2),$cards,'','left',array(),array(),'검사','','',false,'2013-08-17','historical');
doc_check(strpos($html,'data-hscard-documents=')!==false&&$requests===2,'HTML missed documents or performed HTTP');
preg_match('/data-hscard-documents="([^"]*)"/',$html,$embedded);
$decoded=json_decode(html_entity_decode($embedded[1],ENT_QUOTES|ENT_HTML5,'UTF-8'),true);
doc_check(count($decoded)===2&&isset($decoded[$urls[9]],$decoded[$urls[180]]),'Sorted deck rows lost embedded documents');
doc_check(strpos($html,'<b>원문</b>')===false,'Unescaped document HTML');
// A new import arriving during fetch must not be overwritten by that response.
Card_Documents::changed(array(9,180));$requeue=true;Card_Documents::run();
doc_check(!get_transient($keys[9])&&!get_transient($keys[180]),'Stale import response committed');
Card_Documents::run();doc_check(count(Card_Documents::for_cards($cards,$urls))===2,'Latest import not recovered');
// Expired refresh/failure keeps the last complete document, with retry backoff.
foreach($keys as $key){$cached=get_transient($key);$cached['checked']=0;set_transient($key,$cached,86400);}
doc_check(count(Card_Documents::for_cards($cards,$urls))===2,'Stale complete document lost');
$fail=true;for($i=0;$i<3;$i++)Card_Documents::run();
$count=$requests;doc_check(count(Card_Documents::for_cards($cards,$urls))===2&&!get_option(Card_Documents::QUEUE)&&$requests===$count,'Failure retries or foreground HTTP');
// Local managed documents are embedded directly, never queued for an HTTP round trip.
$sources=Json_Sources::all();$local=array('label'=>'local','mode'=>'local','enabled'=>1,'set'=>'local');Json_Sources::save($sources+array('local'=>$local));
doc_check(Json_Sources::save_card_content('local','CS2_072',$fixture[$urls[180]]),'Local document save');
$localUrl=Json_Sources::card_url('local',$local,'CS2_072');
doc_check(isset(Card_Documents::for_cards(array(180=>$cards[180]),array(180=>$localUrl))[$localUrl])&&$requests===$count,'Local document not embedded');
Json_Sources::save($sources);
echo json_encode(array('ok'=>true,'wordpress'=>get_bloginfo('version'),'foregroundHttp'=>0,'rawDocuments'=>true,'importRevision'=>true,'refreshFailureRecovery'=>true,'localDocuments'=>true,'escapedHtml'=>true)) . PHP_EOL;
