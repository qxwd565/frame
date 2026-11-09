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
@group(3) @binding(5) 
var samplerf_s2_: sampler;
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
@group(3) @binding(4) 
var f_t2_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD1_1: vec2<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_TARGET0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);

    let _e27 = vs_TEXCOORD0_1;
    let _e32 = _f_buffer0_.f_cb0_[4];
    let _e37 = hscard_bias.values[1];
    let _e40 = textureSampleBias(f_t1_, samplerf_s1_, _e27.xy, (_e32.x + _e37.x));
    u_xlat0_ = _e40;
    let _e41 = vs_TEXCOORD1_1;
    let _e46 = _f_buffer0_.f_cb0_[4];
    let _e51 = hscard_bias.values[2];
    let _e54 = textureSampleBias(f_t2_, samplerf_s2_, _e41.xy, (_e46.x + _e51.x));
    u_xlat1_ = _e54;
    let _e55 = u_xlat0_;
    let _e56 = u_xlat1_;
    u_xlat0_ = (_e55 * _e56);
    let _e58 = u_xlat0_;
    let _e62 = _f_buffer1_.f_cb1_[1];
    u_xlat0_ = (_e58 * _e62.xxxx);
    let _e65 = vs_TEXCOORD0_1;
    let _e70 = _f_buffer0_.f_cb0_[4];
    let _e75 = hscard_bias.values[0];
    let _e78 = textureSampleBias(f_t0_, samplerf_s0_, _e65.xy, (_e70.x + _e75.x));
    u_xlat1_ = _e78;
    let _e79 = u_xlat0_;
    let _e86 = u_xlat1_;
    u_xlat0_ = ((_e79 * vec4<f32>(0.5f, 0.5f, 0.5f, 0.5f)) + _e86);
    let _e88 = u_xlat0_;
    u_xlat0_ = clamp(_e88, vec4(0f), vec4(1f));
    let _e94 = u_xlat0_;
    let _e95 = vs_COLOR0_1;
    SV_TARGET0_ = (_e94 * _e95);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec2<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e36 = SV_TARGET0_;
    return FragmentOutput(_e36);
}
