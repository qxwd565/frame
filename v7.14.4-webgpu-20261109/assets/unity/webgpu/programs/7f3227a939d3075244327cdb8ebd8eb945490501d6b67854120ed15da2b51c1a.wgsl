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
    var u_xlat3_: vec3<f32> = vec3(0f);

    let _e35 = vs_TEXCOORD1_1;
    let _e39 = _f_buffer1_.f_cb1_[12];
    u_xlat0_.x = (_e35 + _e39.y);
    let _e43 = u_xlat0_;
    u_xlat0_.x = ((_e43.x * 2f) + -1f);
    let _e50 = vs_TEXCOORD0_1;
    u_xlat1_ = _e50.zwxy;
    let _e52 = u_xlat1_;
    u_xlat1_ = clamp(_e52, vec4(0f), vec4(1f));
    let _e58 = u_xlat1_;
    let _e59 = vs_TEXCOORD0_1;
    u_xlat1_ = (_e58 + -(_e59.zwxy));
    let _e63 = u_xlat3_;
    let _e68 = _f_buffer1_.f_cb1_[6];
    let _e70 = u_xlat1_;
    let _e73 = vs_TEXCOORD0_1;
    let _e75 = ((_e68.xx * _e70.xy) + _e73.zw);
    u_xlat3_.x = _e75.x;
    u_xlat3_.y = _e75.y;
    let _e80 = u_xlat1_;
    let _e85 = _f_buffer1_.f_cb1_[3];
    let _e87 = u_xlat1_;
    let _e90 = vs_TEXCOORD0_1;
    let _e92 = ((_e85.zz * _e87.zw) + _e90.xy);
    u_xlat1_.x = _e92.x;
    u_xlat1_.y = _e92.y;
    let _e97 = u_xlat1_;
    let _e102 = _f_buffer0_.f_cb0_[4];
    let _e107 = hscard_bias.values[0];
    let _e110 = textureSampleBias(f_t0_, samplerf_s0_, _e97.xy, (_e102.x + _e107.x));
    u_xlat1_ = _e110.yzwx;
    let _e112 = u_xlat3_;
    let _e117 = _f_buffer0_.f_cb0_[4];
    let _e122 = hscard_bias.values[1];
    let _e125 = textureSampleBias(f_t1_, samplerf_s1_, _e112.xy, (_e117.x + _e122.x));
    u_xlat2_ = _e125;
    let _e127 = u_xlat0_;
    let _e130 = u_xlat2_;
    u_xlat0_.x = (-(_e127.x) + _e130.w);
    let _e134 = u_xlat0_;
    u_xlat0_.x = clamp(_e134.x, 0f, 1f);
    let _e140 = u_xlat0_;
    u_xlat0_.x = log2(_e140.x);
    let _e147 = _f_buffer1_.f_cb1_[12];
    u_xlat3_.x = (_e147.z * 10f);
    let _e152 = u_xlat0_;
    let _e154 = u_xlat3_;
    u_xlat0_.x = (_e152.x * _e154.x);
    let _e158 = u_xlat0_;
    u_xlat0_.x = exp2(_e158.x);
    let _e161 = u_xlat3_;
    let _e163 = u_xlat1_;
    let _e168 = _f_buffer1_.f_cb1_[2];
    let _e170 = (_e163.wxy + _e168.yyy);
    u_xlat3_.x = _e170.x;
    u_xlat3_.y = _e170.y;
    u_xlat3_.z = _e170.z;
    let _e178 = u_xlat1_;
    let _e183 = _f_buffer1_.f_cb1_[3];
    u_xlat2_.x = max(_e178.w, _e183.y);
    let _e186 = u_xlat3_;
    let _e188 = u_xlat3_;
    let _e190 = u_xlat2_;
    let _e192 = (_e188.xyz * _e190.xxx);
    u_xlat3_.x = _e192.x;
    u_xlat3_.y = _e192.y;
    u_xlat3_.z = _e192.z;
    let _e199 = u_xlat1_;
    let _e201 = u_xlat3_;
    let _e206 = _f_buffer1_.f_cb1_[2];
    let _e208 = (_e201.xyz * _e206.xxx);
    u_xlat1_.x = _e208.x;
    u_xlat1_.y = _e208.y;
    u_xlat1_.z = _e208.z;
    let _e215 = u_xlat0_;
    let _e217 = u_xlat1_;
    u_xlat2_ = (_e215.xxxx * _e217);
    let _e220 = u_xlat0_;
    u_xlat0_.x = (-(_e220.x) + 1f);
    let _e226 = u_xlat0_;
    u_xlat0_.x = log2(_e226.x);
    let _e230 = u_xlat0_;
    u_xlat0_.x = (_e230.x * 10f);
    let _e235 = u_xlat0_;
    u_xlat0_.x = exp2(_e235.x);
    let _e239 = u_xlat2_;
    u_xlat3_.x = (_e239.w * 1000000f);
    let _e244 = u_xlat3_;
    u_xlat3_.x = clamp(_e244.x, 0f, 1f);
    let _e250 = u_xlat1_;
    let _e252 = u_xlat3_;
    u_xlat3_.x = (_e250.w * _e252.x);
    let _e256 = u_xlat3_;
    let _e258 = u_xlat0_;
    u_xlat0_.x = (_e256.x * _e258.x);
    let _e261 = u_xlat3_;
    let _e266 = _f_buffer1_.f_cb1_[7];
    let _e271 = _f_buffer1_.f_cb1_[8];
    let _e273 = (_e266.xyz * _e271.xxx);
    u_xlat3_.x = _e273.x;
    u_xlat3_.y = _e273.y;
    u_xlat3_.z = _e273.z;
    let _e280 = u_xlat0_;
    let _e282 = u_xlat0_;
    let _e284 = u_xlat3_;
    let _e286 = (_e282.xxx * _e284.xyz);
    u_xlat0_.x = _e286.x;
    u_xlat0_.y = _e286.y;
    u_xlat0_.z = _e286.z;
    let _e293 = u_xlat2_;
    let _e295 = u_xlat0_;
    let _e297 = vs_COLOR1_1;
    let _e300 = u_xlat2_;
    let _e302 = ((_e295.xyz * _e297.www) + _e300.xyz);
    u_xlat2_.x = _e302.x;
    u_xlat2_.y = _e302.y;
    u_xlat2_.z = _e302.z;
    let _e309 = u_xlat2_;
    let _e310 = vs_COLOR0_1;
    SV_Target0_ = (_e309 * _e310);
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
