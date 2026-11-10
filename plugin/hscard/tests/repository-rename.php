<?php
// Reuse the admin option seam and test persisted pre-rename sources.
ob_start();require __DIR__ . '/admin-sources.php';ob_end_clean();
$old = 'https://raw.githubusercontent.com/qxwd565/League-Of-Explorers/main/';
$new = 'https://raw.githubusercontent.com/qxwd565/The-League-of-Explorers/main/';
$GLOBALS['options'][\HScard\Json_Sources::OPTION] = array(
 'src_existing' => array('url'=>$old.'cards.json','art_base'=>$old.'cards.json','repository'=>'League-Of-Explorers','set'=>'League-Of-Explorers','mode'=>'remote','enabled'=>1),
);
$sources=\HScard\Json_Sources::all();
verify($sources['src_existing']['url']===$new.'cards.json'&&$sources['src_existing']['art_base']===$new.'cards.json','Old source/art URL not migrated');
verify($sources['src_existing']['set']==='League-Of-Explorers'&&$sources['src_existing']['repository']==='League-Of-Explorers','Existing identity changed');
verify(\HScard\Json_Sources::repository_url('League-Of-Explorers')===$new.'cards.json','Old repository input not redirected');
verify(\HScard\Json_Sources::legacy_url('https://example.com/qxwd565/League-Of-Explorers/x')==='https://example.com/qxwd565/League-Of-Explorers/x','Unrelated URL changed');
verify($GLOBALS['options'][\HScard\Json_Sources::OPTION]['src_existing']['url']===$old.'cards.json','Read mutated stored data');
echo json_encode(array('ok'=>true,'existingSourceIdsPreserved'=>true,'sourceAndArtworkUrl'=>true,'unrelatedURLsUnchanged'=>true)).PHP_EOL;
