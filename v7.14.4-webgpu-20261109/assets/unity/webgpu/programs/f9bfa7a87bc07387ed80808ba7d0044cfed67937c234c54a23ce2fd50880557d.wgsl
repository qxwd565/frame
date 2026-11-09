struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 7>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 12>,
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
var<private> vs_TEXCOORD2_1: vec3<f32>;
var<private> vs_NORMAL0_1: vec3<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec3<f32> = vec3(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec3<f32> = vec3(0f);

    let _e28 = vs_NORMAL0_1;
    let _e30 = vs_NORMAL0_1;
    u_xlat0_.x = dot(_e28.xyz, _e30.xyz);
    let _e34 = u_xlat0_;
    u_xlat0_.x = inverseSqrt(_e34.x);
    let _e37 = u_xlat0_;
    let _e39 = u_xlat0_;
    let _e41 = vs_NORMAL0_1;
    let _e43 = (_e39.xxx * _e41.xyz);
    u_xlat0_.x = _e43.x;
    u_xlat0_.y = _e43.y;
    u_xlat0_.z = _e43.z;
    let _e51 = u_xlat0_;
    let _e56 = _f_buffer0_.f_cb0_[5];
    u_xlat0_.x = dot(_e51.xyz, _e56.xyz);
    let _e60 = u_xlat0_;
    u_xlat0_.x = clamp(_e60.x, 0f, 1f);
    let _e65 = u_xlat2_;
    let _e70 = _f_buffer0_.f_cb0_[6];
    let _e75 = _f_buffer1_.f_cb1_[11];
    let _e77 = (_e70.xyz * _e75.zzz);
    u_xlat2_.x = _e77.x;
    u_xlat2_.y = _e77.y;
    u_xlat2_.z = _e77.z;
    let _e84 = u_xlat0_;
    let _e86 = u_xlat2_;
    let _e88 = u_xlat0_;
    let _e91 = vs_TEXCOORD2_1;
    let _e93 = ((_e86.xyz * _e88.xxx) + _e91.xyz);
    u_xlat0_.x = _e93.x;
    u_xlat0_.y = _e93.y;
    u_xlat0_.z = _e93.z;
    let _e100 = vs_TEXCOORD0_1;
    let _e105 = _f_buffer0_.f_cb0_[4];
    let _e110 = hscard_bias.values[0];
    let _e113 = textureSampleBias(f_t0_, samplerf_s0_, _e100.xy, (_e105.x + _e110.x));
    u_xlat1_ = _e113;
    let _e114 = SV_Target0_;
    let _e116 = u_xlat0_;
    let _e118 = u_xlat1_;
    let _e120 = (_e116.xyz * _e118.xyz);
    SV_Target0_.x = _e120.x;
    SV_Target0_.y = _e120.y;
    SV_Target0_.z = _e120.z;
    let _e128 = u_xlat1_;
    SV_Target0_.w = _e128.w;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(2) vs_TEXCOORD2_: vec3<f32>, @location(12) vs_NORMAL0_: vec3<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD2_1 = vs_TEXCOORD2_;
    vs_NORMAL0_1 = vs_NORMAL0_;
    main_1();
    let _e28 = SV_Target0_;
    return FragmentOutput(_e28);
}
