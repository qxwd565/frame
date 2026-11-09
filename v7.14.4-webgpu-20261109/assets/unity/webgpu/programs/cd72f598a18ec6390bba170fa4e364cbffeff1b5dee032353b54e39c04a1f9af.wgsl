struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 2>,
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
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD3_1: f32;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: f32 = 0f;

    let _e25 = vs_TEXCOORD0_1;
    let _e30 = _f_buffer0_.f_cb0_[4];
    let _e35 = hscard_bias.values[0];
    let _e38 = textureSampleBias(f_t0_, samplerf_s0_, _e25.xy, (_e30.x + _e35.x));
    u_xlat0_ = _e38;
    let _e39 = u_xlat0_;
    u_xlat1_ = log2(_e39);
    let _e41 = u_xlat1_;
    let _e45 = _f_buffer1_.f_cb1_[1];
    u_xlat1_ = (_e41 * _e45.zzzz);
    let _e48 = u_xlat1_;
    u_xlat1_ = exp2(_e48);
    let _e50 = u_xlat0_;
    let _e52 = vs_TEXCOORD3_1;
    u_xlat2_ = (_e50.w * _e52);
    let _e54 = u_xlat2_;
    let _e56 = u_xlat1_;
    let _e58 = u_xlat0_;
    SV_Target0_ = ((vec4(_e54) * _e56) + _e58);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(3) vs_TEXCOORD3_: f32) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD3_1 = vs_TEXCOORD3_;
    main_1();
    let _e24 = SV_Target0_;
    return FragmentOutput(_e24);
}
