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
    let _e23 = _f_buffer1_;
    u_xlat0_ = (_e22 * _e23.f_cb1_);
    let _e26 = vs_TEXCOORD0_1;
    let _e31 = _f_buffer0_.f_cb0_[4];
    let _e36 = hscard_bias.values[0];
    let _e39 = textureSampleBias(f_t0_, samplerf_s0_, _e26.xy, (_e31.x + _e36.x));
    u_xlat1_ = _e39;
    let _e40 = u_xlat0_;
    let _e41 = u_xlat1_;
    u_xlat0_ = (_e40 * _e41);
    let _e43 = SV_TARGET0_;
    let _e45 = u_xlat0_;
    let _e47 = u_xlat0_;
    let _e49 = (_e45.www * _e47.xyz);
    SV_TARGET0_.x = _e49.x;
    SV_TARGET0_.y = _e49.y;
    SV_TARGET0_.z = _e49.z;
    let _e57 = u_xlat0_;
    SV_TARGET0_.w = _e57.w;
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
