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
var<private> vs_TEXCOORD1_1: f32;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: f32 = 0f;
    var u_xlat5_: vec3<f32> = vec3(0f);
    var u_xlat7_: vec3<f32> = vec3(0f);
    var u_xlat9_: vec2<f32> = vec2(0f);
    var u_xlat12_: f32 = 0f;

    let _e47 = u_xlat0_;
    let _e52 = _f_buffer1_.f_cb1_[8];
    let _e57 = _f_buffer1_.f_cb1_[9];
    let _e60 = (_e52.yzw + -(_e57.xyz));
    u_xlat0_.x = _e60.x;
    u_xlat0_.y = _e60.y;
    u_xlat0_.z = _e60.z;
    let _e70 = _f_buffer1_.f_cb1_[10];
    u_xlat12_ = (-(_e70.w) + 1f);
    let _e75 = vs_TEXCOORD0_1;
    u_xlat1_ = _e75.zwxy;
    let _e77 = u_xlat1_;
    u_xlat1_ = clamp(_e77, vec4(0f), vec4(1f));
    let _e83 = u_xlat1_;
    let _e84 = vs_TEXCOORD0_1;
    u_xlat1_ = (_e83 + -(_e84.zwxy));
    let _e88 = u_xlat9_;
    let _e93 = _f_buffer1_.f_cb1_[3];
    let _e95 = u_xlat1_;
    let _e98 = vs_TEXCOORD0_1;
    let _e100 = ((_e93.zz * _e95.zw) + _e98.xy);
    u_xlat9_.x = _e100.x;
    u_xlat9_.y = _e100.y;
    let _e105 = u_xlat1_;
    let _e110 = _f_buffer1_.f_cb1_[6];
    let _e112 = u_xlat1_;
    let _e115 = vs_TEXCOORD0_1;
    let _e117 = ((_e110.xx * _e112.xy) + _e115.zw);
    u_xlat1_.x = _e117.x;
    u_xlat1_.y = _e117.y;
    let _e122 = u_xlat1_;
    let _e127 = _f_buffer0_.f_cb0_[4];
    let _e132 = hscard_bias.values[1];
    let _e135 = textureSampleBias(f_t1_, samplerf_s1_, _e122.xy, (_e127.x + _e132.x));
    u_xlat2_ = _e135;
    let _e137 = u_xlat2_;
    u_xlat1_.x = dot(_e137.xyz, vec3<f32>(0.299f, 0.587f, 0.114f));
    let _e145 = u_xlat1_;
    u_xlat1_.x = (_e145.x + -1f);
    let _e154 = _f_buffer1_.f_cb1_[7];
    let _e156 = u_xlat1_;
    u_xlat1_.x = ((_e154.w * _e156.x) + 1f);
    let _e161 = u_xlat9_;
    let _e166 = _f_buffer0_.f_cb0_[4];
    let _e171 = hscard_bias.values[0];
    let _e174 = textureSampleBias(f_t0_, samplerf_s0_, _e161.xy, (_e166.x + _e171.x));
    u_xlat2_ = _e174.yzwx;
    let _e176 = u_xlat5_;
    let _e178 = u_xlat2_;
    let _e183 = _f_buffer1_.f_cb1_[2];
    let _e185 = (_e178.wxy + _e183.yyy);
    u_xlat5_.x = _e185.x;
    u_xlat5_.y = _e185.y;
    u_xlat5_.z = _e185.z;
    let _e192 = u_xlat2_;
    let _e197 = _f_buffer1_.f_cb1_[3];
    u_xlat3_ = max(_e192.w, _e197.y);
    let _e201 = u_xlat5_;
    let _e203 = u_xlat3_;
    let _e208 = _f_buffer1_.f_cb1_[10];
    u_xlat7_.x = ((_e201.y * _e203) + -(_e208.w));
    let _e212 = u_xlat5_;
    let _e214 = u_xlat5_;
    let _e216 = u_xlat3_;
    let _e218 = (_e214.xyz * vec3(_e216));
    u_xlat5_.x = _e218.x;
    u_xlat5_.y = _e218.y;
    u_xlat5_.z = _e218.z;
    let _e225 = u_xlat7_;
    let _e227 = u_xlat12_;
    u_xlat12_ = (_e225.x / _e227);
    let _e229 = u_xlat7_;
    u_xlat3_ = (_e229.x * 5f);
    let _e233 = u_xlat3_;
    u_xlat3_ = clamp(_e233, 0f, 1f);
    let _e237 = u_xlat0_;
    let _e239 = u_xlat12_;
    let _e241 = u_xlat0_;
    let _e247 = _f_buffer1_.f_cb1_[9];
    let _e249 = ((vec3(_e239) * _e241.xyz) + _e247.xyz);
    u_xlat0_.x = _e249.x;
    u_xlat0_.y = _e249.y;
    u_xlat0_.z = _e249.z;
    let _e261 = _f_buffer1_.f_cb1_[10];
    u_xlat12_ = (1f / _e261.w);
    let _e264 = u_xlat12_;
    let _e265 = u_xlat5_;
    u_xlat12_ = (_e264 * _e265.y);
    let _e268 = u_xlat7_;
    let _e273 = _f_buffer1_.f_cb1_[9];
    let _e278 = _f_buffer1_.f_cb1_[10];
    let _e281 = (_e273.xyz + -(_e278.xyz));
    u_xlat7_.x = _e281.x;
    u_xlat7_.y = _e281.y;
    u_xlat7_.z = _e281.z;
    let _e288 = u_xlat7_;
    let _e290 = u_xlat12_;
    let _e292 = u_xlat7_;
    let _e298 = _f_buffer1_.f_cb1_[10];
    let _e300 = ((vec3(_e290) * _e292.xyz) + _e298.xyz);
    u_xlat7_.x = _e300.x;
    u_xlat7_.y = _e300.y;
    u_xlat7_.z = _e300.z;
    let _e307 = u_xlat0_;
    let _e309 = u_xlat0_;
    let _e311 = u_xlat7_;
    let _e314 = (_e309.xyz + -(_e311.xyz));
    u_xlat0_.x = _e314.x;
    u_xlat0_.y = _e314.y;
    u_xlat0_.z = _e314.z;
    let _e321 = u_xlat0_;
    let _e323 = u_xlat3_;
    let _e325 = u_xlat0_;
    let _e328 = u_xlat7_;
    let _e330 = ((vec3(_e323) * _e325.xyz) + _e328.xyz);
    u_xlat0_.x = _e330.x;
    u_xlat0_.y = _e330.y;
    u_xlat0_.z = _e330.z;
    let _e337 = u_xlat0_;
    let _e339 = u_xlat0_;
    let _e341 = u_xlat5_;
    let _e343 = (_e339.xyz * _e341.xyz);
    u_xlat0_.x = _e343.x;
    u_xlat0_.y = _e343.y;
    u_xlat0_.z = _e343.z;
    let _e350 = u_xlat2_;
    let _e352 = u_xlat0_;
    let _e357 = _f_buffer1_.f_cb1_[2];
    let _e359 = (_e352.xyz * _e357.xxx);
    u_xlat2_.x = _e359.x;
    u_xlat2_.y = _e359.y;
    u_xlat2_.z = _e359.z;
    let _e366 = u_xlat1_;
    let _e368 = u_xlat2_;
    u_xlat0_ = (_e366.xxxx * _e368);
    let _e371 = vs_TEXCOORD1_1;
    u_xlat1_.x = _e371;
    let _e373 = u_xlat1_;
    u_xlat1_.x = clamp(_e373.x, 0f, 1f);
    let _e378 = u_xlat1_;
    let _e380 = vs_COLOR0_1;
    u_xlat1_ = (_e378.xxxx * _e380);
    let _e382 = u_xlat0_;
    let _e383 = u_xlat1_;
    SV_Target0_ = (_e382 * _e383);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(10) vs_COLOR0_: vec4<f32>, @location(1) vs_TEXCOORD1_: f32) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_COLOR0_1 = vs_COLOR0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    main_1();
    let _e32 = SV_Target0_;
    return FragmentOutput(_e32);
}
