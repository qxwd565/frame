struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 12>,
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
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat6_: vec2<f32> = vec2(0f);
    var u_xlat10_: f32 = 0f;

    let _e38 = vs_TEXCOORD0_1;
    u_xlat0_ = _e38.zwxy;
    let _e40 = u_xlat0_;
    u_xlat0_ = clamp(_e40, vec4(0f), vec4(1f));
    let _e46 = u_xlat0_;
    let _e47 = vs_TEXCOORD0_1;
    u_xlat0_ = (_e46 + -(_e47.zwxy));
    let _e51 = u_xlat6_;
    let _e56 = _f_buffer1_.f_cb1_[3];
    let _e58 = u_xlat0_;
    let _e61 = vs_TEXCOORD0_1;
    let _e63 = ((_e56.zz * _e58.zw) + _e61.xy);
    u_xlat6_.x = _e63.x;
    u_xlat6_.y = _e63.y;
    let _e68 = u_xlat0_;
    let _e73 = _f_buffer1_.f_cb1_[6];
    let _e75 = u_xlat0_;
    let _e78 = vs_TEXCOORD0_1;
    let _e80 = ((_e73.xx * _e75.xy) + _e78.zw);
    u_xlat0_.x = _e80.x;
    u_xlat0_.y = _e80.y;
    let _e85 = u_xlat0_;
    let _e90 = _f_buffer0_.f_cb0_[4];
    let _e95 = hscard_bias.values[1];
    let _e98 = textureSampleBias(f_t1_, samplerf_s1_, _e85.xy, (_e90.x + _e95.x));
    u_xlat1_ = _e98;
    let _e99 = u_xlat6_;
    let _e104 = _f_buffer0_.f_cb0_[4];
    let _e109 = hscard_bias.values[0];
    let _e112 = textureSampleBias(f_t0_, samplerf_s0_, _e99.xy, (_e104.x + _e109.x));
    u_xlat0_ = _e112.yzwx;
    let _e114 = u_xlat0_;
    let _e119 = _f_buffer1_.f_cb1_[2];
    u_xlat10_ = (_e114.w + _e119.y);
    let _e123 = u_xlat0_;
    let _e128 = _f_buffer1_.f_cb1_[3];
    u_xlat2_.x = max(_e123.w, _e128.y);
    let _e132 = u_xlat10_;
    let _e133 = u_xlat2_;
    u_xlat2_.x = (_e132 * _e133.x);
    let _e140 = _f_buffer1_.f_cb1_[11];
    u_xlat2_.y = ((_e140.x * 0.03125f) + 0.015625f);
    let _e146 = u_xlat2_;
    let _e151 = _f_buffer0_.f_cb0_[4];
    let _e156 = hscard_bias.values[2];
    let _e159 = textureSampleBias(f_t2_, samplerf_s2_, _e146.xy, (_e151.x + _e156.x));
    u_xlat2_ = _e159;
    let _e160 = u_xlat0_;
    let _e162 = u_xlat2_;
    let _e167 = _f_buffer1_.f_cb1_[2];
    let _e169 = (_e162.xyz * _e167.xxx);
    u_xlat0_.x = _e169.x;
    u_xlat0_.y = _e169.y;
    u_xlat0_.z = _e169.z;
    let _e176 = u_xlat1_;
    let _e178 = vs_COLOR1_1;
    let _e180 = u_xlat0_;
    u_xlat0_ = ((_e176.xyzx * _e178) + _e180);
    let _e182 = u_xlat0_;
    let _e183 = vs_COLOR0_1;
    SV_Target0_ = (_e182 * _e183);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(11) vs_COLOR1_: vec4<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_COLOR1_1 = vs_COLOR1_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e36 = SV_Target0_;
    return FragmentOutput(_e36);
}
