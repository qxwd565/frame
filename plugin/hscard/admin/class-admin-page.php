<?php
/** WordPress card-set and JSON source manager. @package HScard */
namespace HScard;
use WP_Error;
if ( ! defined( 'ABSPATH' ) ) { exit; }

final class Admin_Page {
 const PAGE = 'hscard-api';
 const ACTION = 'hscard_import_set'; // Retained for legacy admin-post callers.
 const IMPORTS_OPTION = 'hscard_imported_sets';
 const NOTICE_PREFIX = 'hscard_import_notice_';
 const LOCK_PREFIX = 'hscard_';

 public function register_hooks() {
  add_action( 'admin_menu', array( $this, 'add_menu' ) );
  $actions = array(
   self::ACTION => 'import_set',
   'hscard_save_source' => 'save_source',
   'hscard_delete_source' => 'delete_source',
   'hscard_save_set' => 'save_set',
   'hscard_delete_set' => 'delete_set',
   'hscard_save_json' => 'save_json',
   'hscard_save_dated_card' => 'save_dated_card',
   'hscard_revert_json' => 'revert_json',
   'hscard_export_json' => 'export_json',
  );
  foreach ( $actions as $action => $method ) { add_action( 'admin_post_' . $action, array( $this, $method ) ); }
  add_action( 'admin_enqueue_scripts', array( $this, 'enqueue_styles' ) );
  add_action( 'wp_ajax_hscard_reorder_sources', array( $this, 'reorder_sources' ) );
 }

 public function add_menu() {
  add_menu_page( __( '카드 데이터', 'hscard' ), __( '카드 데이터', 'hscard' ), 'manage_options', self::PAGE, array( $this, 'render' ), 'dashicons-database-view', 3.1 );
 }
 public function enqueue_styles( $hook ) {
  if ( 'toplevel_page_' . self::PAGE === $hook ) {
   $revision = HSCARD_VERSION . '-' . substr( hash_file( 'sha256', HSCARD_PATH . 'admin/js/data-manager.js' ), 0, 12 ) . '-' . substr( hash_file( 'sha256', HSCARD_PATH . 'admin/css/data-manager.css' ), 0, 12 );
   wp_enqueue_style( 'hscard-data-manager', plugins_url( 'admin/css/data-manager.css', HSCARD_PATH . 'hscard.php' ), array(), $revision );
   wp_enqueue_script( 'hscard-data-manager', plugins_url( 'admin/js/data-manager.js', HSCARD_PATH . 'hscard.php' ), array( 'jquery-ui-sortable' ), $revision, true );
  }
 }

 private function tab() {
  $tab = isset( $_GET['tab'] ) && is_string( $_GET['tab'] ) ? sanitize_key( wp_unslash( $_GET['tab'] ) ) : 'sources';
  return in_array( $tab, array( 'sets', 'sources' ), true ) ? $tab : 'sources';
 }
 private function query( $key ) {
  return isset( $_GET[ $key ] ) && is_string( $_GET[ $key ] ) ? sanitize_text_field( wp_unslash( $_GET[ $key ] ) ) : '';
 }
 private function admin_url( $values = array() ) {
  return add_query_arg( array_merge( array( 'page' => self::PAGE ), $values ), admin_url( 'admin.php' ) );
 }
 private function post_url() { return admin_url( 'admin-post.php' ); }
 private function imports() {
  $imports = get_option( self::IMPORTS_OPTION, array() );
  return is_array( $imports ) ? $imports : array();
 }

 /** Display official set names consistently; identifiers and custom labels stay intact. */
 private function localized_labels( array $items ) {
  static $names = array(
   'legacy' => '고전', 'classic' => '클래식', 'basic' => '기본', 'core' => '핵심',
   'event' => '이벤트', 'battlegrounds' => '전장', 'halloffame' => '명예의 전당',
   'curseofnaxxramas' => '낙스라마스의 저주', 'naxxramas' => '낙스라마스의 저주',
   'goblinsvsgnomes' => '고블린 대 노움', 'blackrockmountain' => '검은바위 산',
   'thegrandtournament' => '대 마상시합', 'leagueofexplorers' => '탐험가 연맹',
   'theleagueofexplorers' => '탐험가 연맹', 'whispersoftheoldgods' => '고대 신의 속삭임',
   'onenightinkarazhan' => '한여름 밤의 카라잔', 'meanstreetsofgadgetzan' => '비열한 거리의 가젯잔',
   'journeytoungoro' => '운고로를 향한 여정', 'knightsofthefrozenthrone' => '얼어붙은 왕좌의 기사들',
   'koboldsandcatacombs' => '코볼트와 지하 미궁', 'koboldscatacombs' => '코볼트와 지하 미궁',
   'thewitchwood' => '마녀숲', 'theboomsdayproject' => '박사 붐의 폭심만만 프로젝트',
   'rastakhansrumble' => '라스타칸의 대난투', 'riseofshadows' => '어둠의 반격',
   'saviorsofuldum' => '울둠의 구원자들', 'descentofdragons' => '용의 강림',
   'galakrondsawakening' => '갈라크론드의 부활', 'ashesofoutland' => '황폐한 아웃랜드',
   'demonhunterinitiate' => '수습 악마사냥꾼', 'scholomanceacademy' => '스칼로맨스 아카데미',
   'madnessatthedarkmoonfaire' => '광기의 다크문 축제', 'forgedinthebarrens' => '불모의 땅',
   'unitedinstormwind' => '스톰윈드', 'fracturedinalteracvalley' => '알터랙 계곡',
   'voyagetothesunkencity' => '가라앉은 도시로의 항해', 'murderatcastlenathria' => '나스리아 성채 살인 사건',
   'marchofthelichking' => '리치 왕의 진군', 'festivaloflegends' => '전설노래자랑',
   'titans' => '티탄', 'cavernsoftime' => '시간의 동굴', 'showdowninthebadlands' => '황야의 땅 결투',
   'whizbangsworkshop' => '위즈뱅의 장난감 공방', 'perilsinparadise' => '극한의 극락',
   'thegreatdarkbeyond' => '끝없는 어둠', 'intotheemeralddream' => '에메랄드의 꿈 속으로',
   'thelostcityofungoro' => '운고로의 잃어버린 도시', 'acrossthetimeways' => '시간의 길 너머로',
   'cataclysm' => '대격변', 'escapefromviolethold' => '보랏빛 요새 탈출 작전',
   'reignoftheblackempire' => '검은 제국의 지배',
  );
  foreach ( $items as $id => $item ) {
   if ( ! is_array( $item ) ) { continue; }
   $label = isset( $item['label'] ) ? trim( (string) $item['label'] ) : '';
   if ( '' === $label ) { $label = ! empty( $item['set'] ) ? (string) $item['set'] : (string) $id; }
   // Repair names supplied by earlier plugin defaults, including existing installs.
   if ( '레거시' === $label ) { $label = '고전'; }
   if ( '시간의 길 (Across The Timeways)' === $label ) { $label = '시간의 길 너머로'; }
   $english = str_replace( '’', "'", $label );
   if ( ! preg_match( '/[^\x20-\x7e]/', $english ) ) {
    $key = strtolower( preg_replace( '/[^a-z0-9]/i', '', $english ) );
    if ( isset( $names[ $key ] ) ) { $label = $names[ $key ]; }
   }
   $items[ $id ]['label'] = $label;
  }
  return $items;
 }
 private function fail( $message ) { return new WP_Error( 'hscard_manager', $message ); }
 private function check_action( $action, $method = 'POST' ) {
  if ( ! current_user_can( 'manage_options' ) ) { wp_die( esc_html__( '관리자 권한이 필요합니다.', 'hscard' ) ); }
  if ( ! isset( $_SERVER['REQUEST_METHOD'] ) || strtoupper( (string) $_SERVER['REQUEST_METHOD'] ) !== $method ) { wp_die( esc_html__( '요청 방식이 올바르지 않습니다.', 'hscard' ) ); }
  check_admin_referer( $action );
 }
 private function post( $key ) {
  return isset( $_POST[ $key ] ) && is_string( $_POST[ $key ] ) ? trim( wp_unslash( $_POST[ $key ] ) ) : '';
 }
 private function finish( $error, $message, $tab = 'sources' ) {
  set_transient( self::NOTICE_PREFIX . get_current_user_id(), array( 'error' => (bool) $error, 'message' => (string) $message ), MINUTE_IN_SECONDS );
  wp_safe_redirect( $this->admin_url( array( 'tab' => $tab ) ) );
  exit;
 }
 private function finish_result( $result, $tab = 'sources', $message = '' ) {
  if ( is_wp_error( $result ) ) { $this->finish( true, $result->get_error_message(), $tab ); }
  $this->finish( false, '' !== $message ? $message : __( '저장했습니다.', 'hscard' ), $tab );
 }
 private function label( $value ) {
  $value = sanitize_text_field( (string) $value );
  return strlen( $value ) <= 200 ? $value : substr( $value, 0, 200 );
 }
 private function api() {
  require_once HSCARD_PATH . 'includes/class-set-api.php';
  return new Set_API();
 }
 private function source_id() { return $this->post( 'source_id' ); }
 private function canonical_set( $value ) {
  return is_string( $value ) && ( preg_match( '/\A[A-Za-z0-9][A-Za-z0-9 _-]{0,95}\z/D', $value ) || ! is_wp_error( Json_Sources::repository_url( $value ) ) );
 }

