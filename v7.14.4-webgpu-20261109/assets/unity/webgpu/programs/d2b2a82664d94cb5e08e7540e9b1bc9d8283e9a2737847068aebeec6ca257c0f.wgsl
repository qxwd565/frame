struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 9>,
}

struct FragmentOutput {
    @location(0) SV_Target0_: vec4<f32>,
}

@group(1) @binding(31) 
var<uniform> hscard_bias: HScardSamplerBias;
@group(1) @binding(0) 
var<uniform> _f_buffer0_: f_buffer0_;
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
var<private> vs_TEXCOORD2_1: vec4<f32>;
var<private> vs_TEXCOORD3_1: vec4<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec4<f32> = vec4(0f);
    var u_xlat5_: vec3<f32> = vec3(0f);

    let _e36 = vs_TEXCOORD0_1;
    let _e41 = hscard_bias.values[0];
    let _e43 = textureSampleBias(f_t0_, samplerf_s0_, _e36.xy, _e41.x);
    u_xlat0_ = _e43;
    let _e49 = u_xlat0_;
    u_xlat1_.x = dot(vec3<f32>(0.3f, 0.59f, 0.11f), _e49.xyz);
    let _e52 = u_xlat5_;
    let _e54 = u_xlat0_;
    let _e57 = u_xlat1_;
    let _e59 = (-(_e54.xyz) + _e57.xxx);
    u_xlat5_.x = _e59.x;
    u_xlat5_.y = _e59.y;
    u_xlat5_.z = _e59.z;
    let _e67 = u_xlat1_;
    u_xlat1_.x = (-(_e67.x) + 1f);
    let _e73 = u_xlat0_;
    let _e75 = u_xlat1_;
    u_xlat1_.x = (_e73.w * _e75.x);
    let _e78 = u_xlat5_;
    let _e83 = _f_buffer0_.f_cb0_[7];
    let _e85 = u_xlat5_;
    let _e88 = u_xlat0_;
    let _e90 = ((_e83.yyy * _e85.xyz) + _e88.xyz);
    u_xlat5_.x = _e90.x;
    u_xlat5_.y = _e90.y;
    u_xlat5_.z = _e90.z;
    let _e97 = u_xlat2_;
    let _e99 = u_xlat5_;
    let _e105 = _f_buffer0_.f_cb0_[8];
    let _e107 = (-(_e99.xyz) + _e105.xyz);
    u_xlat2_.x = _e107.x;
    u_xlat2_.y = _e107.y;
    u_xlat2_.z = _e107.z;
    let _e114 = u_xlat5_;
    let _e119 = _f_buffer0_.f_cb0_[7];
    let _e121 = u_xlat2_;
    let _e124 = u_xlat5_;
    let _e126 = ((_e119.zzz * _e121.xyz) + _e124.xyz);
    u_xlat5_.x = _e126.x;
    u_xlat5_.y = _e126.y;
    u_xlat5_.z = _e126.z;
    let _e133 = u_xlat5_;
    let _e135 = u_xlat5_;
    let _e140 = _f_buffer0_.f_cb0_[3];
    let _e146 = _f_buffer0_.f_cb0_[5];
    let _e149 = ((_e135.xyz * _e140.xyz) + -(_e146.xyz));
    u_xlat5_.x = _e149.x;
    u_xlat5_.y = _e149.y;
    u_xlat5_.z = _e149.z;
    let _e156 = vs_TEXCOORD1_1;
    let _e161 = hscard_bias.values[1];
    let _e163 = textureSampleBias(f_t1_, samplerf_s1_, _e156.xy, _e161.x);
    u_xlat2_ = _e163;
    let _e164 = u_xlat2_;
    let _e166 = u_xlat2_;
    let _e171 = _f_buffer0_.f_cb0_[2];
    let _e173 = (_e166.xyz * _e171.yyy);
    u_xlat2_.x = _e173.x;
    u_xlat2_.y = _e173.y;
    u_xlat2_.z = _e173.z;
    let _e180 = u_xlat2_;
    let _e182 = u_xlat2_;
    let _e188 = clamp(_e182.xyz, vec3(0f), vec3(1f));
    u_xlat2_.x = _e188.x;
    u_xlat2_.y = _e188.y;
    u_xlat2_.z = _e188.z;
    let _e195 = u_xlat2_;
    let _e197 = u_xlat1_;
    let _e199 = u_xlat2_;
    let _e201 = (_e197.xxx * _e199.xyz);
    u_xlat2_.x = _e201.x;
    u_xlat2_.y = _e201.y;
    u_xlat2_.z = _e201.z;
    let _e208 = u_xlat0_;
    let _e210 = u_xlat2_;
    let _e212 = u_xlat5_;
    let _e218 = _f_buffer0_.f_cb0_[5];
    let _e220 = ((_e210.xyz * _e212.xyz) + _e218.xyz);
    u_xlat0_.x = _e220.x;
    u_xlat0_.y = _e220.y;
    u_xlat0_.z = _e220.z;
    let _e227 = u_xlat0_;
    let _e231 = _f_buffer0_.f_cb0_[7];
    u_xlat1_ = (_e227 * _e231.wwww);
    let _e234 = vs_TEXCOORD2_1;
    let _e239 = hscard_bias.values[0];
    let _e241 = textureSampleBias(f_t0_, samplerf_s0_, _e234.xy, _e239.x);
    u_xlat2_ = _e241;
    let _e242 = vs_TEXCOORD2_1;
    let _e247 = hscard_bias.values[0];
    let _e249 = textureSampleBias(f_t0_, samplerf_s0_, _e242.zw, _e247.x);
    u_xlat3_ = _e249;
    let _e251 = u_xlat2_;
    let _e253 = u_xlat3_;
    u_xlat0_.x = (_e251.w + _e253.w);
    let _e256 = vs_TEXCOORD3_1;
    let _e261 = hscard_bias.values[0];
    let _e263 = textureSampleBias(f_t0_, samplerf_s0_, _e256.xy, _e261.x);
    u_xlat2_ = _e263;
    let _e265 = u_xlat0_;
    let _e267 = u_xlat2_;
    u_xlat0_.x = (_e265.x + _e267.w);
    let _e270 = vs_TEXCOORD3_1;
    let _e275 = hscard_bias.values[0];
    let _e277 = textureSampleBias(f_t0_, samplerf_s0_, _e270.zw, _e275.x);
    u_xlat2_ = _e277;
    let _e279 = u_xlat0_;
    let _e281 = u_xlat2_;
    u_xlat0_.x = (_e279.x + _e281.w);
    let _e285 = u_xlat0_;
    u_xlat0_.x = clamp(_e285.x, 0f, 1f);
    let _e290 = u_xlat0_;
    let _e295 = _f_buffer0_.f_cb0_[6];
    u_xlat2_ = (_e290.xxxx * _e295);
    let _e297 = u_xlat1_;
    let _e298 = vs_COLOR0_1;
    let _e300 = u_xlat2_;
    u_xlat1_ = ((_e297 * _e298) + -(_e300));
    let _e303 = u_xlat0_;
    let _e305 = u_xlat1_;
    let _e307 = u_xlat2_;
    u_xlat0_ = ((_e303.wwww * _e305) + _e307);
    let _e310 = u_xlat0_;
    let _e315 = _f_buffer0_.f_cb0_[4];
    SV_Target0_.w = (_e310.w * _e315.x);
    let _e318 = SV_Target0_;
    let _e320 = u_xlat0_;
    let _e321 = _e320.xyz;
    SV_Target0_.x = _e321.x;
    SV_Target0_.y = _e321.y;
    SV_Target0_.z = _e321.z;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec2<f32>, @location(2) vs_TEXCOORD2_: vec4<f32>, @location(3) vs_TEXCOORD3_: vec4<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_TEXCOORD2_1 = vs_TEXCOORD2_;
    vs_TEXCOORD3_1 = vs_TEXCOORD3_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e37 = SV_Target0_;
    return FragmentOutput(_e37);
}
