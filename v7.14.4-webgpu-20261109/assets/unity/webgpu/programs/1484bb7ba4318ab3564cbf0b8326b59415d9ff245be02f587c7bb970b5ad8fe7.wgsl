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
@group(3) @binding(3) 
var samplerf_s1_: sampler;
@group(3) @binding(5) 
var samplerf_s2_: sampler;
@group(3) @binding(7) 
var samplerf_s3_: sampler;
@group(3) @binding(9) 
var samplerf_s4_: sampler;
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
@group(3) @binding(4) 
var f_t2_: texture_2d<f32>;
@group(3) @binding(6) 
var f_t3_: texture_2d<f32>;
@group(3) @binding(8) 
var f_t4_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD2_1: vec3<f32>;
var<private> vs_NORMAL0_1: vec3<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec3<f32> = vec3(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec4<f32> = vec4(0f);
    var u_xlat4_: vec3<f32> = vec3(0f);

    let _e44 = vs_NORMAL0_1;
    let _e46 = vs_NORMAL0_1;
    u_xlat0_.x = dot(_e44.xyz, _e46.xyz);
    let _e50 = u_xlat0_;
    u_xlat0_.x = inverseSqrt(_e50.x);
    let _e53 = u_xlat0_;
    let _e55 = u_xlat0_;
    let _e57 = vs_NORMAL0_1;
    let _e59 = (_e55.xxx * _e57.xyz);
    u_xlat0_.x = _e59.x;
    u_xlat0_.y = _e59.y;
    u_xlat0_.z = _e59.z;
    let _e67 = u_xlat0_;
    let _e72 = _f_buffer0_.f_cb0_[5];
    u_xlat0_.x = dot(_e67.xyz, _e72.xyz);
    let _e76 = u_xlat0_;
    u_xlat0_.x = clamp(_e76.x, 0f, 1f);
    let _e81 = u_xlat4_;
    let _e86 = _f_buffer0_.f_cb0_[6];
    let _e91 = _f_buffer1_.f_cb1_[11];
    let _e93 = (_e86.xyz * _e91.zzz);
    u_xlat4_.x = _e93.x;
    u_xlat4_.y = _e93.y;
    u_xlat4_.z = _e93.z;
    let _e100 = u_xlat0_;
    let _e102 = u_xlat4_;
    let _e104 = u_xlat0_;
    let _e107 = vs_TEXCOORD2_1;
    let _e109 = ((_e102.xyz * _e104.xxx) + _e107.xyz);
    u_xlat0_.x = _e109.x;
    u_xlat0_.y = _e109.y;
    u_xlat0_.z = _e109.z;
    let _e116 = vs_TEXCOORD0_1;
    let _e121 = _f_buffer0_.f_cb0_[4];
    let _e126 = hscard_bias.values[2];
    let _e129 = textureSampleBias(f_t2_, samplerf_s2_, _e116.xy, (_e121.x + _e126.x));
    u_xlat1_ = _e129;
    let _e130 = vs_TEXCOORD0_1;
    let _e135 = _f_buffer0_.f_cb0_[4];
    let _e140 = hscard_bias.values[1];
    let _e143 = textureSampleBias(f_t1_, samplerf_s1_, _e130.xy, (_e135.x + _e140.x));
    u_xlat2_ = _e143;
    let _e144 = vs_TEXCOORD0_1;
    let _e149 = _f_buffer0_.f_cb0_[4];
    let _e154 = hscard_bias.values[0];
    let _e157 = textureSampleBias(f_t0_, samplerf_s0_, _e144.xy, (_e149.x + _e154.x));
    u_xlat3_ = _e157;
    let _e158 = u_xlat2_;
    let _e159 = u_xlat3_;
    u_xlat2_ = (_e158 + -(_e159));
    let _e162 = u_xlat1_;
    let _e164 = u_xlat2_;
    let _e166 = u_xlat3_;
    u_xlat1_ = ((_e162.xxxx * _e164) + _e166);
    let _e168 = vs_TEXCOORD0_1;
    let _e173 = _f_buffer0_.f_cb0_[4];
    let _e178 = hscard_bias.values[3];
    let _e181 = textureSampleBias(f_t3_, samplerf_s3_, _e168.xy, (_e173.x + _e178.x));
    u_xlat2_ = _e181;
    let _e182 = u_xlat1_;
    let _e184 = u_xlat2_;
    u_xlat2_ = (-(_e182) + _e184);
    let _e186 = vs_TEXCOORD0_1;
    let _e191 = _f_buffer0_.f_cb0_[4];
    let _e196 = hscard_bias.values[4];
    let _e199 = textureSampleBias(f_t4_, samplerf_s4_, _e186.xy, (_e191.x + _e196.x));
    u_xlat3_ = _e199;
    let _e200 = u_xlat3_;
    let _e202 = u_xlat2_;
    let _e204 = u_xlat1_;
    u_xlat1_ = ((_e200.yyyy * _e202) + _e204);
    let _e206 = SV_Target0_;
    let _e208 = u_xlat0_;
    let _e210 = u_xlat1_;
    let _e212 = (_e208.xyz * _e210.xyz);
    SV_Target0_.x = _e212.x;
    SV_Target0_.y = _e212.y;
    SV_Target0_.z = _e212.z;
    let _e220 = u_xlat1_;
    SV_Target0_.w = _e220.w;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(2) vs_TEXCOORD2_: vec3<f32>, @location(12) vs_NORMAL0_: vec3<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD2_1 = vs_TEXCOORD2_;
    vs_NORMAL0_1 = vs_NORMAL0_;
    main_1();
    let _e44 = SV_Target0_;
    return FragmentOutput(_e44);
}
