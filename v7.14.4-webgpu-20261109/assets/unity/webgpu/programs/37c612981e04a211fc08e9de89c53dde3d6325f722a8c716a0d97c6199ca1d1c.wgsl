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

    let _e22 = vs_TEXCOORD0_1;
    let _e27 = _f_buffer0_.f_cb0_[4];
    let _e32 = hscard_bias.values[0];
    let _e35 = textureSampleBias(f_t0_, samplerf_s0_, _e22.xy, (_e27.x + _e32.x));
    u_xlat0_ = _e35;
    let _e41 = u_xlat0_;
    u_xlat1_.x = dot(vec3<f32>(0.3f, 0.59f, 0.11f), _e41.xyz);
    let _e44 = u_xlat1_;
    let _e46 = u_xlat0_;
    let _e49 = u_xlat1_;
    let _e51 = (-(_e46.xyz) + _e49.xxx);
    u_xlat1_.x = _e51.x;
    u_xlat1_.y = _e51.y;
    u_xlat1_.z = _e51.z;
    u_xlat1_.w = 0f;
    let _e63 = _f_buffer1_.f_cb1_[2];
    let _e65 = u_xlat1_;
    let _e67 = u_xlat0_;
    u_xlat0_ = ((_e63.xxxx * _e65) + _e67);
    let _e73 = _f_buffer1_.f_cb1_[2];
    u_xlat1_.x = _e73.w;
    u_xlat1_.w = 1f;
    let _e77 = u_xlat0_;
    let _e79 = u_xlat1_;
    u_xlat1_ = (-(_e77) + _e79.xxxw);
    let _e85 = _f_buffer1_.f_cb1_[2];
    let _e87 = u_xlat1_;
    let _e89 = u_xlat0_;
    u_xlat0_ = ((_e85.yyyy * _e87) + _e89);
    let _e91 = u_xlat0_;
    let _e92 = vs_COLOR0_1;
    SV_TARGET0_ = (_e91 * _e92);
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