 public function render() {
  if ( ! current_user_can( 'manage_options' ) ) { return; }
  $sources = $this->localized_labels( Json_Sources::ordered() );
  $imports = $this->localized_labels( $this->imports() );
  $notice = get_transient( self::NOTICE_PREFIX . get_current_user_id() );
  delete_transient( self::NOTICE_PREFIX . get_current_user_id() );
  $tab = $this->tab();
  $single = '' !== $this->query( 'edit_json' ) || '' !== $this->query( 'edit_source' ) || '' !== $this->query( 'edit_dated_source' ) || '' !== $this->query( 'edit_set' ) || '' !== $this->query( 'delete_source' ) || '' !== $this->query( 'delete_set' ) || 'new' === $this->query( 'view' );
  $enabled = 0;
  foreach ( $sources as $source ) { if ( is_array( $source ) && ! empty( $source['enabled'] ) ) { $enabled++; } }
  ?>
  <div class="wrap hscard-manager">
   <header class="hscard-page-head">
    <div>
     <h1><?php esc_html_e( '카드 데이터', 'hscard' ); ?></h1>
     <p class="hscard-intro"><?php esc_html_e( 'JSON을 연결하고 카드 데이터를 관리합니다.', 'hscard' ); ?></p>
    </div>
    <?php if ( ! $single ) : ?>
     <div class="hscard-overview" aria-label="데이터 현황">
      <span>JSON <strong><?php echo esc_html( number_format_i18n( count( $sources ) ) ); ?></strong>개</span>
      <span>사용 중 <strong><?php echo esc_html( number_format_i18n( $enabled ) ); ?></strong>개</span>
      <span>카드 세트 <strong><?php echo esc_html( number_format_i18n( count( $imports ) ) ); ?></strong>개</span>
     </div>
    <?php endif; ?>
   </header>
   <?php if ( is_array( $notice ) && ! empty( $notice['message'] ) ) : ?>
    <div class="notice <?php echo ! empty( $notice['error'] ) ? 'notice-error' : 'notice-success'; ?> is-dismissible"><p><?php echo esc_html( $notice['message'] ); ?></p></div>
   <?php endif; ?>
   <?php if ( ! $single ) : ?>
    <nav class="nav-tab-wrapper" aria-label="카드 데이터 메뉴">
     <a class="nav-tab <?php echo 'sources' === $tab ? 'nav-tab-active' : ''; ?>" <?php echo 'sources' === $tab ? 'aria-current="page"' : ''; ?> href="<?php echo esc_url( $this->admin_url( array( 'tab' => 'sources' ) ) ); ?>">JSON 관리</a>
     <a class="nav-tab <?php echo 'sets' === $tab ? 'nav-tab-active' : ''; ?>" <?php echo 'sets' === $tab ? 'aria-current="page"' : ''; ?> href="<?php echo esc_url( $this->admin_url( array( 'tab' => 'sets' ) ) ); ?>">카드 세트</a>
    </nav>
   <?php endif; ?>
   <?php
   if ( 'sets' === $tab ) { $this->render_sets( $imports, $sources ); }
   else { $this->render_sources( $sources, $imports ); }
   ?>
  </div>
  <?php
 }

 private function render_sets( array $imports, array $sources ) {
  $editing = $this->query( 'edit_set' );
  $removing = $this->query( 'delete_set' );
  if ( '' !== $removing && isset( $imports[ $removing ] ) ) { $this->confirm_delete_set( $removing, $imports[ $removing ] ); return; }
  if ( ( '' !== $editing && isset( $imports[ $editing ] ) ) || 'new' === $this->query( 'view' ) ) {
   $this->render_set_form( $editing, $imports, $sources );
   return;
  }
  $search = $this->query( 's' );
  ksort( $imports, SORT_NATURAL | SORT_FLAG_CASE );
  ?>
  <div class="hscard-section-head">
   <div><h2>카드 세트</h2><p>등록된 카드와 연결된 JSON을 확인합니다.</p></div>
   <a class="button button-primary" href="<?php echo esc_url( $this->admin_url( array( 'tab' => 'sets', 'view' => 'new' ) ) ); ?>">+ 세트 추가</a>
  </div>
  <?php $this->render_search( 'sets', $search ); ?>
  <div class="hscard-table-wrap"><table class="widefat hscard-table">
   <thead><tr><th scope="col">카드 세트</th><th scope="col">카드</th><th scope="col">연결된 JSON</th><th scope="col">작업</th></tr></thead><tbody>
   <?php $listed = 0; foreach ( $imports as $set => $item ) :
    if ( ! is_array( $item ) ) { continue; }
    $label = ! empty( $item['label'] ) ? $item['label'] : $set;
    if ( '' !== $search && false === stripos( (string) $label . ' ' . $set, $search ) ) { continue; }
    $listed++;
    $id = $this->linked_source_id( $set, $item, $sources );
    $source = isset( $sources[ $id ] ) && is_array( $sources[ $id ] ) ? $sources[ $id ] : null;
    $can_import = null !== $source;
    $count = absint( isset( $item['count'] ) ? $item['count'] : 0 );
    ?>
    <tr>
     <td data-label="세트"><strong class="hscard-item-name"><?php echo esc_html( $label ); ?></strong>
      <div class="hscard-sub">ID: <code><?php echo esc_html( $set ); ?></code><?php if ( ! empty( $item['updated_at'] ) ) : ?> <span class="hscard-meta-dot" aria-hidden="true">·</span> <?php echo esc_html( wp_date( 'Y.m.d', absint( $item['updated_at'] ) ) ); ?> 갱신<?php endif; ?></div>
     </td>
     <td data-label="카드"><strong><?php echo esc_html( number_format_i18n( $count ) ); ?>장</strong>
      <?php if ( ! empty( $item['pending_cards'] ) ) : ?><div class="hscard-sub hscard-attention">삭제 보류 <?php echo esc_html( number_format_i18n( count( $item['pending_cards'] ) ) ); ?>장</div><?php endif; ?></td>
     <td data-label="JSON"><?php if ( $source ) : ?><a href="<?php echo esc_url( $this->admin_url( array( 'tab' => 'sources', 'edit_json' => $id ) ) ); ?>"><?php echo esc_html( $source['label'] ); ?></a><?php else : ?><span class="hscard-muted">연결 없음</span><?php endif; ?></td>
     <td data-label="작업"><div class="hscard-actions">
      <?php if ( $can_import ) : $this->action_form( self::ACTION, '가져오기', array( 'source_id' => $id ) ); endif; ?>
      <a class="button" href="<?php echo esc_url( $this->admin_url( array( 'tab' => 'sets', 'edit_set' => $set ) ) ); ?>">설정</a>
      <details class="hscard-row-more"><summary>더보기</summary><div class="hscard-more-content">
       <a class="hscard-delete-link" href="<?php echo esc_url( $this->admin_url( array( 'tab' => 'sets', 'delete_set' => $set ) ) ); ?>">세트 삭제</a>
      </div></details>
     </div></td>
    </tr>
   <?php endforeach; if ( 0 === $listed ) : ?><tr><td colspan="4"><div class="hscard-empty"><strong><?php echo '' === $search ? '등록된 카드 세트가 없습니다.' : '검색 결과가 없습니다.'; ?></strong><p><?php echo '' === $search ? 'JSON을 먼저 추가하고 가져오면 세트가 자동으로 등록됩니다.' : '다른 이름으로 검색해 보세요.'; ?></p><?php if ( '' !== $search ) : ?><a href="<?php echo esc_url( $this->admin_url( array( 'tab' => 'sets' ) ) ); ?>">전체 목록 보기</a><?php else : ?><a class="button" href="<?php echo esc_url( $this->admin_url( array( 'tab' => 'sources' ) ) ); ?>">JSON 관리로 이동</a><?php endif; ?></div></td></tr><?php endif; ?>
   </tbody></table></div>
  <?php
  $available = 0;
  foreach ( $sources as $source ) {
   if ( ! is_array( $source ) ) { continue; }
   $key = isset( $source['set'] ) ? (string) $source['set'] : '';
   if ( '' === $key || ! isset( $imports[ $key ] ) ) { $available++; }
  }
  if ( $available ) : ?>
   <div class="hscard-hint">아직 가져오지 않은 JSON이 <?php echo esc_html( number_format_i18n( $available ) ); ?>개 있습니다. <a href="<?php echo esc_url( $this->admin_url( array( 'tab' => 'sources' ) ) ); ?>">JSON 관리에서 가져오기</a></div>
  <?php endif;
 }

