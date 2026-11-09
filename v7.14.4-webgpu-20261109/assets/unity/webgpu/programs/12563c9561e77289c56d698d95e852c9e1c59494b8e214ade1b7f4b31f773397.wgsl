struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 5>,
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
var<private> vs_TEXCOORD0_1: vec4<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_TARGET0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);

    let _e24 = vs_TEXCOORD0_1;
    let _e29 = _f_buffer0_.f_cb0_[4];
    let _e34 = hscard_bias.values[1];
    let _e37 = textureSampleBias(f_t1_, samplerf_s1_, _e24.xy, (_e29.x + _e34.x));
    u_xlat0_ = _e37;
    let _e39 = u_xlat0_;
    let _e44 = _f_buffer1_.f_cb1_[4];
    u_xlat0_.x = (_e39.x * _e44.x);
    let _e47 = vs_TEXCOORD0_1;
    let _e52 = _f_buffer0_.f_cb0_[4];
    let _e57 = hscard_bias.values[0];
    let _e60 = textureSampleBias(f_t0_, samplerf_s0_, _e47.zw, (_e52.x + _e57.x));
    u_xlat1_ = _e60;
    let _e61 = u_xlat1_;
    let _e65 = _f_buffer1_.f_cb1_[0];
    u_xlat1_ = (_e61 * _e65);
    let _e68 = u_xlat0_;
    let _e70 = u_xlat1_;
    u_xlat0_.w = (_e68.x * _e70.w);
    let _e73 = u_xlat0_;
    let _e75 = u_xlat1_;
    let _e77 = vs_COLOR0_1;
    let _e79 = (_e75.xyz * _e77.xyz);
    u_xlat0_.x = _e79.x;
    u_xlat0_.y = _e79.y;
    u_xlat0_.z = _e79.z;
    let _e86 = u_xlat0_;
    let _e90 = _f_buffer1_.f_cb1_[1];
    SV_TARGET0_ = (_e86 * _e90.xxxx);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e28 = SV_TARGET0_;
    return FragmentOutput(_e28);
}
