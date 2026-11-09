struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct FragmentOutput {
    @location(0) SV_TARGET0_: vec4<f32>,
}

@group(1) @binding(31) 
var<uniform> hscard_bias: HScardSamplerBias;
@group(1) @binding(0) 
var<uniform> _f_buffer0_: f_buffer0_;
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

    let _e21 = vs_TEXCOORD0_1;
    let _e26 = _f_buffer0_.f_cb0_[4];
    let _e31 = hscard_bias.values[0];
    let _e34 = textureSampleBias(f_t0_, samplerf_s0_, _e21.xy, (_e26.x + _e31.x));
    u_xlat0_ = _e34;
    let _e35 = vs_TEXCOORD0_1;
    let _e40 = _f_buffer0_.f_cb0_[4];
    let _e45 = hscard_bias.values[1];
    let _e48 = textureSampleBias(f_t1_, samplerf_s1_, _e35.zw, (_e40.x + _e45.x));
    u_xlat1_ = _e48;
    let _e50 = u_xlat1_;
    u_xlat0_.w = _e50.x;
    let _e52 = u_xlat0_;
    let _e53 = vs_COLOR0_1;
    SV_TARGET0_ = (_e52 * _e53);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e25 = SV_TARGET0_;
    return FragmentOutput(_e25);
}