 private function render_set_form( $editing, array $imports, array $sources ) {
  $existing = '' !== $editing && isset( $imports[ $editing ] ) && is_array( $imports[ $editing ] ) ? $imports[ $editing ] : array();
  $current = $existing ? $this->linked_source_id( $editing, $existing, $sources ) : '';
  $automatic_id = isset( $sources[ $current ] ) ? Json_Sources::repository_set_id( $sources[ $current ] ) : '';
  ?>
  <a class="hscard-back" href="<?php echo esc_url( $this->admin_url( array( 'tab' => 'sets' ) ) ); ?>">&larr; 카드 세트 목록</a>
  <div class="hscard-panel hscard-form-panel">
   <h2><?php echo $existing ? '카드 세트 설정' : '카드 세트 추가'; ?></h2>
   <p class="hscard-panel-lead"><?php echo $existing ? '이름이나 연결된 JSON을 변경합니다.' : '빈 카드 세트를 만듭니다. JSON을 가져와야 실제 카드가 등록됩니다.'; ?></p>
   <form method="post" action="<?php echo esc_url( $this->post_url() ); ?>">
    <input type="hidden" name="action" value="hscard_save_set"><input type="hidden" name="original_set" value="<?php echo esc_attr( $existing ? $editing : '' ); ?>">
    <?php wp_nonce_field( 'hscard_save_set' ); ?>
    <div class="hscard-form-stack">
     <div class="hscard-field"><label for="hscard-set-label">표시 이름</label><input id="hscard-set-label" class="regular-text" name="set_label" maxlength="100" value="<?php echo esc_attr( isset( $existing['label'] ) ? $existing['label'] : ( $existing ? $editing : '' ) ); ?>" placeholder="예: 시간의 길"></div>
     <div class="hscard-field"><label for="hscard-set-key">세트 ID</label><input id="hscard-set-key" class="regular-text code" name="set_key" maxlength="100" value="<?php echo esc_attr( $existing ? $editing : '' ); ?>" <?php echo $existing ? 'readonly' : 'required data-hscard-auto-set'; ?> placeholder="예: Across-The-Timeways"><p class="hscard-help" data-hscard-set-help><?php echo '' !== $automatic_id ? '저장소 이름으로 자동 지정됩니다.' : ( $existing ? '기존 세트 ID는 유지됩니다.' : '저장소 연결을 선택하면 ID가 자동으로 입력됩니다.' ); ?></p></div>
     <div class="hscard-field"><label for="hscard-set-source">연결된 JSON</label><select id="hscard-set-source" name="source_id"><option value="">연결 없음</option>
      <?php foreach ( $sources as $id => $source ) : if ( ! is_array( $source ) ) { continue; } ?><option value="<?php echo esc_attr( $id ); ?>" data-set-id="<?php echo esc_attr( Json_Sources::repository_set_id( $source ) ); ?>" <?php selected( $current, $id ); ?>><?php echo esc_html( $source['label'] ); ?></option><?php endforeach; ?>
     </select></div>
    </div>
    <div class="hscard-form-actions"><?php submit_button( $existing ? '변경 사항 저장' : '빈 세트 추가', 'primary', 'submit', false ); ?><a class="button" href="<?php echo esc_url( $this->admin_url( array( 'tab' => 'sets' ) ) ); ?>">취소</a></div>
   </form>
  </div>
  <?php
 }

 private function render_sources( array $sources, array $imports ) {
  $editing = $this->query( 'edit_source' );
  $json_id = $this->query( 'edit_json' );
  $dated_id = $this->query( 'edit_dated_source' );
  $removing = $this->query( 'delete_source' );
  if ( '' !== $removing && isset( $sources[ $removing ] ) ) { $this->confirm_delete_source( $removing, $sources[ $removing ] ); return; }
  if ( '' !== $json_id && isset( $sources[ $json_id ] ) ) { $this->render_json_editor( $json_id, $sources[ $json_id ] ); return; }
  if ( '' !== $dated_id && isset( $sources[ $dated_id ] ) ) { $this->render_dated_editor( $dated_id, $sources[ $dated_id ] ); return; }
  if ( ( '' !== $editing && isset( $sources[ $editing ] ) ) || 'new' === $this->query( 'view' ) ) {
   $existing = isset( $sources[ $editing ] ) && is_array( $sources[ $editing ] ) ? $sources[ $editing ] : array();
   $this->render_source_form( $editing, $existing );
   return;
  }
  $search = $this->query( 's' );
  ?>
  <div class="hscard-section-head">
   <div><h2>JSON 관리</h2><p>카드를 가져오거나 JSON을 직접 수정할 수 있습니다.</p></div>
   <a class="button button-primary" href="<?php echo esc_url( $this->admin_url( array( 'tab' => 'sources', 'view' => 'new' ) ) ); ?>">+ JSON 추가</a>
  </div>
  <?php $this->render_search( 'sources', $search ); ?>
  <span class="hscard-order-status" data-hscard-order-status role="status" aria-live="polite"></span>
  <div class="hscard-table-wrap"><table class="widefat hscard-table">
   <thead><tr><th scope="col">확장팩</th><th scope="col">카드</th><th scope="col">상태</th><th scope="col">작업</th></tr></thead><tbody data-hscard-source-order data-order-url="<?php echo esc_url( admin_url( 'admin-ajax.php' ) ); ?>" data-order-nonce="<?php echo esc_attr( wp_create_nonce( 'hscard_reorder_sources' ) ); ?>">
   <?php $listed = 0; foreach ( $sources as $id => $source ) :
    if ( ! Json_Sources::is_valid_id( $id ) || ! is_array( $source ) ) { continue; }
    $label = isset( $source['label'] ) ? (string) $source['label'] : $id;
    $url = Json_Sources::url( $id, $source );
    $key = isset( $source['set'] ) ? (string) $source['set'] : '';
    if ( '' !== $search && false === stripos( $label . ' ' . $id . ' ' . $url . ' ' . $key, $search ) ) { continue; }
    $listed++;
    $count = isset( $imports[ $key ]['count'] ) ? absint( $imports[ $key ]['count'] ) : absint( isset( $source['count'] ) ? $source['count'] : 0 );
    $updated = isset( $imports[ $key ]['updated_at'] ) ? absint( $imports[ $key ]['updated_at'] ) : absint( isset( $source['updated_at'] ) ? $source['updated_at'] : 0 );
    ?>
    <tr data-source-id="<?php echo esc_attr( $id ); ?>">
     <td data-label="확장팩"><div class="hscard-source-name"><button type="button" class="hscard-sort-handle" aria-label="<?php echo esc_attr( $label . ' 순서 이동' ); ?>" title="드래그하거나 위·아래 방향키로 이동"><span class="dashicons dashicons-menu" aria-hidden="true"></span></button><strong class="hscard-item-name"><?php echo esc_html( $label ); ?></strong></div></td>
     <td data-label="카드"><?php if ( $count || $updated ) : ?><strong><?php echo esc_html( number_format_i18n( $count ) ); ?>장</strong><?php else : ?><span class="hscard-muted">가져오기 전</span><?php endif; ?></td>
     <td data-label="상태"><span class="hscard-usage <?php echo ! empty( $source['enabled'] ) ? 'is-enabled' : 'is-disabled'; ?>"><?php echo ! empty( $source['enabled'] ) ? '사용 중' : '중지'; ?></span></td>
     <td data-label="작업"><div class="hscard-actions">
      <?php $this->action_form( self::ACTION, '가져오기', array( 'source_id' => $id ) ); ?>
      <a class="button" href="<?php echo esc_url( $this->admin_url( array( 'tab' => 'sources', 'edit_json' => $id ) ) ); ?>">세트 목록 편집</a>
      <a class="button" href="<?php echo esc_url( $this->admin_url( array( 'tab' => 'sources', 'edit_dated_source' => $id ) ) ); ?>">날짜별 카드 JSON</a>
      <details class="hscard-row-more"><summary>더보기</summary><div class="hscard-more-content">
       <button type="button" class="hscard-order-move" data-hscard-move="up">위로 이동</button>
       <button type="button" class="hscard-order-move" data-hscard-move="down">아래로 이동</button>
       <a href="<?php echo esc_url( $this->admin_url( array( 'tab' => 'sources', 'edit_source' => $id ) ) ); ?>">연결 설정</a>
       <a href="<?php echo esc_url( wp_nonce_url( add_query_arg( array( 'action' => 'hscard_export_json', 'source_id' => $id ), $this->post_url() ), 'hscard_export_json' ) ); ?>">JSON 다운로드</a>
       <?php if ( '' !== $url ) : ?><a href="<?php echo esc_url( $url ); ?>" target="_blank" rel="noopener noreferrer">JSON 주소 열기 <span aria-hidden="true">↗</span></a><?php endif; ?>
       <span class="hscard-more-divider" aria-hidden="true"></span>
       <a class="hscard-delete-link" href="<?php echo esc_url( $this->admin_url( array( 'tab' => 'sources', 'delete_source' => $id ) ) ); ?>">JSON 연결 삭제</a>
      </div></details>
     </div></td>
    </tr>
   <?php endforeach; if ( 0 === $listed ) : ?><tr><td colspan="4"><div class="hscard-empty"><strong><?php echo '' === $search ? '등록된 JSON이 없습니다.' : '검색 결과가 없습니다.'; ?></strong><p><?php echo '' === $search ? 'URL 연결, 파일 업로드 또는 직접 입력으로 추가할 수 있습니다.' : '다른 이름이나 식별자로 검색해 보세요.'; ?></p><?php if ( '' !== $search ) : ?><a href="<?php echo esc_url( $this->admin_url( array( 'tab' => 'sources' ) ) ); ?>">전체 목록 보기</a><?php else : ?><a class="button" href="<?php echo esc_url( $this->admin_url( array( 'tab' => 'sources', 'view' => 'new' ) ) ); ?>">+ JSON 추가</a><?php endif; ?></div></td></tr><?php endif; ?>
   </tbody></table></div>
   <?php if ( count( array_filter( $sources, static function ( $source ) { return is_array( $source ) && ! empty( $source['enabled'] ); } ) ) > Json_Sources::FRONTEND_LIMIT ) : ?><div class="notice notice-warning inline"><p>사용 중인 JSON이 <?php echo absint( Json_Sources::FRONTEND_LIMIT ); ?>개를 초과했습니다. 렌더러는 앞쪽 <?php echo absint( Json_Sources::FRONTEND_LIMIT ); ?>개만 참조하므로 필요하지 않은 소스를 중지하세요.</p></div><?php endif; ?>
  <?php
 }

