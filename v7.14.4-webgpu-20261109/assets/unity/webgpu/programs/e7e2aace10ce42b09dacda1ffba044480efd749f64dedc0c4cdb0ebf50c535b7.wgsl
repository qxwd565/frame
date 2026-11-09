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
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD6_1: vec2<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: f32 = 0f;

    let _e33 = vs_TEXCOORD0_1;
    let _e35 = dpdx(_e33.x);
    u_xlat0_.x = _e35;
    let _e36 = vs_TEXCOORD0_1;
    let _e38 = dpdy(_e36.x);
    u_xlat3_ = _e38;
    let _e40 = u_xlat3_;
    let _e42 = u_xlat0_;
    u_xlat0_.x = (abs(_e40) + abs(_e42.x));
    let _e46 = u_xlat0_;
    let _e56 = vs_TEXCOORD0_1;
    u_xlat0_ = ((_e46.xxxx * vec4<f32>(-0.5f, -0.5f, 0.5f, 0.5f)) + _e56.xyxy);
    let _e59 = u_xlat0_;
    let _e64 = _f_buffer0_.f_cb0_[4];
    let _e69 = hscard_bias.values[0];
    let _e72 = textureSampleBias(f_t0_, samplerf_s0_, _e59.xy, (_e64.x + _e69.x));
    u_xlat1_ = _e72;
    let _e73 = u_xlat0_;
    let _e78 = _f_buffer0_.f_cb0_[4];
    let _e83 = hscard_bias.values[0];
    let _e86 = textureSampleBias(f_t0_, samplerf_s0_, _e73.zw, (_e78.x + _e83.x));
    u_xlat0_ = _e86;
    let _e87 = vs_TEXCOORD0_1;
    let _e92 = _f_buffer0_.f_cb0_[4];
    let _e97 = hscard_bias.values[0];
    let _e100 = textureSampleBias(f_t0_, samplerf_s0_, _e87.xy, (_e92.x + _e97.x));
    u_xlat2_ = _e100;
    let _e101 = u_xlat1_;
    let _e102 = u_xlat2_;
    u_xlat1_ = (_e101 + _e102);
    let _e104 = u_xlat0_;
    let _e105 = u_xlat1_;
    u_xlat0_ = (_e104 + _e105);
    let _e107 = u_xlat0_;
    u_xlat0_ = (_e107 * vec4<f32>(0.33333334f, 0.33333334f, 0.33333334f, 0.33333334f));
    let _e114 = vs_TEXCOORD6_1;
    let _e119 = _f_buffer0_.f_cb0_[4];
    let _e124 = hscard_bias.values[1];
    let _e127 = textureSampleBias(f_t1_, samplerf_s1_, _e114.xy, (_e119.x + _e124.x));
    u_xlat1_ = _e127;
    let _e129 = u_xlat1_;
    u_xlat1_.x = (_e129.x + -1f);
    let _e138 = _f_buffer1_.f_cb1_[3];
    let _e140 = u_xlat1_;
    u_xlat1_.x = ((_e138.x * _e140.x) + 1f);
    let _e145 = u_xlat0_;
    let _e147 = u_xlat0_;
    let _e149 = u_xlat1_;
    let _e151 = (_e147.xyz * _e149.xxx);
    u_xlat0_.x = _e151.x;
    u_xlat0_.y = _e151.y;
    u_xlat0_.z = _e151.z;
    let _e159 = u_xlat0_;
    SV_Target0_.w = _e159.w;
    let _e161 = SV_Target0_;
    let _e163 = u_xlat0_;
    let _e165 = vs_COLOR0_1;
    let _e167 = (_e163.xyz * _e165.xyz);
    SV_Target0_.x = _e167.x;
    SV_Target0_.y = _e167.y;
    SV_Target0_.z = _e167.z;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(6) vs_TEXCOORD6_: vec2<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD6_1 = vs_TEXCOORD6_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e32 = SV_Target0_;
    return FragmentOutput(_e32);
}
