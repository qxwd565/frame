<?php
// Run against an isolated WordPress installation, never a production database.
// HSCARD_TEST_WP must point to .build/wp-card-pages/wordpress in this checkout.
$root = getenv( 'HSCARD_TEST_WP' );
if ( ! $root || false === strpos( str_replace( '\\', '/', $root ), '/.build/wp-card-pages/wordpress' ) ) { throw new RuntimeException( 'Isolated WordPress test root required' ); }
require $root . '/wp-load.php';
if ( 'http://127.0.0.1:19460' !== home_url() ) { throw new RuntimeException( 'Local test site required' ); }
// SQLite runs the real WP post/meta/slug/query APIs. MySQL advisory locks are a
// serial test seam only; production lock contention requires MySQL validation.
add_filter( 'query', static function ( $sql ) { return preg_match( '/^SELECT (GET_LOCK|RELEASE_LOCK)\(/', $sql ) ? 'SELECT 1' : $sql; } );
wp_set_current_user( 1 );
require_once $root . '/wp-content/plugins/hscard/hscard.php';
require_once HSCARD_PATH . 'admin/class-admin-page.php';
require_once HSCARD_PATH . 'includes/class-card-store.php';
require_once HSCARD_PATH . 'includes/class-deckstring.php';
require_once HSCARD_PATH . 'includes/class-render-spec.php';
require_once HSCARD_PATH . 'includes/class-deck-view.php';
require_once HSCARD_PATH . 'includes/class-native-cards.php';
use HScard\Card_Posts;
use HScard\Card_Store;
use HScard\Admin_Page;
use HScard\Json_Sources;
use HScard\Card_Documents;
function check_card_post( $ok, $message ) { if ( ! $ok ) { throw new RuntimeException( $message ); } }
function imported_card_posts() { return get_posts( array( 'post_type'=>'post', 'post_status'=>array('publish','draft','private','trash'), 'numberposts'=>-1, 'meta_key'=>Card_Posts::META ) ); }
// Reset only this throwaway installation's generated fixtures for repeat runs.
foreach ( imported_card_posts() as $post ) { wp_delete_post( $post->ID, true ); }
foreach ( array(Card_Posts::QUEUE,Card_Posts::ERRORS,Card_Posts::BACKFILL,Admin_Page::IMPORTS_OPTION) as $key ) { delete_option($key); }
check_card_post( Card_Store::install(), 'Card table installation failed' );
$GLOBALS['wpdb']->query( 'DELETE FROM ' . Card_Store::table_name() );
$source=array('label'=>'고전','repository'=>'legacy','url'=>Json_Sources::repository_url('legacy'),'art_base'=>'','mode'=>'remote','enabled'=>1,'set'=>'legacy');
Json_Sources::save(array('legacy'=>$source));
update_option('timezone_string','Asia/Seoul');
$category=get_term_by('slug','card','category');
if($category){wp_update_term($category->term_id,'category',array('name'=>'Cards'));}
else{wp_insert_term('Cards','category',array('slug'=>'card'));}
$sample=json_decode(file_get_contents(getenv('HSCARD_TEST_CATALOG')),true)['cards'];
$cards=array_values(array_filter($sample,static function($c){return in_array($c['id'],array('EX1_350','CS2_072','EX1_165a'),true);}));
check_card_post(count($cards)===3,'Expected real legacy fixtures');
$doc=array('schema'=>1,'set'=>'Legacy','cards'=>$cards);
$dated=array();foreach($cards as $card){$dated[Json_Sources::card_url('legacy',$source,$card['id'])]=wp_json_encode(array(
 '2026-01-01'=>array('text'=>'후기 설명'),
 'meta'=>array('importedAt'=>'2026-11-10'),
 '2013-08-17'=>array('id'=>$card['id'],'dbfId'=>$card['dbfId'],'name'=>$card['name'],'type'=>$card['type'],'text'=>'최초 설명'),
));}
$httpCalls=0;
add_filter('pre_http_request',static function($pre,$args,$url)use(&$dated,&$httpCalls){$httpCalls++;return isset($dated[$url])?array('response'=>array('code'=>200),'body'=>$dated[$url],'headers'=>array()):new WP_Error('fixture_missing','No dated fixture');},10,3);
delete_option(Card_Documents::QUEUE);wp_clear_scheduled_hook(Card_Documents::CRON);
$warmDocuments=false;
$admin=new Admin_Page();$apply=new ReflectionMethod($admin,'apply_document');$apply->setAccessible(true);
$import=static function($doc)use($apply,$admin,&$warmDocuments){$r=$apply->invoke($admin,'legacy',Json_Sources::all()['legacy'],wp_json_encode($doc));check_card_post(!is_wp_error($r),is_wp_error($r)?$r->get_error_message():'Import failed');if($warmDocuments)Card_Documents::run();return $r;};
$import($doc);check_card_post(count(get_option(Card_Posts::QUEUE))===3,'Import did not queue posts');
Card_Posts::run_batch();check_card_post(count(imported_card_posts())===0&&$httpCalls===0,'Published today instead of waiting for initial date');
$waiting=get_option(Card_Posts::QUEUE);check_card_post(count($waiting)===2&&!empty(reset($waiting)['waiting_date']),'Missing date was not deferred');
wp_clear_scheduled_hook(Card_Posts::CRON);Card_Posts::schedule();check_card_post(wp_next_scheduled(Card_Posts::CRON)>=time()+299,'Missing dates cause a cron spin');
wp_set_current_user(0);Card_Documents::run();Card_Posts::run_batch();wp_set_current_user(1);$warmDocuments=true;
Card_Posts::run_batch();$posts=imported_card_posts();check_card_post(count($posts)===2,'Tokens created posts or parents missing');
$ids=array();foreach($posts as $post){$ids[get_post_meta($post->ID,Card_Posts::META,true)]=$post->ID;check_card_post($post->post_type==='post'&&$post->post_status==='publish'&&(int)$post->post_author===1,'Not a published authored post');}
$category=get_term_by('slug','card','category');check_card_post($category&&$category->name==='카드','Card category name/slug not enforced');
foreach($posts as $post){check_card_post(wp_get_post_categories($post->ID)===array((int)$category->term_id),'Unexpected extra/default category');check_card_post($post->post_date==='2013-08-17 00:00:00'&&$post->post_date_gmt==='2013-08-16 15:00:00','First date or timezone conversion incorrect');}
Card_Posts::document_ready('https://example.org/data/EX1_350.json');check_card_post(!get_option(Card_Posts::QUEUE),'Unrelated source woke posts');
check_card_post(get_permalink($ids['EX1_350'])==='http://127.0.0.1:19460/EX1_350/','Card-code URL not retained');
$dbfs=array_column($cards,'dbfId');$loaded=(new Card_Store())->find_cards($dbfs);$urls=Card_Posts::urls($loaded);check_card_post(count($urls)===2,'Token linked');
$html=(new HScard\Deck_View())->render(array_fill_keys($dbfs,1),$loaded,'AAEtest', 'left',array(),array(),'덱','','',false,'2026-11-09');
check_card_post(substr_count($html,'class="hscard-card-link"')===2&&strpos($html,'/EX1_350/')!==false,'Deck links missing');
$dom=new DOMDocument();@$dom->loadHTML('<?xml encoding="utf-8" ?>'.wpautop($html));$xp=new DOMXPath($dom);
check_card_post($xp->query('//div[@class="hscard-card-navigation"]/a[@class="hscard-card-link"]')->length===2,'wpautop broke the navigation hit target');
// Reimport updates one existing post, preserving additional authored content.
wp_update_post(array('ID'=>$ids['EX1_350'],'post_content'=>'[hscard_card]<p>추가한 내용</p>'));
$other=wp_insert_term('검사용 일반 글','category',array('slug'=>'post-date-test-other'));$otherId=is_wp_error($other)?(int)$other->get_error_data():(int)$other['term_id'];
wp_update_post(array('ID'=>$ids['EX1_350'],'post_category'=>array($otherId)));
check_card_post(wp_get_post_categories($ids['EX1_350'])===array((int)$category->term_id),'Classic editor changed managed category');
wp_set_post_categories($ids['EX1_350'],array($otherId));do_action('rest_after_insert_post',get_post($ids['EX1_350']));
check_card_post(wp_get_post_categories($ids['EX1_350'])===array((int)$category->term_id),'REST editor changed managed category');
$ordinary=wp_insert_post(array('post_type'=>'post','post_status'=>'publish','post_title'=>'일반 글 보존 검사','post_category'=>array($otherId),'post_date'=>'2020-02-03 00:00:00'));
check_card_post(wp_get_post_categories($ordinary)===array($otherId)&&get_post($ordinary)->post_date==='2020-02-03 00:00:00','Unrelated post modified');wp_delete_post($ordinary,true);
foreach($doc['cards'] as &$card){if($card['id']==='EX1_350')$card['name']='예언자 벨렌 수정';}unset($card);
$import($doc);Card_Posts::run_batch();check_card_post(count(imported_card_posts())===2,'Reimport duplicated posts');
check_card_post(get_post($ids['EX1_350'])->post_title==='예언자 벨렌 수정'&&strpos(get_post($ids['EX1_350'])->post_content,'추가한 내용')!==false,'Reimport lost title/content');
// Remove and then restore a parent; the same post and URL are reused.
$without=$doc;$without['cards']=array_values(array_filter($doc['cards'],static function($c){return $c['id']!=='EX1_350';}));
$import($without);Card_Posts::run_batch();check_card_post(get_post_status($ids['EX1_350'])==='draft','Removed parent remains public');
$import($doc);Card_Posts::run_batch();check_card_post(get_post_status($ids['EX1_350'])==='publish','Restored parent was duplicated or left hidden');
// Changing a parent into a noncollectible card withdraws its post/link too.
$token_doc=$doc;foreach($token_doc['cards'] as &$card){if($card['id']==='EX1_350')$card['collectible']=false;}unset($card);
$import($token_doc);Card_Posts::run_batch();check_card_post(get_post_status($ids['EX1_350'])==='draft','Noncollectible card remains public');
$import($doc);Card_Posts::run_batch();
// A deliberate trash operation is respected.
wp_trash_post($ids['CS2_072']);$import($doc);Card_Posts::run_batch();check_card_post(get_post_status($ids['CS2_072'])==='trash','Manual trash was undone');
wp_untrash_post($ids['CS2_072']);wp_update_post(array('ID'=>$ids['CS2_072'],'post_status'=>'publish'));
// Never overwrite an unrelated page at the requested root URL.
$collision=get_page_by_path('test_collision',OBJECT,'page');if(!$collision)$collision=get_post(wp_insert_post(array('post_type'=>'page','post_status'=>'publish','post_name'=>'test_collision','post_title'=>'원래 페이지','post_content'=>'보존')));
$conflict=$loaded[$dbfs[0]];$conflict['card_code']='TEST_COLLISION';$conflict['collectible']=1;
$result=Card_Posts::sync_card(999999,$conflict,1);check_card_post(is_wp_error($result)&&get_post($collision->ID)->post_content==='보존','Existing page overwritten');
$fail=$conflict;$fail['card_code']='FAIL_001';$fail['id']=999998;
$failureUrl=Json_Sources::card_url('legacy',$source,'FAIL_001');set_transient(Card_Documents::PREFIX.hash('sha256',$failureUrl),array('url'=>$failureUrl,'body'=>reset($dated),'checked'=>time()),86400);
add_filter('wp_insert_post_empty_content','__return_true');
$failed=Card_Posts::sync_card(999998,$fail,1);remove_filter('wp_insert_post_empty_content','__return_true');
check_card_post(is_wp_error($failed)&&$failed->get_error_code()==='empty_content'&&!get_page_by_path('fail_001',OBJECT,'post'),'Failed write reported as success');
// A new queue revision arriving during a post write cannot be acknowledged away.
$queued_id=$dbfs[0];$once=true;
$hook=static function()use(&$once,$queued_id){if($once){$once=false;Card_Posts::queue(array($queued_id));}};
foreach($doc['cards'] as &$card){if($card['dbfId']===$queued_id)$card['name'].=' 새 이력';}unset($card);
$import($doc);add_action('wp_after_insert_post',$hook);Card_Posts::run_batch();remove_action('wp_after_insert_post',$hook);
check_card_post(isset(get_option(Card_Posts::QUEUE)[$queued_id]),'Concurrent queue revision lost');Card_Posts::run_batch();
// Existing JSON imports are backfilled once, without requiring reimport.
wp_update_post(array('ID'=>$ids['EX1_350'],'post_date'=>'2026-11-10 00:00:00','post_date_gmt'=>'2026-11-09 15:00:00','edit_date'=>true));
wp_set_post_categories($ids['EX1_350'],array($otherId));
update_option(Card_Posts::BACKFILL,1);Card_Posts::backfill();check_card_post(count(get_option(Card_Posts::QUEUE))===3,'Backfill missed existing JSON cards');Card_Posts::run_batch();
check_card_post(get_post($ids['EX1_350'])->post_date==='2013-08-17 00:00:00'&&wp_get_post_categories($ids['EX1_350'])===array((int)$category->term_id),'Existing posts not migrated');
check_card_post((int)get_option(Card_Posts::BACKFILL)===Card_Posts::BACKFILL_VERSION,'Migration version not saved');
// Corrected earliest history updates the same post; newer patches never become its date.
$velenUrl=Json_Sources::card_url('legacy',$source,'EX1_350');$history=json_decode($dated[$velenUrl],true);$history['2012-12-31']=$history['2013-08-17'];$dated[$velenUrl]=wp_json_encode($history);
Card_Documents::changed(array(9));Card_Documents::run();Card_Posts::run_batch();
check_card_post(get_post($ids['EX1_350'])->post_date==='2012-12-31 00:00:00'&&count(imported_card_posts())===2,'Changed first date did not update the existing post');
check_card_post(strpos(get_post($ids['EX1_350'])->post_content,'추가한 내용')!==false,'Date update erased authored content');
// Locally edited dates use the same wake-up path, without HTTP.
$remoteSources=Json_Sources::all();$localSources=$remoteSources;$localSources['legacy']['mode']='local';Json_Sources::save($localSources);
$localHistory=$history;unset($localHistory['2012-12-31']);$beforeHttp=$httpCalls;
check_card_post(Json_Sources::save_card_content('legacy','EX1_350',wp_json_encode($localHistory)),'Local history save failed');
Card_Posts::run_batch();check_card_post(get_post($ids['EX1_350'])->post_date==='2013-08-17 00:00:00'&&$httpCalls===$beforeHttp,'Local history did not update date without HTTP');
Json_Sources::save($remoteSources);Card_Posts::queue(array(9));Card_Posts::run_batch();
// WordPress query + shortcode renders the same native card surface without a deck footer/self-link.
$GLOBALS['wp_query']=new WP_Query(array('p'=>$ids['EX1_350'],'post_type'=>'post'));
$detail=do_shortcode('[hscard_card]');check_card_post(strpos($detail,'hscard-single-card')!==false&&strpos($detail,'data-hscard-card=')!==false&&strpos($detail,'data-hscard-save-code')===false&&strpos($detail,'class="hscard-card-link"')===false,'Single-card rendering failed');
$request=(object)array('request'=>'EX1_350','query_vars'=>array('error'=>'404'));Card_Posts::resolve_request($request);check_card_post($request->query_vars['p']===$ids['EX1_350'],'Root card URL not resolved');
$request=(object)array('request'=>'unrelated-page','query_vars'=>array('pagename'=>'unrelated-page'));Card_Posts::resolve_request($request);check_card_post($request->query_vars===array('pagename'=>'unrelated-page'),'Unrelated route changed');
// Leave a representative deck and real card posts for HTTP/browser checks.
$deck=get_page_by_path('card-link-check',OBJECT,'page');$deck_id=wp_insert_post(array('ID'=>$deck?$deck->ID:0,'post_type'=>'page','post_status'=>'publish','post_name'=>'card-link-check','post_title'=>'Deck link check','post_content'=>$html));
update_option('active_plugins',array('hscard/hscard.php'));flush_rewrite_rules(false);
echo wp_json_encode(array('ok'=>true,'wordpress'=>get_bloginfo('version'),'posts'=>$ids,'parentsOnly'=>true,'reimport'=>true,'backfill'=>true,'queueRevision'=>true,'slugConflict'=>true,'rootRouting'=>true,'deckLinks'=>true,'detailRenderer'=>true,'categoryOnlyCard'=>true,'firstHistoryDate'=>true,'dateWaitAndWake'=>true,'timezone'=>true,'ordinaryPostsUnchanged'=>true),JSON_UNESCAPED_UNICODE).PHP_EOL;
