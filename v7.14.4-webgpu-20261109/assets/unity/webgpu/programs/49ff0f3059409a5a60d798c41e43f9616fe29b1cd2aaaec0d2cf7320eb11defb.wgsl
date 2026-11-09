struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 5>,
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
var<private> vs_COLOR0_1: vec4<f32>;
var<private> vs_TEXCOORD0_1: vec3<f32>;
var<private> SV_TARGET0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec3<f32> = vec3(0f);

    let _e22 = vs_TEXCOORD0_1;
    let _e27 = _f_buffer0_.f_cb0_[4];
    let _e32 = hscard_bias.values[0];
    let _e35 = textureSampleBias(f_t0_, samplerf_s0_, _e22.xy, (_e27.x + _e32.x));
    u_xlat0_ = _e35;
    let _e36 = u_xlat0_;
    let _e38 = u_xlat0_;
    let _e40 = vs_COLOR0_1;
    let _e42 = (_e38.xyz * _e40.xyz);
    u_xlat0_.x = _e42.x;
    u_xlat0_.y = _e42.y;
    u_xlat0_.z = _e42.z;
    let _e49 = u_xlat1_;
    let _e51 = vs_TEXCOORD0_1;
    let _e56 = _f_buffer1_.f_cb1_[3];
    let _e58 = (_e51.zzz * _e56.xyz);
    u_xlat1_.x = _e58.x;
    u_xlat1_.y = _e58.y;
    u_xlat1_.z = _e58.z;
    let _e65 = u_xlat1_;
    let _e67 = u_xlat1_;
    let _e72 = _f_buffer1_.f_cb1_[4];
    let _e74 = (_e67.xyz * _e72.yyy);
    u_xlat1_.x = _e74.x;
    u_xlat1_.y = _e74.y;
    u_xlat1_.z = _e74.z;
    let _e81 = u_xlat0_;
    let _e83 = u_xlat0_;
    let _e85 = u_xlat1_;
    let _e87 = (_e83.xyz * _e85.xyz);
    u_xlat0_.x = _e87.x;
    u_xlat0_.y = _e87.y;
    u_xlat0_.z = _e87.z;
    let _e95 = vs_TEXCOORD0_1;
    let _e100 = _f_buffer1_.f_cb1_[4];
    u_xlat0_.w = (_e95.z * _e100.z);
    let _e103 = u_xlat0_;
    let _e105 = u_xlat0_;
    SV_TARGET0_ = (_e103.wwww * _e105);
    return;
}

@fragment 
fn main(@location(10) vs_COLOR0_: vec4<f32>, @location(0) vs_TEXCOORD0_: vec3<f32>) -> FragmentOutput {
    vs_COLOR0_1 = vs_COLOR0_;
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    main_1();
    let _e24 = SV_TARGET0_;
    return FragmentOutput(_e24);
}
