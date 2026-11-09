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
@group(3) @binding(3) 
var samplerf_s1_: sampler;
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec4<f32>;
var<private> vs_COLOR1_1: vec4<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> vs_TEXCOORD1_1: f32;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlat5_: f32 = 0f;
    var u_xlat10_: f32 = 0f;
    var u_xlat11_: vec2<f32> = vec2(0f);
    var u_xlat15_: f32 = 0f;
    var u_xlat18_: f32 = 0f;

    let _e54 = u_xlat0_;
    let _e59 = _f_buffer1_.f_cb1_[8];
    let _e64 = _f_buffer1_.f_cb1_[9];
    let _e67 = (_e59.yzw + -(_e64.xyz));
    u_xlat0_.x = _e67.x;
    u_xlat0_.y = _e67.y;
    u_xlat0_.z = _e67.z;
    let _e77 = _f_buffer1_.f_cb1_[10];
    u_xlat15_ = (-(_e77.w) + 1f);
    let _e82 = vs_TEXCOORD0_1;
    u_xlat1_ = _e82.zwxy;
    let _e84 = u_xlat1_;
    u_xlat1_ = clamp(_e84, vec4(0f), vec4(1f));
    let _e90 = u_xlat1_;
    let _e91 = vs_TEXCOORD0_1;
    u_xlat1_ = (_e90 + -(_e91.zwxy));
    let _e95 = u_xlat11_;
    let _e100 = _f_buffer1_.f_cb1_[3];
    let _e102 = u_xlat1_;
    let _e105 = vs_TEXCOORD0_1;
    let _e107 = ((_e100.zz * _e102.zw) + _e105.xy);
    u_xlat11_.x = _e107.x;
    u_xlat11_.y = _e107.y;
    let _e112 = u_xlat1_;
    let _e117 = _f_buffer1_.f_cb1_[6];
    let _e119 = u_xlat1_;
    let _e122 = vs_TEXCOORD0_1;
    let _e124 = ((_e117.xx * _e119.xy) + _e122.zw);
    u_xlat1_.x = _e124.x;
    u_xlat1_.y = _e124.y;
    let _e129 = u_xlat1_;
    let _e134 = _f_buffer0_.f_cb0_[4];
    let _e139 = hscard_bias.values[1];
    let _e142 = textureSampleBias(f_t1_, samplerf_s1_, _e129.xy, (_e134.x + _e139.x));
    u_xlat2_ = _e142;
    let _e143 = u_xlat2_;
    let _e144 = vs_COLOR1_1;
    u_xlat2_ = (_e143 * _e144);
    let _e146 = u_xlat11_;
    let _e151 = _f_buffer0_.f_cb0_[4];
    let _e156 = hscard_bias.values[0];
    let _e159 = textureSampleBias(f_t0_, samplerf_s0_, _e146.xy, (_e151.x + _e156.x));
    u_xlat1_ = _e159.yzwx;
    let _e161 = u_xlat3_;
    let _e163 = u_xlat1_;
    let _e168 = _f_buffer1_.f_cb1_[2];
    let _e170 = (_e163.wxy + _e168.yyy);
    u_xlat3_.x = _e170.x;
    u_xlat3_.y = _e170.y;
    u_xlat3_.z = _e170.z;
    let _e177 = u_xlat1_;
    let _e182 = _f_buffer1_.f_cb1_[3];
    u_xlat18_ = max(_e177.w, _e182.y);
    let _e186 = u_xlat3_;
    let _e188 = u_xlat18_;
    let _e193 = _f_buffer1_.f_cb1_[10];
    u_xlat4_.x = ((_e186.y * _e188) + -(_e193.w));
    let _e197 = u_xlat3_;
    let _e199 = u_xlat18_;
    let _e201 = u_xlat3_;
    let _e203 = (vec3(_e199) * _e201.xyz);
    u_xlat3_.x = _e203.x;
    u_xlat3_.y = _e203.y;
    u_xlat3_.z = _e203.z;
    let _e210 = u_xlat4_;
    let _e212 = u_xlat15_;
    u_xlat15_ = (_e210.x / _e212);
    let _e214 = u_xlat4_;
    u_xlat18_ = (_e214.x * 5f);
    let _e218 = u_xlat18_;
    u_xlat18_ = clamp(_e218, 0f, 1f);
    let _e222 = u_xlat0_;
    let _e224 = u_xlat15_;
    let _e226 = u_xlat0_;
    let _e232 = _f_buffer1_.f_cb1_[9];
    let _e234 = ((vec3(_e224) * _e226.xyz) + _e232.xyz);
    u_xlat0_.x = _e234.x;
    u_xlat0_.y = _e234.y;
    u_xlat0_.z = _e234.z;
    let _e246 = _f_buffer1_.f_cb1_[10];
    u_xlat15_ = (1f / _e246.w);
    let _e249 = u_xlat15_;
    let _e250 = u_xlat3_;
    u_xlat15_ = (_e249 * _e250.y);
    let _e253 = u_xlat4_;
    let _e258 = _f_buffer1_.f_cb1_[9];
    let _e263 = _f_buffer1_.f_cb1_[10];
    let _e266 = (_e258.xyz + -(_e263.xyz));
    u_xlat4_.x = _e266.x;
    u_xlat4_.y = _e266.y;
    u_xlat4_.z = _e266.z;
    let _e273 = u_xlat4_;
    let _e275 = u_xlat15_;
    let _e277 = u_xlat4_;
    let _e283 = _f_buffer1_.f_cb1_[10];
    let _e285 = ((vec3(_e275) * _e277.xyz) + _e283.xyz);
    u_xlat4_.x = _e285.x;
    u_xlat4_.y = _e285.y;
    u_xlat4_.z = _e285.z;
    let _e292 = u_xlat0_;
    let _e294 = u_xlat0_;
    let _e296 = u_xlat4_;
    let _e299 = (_e294.xyz + -(_e296.xyz));
    u_xlat0_.x = _e299.x;
    u_xlat0_.y = _e299.y;
    u_xlat0_.z = _e299.z;
    let _e306 = u_xlat0_;
    let _e308 = u_xlat18_;
    let _e310 = u_xlat0_;
    let _e313 = u_xlat4_;
    let _e315 = ((vec3(_e308) * _e310.xyz) + _e313.xyz);
    u_xlat0_.x = _e315.x;
    u_xlat0_.y = _e315.y;
    u_xlat0_.z = _e315.z;
    let _e322 = u_xlat0_;
    let _e324 = u_xlat0_;
    let _e326 = u_xlat3_;
    let _e328 = (_e324.xyz * _e326.xyz);
    u_xlat0_.x = _e328.x;
    u_xlat0_.y = _e328.y;
    u_xlat0_.z = _e328.z;
    let _e335 = u_xlat1_;
    let _e337 = u_xlat0_;
    let _e342 = _f_buffer1_.f_cb1_[2];
    let _e344 = (_e337.xyz * _e342.xxx);
    u_xlat1_.x = _e344.x;
    u_xlat1_.y = _e344.y;
    u_xlat1_.z = _e344.z;
    let _e352 = vs_TEXCOORD1_1;
    let _e356 = _f_buffer1_.f_cb1_[12];
    u_xlat0_.x = (_e352 + -(_e356.z));
    let _e361 = u_xlat0_;
    u_xlat0_.x = clamp(_e361.x, 0f, 1f);
    let _e367 = u_xlat0_;
    u_xlat0_.x = (_e367.x + -0.00001f);
    let _e372 = u_xlat0_;
    let _e375 = u_xlat1_;
    u_xlat5_ = (-(_e372.x) + _e375.w);
    let _e378 = vs_TEXCOORD1_1;
    let _e382 = _f_buffer1_.f_cb1_[12];
    u_xlat10_ = (_e378 + _e382.z);
    let _e385 = u_xlat10_;
    u_xlat10_ = clamp(_e385, 0f, 1f);
    let _e390 = u_xlat0_;
    let _e393 = u_xlat10_;
    u_xlat0_.x = (-(_e390.x) + _e393);
    let _e398 = u_xlat0_;
    u_xlat0_.x = (1f / _e398.x);
    let _e402 = u_xlat0_;
    let _e404 = u_xlat5_;
    u_xlat0_.x = (_e402.x * _e404);
    let _e407 = u_xlat0_;
    u_xlat0_.x = clamp(_e407.x, 0f, 1f);
    let _e412 = u_xlat0_;
    u_xlat5_ = ((_e412.x * -2f) + 3f);
    let _e420 = u_xlat0_;
    let _e422 = u_xlat0_;
    u_xlat0_.x = (_e420.x * _e422.x);
    let _e426 = u_xlat0_;
    let _e428 = u_xlat5_;
    u_xlat0_.x = (_e426.x * _e428);
    let _e430 = u_xlat1_;
    let _e431 = u_xlat0_;
    let _e434 = u_xlat2_;
    u_xlat0_ = ((_e430 * _e431.xxxx) + _e434);
    let _e436 = u_xlat0_;
    let _e437 = vs_COLOR0_1;
    SV_Target0_ = (_e436 * _e437);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(11) vs_COLOR1_: vec4<f32>, @location(10) vs_COLOR0_: vec4<f32>, @location(1) vs_TEXCOORD1_: f32) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_COLOR1_1 = vs_COLOR1_;
    vs_COLOR0_1 = vs_COLOR0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    main_1();
    let _e36 = SV_Target0_;
    return FragmentOutput(_e36);
}
