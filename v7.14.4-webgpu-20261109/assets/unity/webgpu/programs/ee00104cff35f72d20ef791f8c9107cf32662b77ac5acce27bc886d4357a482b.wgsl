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
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> SV_TARGET0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);

    let _e21 = vs_TEXCOORD0_1;
    let _e26 = _f_buffer0_.f_cb0_[4];
    let _e31 = hscard_bias.values[0];
    let _e34 = textureSampleBias(f_t0_, samplerf_s0_, _e21.xy, (_e26.x + _e31.x));
    u_xlat0_ = _e34;
    let _e35 = u_xlat1_;
    let _e40 = _f_buffer1_.f_cb1_[2];
    let _e45 = _f_buffer1_.f_cb1_[3];
    let _e47 = (_e40.xyz * _e45.www);
    u_xlat1_.x = _e47.x;
    u_xlat1_.y = _e47.y;
    u_xlat1_.z = _e47.z;
    let _e58 = _f_buffer1_.f_cb1_[3];
    let _e63 = _f_buffer1_.f_cb1_[4];
    u_xlat1_.w = (_e58.w * _e63.x);
    let _e66 = u_xlat0_;
    let _e67 = u_xlat1_;
    SV_TARGET0_ = (_e66 * _e67);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    main_1();
    let _e20 = SV_TARGET0_;
    return FragmentOutput(_e20);
}
