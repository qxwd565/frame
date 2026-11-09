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
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);

    let _e22 = vs_TEXCOORD0_1;
    let _e27 = _f_buffer0_.f_cb0_[4];
    let _e32 = hscard_bias.values[0];
    let _e35 = textureSampleBias(f_t0_, samplerf_s0_, _e22.xy, (_e27.x + _e32.x));
    u_xlat0_ = _e35;
    let _e37 = u_xlat0_;
    let _e43 = _f_buffer1_.f_cb1_[1];
    u_xlat1_.x = (-(_e37.w) + _e43.w);
    let _e47 = u_xlat0_;
    let _e49 = u_xlat1_;
    u_xlat1_.w = (_e47.w * _e49.x);
    let _e52 = u_xlat1_;
    let _e54 = u_xlat0_;
    let _e59 = _f_buffer1_.f_cb1_[1];
    let _e61 = (_e54.xyz * _e59.xyz);
    u_xlat1_.x = _e61.x;
    u_xlat1_.y = _e61.y;
    u_xlat1_.z = _e61.z;
    let _e68 = u_xlat1_;
    let _e69 = vs_COLOR0_1;
    SV_Target0_ = (_e68 * _e69);
    let _e71 = SV_Target0_;
    SV_Target0_ = clamp(_e71, vec4(0f), vec4(1f));
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e24 = SV_Target0_;
    return FragmentOutput(_e24);
}
