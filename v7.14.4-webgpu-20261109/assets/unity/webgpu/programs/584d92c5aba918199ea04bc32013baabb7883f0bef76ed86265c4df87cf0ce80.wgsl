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
    f_cb2_: array<vec4<f32>, 3>,
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
@group(3) @binding(3) 
var samplerf_s1_: sampler;
@group(3) @binding(5) 
var samplerf_s2_: sampler;
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
@group(3) @binding(4) 
var f_t2_: texture_2d<f32>;
var<private> vs_NORMAL0_1: vec3<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD1_1: vec2<f32>;
var<private> vs_TEXCOORD3_1: vec3<f32>;
var<private> SV_TARGET0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec3<f32> = vec3(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);

    let _e40 = vs_NORMAL0_1;
    let _e42 = vs_NORMAL0_1;
    u_xlat0_.x = dot(_e40.xyz, _e42.xyz);
    let _e46 = u_xlat0_;
    u_xlat0_.x = inverseSqrt(_e46.x);
    let _e49 = u_xlat0_;
    let _e51 = u_xlat0_;
    let _e53 = vs_NORMAL0_1;
    let _e55 = (_e51.xxx * _e53.xyz);
    u_xlat0_.x = _e55.x;
    u_xlat0_.y = _e55.y;
    u_xlat0_.z = _e55.z;
    let _e63 = u_xlat0_;
    let _e68 = _f_buffer0_.f_cb0_[5];
    u_xlat0_.x = dot(_e63.xyz, _e68.xyz);
    let _e72 = u_xlat0_;
    u_xlat0_.x = clamp(_e72.x, 0f, 1f);
    let _e77 = u_xlat3_;
    let _e82 = _f_buffer0_.f_cb0_[6];
    let _e87 = _f_buffer1_.f_cb1_[11];
    let _e89 = (_e82.xyz * _e87.zzz);
    u_xlat3_.x = _e89.x;
    u_xlat3_.y = _e89.y;
    u_xlat3_.z = _e89.z;
    let _e96 = u_xlat0_;
    let _e98 = u_xlat3_;
    let _e100 = u_xlat0_;
    let _e103 = vs_TEXCOORD3_1;
    let _e105 = ((_e98.xyz * _e100.xxx) + _e103.xyz);
    u_xlat0_.x = _e105.x;
    u_xlat0_.y = _e105.y;
    u_xlat0_.z = _e105.z;
    let _e112 = u_xlat1_;
    let _e114 = vs_TEXCOORD1_1;
    let _e116 = vs_TEXCOORD1_1;
    let _e118 = (_e114.xy + _e116.xy);
    u_xlat1_.x = _e118.x;
    u_xlat1_.y = _e118.y;
    let _e123 = u_xlat1_;
    let _e128 = _f_buffer0_.f_cb0_[4];
    let _e133 = hscard_bias.values[2];
    let _e136 = textureSampleBias(f_t2_, samplerf_s2_, _e123.xy, (_e128.x + _e133.x));
    u_xlat1_ = _e136;
    let _e137 = vs_TEXCOORD0_1;
    let _e142 = _f_buffer0_.f_cb0_[4];
    let _e147 = hscard_bias.values[1];
    let _e150 = textureSampleBias(f_t1_, samplerf_s1_, _e137.xy, (_e142.x + _e147.x));
    u_xlat2_ = _e150;
    let _e151 = u_xlat1_;
    let _e153 = u_xlat1_;
    let _e155 = u_xlat2_;
    let _e157 = (_e153.xyz * _e155.xyz);
    u_xlat1_.x = _e157.x;
    u_xlat1_.y = _e157.y;
    u_xlat1_.z = _e157.z;
    let _e164 = u_xlat1_;
    let _e166 = u_xlat1_;
    let _e171 = _f_buffer2_.f_cb2_[2];
    let _e173 = (_e166.xyz * _e171.xxx);
    u_xlat1_.x = _e173.x;
    u_xlat1_.y = _e173.y;
    u_xlat1_.z = _e173.z;
    let _e180 = vs_TEXCOORD0_1;
    let _e185 = _f_buffer0_.f_cb0_[4];
    let _e190 = hscard_bias.values[0];
    let _e193 = textureSampleBias(f_t0_, samplerf_s0_, _e180.xy, (_e185.x + _e190.x));
    u_xlat2_ = _e193;
    let _e194 = u_xlat1_;
    let _e196 = u_xlat1_;
    let _e201 = _f_buffer2_.f_cb2_[1];
    let _e204 = u_xlat2_;
    let _e206 = ((_e196.xyz * _e201.xyz) + _e204.xyz);
    u_xlat1_.x = _e206.x;
    u_xlat1_.y = _e206.y;
    u_xlat1_.z = _e206.z;
    let _e213 = u_xlat1_;
    let _e215 = u_xlat1_;
    let _e220 = _f_buffer2_.f_cb2_[0];
    let _e222 = (_e215.xyz * _e220.xyz);
    u_xlat1_.x = _e222.x;
    u_xlat1_.y = _e222.y;
    u_xlat1_.z = _e222.z;
    let _e229 = u_xlat0_;
    let _e231 = u_xlat0_;
    let _e233 = u_xlat1_;
    let _e236 = u_xlat2_;
    let _e239 = ((_e231.xyz * _e233.xyz) + -(_e236.xyz));
    u_xlat0_.x = _e239.x;
    u_xlat0_.y = _e239.y;
    u_xlat0_.z = _e239.z;
    let _e246 = SV_TARGET0_;
    let _e251 = _f_buffer2_.f_cb2_[2];
    let _e253 = u_xlat0_;
    let _e256 = u_xlat2_;
    let _e258 = ((_e251.zzz * _e253.xyz) + _e256.xyz);
    SV_TARGET0_.x = _e258.x;
    SV_TARGET0_.y = _e258.y;
    SV_TARGET0_.z = _e258.z;
    SV_TARGET0_.w = 1f;
    return;
}

@fragment 
fn main(@location(12) vs_NORMAL0_: vec3<f32>, @location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec2<f32>, @location(3) vs_TEXCOORD3_: vec3<f32>) -> FragmentOutput {
    vs_NORMAL0_1 = vs_NORMAL0_;
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_TEXCOORD3_1 = vs_TEXCOORD3_;
    main_1();
    let _e43 = SV_TARGET0_;
    return FragmentOutput(_e43);
}
