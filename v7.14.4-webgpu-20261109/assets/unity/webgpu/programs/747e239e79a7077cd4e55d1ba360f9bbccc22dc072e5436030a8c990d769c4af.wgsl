struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 4>,
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
@group(3) @binding(3) 
var samplerf_s1_: sampler;
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD1_1: vec2<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);

    let _e29 = vs_TEXCOORD1_1;
    let _e34 = _f_buffer0_.f_cb0_[4];
    let _e39 = hscard_bias.values[1];
    let _e42 = textureSampleBias(f_t1_, samplerf_s1_, _e29.xy, (_e34.x + _e39.x));
    u_xlat0_ = _e42;
    let _e43 = vs_TEXCOORD0_1;
    let _e48 = _f_buffer0_.f_cb0_[4];
    let _e53 = hscard_bias.values[0];
    let _e56 = textureSampleBias(f_t0_, samplerf_s0_, _e43.xy, (_e48.x + _e53.x));
    u_xlat1_ = _e56;
    let _e58 = u_xlat1_;
    let _e64 = _f_buffer1_.f_cb1_[3];
    u_xlat2_.x = (-(_e58.w) + _e64.w);
    let _e68 = u_xlat1_;
    let _e70 = u_xlat2_;
    u_xlat2_.w = (_e68.w * _e70.x);
    let _e73 = u_xlat2_;
    let _e75 = u_xlat1_;
    let _e80 = _f_buffer1_.f_cb1_[3];
    let _e82 = (_e75.xyz * _e80.xyz);
    u_xlat2_.x = _e82.x;
    u_xlat2_.y = _e82.y;
    u_xlat2_.z = _e82.z;
    let _e89 = u_xlat0_;
    let _e90 = u_xlat2_;
    u_xlat0_ = (_e89 * _e90);
    let _e92 = u_xlat0_;
    let _e93 = vs_COLOR0_1;
    SV_Target0_ = (_e92 * _e93);
    let _e95 = SV_Target0_;
    SV_Target0_ = clamp(_e95, vec4(0f), vec4(1f));
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec2<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e32 = SV_Target0_;
    return FragmentOutput(_e32);
}