 /** Manage individual dates-v1 files separately from the cards.json inventory. */
 private function render_dated_editor( $source_id, array $source ) {
  $card_id = $this->query( 'card_id' );
  $is_local = 'local' === ( isset( $source['mode'] ) ? $source['mode'] : '' );
  $valid_card = preg_match( '/\A[A-Za-z0-9_]{1,96}\z/D', $card_id );
  $raw = $is_local && $valid_card ? Json_Sources::card_content( $source_id, $card_id ) : '';
  $url = $valid_card ? Json_Sources::card_url( $source_id, $source, $card_id ) : '';
  ?>
  <a class="hscard-back" href="<?php echo esc_url( $this->admin_url( array( 'tab' => 'sources' ) ) ); ?>">&larr; JSON 관리</a>
  <div class="hscard-panel hscard-editor-panel">
   <h2>날짜별 카드 JSON — <?php echo esc_html( isset( $source['label'] ) ? $source['label'] : $source_id ); ?></h2>
   <p>개별 카드 경로 <code>data/카드ID.json</code>의 날짜 최상위 키만 지원합니다. 기존 <code>card</code>·<code>patches</code> 구조는 사용할 수 없습니다.</p>
   <form method="get" action="<?php echo esc_url( admin_url( 'admin.php' ) ); ?>">
    <input type="hidden" name="page" value="<?php echo esc_attr( self::PAGE ); ?>">
    <input type="hidden" name="tab" value="sources">
    <input type="hidden" name="edit_dated_source" value="<?php echo esc_attr( $source_id ); ?>">
    <label for="hscard-card-id">카드 ID</label>
    <input id="hscard-card-id" class="regular-text" name="card_id" value="<?php echo esc_attr( $card_id ); ?>" placeholder="EX1_116" pattern="[A-Za-z0-9_]+" required>
    <?php submit_button( '열기', 'secondary', 'submit', false ); ?>
   </form>
   <?php if ( $valid_card ) : ?>
    <p>실제 카드 JSON 주소: <a href="<?php echo esc_url( $url ); ?>" target="_blank" rel="noopener noreferrer"><?php echo esc_html( $url ); ?></a></p>
    <?php if ( $is_local ) : ?>
     <form method="post" action="<?php echo esc_url( $this->post_url() ); ?>">
      <input type="hidden" name="action" value="hscard_save_dated_card">
      <input type="hidden" name="source_id" value="<?php echo esc_attr( $source_id ); ?>">
      <input type="hidden" name="card_id" value="<?php echo esc_attr( $card_id ); ?>">
      <?php wp_nonce_field( 'hscard_save_dated_card' ); ?>
      <p><label for="hscard-dated-content">카드 날짜별 JSON 내용</label></p>
      <textarea class="large-text code" id="hscard-dated-content" name="dated_json" rows="21" spellcheck="false" required><?php echo esc_textarea( $raw ? $raw : "{\n  \"2013-08-17\": {\n    \"name\": \"카드 이름\",\n    \"type\": \"MINION\",\n    \"mana\": 1\n  }\n}" ); ?></textarea>
      <?php submit_button( '날짜별 JSON 저장' ); ?>
     </form>
    <?php else : ?>
     <p>GitHub 등 원격 소스는 여기서 편집하지 않습니다. 저장소의 <code>data/<?php echo esc_html( $card_id ); ?>.json</code> 파일을 수정한 뒤 새로고침하면 적용됩니다.</p>
    <?php endif; ?>
   <?php endif; ?>
  </div>
  <?php
 }

 public function save_dated_card() {
  $this->check_action( 'hscard_save_dated_card' );
  $source_id = $this->source_id();
  $code = $this->post( 'card_id' );
  $sources = Json_Sources::all();
  if ( ! isset( $sources[ $source_id ] ) || 'local' !== ( isset( $sources[ $source_id ]['mode'] ) ? $sources[ $source_id ]['mode'] : '' ) ) {
   $this->finish( true, '원격 소스는 개별 카드 JSON을 WordPress에서 직접 수정할 수 없습니다.' );
  }
  $content = $this->post( 'dated_json' );
  if ( ! Json_Sources::save_card_content( $source_id, $code, $content ) ) {
   $this->finish( true, '날짜별 JSON 형식이 올바르지 않습니다. 최초 날짜의 전체 정보와 변경 날짜를 확인하세요.' );
  }
  $this->finish( false, '개별 카드 날짜 JSON을 저장했습니다. 다른 날짜의 정보는 별도 기록에서 누적 복원됩니다.' );
 }

 private function render_source_form( $editing, array $existing ) {
  $is_edit = ! empty( $existing );
  ?>
  <a class="hscard-back" href="<?php echo esc_url( $this->admin_url( array( 'tab' => 'sources' ) ) ); ?>">&larr; JSON 관리</a>
  <div class="hscard-panel hscard-form-panel">
   <h2><?php echo $is_edit ? 'JSON 연결 설정' : 'JSON 추가'; ?></h2>
   <p class="hscard-panel-lead"><?php echo $is_edit ? '이름, URL과 사용 여부를 변경합니다. 카드를 새로 가져오려면 목록에서 가져오기를 누르세요.' : '가져올 JSON의 방식을 선택하세요.'; ?></p>
   <form method="post" enctype="multipart/form-data" action="<?php echo esc_url( $this->post_url() ); ?>" data-hscard-source-form>
    <input type="hidden" name="action" value="hscard_save_source"><input type="hidden" name="source_id" value="<?php echo esc_attr( $is_edit ? $editing : '' ); ?>">
    <?php wp_nonce_field( 'hscard_save_source' ); ?>
    <div class="hscard-form-stack">
     <div class="hscard-field"><label for="hscard-source-label">이름 <span class="hscard-required" aria-hidden="true">*</span></label><input id="hscard-source-label" name="source_label" class="regular-text" required maxlength="100" value="<?php echo esc_attr( isset( $existing['label'] ) ? $existing['label'] : '' ); ?>" placeholder="예: 시간의 길"></div>
     <?php if ( ! $is_edit ) : ?>
      <fieldset class="hscard-method-choices" data-hscard-methods><legend>추가 방식</legend>
       <label><input type="radio" name="hscard_add_method" value="url" checked> 저장소 연결</label>
       <label><input type="radio" name="hscard_add_method" value="file"> 파일 업로드</label>
       <label><input type="radio" name="hscard_add_method" value="text"> 직접 입력</label>
      </fieldset>
     <?php endif; ?>
     <div class="hscard-field" <?php echo $is_edit ? '' : 'data-hscard-mode-panel="url"'; ?>>
      <?php if ( $is_edit ) : ?>
      <label for="hscard-source-url">원격 JSON URL</label>
      <input id="hscard-source-url" name="source_url" class="large-text" type="url" inputmode="url" autocomplete="off" value="<?php echo esc_attr( isset( $existing['url'] ) ? $existing['url'] : '' ); ?>" placeholder="https://raw.githubusercontent.com/.../cards.json">
      <p class="hscard-help">원격 파일 주소입니다. 로컬 JSON으로 편집한 경우에도 원래 주소를 유지할 수 있습니다.</p>
      <?php else : ?>
      <label for="hscard-source-repository">저장소 이름 <span class="hscard-required" aria-hidden="true">*</span></label>
      <input id="hscard-source-repository" name="source_repository" class="large-text" type="text" autocomplete="off" autocapitalize="none" spellcheck="false" maxlength="100" pattern="[A-Za-z0-9_.\x2D]{1,100}" placeholder="예: Curse-of-Naxxramas" data-repository-prefix="<?php echo esc_attr( Json_Sources::REPOSITORY_PREFIX ); ?>" data-repository-suffix="<?php echo esc_attr( Json_Sources::REPOSITORY_SUFFIX ); ?>" aria-describedby="hscard-repository-url">
      <output id="hscard-repository-url" class="hscard-help hscard-repository-url" for="hscard-source-repository" hidden></output>
      <?php endif; ?>
     </div>
     <?php if ( ! $is_edit ) : ?>
      <div class="hscard-field" data-hscard-mode-panel="file"><label for="hscard-source-file">JSON 파일 <span class="hscard-required" aria-hidden="true">*</span></label>
       <input id="hscard-source-file" name="json_file" type="file" accept=".json,application/json"><p class="hscard-help">.json 파일을 선택하세요. 저장하면 카드도 바로 등록됩니다.</p></div>
      <div class="hscard-field" data-hscard-mode-panel="text"><label for="hscard-source-text">JSON 내용 <span class="hscard-required" aria-hidden="true">*</span></label>
       <textarea id="hscard-source-text" name="json_text" class="large-text code" rows="14" spellcheck="false" placeholder='{"schema":1,"set":"My Set","cards":[{"id":"TEST_001","dbfId":100001,"name":"테스트 카드","type":"MINION","cost":1}]}'></textarea><p class="hscard-help">JSON 원문을 붙여넣으세요. 저장하면 카드도 바로 등록됩니다.</p><span class="hscard-validation" data-hscard-validation role="status" aria-live="polite"></span></div>
     <?php endif; ?>
    </div>
    <details class="hscard-advanced"><summary>고급 설정</summary><div class="hscard-advanced-content">
     <div class="hscard-field"><label for="hscard-source-art">원화 기준 JSON 주소</label><input id="hscard-source-art" class="large-text" type="url" name="source_art_base" value="<?php echo esc_attr( isset( $existing['art_base'] ) ? $existing['art_base'] : '' ); ?>" placeholder="https://raw.githubusercontent.com/.../cards.json"><p class="hscard-help">선택 사항. 원화 파일의 상대 경로를 해석할 기준입니다.</p></div>
    </div></details>
    <label class="hscard-checkbox"><input type="checkbox" name="source_enabled" value="1" <?php checked( ! $is_edit || ! empty( $existing['enabled'] ) ); ?>> 웹사이트에서 이 JSON 사용</label>
    <div class="hscard-form-actions"><?php submit_button( $is_edit ? '설정 저장' : 'JSON 추가', 'primary', 'submit', false ); ?><a class="button" href="<?php echo esc_url( $this->admin_url( array( 'tab' => 'sources' ) ) ); ?>">취소</a></div>
   </form>
  </div>
  <?php
 }

