> 이전 시험판의 기록입니다. 당시 수작업 WGSL 변환은 현재 DXBC/HLSLcc/Naga 빌드로 교체됐습니다. 최신 상태는 WEBGPU-STAGING-STATUS.md를 확인하세요.

# HScard 7.14.2 WebGPU-only 카드 표시 오류 수정 및 검증

## 관찰된 증상
- 카드마다 `카드를 표시할 수 없습니다`가 뜨고, 로딩용 프레임 이미지만 남는 현상.
- 신형 날짜 중심 레거시 카드 JSON(예: `data/EX1_116.json`)은 정상. 기존 7.14.1 플러그인이 모든 실패 사유를 같은 메시지로 표시하여 원인 추적 불가능.

## 소스에서 특정하고 수정한 결함
1. `includes/class-json-sources.php`: 예전 DB에 카드별 `source_id` 연관 기록 및 카드 원화 URL이 없으면 `data/<CARD_ID>.json` 주소를 복원하지 못하는 경로. 기존 가져온 카드의 `native_meta.set`과 현재 사용 중인 API 소스의 `set`이 정확히 하나 일치하면 주소를 복원하도록 변경. 중복 후보는 보수적으로 거부.
2. `assets/unity/webgpu/wgsl-programs.json.gz`: GLSL→WGSL 자동 변환 결과에서 `u_xlat0.xyz = expression;` 형태의 **다중 성분 벡터 대입 19,081회** 발견(1,052개 중 1,004개 프로그램). 표준 WebGPU WGSL에서 선택적 `swizzle_assignment` 확장 없이 유효하지 않으므로, 오른쪽 식을 임시 변수에 **한 번만** 계산하고 `.x`, `.y`, `.z` 등에 개별 대입하도록 수정. 정적 검출 대상 잔여 0개. 변형 수 총 1,052개 유지.
3. `assets/unity/card-snapshots.mjs`: HTTP 브라우저 캐시에 오래된 구형 카드 JSON이 남아 엄격한 신형 구조 검증을 통과하지 못하면, 구형 데이터로 전환하지 않고 `cache:'reload'`로 한 번 재요청. 동일 카드 30개 표시 요청은 공유.
4. `assets/unity/deck-cards.js` 및 CSS: `CARD_SOURCE`, `CARD_HTTP`, `CARD_SCHEMA`, `WEBGPU_SHADER`, `WEBGPU_RUNTIME`, `CARD_ART`, `CARD_FONT` 단계별 오류 표시. 콘솔에 원본 예외 출력, 요소에 `data-hscard-error-code` 기록.
5. `assets/unity/webgpu-native.mjs`: WebGPU 디바이스 오류 기록 및 지원 장치에서 `depth-clip-control`을 선택적 사용. 기존 WebGL 폴백은 추가하지 않음.
6. JS 내부 모듈 버전 쿼리 및 `HSCARD_VERSION`을 7.14.2로 일치시킴.

## 실행 검증
- 신형 JSON 날짜 스냅샷 테스트 **35/35 통과**.
- WP PHP 소스/라우트 연동 테스트 **11/11 통과**.
- 소스 매핑 누락·후보 중복·비활성 소스 테스트 **3/3 통과**.
- 구형 HTTP 캐시 후 신형 재조회·동일 카드 요청 합치기 테스트 **통과**.
- PHP 및 JavaScript 구문 검사 **통과**.
- ZIP 내부 구조/무결성 검사 **통과**.
- 1,052개 중 1,004개에서 19,081 WGSL 대입 구문 수정, 해당 패턴 정적 잔여 0개.

## 아직 검증하지 못한 항목
- 실제 브라우저 WebGPU의 WGSL 1,052개 **전수 컴파일**, 렌더 파이프라인 1,406 후보 **생성 성공 여부**.
- 원본 메쉬/텍스처/셰이더 결과의 **픽셀 일치** 및 황금 카드 3D 애니메이션 재현.
- 운영 HSdeck의 HTML/데이터베이스/네트워크 및 브라우저 GPU를 통한 end-to-end 재현.

이 수정본은 **WebGPU-only STAGING**이다. 카드가 실제로 정상 표시된다고 확정하기 전까지 운영 환경에는 권장하지 않는다. 별도 HTTPS 워드프레스 테스트 사이트에 설치하고 `wp-content/plugins/hscard/assets/unity/webgpu/validator.html`에서 WGSL 컴파일 검사를 수행할 수 있다. 오류 메시지 또는 검사 결과 JSON을 통해 남은 프로그램 수준 오류를 특정할 수 있다.

GitHub `qxwd565/HSdeck-plugin`의 `main`은 이 미검증 버전으로 덮어쓰지 않았다.
