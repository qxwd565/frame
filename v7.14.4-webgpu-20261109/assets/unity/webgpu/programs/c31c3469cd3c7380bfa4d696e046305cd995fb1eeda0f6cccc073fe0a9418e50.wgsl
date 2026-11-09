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
var<private> vs_TEXCOORD0_1: vec4<f32>;
var<private> vs_TEXCOORD1_1: vec2<f32>;
var<private> vs_TEXCOORD3_1: vec3<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> vs_NORMAL0_1: vec3<f32>;
var<private> SV_TARGET0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec3<f32> = vec3(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat9_: f32 = 0f;

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
    let _e116 = vs_TEXCOORD0_1;
    let _e121 = _f_buffer0_.f_cb0_[4];
    let _e126 = hscard_bias.values[1];
    let _e129 = textureSampleBias(f_t1_, samplerf_s1_, _e116.zw, (_e121.x + _e126.x));
    u_xlat1_ = _e129;
    let _e130 = u_xlat1_;
    let _e134 = _f_buffer2_.f_cb2_[1];
    u_xlat1_ = (_e130 * _e134.zzzz);
    let _e137 = vs_TEXCOORD0_1;
    let _e142 = _f_buffer0_.f_cb0_[4];
    let _e147 = hscard_bias.values[0];
    let _e150 = textureSampleBias(f_t0_, samplerf_s0_, _e137.xy, (_e142.x + _e147.x));
    u_xlat2_ = _e150;
    let _e151 = u_xlat2_;
    let _e155 = _f_buffer2_.f_cb2_[1];
    let _e158 = u_xlat1_;
    u_xlat1_ = ((_e151 * _e155.yyyy) + _e158);
    let _e160 = u_xlat1_;
    let _e161 = vs_COLOR0_1;
    u_xlat1_ = (_e160 * _e161);
    let _e163 = u_xlat1_;
    u_xlat1_ = clamp(_e163, vec4(0f), vec4(1f));
    let _e169 = vs_TEXCOORD1_1;
    let _e174 = _f_buffer0_.f_cb0_[4];
    let _e179 = hscard_bias.values[2];
    let _e182 = textureSampleBias(f_t2_, samplerf_s2_, _e169.xy, (_e174.x + _e179.x));
    u_xlat2_ = _e182;
    let _e183 = u_xlat1_;
    let _e185 = u_xlat2_;
    u_xlat9_ = (_e183.w + _e185.x);
    let _e188 = u_xlat2_;
    let _e190 = u_xlat9_;
    u_xlat9_ = (_e188.x * _e190);
    let _e192 = u_xlat9_;
    let _e196 = _f_buffer2_.f_cb2_[1];
    u_xlat9_ = (_e192 * _e196.x);
    let _e199 = u_xlat9_;
    u_xlat9_ = clamp(_e199, 0f, 1f);
    let _e203 = u_xlat0_;
    let _e205 = u_xlat0_;
    let _e207 = u_xlat9_;
    let _e209 = (_e205.xyz * vec3(_e207));
    u_xlat0_.x = _e209.x;
    u_xlat0_.y = _e209.y;
    u_xlat0_.z = _e209.z;
    let _e217 = u_xlat9_;
    SV_TARGET0_.w = _e217;
    let _e218 = SV_TARGET0_;
    let _e220 = u_xlat0_;
    let _e222 = u_xlat1_;
    let _e224 = (_e220.xyz * _e222.xyz);
    SV_TARGET0_.x = _e224.x;
    SV_TARGET0_.y = _e224.y;
    SV_TARGET0_.z = _e224.z;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(1) vs_TEXCOORD1_: vec2<f32>, @location(3) vs_TEXCOORD3_: vec3<f32>, @location(10) vs_COLOR0_: vec4<f32>, @location(12) vs_NORMAL0_: vec3<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_TEXCOORD3_1 = vs_TEXCOORD3_;
    vs_COLOR0_1 = vs_COLOR0_;
    vs_NORMAL0_1 = vs_NORMAL0_;
    main_1();
    let _e47 = SV_TARGET0_;
    return FragmentOutput(_e47);
}
