struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 5>,
}

struct FragmentOutput {
    @location(0) SV_TARGET0_: vec4<f32>,
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
var<private> vs_TEXCOORD2_1: vec4<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_TARGET0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec2<f32> = vec2(0f);

    let _e35 = vs_TEXCOORD0_1;
    let _e40 = _f_buffer0_.f_cb0_[4];
    let _e45 = hscard_bias.values[2];
    let _e48 = textureSampleBias(f_t2_, samplerf_s2_, _e35.xy, (_e40.x + _e45.x));
    u_xlat0_ = _e48;
    let _e50 = u_xlat0_;
    u_xlat3_.x = ((_e50.y * 2f) + -1f);
    let _e58 = u_xlat0_;
    let _e63 = _f_buffer1_.f_cb1_[3];
    u_xlat0_.x = (_e58.x * _e63.x);
    let _e67 = u_xlat3_;
    u_xlat3_.x = (_e67.x * 0.01f);
    let _e71 = u_xlat3_;
    let _e73 = u_xlat3_;
    let _e78 = _f_buffer1_.f_cb1_[3];
    let _e81 = vs_TEXCOORD2_1;
    let _e83 = ((_e73.xx * _e78.yz) + _e81.xy);
    u_xlat3_.x = _e83.x;
    u_xlat3_.y = _e83.y;
    let _e88 = u_xlat3_;
    let _e93 = _f_buffer0_.f_cb0_[4];
    let _e98 = hscard_bias.values[0];
    let _e101 = textureSampleBias(f_t0_, samplerf_s0_, _e88.xy, (_e93.x + _e98.x));
    u_xlat1_ = _e101;
    let _e102 = vs_TEXCOORD0_1;
    let _e107 = _f_buffer0_.f_cb0_[4];
    let _e112 = hscard_bias.values[1];
    let _e115 = textureSampleBias(f_t1_, samplerf_s1_, _e102.xy, (_e107.x + _e112.x));
    u_xlat2_ = _e115;
    let _e116 = u_xlat1_;
    let _e117 = u_xlat2_;
    u_xlat1_ = (_e116 + -(_e117));
    let _e120 = u_xlat0_;
    let _e122 = u_xlat1_;
    let _e124 = u_xlat2_;
    u_xlat1_ = ((_e120.xxxx * _e122) + _e124);
    let _e126 = vs_TEXCOORD2_1;
    let _e131 = _f_buffer0_.f_cb0_[4];
    let _e136 = hscard_bias.values[2];
    let _e139 = textureSampleBias(f_t2_, samplerf_s2_, _e126.zw, (_e131.x + _e136.x));
    u_xlat2_ = _e139;
    let _e140 = u_xlat2_;
    let _e145 = _f_buffer1_.f_cb1_[4];
    u_xlat2_ = (_e140.zzzz * _e145);
    let _e147 = u_xlat2_;
    let _e148 = u_xlat0_;
    let _e151 = u_xlat1_;
    u_xlat0_ = ((_e147 * _e148.xxxx) + _e151);
    let _e153 = u_xlat0_;
    let _e154 = vs_COLOR0_1;
    SV_TARGET0_ = (_e153 * _e154);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(2) vs_TEXCOORD2_: vec4<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD2_1 = vs_TEXCOORD2_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e36 = SV_TARGET0_;
    return FragmentOutput(_e36);
}
