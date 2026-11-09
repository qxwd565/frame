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
var<private> vs_TEXCOORD6_1: vec2<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);

    let _e25 = vs_TEXCOORD6_1;
    let _e30 = _f_buffer0_.f_cb0_[4];
    let _e35 = hscard_bias.values[1];
    let _e38 = textureSampleBias(f_t1_, samplerf_s1_, _e25.xy, (_e30.x + _e35.x));
    u_xlat0_ = _e38;
    let _e40 = u_xlat0_;
    u_xlat0_.x = (_e40.x + -1f);
    let _e49 = _f_buffer1_.f_cb1_[3];
    let _e51 = u_xlat0_;
    u_xlat0_.x = ((_e49.x * _e51.x) + 1f);
    let _e56 = vs_TEXCOORD0_1;
    let _e61 = _f_buffer0_.f_cb0_[4];
    let _e66 = hscard_bias.values[0];
    let _e69 = textureSampleBias(f_t0_, samplerf_s0_, _e56.xy, (_e61.x + _e66.x));
    u_xlat1_ = _e69;
    let _e70 = u_xlat0_;
    let _e72 = u_xlat0_;
    let _e74 = u_xlat1_;
    let _e76 = (_e72.xxx * _e74.xyz);
    u_xlat0_.x = _e76.x;
    u_xlat0_.y = _e76.y;
    u_xlat0_.z = _e76.z;
    let _e84 = u_xlat1_;
    SV_Target0_.w = _e84.w;
    let _e86 = SV_Target0_;
    let _e88 = u_xlat0_;
    let _e90 = vs_COLOR0_1;
    let _e92 = (_e88.xyz * _e90.xyz);
    SV_Target0_.x = _e92.x;
    SV_Target0_.y = _e92.y;
    SV_Target0_.z = _e92.z;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(6) vs_TEXCOORD6_: vec2<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD6_1 = vs_TEXCOORD6_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e32 = SV_Target0_;
    return FragmentOutput(_e32);
}
