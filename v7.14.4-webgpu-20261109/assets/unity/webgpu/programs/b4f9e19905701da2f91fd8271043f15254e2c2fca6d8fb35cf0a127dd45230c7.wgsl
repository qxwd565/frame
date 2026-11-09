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
    var u_xlat3_: f32 = 0f;
    var u_xlat4_: vec2<f32> = vec2(0f);

    let _e39 = vs_TEXCOORD2_1;
    let _e44 = _f_buffer0_.f_cb0_[4];
    let _e49 = hscard_bias.values[2];
    let _e52 = textureSampleBias(f_t2_, samplerf_s2_, _e39.xy, (_e44.x + _e49.x));
    u_xlat0_ = _e52;
    let _e53 = u_xlat4_;
    let _e58 = _f_buffer1_.f_cb1_[4];
    let _e63 = _f_buffer0_.f_cb0_[15];
    let _e66 = vs_TEXCOORD1_1;
    let _e68 = ((_e58.xy * _e63.xx) + _e66.xy);
    u_xlat4_.x = _e68.x;
    u_xlat4_.y = _e68.y;
    let _e73 = u_xlat4_;
    let _e78 = _f_buffer0_.f_cb0_[4];
    let _e83 = hscard_bias.values[1];
    let _e86 = textureSampleBias(f_t1_, samplerf_s1_, _e73.xy, (_e78.x + _e83.x));
    u_xlat1_ = _e86;
    let _e88 = u_xlat1_;
    let _e93 = _f_buffer1_.f_cb1_[3];
    u_xlat4_.x = (_e88.w * _e93.x);
    let _e96 = u_xlat1_;
    u_xlat1_ = (_e96 + vec4<f32>(-1f, -1f, -1f, -1f));
    let _e108 = u_xlat0_;
    let _e110 = u_xlat4_;
    u_xlat0_.x = (_e108.x * _e110.x);
    let _e113 = u_xlat0_;
    let _e115 = u_xlat1_;
    u_xlat0_ = ((_e113.xxxx * _e115) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e123 = vs_TEXCOORD0_1;
    let _e128 = _f_buffer0_.f_cb0_[4];
    let _e133 = hscard_bias.values[0];
    let _e136 = textureSampleBias(f_t0_, samplerf_s0_, _e123.xy, (_e128.x + _e133.x));
    u_xlat1_ = _e136;
    let _e137 = u_xlat1_;
    u_xlat2_ = log2(_e137);
    let _e139 = u_xlat2_;
    let _e143 = _f_buffer1_.f_cb1_[1];
    u_xlat2_ = (_e139 * _e143.zzzz);
    let _e146 = u_xlat2_;
    u_xlat2_ = exp2(_e146);
    let _e148 = u_xlat1_;
    let _e150 = vs_TEXCOORD3_1;
    u_xlat3_ = (_e148.w * _e150);
    let _e152 = u_xlat3_;
    let _e154 = u_xlat2_;
    let _e156 = u_xlat1_;
    u_xlat1_ = ((vec4(_e152) * _e154) + _e156);
    let _e158 = u_xlat0_;
    let _e159 = u_xlat1_;
    SV_Target0_ = (_e158 * _e159);
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
