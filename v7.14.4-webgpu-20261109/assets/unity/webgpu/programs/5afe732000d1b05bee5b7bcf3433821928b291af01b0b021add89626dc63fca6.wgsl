struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 16>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 5>,
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
var<private> vs_TEXCOORD1_1: vec2<f32>;
var<private> vs_TEXCOORD2_1: vec2<f32>;
var<private> vs_TEXCOORD3_1: f32;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);

    let _e32 = vs_TEXCOORD0_1;
    let _e37 = _f_buffer0_.f_cb0_[4];
    let _e42 = hscard_bias.values[0];
    let _e45 = textureSampleBias(f_t0_, samplerf_s0_, _e32.xy, (_e37.x + _e42.x));
    u_xlat0_ = _e45;
    let _e46 = u_xlat0_;
    u_xlat1_ = log2(_e46);
    let _e48 = u_xlat1_;
    let _e52 = _f_buffer1_.f_cb1_[1];
    u_xlat1_ = (_e48 * _e52.zzzz);
    let _e55 = u_xlat1_;
    u_xlat1_ = exp2(_e55);
    let _e58 = u_xlat0_;
    let _e60 = vs_TEXCOORD3_1;
    u_xlat2_.x = (_e58.w * _e60);
    let _e62 = u_xlat2_;
    let _e64 = u_xlat1_;
    let _e66 = u_xlat0_;
    u_xlat0_ = ((_e62.xxxx * _e64) + _e66);
    let _e68 = u_xlat1_;
    let _e73 = _f_buffer1_.f_cb1_[4];
    let _e78 = _f_buffer0_.f_cb0_[15];
    let _e81 = vs_TEXCOORD1_1;
    let _e83 = ((_e73.xy * _e78.xx) + _e81.xy);
    u_xlat1_.x = _e83.x;
    u_xlat1_.y = _e83.y;
    let _e88 = u_xlat1_;
    let _e93 = _f_buffer0_.f_cb0_[4];
    let _e98 = hscard_bias.values[1];
    let _e101 = textureSampleBias(f_t1_, samplerf_s1_, _e88.xy, (_e93.x + _e98.x));
    u_xlat1_ = _e101;
    let _e102 = u_xlat1_;
    let _e106 = _f_buffer1_.f_cb1_[3];
    u_xlat2_ = (_e102 * _e106.xxxx);
    let _e109 = u_xlat1_;
    let _e111 = u_xlat2_;
    u_xlat1_ = (_e109.wwww * _e111);
    let _e113 = vs_TEXCOORD2_1;
    let _e118 = _f_buffer0_.f_cb0_[4];
    let _e123 = hscard_bias.values[2];
    let _e126 = textureSampleBias(f_t2_, samplerf_s2_, _e113.xy, (_e118.x + _e123.x));
    u_xlat2_ = _e126;
    let _e127 = u_xlat1_;
    let _e128 = u_xlat2_;
    let _e131 = u_xlat0_;
    SV_Target0_ = ((_e127 * _e128.xxxx) + _e131);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec2<f32>, @location(2) vs_TEXCOORD2_: vec2<f32>, @location(3) vs_TEXCOORD3_: f32) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_TEXCOORD2_1 = vs_TEXCOORD2_;
    vs_TEXCOORD3_1 = vs_TEXCOORD3_;
    main_1();
    let _e40 = SV_Target0_;
    return FragmentOutput(_e40);
}
