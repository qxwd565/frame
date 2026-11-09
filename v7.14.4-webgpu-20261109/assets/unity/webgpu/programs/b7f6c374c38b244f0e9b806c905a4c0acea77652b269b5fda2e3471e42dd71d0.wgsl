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
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);

    let _e17 = vs_TEXCOORD0_1;
    let _e22 = _f_buffer0_.f_cb0_[4];
    let _e27 = hscard_bias.values[0];
    let _e30 = textureSampleBias(f_t0_, samplerf_s0_, _e17.xy, (_e22.x + _e27.x));
    u_xlat0_ = _e30;
    let _e31 = u_xlat0_;
    u_xlat0_ = (_e31 + vec4<f32>(-1f, -1f, -1f, -1f));
    let _e45 = _f_buffer1_.f_cb1_[1];
    let _e47 = u_xlat0_;
    SV_Target0_ = ((_e45.wwww * _e47) + vec4<f32>(1f, 1f, 1f, 1f));
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    main_1();
    let _e20 = SV_Target0_;
    return FragmentOutput(_e20);
}
