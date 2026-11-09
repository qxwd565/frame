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
    f_cb2_: array<vec4<f32>, 5>,
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
@group(1) @binding(2) 
var<uniform> _f_buffer2_: f_buffer2_;
@group(3) @binding(1) 
var samplerf_s0_: sampler;
@group(3) @binding(3) 
var samplerf_s1_: sampler;
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD1_1: vec2<f32>;
var<private> vs_TEXCOORD3_1: vec3<f32>;
var<private> vs_NORMAL0_1: vec3<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec3<f32> = vec3(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat9_: f32 = 0f;
    var u_xlat10_: f32 = 0f;

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
    let _e81 = u_xlat3_;
    let _e86 = _f_buffer0_.f_cb0_[6];
    let _e91 = _f_buffer1_.f_cb1_[11];
    let _e93 = (_e86.xyz * _e91.zzz);
    u_xlat3_.x = _e93.x;
    u_xlat3_.y = _e93.y;
    u_xlat3_.z = _e93.z;
    let _e100 = u_xlat0_;
    let _e102 = u_xlat3_;
    let _e104 = u_xlat0_;
    let _e107 = vs_TEXCOORD3_1;
    let _e109 = ((_e102.xyz * _e104.xxx) + _e107.xyz);
    u_xlat0_.x = _e109.x;
    u_xlat0_.y = _e109.y;
    u_xlat0_.z = _e109.z;
    let _e116 = vs_TEXCOORD1_1;
    let _e121 = _f_buffer0_.f_cb0_[4];
    let _e126 = hscard_bias.values[1];
    let _e129 = textureSampleBias(f_t1_, samplerf_s1_, _e116.xy, (_e121.x + _e126.x));
    u_xlat1_ = _e129;
    let _e130 = vs_TEXCOORD0_1;
    let _e135 = _f_buffer0_.f_cb0_[4];
    let _e140 = hscard_bias.values[0];
    let _e143 = textureSampleBias(f_t0_, samplerf_s0_, _e130.xy, (_e135.x + _e140.x));
    u_xlat2_ = _e143;
    let _e144 = u_xlat1_;
    let _e146 = u_xlat1_;
    let _e148 = u_xlat2_;
    let _e151 = (_e146.xyz + -(_e148.xyz));
    u_xlat1_.x = _e151.x;
    u_xlat1_.y = _e151.y;
    u_xlat1_.z = _e151.z;
    let _e158 = u_xlat1_;
    let _e163 = _f_buffer2_.f_cb2_[4];
    let _e165 = u_xlat1_;
    let _e168 = u_xlat2_;
    let _e170 = ((_e163.xxx * _e165.xyz) + _e168.xyz);
    u_xlat1_.x = _e170.x;
    u_xlat1_.y = _e170.y;
    u_xlat1_.z = _e170.z;
    let _e178 = u_xlat2_;
    SV_Target0_.w = _e178.w;
    let _e183 = _f_buffer2_.f_cb2_[4];
    u_xlat9_ = _e183.y;
    let _e185 = u_xlat9_;
    u_xlat9_ = clamp(_e185, 0f, 1f);
    let _e189 = u_xlat9_;
    u_xlat10_ = (-(_e189) + 1f);
    let _e193 = u_xlat9_;
    let _e197 = _f_buffer2_.f_cb2_[4];
    u_xlat9_ = (_e193 + _e197.z);
    let _e200 = u_xlat2_;
    let _e202 = u_xlat9_;
    let _e204 = u_xlat1_;
    let _e206 = (vec3(_e202) * _e204.xyz);
    u_xlat2_.x = _e206.x;
    u_xlat2_.y = _e206.y;
    u_xlat2_.z = _e206.z;
    let _e213 = u_xlat1_;
    let _e215 = u_xlat10_;
    let _e217 = u_xlat1_;
    let _e219 = (vec3(_e215) * _e217.xyz);
    u_xlat1_.x = _e219.x;
    u_xlat1_.y = _e219.y;
    u_xlat1_.z = _e219.z;
    let _e226 = SV_Target0_;
    let _e228 = u_xlat1_;
    let _e230 = u_xlat0_;
    let _e233 = u_xlat2_;
    let _e235 = ((_e228.xyz * _e230.xyz) + _e233.xyz);
    SV_Target0_.x = _e235.x;
    SV_Target0_.y = _e235.y;
    SV_Target0_.z = _e235.z;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec2<f32>, @location(3) vs_TEXCOORD3_: vec3<f32>, @location(12) vs_NORMAL0_: vec3<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_TEXCOORD3_1 = vs_TEXCOORD3_;
    vs_NORMAL0_1 = vs_NORMAL0_;
    main_1();
    let _e39 = SV_Target0_;
    return FragmentOutput(_e39);
}
