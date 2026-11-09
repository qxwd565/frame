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
    var u_xlat2_: vec2<f32> = vec2(0f);

    let _e25 = vs_TEXCOORD1_1;
    let _e30 = _f_buffer0_.f_cb0_[4];
    let _e35 = hscard_bias.values[1];
    let _e38 = textureSampleBias(f_t1_, samplerf_s1_, _e25.xy, (_e30.x + _e35.x));
    u_xlat0_ = _e38;
    let _e39 = u_xlat2_;
    let _e44 = _f_buffer1_.f_cb1_[3];
    let _e49 = _f_buffer1_.f_cb1_[4];
    let _e51 = (_e44.xy * _e49.xx);
    u_xlat2_.x = _e51.x;
    u_xlat2_.y = _e51.y;
    let _e56 = u_xlat0_;
    let _e58 = u_xlat0_;
    let _e60 = u_xlat2_;
    let _e63 = vs_TEXCOORD0_1;
    let _e65 = ((_e58.xy * _e60.xy) + _e63.xy);
    u_xlat0_.x = _e65.x;
    u_xlat0_.y = _e65.y;
    let _e70 = u_xlat0_;
    let _e75 = _f_buffer0_.f_cb0_[4];
    let _e80 = hscard_bias.values[0];
    let _e83 = textureSampleBias(f_t0_, samplerf_s0_, _e70.xy, (_e75.x + _e80.x));
    u_xlat0_ = _e83;
    let _e84 = u_xlat0_;
    let _e85 = vs_COLOR0_1;
    SV_TARGET0_ = (_e84 * _e85);
    let _e87 = SV_TARGET0_;
    SV_TARGET0_ = clamp(_e87, vec4(0f), vec4(1f));
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
