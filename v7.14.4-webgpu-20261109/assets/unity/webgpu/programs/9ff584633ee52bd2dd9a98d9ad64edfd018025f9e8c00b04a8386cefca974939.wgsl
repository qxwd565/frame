struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 6>,
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
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD1_1: vec2<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_TARGET0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat6_: f32 = 0f;

    let _e34 = vs_TEXCOORD0_1;
    let _e39 = _f_buffer0_.f_cb0_[4];
    let _e44 = hscard_bias.values[0];
    let _e47 = textureSampleBias(f_t0_, samplerf_s0_, _e34.xy, (_e39.x + _e44.x));
    u_xlat0_ = _e47;
    let _e52 = u_xlat0_;
    u_xlat6_ = dot(vec3<f32>(0.3f, 0.59f, 0.11f), _e52.xyz);
    let _e55 = u_xlat1_;
    let _e57 = u_xlat0_;
    let _e60 = u_xlat6_;
    let _e62 = (-(_e57.xyz) + vec3(_e60));
    u_xlat1_.x = _e62.x;
    u_xlat1_.y = _e62.y;
    u_xlat1_.z = _e62.z;
    let _e69 = u_xlat0_;
    let _e74 = _f_buffer1_.f_cb1_[0];
    let _e76 = u_xlat1_;
    let _e79 = u_xlat0_;
    let _e81 = ((_e74.xxx * _e76.xyz) + _e79.xyz);
    u_xlat0_.x = _e81.x;
    u_xlat0_.y = _e81.y;
    u_xlat0_.z = _e81.z;
    let _e88 = u_xlat1_;
    let _e90 = u_xlat0_;
    let _e96 = _f_buffer1_.f_cb1_[0];
    let _e98 = (-(_e90.xyz) + _e96.zzz);
    u_xlat1_.x = _e98.x;
    u_xlat1_.y = _e98.y;
    u_xlat1_.z = _e98.z;
    let _e105 = u_xlat0_;
    let _e110 = _f_buffer1_.f_cb1_[0];
    let _e112 = u_xlat1_;
    let _e115 = u_xlat0_;
    let _e117 = ((_e110.yyy * _e112.xyz) + _e115.xyz);
    u_xlat0_.x = _e117.x;
    u_xlat0_.y = _e117.y;
    u_xlat0_.z = _e117.z;
    let _e124 = u_xlat0_;
    let _e126 = u_xlat0_;
    let _e128 = vs_COLOR0_1;
    let _e134 = _f_buffer1_.f_cb1_[5];
    let _e136 = ((_e126.xyz * _e128.xyz) + _e134.xxx);
    u_xlat0_.x = _e136.x;
    u_xlat0_.y = _e136.y;
    u_xlat0_.z = _e136.z;
    let _e143 = vs_TEXCOORD0_1;
    let _e148 = _f_buffer0_.f_cb0_[4];
    let _e153 = hscard_bias.values[1];
    let _e156 = textureSampleBias(f_t1_, samplerf_s1_, _e143.xy, (_e148.x + _e153.x));
    u_xlat1_ = _e156;
    let _e157 = u_xlat1_;
    let _e162 = _f_buffer1_.f_cb1_[4];
    u_xlat6_ = (_e157.x + -(_e162.y));
    let _e167 = u_xlat1_;
    u_xlat1_.x = (-(_e167.x) + 1f);
    let _e173 = u_xlat1_;
    let _e178 = _f_buffer1_.f_cb1_[4];
    u_xlat1_.x = (_e173.x + _e178.y);
    let _e182 = u_xlat1_;
    u_xlat1_.x = clamp(_e182.x, 0f, 1f);
    let _e188 = u_xlat1_;
    u_xlat1_.x = log2(_e188.x);
    let _e192 = u_xlat1_;
    let _e197 = _f_buffer1_.f_cb1_[5];
    u_xlat1_.x = (_e192.x * _e197.y);
    let _e201 = u_xlat1_;
    u_xlat1_.x = exp2(_e201.x);
    let _e205 = u_xlat1_;
    SV_TARGET0_.w = (-(_e205.x) + 1f);
    let _e214 = _f_buffer1_.f_cb1_[4];
    let _e219 = _f_buffer1_.f_cb1_[4];
    let _e222 = u_xlat6_;
    u_xlat1_.x = ((_e214.z * _e219.w) + _e222);
    let _e225 = u_xlat1_;
    u_xlat1_.x = clamp(_e225.x, 0f, 1f);
    let _e233 = _f_buffer1_.f_cb1_[4];
    let _e237 = u_xlat6_;
    u_xlat6_ = ((_e233.z * 2f) + _e237);
    let _e239 = u_xlat6_;
    u_xlat6_ = clamp(_e239, 0f, 1f);
    let _e243 = u_xlat0_;
    let _e245 = u_xlat1_;
    let _e247 = u_xlat0_;
    let _e253 = _f_buffer1_.f_cb1_[5];
    let _e256 = ((_e245.xxx * _e247.xyz) + -(_e253.xxx));
    u_xlat0_.x = _e256.x;
    u_xlat0_.y = _e256.y;
    u_xlat0_.z = _e256.z;
    let _e263 = vs_TEXCOORD1_1;
    let _e268 = _f_buffer0_.f_cb0_[4];
    let _e273 = hscard_bias.values[2];
    let _e276 = textureSampleBias(f_t2_, samplerf_s2_, _e263.xy, (_e268.x + _e273.x));
    u_xlat1_ = _e276;
    let _e277 = u_xlat3_;
    let _e282 = _f_buffer1_.f_cb1_[3];
    let _e287 = _f_buffer1_.f_cb1_[4];
    let _e289 = (_e282.xyz * _e287.xxx);
    u_xlat3_.x = _e289.x;
    u_xlat3_.y = _e289.y;
    u_xlat3_.z = _e289.z;
    let _e296 = u_xlat0_;
    let _e298 = u_xlat3_;
    let _e301 = u_xlat1_;
    let _e304 = u_xlat0_;
    let _e306 = ((-(_e298.xyz) * _e301.xxx) + _e304.xyz);
    u_xlat0_.x = _e306.x;
    u_xlat0_.y = _e306.y;
    u_xlat0_.z = _e306.z;
    let _e313 = u_xlat1_;
    let _e315 = u_xlat1_;
    let _e317 = u_xlat3_;
    let _e319 = (_e315.xxx * _e317.xyz);
    u_xlat1_.x = _e319.x;
    u_xlat1_.y = _e319.y;
    u_xlat1_.z = _e319.z;
    let _e326 = SV_TARGET0_;
    let _e328 = u_xlat6_;
    let _e330 = u_xlat0_;
    let _e333 = u_xlat1_;
    let _e335 = ((vec3(_e328) * _e330.xyz) + _e333.xyz);
    SV_TARGET0_.x = _e335.x;
    SV_TARGET0_.y = _e335.y;
    SV_TARGET0_.z = _e335.z;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec2<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e36 = SV_TARGET0_;
    return FragmentOutput(_e36);
}
