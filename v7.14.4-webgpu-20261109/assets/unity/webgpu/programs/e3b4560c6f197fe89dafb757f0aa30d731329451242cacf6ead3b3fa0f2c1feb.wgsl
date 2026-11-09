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
    u_xlat1_ = _e115;
    let _e117 = u_xlat1_;
    u_xlat1_.w = dot(_e117.xyz, vec3<f32>(0.299f, 0.587f, 0.114f));
    let _e124 = u_xlat3_;
    let _e129 = _f_buffer0_.f_cb0_[4];
    let _e134 = hscard_bias.values[1];
    let _e137 = textureSampleBias(f_t1_, samplerf_s1_, _e124.xy, (_e129.x + _e134.x));
    u_xlat2_ = _e137;
    let _e139 = u_xlat0_;
    let _e142 = u_xlat2_;
    u_xlat0_.x = (-(_e139.x) + _e142.x);
    let _e146 = u_xlat0_;
    u_xlat0_.x = clamp(_e146.x, 0f, 1f);
    let _e152 = u_xlat0_;
    u_xlat0_.x = log2(_e152.x);
    let _e159 = _f_buffer1_.f_cb1_[12];
    u_xlat3_.x = (_e159.z * 10f);
    let _e164 = u_xlat0_;
    let _e166 = u_xlat3_;
    u_xlat0_.x = (_e164.x * _e166.x);
    let _e170 = u_xlat0_;
    u_xlat0_.x = exp2(_e170.x);
    let _e174 = u_xlat1_;
    let _e179 = _f_buffer1_.f_cb1_[2];
    u_xlat3_.x = (_e174.w + _e179.y);
    let _e182 = u_xlat1_;
    let _e187 = _f_buffer1_.f_cb1_[3];
    u_xlat6_ = max(_e182.w, _e187.y);
    let _e191 = u_xlat6_;
    let _e192 = u_xlat3_;
    u_xlat2_.x = (_e191 * _e192.x);
    let _e199 = _f_buffer1_.f_cb1_[11];
    u_xlat2_.y = ((_e199.x * 0.03125f) + 0.015625f);
    let _e205 = u_xlat2_;
    let _e210 = _f_buffer0_.f_cb0_[4];
    let _e215 = hscard_bias.values[2];
    let _e218 = textureSampleBias(f_t2_, samplerf_s2_, _e205.xy, (_e210.x + _e215.x));
    u_xlat2_ = _e218;
    let _e219 = u_xlat1_;
    let _e221 = u_xlat2_;
    let _e226 = _f_buffer1_.f_cb1_[2];
    let _e228 = (_e221.xyz * _e226.xxx);
    u_xlat1_.x = _e228.x;
    u_xlat1_.y = _e228.y;
    u_xlat1_.z = _e228.z;
    let _e235 = u_xlat0_;
    let _e237 = u_xlat1_;
    u_xlat2_ = (_e235.xxxx * _e237);
    let _e240 = u_xlat0_;
    u_xlat0_.x = (-(_e240.x) + 1f);
    let _e246 = u_xlat0_;
    u_xlat0_.x = log2(_e246.x);
    let _e250 = u_xlat0_;
    u_xlat0_.x = (_e250.x * 10f);
    let _e255 = u_xlat0_;
    u_xlat0_.x = exp2(_e255.x);
    let _e259 = u_xlat2_;
    u_xlat3_.x = (_e259.w * 1000000f);
    let _e264 = u_xlat3_;
    u_xlat3_.x = clamp(_e264.x, 0f, 1f);
    let _e270 = u_xlat1_;
    let _e272 = u_xlat3_;
    u_xlat3_.x = (_e270.w * _e272.x);
    let _e276 = u_xlat3_;
    let _e278 = u_xlat0_;
    u_xlat0_.x = (_e276.x * _e278.x);
    let _e281 = u_xlat3_;
    let _e286 = _f_buffer1_.f_cb1_[7];
    let _e291 = _f_buffer1_.f_cb1_[8];
    let _e293 = (_e286.xyz * _e291.xxx);
    u_xlat3_.x = _e293.x;
    u_xlat3_.y = _e293.y;
    u_xlat3_.z = _e293.z;
    let _e300 = u_xlat0_;
    let _e302 = u_xlat0_;
    let _e304 = u_xlat3_;
    let _e306 = (_e302.xxx * _e304.xyz);
    u_xlat0_.x = _e306.x;
    u_xlat0_.y = _e306.y;
    u_xlat0_.z = _e306.z;
    let _e313 = u_xlat2_;
    let _e315 = u_xlat0_;
    let _e317 = vs_COLOR1_1;
    let _e320 = u_xlat2_;
    let _e322 = ((_e315.xyz * _e317.www) + _e320.xyz);
    u_xlat2_.x = _e322.x;
    u_xlat2_.y = _e322.y;
    u_xlat2_.z = _e322.z;
    let _e329 = u_xlat2_;
    let _e330 = vs_COLOR0_1;
    SV_Target0_ = (_e329 * _e330);
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
