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
var<private> vs_TEXCOORD0_1: vec4<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);

    let _e24 = vs_TEXCOORD0_1;
    let _e29 = _f_buffer0_.f_cb0_[4];
    let _e34 = hscard_bias.values[1];
    let _e37 = textureSampleBias(f_t1_, samplerf_s1_, _e24.zw, (_e29.x + _e34.x));
    u_xlat0_ = _e37;
    let _e39 = u_xlat0_;
    u_xlat0_.x = (-(_e39.x) + 1f);
    let _e45 = u_xlat0_;
    let _e50 = _f_buffer1_.f_cb1_[3];
    u_xlat0_.x = (_e45.x + _e50.x);
    let _e54 = u_xlat0_;
    u_xlat0_.x = clamp(_e54.x, 0f, 1f);
    let _e60 = u_xlat0_;
    u_xlat0_.x = log2(_e60.x);
    let _e64 = u_xlat0_;
    let _e69 = _f_buffer1_.f_cb1_[3];
    u_xlat0_.x = (_e64.x * _e69.y);
    let _e73 = u_xlat0_;
    u_xlat0_.x = exp2(_e73.x);
    let _e77 = u_xlat0_;
    u_xlat0_.x = (-(_e77.x) + 1f);
    let _e82 = vs_TEXCOORD0_1;
    let _e87 = _f_buffer0_.f_cb0_[4];
    let _e92 = hscard_bias.values[0];
    let _e95 = textureSampleBias(f_t0_, samplerf_s0_, _e82.xy, (_e87.x + _e92.x));
    u_xlat1_ = _e95;
    let _e96 = u_xlat1_;
    let _e100 = _f_buffer1_.f_cb1_[2];
    u_xlat1_ = (_e96 * _e100);
    let _e103 = u_xlat0_;
    let _e105 = u_xlat1_;
    u_xlat1_.w = (_e103.x * _e105.w);
    let _e108 = u_xlat1_;
    let _e109 = vs_COLOR0_1;
    SV_Target0_ = (_e108 * _e109);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e28 = SV_Target0_;
    return FragmentOutput(_e28);
}