 private function render_search( $tab, $search ) {
  ?><form class="hscard-search" action="<?php echo esc_url( admin_url( 'admin.php' ) ); ?>" method="get" role="search">
    <input type="hidden" name="page" value="<?php echo esc_attr( self::PAGE ); ?>"><input type="hidden" name="tab" value="<?php echo esc_attr( $tab ); ?>">
    <label for="hscard-search-field" class="screen-reader-text">목록 검색</label><input id="hscard-search-field" type="search" name="s" value="<?php echo esc_attr( $search ); ?>" placeholder="<?php echo 'sets' === $tab ? '세트 이름이나 식별자 검색' : '확장팩 이름 검색'; ?>"><button type="submit" class="button">검색</button>
    <?php if ( '' !== $search ) : ?><a class="button button-link" href="<?php echo esc_url( $this->admin_url( array( 'tab' => $tab ) ) ); ?>">초기화</a><?php endif; ?>
   </form><?php
 }
 private function action_form( $action, $label, array $fields = array(), $confirm = '' ) {
  ?><form class="hscard-inline" method="post" action="<?php echo esc_url( $this->post_url() ); ?>" <?php if ( '' !== $confirm ) : ?>data-hscard-confirm="<?php echo esc_attr( $confirm ); ?>"<?php endif; ?>>
   <input type="hidden" name="action" value="<?php echo esc_attr( $action ); ?>">
   <?php foreach ( $fields as $key => $value ) : ?><input type="hidden" name="<?php echo esc_attr( $key ); ?>" value="<?php echo esc_attr( $value ); ?>"><?php endforeach; ?>
   <?php wp_nonce_field( $action ); ?><button type="submit" class="button"><?php echo esc_html( $label ); ?></button>
  </form><?php
 }

 private function render_json_editor( $id, array $source ) {
  $local = isset( $source['mode'] ) && 'local' === $source['mode'];
  $raw = $local ? Json_Sources::content( $id ) : ( ! empty( $source['url'] ) ? $this->api()->fetch_raw( $source['url'] ) : '' );
  ?>
  <a class="hscard-back" href="<?php echo esc_url( $this->admin_url( array( 'tab' => 'sources' ) ) ); ?>">&larr; JSON 관리</a>
  <div class="hscard-panel hscard-editor-panel">
   <div class="hscard-editor-heading"><div><h2><?php echo esc_html( $source['label'] ); ?></h2><p class="hscard-panel-lead">JSON 원문 편집</p></div>
    <a class="button" href="<?php echo esc_url( wp_nonce_url( add_query_arg( array( 'action' => 'hscard_export_json', 'source_id' => $id ), $this->post_url() ), 'hscard_export_json' ) ); ?>">JSON 다운로드</a>
   </div>
   <p class="hscard-editor-note">저장하면 사이트에 바로 반영됩니다. <strong>GitHub 원본은 변경되지 않습니다.</strong><?php if ( ! $local ) : ?> 첫 저장 시 로컬 사본이 만들어집니다.<?php endif; ?></p>
   <?php if ( is_wp_error( $raw ) ) : ?><div class="notice notice-error inline"><p><?php echo esc_html( $raw->get_error_message() ); ?> 내용을 직접 붙여넣거나 파일로 교체할 수 있습니다.</p></div><?php $raw = ''; endif; ?>
   <form method="post" enctype="multipart/form-data" action="<?php echo esc_url( $this->post_url() ); ?>" data-hscard-json-form>
    <input type="hidden" name="action" value="hscard_save_json"><input type="hidden" name="source_id" value="<?php echo esc_attr( $id ); ?>">
    <?php wp_nonce_field( 'hscard_save_json' ); ?>
    <div class="hscard-editor-toolbar"><label for="hscard-json-text">JSON 내용</label><button type="button" class="button" data-hscard-validate>형식 검사</button><span class="hscard-validation" data-hscard-validation role="status" aria-live="polite"></span></div>
    <textarea id="hscard-json-text" name="json_text" rows="22" class="large-text code hscard-json-editor" spellcheck="false" aria-describedby="hscard-editor-tip"><?php echo esc_textarea( $raw ); ?></textarea>
    <p class="hscard-help" id="hscard-editor-tip">최대 16MB · 카드 1~5,000장. 파일을 선택하면 입력한 텍스트보다 우선합니다.</p>
    <details class="hscard-advanced"><summary>파일로 교체 · 원화 경로 설정</summary><div class="hscard-advanced-content">
     <div class="hscard-field"><label for="hscard-json-file">JSON 파일로 교체</label><input id="hscard-json-file" type="file" accept=".json,application/json" name="json_file"></div>
     <div class="hscard-field"><label for="hscard-editor-art">원화 기준 JSON 주소</label><input id="hscard-editor-art" type="url" name="source_art_base" class="large-text" value="<?php echo esc_attr( ! empty( $source['art_base'] ) ? $source['art_base'] : ( isset( $source['url'] ) ? $source['url'] : '' ) ); ?>" placeholder="https://raw.githubusercontent.com/.../cards.json"><p class="hscard-help">원화 상대 경로의 기준이 되는 주소입니다.</p></div>
    </div></details>
    <div class="hscard-form-actions"><?php submit_button( '저장하고 카드 반영', 'primary', 'submit', false ); ?><a class="button" href="<?php echo esc_url( $this->admin_url( array( 'tab' => 'sources' ) ) ); ?>">취소</a></div>
   </form>
   <?php if ( $local && ! empty( $source['url'] ) ) : ?>
    <details class="hscard-advanced hscard-danger-zone"><summary>원격 JSON으로 되돌리기</summary><div class="hscard-advanced-content">
     <p class="hscard-help">현재 로컬 사본을 삭제하고 원격 URL의 카드 데이터로 교체합니다. 필요하면 먼저 JSON을 다운로드하세요.</p>
     <?php $this->action_form( 'hscard_revert_json', '원격 버전 복원', array( 'source_id' => $id ), '로컬 JSON 변경 사항을 버리고 원격 버전으로 교체할까요?' ); ?>
    </div></details>
   <?php endif; ?>
  </div><?php
 }

