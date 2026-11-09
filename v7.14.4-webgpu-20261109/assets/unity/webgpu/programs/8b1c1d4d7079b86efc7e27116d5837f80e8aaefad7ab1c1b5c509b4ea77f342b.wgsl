struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 13>,
}

struct FragmentOutput {
    @location(0) SV_Target0_: vec4<f32>,
}

@group(1) @binding(31) 
var<uniform> hscard_bias: HScardSamplerBias;
@group(1) @binding(0) 
var<uniform> _f_buffer0_: f_buffer0_;
@group(1) @binding(1) 
var<uniform> _f_buffer1_: f_buffer1_;
@group(3) @binding(1) 
var samplerf_s0_: sampler;
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD1_1: f32;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec3<f32> = vec3(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: f32 = 0f;
    var u_xlat8_: f32 = 0f;
    var u_xlat12_: f32 = 0f;
    var u_xlat14_: f32 = 0f;

    let _e43 = u_xlat0_;
    let _e48 = _f_buffer1_.f_cb1_[8];
    let _e53 = _f_buffer1_.f_cb1_[9];
    let _e56 = (_e48.yzw + -(_e53.xyz));
    u_xlat0_.x = _e56.x;
    u_xlat0_.y = _e56.y;
    u_xlat0_.z = _e56.z;
    let _e66 = _f_buffer1_.f_cb1_[10];
    u_xlat12_ = (-(_e66.w) + 1f);
    let _e71 = u_xlat1_;
    let _e73 = vs_TEXCOORD0_1;
    let _e74 = _e73.xy;
    u_xlat1_.x = _e74.x;
    u_xlat1_.y = _e74.y;
    let _e79 = u_xlat1_;
    let _e81 = u_xlat1_;
    let _e87 = clamp(_e81.xy, vec2(0f), vec2(1f));
    u_xlat1_.x = _e87.x;
    u_xlat1_.y = _e87.y;
    let _e92 = u_xlat1_;
    let _e94 = u_xlat1_;
    let _e96 = vs_TEXCOORD0_1;
    let _e99 = (_e94.xy + -(_e96.xy));
    u_xlat1_.x = _e99.x;
    u_xlat1_.y = _e99.y;
    let _e104 = u_xlat1_;
    let _e109 = _f_buffer1_.f_cb1_[3];
    let _e111 = u_xlat1_;
    let _e114 = vs_TEXCOORD0_1;
    let _e116 = ((_e109.zz * _e111.xy) + _e114.xy);
    u_xlat1_.x = _e116.x;
    u_xlat1_.y = _e116.y;
    let _e121 = u_xlat1_;
    let _e126 = _f_buffer0_.f_cb0_[4];
    let _e131 = hscard_bias.values[0];
    let _e134 = textureSampleBias(f_t0_, samplerf_s0_, _e121.xy, (_e126.x + _e131.x));
    u_xlat1_ = _e134;
    let _e135 = u_xlat2_;
    let _e137 = u_xlat1_;
    let _e142 = _f_buffer1_.f_cb1_[2];
    let _e144 = (_e137.xyz + _e142.yyy);
    u_xlat2_.x = _e144.x;
    u_xlat2_.y = _e144.y;
    u_xlat2_.z = _e144.z;
    let _e151 = u_xlat1_;
    let _e156 = _f_buffer1_.f_cb1_[3];
    u_xlat14_ = max(_e151.w, _e156.y);
    let _e160 = u_xlat2_;
    let _e162 = u_xlat14_;
    let _e167 = _f_buffer1_.f_cb1_[10];
    u_xlat3_.x = ((_e160.y * _e162) + -(_e167.w));
    let _e171 = u_xlat2_;
    let _e173 = u_xlat14_;
    let _e175 = u_xlat2_;
    let _e177 = (vec3(_e173) * _e175.xyz);
    u_xlat2_.x = _e177.x;
    u_xlat2_.y = _e177.y;
    u_xlat2_.z = _e177.z;
    let _e184 = u_xlat3_;
    let _e186 = u_xlat12_;
    u_xlat12_ = (_e184.x / _e186);
    let _e188 = u_xlat3_;
    u_xlat14_ = (_e188.x * 5f);
    let _e192 = u_xlat14_;
    u_xlat14_ = clamp(_e192, 0f, 1f);
    let _e196 = u_xlat0_;
    let _e198 = u_xlat12_;
    let _e200 = u_xlat0_;
    let _e206 = _f_buffer1_.f_cb1_[9];
    let _e208 = ((vec3(_e198) * _e200.xyz) + _e206.xyz);
    u_xlat0_.x = _e208.x;
    u_xlat0_.y = _e208.y;
    u_xlat0_.z = _e208.z;
    let _e220 = _f_buffer1_.f_cb1_[10];
    u_xlat12_ = (1f / _e220.w);
    let _e223 = u_xlat12_;
    let _e224 = u_xlat2_;
    u_xlat12_ = (_e223 * _e224.y);
    let _e227 = u_xlat3_;
    let _e232 = _f_buffer1_.f_cb1_[9];
    let _e237 = _f_buffer1_.f_cb1_[10];
    let _e240 = (_e232.xyz + -(_e237.xyz));
    u_xlat3_.x = _e240.x;
    u_xlat3_.y = _e240.y;
    u_xlat3_.z = _e240.z;
    let _e247 = u_xlat3_;
    let _e249 = u_xlat12_;
    let _e251 = u_xlat3_;
    let _e257 = _f_buffer1_.f_cb1_[10];
    let _e259 = ((vec3(_e249) * _e251.xyz) + _e257.xyz);
    u_xlat3_.x = _e259.x;
    u_xlat3_.y = _e259.y;
    u_xlat3_.z = _e259.z;
    let _e266 = u_xlat0_;
    let _e268 = u_xlat0_;
    let _e270 = u_xlat3_;
    let _e273 = (_e268.xyz + -(_e270.xyz));
    u_xlat0_.x = _e273.x;
    u_xlat0_.y = _e273.y;
    u_xlat0_.z = _e273.z;
    let _e280 = u_xlat0_;
    let _e282 = u_xlat14_;
    let _e284 = u_xlat0_;
    let _e287 = u_xlat3_;
    let _e289 = ((vec3(_e282) * _e284.xyz) + _e287.xyz);
    u_xlat0_.x = _e289.x;
    u_xlat0_.y = _e289.y;
    u_xlat0_.z = _e289.z;
    let _e296 = u_xlat0_;
    let _e298 = u_xlat0_;
    let _e300 = u_xlat2_;
    let _e302 = (_e298.xyz * _e300.xyz);
    u_xlat0_.x = _e302.x;
    u_xlat0_.y = _e302.y;
    u_xlat0_.z = _e302.z;
    let _e309 = u_xlat1_;
    let _e311 = u_xlat0_;
    let _e316 = _f_buffer1_.f_cb1_[2];
    let _e318 = (_e311.xyz * _e316.xxx);
    u_xlat1_.x = _e318.x;
    u_xlat1_.y = _e318.y;
    u_xlat1_.z = _e318.z;
    let _e326 = vs_TEXCOORD1_1;
    let _e330 = _f_buffer1_.f_cb1_[12];
    u_xlat0_.x = (_e326 + -(_e330.z));
    let _e335 = u_xlat0_;
    u_xlat0_.x = clamp(_e335.x, 0f, 1f);
    let _e341 = u_xlat0_;
    u_xlat0_.x = (_e341.x + -0.00001f);
    let _e346 = u_xlat0_;
    let _e349 = u_xlat1_;
    u_xlat4_ = (-(_e346.x) + _e349.w);
    let _e352 = vs_TEXCOORD1_1;
    let _e356 = _f_buffer1_.f_cb1_[12];
    u_xlat8_ = (_e352 + _e356.z);
    let _e359 = u_xlat8_;
    u_xlat8_ = clamp(_e359, 0f, 1f);
    let _e364 = u_xlat0_;
    let _e367 = u_xlat8_;
    u_xlat0_.x = (-(_e364.x) + _e367);
    let _e372 = u_xlat0_;
    u_xlat0_.x = (1f / _e372.x);
    let _e376 = u_xlat0_;
    let _e378 = u_xlat4_;
    u_xlat0_.x = (_e376.x * _e378);
    let _e381 = u_xlat0_;
    u_xlat0_.x = clamp(_e381.x, 0f, 1f);
    let _e386 = u_xlat0_;
    u_xlat4_ = ((_e386.x * -2f) + 3f);
    let _e394 = u_xlat0_;
    let _e396 = u_xlat0_;
    u_xlat0_.x = (_e394.x * _e396.x);
    let _e400 = u_xlat0_;
    let _e402 = u_xlat4_;
    u_xlat0_.x = (_e400.x * _e402);
    let _e404 = u_xlat0_;
    let _e406 = u_xlat1_;
    u_xlat0_ = (_e404.xxxx * _e406);
    let _e408 = u_xlat0_;
    let _e409 = vs_COLOR0_1;
    SV_Target0_ = (_e408 * _e409);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: f32, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e28 = SV_Target0_;
    return FragmentOutput(_e28);
}
