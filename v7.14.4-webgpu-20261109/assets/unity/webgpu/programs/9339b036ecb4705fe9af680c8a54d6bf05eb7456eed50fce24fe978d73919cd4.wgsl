struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 11>,
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
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat5_: f32 = 0f;
    var u_xlat9_: vec2<f32> = vec2(0f);
    var u_xlat12_: f32 = 0f;
    var u_xlat13_: f32 = 0f;

    let _e45 = u_xlat0_;
    let _e50 = _f_buffer1_.f_cb1_[8];
    let _e55 = _f_buffer1_.f_cb1_[9];
    let _e58 = (_e50.yzw + -(_e55.xyz));
    u_xlat0_.x = _e58.x;
    u_xlat0_.y = _e58.y;
    u_xlat0_.z = _e58.z;
    let _e68 = _f_buffer1_.f_cb1_[10];
    u_xlat12_ = (-(_e68.w) + 1f);
    let _e73 = vs_TEXCOORD0_1;
    u_xlat1_ = _e73.zwxy;
    let _e75 = u_xlat1_;
    u_xlat1_ = clamp(_e75, vec4(0f), vec4(1f));
    let _e81 = u_xlat1_;
    let _e82 = vs_TEXCOORD0_1;
    u_xlat1_ = (_e81 + -(_e82.zwxy));
    let _e86 = u_xlat9_;
    let _e91 = _f_buffer1_.f_cb1_[3];
    let _e93 = u_xlat1_;
    let _e96 = vs_TEXCOORD0_1;
    let _e98 = ((_e91.zz * _e93.zw) + _e96.xy);
    u_xlat9_.x = _e98.x;
    u_xlat9_.y = _e98.y;
    let _e103 = u_xlat1_;
    let _e108 = _f_buffer1_.f_cb1_[6];
    let _e110 = u_xlat1_;
    let _e113 = vs_TEXCOORD0_1;
    let _e115 = ((_e108.xx * _e110.xy) + _e113.zw);
    u_xlat1_.x = _e115.x;
    u_xlat1_.y = _e115.y;
    let _e120 = u_xlat1_;
    let _e125 = _f_buffer0_.f_cb0_[4];
    let _e130 = hscard_bias.values[1];
    let _e133 = textureSampleBias(f_t1_, samplerf_s1_, _e120.xy, (_e125.x + _e130.x));
    u_xlat2_ = _e133;
    let _e135 = u_xlat2_;
    u_xlat1_.x = dot(_e135.xyz, vec3<f32>(0.299f, 0.587f, 0.114f));
    let _e143 = u_xlat1_;
    u_xlat1_.x = (_e143.x + -1f);
    let _e152 = _f_buffer1_.f_cb1_[7];
    let _e154 = u_xlat1_;
    u_xlat1_.x = ((_e152.w * _e154.x) + 1f);
    let _e159 = u_xlat9_;
    let _e164 = _f_buffer0_.f_cb0_[4];
    let _e169 = hscard_bias.values[0];
    let _e172 = textureSampleBias(f_t0_, samplerf_s0_, _e159.xy, (_e164.x + _e169.x));
    u_xlat2_ = _e172;
    let _e174 = u_xlat2_;
    u_xlat2_.w = dot(_e174.xyz, vec3<f32>(0.299f, 0.587f, 0.114f));
    let _e181 = u_xlat2_;
    let _e186 = _f_buffer1_.f_cb1_[2];
    u_xlat5_ = (_e181.w + _e186.y);
    let _e190 = u_xlat2_;
    let _e195 = _f_buffer1_.f_cb1_[3];
    u_xlat9_.x = max(_e190.w, _e195.y);
    let _e198 = u_xlat5_;
    let _e199 = u_xlat9_;
    let _e205 = _f_buffer1_.f_cb1_[10];
    u_xlat13_ = ((_e198 * _e199.x) + -(_e205.w));
    let _e209 = u_xlat9_;
    let _e211 = u_xlat5_;
    u_xlat5_ = (_e209.x * _e211);
    let _e213 = u_xlat13_;
    let _e214 = u_xlat12_;
    u_xlat12_ = (_e213 / _e214);
    let _e217 = u_xlat13_;
    u_xlat9_.x = (_e217 * 5f);
    let _e221 = u_xlat9_;
    u_xlat9_.x = clamp(_e221.x, 0f, 1f);
    let _e226 = u_xlat0_;
    let _e228 = u_xlat12_;
    let _e230 = u_xlat0_;
    let _e236 = _f_buffer1_.f_cb1_[9];
    let _e238 = ((vec3(_e228) * _e230.xyz) + _e236.xyz);
    u_xlat0_.x = _e238.x;
    u_xlat0_.y = _e238.y;
    u_xlat0_.z = _e238.z;
    let _e250 = _f_buffer1_.f_cb1_[10];
    u_xlat12_ = (1f / _e250.w);
    let _e253 = u_xlat12_;
    let _e254 = u_xlat5_;
    u_xlat12_ = (_e253 * _e254);
    let _e256 = u_xlat3_;
    let _e261 = _f_buffer1_.f_cb1_[9];
    let _e266 = _f_buffer1_.f_cb1_[10];
    let _e269 = (_e261.xyz + -(_e266.xyz));
    u_xlat3_.x = _e269.x;
    u_xlat3_.y = _e269.y;
    u_xlat3_.z = _e269.z;
    let _e276 = u_xlat3_;
    let _e278 = u_xlat12_;
    let _e280 = u_xlat3_;
    let _e286 = _f_buffer1_.f_cb1_[10];
    let _e288 = ((vec3(_e278) * _e280.xyz) + _e286.xyz);
    u_xlat3_.x = _e288.x;
    u_xlat3_.y = _e288.y;
    u_xlat3_.z = _e288.z;
    let _e295 = u_xlat0_;
    let _e297 = u_xlat0_;
    let _e299 = u_xlat3_;
    let _e302 = (_e297.xyz + -(_e299.xyz));
    u_xlat0_.x = _e302.x;
    u_xlat0_.y = _e302.y;
    u_xlat0_.z = _e302.z;
    let _e309 = u_xlat0_;
    let _e311 = u_xlat9_;
    let _e313 = u_xlat0_;
    let _e316 = u_xlat3_;
    let _e318 = ((_e311.xxx * _e313.xyz) + _e316.xyz);
    u_xlat0_.x = _e318.x;
    u_xlat0_.y = _e318.y;
    u_xlat0_.z = _e318.z;
    let _e325 = u_xlat0_;
    let _e327 = u_xlat0_;
    let _e329 = u_xlat5_;
    let _e331 = (_e327.xyz * vec3(_e329));
    u_xlat0_.x = _e331.x;
    u_xlat0_.y = _e331.y;
    u_xlat0_.z = _e331.z;
    let _e338 = u_xlat2_;
    let _e340 = u_xlat0_;
    let _e345 = _f_buffer1_.f_cb1_[2];
    let _e347 = (_e340.xyz * _e345.xxx);
    u_xlat2_.x = _e347.x;
    u_xlat2_.y = _e347.y;
    u_xlat2_.z = _e347.z;
    let _e354 = u_xlat1_;
    let _e356 = u_xlat2_;
    u_xlat0_ = (_e354.xxxx * _e356);
    let _e358 = u_xlat0_;
    let _e359 = vs_COLOR0_1;
    SV_Target0_ = (_e358 * _e359);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e28 = SV_Target0_;
    return FragmentOutput(_e28);
}
