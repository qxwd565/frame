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
    var u_xlat5_: vec3<f32> = vec3(0f);
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
    let _e142 = u_xlat2_;
    u_xlat1_.x = dot(_e142.xyz, vec3<f32>(0.299f, 0.587f, 0.114f));
    let _e149 = u_xlat9_;
    let _e154 = _f_buffer0_.f_cb0_[4];
    let _e159 = hscard_bias.values[0];
    let _e162 = textureSampleBias(f_t0_, samplerf_s0_, _e149.xy, (_e154.x + _e159.x));
    u_xlat2_ = _e162.yzwx;
    let _e164 = u_xlat5_;
    let _e166 = u_xlat2_;
    let _e171 = _f_buffer1_.f_cb1_[2];
    let _e173 = (_e166.wxy + _e171.yyy);
    u_xlat5_.x = _e173.x;
    u_xlat5_.y = _e173.y;
    u_xlat5_.z = _e173.z;
    let _e180 = u_xlat2_;
    let _e185 = _f_buffer1_.f_cb1_[3];
    u_xlat3_ = max(_e180.w, _e185.y);
    let _e189 = u_xlat5_;
    let _e191 = u_xlat3_;
    let _e196 = _f_buffer1_.f_cb1_[10];
    u_xlat7_.x = ((_e189.y * _e191) + -(_e196.w));
    let _e200 = u_xlat5_;
    let _e202 = u_xlat5_;
    let _e204 = u_xlat3_;
    let _e206 = (_e202.xyz * vec3(_e204));
    u_xlat5_.x = _e206.x;
    u_xlat5_.y = _e206.y;
    u_xlat5_.z = _e206.z;
    let _e213 = u_xlat7_;
    let _e215 = u_xlat12_;
    u_xlat12_ = (_e213.x / _e215);
    let _e217 = u_xlat7_;
    u_xlat3_ = (_e217.x * 5f);
    let _e221 = u_xlat3_;
    u_xlat3_ = clamp(_e221, 0f, 1f);
    let _e225 = u_xlat0_;
    let _e227 = u_xlat12_;
    let _e229 = u_xlat0_;
    let _e235 = _f_buffer1_.f_cb1_[9];
    let _e237 = ((vec3(_e227) * _e229.xyz) + _e235.xyz);
    u_xlat0_.x = _e237.x;
    u_xlat0_.y = _e237.y;
    u_xlat0_.z = _e237.z;
    let _e249 = _f_buffer1_.f_cb1_[10];
    u_xlat12_ = (1f / _e249.w);
    let _e252 = u_xlat12_;
    let _e253 = u_xlat5_;
    u_xlat12_ = (_e252 * _e253.y);
    let _e256 = u_xlat7_;
    let _e261 = _f_buffer1_.f_cb1_[9];
    let _e266 = _f_buffer1_.f_cb1_[10];
    let _e269 = (_e261.xyz + -(_e266.xyz));
    u_xlat7_.x = _e269.x;
    u_xlat7_.y = _e269.y;
    u_xlat7_.z = _e269.z;
    let _e276 = u_xlat7_;
    let _e278 = u_xlat12_;
    let _e280 = u_xlat7_;
    let _e286 = _f_buffer1_.f_cb1_[10];
    let _e288 = ((vec3(_e278) * _e280.xyz) + _e286.xyz);
    u_xlat7_.x = _e288.x;
    u_xlat7_.y = _e288.y;
    u_xlat7_.z = _e288.z;
    let _e295 = u_xlat0_;
    let _e297 = u_xlat0_;
    let _e299 = u_xlat7_;
    let _e302 = (_e297.xyz + -(_e299.xyz));
    u_xlat0_.x = _e302.x;
    u_xlat0_.y = _e302.y;
    u_xlat0_.z = _e302.z;
    let _e309 = u_xlat0_;
    let _e311 = u_xlat3_;
    let _e313 = u_xlat0_;
    let _e316 = u_xlat7_;
    let _e318 = ((vec3(_e311) * _e313.xyz) + _e316.xyz);
    u_xlat0_.x = _e318.x;
    u_xlat0_.y = _e318.y;
    u_xlat0_.z = _e318.z;
    let _e325 = u_xlat0_;
    let _e327 = u_xlat0_;
    let _e329 = u_xlat5_;
    let _e331 = (_e327.xyz * _e329.xyz);
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
    let _e355 = vs_TEXCOORD1_1;
    let _e359 = _f_buffer1_.f_cb1_[12];
    u_xlat0_.x = (_e355 + _e359.y);
    let _e363 = u_xlat0_;
    u_xlat0_.x = ((_e363.x * 2f) + -1f);
    let _e371 = u_xlat0_;
    let _e374 = u_xlat1_;
    u_xlat0_.x = (-(_e371.x) + _e374.x);
    let _e378 = u_xlat0_;
    u_xlat0_.x = clamp(_e378.x, 0f, 1f);
    let _e384 = u_xlat0_;
    u_xlat0_.x = log2(_e384.x);
    let _e391 = _f_buffer1_.f_cb1_[12];
    u_xlat4_.x = (_e391.z * 10f);
    let _e396 = u_xlat0_;
    let _e398 = u_xlat4_;
    u_xlat0_.x = (_e396.x * _e398.x);
    let _e402 = u_xlat0_;
    u_xlat0_.x = exp2(_e402.x);
    let _e405 = u_xlat0_;
    let _e407 = u_xlat2_;
    u_xlat1_ = (_e405.xxxx * _e407);
    let _e410 = u_xlat0_;
    u_xlat0_.x = (-(_e410.x) + 1f);
    let _e416 = u_xlat0_;
    u_xlat0_.x = log2(_e416.x);
    let _e420 = u_xlat0_;
    u_xlat0_.x = (_e420.x * 10f);
    let _e425 = u_xlat0_;
    u_xlat0_.x = exp2(_e425.x);
    let _e429 = u_xlat1_;
    u_xlat4_.x = (_e429.w * 1000000f);
    let _e434 = u_xlat4_;
    u_xlat4_.x = clamp(_e434.x, 0f, 1f);
    let _e440 = u_xlat2_;
    let _e442 = u_xlat4_;
    u_xlat4_.x = (_e440.w * _e442.x);
    let _e446 = u_xlat4_;
    let _e448 = u_xlat0_;
    u_xlat0_.x = (_e446.x * _e448.x);
    let _e451 = u_xlat4_;
    let _e456 = _f_buffer1_.f_cb1_[7];
    let _e461 = _f_buffer1_.f_cb1_[8];
    let _e463 = (_e456.xyz * _e461.xxx);
    u_xlat4_.x = _e463.x;
    u_xlat4_.y = _e463.y;
    u_xlat4_.z = _e463.z;
    let _e470 = u_xlat0_;
    let _e472 = u_xlat0_;
    let _e474 = u_xlat4_;
    let _e476 = (_e472.xxx * _e474.xyz);
    u_xlat0_.x = _e476.x;
    u_xlat0_.y = _e476.y;
    u_xlat0_.z = _e476.z;
    let _e483 = u_xlat1_;
    let _e485 = u_xlat0_;
    let _e487 = vs_COLOR1_1;
    let _e490 = u_xlat1_;
    let _e492 = ((_e485.xyz * _e487.www) + _e490.xyz);
    u_xlat1_.x = _e492.x;
    u_xlat1_.y = _e492.y;
    u_xlat1_.z = _e492.z;
    let _e499 = u_xlat1_;
    let _e500 = vs_COLOR0_1;
    SV_Target0_ = (_e499 * _e500);
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
