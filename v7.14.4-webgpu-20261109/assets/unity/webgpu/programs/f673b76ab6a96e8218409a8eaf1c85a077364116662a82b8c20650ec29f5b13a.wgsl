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
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD1_1: vec2<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_TARGET0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);

    let _e25 = vs_TEXCOORD1_1;
    let _e30 = _f_buffer0_.f_cb0_[4];
    let _e35 = hscard_bias.values[1];
    let _e38 = textureSampleBias(f_t1_, samplerf_s1_, _e25.xy, (_e30.x + _e35.x));
    u_xlat0_ = _e38;
    let _e39 = u_xlat0_;
    let _e43 = _f_buffer1_.f_cb1_[3];
    u_xlat0_ = (_e39 * _e43);
    let _e45 = vs_TEXCOORD0_1;
    let _e50 = _f_buffer0_.f_cb0_[4];
    let _e55 = hscard_bias.values[0];
    let _e58 = textureSampleBias(f_t0_, samplerf_s0_, _e45.xy, (_e50.x + _e55.x));
    u_xlat1_ = _e58;
    let _e59 = u_xlat0_;
    let _e63 = _f_buffer1_.f_cb1_[4];
    let _e66 = u_xlat1_;
    u_xlat0_ = ((_e59 * _e63.xxxx) + _e66);
    let _e68 = u_xlat0_;
    let _e69 = vs_COLOR0_1;
    SV_TARGET0_ = (_e68 * _e69);
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
