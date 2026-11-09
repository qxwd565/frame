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
@group(3) @binding(5) 
var samplerf_s2_: sampler;
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
@group(3) @binding(4) 
var f_t2_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec4<f32>;
var<private> vs_COLOR1_1: vec4<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> vs_TEXCOORD1_1: f32;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec3<f32> = vec3(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat6_: f32 = 0f;

    let _e40 = vs_TEXCOORD1_1;
    let _e44 = _f_buffer1_.f_cb1_[12];
    u_xlat0_.x = (_e40 + _e44.y);
    let _e48 = u_xlat0_;
    u_xlat0_.x = ((_e48.x * 2f) + -1f);
    let _e55 = vs_TEXCOORD0_1;
    u_xlat1_ = _e55.zwxy;
    let _e57 = u_xlat1_;
    u_xlat1_ = clamp(_e57, vec4(0f), vec4(1f));
    let _e63 = u_xlat1_;
    let _e64 = vs_TEXCOORD0_1;
    u_xlat1_ = (_e63 + -(_e64.zwxy));
    let _e68 = u_xlat3_;
    let _e73 = _f_buffer1_.f_cb1_[6];
    let _e75 = u_xlat1_;
    let _e78 = vs_TEXCOORD0_1;
    let _e80 = ((_e73.xx * _e75.xy) + _e78.zw);
    u_xlat3_.x = _e80.x;
    u_xlat3_.y = _e80.y;
    let _e85 = u_xlat1_;
    let _e90 = _f_buffer1_.f_cb1_[3];
    let _e92 = u_xlat1_;
    let _e95 = vs_TEXCOORD0_1;
    let _e97 = ((_e90.zz * _e92.zw) + _e95.xy);
    u_xlat1_.x = _e97.x;
    u_xlat1_.y = _e97.y;
    let _e102 = u_xlat1_;
    let _e107 = _f_buffer0_.f_cb0_[4];
    let _e112 = hscard_bias.values[0];
    let _e115 = textureSampleBias(f_t0_, samplerf_s0_, _e102.xy, (_e107.x + _e112.x));
    u_xlat1_ = _e115.yzwx;
    let _e117 = u_xlat3_;
    let _e122 = _f_buffer0_.f_cb0_[4];
    let _e127 = hscard_bias.values[1];
    let _e130 = textureSampleBias(f_t1_, samplerf_s1_, _e117.xy, (_e122.x + _e127.x));
    u_xlat2_ = _e130;
    let _e132 = u_xlat0_;
    let _e135 = u_xlat2_;
    u_xlat0_.x = (-(_e132.x) + _e135.x);
    let _e139 = u_xlat0_;
    u_xlat0_.x = clamp(_e139.x, 0f, 1f);
    let _e145 = u_xlat0_;
    u_xlat0_.x = log2(_e145.x);
    let _e152 = _f_buffer1_.f_cb1_[12];
    u_xlat3_.x = (_e152.z * 10f);
    let _e157 = u_xlat0_;
    let _e159 = u_xlat3_;
    u_xlat0_.x = (_e157.x * _e159.x);
    let _e163 = u_xlat0_;
    u_xlat0_.x = exp2(_e163.x);
    let _e167 = u_xlat1_;
    let _e172 = _f_buffer1_.f_cb1_[2];
    u_xlat3_.x = (_e167.w + _e172.y);
    let _e175 = u_xlat1_;
    let _e180 = _f_buffer1_.f_cb1_[3];
    u_xlat6_ = max(_e175.w, _e180.y);
    let _e184 = u_xlat6_;
    let _e185 = u_xlat3_;
    u_xlat2_.x = (_e184 * _e185.x);
    let _e192 = _f_buffer1_.f_cb1_[11];
    u_xlat2_.y = ((_e192.x * 0.03125f) + 0.015625f);
    let _e198 = u_xlat2_;
    let _e203 = _f_buffer0_.f_cb0_[4];
    let _e208 = hscard_bias.values[2];
    let _e211 = textureSampleBias(f_t2_, samplerf_s2_, _e198.xy, (_e203.x + _e208.x));
    u_xlat2_ = _e211;
    let _e212 = u_xlat1_;
    let _e214 = u_xlat2_;
    let _e219 = _f_buffer1_.f_cb1_[2];
    let _e221 = (_e214.xyz * _e219.xxx);
    u_xlat1_.x = _e221.x;
    u_xlat1_.y = _e221.y;
    u_xlat1_.z = _e221.z;
    let _e228 = u_xlat0_;
    let _e230 = u_xlat1_;
    u_xlat2_ = (_e228.xxxx * _e230);
    let _e233 = u_xlat0_;
    u_xlat0_.x = (-(_e233.x) + 1f);
    let _e239 = u_xlat0_;
    u_xlat0_.x = log2(_e239.x);
    let _e243 = u_xlat0_;
    u_xlat0_.x = (_e243.x * 10f);
    let _e248 = u_xlat0_;
    u_xlat0_.x = exp2(_e248.x);
    let _e252 = u_xlat2_;
    u_xlat3_.x = (_e252.w * 1000000f);
    let _e257 = u_xlat3_;
    u_xlat3_.x = clamp(_e257.x, 0f, 1f);
    let _e263 = u_xlat1_;
    let _e265 = u_xlat3_;
    u_xlat3_.x = (_e263.w * _e265.x);
    let _e269 = u_xlat3_;
    let _e271 = u_xlat0_;
    u_xlat0_.x = (_e269.x * _e271.x);
    let _e274 = u_xlat3_;
    let _e279 = _f_buffer1_.f_cb1_[7];
    let _e284 = _f_buffer1_.f_cb1_[8];
    let _e286 = (_e279.xyz * _e284.xxx);
    u_xlat3_.x = _e286.x;
    u_xlat3_.y = _e286.y;
    u_xlat3_.z = _e286.z;
    let _e293 = u_xlat0_;
    let _e295 = u_xlat0_;
    let _e297 = u_xlat3_;
    let _e299 = (_e295.xxx * _e297.xyz);
    u_xlat0_.x = _e299.x;
    u_xlat0_.y = _e299.y;
    u_xlat0_.z = _e299.z;
    let _e306 = u_xlat2_;
    let _e308 = u_xlat0_;
    let _e310 = vs_COLOR1_1;
    let _e313 = u_xlat2_;
    let _e315 = ((_e308.xyz * _e310.www) + _e313.xyz);
    u_xlat2_.x = _e315.x;
    u_xlat2_.y = _e315.y;
    u_xlat2_.z = _e315.z;
    let _e322 = u_xlat2_;
    let _e323 = vs_COLOR0_1;
    SV_Target0_ = (_e322 * _e323);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(11) vs_COLOR1_: vec4<f32>, @location(10) vs_COLOR0_: vec4<f32>, @location(1) vs_TEXCOORD1_: f32) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_COLOR1_1 = vs_COLOR1_;
    vs_COLOR0_1 = vs_COLOR0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    main_1();
    let _e40 = SV_Target0_;
    return FragmentOutput(_e40);
}
