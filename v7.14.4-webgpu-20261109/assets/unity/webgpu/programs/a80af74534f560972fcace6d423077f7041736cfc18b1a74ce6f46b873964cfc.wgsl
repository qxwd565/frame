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
var<private> vs_TEXCOORD0_1: vec4<f32>;
var<private> vs_TEXCOORD1_1: vec4<f32>;
var<private> SV_TARGET0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: f32 = 0f;

    let _e27 = vs_TEXCOORD1_1;
    let _e32 = _f_buffer0_.f_cb0_[4];
    let _e37 = hscard_bias.values[1];
    let _e40 = textureSampleBias(f_t1_, samplerf_s1_, _e27.zw, (_e32.x + _e37.x));
    u_xlat0_ = _e40;
    let _e42 = u_xlat0_;
    let _e47 = _f_buffer1_.f_cb1_[2];
    u_xlat0_.x = (_e42.z * _e47.z);
    let _e50 = vs_TEXCOORD0_1;
    let _e55 = _f_buffer0_.f_cb0_[4];
    let _e60 = hscard_bias.values[1];
    let _e63 = textureSampleBias(f_t1_, samplerf_s1_, _e50.xy, (_e55.x + _e60.x));
    u_xlat1_ = _e63;
    let _e65 = u_xlat0_;
    let _e67 = u_xlat1_;
    u_xlat0_.x = (_e65.x * _e67.y);
    let _e70 = vs_TEXCOORD0_1;
    let _e75 = _f_buffer0_.f_cb0_[4];
    let _e80 = hscard_bias.values[1];
    let _e83 = textureSampleBias(f_t1_, samplerf_s1_, _e70.zw, (_e75.x + _e80.x));
    u_xlat1_ = _e83;
    let _e84 = u_xlat1_;
    let _e89 = _f_buffer1_.f_cb1_[2];
    u_xlat2_ = (_e84.x * _e89.y);
    let _e93 = u_xlat0_;
    let _e95 = u_xlat2_;
    u_xlat0_.w = (_e93.x * _e95);
    let _e97 = vs_TEXCOORD1_1;
    let _e102 = _f_buffer0_.f_cb0_[4];
    let _e107 = hscard_bias.values[0];
    let _e110 = textureSampleBias(f_t0_, samplerf_s0_, _e97.xy, (_e102.x + _e107.x));
    u_xlat1_ = _e110;
    let _e111 = u_xlat0_;
    let _e113 = u_xlat1_;
    let _e114 = _e113.xyz;
    u_xlat0_.x = _e114.x;
    u_xlat0_.y = _e114.y;
    u_xlat0_.z = _e114.z;
    let _e121 = u_xlat0_;
    let _e125 = _f_buffer1_.f_cb1_[2];
    u_xlat0_ = (_e121 * _e125.xxxx);
    let _e128 = u_xlat0_;
    let _e132 = _f_buffer1_.f_cb1_[1];
    SV_TARGET0_ = (_e128 * _e132);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(1) vs_TEXCOORD1_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    main_1();
    let _e28 = SV_TARGET0_;
    return FragmentOutput(_e28);
}
