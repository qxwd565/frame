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
var<private> vs_TEXCOORD1_1: vec2<f32>;
var<private> vs_TEXCOORD2_1: vec2<f32>;
var<private> vs_TEXCOORD3_1: vec2<f32>;
var<private> vs_TEXCOORD4_1: vec2<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);

    let _e26 = vs_TEXCOORD1_1;
    let _e31 = _f_buffer0_.f_cb0_[4];
    let _e36 = hscard_bias.values[0];
    let _e39 = textureSampleBias(f_t0_, samplerf_s0_, _e26.xy, (_e31.x + _e36.x));
    u_xlat0_ = _e39;
    let _e40 = vs_TEXCOORD2_1;
    let _e45 = _f_buffer0_.f_cb0_[4];
    let _e50 = hscard_bias.values[0];
    let _e53 = textureSampleBias(f_t0_, samplerf_s0_, _e40.xy, (_e45.x + _e50.x));
    u_xlat1_ = _e53;
    let _e55 = u_xlat0_;
    let _e57 = u_xlat1_;
    u_xlat0_.x = (_e55.w + _e57.w);
    let _e60 = vs_TEXCOORD3_1;
    let _e65 = _f_buffer0_.f_cb0_[4];
    let _e70 = hscard_bias.values[0];
    let _e73 = textureSampleBias(f_t0_, samplerf_s0_, _e60.xy, (_e65.x + _e70.x));
    u_xlat1_ = _e73;
    let _e75 = u_xlat0_;
    let _e77 = u_xlat1_;
    u_xlat0_.x = (_e75.x + _e77.w);
    let _e80 = vs_TEXCOORD4_1;
    let _e85 = _f_buffer0_.f_cb0_[4];
    let _e90 = hscard_bias.values[0];
    let _e93 = textureSampleBias(f_t0_, samplerf_s0_, _e80.xy, (_e85.x + _e90.x));
    u_xlat1_ = _e93;
    let _e95 = u_xlat0_;
    let _e97 = u_xlat1_;
    u_xlat0_.x = (_e95.x + _e97.w);
    let _e101 = u_xlat0_;
    let _e106 = _f_buffer1_.f_cb1_[2];
    u_xlat0_.w = (_e101.x * _e106.z);
    let _e109 = vs_TEXCOORD0_1;
    let _e114 = _f_buffer0_.f_cb0_[4];
    let _e119 = hscard_bias.values[0];
    let _e122 = textureSampleBias(f_t0_, samplerf_s0_, _e109.xy, (_e114.x + _e119.x));
    u_xlat1_ = _e122;
    let _e123 = u_xlat0_;
    let _e125 = u_xlat1_;
    let _e126 = _e125.xyz;
    u_xlat0_.x = _e126.x;
    u_xlat0_.y = _e126.y;
    u_xlat0_.z = _e126.z;
    let _e133 = u_xlat0_;
    let _e134 = vs_COLOR0_1;
    SV_Target0_ = (_e133 * _e134);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec2<f32>, @location(2) vs_TEXCOORD2_: vec2<f32>, @location(3) vs_TEXCOORD3_: vec2<f32>, @location(4) vs_TEXCOORD4_: vec2<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_TEXCOORD2_1 = vs_TEXCOORD2_;
    vs_TEXCOORD3_1 = vs_TEXCOORD3_;
    vs_TEXCOORD4_1 = vs_TEXCOORD4_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e40 = SV_Target0_;
    return FragmentOutput(_e40);
}
