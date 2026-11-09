struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 6>,
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

    let _e21 = vs_TEXCOORD1_1;
    let _e26 = _f_buffer0_.f_cb0_[4];
    let _e31 = hscard_bias.values[1];
    let _e34 = textureSampleBias(f_t1_, samplerf_s1_, _e21.xy, (_e26.x + _e31.x));
    u_xlat0_ = _e34;
    let _e35 = u_xlat0_;
    let _e37 = u_xlat0_;
    let _e44 = (_e37.xy + vec2<f32>(-0.5f, -0.5f));
    u_xlat0_.x = _e44.x;
    u_xlat0_.y = _e44.y;
    let _e49 = u_xlat0_;
    let _e51 = u_xlat0_;
    let _e56 = _f_buffer1_.f_cb1_[5];
    let _e58 = (_e51.xy * _e56.xy);
    u_xlat0_.x = _e58.x;
    u_xlat0_.y = _e58.y;
    let _e63 = u_xlat0_;
    let _e65 = u_xlat0_;
    let _e70 = _f_buffer1_.f_cb1_[2];
    let _e73 = vs_TEXCOORD0_1;
    let _e75 = ((_e65.xy * _e70.yy) + _e73.xy);
    u_xlat0_.x = _e75.x;
    u_xlat0_.y = _e75.y;
    let _e80 = u_xlat0_;
    let _e85 = _f_buffer0_.f_cb0_[4];
    let _e90 = hscard_bias.values[0];
    let _e93 = textureSampleBias(f_t0_, samplerf_s0_, _e80.xy, (_e85.x + _e90.x));
    u_xlat0_ = _e93;
    let _e94 = u_xlat0_;
    let _e95 = vs_COLOR0_1;
    SV_TARGET0_ = (_e94 * _e95);
    let _e97 = SV_TARGET0_;
    SV_TARGET0_ = clamp(_e97, vec4(0f), vec4(1f));
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
