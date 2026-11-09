struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 8>,
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
    let _e47 = _f_buffer1_.f_cb1_[3];
    u_xlat0_ = (_e43 * _e47);
    let _e49 = u_xlat0_;
    let _e53 = _f_buffer1_.f_cb1_[4];
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
    let _e87 = u_xlat0_;
    u_xlat1_.x = dot(vec3<f32>(0.3f, 0.59f, 0.11f), _e87.xyz);
    let _e93 = _f_buffer1_.f_cb1_[2];
    let _e97 = _f_buffer1_.f_cb1_[5];
    u_xlat2_ = (_e93 + -(_e97));
    let _e100 = u_xlat1_;
    let _e102 = u_xlat2_;
    let _e107 = _f_buffer1_.f_cb1_[5];
    u_xlat1_ = ((_e100.xxxx * _e102) + _e107);
    let _e109 = u_xlat0_;
    let _e111 = u_xlat1_;
    u_xlat1_ = (-(_e109) + _e111);
    let _e116 = _f_buffer1_.f_cb1_[6];
    let _e118 = u_xlat1_;
    let _e120 = u_xlat0_;
    u_xlat0_ = ((_e116.xxxx * _e118) + _e120);
    let _e122 = u_xlat0_;
    let _e127 = _f_buffer1_.f_cb1_[7];
    u_xlat1_ = (-(_e122) + _e127);
    let _e132 = _f_buffer1_.f_cb1_[6];
    let _e134 = u_xlat1_;
    let _e136 = u_xlat0_;
    u_xlat0_ = ((_e132.yyyy * _e134) + _e136);
    let _e138 = u_xlat0_;
    u_xlat1_ = (_e138 + vec4<f32>(0.15f, 0.15f, 0.15f, 0.15f));
    let _e145 = u_xlat1_;
    let _e146 = vs_COLOR0_1;
    u_xlat1_ = (_e145 * _e146);
    let _e148 = u_xlat0_;
    let _e149 = u_xlat1_;
    u_xlat0_ = min(_e148, _e149);
    let _e151 = u_xlat0_;
    let _e155 = _f_buffer1_.f_cb1_[6];
    SV_TARGET0_ = (_e151 * _e155.zzzz);
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
