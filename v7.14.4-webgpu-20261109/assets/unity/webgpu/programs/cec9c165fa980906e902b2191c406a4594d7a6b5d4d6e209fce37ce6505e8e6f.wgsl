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
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec3<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> vs_COLOR1_1: vec4<f32>;
var<private> SV_TARGET0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);

    let _e16 = vs_TEXCOORD0_1;
    let _e21 = _f_buffer0_.f_cb0_[4];
    let _e26 = hscard_bias.values[0];
    let _e29 = textureSampleBias(f_t0_, samplerf_s0_, _e16.xy, (_e21.x + _e26.x));
    u_xlat0_ = _e29;
    let _e30 = u_xlat0_;
    let _e32 = u_xlat0_;
    let _e34 = vs_COLOR0_1;
    let _e36 = (_e32.xyz * _e34.xyz);
    u_xlat0_.x = _e36.x;
    u_xlat0_.y = _e36.y;
    u_xlat0_.z = _e36.z;
    let _e43 = u_xlat0_;
    let _e45 = u_xlat0_;
    let _e47 = vs_COLOR1_1;
    let _e49 = (_e45.xyz * _e47.xyz);
    u_xlat0_.x = _e49.x;
    u_xlat0_.y = _e49.y;
    u_xlat0_.z = _e49.z;
    let _e57 = vs_TEXCOORD0_1;
    u_xlat0_.w = _e57.z;
    let _e59 = u_xlat0_;
    let _e60 = vs_TEXCOORD0_1;
    SV_TARGET0_ = (_e59 * _e60.zzzz);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec3<f32>, @location(10) vs_COLOR0_: vec4<f32>, @location(11) vs_COLOR1_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_COLOR0_1 = vs_COLOR0_;
    vs_COLOR1_1 = vs_COLOR1_;
    main_1();
    let _e25 = SV_TARGET0_;
    return FragmentOutput(_e25);
}
