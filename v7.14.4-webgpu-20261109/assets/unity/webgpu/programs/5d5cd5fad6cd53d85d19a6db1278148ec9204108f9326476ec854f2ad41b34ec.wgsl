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
var<private> vs_COLOR0_1: vec4<f32>;
var<private> vs_TEXCOORD1_1: f32;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: f32 = 0f;
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
    u_xlat1_ = _e98;
    let _e100 = u_xlat1_;
    u_xlat1_.w = dot(_e100.xyz, vec3<f32>(0.299f, 0.587f, 0.114f));
    let _e107 = u_xlat0_;
    let _e112 = _f_buffer0_.f_cb0_[4];
    let _e117 = hscard_bias.values[1];
    let _e120 = textureSampleBias(f_t1_, samplerf_s1_, _e107.xy, (_e112.x + _e117.x));
    u_xlat0_ = _e120;
    let _e122 = u_xlat0_;
    u_xlat0_.x = (_e122.x + -1f);
    let _e131 = _f_buffer1_.f_cb1_[7];
    let _e133 = u_xlat0_;
    u_xlat0_.x = ((_e131.w * _e133.x) + 1f);
    let _e138 = vs_TEXCOORD1_1;
    let _e142 = _f_buffer1_.f_cb1_[12];
    u_xlat3_ = (_e138 + _e142.z);
    let _e145 = u_xlat3_;
    u_xlat3_ = clamp(_e145, 0f, 1f);
    let _e150 = vs_TEXCOORD1_1;
    let _e154 = _f_buffer1_.f_cb1_[12];
    u_xlat6_.x = (_e150 + -(_e154.z));
    let _e159 = u_xlat6_;
    u_xlat6_.x = clamp(_e159.x, 0f, 1f);
    let _e165 = u_xlat6_;
    u_xlat6_.x = (_e165.x + -0.00001f);
    let _e170 = u_xlat6_;
    let _e173 = u_xlat3_;
    u_xlat3_ = (-(_e170.x) + _e173);
    let _e176 = u_xlat6_;
    let _e179 = u_xlat1_;
    u_xlat6_.x = (-(_e176.x) + _e179.w);
    let _e184 = u_xlat3_;
    u_xlat3_ = (1f / _e184);
    let _e186 = u_xlat3_;
    let _e187 = u_xlat6_;
    u_xlat3_ = (_e186 * _e187.x);
    let _e190 = u_xlat3_;
    u_xlat3_ = clamp(_e190, 0f, 1f);
    let _e195 = u_xlat3_;
    u_xlat6_.x = ((_e195 * -2f) + 3f);
    let _e201 = u_xlat3_;
    let _e202 = u_xlat3_;
    u_xlat3_ = (_e201 * _e202);
    let _e204 = u_xlat3_;
    let _e205 = u_xlat6_;
    u_xlat3_ = (_e204 * _e205.x);
    let _e209 = u_xlat0_;
    let _e211 = u_xlat3_;
    u_xlat0_.x = (_e209.x * _e211);
    let _e213 = u_xlat1_;
    let _e218 = _f_buffer1_.f_cb1_[2];
    u_xlat3_ = (_e213.w + _e218.y);
    let _e222 = u_xlat1_;
    let _e227 = _f_buffer1_.f_cb1_[3];
    u_xlat6_.x = max(_e222.w, _e227.y);
    let _e231 = u_xlat6_;
    let _e233 = u_xlat3_;
    u_xlat2_.x = (_e231.x * _e233);
    let _e239 = _f_buffer1_.f_cb1_[11];
    u_xlat2_.y = ((_e239.x * 0.03125f) + 0.015625f);
    let _e245 = u_xlat2_;
    let _e250 = _f_buffer0_.f_cb0_[4];
    let _e255 = hscard_bias.values[2];
    let _e258 = textureSampleBias(f_t2_, samplerf_s2_, _e245.xy, (_e250.x + _e255.x));
    u_xlat2_ = _e258;
    let _e259 = u_xlat1_;
    let _e261 = u_xlat2_;
    let _e266 = _f_buffer1_.f_cb1_[2];
    let _e268 = (_e261.xyz * _e266.xxx);
    u_xlat1_.x = _e268.x;
    u_xlat1_.y = _e268.y;
    u_xlat1_.z = _e268.z;
    let _e275 = u_xlat0_;
    let _e277 = u_xlat1_;
    u_xlat0_ = (_e275.xxxx * _e277);
    let _e279 = u_xlat0_;
    let _e280 = vs_COLOR0_1;
    SV_Target0_ = (_e279 * _e280);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(10) vs_COLOR0_: vec4<f32>, @location(1) vs_TEXCOORD1_: f32) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_COLOR0_1 = vs_COLOR0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    main_1();
    let _e36 = SV_Target0_;
    return FragmentOutput(_e36);
}