 private function confirm_delete_set( $set, $item ) {
  $tracked = isset( $item['cards'] ) && is_array( $item['cards'] ) ? count( $item['cards'] ) : 0;
  $pending = isset( $item['pending_cards'] ) && is_array( $item['pending_cards'] ) ? count( $item['pending_cards'] ) : 0;
  ?><a class="hscard-back" href="<?php echo esc_url( $this->admin_url( array( 'tab' => 'sets' ) ) ); ?>">&larr; 카드 세트 목록</a>
  <div class="hscard-panel hscard-confirm-panel"><h2>카드 세트를 삭제할까요?</h2><p><strong><?php echo esc_html( $set ); ?></strong> 세트가 삭제됩니다.</p>
   <?php if ( $tracked + $pending ) : ?><p>추적된 카드 <?php echo absint( $tracked + $pending ); ?>장 중 다른 세트에서 사용하지 않는 카드만 DB에서 삭제합니다. 다른 세트의 카드와 덱 코드는 보존됩니다.</p>
   <?php else : ?><div class="notice notice-warning inline"><p>이 세트는 카드 ID 추적 정보가 없어 <strong>세트 기록만 삭제</strong>하며 이전 카드 DB 행은 보존합니다.</p></div><?php endif; ?>
   <?php if ( ( $tracked + $pending ) && $this->has_untracked_sets( $this->imports(), array( $set ) ) ) : ?><div class="notice notice-warning inline"><p>다른 구버전 세트에 카드 ID 추적 정보가 없어 중복 삭제 방지를 위해 카드 DB 행을 보존합니다. 각 세트를 재가져와 추적 정보를 만들면 안전하게 정리할 수 있습니다.</p></div><?php endif; ?>
   <form method="post" action="<?php echo esc_url( $this->post_url() ); ?>">
    <input type="hidden" name="action" value="hscard_delete_set"><input type="hidden" name="set_key" value="<?php echo esc_attr( $set ); ?>">
    <?php wp_nonce_field( 'hscard_delete_set' ); ?>
    <div class="hscard-form-actions"><?php submit_button( '세트 삭제', 'delete', 'submit', false ); ?><a class="button" href="<?php echo esc_url( $this->admin_url( array( 'tab' => 'sets' ) ) ); ?>">취소</a></div>
   </form>
  </div><?php
 }
 private function confirm_delete_source( $id, array $source ) {
  ?><a class="hscard-back" href="<?php echo esc_url( $this->admin_url( array( 'tab' => 'sources' ) ) ); ?>">&larr; JSON 관리</a>
  <div class="hscard-panel hscard-confirm-panel"><h2>JSON 연결을 삭제할까요?</h2><p><strong><?php echo esc_html( $source['label'] ); ?></strong>의 연결이 삭제됩니다. 이 사이트에 저장한 해당 로컬 JSON도 제거됩니다.</p>
   <p>이미 가져온 카드와 카드 세트는 유지됩니다. 세트 삭제는 별도로 진행해야 합니다.</p>
   <form method="post" action="<?php echo esc_url( $this->post_url() ); ?>">
    <input type="hidden" name="action" value="hscard_delete_source"><input type="hidden" name="source_id" value="<?php echo esc_attr( $id ); ?>">
    <?php wp_nonce_field( 'hscard_delete_source' ); ?>
    <div class="hscard-form-actions"><?php submit_button( 'JSON 연결 삭제', 'delete', 'submit', false ); ?><a class="button" href="<?php echo esc_url( $this->admin_url( array( 'tab' => 'sources' ) ) ); ?>">취소</a></div>
   </form>
  </div><?php
 }

 /** Return the catalog link of a legacy import even before its first tracked re-import. */
 private function linked_source_id( $set, array $item, array $sources ) {
  $id = isset( $item['source_id'] ) ? (string) $item['source_id'] : '';
  if ( isset( $sources[ $id ] ) ) { return $id; }
  if ( array_key_exists( 'source_id', $item ) ) { return ''; } // Explicitly unlinked, not a legacy entry.
  $url = isset( $item['url'] ) ? Json_Sources::legacy_url( $item['url'] ) : '';
  if ( '' !== $url ) {
   foreach ( $sources as $key => $source ) {
    if ( is_array( $source ) && isset( $source['url'] ) && $source['url'] === $url ) { return $key; }
   }
  }
  foreach ( $sources as $key => $source ) {
   if ( is_array( $source ) && isset( $source['set'] ) && $source['set'] === $set ) { return $key; }
  }
  return '';
 }

 /** Select a source, import its document, and keep the old admin-post action valid. */
 public function import_set() {
  $this->check_action( self::ACTION );
  $sources = Json_Sources::all();
  $id = $this->source_id();
  if ( '' === $id ) {
   $url = $this->api()->validate_url( $this->post( 'set_url' ) );
   if ( is_wp_error( $url ) ) { $this->finish_result( $url ); }
   foreach ( $sources as $key => $source ) {
    if ( is_array( $source ) && isset( $source['url'] ) && $source['url'] === $url ) { $id = $key; break; }
   }
   if ( '' === $id ) {
    if ( count( $sources ) >= Json_Sources::MAX_SOURCES ) { $this->finish( true, 'JSON 소스는 최대 100개까지 등록할 수 있습니다.' ); }
    $id = Json_Sources::new_id( $sources );
    $sources[ $id ] = array( 'label' => basename( wp_parse_url( $url, PHP_URL_PATH ) ), 'url' => $url, 'art_base' => '', 'mode' => 'remote', 'enabled' => 1, 'set' => '', 'count' => 0 );
   }
  }
  if ( ! isset( $sources[ $id ] ) || ! is_array( $sources[ $id ] ) ) { $this->finish( true, 'JSON 소스를 찾을 수 없습니다.' ); }
  $source = $sources[ $id ];
  $raw = 'local' === $source['mode'] ? Json_Sources::content( $id ) : $this->api()->fetch_raw( isset( $source['url'] ) ? $source['url'] : '' );
  if ( is_wp_error( $raw ) ) { $this->finish_result( $raw ); }
  $result = $this->apply_document( $id, $source, $raw );
  $this->finish_result( $result, 'sources', is_wp_error( $result ) ? '' : sprintf( '%s 카드 %d장을 가져왔습니다.', $result['set'], $result['count'] ) );
 }

 public function reorder_sources() {
  if ( ! current_user_can( 'manage_options' ) ) { wp_send_json_error( array( 'message' => '관리자 권한이 필요합니다.' ), 403 ); }
  if ( ! isset( $_SERVER['REQUEST_METHOD'] ) || 'POST' !== $_SERVER['REQUEST_METHOD'] ) { wp_send_json_error( array( 'message' => '요청 방식이 올바르지 않습니다.' ), 405 ); }
  check_ajax_referer( 'hscard_reorder_sources', 'nonce' );
  if ( ! isset( $_POST['order'] ) || ! is_array( $_POST['order'] ) ) { wp_send_json_error( array( 'message' => '순서 목록이 올바르지 않습니다.' ), 400 ); }
  $result = Json_Sources::reorder( array_values( wp_unslash( $_POST['order'] ) ) );
  if ( is_wp_error( $result ) ) { wp_send_json_error( array( 'message' => $result->get_error_message() ), 409 ); }
  wp_send_json_success( array( 'order' => $result ) );
 }

 public function save_source() {
  $this->check_action( 'hscard_save_source' );
  $sources = Json_Sources::all();
  $id = $this->source_id();
  $is_edit = '' !== $id && Json_Sources::is_valid_id( $id ) && isset( $sources[ $id ] ) && is_array( $sources[ $id ] );
  if ( '' !== $id && ! $is_edit ) { $this->finish( true, '수정할 JSON 소스가 존재하지 않습니다.' ); }
  if ( ! $is_edit && count( $sources ) >= Json_Sources::MAX_SOURCES ) { $this->finish( true, 'JSON 소스는 최대 100개까지 등록할 수 있습니다.' ); }
  $label = $this->label( $this->post( 'source_label' ) );
  if ( '' === $label ) { $this->finish( true, 'JSON 소스 이름을 입력하세요.' ); }
  $url = $this->post( 'source_url' );
  $repository = '';
  if ( ! $is_edit && isset( $_POST['source_repository'] ) ) {
   if ( in_array( $this->post( 'hscard_add_method' ), array( 'file', 'text' ), true ) ) { $url = ''; }
   else {
    $url = Json_Sources::repository_url( $this->post( 'source_repository' ) );
    if ( is_wp_error( $url ) ) { $this->finish_result( $url ); }
    $repository = trim( $this->post( 'source_repository' ) );
   }
  }
  $art_base = $this->post( 'source_art_base' );
  $api = $this->api();
  if ( '' !== $url ) { $url = $api->validate_url( $url ); if ( is_wp_error( $url ) ) { $this->finish_result( $url ); } }
  if ( '' !== $art_base ) { $art_base = $api->validate_url( $art_base ); if ( is_wp_error( $art_base ) ) { $this->finish_result( $art_base ); } }
  if ( $is_edit ) {
   $source = $sources[ $id ];
   if ( 'local' !== $source['mode'] && '' === $url ) { $this->finish( true, '원격 JSON 소스의 URL을 비울 수 없습니다.' ); }
   $source['label'] = $label;
   $source['url'] = $url;
   $source['art_base'] = $art_base;
   $source['enabled'] = isset( $_POST['source_enabled'] ) ? 1 : 0;
   $sources[ $id ] = $source;
   Json_Sources::save( $sources );
   $this->finish( false, 'JSON 소스 설정을 저장했습니다. 카드 데이터는 가져오기 버튼으로 갱신하세요.' );
  }
  $raw = $this->submitted_json( false );
  if ( is_wp_error( $raw ) ) { $this->finish_result( $raw ); }
  if ( '' === $url && '' === $raw ) { $this->finish( true, '원격 JSON 주소 또는 직접 입력한 JSON이 필요합니다.' ); }
  if ( '' !== $url ) {
   foreach ( $sources as $source ) {
    if ( is_array( $source ) && isset( $source['url'] ) && $source['url'] === $url ) { $this->finish( true, '동일한 JSON 주소가 이미 등록되어 있습니다.' ); }
   }
  }
  $id = Json_Sources::new_id( $sources );
  $source = array( 'label' => $label, 'url' => $url, 'art_base' => $art_base, 'mode' => '' !== $raw ? 'local' : 'remote', 'enabled' => isset( $_POST['source_enabled'] ) ? 1 : 0, 'set' => '', 'count' => 0 );
  if ( '' !== $repository ) { $source['repository'] = $repository; $source['set'] = $repository; }
  if ( '' === $raw ) {
   $sources[ $id ] = $source;
   Json_Sources::save( $sources );
   $this->finish( false, 'JSON URL을 등록했습니다. 목록에서 가져오기를 눌러 카드를 저장할 수 있습니다.' );
  }
  $result = $this->save_and_apply_local( $id, $source, $raw );
  $this->finish_result( $result, 'sources', is_wp_error( $result ) ? '' : sprintf( '%s JSON을 저장하고 카드 %d장을 가져왔습니다.', $result['set'], $result['count'] ) );
 }

