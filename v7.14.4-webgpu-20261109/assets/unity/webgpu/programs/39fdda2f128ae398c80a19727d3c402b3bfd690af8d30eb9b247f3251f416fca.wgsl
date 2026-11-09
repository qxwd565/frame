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
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> SV_TARGET0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: f32 = 0f;

    let _e21 = vs_TEXCOORD0_1;
    let _e26 = _f_buffer0_.f_cb0_[4];
    let _e31 = hscard_bias.values[0];
    let _e34 = textureSampleBias(f_t0_, samplerf_s0_, _e21.xy, (_e26.x + _e31.x));
    u_xlat0_ = _e34;
    let _e35 = u_xlat0_;
    let _e37 = vs_COLOR0_1;
    u_xlat1_ = (_e35.x + _e37.w);
    let _e40 = u_xlat1_;
    u_xlat1_ = (_e40 + -1f);
    let _e44 = u_xlat1_;
    let _e48 = _f_buffer1_.f_cb1_[2];
    u_xlat1_ = (_e44 * _e48.x);
    let _e51 = u_xlat1_;
    u_xlat1_ = min(_e51, 1f);
    let _e55 = u_xlat1_;
    let _e56 = u_xlat0_;
    u_xlat0_.x = (_e55 * _e56.x);
    let _e59 = u_xlat0_;
    let _e61 = vs_COLOR0_1;
    SV_TARGET0_ = (_e59.xxxx * _e61);
    let _e63 = SV_TARGET0_;
    SV_TARGET0_ = clamp(_e63, vec4(0f), vec4(1f));
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
