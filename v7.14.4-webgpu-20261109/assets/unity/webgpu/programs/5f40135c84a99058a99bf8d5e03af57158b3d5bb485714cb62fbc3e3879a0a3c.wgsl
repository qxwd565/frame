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
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> SV_TARGET0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);

    let _e14 = vs_TEXCOORD0_1;
    let _e19 = _f_buffer0_.f_cb0_[4];
    let _e24 = hscard_bias.values[0];
    let _e27 = textureSampleBias(f_t0_, samplerf_s0_, _e14.xy, (_e19.x + _e24.x));
    u_xlat0_ = _e27;
    let _e28 = SV_TARGET0_;
    let _e30 = u_xlat0_;
    let _e31 = _e30.xyz;
    SV_TARGET0_.x = _e31.x;
    SV_TARGET0_.y = _e31.y;
    SV_TARGET0_.z = _e31.z;
    SV_TARGET0_.w = 1f;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    main_1();
    let _e17 = SV_TARGET0_;
    return FragmentOutput(_e17);
}
