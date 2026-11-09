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
    let _e42 = _f_buffer1_.f_cb1_[1];
    u_xlat1_.x = (-(_e36.w) + _e42.w);
    let _e46 = u_xlat0_;
    let _e48 = u_xlat1_;
    u_xlat1_.w = (_e46.w * _e48.x);
    let _e51 = u_xlat1_;
    let _e53 = u_xlat0_;
    let _e58 = _f_buffer1_.f_cb1_[1];
    let _e60 = (_e53.xyz * _e58.xyz);
    u_xlat1_.x = _e60.x;
    u_xlat1_.y = _e60.y;
    u_xlat1_.z = _e60.z;
    let _e67 = u_xlat1_;
    let _e68 = u_xlat1_;
    u_xlat0_ = (_e67 + _e68);
    let _e70 = u_xlat0_;
    let _e74 = _f_buffer1_.f_cb1_[2];
    SV_TARGET0_ = (_e70 * _e74.xxxx);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    main_1();
    let _e20 = SV_TARGET0_;
    return FragmentOutput(_e20);
}
