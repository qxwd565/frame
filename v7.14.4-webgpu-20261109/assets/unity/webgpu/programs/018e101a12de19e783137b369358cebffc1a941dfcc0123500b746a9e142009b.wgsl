struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 11>,
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
    var u_xlat2_: vec3<f32> = vec3(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: vec2<f32> = vec2(0f);
    var u_xlat8_: f32 = 0f;
    var u_xlat12_: f32 = 0f;

    let _e48 = _f_buffer1_.f_cb1_[10];
    u_xlat0_.x = (-(_e48.w) + 1f);
    let _e53 = u_xlat4_;
    let _e55 = vs_TEXCOORD0_1;
    let _e56 = _e55.xy;
    u_xlat4_.x = _e56.x;
    u_xlat4_.y = _e56.y;
    let _e61 = u_xlat4_;
    let _e63 = u_xlat4_;
    let _e69 = clamp(_e63.xy, vec2(0f), vec2(1f));
    u_xlat4_.x = _e69.x;
    u_xlat4_.y = _e69.y;
    let _e74 = u_xlat4_;
    let _e76 = u_xlat4_;
    let _e78 = vs_TEXCOORD0_1;
    let _e81 = (_e76.xy + -(_e78.xy));
    u_xlat4_.x = _e81.x;
    u_xlat4_.y = _e81.y;
    let _e86 = u_xlat4_;
    let _e91 = _f_buffer1_.f_cb1_[3];
    let _e93 = u_xlat4_;
    let _e96 = vs_TEXCOORD0_1;
    let _e98 = ((_e91.zz * _e93.xy) + _e96.xy);
    u_xlat4_.x = _e98.x;
    u_xlat4_.y = _e98.y;
    let _e103 = u_xlat4_;
    let _e108 = _f_buffer0_.f_cb0_[4];
    let _e113 = hscard_bias.values[0];
    let _e116 = textureSampleBias(f_t0_, samplerf_s0_, _e103.xy, (_e108.x + _e113.x));
    u_xlat1_ = _e116;
    let _e118 = u_xlat1_;
    u_xlat1_.w = dot(_e118.xyz, vec3<f32>(0.299f, 0.587f, 0.114f));
    let _e126 = u_xlat1_;
    let _e131 = _f_buffer1_.f_cb1_[2];
    u_xlat4_.x = (_e126.w + _e131.y);
    let _e134 = u_xlat1_;
    let _e139 = _f_buffer1_.f_cb1_[3];
    u_xlat8_ = max(_e134.w, _e139.y);
    let _e142 = u_xlat4_;
    let _e144 = u_xlat8_;
    let _e149 = _f_buffer1_.f_cb1_[10];
    u_xlat12_ = ((_e142.x * _e144) + -(_e149.w));
    let _e154 = u_xlat8_;
    let _e155 = u_xlat4_;
    u_xlat4_.x = (_e154 * _e155.x);
    let _e159 = u_xlat12_;
    let _e160 = u_xlat0_;
    u_xlat0_.x = (_e159 / _e160.x);
    let _e163 = u_xlat12_;
    u_xlat8_ = (_e163 * 5f);
    let _e166 = u_xlat8_;
    u_xlat8_ = clamp(_e166, 0f, 1f);
    let _e170 = u_xlat2_;
    let _e175 = _f_buffer1_.f_cb1_[8];
    let _e180 = _f_buffer1_.f_cb1_[9];
    let _e183 = (_e175.yzw + -(_e180.xyz));
    u_xlat2_.x = _e183.x;
    u_xlat2_.y = _e183.y;
    u_xlat2_.z = _e183.z;
    let _e190 = u_xlat2_;
    let _e192 = u_xlat0_;
    let _e194 = u_xlat2_;
    let _e200 = _f_buffer1_.f_cb1_[9];
    let _e202 = ((_e192.xxx * _e194.xyz) + _e200.xyz);
    u_xlat2_.x = _e202.x;
    u_xlat2_.y = _e202.y;
    u_xlat2_.z = _e202.z;
    let _e215 = _f_buffer1_.f_cb1_[10];
    u_xlat0_.x = (1f / _e215.w);
    let _e219 = u_xlat0_;
    let _e221 = u_xlat4_;
    u_xlat0_.x = (_e219.x * _e221.x);
    let _e224 = u_xlat3_;
    let _e229 = _f_buffer1_.f_cb1_[9];
    let _e234 = _f_buffer1_.f_cb1_[10];
    let _e237 = (_e229.xyz + -(_e234.xyz));
    u_xlat3_.x = _e237.x;
    u_xlat3_.y = _e237.y;
    u_xlat3_.z = _e237.z;
    let _e244 = u_xlat3_;
    let _e246 = u_xlat0_;
    let _e248 = u_xlat3_;
    let _e254 = _f_buffer1_.f_cb1_[10];
    let _e256 = ((_e246.xxx * _e248.xyz) + _e254.xyz);
    u_xlat3_.x = _e256.x;
    u_xlat3_.y = _e256.y;
    u_xlat3_.z = _e256.z;
    let _e263 = u_xlat2_;
    let _e265 = u_xlat2_;
    let _e267 = u_xlat3_;
    let _e270 = (_e265.xyz + -(_e267.xyz));
    u_xlat2_.x = _e270.x;
    u_xlat2_.y = _e270.y;
    u_xlat2_.z = _e270.z;
    let _e277 = u_xlat0_;
    let _e279 = u_xlat8_;
    let _e281 = u_xlat2_;
    let _e284 = u_xlat3_;
    let _e286 = ((vec3(_e279) * _e281.xyz) + _e284.xyz);
    u_xlat0_.x = _e286.x;
    u_xlat0_.z = _e286.y;
    u_xlat0_.w = _e286.z;
    let _e293 = u_xlat0_;
    let _e295 = u_xlat0_;
    let _e297 = u_xlat4_;
    let _e299 = (_e295.xzw * _e297.xxx);
    u_xlat0_.x = _e299.x;
    u_xlat0_.y = _e299.y;
    u_xlat0_.z = _e299.z;
    let _e306 = u_xlat1_;
    let _e308 = u_xlat0_;
    let _e313 = _f_buffer1_.f_cb1_[2];
    let _e315 = (_e308.xyz * _e313.xxx);
    u_xlat1_.x = _e315.x;
    u_xlat1_.y = _e315.y;
    u_xlat1_.z = _e315.z;
    let _e322 = vs_TEXCOORD0_1;
    let _e327 = _f_buffer0_.f_cb0_[4];
    let _e332 = hscard_bias.values[1];
    let _e335 = textureSampleBias(f_t1_, samplerf_s1_, _e322.zw, (_e327.x + _e332.x));
    u_xlat0_ = _e335;
    let _e336 = u_xlat0_;
    let _e337 = vs_COLOR1_1;
    let _e339 = u_xlat1_;
    u_xlat0_ = ((_e336 * _e337) + _e339);
    let _e342 = vs_TEXCOORD1_1;
    u_xlat1_.x = _e342;
    let _e344 = u_xlat1_;
    u_xlat1_.x = clamp(_e344.x, 0f, 1f);
    let _e349 = u_xlat1_;
    let _e351 = vs_COLOR0_1;
    u_xlat1_ = (_e349.xxxx * _e351);
    let _e353 = u_xlat0_;
    let _e354 = u_xlat1_;
    SV_Target0_ = (_e353 * _e354);
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
