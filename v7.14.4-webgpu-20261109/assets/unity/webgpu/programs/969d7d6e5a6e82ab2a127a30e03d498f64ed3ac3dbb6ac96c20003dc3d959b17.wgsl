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
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD1_1: vec4<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_TARGET0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);

    let _e25 = vs_TEXCOORD0_1;
    let _e30 = _f_buffer0_.f_cb0_[4];
    let _e35 = hscard_bias.values[0];
    let _e38 = textureSampleBias(f_t0_, samplerf_s0_, _e25.xy, (_e30.x + _e35.x));
    u_xlat0_ = _e38;
    let _e39 = u_xlat0_;
    let _e43 = _f_buffer1_.f_cb1_[0];
    u_xlat0_ = (_e39 * _e43);
    let _e45 = u_xlat1_;
    let _e47 = u_xlat0_;
    let _e49 = vs_COLOR0_1;
    let _e51 = (_e47.xyz * _e49.xyz);
    u_xlat1_.x = _e51.x;
    u_xlat1_.y = _e51.y;
    u_xlat1_.z = _e51.z;
    let _e58 = SV_TARGET0_;
    let _e60 = u_xlat1_;
    let _e67 = u_xlat0_;
    let _e69 = ((_e60.xyz * vec3<f32>(2f, 2f, 2f)) + _e67.xyz);
    SV_TARGET0_.x = _e69.x;
    SV_TARGET0_.y = _e69.y;
    SV_TARGET0_.z = _e69.z;
    let _e76 = u_xlat0_;
    let _e78 = vs_TEXCOORD1_1;
    let _e80 = vs_TEXCOORD1_1;
    let _e82 = (_e78.zw + _e80.xy);
    u_xlat0_.x = _e82.x;
    u_xlat0_.y = _e82.y;
    let _e87 = u_xlat0_;
    let _e92 = _f_buffer0_.f_cb0_[4];
    let _e97 = hscard_bias.values[1];
    let _e100 = textureSampleBias(f_t1_, samplerf_s1_, _e87.xy, (_e92.x + _e97.x));
    u_xlat1_ = _e100;
    let _e102 = u_xlat1_;
    let _e107 = _f_buffer1_.f_cb1_[1];
    u_xlat0_.x = (_e102.x * _e107.x);
    let _e111 = u_xlat0_;
    let _e113 = u_xlat0_;
    SV_TARGET0_.w = (_e111.w * _e113.x);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec4<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e32 = SV_TARGET0_;
    return FragmentOutput(_e32);
}