 public function save_set() {
  $this->check_action( 'hscard_save_set' );
  $imports = $this->imports();
  $sources = Json_Sources::all();
  $original = $this->post( 'original_set' );
  $set = $this->post( 'set_key' );
  $source_id = $this->source_id();
  if ( '' !== $source_id && ! isset( $sources[ $source_id ] ) ) { $this->finish( true, '선택한 JSON 소스가 없습니다.', 'sets' ); }
  $automatic_id = '' !== $source_id ? Json_Sources::repository_set_id( $sources[ $source_id ] ) : '';
  if ( '' !== $automatic_id ) {
   if ( '' !== $original && $original !== $automatic_id ) { $this->finish( true, '기존 세트 ID와 저장소 이름이 다릅니다. JSON 관리에서 가져오기를 사용하세요.', 'sets' ); }
   $set = $automatic_id;
  }
  if ( ( '' === $automatic_id && ! $this->canonical_set( $set ) ) || ( '' !== $original && ( ! isset( $imports[ $original ] ) || $original !== $set ) ) ) {
   $this->finish( true, '세트 식별자가 올바르지 않습니다.', 'sets' );
  }
  if ( '' === $original && isset( $imports[ $set ] ) ) { $this->finish( true, '같은 세트 식별자가 이미 있습니다.', 'sets' ); }
  if ( '' !== $source_id ) {
   foreach ( $imports as $key => $item ) {
    if ( $key !== $set && is_array( $item ) && $this->linked_source_id( $key, $item, $sources ) === $source_id ) {
     $this->finish( true, '이 JSON 소스는 다른 세트에 이미 연결되어 있습니다.', 'sets' );
    }
   }
  }
  $item = isset( $imports[ $set ] ) && is_array( $imports[ $set ] ) ? $imports[ $set ] : array( 'set' => $set, 'count' => 0, 'cards' => array(), 'pending_cards' => array(), 'identifiers' => array(), 'updated_at' => 0 );
  $item['label'] = $this->label( $this->post( 'set_label' ) );
  $item['source_id'] = $source_id;
  $item['url'] = '' !== $source_id ? Json_Sources::url( $source_id, $sources[ $source_id ] ) : '';
  $imports[ $set ] = $item;
  update_option( self::IMPORTS_OPTION, $imports, false );
  $this->finish( false, '카드 세트 설정을 저장했습니다.', 'sets' );
 }

 public function delete_source() {
  $this->check_action( 'hscard_delete_source' );
  $id = $this->source_id();
  $sources = Json_Sources::all();
  if ( ! isset( $sources[ $id ] ) ) { $this->finish( true, 'JSON 소스를 찾지 못했습니다.' ); }
  $imports = $this->imports();
  foreach ( $imports as $set => $item ) {
   if ( ! is_array( $item ) || $this->linked_source_id( $set, $item, $sources ) !== $id ) { continue; }
   $imports[ $set ]['source_id'] = '';
   $imports[ $set ]['url'] = '';
  }
  unset( $sources[ $id ] );
  Json_Sources::save( $sources );
  update_option( self::IMPORTS_OPTION, $imports, false );
  Json_Sources::delete_content( $id );
  $this->finish( false, 'JSON 소스를 제거했습니다. 가져온 카드 DB는 보존했습니다.' );
 }

 public function delete_set() {
  $this->check_action( 'hscard_delete_set' );
  $set = $this->post( 'set_key' );
  $imports = $this->imports();
  if ( ! isset( $imports[ $set ] ) || ! is_array( $imports[ $set ] ) ) { $this->finish( true, '삭제할 세트가 없습니다.', 'sets' ); }
  $item = $imports[ $set ];
  $refs = isset( $item['cards'] ) && is_array( $item['cards'] ) ? $item['cards'] : array();
  $pending = isset( $item['pending_cards'] ) && is_array( $item['pending_cards'] ) ? $item['pending_cards'] : array();
  $refs = $this->unshared_refs( $refs + $pending, $imports, array( $set ) );
  $sources = Json_Sources::all(); // Snapshot source links before changing legacy import records.
  $result = $refs ? $this->with_lock( function () use ( $refs ) {
   if ( ! Card_Store::maybe_upgrade() ) { return new WP_Error( 'hscard_store', '카드 DB를 준비하지 못했습니다.' ); }
   return ( new Card_Store() )->delete_cards( $refs );
  } ) : 0;
  if ( is_wp_error( $result ) ) { $this->finish_result( $result, 'sets' ); }
  unset( $imports[ $set ] );
  update_option( self::IMPORTS_OPTION, $imports, false );
  foreach ( $sources as $id => $source ) {
   if ( isset( $source['set'] ) && $source['set'] === $set ) {
    $sources[ $id ]['set'] = '';
    $sources[ $id ]['count'] = 0;
    $sources[ $id ]['enabled'] = 0; // Removing a set must not keep serving its stale catalog.
   }
  }
  Json_Sources::save( $sources );
  $msg = empty( $item['cards'] ) && ! empty( $item['count'] ) ? '세트 기록만 삭제했습니다. 예전 카드 DB는 ID 추적 정보가 없어 보존했습니다.' : sprintf( '세트 기록과 추적 카드 %d장을 정리했습니다.', $result );
  do_action( 'hscard_cards_changed', array_keys( $refs ) );
  $msg .= ' 해당 JSON 소스의 렌더러 사용도 중지했습니다.';
  $this->finish( false, $msg, 'sets' );
 }

 public function save_json() {
  $this->check_action( 'hscard_save_json' );
  $id = $this->source_id();
  $sources = Json_Sources::all();
  if ( ! isset( $sources[ $id ] ) ) { $this->finish( true, 'JSON 소스가 없습니다.' ); }
  $raw = $this->submitted_json( true );
  if ( is_wp_error( $raw ) ) { $this->finish_result( $raw ); }
  $source = $sources[ $id ];
  $base = $this->post( 'source_art_base' );
  if ( '' !== $base ) {
   $base = $this->api()->validate_url( $base );
   if ( is_wp_error( $base ) ) { $this->finish_result( $base ); }
  }
  $source['art_base'] = $base;
  $source['mode'] = 'local';
  $result = $this->save_and_apply_local( $id, $source, $raw );
  $this->finish_result( $result, 'sources', is_wp_error( $result ) ? '' : sprintf( '로컬 JSON과 %s 카드 %d장을 저장했습니다.', $result['set'], $result['count'] ) );
 }

 public function revert_json() {
  $this->check_action( 'hscard_revert_json' );
  $id = $this->source_id();
  $sources = Json_Sources::all();
  if ( ! isset( $sources[ $id ] ) || empty( $sources[ $id ]['url'] ) || 'local' !== $sources[ $id ]['mode'] ) { $this->finish( true, '복원할 원격 JSON이 없습니다.' ); }
  $source = $sources[ $id ];
  $raw = $this->api()->fetch_raw( $source['url'] );
  if ( is_wp_error( $raw ) ) { $this->finish_result( $raw ); }
  $source['mode'] = 'remote';
  $result = $this->apply_document( $id, $source, $raw );
  if ( ! is_wp_error( $result ) ) { Json_Sources::delete_content( $id ); }
  $this->finish_result( $result, 'sources', is_wp_error( $result ) ? '' : '원격 JSON으로 복원하고 카드를 다시 가져왔습니다.' );
 }

 public function export_json() {
  $this->check_action( 'hscard_export_json', 'GET' );
  $id = $this->query( 'source_id' );
  $sources = Json_Sources::all();
  if ( ! isset( $sources[ $id ] ) ) { wp_die( esc_html__( 'JSON 소스를 찾지 못했습니다.', 'hscard' ) ); }
  $source = $sources[ $id ];
  $raw = 'local' === $source['mode'] ? Json_Sources::content( $id ) : $this->api()->fetch_raw( $source['url'] );
  if ( is_wp_error( $raw ) || ! is_string( $raw ) || '' === $raw ) { wp_die( esc_html__( 'JSON 파일을 불러오지 못했습니다.', 'hscard' ) ); }
  nocache_headers();
  header( 'Content-Type: application/json; charset=utf-8' );
  header( 'Content-Disposition: attachment; filename="' . $id . '-cards.json"' );
  header( 'X-Content-Type-Options: nosniff' );
  echo $raw; // phpcs:ignore WordPress.Security.EscapeOutput.OutputNotEscaped -- The authorized download is the exact validated source JSON.
  exit;
 }

