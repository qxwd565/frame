struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 9>,
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
    let _e36 = u_xlat0_;
    u_xlat0_.x = (-(_e36.x) + 1f);
    let _e42 = u_xlat0_;
    let _e47 = _f_buffer1_.f_cb1_[7];
    u_xlat0_.x = (_e42.x + _e47.y);
    let _e51 = u_xlat0_;
    u_xlat0_.x = clamp(_e51.x, 0f, 1f);
    let _e57 = u_xlat0_;
    u_xlat0_.x = log2(_e57.x);
    let _e61 = u_xlat0_;
    let _e66 = _f_buffer1_.f_cb1_[8];
    u_xlat0_.x = (_e61.x * _e66.z);
    let _e70 = u_xlat0_;
    u_xlat0_.x = exp2(_e70.x);
    let _e74 = u_xlat0_;
    u_xlat0_.x = (-(_e74.x) + 1f);
    let _e80 = u_xlat0_;
    let _e85 = _f_buffer1_.f_cb1_[8];
    u_xlat0_.x = (_e80.x * _e85.x);
    let _e88 = u_xlat1_;
    let _e93 = _f_buffer1_.f_cb1_[4];
    let _e98 = _f_buffer1_.f_cb1_[8];
    let _e100 = (_e93.xyz * _e98.xxx);
    u_xlat1_.x = _e100.x;
    u_xlat1_.y = _e100.y;
    u_xlat1_.z = _e100.z;
    let _e111 = _f_buffer1_.f_cb1_[8];
    let _e116 = _f_buffer1_.f_cb1_[8];
    u_xlat1_.w = (_e111.x * _e116.y);
    let _e119 = u_xlat0_;
    let _e121 = u_xlat1_;
    SV_TARGET0_ = (_e119.xxxx * _e121);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    main_1();
    let _e20 = SV_TARGET0_;
    return FragmentOutput(_e20);
}
