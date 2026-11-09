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
var<private> vs_NORMAL0_1: vec3<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD2_1: vec3<f32>;
var<private> SV_TARGET0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec3<f32> = vec3(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec3<f32> = vec3(0f);
    var u_xlat6_: f32 = 0f;

    let _e34 = vs_NORMAL0_1;
    let _e36 = vs_NORMAL0_1;
    u_xlat0_.x = dot(_e34.xyz, _e36.xyz);
    let _e40 = u_xlat0_;
    u_xlat0_.x = inverseSqrt(_e40.x);
    let _e43 = u_xlat0_;
    let _e45 = u_xlat0_;
    let _e47 = vs_NORMAL0_1;
    let _e49 = (_e45.xxx * _e47.xyz);
    u_xlat0_.x = _e49.x;
    u_xlat0_.y = _e49.y;
    u_xlat0_.z = _e49.z;
    let _e57 = u_xlat0_;
    let _e62 = _f_buffer0_.f_cb0_[5];
    u_xlat0_.x = dot(_e57.xyz, _e62.xyz);
    let _e66 = u_xlat0_;
    u_xlat0_.x = clamp(_e66.x, 0f, 1f);
    let _e71 = u_xlat2_;
    let _e76 = _f_buffer0_.f_cb0_[6];
    let _e81 = _f_buffer1_.f_cb1_[11];
    let _e83 = (_e76.xyz * _e81.zzz);
    u_xlat2_.x = _e83.x;
    u_xlat2_.y = _e83.y;
    u_xlat2_.z = _e83.z;
    let _e90 = u_xlat0_;
    let _e92 = u_xlat2_;
    let _e94 = u_xlat0_;
    let _e97 = vs_TEXCOORD2_1;
    let _e99 = ((_e92.xyz * _e94.xxx) + _e97.xyz);
    u_xlat0_.x = _e99.x;
    u_xlat0_.y = _e99.y;
    u_xlat0_.z = _e99.z;
    let _e106 = vs_TEXCOORD0_1;
    let _e111 = _f_buffer0_.f_cb0_[4];
    let _e116 = hscard_bias.values[0];
    let _e119 = textureSampleBias(f_t0_, samplerf_s0_, _e106.xy, (_e111.x + _e116.x));
    u_xlat1_ = _e119;
    let _e120 = u_xlat1_;
    let _e122 = u_xlat1_;
    let _e127 = _f_buffer2_.f_cb2_[0];
    let _e129 = (_e122.xyz * _e127.xyz);
    u_xlat1_.x = _e129.x;
    u_xlat1_.y = _e129.y;
    u_xlat1_.z = _e129.z;
    let _e136 = u_xlat1_;
    let _e141 = _f_buffer2_.f_cb2_[0];
    let _e147 = _f_buffer2_.f_cb2_[1];
    u_xlat6_ = ((_e136.w * _e141.w) + -(_e147.x));
    let _e151 = u_xlat6_;
    u_xlat6_ = ceil(_e151);
    let _e153 = u_xlat1_;
    let _e155 = u_xlat6_;
    let _e157 = u_xlat1_;
    let _e159 = (vec3(_e155) * _e157.xyz);
    u_xlat1_.x = _e159.x;
    u_xlat1_.y = _e159.y;
    u_xlat1_.z = _e159.z;
    let _e167 = u_xlat6_;
    SV_TARGET0_.w = _e167;
    let _e168 = SV_TARGET0_;
    let _e170 = u_xlat0_;
    let _e172 = u_xlat1_;
    let _e174 = (_e170.xyz * _e172.xyz);
    SV_TARGET0_.x = _e174.x;
    SV_TARGET0_.y = _e174.y;
    SV_TARGET0_.z = _e174.z;
    return;
}

@fragment 
fn main(@location(12) vs_NORMAL0_: vec3<f32>, @location(0) vs_TEXCOORD0_: vec2<f32>, @location(2) vs_TEXCOORD2_: vec3<f32>) -> FragmentOutput {
    vs_NORMAL0_1 = vs_NORMAL0_;
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD2_1 = vs_TEXCOORD2_;
    main_1();
    let _e31 = SV_TARGET0_;
    return FragmentOutput(_e31);
}
