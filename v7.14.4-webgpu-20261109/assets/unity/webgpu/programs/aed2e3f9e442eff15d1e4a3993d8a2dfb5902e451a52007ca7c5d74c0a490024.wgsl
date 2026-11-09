struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 6>,
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
var<private> vs_TEXCOORD1_1: vec2<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);

    let _e25 = vs_TEXCOORD1_1;
    let _e30 = _f_buffer0_.f_cb0_[4];
    let _e35 = hscard_bias.values[1];
    let _e38 = textureSampleBias(f_t1_, samplerf_s1_, _e25.xy, (_e30.x + _e35.x));
    u_xlat0_ = _e38;
    let _e39 = u_xlat0_;
    let _e41 = u_xlat0_;
    let _e48 = (_e41.xy + vec2<f32>(-0.5f, -0.5f));
    u_xlat0_.x = _e48.x;
    u_xlat0_.y = _e48.y;
    let _e53 = u_xlat0_;
    let _e55 = u_xlat0_;
    let _e60 = _f_buffer1_.f_cb1_[3];
    let _e62 = (_e55.xy * _e60.xy);
    u_xlat0_.x = _e62.x;
    u_xlat0_.y = _e62.y;
    let _e67 = u_xlat0_;
    let _e69 = u_xlat0_;
    let _e74 = _f_buffer1_.f_cb1_[5];
    let _e77 = vs_TEXCOORD0_1;
    let _e79 = ((_e69.xy * _e74.yy) + _e77.xy);
    u_xlat0_.x = _e79.x;
    u_xlat0_.y = _e79.y;
    let _e84 = u_xlat0_;
    let _e89 = _f_buffer0_.f_cb0_[4];
    let _e94 = hscard_bias.values[0];
    let _e97 = textureSampleBias(f_t0_, samplerf_s0_, _e84.xy, (_e89.x + _e94.x));
    u_xlat0_ = _e97;
    let _e99 = u_xlat0_;
    let _e105 = _f_buffer1_.f_cb1_[4];
    u_xlat1_.x = (-(_e99.w) + _e105.w);
    let _e109 = u_xlat0_;
    let _e111 = u_xlat1_;
    u_xlat1_.w = (_e109.w * _e111.x);
    let _e114 = u_xlat1_;
    let _e116 = u_xlat0_;
    let _e121 = _f_buffer1_.f_cb1_[4];
    let _e123 = (_e116.xyz * _e121.xyz);
    u_xlat1_.x = _e123.x;
    u_xlat1_.y = _e123.y;
    u_xlat1_.z = _e123.z;
    let _e130 = u_xlat1_;
    let _e131 = vs_COLOR0_1;
    SV_Target0_ = (_e130 * _e131);
    let _e133 = SV_Target0_;
    SV_Target0_ = clamp(_e133, vec4(0f), vec4(1f));
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec2<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e32 = SV_Target0_;
    return FragmentOutput(_e32);
}
