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
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat6_: vec2<f32> = vec2(0f);

    let _e38 = vs_TEXCOORD0_1;
    u_xlat0_ = _e38.zwxy;
    let _e40 = u_xlat0_;
    u_xlat0_ = clamp(_e40, vec4(0f), vec4(1f));
    let _e46 = u_xlat0_;
    let _e47 = vs_TEXCOORD0_1;
    u_xlat0_ = (_e46 + -(_e47.zwxy));
    let _e51 = u_xlat0_;
    let _e56 = _f_buffer1_.f_cb1_[6];
    let _e58 = u_xlat0_;
    let _e61 = vs_TEXCOORD0_1;
    let _e63 = ((_e56.xx * _e58.xy) + _e61.zw);
    u_xlat0_.x = _e63.x;
    u_xlat0_.y = _e63.y;
    let _e68 = u_xlat6_;
    let _e73 = _f_buffer1_.f_cb1_[3];
    let _e75 = u_xlat0_;
    let _e78 = vs_TEXCOORD0_1;
    let _e80 = ((_e73.zz * _e75.zw) + _e78.xy);
    u_xlat6_.x = _e80.x;
    u_xlat6_.y = _e80.y;
    let _e85 = u_xlat6_;
    let _e90 = _f_buffer0_.f_cb0_[4];
    let _e95 = hscard_bias.values[0];
    let _e98 = textureSampleBias(f_t0_, samplerf_s0_, _e85.xy, (_e90.x + _e95.x));
    u_xlat1_ = _e98.yzwx;
    let _e100 = u_xlat0_;
    let _e105 = _f_buffer0_.f_cb0_[4];
    let _e110 = hscard_bias.values[1];
    let _e113 = textureSampleBias(f_t1_, samplerf_s1_, _e100.xy, (_e105.x + _e110.x));
    u_xlat0_ = _e113;
    let _e115 = u_xlat0_;
    u_xlat0_.x = dot(_e115.xyz, vec3<f32>(0.299f, 0.587f, 0.114f));
    let _e123 = vs_TEXCOORD1_1;
    let _e127 = _f_buffer1_.f_cb1_[12];
    u_xlat3_.x = (_e123 + _e127.y);
    let _e131 = u_xlat3_;
    u_xlat3_.x = ((_e131.x * 2f) + -1f);
    let _e139 = u_xlat3_;
    let _e142 = u_xlat0_;
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
    let _e173 = u_xlat3_;
    let _e175 = u_xlat1_;
    let _e180 = _f_buffer1_.f_cb1_[2];
    let _e182 = (_e175.wxy + _e180.yyy);
    u_xlat3_.x = _e182.x;
    u_xlat3_.y = _e182.y;
    u_xlat3_.z = _e182.z;
    let _e190 = u_xlat1_;
    let _e195 = _f_buffer1_.f_cb1_[3];
    u_xlat2_.x = max(_e190.w, _e195.y);
    let _e198 = u_xlat3_;
    let _e200 = u_xlat3_;
    let _e202 = u_xlat2_;
    let _e204 = (_e200.xyz * _e202.xxx);
    u_xlat3_.x = _e204.x;
    u_xlat3_.y = _e204.y;
    u_xlat3_.z = _e204.z;
    let _e211 = u_xlat1_;
    let _e213 = u_xlat3_;
    let _e218 = _f_buffer1_.f_cb1_[2];
    let _e220 = (_e213.xyz * _e218.xxx);
    u_xlat1_.x = _e220.x;
    u_xlat1_.y = _e220.y;
    u_xlat1_.z = _e220.z;
    let _e227 = u_xlat0_;
    let _e229 = u_xlat1_;
    u_xlat2_ = (_e227.xxxx * _e229);
    let _e232 = u_xlat0_;
    u_xlat0_.x = (-(_e232.x) + 1f);
    let _e238 = u_xlat0_;
    u_xlat0_.x = log2(_e238.x);
    let _e242 = u_xlat0_;
    u_xlat0_.x = (_e242.x * 10f);
    let _e247 = u_xlat0_;
    u_xlat0_.x = exp2(_e247.x);
    let _e251 = u_xlat2_;
    u_xlat3_.x = (_e251.w * 1000000f);
    let _e256 = u_xlat3_;
    u_xlat3_.x = clamp(_e256.x, 0f, 1f);
    let _e262 = u_xlat1_;
    let _e264 = u_xlat3_;
    u_xlat3_.x = (_e262.w * _e264.x);
    let _e268 = u_xlat3_;
    let _e270 = u_xlat0_;
    u_xlat0_.x = (_e268.x * _e270.x);
    let _e273 = u_xlat3_;
    let _e278 = _f_buffer1_.f_cb1_[7];
    let _e283 = _f_buffer1_.f_cb1_[8];
    let _e285 = (_e278.xyz * _e283.xxx);
    u_xlat3_.x = _e285.x;
    u_xlat3_.y = _e285.y;
    u_xlat3_.z = _e285.z;
    let _e292 = u_xlat0_;
    let _e294 = u_xlat0_;
    let _e296 = u_xlat3_;
    let _e298 = (_e294.xxx * _e296.xyz);
    u_xlat0_.x = _e298.x;
    u_xlat0_.y = _e298.y;
    u_xlat0_.z = _e298.z;
    let _e305 = u_xlat2_;
    let _e307 = u_xlat0_;
    let _e309 = vs_COLOR1_1;
    let _e312 = u_xlat2_;
    let _e314 = ((_e307.xyz * _e309.www) + _e312.xyz);
    u_xlat2_.x = _e314.x;
    u_xlat2_.y = _e314.y;
    u_xlat2_.z = _e314.z;
    let _e321 = u_xlat2_;
    let _e322 = vs_COLOR0_1;
    SV_Target0_ = (_e321 * _e322);
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
