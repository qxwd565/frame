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
var<private> vs_COLOR1_1: vec4<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
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
    let _e144 = u_xlat9_;
    let _e149 = _f_buffer0_.f_cb0_[4];
    let _e154 = hscard_bias.values[0];
    let _e157 = textureSampleBias(f_t0_, samplerf_s0_, _e144.xy, (_e149.x + _e154.x));
    u_xlat2_ = _e157;
    let _e158 = u_xlat5_;
    let _e160 = u_xlat2_;
    let _e165 = _f_buffer1_.f_cb1_[2];
    let _e167 = (_e160.xyz + _e165.yyy);
    u_xlat5_.x = _e167.x;
    u_xlat5_.y = _e167.y;
    u_xlat5_.z = _e167.z;
    let _e174 = u_xlat2_;
    let _e179 = _f_buffer1_.f_cb1_[3];
    u_xlat3_ = max(_e174.w, _e179.y);
    let _e183 = u_xlat5_;
    let _e185 = u_xlat3_;
    let _e190 = _f_buffer1_.f_cb1_[10];
    u_xlat7_.x = ((_e183.y * _e185) + -(_e190.w));
    let _e194 = u_xlat5_;
    let _e196 = u_xlat5_;
    let _e198 = u_xlat3_;
    let _e200 = (_e196.xyz * vec3(_e198));
    u_xlat5_.x = _e200.x;
    u_xlat5_.y = _e200.y;
    u_xlat5_.z = _e200.z;
    let _e207 = u_xlat7_;
    let _e209 = u_xlat12_;
    u_xlat12_ = (_e207.x / _e209);
    let _e211 = u_xlat7_;
    u_xlat3_ = (_e211.x * 5f);
    let _e215 = u_xlat3_;
    u_xlat3_ = clamp(_e215, 0f, 1f);
    let _e219 = u_xlat0_;
    let _e221 = u_xlat12_;
    let _e223 = u_xlat0_;
    let _e229 = _f_buffer1_.f_cb1_[9];
    let _e231 = ((vec3(_e221) * _e223.xyz) + _e229.xyz);
    u_xlat0_.x = _e231.x;
    u_xlat0_.y = _e231.y;
    u_xlat0_.z = _e231.z;
    let _e243 = _f_buffer1_.f_cb1_[10];
    u_xlat12_ = (1f / _e243.w);
    let _e246 = u_xlat12_;
    let _e247 = u_xlat5_;
    u_xlat12_ = (_e246 * _e247.y);
    let _e250 = u_xlat7_;
    let _e255 = _f_buffer1_.f_cb1_[9];
    let _e260 = _f_buffer1_.f_cb1_[10];
    let _e263 = (_e255.xyz + -(_e260.xyz));
    u_xlat7_.x = _e263.x;
    u_xlat7_.y = _e263.y;
    u_xlat7_.z = _e263.z;
    let _e270 = u_xlat7_;
    let _e272 = u_xlat12_;
    let _e274 = u_xlat7_;
    let _e280 = _f_buffer1_.f_cb1_[10];
    let _e282 = ((vec3(_e272) * _e274.xyz) + _e280.xyz);
    u_xlat7_.x = _e282.x;
    u_xlat7_.y = _e282.y;
    u_xlat7_.z = _e282.z;
    let _e289 = u_xlat0_;
    let _e291 = u_xlat0_;
    let _e293 = u_xlat7_;
    let _e296 = (_e291.xyz + -(_e293.xyz));
    u_xlat0_.x = _e296.x;
    u_xlat0_.y = _e296.y;
    u_xlat0_.z = _e296.z;
    let _e303 = u_xlat0_;
    let _e305 = u_xlat3_;
    let _e307 = u_xlat0_;
    let _e310 = u_xlat7_;
    let _e312 = ((vec3(_e305) * _e307.xyz) + _e310.xyz);
    u_xlat0_.x = _e312.x;
    u_xlat0_.y = _e312.y;
    u_xlat0_.z = _e312.z;
    let _e319 = u_xlat0_;
    let _e321 = u_xlat0_;
    let _e323 = u_xlat5_;
    let _e325 = (_e321.xyz * _e323.xyz);
    u_xlat0_.x = _e325.x;
    u_xlat0_.y = _e325.y;
    u_xlat0_.z = _e325.z;
    let _e332 = u_xlat2_;
    let _e334 = u_xlat0_;
    let _e339 = _f_buffer1_.f_cb1_[2];
    let _e341 = (_e334.xyz * _e339.xxx);
    u_xlat2_.x = _e341.x;
    u_xlat2_.y = _e341.y;
    u_xlat2_.z = _e341.z;
    let _e348 = u_xlat1_;
    let _e350 = vs_COLOR1_1;
    let _e352 = u_xlat2_;
    u_xlat0_ = ((_e348.xxxx * _e350) + _e352);
    let _e354 = u_xlat0_;
    let _e355 = vs_COLOR0_1;
    SV_Target0_ = (_e354 * _e355);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(11) vs_COLOR1_: vec4<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_COLOR1_1 = vs_COLOR1_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e32 = SV_Target0_;
    return FragmentOutput(_e32);
}
