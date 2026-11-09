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
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> vs_TEXCOORD1_1: f32;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);

    let _e19 = vs_TEXCOORD0_1;
    let _e24 = _f_buffer0_.f_cb0_[4];
    let _e29 = hscard_bias.values[0];
    let _e32 = textureSampleBias(f_t0_, samplerf_s0_, _e19.xy, (_e24.x + _e29.x));
    u_xlat0_ = _e32;
    let _e33 = u_xlat0_;
    let _e34 = vs_TEXCOORD1_1;
    let _e40 = _f_buffer1_.f_cb1_[2];
    u_xlat0_ = ((_e33 * vec4(_e34)) + -(_e40.zzzz));
    let _e44 = u_xlat0_;
    let _e45 = vs_COLOR0_1;
    SV_Target0_ = (_e44 * _e45);
    return;
}

@fragment 
fn main(@location(10) vs_COLOR0_: vec4<f32>, @location(1) vs_TEXCOORD1_: f32, @location(0) vs_TEXCOORD0_: vec2<f32>) -> FragmentOutput {
    vs_COLOR0_1 = vs_COLOR0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    main_1();
    let _e28 = SV_Target0_;
    return FragmentOutput(_e28);
}
