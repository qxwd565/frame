struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct FragmentOutput {
    @location(0) SV_Target0_: vec4<f32>,
}

@group(1) @binding(31) 
var<uniform> hscard_bias: HScardSamplerBias;
@group(1) @binding(0) 
var<uniform> _f_buffer0_: f_buffer0_;
@group(3) @binding(1) 
var samplerf_s0_: sampler;
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    let _e10 = vs_TEXCOORD0_1;
    let _e15 = _f_buffer0_.f_cb0_[4];
    let _e20 = hscard_bias.values[0];
    let _e23 = textureSampleBias(f_t0_, samplerf_s0_, _e10.xy, (_e15.x + _e20.x));
    SV_Target0_ = _e23;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    main_1();
    let _e17 = SV_Target0_;
    return FragmentOutput(_e17);
}
