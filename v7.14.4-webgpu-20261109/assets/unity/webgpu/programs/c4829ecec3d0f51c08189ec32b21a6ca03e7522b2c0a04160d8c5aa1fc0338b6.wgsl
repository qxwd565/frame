struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 4>,
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
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD5_1: vec2<f32>;
var<private> vs_TEXCOORD6_1: vec2<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: f32 = 0f;
    var u_xlat9_: f32 = 0f;

    let _e39 = vs_TEXCOORD0_1;
    let _e41 = dpdx(_e39.x);
    u_xlat0_.x = _e41;
    let _e42 = vs_TEXCOORD0_1;
    let _e44 = dpdy(_e42.x);
    u_xlat3_ = _e44;
    let _e46 = u_xlat3_;
    let _e48 = u_xlat0_;
    u_xlat0_.x = (abs(_e46) + abs(_e48.x));
    let _e52 = u_xlat0_;
    let _e62 = vs_TEXCOORD0_1;
    u_xlat0_ = ((_e52.xxxx * vec4<f32>(-0.5f, -0.5f, 0.5f, 0.5f)) + _e62.xyxy);
    let _e65 = u_xlat0_;
    let _e70 = _f_buffer0_.f_cb0_[4];
    let _e75 = hscard_bias.values[0];
    let _e78 = textureSampleBias(f_t0_, samplerf_s0_, _e65.xy, (_e70.x + _e75.x));
    u_xlat1_ = _e78;
    let _e79 = u_xlat0_;
    let _e84 = _f_buffer0_.f_cb0_[4];
    let _e89 = hscard_bias.values[0];
    let _e92 = textureSampleBias(f_t0_, samplerf_s0_, _e79.zw, (_e84.x + _e89.x));
    u_xlat0_ = _e92;
    let _e93 = vs_TEXCOORD0_1;
    let _e98 = _f_buffer0_.f_cb0_[4];
    let _e103 = hscard_bias.values[0];
    let _e106 = textureSampleBias(f_t0_, samplerf_s0_, _e93.xy, (_e98.x + _e103.x));
    u_xlat2_ = _e106;
    let _e107 = u_xlat1_;
    let _e108 = u_xlat2_;
    u_xlat1_ = (_e107 + _e108);
    let _e110 = u_xlat0_;
    let _e111 = u_xlat1_;
    u_xlat0_ = (_e110 + _e111);
    let _e113 = vs_TEXCOORD5_1;
    let _e118 = _f_buffer0_.f_cb0_[4];
    let _e123 = hscard_bias.values[1];
    let _e126 = textureSampleBias(f_t1_, samplerf_s1_, _e113.xy, (_e118.x + _e123.x));
    u_xlat1_ = _e126;
    let _e127 = u_xlat0_;
    let _e129 = u_xlat0_;
    let _e136 = u_xlat1_;
    let _e139 = ((_e129.xyz * vec3<f32>(0.33333334f, 0.33333334f, 0.33333334f)) + -(_e136.xyz));
    u_xlat0_.x = _e139.x;
    u_xlat0_.y = _e139.y;
    u_xlat0_.z = _e139.z;
    let _e146 = u_xlat0_;
    u_xlat9_ = (_e146.w * 0.33333334f);
    let _e150 = u_xlat0_;
    let _e152 = u_xlat9_;
    let _e154 = u_xlat0_;
    let _e157 = u_xlat1_;
    let _e159 = ((vec3(_e152) * _e154.xyz) + _e157.xyz);
    u_xlat0_.x = _e159.x;
    u_xlat0_.y = _e159.y;
    u_xlat0_.z = _e159.z;
    let _e167 = u_xlat9_;
    SV_Target0_.w = _e167;
    let _e168 = vs_TEXCOORD6_1;
    let _e173 = _f_buffer0_.f_cb0_[4];
    let _e178 = hscard_bias.values[2];
    let _e181 = textureSampleBias(f_t2_, samplerf_s2_, _e168.xy, (_e173.x + _e178.x));
    u_xlat1_ = _e181;
    let _e182 = u_xlat1_;
    u_xlat9_ = (_e182.x + -1f);
    let _e190 = _f_buffer1_.f_cb1_[3];
    let _e192 = u_xlat9_;
    u_xlat9_ = ((_e190.x * _e192) + 1f);
    let _e196 = u_xlat0_;
    let _e198 = u_xlat9_;
    let _e200 = u_xlat0_;
    let _e202 = (vec3(_e198) * _e200.xyz);
    u_xlat0_.x = _e202.x;
    u_xlat0_.y = _e202.y;
    u_xlat0_.z = _e202.z;
    let _e209 = SV_Target0_;
    let _e211 = u_xlat0_;
    let _e213 = vs_COLOR0_1;
    let _e215 = (_e211.xyz * _e213.xyz);
    SV_Target0_.x = _e215.x;
    SV_Target0_.y = _e215.y;
    SV_Target0_.z = _e215.z;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(5) vs_TEXCOORD5_: vec2<f32>, @location(6) vs_TEXCOORD6_: vec2<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD5_1 = vs_TEXCOORD5_;
    vs_TEXCOORD6_1 = vs_TEXCOORD6_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e40 = SV_Target0_;
    return FragmentOutput(_e40);
}
