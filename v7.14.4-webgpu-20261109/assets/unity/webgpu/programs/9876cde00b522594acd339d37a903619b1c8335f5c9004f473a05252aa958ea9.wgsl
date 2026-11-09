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
    u_xlat1_.x = dot(_e142.xyz, vec3<f32>(0.299f, 0.587f, 0.114f));
    let _e150 = u_xlat1_;
    u_xlat1_.x = (_e150.x + -1f);
    let _e159 = _f_buffer1_.f_cb1_[7];
    let _e161 = u_xlat1_;
    u_xlat1_.x = ((_e159.w * _e161.x) + 1f);
    let _e166 = u_xlat9_;
    let _e171 = _f_buffer0_.f_cb0_[4];
    let _e176 = hscard_bias.values[0];
    let _e179 = textureSampleBias(f_t0_, samplerf_s0_, _e166.xy, (_e171.x + _e176.x));
    u_xlat2_ = _e179;
    let _e181 = u_xlat2_;
    u_xlat2_.w = dot(_e181.xyz, vec3<f32>(0.299f, 0.587f, 0.114f));
    let _e188 = u_xlat2_;
    let _e193 = _f_buffer1_.f_cb1_[2];
    u_xlat5_ = (_e188.w + _e193.y);
    let _e197 = u_xlat2_;
    let _e202 = _f_buffer1_.f_cb1_[3];
    u_xlat9_.x = max(_e197.w, _e202.y);
    let _e205 = u_xlat5_;
    let _e206 = u_xlat9_;
    let _e212 = _f_buffer1_.f_cb1_[10];
    u_xlat13_ = ((_e205 * _e206.x) + -(_e212.w));
    let _e216 = u_xlat9_;
    let _e218 = u_xlat5_;
    u_xlat5_ = (_e216.x * _e218);
    let _e220 = u_xlat13_;
    let _e221 = u_xlat12_;
    u_xlat12_ = (_e220 / _e221);
    let _e224 = u_xlat13_;
    u_xlat9_.x = (_e224 * 5f);
    let _e228 = u_xlat9_;
    u_xlat9_.x = clamp(_e228.x, 0f, 1f);
    let _e233 = u_xlat0_;
    let _e235 = u_xlat12_;
    let _e237 = u_xlat0_;
    let _e243 = _f_buffer1_.f_cb1_[9];
    let _e245 = ((vec3(_e235) * _e237.xyz) + _e243.xyz);
    u_xlat0_.x = _e245.x;
    u_xlat0_.y = _e245.y;
    u_xlat0_.z = _e245.z;
    let _e257 = _f_buffer1_.f_cb1_[10];
    u_xlat12_ = (1f / _e257.w);
    let _e260 = u_xlat12_;
    let _e261 = u_xlat5_;
    u_xlat12_ = (_e260 * _e261);
    let _e263 = u_xlat3_;
    let _e268 = _f_buffer1_.f_cb1_[9];
    let _e273 = _f_buffer1_.f_cb1_[10];
    let _e276 = (_e268.xyz + -(_e273.xyz));
    u_xlat3_.x = _e276.x;
    u_xlat3_.y = _e276.y;
    u_xlat3_.z = _e276.z;
    let _e283 = u_xlat3_;
    let _e285 = u_xlat12_;
    let _e287 = u_xlat3_;
    let _e293 = _f_buffer1_.f_cb1_[10];
    let _e295 = ((vec3(_e285) * _e287.xyz) + _e293.xyz);
    u_xlat3_.x = _e295.x;
    u_xlat3_.y = _e295.y;
    u_xlat3_.z = _e295.z;
    let _e302 = u_xlat0_;
    let _e304 = u_xlat0_;
    let _e306 = u_xlat3_;
    let _e309 = (_e304.xyz + -(_e306.xyz));
    u_xlat0_.x = _e309.x;
    u_xlat0_.y = _e309.y;
    u_xlat0_.z = _e309.z;
    let _e316 = u_xlat0_;
    let _e318 = u_xlat9_;
    let _e320 = u_xlat0_;
    let _e323 = u_xlat3_;
    let _e325 = ((_e318.xxx * _e320.xyz) + _e323.xyz);
    u_xlat0_.x = _e325.x;
    u_xlat0_.y = _e325.y;
    u_xlat0_.z = _e325.z;
    let _e332 = u_xlat0_;
    let _e334 = u_xlat0_;
    let _e336 = u_xlat5_;
    let _e338 = (_e334.xyz * vec3(_e336));
    u_xlat0_.x = _e338.x;
    u_xlat0_.y = _e338.y;
    u_xlat0_.z = _e338.z;
    let _e345 = u_xlat2_;
    let _e347 = u_xlat0_;
    let _e352 = _f_buffer1_.f_cb1_[2];
    let _e354 = (_e347.xyz * _e352.xxx);
    u_xlat2_.x = _e354.x;
    u_xlat2_.y = _e354.y;
    u_xlat2_.z = _e354.z;
    let _e362 = vs_TEXCOORD1_1;
    let _e366 = _f_buffer1_.f_cb1_[12];
    u_xlat0_.x = (_e362 + -(_e366.z));
    let _e371 = u_xlat0_;
    u_xlat0_.x = clamp(_e371.x, 0f, 1f);
    let _e377 = u_xlat0_;
    u_xlat0_.x = (_e377.x + -0.00001f);
    let _e382 = u_xlat0_;
    let _e385 = u_xlat2_;
    u_xlat4_ = (-(_e382.x) + _e385.w);
    let _e388 = vs_TEXCOORD1_1;
    let _e392 = _f_buffer1_.f_cb1_[12];
    u_xlat8_ = (_e388 + _e392.z);
    let _e395 = u_xlat8_;
    u_xlat8_ = clamp(_e395, 0f, 1f);
    let _e400 = u_xlat0_;
    let _e403 = u_xlat8_;
    u_xlat0_.x = (-(_e400.x) + _e403);
    let _e408 = u_xlat0_;
    u_xlat0_.x = (1f / _e408.x);
    let _e412 = u_xlat0_;
    let _e414 = u_xlat4_;
    u_xlat0_.x = (_e412.x * _e414);
    let _e417 = u_xlat0_;
    u_xlat0_.x = clamp(_e417.x, 0f, 1f);
    let _e422 = u_xlat0_;
    u_xlat4_ = ((_e422.x * -2f) + 3f);
    let _e430 = u_xlat0_;
    let _e432 = u_xlat0_;
    u_xlat0_.x = (_e430.x * _e432.x);
    let _e436 = u_xlat0_;
    let _e438 = u_xlat4_;
    u_xlat0_.x = (_e436.x * _e438);
    let _e441 = u_xlat1_;
    let _e443 = u_xlat0_;
    u_xlat0_.x = (_e441.x * _e443.x);
    let _e446 = u_xlat0_;
    let _e448 = u_xlat2_;
    u_xlat0_ = (_e446.xxxx * _e448);
    let _e450 = u_xlat0_;
    let _e451 = vs_COLOR0_1;
    SV_Target0_ = (_e450 * _e451);
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
