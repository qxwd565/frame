struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct FragmentOutput {
    @location(0) SV_TARGET0_: vec4<f32>,
}

@group(1) @binding(31) 
var<uniform> hscard_bias: HScardSamplerBias;
@group(1) @binding(0) 
var<uniform> _f_buffer0_: f_buffer0_;
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

    let _e22 = vs_TEXCOORD0_1;
    let _e27 = _f_buffer0_.f_cb0_[4];
    let _e32 = hscard_bias.values[0];
    let _e35 = textureSampleBias(f_t0_, samplerf_s0_, _e22.xy, (_e27.x + _e32.x));
    u_xlat0_ = _e35;
    let _e36 = u_xlat0_;
    let _e38 = u_xlat0_;
    let _e40 = vs_COLOR0_1;
    let _e42 = (_e38.xyz + _e40.xyz);
    u_xlat0_.x = _e42.x;
    u_xlat0_.y = _e42.y;
    u_xlat0_.z = _e42.z;
    let _e49 = vs_TEXCOORD1_1;
    let _e54 = _f_buffer0_.f_cb0_[4];
    let _e59 = hscard_bias.values[1];
    let _e62 = textureSampleBias(f_t1_, samplerf_s1_, _e49.xy, (_e54.x + _e59.x));
    u_xlat1_ = _e62;
    let _e63 = u_xlat1_;
    let _e65 = u_xlat1_;
    let _e67 = vs_COLOR0_1;
    let _e69 = (_e65.xyz + _e67.xyz);
    u_xlat1_.x = _e69.x;
    u_xlat1_.y = _e69.y;
    u_xlat1_.z = _e69.z;
    let _e76 = SV_TARGET0_;
    let _e78 = u_xlat0_;
    let _e80 = u_xlat1_;
    let _e82 = min(_e78.xyz, _e80.xyz);
    SV_TARGET0_.x = _e82.x;
    SV_TARGET0_.y = _e82.y;
    SV_TARGET0_.z = _e82.z;
    SV_TARGET0_.w = 0f;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec2<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e29 = SV_TARGET0_;
    return FragmentOutput(_e29);
}
