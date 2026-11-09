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
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_TARGET0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);

    u_xlat0_.y = 1f;
    let _e24 = vs_TEXCOORD0_1;
    let _e29 = _f_buffer0_.f_cb0_[4];
    let _e34 = hscard_bias.values[0];
    let _e37 = textureSampleBias(f_t0_, samplerf_s0_, _e24.xy, (_e29.x + _e34.x));
    u_xlat1_ = _e37;
    let _e43 = u_xlat1_;
    u_xlat0_.x = dot(vec3<f32>(0.3f, 0.59f, 0.11f), _e43.xyz);
    let _e46 = u_xlat0_;
    let _e48 = u_xlat1_;
    u_xlat0_ = (_e46.xxxy + -(_e48));
    let _e54 = _f_buffer1_.f_cb1_[2];
    let _e56 = u_xlat0_;
    let _e58 = u_xlat1_;
    u_xlat0_ = ((_e54.xxxx * _e56) + _e58);
    let _e64 = _f_buffer1_.f_cb1_[2];
    u_xlat1_.x = _e64.w;
    u_xlat1_.w = 1f;
    let _e68 = u_xlat0_;
    let _e70 = u_xlat1_;
    u_xlat1_ = (-(_e68) + _e70.xxxw);
    let _e76 = _f_buffer1_.f_cb1_[2];
    let _e78 = u_xlat1_;
    let _e80 = u_xlat0_;
    u_xlat0_ = ((_e76.yyyy * _e78) + _e80);
    let _e82 = u_xlat0_;
    let _e83 = vs_COLOR0_1;
    SV_TARGET0_ = (_e82 * _e83);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e24 = SV_TARGET0_;
    return FragmentOutput(_e24);
}
