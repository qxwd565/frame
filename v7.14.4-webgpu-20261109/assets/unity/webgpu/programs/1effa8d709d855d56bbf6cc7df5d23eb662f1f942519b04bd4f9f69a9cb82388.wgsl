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
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);

    let _e33 = vs_TEXCOORD0_1;
    let _e38 = _f_buffer0_.f_cb0_[4];
    let _e43 = hscard_bias.values[0];
    let _e46 = textureSampleBias(f_t0_, samplerf_s0_, _e33.xy, (_e38.x + _e43.x));
    u_xlat0_ = _e46;
    let _e47 = u_xlat0_;
    let _e48 = vs_COLOR0_1;
    u_xlat0_ = (_e47 * _e48);
    let _e50 = u_xlat0_;
    u_xlat1_ = log2(_e50);
    let _e52 = u_xlat1_;
    let _e56 = _f_buffer1_.f_cb1_[1];
    u_xlat1_ = (_e52 * _e56.zzzz);
    let _e59 = u_xlat1_;
    u_xlat1_ = exp2(_e59);
    let _e62 = u_xlat0_;
    let _e64 = vs_TEXCOORD3_1;
    u_xlat2_.x = (_e62.w * _e64);
    let _e66 = u_xlat2_;
    let _e68 = u_xlat1_;
    let _e70 = u_xlat0_;
    u_xlat0_ = ((_e66.xxxx * _e68) + _e70);
    let _e72 = u_xlat1_;
    let _e77 = _f_buffer1_.f_cb1_[4];
    let _e82 = _f_buffer0_.f_cb0_[15];
    let _e85 = vs_TEXCOORD1_1;
    let _e87 = ((_e77.xy * _e82.xx) + _e85.xy);
    u_xlat1_.x = _e87.x;
    u_xlat1_.y = _e87.y;
    let _e92 = u_xlat1_;
    let _e97 = _f_buffer0_.f_cb0_[4];
    let _e102 = hscard_bias.values[1];
    let _e105 = textureSampleBias(f_t1_, samplerf_s1_, _e92.xy, (_e97.x + _e102.x));
    u_xlat1_ = _e105;
    let _e106 = u_xlat1_;
    let _e110 = _f_buffer1_.f_cb1_[3];
    u_xlat2_ = (_e106 * _e110.xxxx);
    let _e113 = u_xlat1_;
    let _e115 = u_xlat2_;
    u_xlat1_ = (_e113.wwww * _e115);
    let _e117 = vs_TEXCOORD2_1;
    let _e122 = _f_buffer0_.f_cb0_[4];
    let _e127 = hscard_bias.values[2];
    let _e130 = textureSampleBias(f_t2_, samplerf_s2_, _e117.xy, (_e122.x + _e127.x));
    u_xlat2_ = _e130;
    let _e131 = u_xlat1_;
    let _e132 = u_xlat2_;
    let _e135 = u_xlat0_;
    SV_Target0_ = ((_e131 * _e132.xxxx) + _e135);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec2<f32>, @location(2) vs_TEXCOORD2_: vec2<f32>, @location(3) vs_TEXCOORD3_: f32, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_TEXCOORD2_1 = vs_TEXCOORD2_;
    vs_TEXCOORD3_1 = vs_TEXCOORD3_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e44 = SV_Target0_;
    return FragmentOutput(_e44);
}
