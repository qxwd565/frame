struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 2>,
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
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> SV_TARGET0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);

    let _e22 = vs_COLOR0_1;
    let _e23 = vs_COLOR0_1;
    u_xlat0_ = (_e22 + _e23);
    let _e25 = vs_TEXCOORD0_1;
    let _e30 = _f_buffer0_.f_cb0_[4];
    let _e35 = hscard_bias.values[0];
    let _e38 = textureSampleBias(f_t0_, samplerf_s0_, _e25.xy, (_e30.x + _e35.x));
    u_xlat1_ = _e38;
    let _e39 = u_xlat0_;
    let _e40 = u_xlat1_;
    u_xlat0_ = (_e39 * _e40);
    let _e43 = vs_COLOR0_1;
    let _e45 = u_xlat0_;
    let _e51 = _f_buffer1_.f_cb1_[1];
    u_xlat1_.x = ((_e43.w * _e45.x) + -(_e51.z));
    let _e56 = u_xlat1_;
    u_xlat1_.x = ceil(_e56.x);
    let _e60 = u_xlat1_;
    let _e65 = _f_buffer1_.f_cb1_[1];
    u_xlat1_.x = (_e60.x * _e65.y);
    let _e69 = u_xlat0_;
    let _e71 = u_xlat1_;
    SV_TARGET0_.w = (_e69.w * _e71.x);
    let _e74 = SV_TARGET0_;
    let _e76 = u_xlat0_;
    let _e81 = _f_buffer1_.f_cb1_[1];
    let _e83 = (_e76.xyz * _e81.xxx);
    SV_TARGET0_.x = _e83.x;
    SV_TARGET0_.y = _e83.y;
    SV_TARGET0_.z = _e83.z;
    return;
}

@fragment 
fn main(@location(10) vs_COLOR0_: vec4<f32>, @location(0) vs_TEXCOORD0_: vec2<f32>) -> FragmentOutput {
    vs_COLOR0_1 = vs_COLOR0_;
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    main_1();
    let _e24 = SV_TARGET0_;
    return FragmentOutput(_e24);
}
