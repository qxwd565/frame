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
    u_xlat1_.x = (_e142.w + -1f);
    let _e151 = _f_buffer1_.f_cb1_[7];
    let _e153 = u_xlat1_;
    u_xlat1_.x = ((_e151.w * _e153.x) + 1f);
    let _e158 = u_xlat9_;
    let _e163 = _f_buffer0_.f_cb0_[4];
    let _e168 = hscard_bias.values[0];
    let _e171 = textureSampleBias(f_t0_, samplerf_s0_, _e158.xy, (_e163.x + _e168.x));
    u_xlat2_ = _e171;
    let _e172 = u_xlat2_;
    let _e177 = _f_buffer1_.f_cb1_[2];
    u_xlat5_ = (_e172.w + _e177.y);
    let _e181 = u_xlat2_;
    let _e186 = _f_buffer1_.f_cb1_[3];
    u_xlat9_.x = max(_e181.w, _e186.y);
    let _e189 = u_xlat5_;
    let _e190 = u_xlat9_;
    let _e196 = _f_buffer1_.f_cb1_[10];
    u_xlat13_ = ((_e189 * _e190.x) + -(_e196.w));
    let _e200 = u_xlat9_;
    let _e202 = u_xlat5_;
    u_xlat5_ = (_e200.x * _e202);
    let _e204 = u_xlat13_;
    let _e205 = u_xlat12_;
    u_xlat12_ = (_e204 / _e205);
    let _e208 = u_xlat13_;
    u_xlat9_.x = (_e208 * 5f);
    let _e212 = u_xlat9_;
    u_xlat9_.x = clamp(_e212.x, 0f, 1f);
    let _e217 = u_xlat0_;
    let _e219 = u_xlat12_;
    let _e221 = u_xlat0_;
    let _e227 = _f_buffer1_.f_cb1_[9];
    let _e229 = ((vec3(_e219) * _e221.xyz) + _e227.xyz);
    u_xlat0_.x = _e229.x;
    u_xlat0_.y = _e229.y;
    u_xlat0_.z = _e229.z;
    let _e241 = _f_buffer1_.f_cb1_[10];
    u_xlat12_ = (1f / _e241.w);
    let _e244 = u_xlat12_;
    let _e245 = u_xlat5_;
    u_xlat12_ = (_e244 * _e245);
    let _e247 = u_xlat3_;
    let _e252 = _f_buffer1_.f_cb1_[9];
    let _e257 = _f_buffer1_.f_cb1_[10];
    let _e260 = (_e252.xyz + -(_e257.xyz));
    u_xlat3_.x = _e260.x;
    u_xlat3_.y = _e260.y;
    u_xlat3_.z = _e260.z;
    let _e267 = u_xlat3_;
    let _e269 = u_xlat12_;
    let _e271 = u_xlat3_;
    let _e277 = _f_buffer1_.f_cb1_[10];
    let _e279 = ((vec3(_e269) * _e271.xyz) + _e277.xyz);
    u_xlat3_.x = _e279.x;
    u_xlat3_.y = _e279.y;
    u_xlat3_.z = _e279.z;
    let _e286 = u_xlat0_;
    let _e288 = u_xlat0_;
    let _e290 = u_xlat3_;
    let _e293 = (_e288.xyz + -(_e290.xyz));
    u_xlat0_.x = _e293.x;
    u_xlat0_.y = _e293.y;
    u_xlat0_.z = _e293.z;
    let _e300 = u_xlat0_;
    let _e302 = u_xlat9_;
    let _e304 = u_xlat0_;
    let _e307 = u_xlat3_;
    let _e309 = ((_e302.xxx * _e304.xyz) + _e307.xyz);
    u_xlat0_.x = _e309.x;
    u_xlat0_.y = _e309.y;
    u_xlat0_.z = _e309.z;
    let _e316 = u_xlat0_;
    let _e318 = u_xlat0_;
    let _e320 = u_xlat5_;
    let _e322 = (_e318.xyz * vec3(_e320));
    u_xlat0_.x = _e322.x;
    u_xlat0_.y = _e322.y;
    u_xlat0_.z = _e322.z;
    let _e329 = u_xlat2_;
    let _e331 = u_xlat0_;
    let _e336 = _f_buffer1_.f_cb1_[2];
    let _e338 = (_e331.xyz * _e336.xxx);
    u_xlat2_.x = _e338.x;
    u_xlat2_.y = _e338.y;
    u_xlat2_.z = _e338.z;
    let _e346 = vs_TEXCOORD1_1;
    let _e350 = _f_buffer1_.f_cb1_[12];
    u_xlat0_.x = (_e346 + -(_e350.z));
    let _e355 = u_xlat0_;
    u_xlat0_.x = clamp(_e355.x, 0f, 1f);
    let _e361 = u_xlat0_;
    u_xlat0_.x = (_e361.x + -0.00001f);
    let _e366 = u_xlat0_;
    let _e369 = u_xlat2_;
    u_xlat4_ = (-(_e366.x) + _e369.w);
    let _e372 = vs_TEXCOORD1_1;
    let _e376 = _f_buffer1_.f_cb1_[12];
    u_xlat8_ = (_e372 + _e376.z);
    let _e379 = u_xlat8_;
    u_xlat8_ = clamp(_e379, 0f, 1f);
    let _e384 = u_xlat0_;
    let _e387 = u_xlat8_;
    u_xlat0_.x = (-(_e384.x) + _e387);
    let _e392 = u_xlat0_;
    u_xlat0_.x = (1f / _e392.x);
    let _e396 = u_xlat0_;
    let _e398 = u_xlat4_;
    u_xlat0_.x = (_e396.x * _e398);
    let _e401 = u_xlat0_;
    u_xlat0_.x = clamp(_e401.x, 0f, 1f);
    let _e406 = u_xlat0_;
    u_xlat4_ = ((_e406.x * -2f) + 3f);
    let _e414 = u_xlat0_;
    let _e416 = u_xlat0_;
    u_xlat0_.x = (_e414.x * _e416.x);
    let _e420 = u_xlat0_;
    let _e422 = u_xlat4_;
    u_xlat0_.x = (_e420.x * _e422);
    let _e425 = u_xlat1_;
    let _e427 = u_xlat0_;
    u_xlat0_.x = (_e425.x * _e427.x);
    let _e430 = u_xlat0_;
    let _e432 = u_xlat2_;
    u_xlat0_ = (_e430.xxxx * _e432);
    let _e434 = u_xlat0_;
    let _e435 = vs_COLOR0_1;
    SV_Target0_ = (_e434 * _e435);
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
