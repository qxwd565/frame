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
var<private> vs_COLOR0_1: vec4<f32>;
var<private> vs_TEXCOORD1_1: f32;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: f32 = 0f;
    var u_xlat5_: f32 = 0f;
    var u_xlat8_: f32 = 0f;
    var u_xlat9_: vec2<f32> = vec2(0f);
    var u_xlat12_: f32 = 0f;
    var u_xlat13_: f32 = 0f;

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
    u_xlat1_.x = (_e142.x + -1f);
    let _e151 = _f_buffer1_.f_cb1_[7];
    let _e153 = u_xlat1_;
    u_xlat1_.x = ((_e151.w * _e153.x) + 1f);
    let _e158 = u_xlat9_;
    let _e163 = _f_buffer0_.f_cb0_[4];
    let _e168 = hscard_bias.values[0];
    let _e171 = textureSampleBias(f_t0_, samplerf_s0_, _e158.xy, (_e163.x + _e168.x));
    u_xlat2_ = _e171;
    let _e173 = u_xlat2_;
    u_xlat2_.w = dot(_e173.xyz, vec3<f32>(0.299f, 0.587f, 0.114f));
    let _e180 = u_xlat2_;
    let _e185 = _f_buffer1_.f_cb1_[2];
    u_xlat5_ = (_e180.w + _e185.y);
    let _e189 = u_xlat2_;
    let _e194 = _f_buffer1_.f_cb1_[3];
    u_xlat9_.x = max(_e189.w, _e194.y);
    let _e197 = u_xlat5_;
    let _e198 = u_xlat9_;
    let _e204 = _f_buffer1_.f_cb1_[10];
    u_xlat13_ = ((_e197 * _e198.x) + -(_e204.w));
    let _e208 = u_xlat9_;
    let _e210 = u_xlat5_;
    u_xlat5_ = (_e208.x * _e210);
    let _e212 = u_xlat13_;
    let _e213 = u_xlat12_;
    u_xlat12_ = (_e212 / _e213);
    let _e216 = u_xlat13_;
    u_xlat9_.x = (_e216 * 5f);
    let _e220 = u_xlat9_;
    u_xlat9_.x = clamp(_e220.x, 0f, 1f);
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
    u_xlat12_ = (_e252 * _e253);
    let _e255 = u_xlat3_;
    let _e260 = _f_buffer1_.f_cb1_[9];
    let _e265 = _f_buffer1_.f_cb1_[10];
    let _e268 = (_e260.xyz + -(_e265.xyz));
    u_xlat3_.x = _e268.x;
    u_xlat3_.y = _e268.y;
    u_xlat3_.z = _e268.z;
    let _e275 = u_xlat3_;
    let _e277 = u_xlat12_;
    let _e279 = u_xlat3_;
    let _e285 = _f_buffer1_.f_cb1_[10];
    let _e287 = ((vec3(_e277) * _e279.xyz) + _e285.xyz);
    u_xlat3_.x = _e287.x;
    u_xlat3_.y = _e287.y;
    u_xlat3_.z = _e287.z;
    let _e294 = u_xlat0_;
    let _e296 = u_xlat0_;
    let _e298 = u_xlat3_;
    let _e301 = (_e296.xyz + -(_e298.xyz));
    u_xlat0_.x = _e301.x;
    u_xlat0_.y = _e301.y;
    u_xlat0_.z = _e301.z;
    let _e308 = u_xlat0_;
    let _e310 = u_xlat9_;
    let _e312 = u_xlat0_;
    let _e315 = u_xlat3_;
    let _e317 = ((_e310.xxx * _e312.xyz) + _e315.xyz);
    u_xlat0_.x = _e317.x;
    u_xlat0_.y = _e317.y;
    u_xlat0_.z = _e317.z;
    let _e324 = u_xlat0_;
    let _e326 = u_xlat0_;
    let _e328 = u_xlat5_;
    let _e330 = (_e326.xyz * vec3(_e328));
    u_xlat0_.x = _e330.x;
    u_xlat0_.y = _e330.y;
    u_xlat0_.z = _e330.z;
    let _e337 = u_xlat2_;
    let _e339 = u_xlat0_;
    let _e344 = _f_buffer1_.f_cb1_[2];
    let _e346 = (_e339.xyz * _e344.xxx);
    u_xlat2_.x = _e346.x;
    u_xlat2_.y = _e346.y;
    u_xlat2_.z = _e346.z;
    let _e354 = vs_TEXCOORD1_1;
    let _e358 = _f_buffer1_.f_cb1_[12];
    u_xlat0_.x = (_e354 + -(_e358.z));
    let _e363 = u_xlat0_;
    u_xlat0_.x = clamp(_e363.x, 0f, 1f);
    let _e369 = u_xlat0_;
    u_xlat0_.x = (_e369.x + -0.00001f);
    let _e374 = u_xlat0_;
    let _e377 = u_xlat2_;
    u_xlat4_ = (-(_e374.x) + _e377.w);
    let _e380 = vs_TEXCOORD1_1;
    let _e384 = _f_buffer1_.f_cb1_[12];
    u_xlat8_ = (_e380 + _e384.z);
    let _e387 = u_xlat8_;
    u_xlat8_ = clamp(_e387, 0f, 1f);
    let _e392 = u_xlat0_;
    let _e395 = u_xlat8_;
    u_xlat0_.x = (-(_e392.x) + _e395);
    let _e400 = u_xlat0_;
    u_xlat0_.x = (1f / _e400.x);
    let _e404 = u_xlat0_;
    let _e406 = u_xlat4_;
    u_xlat0_.x = (_e404.x * _e406);
    let _e409 = u_xlat0_;
    u_xlat0_.x = clamp(_e409.x, 0f, 1f);
    let _e414 = u_xlat0_;
    u_xlat4_ = ((_e414.x * -2f) + 3f);
    let _e422 = u_xlat0_;
    let _e424 = u_xlat0_;
    u_xlat0_.x = (_e422.x * _e424.x);
    let _e428 = u_xlat0_;
    let _e430 = u_xlat4_;
    u_xlat0_.x = (_e428.x * _e430);
    let _e433 = u_xlat1_;
    let _e435 = u_xlat0_;
    u_xlat0_.x = (_e433.x * _e435.x);
    let _e438 = u_xlat0_;
    let _e440 = u_xlat2_;
    u_xlat0_ = (_e438.xxxx * _e440);
    let _e442 = u_xlat0_;
    let _e443 = vs_COLOR0_1;
    SV_Target0_ = (_e442 * _e443);
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
