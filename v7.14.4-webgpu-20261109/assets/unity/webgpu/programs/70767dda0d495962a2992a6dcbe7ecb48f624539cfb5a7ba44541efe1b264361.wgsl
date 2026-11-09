struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 13>,
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
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec4<f32>;
var<private> vs_COLOR1_1: vec4<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> vs_TEXCOORD1_1: f32;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec3<f32> = vec3(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: f32 = 0f;
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlat6_: vec3<f32> = vec3(0f);
    var u_xlat7_: vec3<f32> = vec3(0f);
    var u_xlat9_: vec2<f32> = vec2(0f);
    var u_xlat12_: f32 = 0f;

    let _e52 = u_xlat0_;
    let _e57 = _f_buffer1_.f_cb1_[8];
    let _e62 = _f_buffer1_.f_cb1_[9];
    let _e65 = (_e57.yzw + -(_e62.xyz));
    u_xlat0_.x = _e65.x;
    u_xlat0_.y = _e65.y;
    u_xlat0_.z = _e65.z;
    let _e75 = _f_buffer1_.f_cb1_[10];
    u_xlat12_ = (-(_e75.w) + 1f);
    let _e80 = vs_TEXCOORD0_1;
    u_xlat1_ = _e80.zwxy;
    let _e82 = u_xlat1_;
    u_xlat1_ = clamp(_e82, vec4(0f), vec4(1f));
    let _e88 = u_xlat1_;
    let _e89 = vs_TEXCOORD0_1;
    u_xlat1_ = (_e88 + -(_e89.zwxy));
    let _e93 = u_xlat9_;
    let _e98 = _f_buffer1_.f_cb1_[3];
    let _e100 = u_xlat1_;
    let _e103 = vs_TEXCOORD0_1;
    let _e105 = ((_e98.zz * _e100.zw) + _e103.xy);
    u_xlat9_.x = _e105.x;
    u_xlat9_.y = _e105.y;
    let _e110 = u_xlat1_;
    let _e115 = _f_buffer1_.f_cb1_[6];
    let _e117 = u_xlat1_;
    let _e120 = vs_TEXCOORD0_1;
    let _e122 = ((_e115.xx * _e117.xy) + _e120.zw);
    u_xlat1_.x = _e122.x;
    u_xlat1_.y = _e122.y;
    let _e127 = u_xlat1_;
    let _e132 = _f_buffer0_.f_cb0_[4];
    let _e137 = hscard_bias.values[1];
    let _e140 = textureSampleBias(f_t1_, samplerf_s1_, _e127.xy, (_e132.x + _e137.x));
    u_xlat2_ = _e140;
    let _e141 = u_xlat9_;
    let _e146 = _f_buffer0_.f_cb0_[4];
    let _e151 = hscard_bias.values[0];
    let _e154 = textureSampleBias(f_t0_, samplerf_s0_, _e141.xy, (_e146.x + _e151.x));
    u_xlat1_ = _e154;
    let _e155 = u_xlat6_;
    let _e157 = u_xlat1_;
    let _e162 = _f_buffer1_.f_cb1_[2];
    let _e164 = (_e157.xyz + _e162.yyy);
    u_xlat6_.x = _e164.x;
    u_xlat6_.y = _e164.y;
    u_xlat6_.z = _e164.z;
    let _e171 = u_xlat1_;
    let _e176 = _f_buffer1_.f_cb1_[3];
    u_xlat3_ = max(_e171.w, _e176.y);
    let _e180 = u_xlat6_;
    let _e182 = u_xlat3_;
    let _e187 = _f_buffer1_.f_cb1_[10];
    u_xlat7_.x = ((_e180.y * _e182) + -(_e187.w));
    let _e191 = u_xlat6_;
    let _e193 = u_xlat6_;
    let _e195 = u_xlat3_;
    let _e197 = (_e193.xyz * vec3(_e195));
    u_xlat6_.x = _e197.x;
    u_xlat6_.y = _e197.y;
    u_xlat6_.z = _e197.z;
    let _e204 = u_xlat7_;
    let _e206 = u_xlat12_;
    u_xlat12_ = (_e204.x / _e206);
    let _e208 = u_xlat7_;
    u_xlat3_ = (_e208.x * 5f);
    let _e212 = u_xlat3_;
    u_xlat3_ = clamp(_e212, 0f, 1f);
    let _e216 = u_xlat0_;
    let _e218 = u_xlat12_;
    let _e220 = u_xlat0_;
    let _e226 = _f_buffer1_.f_cb1_[9];
    let _e228 = ((vec3(_e218) * _e220.xyz) + _e226.xyz);
    u_xlat0_.x = _e228.x;
    u_xlat0_.y = _e228.y;
    u_xlat0_.z = _e228.z;
    let _e240 = _f_buffer1_.f_cb1_[10];
    u_xlat12_ = (1f / _e240.w);
    let _e243 = u_xlat12_;
    let _e244 = u_xlat6_;
    u_xlat12_ = (_e243 * _e244.y);
    let _e247 = u_xlat7_;
    let _e252 = _f_buffer1_.f_cb1_[9];
    let _e257 = _f_buffer1_.f_cb1_[10];
    let _e260 = (_e252.xyz + -(_e257.xyz));
    u_xlat7_.x = _e260.x;
    u_xlat7_.y = _e260.y;
    u_xlat7_.z = _e260.z;
    let _e267 = u_xlat7_;
    let _e269 = u_xlat12_;
    let _e271 = u_xlat7_;
    let _e277 = _f_buffer1_.f_cb1_[10];
    let _e279 = ((vec3(_e269) * _e271.xyz) + _e277.xyz);
    u_xlat7_.x = _e279.x;
    u_xlat7_.y = _e279.y;
    u_xlat7_.z = _e279.z;
    let _e286 = u_xlat0_;
    let _e288 = u_xlat0_;
    let _e290 = u_xlat7_;
    let _e293 = (_e288.xyz + -(_e290.xyz));
    u_xlat0_.x = _e293.x;
    u_xlat0_.y = _e293.y;
    u_xlat0_.z = _e293.z;
    let _e300 = u_xlat0_;
    let _e302 = u_xlat3_;
    let _e304 = u_xlat0_;
    let _e307 = u_xlat7_;
    let _e309 = ((vec3(_e302) * _e304.xyz) + _e307.xyz);
    u_xlat0_.x = _e309.x;
    u_xlat0_.y = _e309.y;
    u_xlat0_.z = _e309.z;
    let _e316 = u_xlat0_;
    let _e318 = u_xlat0_;
    let _e320 = u_xlat6_;
    let _e322 = (_e318.xyz * _e320.xyz);
    u_xlat0_.x = _e322.x;
    u_xlat0_.y = _e322.y;
    u_xlat0_.z = _e322.z;
    let _e329 = u_xlat1_;
    let _e331 = u_xlat0_;
    let _e336 = _f_buffer1_.f_cb1_[2];
    let _e338 = (_e331.xyz * _e336.xxx);
    u_xlat1_.x = _e338.x;
    u_xlat1_.y = _e338.y;
    u_xlat1_.z = _e338.z;
    let _e346 = vs_TEXCOORD1_1;
    let _e350 = _f_buffer1_.f_cb1_[12];
    u_xlat0_.x = (_e346 + _e350.y);
    let _e354 = u_xlat0_;
    u_xlat0_.x = ((_e354.x * 2f) + -1f);
    let _e362 = u_xlat0_;
    let _e365 = u_xlat2_;
    u_xlat0_.x = (-(_e362.x) + _e365.x);
    let _e369 = u_xlat0_;
    u_xlat0_.x = clamp(_e369.x, 0f, 1f);
    let _e375 = u_xlat0_;
    u_xlat0_.x = log2(_e375.x);
    let _e382 = _f_buffer1_.f_cb1_[12];
    u_xlat4_.x = (_e382.z * 10f);
    let _e387 = u_xlat0_;
    let _e389 = u_xlat4_;
    u_xlat0_.x = (_e387.x * _e389.x);
    let _e393 = u_xlat0_;
    u_xlat0_.x = exp2(_e393.x);
    let _e396 = u_xlat0_;
    let _e398 = u_xlat1_;
    u_xlat2_ = (_e396.xxxx * _e398);
    let _e401 = u_xlat0_;
    u_xlat0_.x = (-(_e401.x) + 1f);
    let _e407 = u_xlat0_;
    u_xlat0_.x = log2(_e407.x);
    let _e411 = u_xlat0_;
    u_xlat0_.x = (_e411.x * 10f);
    let _e416 = u_xlat0_;
    u_xlat0_.x = exp2(_e416.x);
    let _e420 = u_xlat2_;
    u_xlat4_.x = (_e420.w * 1000000f);
    let _e425 = u_xlat4_;
    u_xlat4_.x = clamp(_e425.x, 0f, 1f);
    let _e431 = u_xlat1_;
    let _e433 = u_xlat4_;
    u_xlat4_.x = (_e431.w * _e433.x);
    let _e437 = u_xlat4_;
    let _e439 = u_xlat0_;
    u_xlat0_.x = (_e437.x * _e439.x);
    let _e442 = u_xlat4_;
    let _e447 = _f_buffer1_.f_cb1_[7];
    let _e452 = _f_buffer1_.f_cb1_[8];
    let _e454 = (_e447.xyz * _e452.xxx);
    u_xlat4_.x = _e454.x;
    u_xlat4_.y = _e454.y;
    u_xlat4_.z = _e454.z;
    let _e461 = u_xlat0_;
    let _e463 = u_xlat0_;
    let _e465 = u_xlat4_;
    let _e467 = (_e463.xxx * _e465.xyz);
    u_xlat0_.x = _e467.x;
    u_xlat0_.y = _e467.y;
    u_xlat0_.z = _e467.z;
    let _e474 = u_xlat2_;
    let _e476 = u_xlat0_;
    let _e478 = vs_COLOR1_1;
    let _e481 = u_xlat2_;
    let _e483 = ((_e476.xyz * _e478.www) + _e481.xyz);
    u_xlat2_.x = _e483.x;
    u_xlat2_.y = _e483.y;
    u_xlat2_.z = _e483.z;
    let _e490 = u_xlat2_;
    let _e491 = vs_COLOR0_1;
    SV_Target0_ = (_e490 * _e491);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(11) vs_COLOR1_: vec4<f32>, @location(10) vs_COLOR0_: vec4<f32>, @location(1) vs_TEXCOORD1_: f32) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_COLOR1_1 = vs_COLOR1_;
    vs_COLOR0_1 = vs_COLOR0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    main_1();
    let _e36 = SV_Target0_;
    return FragmentOutput(_e36);
}
