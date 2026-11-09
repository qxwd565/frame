struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: vec4<f32>,
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
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD1_1: vec2<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);

    let _e29 = vs_TEXCOORD1_1;
    let _e34 = _f_buffer0_.f_cb0_[4];
    let _e39 = hscard_bias.values[1];
    let _e42 = textureSampleBias(f_t1_, samplerf_s1_, _e29.xy, (_e34.x + _e39.x));
    u_xlat0_ = _e42;
    let _e43 = vs_TEXCOORD0_1;
    let _e48 = _f_buffer0_.f_cb0_[4];
    let _e53 = hscard_bias.values[0];
    let _e56 = textureSampleBias(f_t0_, samplerf_s0_, _e43.xy, (_e48.x + _e53.x));
    u_xlat1_ = _e56;
    let _e58 = u_xlat1_;
    let _e61 = _f_buffer1_;
    u_xlat2_.x = (-(_e58.w) + _e61.f_cb1_.w);
    let _e66 = u_xlat1_;
    let _e68 = u_xlat2_;
    u_xlat2_.w = (_e66.w * _e68.x);
    let _e71 = u_xlat2_;
    let _e73 = u_xlat1_;
    let _e75 = _f_buffer1_;
    let _e78 = (_e73.xyz * _e75.f_cb1_.xyz);
    u_xlat2_.x = _e78.x;
    u_xlat2_.y = _e78.y;
    u_xlat2_.z = _e78.z;
    let _e85 = u_xlat0_;
    let _e86 = u_xlat2_;
    u_xlat0_ = (_e85 * _e86);
    let _e88 = u_xlat0_;
    let _e89 = vs_COLOR0_1;
    SV_Target0_ = (_e88 * _e89);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec2<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e32 = SV_Target0_;
    return FragmentOutput(_e32);
}
