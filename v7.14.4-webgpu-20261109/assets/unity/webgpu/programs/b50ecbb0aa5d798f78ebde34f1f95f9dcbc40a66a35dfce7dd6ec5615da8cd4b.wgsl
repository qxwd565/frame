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
    var u_xlat3_: f32 = 0f;
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlat5_: f32 = 0f;
    var u_xlat8_: f32 = 0f;
    var u_xlat10_: f32 = 0f;
    var u_xlat11_: vec2<f32> = vec2(0f);
    var u_xlat13_: f32 = 0f;
    var u_xlat15_: f32 = 0f;

    let _e56 = u_xlat0_;
    let _e61 = _f_buffer1_.f_cb1_[8];
    let _e66 = _f_buffer1_.f_cb1_[9];
    let _e69 = (_e61.yzw + -(_e66.xyz));
    u_xlat0_.x = _e69.x;
    u_xlat0_.y = _e69.y;
    u_xlat0_.z = _e69.z;
    let _e79 = _f_buffer1_.f_cb1_[10];
    u_xlat15_ = (-(_e79.w) + 1f);
    let _e84 = vs_TEXCOORD0_1;
    u_xlat1_ = _e84.zwxy;
    let _e86 = u_xlat1_;
    u_xlat1_ = clamp(_e86, vec4(0f), vec4(1f));
    let _e92 = u_xlat1_;
    let _e93 = vs_TEXCOORD0_1;
    u_xlat1_ = (_e92 + -(_e93.zwxy));
    let _e97 = u_xlat11_;
    let _e102 = _f_buffer1_.f_cb1_[3];
    let _e104 = u_xlat1_;
    let _e107 = vs_TEXCOORD0_1;
    let _e109 = ((_e102.zz * _e104.zw) + _e107.xy);
    u_xlat11_.x = _e109.x;
    u_xlat11_.y = _e109.y;
    let _e114 = u_xlat1_;
    let _e119 = _f_buffer1_.f_cb1_[6];
    let _e121 = u_xlat1_;
    let _e124 = vs_TEXCOORD0_1;
    let _e126 = ((_e119.xx * _e121.xy) + _e124.zw);
    u_xlat1_.x = _e126.x;
    u_xlat1_.y = _e126.y;
    let _e131 = u_xlat1_;
    let _e136 = _f_buffer0_.f_cb0_[4];
    let _e141 = hscard_bias.values[1];
    let _e144 = textureSampleBias(f_t1_, samplerf_s1_, _e131.xy, (_e136.x + _e141.x));
    u_xlat2_ = _e144;
    let _e145 = u_xlat2_;
    let _e146 = vs_COLOR1_1;
    u_xlat2_ = (_e145 * _e146);
    let _e148 = u_xlat11_;
    let _e153 = _f_buffer0_.f_cb0_[4];
    let _e158 = hscard_bias.values[0];
    let _e161 = textureSampleBias(f_t0_, samplerf_s0_, _e148.xy, (_e153.x + _e158.x));
    u_xlat1_ = _e161;
    let _e163 = u_xlat1_;
    u_xlat1_.w = dot(_e163.xyz, vec3<f32>(0.299f, 0.587f, 0.114f));
    let _e170 = u_xlat1_;
    let _e175 = _f_buffer1_.f_cb1_[2];
    u_xlat3_ = (_e170.w + _e175.y);
    let _e178 = u_xlat1_;
    let _e183 = _f_buffer1_.f_cb1_[3];
    u_xlat8_ = max(_e178.w, _e183.y);
    let _e186 = u_xlat3_;
    let _e187 = u_xlat8_;
    let _e192 = _f_buffer1_.f_cb1_[10];
    u_xlat13_ = ((_e186 * _e187) + -(_e192.w));
    let _e196 = u_xlat8_;
    let _e197 = u_xlat3_;
    u_xlat3_ = (_e196 * _e197);
    let _e199 = u_xlat13_;
    let _e200 = u_xlat15_;
    u_xlat15_ = (_e199 / _e200);
    let _e202 = u_xlat13_;
    u_xlat8_ = (_e202 * 5f);
    let _e205 = u_xlat8_;
    u_xlat8_ = clamp(_e205, 0f, 1f);
    let _e209 = u_xlat0_;
    let _e211 = u_xlat15_;
    let _e213 = u_xlat0_;
    let _e219 = _f_buffer1_.f_cb1_[9];
    let _e221 = ((vec3(_e211) * _e213.xyz) + _e219.xyz);
    u_xlat0_.x = _e221.x;
    u_xlat0_.y = _e221.y;
    u_xlat0_.z = _e221.z;
    let _e233 = _f_buffer1_.f_cb1_[10];
    u_xlat15_ = (1f / _e233.w);
    let _e236 = u_xlat15_;
    let _e237 = u_xlat3_;
    u_xlat15_ = (_e236 * _e237);
    let _e239 = u_xlat4_;
    let _e244 = _f_buffer1_.f_cb1_[9];
    let _e249 = _f_buffer1_.f_cb1_[10];
    let _e252 = (_e244.xyz + -(_e249.xyz));
    u_xlat4_.x = _e252.x;
    u_xlat4_.y = _e252.y;
    u_xlat4_.z = _e252.z;
    let _e259 = u_xlat4_;
    let _e261 = u_xlat15_;
    let _e263 = u_xlat4_;
    let _e269 = _f_buffer1_.f_cb1_[10];
    let _e271 = ((vec3(_e261) * _e263.xyz) + _e269.xyz);
    u_xlat4_.x = _e271.x;
    u_xlat4_.y = _e271.y;
    u_xlat4_.z = _e271.z;
    let _e278 = u_xlat0_;
    let _e280 = u_xlat0_;
    let _e282 = u_xlat4_;
    let _e285 = (_e280.xyz + -(_e282.xyz));
    u_xlat0_.x = _e285.x;
    u_xlat0_.y = _e285.y;
    u_xlat0_.z = _e285.z;
    let _e292 = u_xlat0_;
    let _e294 = u_xlat8_;
    let _e296 = u_xlat0_;
    let _e299 = u_xlat4_;
    let _e301 = ((vec3(_e294) * _e296.xyz) + _e299.xyz);
    u_xlat0_.x = _e301.x;
    u_xlat0_.y = _e301.y;
    u_xlat0_.z = _e301.z;
    let _e308 = u_xlat0_;
    let _e310 = u_xlat0_;
    let _e312 = u_xlat3_;
    let _e314 = (_e310.xyz * vec3(_e312));
    u_xlat0_.x = _e314.x;
    u_xlat0_.y = _e314.y;
    u_xlat0_.z = _e314.z;
    let _e321 = u_xlat1_;
    let _e323 = u_xlat0_;
    let _e328 = _f_buffer1_.f_cb1_[2];
    let _e330 = (_e323.xyz * _e328.xxx);
    u_xlat1_.x = _e330.x;
    u_xlat1_.y = _e330.y;
    u_xlat1_.z = _e330.z;
    let _e338 = vs_TEXCOORD1_1;
    let _e342 = _f_buffer1_.f_cb1_[12];
    u_xlat0_.x = (_e338 + -(_e342.z));
    let _e347 = u_xlat0_;
    u_xlat0_.x = clamp(_e347.x, 0f, 1f);
    let _e353 = u_xlat0_;
    u_xlat0_.x = (_e353.x + -0.00001f);
    let _e358 = u_xlat0_;
    let _e361 = u_xlat1_;
    u_xlat5_ = (-(_e358.x) + _e361.w);
    let _e364 = vs_TEXCOORD1_1;
    let _e368 = _f_buffer1_.f_cb1_[12];
    u_xlat10_ = (_e364 + _e368.z);
    let _e371 = u_xlat10_;
    u_xlat10_ = clamp(_e371, 0f, 1f);
    let _e376 = u_xlat0_;
    let _e379 = u_xlat10_;
    u_xlat0_.x = (-(_e376.x) + _e379);
    let _e384 = u_xlat0_;
    u_xlat0_.x = (1f / _e384.x);
    let _e388 = u_xlat0_;
    let _e390 = u_xlat5_;
    u_xlat0_.x = (_e388.x * _e390);
    let _e393 = u_xlat0_;
    u_xlat0_.x = clamp(_e393.x, 0f, 1f);
    let _e398 = u_xlat0_;
    u_xlat5_ = ((_e398.x * -2f) + 3f);
    let _e406 = u_xlat0_;
    let _e408 = u_xlat0_;
    u_xlat0_.x = (_e406.x * _e408.x);
    let _e412 = u_xlat0_;
    let _e414 = u_xlat5_;
    u_xlat0_.x = (_e412.x * _e414);
    let _e416 = u_xlat1_;
    let _e417 = u_xlat0_;
    let _e420 = u_xlat2_;
    u_xlat0_ = ((_e416 * _e417.xxxx) + _e420);
    let _e422 = u_xlat0_;
    let _e423 = vs_COLOR0_1;
    SV_Target0_ = (_e422 * _e423);
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
