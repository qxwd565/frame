struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 7>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 12>,
}

struct f_buffer2_ {
    f_cb2_: vec4<f32>,
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
@group(1) @binding(2) 
var<uniform> _f_buffer2_: f_buffer2_;
@group(3) @binding(1) 
var samplerf_s0_: sampler;
@group(3) @binding(3) 
var samplerf_s1_: sampler;
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD1_1: vec2<f32>;
var<private> vs_TEXCOORD3_1: vec3<f32>;
var<private> vs_NORMAL0_1: vec3<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec3<f32> = vec3(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec4<f32> = vec4(0f);
    var u_xlat4_: vec3<f32> = vec3(0f);

    let _e43 = vs_NORMAL0_1;
    let _e45 = vs_NORMAL0_1;
    u_xlat0_.x = dot(_e43.xyz, _e45.xyz);
    let _e49 = u_xlat0_;
    u_xlat0_.x = inverseSqrt(_e49.x);
    let _e52 = u_xlat0_;
    let _e54 = u_xlat0_;
    let _e56 = vs_NORMAL0_1;
    let _e58 = (_e54.xxx * _e56.xyz);
    u_xlat0_.x = _e58.x;
    u_xlat0_.y = _e58.y;
    u_xlat0_.z = _e58.z;
    let _e66 = u_xlat0_;
    let _e71 = _f_buffer0_.f_cb0_[5];
    u_xlat0_.x = dot(_e66.xyz, _e71.xyz);
    let _e75 = u_xlat0_;
    u_xlat0_.x = clamp(_e75.x, 0f, 1f);
    let _e80 = u_xlat4_;
    let _e85 = _f_buffer0_.f_cb0_[6];
    let _e90 = _f_buffer1_.f_cb1_[11];
    let _e92 = (_e85.xyz * _e90.zzz);
    u_xlat4_.x = _e92.x;
    u_xlat4_.y = _e92.y;
    u_xlat4_.z = _e92.z;
    let _e99 = u_xlat0_;
    let _e101 = u_xlat4_;
    let _e103 = u_xlat0_;
    let _e106 = vs_TEXCOORD3_1;
    let _e108 = ((_e101.xyz * _e103.xxx) + _e106.xyz);
    u_xlat0_.x = _e108.x;
    u_xlat0_.y = _e108.y;
    u_xlat0_.z = _e108.z;
    let _e115 = vs_TEXCOORD1_1;
    let _e120 = _f_buffer0_.f_cb0_[4];
    let _e125 = hscard_bias.values[1];
    let _e128 = textureSampleBias(f_t1_, samplerf_s1_, _e115.xy, (_e120.x + _e125.x));
    u_xlat1_ = _e128;
    let _e129 = u_xlat1_;
    let _e131 = vs_COLOR0_1;
    u_xlat2_ = (_e129.wwww * _e131);
    let _e133 = vs_TEXCOORD0_1;
    let _e138 = _f_buffer0_.f_cb0_[4];
    let _e143 = hscard_bias.values[0];
    let _e146 = textureSampleBias(f_t0_, samplerf_s0_, _e133.xy, (_e138.x + _e143.x));
    u_xlat3_ = _e146;
    let _e147 = u_xlat1_;
    let _e148 = u_xlat3_;
    u_xlat1_ = (_e147 + -(_e148));
    let _e151 = u_xlat2_;
    let _e152 = u_xlat1_;
    let _e154 = u_xlat3_;
    u_xlat1_ = ((_e151 * _e152) + _e154);
    let _e156 = u_xlat1_;
    let _e157 = _f_buffer2_;
    u_xlat1_ = (_e156 * _e157.f_cb2_);
    let _e160 = SV_Target0_;
    let _e162 = u_xlat0_;
    let _e164 = u_xlat1_;
    let _e166 = (_e162.xyz * _e164.xyz);
    SV_Target0_.x = _e166.x;
    SV_Target0_.y = _e166.y;
    SV_Target0_.z = _e166.z;
    let _e174 = u_xlat1_;
    SV_Target0_.w = _e174.w;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec2<f32>, @location(3) vs_TEXCOORD3_: vec3<f32>, @location(12) vs_NORMAL0_: vec3<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_TEXCOORD3_1 = vs_TEXCOORD3_;
    vs_NORMAL0_1 = vs_NORMAL0_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e43 = SV_Target0_;
    return FragmentOutput(_e43);
}
