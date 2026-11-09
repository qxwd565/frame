<?php
namespace HScard {
 // Card storage seam: the production parser, importer, source mapper and option writes run below.
 class Card_Store {
  public static $cards=array();
  public static function maybe_upgrade(){return true;}
  public function find_cards($ids){return array_intersect_key(self::$cards,array_flip($ids));}
  public function find_code_ids($codes){$found=array();foreach(self::$cards as $id=>$card){if(in_array($card['card_code'],$codes,true))$found[$card['card_code']][$id]=true;}return $found;}
  public function save_cards($cards,$removed){foreach($removed as $id=>$code)unset(self::$cards[$id]);foreach($cards as $card)self::$cards[$card['id']]=$card;return count($cards);}
 }
}
namespace {
 ob_start();require __DIR__.'/admin-sources.php';ob_end_clean();
 function wp_json_encode($value,$flags=0){return json_encode($value,$flags);}
 $GLOBALS['wpdb']=new class { public $prefix='test_';public function prepare($query,...$args){return $query;}public function get_var($query){return 1;} };
 $source=array('label'=>'낙스라마스','url'=>\HScard\Json_Sources::repository_url('Curse-of-Naxxramas'),'repository'=>'Curse-of-Naxxramas','set'=>'Curse-of-Naxxramas','mode'=>'remote','enabled'=>1,'count'=>0,'art_base'=>'');
 $GLOBALS['options']=array(\HScard\Json_Sources::OPTION=>array('repo'=>$source));
 $admin=new \HScard\Admin_Page();$apply=new \ReflectionMethod($admin,'apply_document');$apply->setAccessible(true);
 $card=array('id'=>'TEST_001','dbfId'=>123,'name'=>'검사','type'=>'MINION','cost'=>1,'set'=>'NAXX','watermark'=>'Naxxramas_Icon','art'=>'art/TEST_001.png');
 $doc=array('schema'=>1,'set'=>'Curse of Naxxramas','cards'=>array($card));
 $first=$apply->invoke($admin,'repo',$source,json_encode($doc));
 verify(!is_wp_error($first)&&$first['set']==='Curse-of-Naxxramas','Import replaced repository ID with JSON set label');
 $imports=get_option(\HScard\Admin_Page::IMPORTS_OPTION);verify(array_keys($imports)===array('Curse-of-Naxxramas'),'Wrong import ownership key');
 $native=json_decode(\HScard\Card_Store::$cards[123]['native_meta'],true);verify($native['set']==='NAXX'&&$native['watermark']==='Naxxramas_Icon','Game set/watermark overwritten');
 verify(\HScard\Card_Store::$cards[123]['card_code']==='TEST_001','Card identity overwritten');
 $urls=\HScard\Json_Sources::card_urls_for_cards(\HScard\Card_Store::$cards);verify($urls[123]==='https://raw.githubusercontent.com/qxwd565/Curse-of-Naxxramas/main/data/TEST_001.json','Dated card routing broken');
 $doc['set']='Renamed Header';$doc['cards'][0]['cost']=2;
 $again=$apply->invoke($admin,'repo',\HScard\Json_Sources::all()['repo'],json_encode($doc));
 verify(!is_wp_error($again)&&array_keys(get_option(\HScard\Admin_Page::IMPORTS_OPTION))===array('Curse-of-Naxxramas'),'Reimport renamed or duplicated set');
 verify(\HScard\Card_Store::$cards[123]['mana']===2,'Reimport no longer updates cards');
 // Existing sources retain their document-based IDs, including spaces.
 $legacy=$source;unset($legacy['repository']);$legacy['set']='Old Set';
 $GLOBALS['options']=array(\HScard\Json_Sources::OPTION=>array('old'=>$legacy));\HScard\Card_Store::$cards=array();$doc['set']='Old Set';
 $old=$apply->invoke($admin,'old',$legacy,json_encode($doc));verify(!is_wp_error($old)&&$old['set']==='Old Set','Existing ID migrated unexpectedly');
 // An unrelated set with the same ID must not be overwritten.
 $GLOBALS['options']=array(\HScard\Json_Sources::OPTION=>array('repo'=>$source,'other'=>$legacy),\HScard\Admin_Page::IMPORTS_OPTION=>array('Curse-of-Naxxramas'=>array('source_id'=>'other','cards'=>array(123=>'TEST_001'),'count'=>1)));
 $before=$GLOBALS['options'];$conflict=$apply->invoke($admin,'repo',$source,json_encode($doc));verify(is_wp_error($conflict)&&$GLOBALS['options']===$before,'Conflict overwrote a different set');
 // Blank-set creation also derives the ID on the server, ignoring a forged/manual key.
 $GLOBALS['options']=array(\HScard\Json_Sources::OPTION=>array('repo'=>$source));$_POST=array('_wpnonce'=>'test-nonce','source_id'=>'repo','original_set'=>'','set_key'=>'wrong','set_label'=>'표시명');
 try{$admin->save_set();}catch(Test_Redirect $r){verify(!$GLOBALS['notice']['error'],'Automatic blank set failed');}
 verify(array_keys(get_option(\HScard\Admin_Page::IMPORTS_OPTION))===array('Curse-of-Naxxramas'),'Manual input overrode repository ID');
 // Preserve supported GitHub repository names in the editor, including dots and 100 characters.
 foreach(array('.github',str_repeat('a',100)) as $repo){$s=$source;$s['repository']=$repo;$s['set']=$repo;$GLOBALS['options']=array(\HScard\Json_Sources::OPTION=>array('repo'=>$s));$_POST['original_set']='';
  try{$admin->save_set();}catch(Test_Redirect $r){verify(!$GLOBALS['notice']['error'],'Valid repository set rejected');}
  $_POST['original_set']=$repo;$_POST['set_key']=$repo;$_POST['source_id']='';
  try{$admin->save_set();}catch(Test_Redirect $r){verify(!$GLOBALS['notice']['error'],'Detaching a repository set lost compatibility');}
  $_POST['source_id']='repo';
 }
 echo json_encode(array('ok'=>true,'repositoryId'=>'registration/import/reimport/form','existingIdsPreserved'=>true,'gameMetadataPreserved'=>true,'datedRouting'=>true,'conflictsBlocked'=>true)).PHP_EOL;
}
