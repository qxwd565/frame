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
    var u_xlat2_: vec4<f32> = vec4(0f);

    let _e29 = vs_TEXCOORD1_1;
    let _e34 = _f_buffer0_.f_cb0_[4];
    let _e39 = hscard_bias.values[1];
    let _e42 = textureSampleBias(f_t1_, samplerf_s1_, _e29.xy, (_e34.x + _e39.x));
    u_xlat0_ = _e42;
    let _e43 = u_xlat0_;
    let _e47 = _f_buffer1_.f_cb1_[1];
    u_xlat0_ = (_e43 * _e47);
    let _e49 = u_xlat0_;
    let _e53 = _f_buffer1_.f_cb1_[2];
    u_xlat0_ = (_e49 * _e53.xxxx);
    let _e56 = vs_TEXCOORD0_1;
    let _e61 = _f_buffer0_.f_cb0_[4];
    let _e66 = hscard_bias.values[0];
    let _e69 = textureSampleBias(f_t0_, samplerf_s0_, _e56.xy, (_e61.x + _e66.x));
    u_xlat1_ = _e69;
    let _e70 = u_xlat1_;
    let _e71 = u_xlat0_;
    let _e73 = u_xlat1_;
    u_xlat2_ = ((_e70 * _e71) + -(_e73));
    let _e76 = u_xlat0_;
    let _e78 = u_xlat2_;
    let _e80 = u_xlat1_;
    u_xlat0_ = ((_e76.wwww * _e78) + _e80);
    let _e82 = u_xlat0_;
    u_xlat1_ = (_e82 + vec4<f32>(0.15f, 0.15f, 0.15f, 0.15f));
    let _e89 = u_xlat1_;
    let _e90 = vs_COLOR0_1;
    u_xlat1_ = (_e89 * _e90);
    let _e92 = u_xlat0_;
    let _e93 = u_xlat1_;
    SV_TARGET0_ = min(_e92, _e93);
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