 /** Uploads take precedence over pasted JSON; no file is written into uploads. */
 private function submitted_json( $required ) {
  $this->api();
  $raw = isset( $_POST['json_text'] ) && is_string( $_POST['json_text'] ) ? wp_unslash( $_POST['json_text'] ) : '';
  if ( isset( $_FILES['json_file'] ) && is_array( $_FILES['json_file'] ) ) {
   $upload = $_FILES['json_file'];
   $error = isset( $upload['error'] ) ? absint( $upload['error'] ) : UPLOAD_ERR_NO_FILE;
   if ( UPLOAD_ERR_NO_FILE !== $error ) {
    if ( UPLOAD_ERR_OK !== $error ) { return $this->fail( 'JSON 업로드에 실패했습니다. 서버의 파일 크기 제한을 확인하세요.' ); }
    $name = isset( $upload['name'] ) ? (string) $upload['name'] : '';
    $tmp = isset( $upload['tmp_name'] ) ? (string) $upload['tmp_name'] : '';
    $size = isset( $upload['size'] ) ? absint( $upload['size'] ) : 0;
    if ( ! preg_match( '/\.json\z/i', $name ) || 0 === $size || $size > Set_API::MAX_BYTES || ! is_uploaded_file( $tmp ) ) { return $this->fail( '유효한 .json 파일(최대 16MB)만 업로드할 수 있습니다.' ); }
    $raw = file_get_contents( $tmp ); // phpcs:ignore WordPress.WP.AlternativeFunctions.file_get_contents_file_get_contents -- PHP-managed validated upload temp file, not a remote URL.
   }
  }
  if ( ! is_string( $raw ) || strlen( $raw ) > Set_API::MAX_BYTES || ( $required && '' === trim( $raw ) ) ) { return $this->fail( 'JSON 내용이 비어 있거나 최대 크기(16MB)를 넘었습니다.' ); }
  return $raw;
 }

 /** Persist the validated local JSON and restore the previous option on failed imports. */
 private function save_and_apply_local( $id, array $source, $raw ) {
  $api = $this->api();
  $base = ! empty( $source['art_base'] ) ? $source['art_base'] : ( isset( $source['url'] ) ? $source['url'] : '' );
  $parsed = $api->parse_json( $raw, $base );
  if ( is_wp_error( $parsed ) ) { return $parsed; }
  $previous = Json_Sources::content( $id );
  if ( ! Json_Sources::save_content( $id, $raw ) ) { return $this->fail( '로컬 JSON 저장에 실패했습니다. 데이터베이스 설정을 확인하세요.' ); }
  $result = $this->apply_document( $id, $source, $raw, $parsed );
  if ( is_wp_error( $result ) ) {
   if ( '' === $previous ) { Json_Sources::delete_content( $id ); }
   else { Json_Sources::save_content( $id, $previous ); }
  }
  return $result;
 }

 /** Add or replace an expansion in a single DB transaction, pruning only known ownership. */
 private function apply_document( $id, array $source, $raw, $parsed = null ) {
  $api = $this->api();
  $base = ! empty( $source['art_base'] ) ? $source['art_base'] : ( isset( $source['url'] ) ? $source['url'] : '' );
  $data = null === $parsed ? $api->parse_json( $raw, $base ) : $parsed;
  if ( is_wp_error( $data ) ) { return $data; }
  return $this->with_lock( function () use ( $id, $source, $data ) {
   if ( ! Card_Store::maybe_upgrade() ) { return new WP_Error( 'hscard_store', '카드 저장소를 준비하지 못했습니다.' ); }
   $imports = $this->imports();
   $sources = Json_Sources::all();
   // Repository-managed sources keep their ID even when the document label changes.
   $old_set = '';
   foreach ( $imports as $key => $item ) {
    if ( is_array( $item ) && $this->linked_source_id( $key, $item, $sources ) === $id ) {
     if ( '' !== $old_set && $old_set !== $key ) { return new WP_Error( 'hscard_multi_set', '하나의 JSON에 둘 이상의 카드 세트가 연결돼 있습니다. 연결을 정리하세요.' ); }
     $old_set = $key;
    }
   }
   $automatic_id = Json_Sources::repository_set_id( $source );
   $set = '' !== $automatic_id ? $automatic_id : $data['set'];
   if ( isset( $imports[ $set ] ) && $set !== $old_set && $this->linked_source_id( $set, $imports[ $set ], $sources ) !== $id ) {
    return new WP_Error( 'hscard_set_conflict', '동일한 세트 이름이 다른 JSON 소스에 연결되어 있습니다. 세트 설정에서 연결을 수정하세요.' );
   }
   $previous = '' !== $old_set && isset( $imports[ $old_set ] ) ? $imports[ $old_set ] : ( isset( $imports[ $set ] ) ? $imports[ $set ] : array() );
   $old_refs = isset( $previous['cards'] ) && is_array( $previous['cards'] ) ? $previous['cards'] : array();
   $old_pending = isset( $previous['pending_cards'] ) && is_array( $previous['pending_cards'] ) ? $previous['pending_cards'] : array();
   $old_refs = $old_refs + $old_pending;
   $new_refs = array();
   $ids = array();
   foreach ( $data['cards'] as $card ) { $new_refs[ $card['id'] ] = $card['card_code']; $ids[] = $card['id']; }
   $store = new Card_Store();
   $existing = $store->find_cards( $ids );
   $codes = $store->find_code_ids( array_column( $data['cards'], 'card_code' ) );
   if ( is_wp_error( $codes ) ) { return $codes; }
   foreach ( $data['cards'] as $card ) {
    // Older imported records may have a DBF ID but no stored string card ID.
    // Fill that missing identity from this JSON, but never replace a different known code.
    if ( isset( $existing[ $card['id'] ] ) && '' !== $existing[ $card['id'] ]['card_code'] && $existing[ $card['id'] ]['card_code'] !== $card['card_code'] ) {
     return new WP_Error( 'hscard_dbf_collision', 'DBF ID 충돌: ' . $card['id'] . '. 기존 카드 ID (' . $existing[ $card['id'] ]['card_code'] . ')와 가져올 카드 ID (' . $card['card_code'] . ')가 일치하지 않아 적용하지 않았습니다.' );
    }
    if ( isset( $codes[ $card['card_code'] ] ) && ( ! isset( $codes[ $card['card_code'] ][ $card['id'] ] ) || count( $codes[ $card['card_code'] ] ) > 1 ) ) {
     return new WP_Error( 'hscard_code_collision', '문자열 카드 ID 충돌: ' . $card['card_code'] . '. 기존 DBF ID와 일치하지 않아 적용하지 않았습니다.' );
    }
   }
   $candidates = array_diff_key( $old_refs, $new_refs );
   $removed = $this->unshared_refs( $candidates, $imports, array( $old_set, $set ) );
   $pending = array_diff_key( $candidates, $removed );
   $result = $store->save_cards( $data['cards'], $removed );
   if ( is_wp_error( $result ) ) { return $result; }
   if ( '' !== $old_set && $old_set !== $set ) { unset( $imports[ $old_set ] ); }
   $imports[ $set ] = array(
    'set' => $set, 'label' => ! empty( $previous['label'] ) ? $previous['label'] : $source['label'],
    'count' => $result, 'url' => Json_Sources::url( $id, $source ), 'source_id' => $id,
    'identifiers' => $data['identifiers'], 'cards' => $new_refs, 'pending_cards' => $pending, 'updated_at' => time(),
   );
   update_option( self::IMPORTS_OPTION, $imports, false );
   $source['set'] = $set;
   $source['count'] = $result;
   $source['updated_at'] = time();
   $sources[ $id ] = $source;
   Json_Sources::save( $sources );
   do_action( 'hscard_cards_changed', array_unique( array_merge( $ids, array_keys( $removed ) ) ) );
   return array( 'set' => $set, 'count' => $result, 'pruned' => count( $removed ) );
  } );
 }

 /** Protect rows referenced by another tracked set, even if the sets overlap. */
 private function has_untracked_sets( array $imports, array $excluded ) {
  foreach ( $imports as $set => $item ) {
   if ( in_array( $set, $excluded, true ) || ! is_array( $item ) ) { continue; }
   if ( ( ! isset( $item['cards'] ) || ! is_array( $item['cards'] ) ) && ! empty( $item['count'] ) ) { return true; }
  }
  return false;
 }

 private function unshared_refs( array $refs, array $imports, array $excluded ) {
  if ( $this->has_untracked_sets( $imports, $excluded ) ) { return array(); }
  foreach ( $imports as $set => $item ) {
   if ( in_array( $set, $excluded, true ) || ! is_array( $item ) ) { continue; }
   if ( ! empty( $item['cards'] ) && is_array( $item['cards'] ) ) {
    foreach ( $item['cards'] as $dbf => $code ) { unset( $refs[ $dbf ] ); }
   }
  }
  return $refs;
 }

 /** Respect the original MySQL advisory lock shared with previous imports. */
 private function with_lock( $callback ) {
  global $wpdb;
  $database = defined( 'DB_NAME' ) ? (string) DB_NAME : '';
  $lock = self::LOCK_PREFIX . substr( hash( 'sha256', $database . '|' . $wpdb->prefix ), 0, 48 );
  if ( 1 !== (int) $wpdb->get_var( $wpdb->prepare( 'SELECT GET_LOCK(%s, 0)', $lock ) ) ) {
   return $this->fail( '다른 카드 데이터 작업이 진행 중입니다. 잠시 후 다시 시도하세요.' );
  }
  try { return $callback(); }
  finally { $wpdb->get_var( $wpdb->prepare( 'SELECT RELEASE_LOCK(%s)', $lock ) ); }
 }
}
