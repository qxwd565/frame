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
@group(3) @binding(5) 
var samplerf_s2_: sampler;
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
@group(3) @binding(4) 
var f_t2_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec4<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_TARGET0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);

    let _e27 = vs_TEXCOORD0_1;
    let _e32 = _f_buffer0_.f_cb0_[4];
    let _e37 = hscard_bias.values[2];
    let _e40 = textureSampleBias(f_t2_, samplerf_s2_, _e27.zw, (_e32.x + _e37.x));
    u_xlat0_ = _e40;
    let _e41 = vs_TEXCOORD0_1;
    let _e46 = _f_buffer0_.f_cb0_[4];
    let _e51 = hscard_bias.values[1];
    let _e54 = textureSampleBias(f_t1_, samplerf_s1_, _e41.xy, (_e46.x + _e51.x));
    u_xlat1_ = _e54;
    let _e55 = vs_TEXCOORD0_1;
    let _e60 = _f_buffer0_.f_cb0_[4];
    let _e65 = hscard_bias.values[0];
    let _e68 = textureSampleBias(f_t0_, samplerf_s0_, _e55.xy, (_e60.x + _e65.x));
    u_xlat2_ = _e68;
    let _e69 = u_xlat1_;
    let _e70 = u_xlat2_;
    u_xlat1_ = (_e69 + -(_e70));
    let _e73 = u_xlat0_;
    let _e75 = u_xlat1_;
    let _e77 = u_xlat2_;
    u_xlat0_ = ((_e73.xxxx * _e75) + _e77);
    let _e79 = u_xlat0_;
    let _e80 = vs_COLOR0_1;
    SV_TARGET0_ = (_e79 * _e80);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e29 = SV_TARGET0_;
    return FragmentOutput(_e29);
}
