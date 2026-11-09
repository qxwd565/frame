struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct FragmentOutput {
    @location(0) SV_Target0_: vec4<f32>,
}

@group(1) @binding(31) 
var<uniform> hscard_bias: HScardSamplerBias;
@group(1) @binding(0) 
var<uniform> _f_buffer0_: f_buffer0_;
@group(3) @binding(1) 
var samplerf_s0_: sampler;
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);

    let _e15 = vs_TEXCOORD0_1;
    let _e20 = _f_buffer0_.f_cb0_[4];
    let _e25 = hscard_bias.values[0];
    let _e28 = textureSampleBias(f_t0_, samplerf_s0_, _e15.xy, (_e20.x + _e25.x));
    u_xlat0_ = _e28;
    let _e29 = SV_Target0_;
    let _e31 = u_xlat0_;
    let _e33 = vs_COLOR0_1;
    let _e35 = (_e31.xyz * _e33.xyz);
    SV_Target0_.x = _e35.x;
    SV_Target0_.y = _e35.y;
    SV_Target0_.z = _e35.z;
    let _e43 = u_xlat0_;
    SV_Target0_.w = _e43.w;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e21 = SV_Target0_;
    return FragmentOutput(_e21);
}
