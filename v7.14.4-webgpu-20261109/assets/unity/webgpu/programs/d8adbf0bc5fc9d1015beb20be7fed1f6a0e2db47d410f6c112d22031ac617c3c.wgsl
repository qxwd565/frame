struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 3>,
}

struct FragmentOutput {
    @location(0) SV_TARGET0_: vec4<f32>,
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
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD1_1: vec2<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_TARGET0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);

    let _e29 = vs_TEXCOORD1_1;
    let _e34 = _f_buffer0_.f_cb0_[4];
    let _e39 = hscard_bias.values[1];
    let _e42 = textureSampleBias(f_t1_, samplerf_s1_, _e29.xy, (_e34.x + _e39.x));
    u_xlat0_ = _e42;
    let _e43 = u_xlat0_;
    let _e47 = _f_buffer1_.f_cb1_[2];
    u_xlat0_ = (_e43 * _e47.yyyy);
    let _e50 = vs_TEXCOORD0_1;
    let _e55 = _f_buffer0_.f_cb0_[4];
    let _e60 = hscard_bias.values[0];
    let _e63 = textureSampleBias(f_t0_, samplerf_s0_, _e50.xy, (_e55.x + _e60.x));
    u_xlat1_ = _e63;
    let _e65 = u_xlat1_;
    let _e71 = _f_buffer1_.f_cb1_[1];
    u_xlat2_.x = (-(_e65.w) + _e71.w);
    let _e75 = u_xlat1_;
    let _e77 = u_xlat2_;
    u_xlat2_.w = (_e75.w * _e77.x);
    let _e80 = u_xlat2_;
    let _e82 = u_xlat1_;
    let _e87 = _f_buffer1_.f_cb1_[1];
    let _e89 = (_e82.xyz * _e87.xyz);
    u_xlat2_.x = _e89.x;
    u_xlat2_.y = _e89.y;
    u_xlat2_.z = _e89.z;
    let _e96 = u_xlat0_;
    let _e97 = u_xlat2_;
    u_xlat0_ = (_e96 * _e97);
    let _e99 = u_xlat0_;
    let _e100 = vs_COLOR0_1;
    SV_TARGET0_ = (_e99 * _e100);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec2<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e32 = SV_TARGET0_;
    return FragmentOutput(_e32);
}
