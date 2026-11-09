struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 7>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 12>,
}

struct f_buffer2_ {
    f_cb2_: array<vec4<f32>, 2>,
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
@group(1) @binding(2) 
var<uniform> _f_buffer2_: f_buffer2_;
@group(3) @binding(1) 
var samplerf_s0_: sampler;
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD2_1: vec3<f32>;
var<private> vs_NORMAL0_1: vec3<f32>;
var<private> SV_TARGET0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec3<f32> = vec3(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec3<f32> = vec3(0f);

    let _e31 = vs_NORMAL0_1;
    let _e33 = vs_NORMAL0_1;
    u_xlat0_.x = dot(_e31.xyz, _e33.xyz);
    let _e37 = u_xlat0_;
    u_xlat0_.x = inverseSqrt(_e37.x);
    let _e40 = u_xlat0_;
    let _e42 = u_xlat0_;
    let _e44 = vs_NORMAL0_1;
    let _e46 = (_e42.xxx * _e44.xyz);
    u_xlat0_.x = _e46.x;
    u_xlat0_.y = _e46.y;
    u_xlat0_.z = _e46.z;
    let _e54 = u_xlat0_;
    let _e59 = _f_buffer0_.f_cb0_[5];
    u_xlat0_.x = dot(_e54.xyz, _e59.xyz);
    let _e63 = u_xlat0_;
    u_xlat0_.x = clamp(_e63.x, 0f, 1f);
    let _e68 = u_xlat2_;
    let _e73 = _f_buffer0_.f_cb0_[6];
    let _e78 = _f_buffer1_.f_cb1_[11];
    let _e80 = (_e73.xyz * _e78.zzz);
    u_xlat2_.x = _e80.x;
    u_xlat2_.y = _e80.y;
    u_xlat2_.z = _e80.z;
    let _e87 = u_xlat0_;
    let _e89 = u_xlat2_;
    let _e91 = u_xlat0_;
    let _e94 = vs_TEXCOORD2_1;
    let _e96 = ((_e89.xyz * _e91.xxx) + _e94.xyz);
    u_xlat0_.x = _e96.x;
    u_xlat0_.y = _e96.y;
    u_xlat0_.z = _e96.z;
    let _e103 = u_xlat0_;
    let _e105 = u_xlat0_;
    let _e110 = _f_buffer2_.f_cb2_[0];
    let _e112 = (_e105.xyz + _e110.xxx);
    u_xlat0_.x = _e112.x;
    u_xlat0_.y = _e112.y;
    u_xlat0_.z = _e112.z;
    let _e119 = vs_TEXCOORD0_1;
    let _e124 = _f_buffer0_.f_cb0_[4];
    let _e129 = hscard_bias.values[0];
    let _e132 = textureSampleBias(f_t0_, samplerf_s0_, _e119.xy, (_e124.x + _e129.x));
    u_xlat1_ = _e132;
    let _e133 = u_xlat1_;
    let _e137 = _f_buffer2_.f_cb2_[1];
    u_xlat1_ = (_e133 * _e137);
    let _e139 = SV_TARGET0_;
    let _e141 = u_xlat0_;
    let _e143 = u_xlat1_;
    let _e145 = (_e141.xyz * _e143.xyz);
    SV_TARGET0_.x = _e145.x;
    SV_TARGET0_.y = _e145.y;
    SV_TARGET0_.z = _e145.z;
    let _e153 = u_xlat1_;
    SV_TARGET0_.w = _e153.w;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(2) vs_TEXCOORD2_: vec3<f32>, @location(12) vs_NORMAL0_: vec3<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD2_1 = vs_TEXCOORD2_;
    vs_NORMAL0_1 = vs_NORMAL0_;
    main_1();
    let _e31 = SV_TARGET0_;
    return FragmentOutput(_e31);
}
