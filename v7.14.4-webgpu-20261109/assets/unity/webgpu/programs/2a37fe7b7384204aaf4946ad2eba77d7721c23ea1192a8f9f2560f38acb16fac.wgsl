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
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat6_: f32 = 0f;

    let _e25 = vs_TEXCOORD0_1;
    let _e30 = _f_buffer0_.f_cb0_[4];
    let _e35 = hscard_bias.values[0];
    let _e38 = textureSampleBias(f_t0_, samplerf_s0_, _e25.xy, (_e30.x + _e35.x));
    u_xlat0_ = _e38;
    let _e39 = u_xlat0_;
    let _e44 = _f_buffer1_.f_cb1_[2];
    let _e50 = _f_buffer1_.f_cb1_[3];
    u_xlat6_ = ((_e39.w * _e44.w) + -(_e50.x));
    let _e54 = u_xlat1_;
    let _e56 = u_xlat0_;
    let _e61 = _f_buffer1_.f_cb1_[2];
    let _e63 = (_e56.xyz * _e61.xyz);
    u_xlat1_.x = _e63.x;
    u_xlat1_.y = _e63.y;
    u_xlat1_.z = _e63.z;
    let _e71 = u_xlat6_;
    u_xlat1_.w = ceil(_e71);
    let _e73 = u_xlat1_;
    let _e74 = vs_COLOR0_1;
    SV_Target0_ = (_e73 * _e74);
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
