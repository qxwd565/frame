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
    u_xlat1_.x = (_e137.x + -1f);
    let _e146 = _f_buffer1_.f_cb1_[7];
    let _e148 = u_xlat1_;
    u_xlat1_.x = ((_e146.w * _e148.x) + 1f);
    let _e153 = u_xlat9_;
    let _e158 = _f_buffer0_.f_cb0_[4];
    let _e163 = hscard_bias.values[0];
    let _e166 = textureSampleBias(f_t0_, samplerf_s0_, _e153.xy, (_e158.x + _e163.x));
    u_xlat2_ = _e166;
    let _e167 = u_xlat5_;
    let _e169 = u_xlat2_;
    let _e174 = _f_buffer1_.f_cb1_[2];
    let _e176 = (_e169.xyz + _e174.yyy);
    u_xlat5_.x = _e176.x;
    u_xlat5_.y = _e176.y;
    u_xlat5_.z = _e176.z;
    let _e183 = u_xlat2_;
    let _e188 = _f_buffer1_.f_cb1_[3];
    u_xlat3_ = max(_e183.w, _e188.y);
    let _e192 = u_xlat5_;
    let _e194 = u_xlat3_;
    let _e199 = _f_buffer1_.f_cb1_[10];
    u_xlat7_.x = ((_e192.y * _e194) + -(_e199.w));
    let _e203 = u_xlat5_;
    let _e205 = u_xlat5_;
    let _e207 = u_xlat3_;
    let _e209 = (_e205.xyz * vec3(_e207));
    u_xlat5_.x = _e209.x;
    u_xlat5_.y = _e209.y;
    u_xlat5_.z = _e209.z;
    let _e216 = u_xlat7_;
    let _e218 = u_xlat12_;
    u_xlat12_ = (_e216.x / _e218);
    let _e220 = u_xlat7_;
    u_xlat3_ = (_e220.x * 5f);
    let _e224 = u_xlat3_;
    u_xlat3_ = clamp(_e224, 0f, 1f);
    let _e228 = u_xlat0_;
    let _e230 = u_xlat12_;
    let _e232 = u_xlat0_;
    let _e238 = _f_buffer1_.f_cb1_[9];
    let _e240 = ((vec3(_e230) * _e232.xyz) + _e238.xyz);
    u_xlat0_.x = _e240.x;
    u_xlat0_.y = _e240.y;
    u_xlat0_.z = _e240.z;
    let _e252 = _f_buffer1_.f_cb1_[10];
    u_xlat12_ = (1f / _e252.w);
    let _e255 = u_xlat12_;
    let _e256 = u_xlat5_;
    u_xlat12_ = (_e255 * _e256.y);
    let _e259 = u_xlat7_;
    let _e264 = _f_buffer1_.f_cb1_[9];
    let _e269 = _f_buffer1_.f_cb1_[10];
    let _e272 = (_e264.xyz + -(_e269.xyz));
    u_xlat7_.x = _e272.x;
    u_xlat7_.y = _e272.y;
    u_xlat7_.z = _e272.z;
    let _e279 = u_xlat7_;
    let _e281 = u_xlat12_;
    let _e283 = u_xlat7_;
    let _e289 = _f_buffer1_.f_cb1_[10];
    let _e291 = ((vec3(_e281) * _e283.xyz) + _e289.xyz);
    u_xlat7_.x = _e291.x;
    u_xlat7_.y = _e291.y;
    u_xlat7_.z = _e291.z;
    let _e298 = u_xlat0_;
    let _e300 = u_xlat0_;
    let _e302 = u_xlat7_;
    let _e305 = (_e300.xyz + -(_e302.xyz));
    u_xlat0_.x = _e305.x;
    u_xlat0_.y = _e305.y;
    u_xlat0_.z = _e305.z;
    let _e312 = u_xlat0_;
    let _e314 = u_xlat3_;
    let _e316 = u_xlat0_;
    let _e319 = u_xlat7_;
    let _e321 = ((vec3(_e314) * _e316.xyz) + _e319.xyz);
    u_xlat0_.x = _e321.x;
    u_xlat0_.y = _e321.y;
    u_xlat0_.z = _e321.z;
    let _e328 = u_xlat0_;
    let _e330 = u_xlat0_;
    let _e332 = u_xlat5_;
    let _e334 = (_e330.xyz * _e332.xyz);
    u_xlat0_.x = _e334.x;
    u_xlat0_.y = _e334.y;
    u_xlat0_.z = _e334.z;
    let _e341 = u_xlat2_;
    let _e343 = u_xlat0_;
    let _e348 = _f_buffer1_.f_cb1_[2];
    let _e350 = (_e343.xyz * _e348.xxx);
    u_xlat2_.x = _e350.x;
    u_xlat2_.y = _e350.y;
    u_xlat2_.z = _e350.z;
    let _e357 = u_xlat1_;
    let _e359 = u_xlat2_;
    u_xlat0_ = (_e357.xxxx * _e359);
    let _e362 = vs_TEXCOORD1_1;
    u_xlat1_.x = _e362;
    let _e364 = u_xlat1_;
    u_xlat1_.x = clamp(_e364.x, 0f, 1f);
    let _e369 = u_xlat1_;
    let _e371 = vs_COLOR0_1;
    u_xlat1_ = (_e369.xxxx * _e371);
    let _e373 = u_xlat0_;
    let _e374 = u_xlat1_;
    SV_Target0_ = (_e373 * _e374);
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
