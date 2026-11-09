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
var<private> vs_COLOR0_1: vec4<f32>;
var<private> vs_COLOR1_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);

    let _e16 = vs_TEXCOORD0_1;
    let _e21 = _f_buffer0_.f_cb0_[4];
    let _e26 = hscard_bias.values[0];
    let _e29 = textureSampleBias(f_t0_, samplerf_s0_, _e16.xy, (_e21.x + _e26.x));
    u_xlat0_ = _e29;
    let _e30 = u_xlat0_;
    let _e31 = vs_COLOR0_1;
    let _e33 = vs_COLOR1_1;
    SV_Target0_ = ((_e30 * _e31) + _e33);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(10) vs_COLOR0_: vec4<f32>, @location(11) vs_COLOR1_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_COLOR0_1 = vs_COLOR0_;
    vs_COLOR1_1 = vs_COLOR1_;
    main_1();
    let _e25 = SV_Target0_;
    return FragmentOutput(_e25);
}
