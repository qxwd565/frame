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
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec4<f32>;
var<private> vs_TEXCOORD1_1: vec4<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_TARGET0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: f32 = 0f;

    let _e28 = vs_TEXCOORD1_1;
    let _e33 = _f_buffer0_.f_cb0_[4];
    let _e38 = hscard_bias.values[1];
    let _e41 = textureSampleBias(f_t1_, samplerf_s1_, _e28.zw, (_e33.x + _e38.x));
    u_xlat0_ = _e41;
    let _e43 = u_xlat0_;
    let _e48 = _f_buffer1_.f_cb1_[3];
    u_xlat0_.x = (_e43.z * _e48.z);
    let _e51 = vs_TEXCOORD0_1;
    let _e56 = _f_buffer0_.f_cb0_[4];
    let _e61 = hscard_bias.values[1];
    let _e64 = textureSampleBias(f_t1_, samplerf_s1_, _e51.xy, (_e56.x + _e61.x));
    u_xlat1_ = _e64;
    let _e66 = u_xlat0_;
    let _e68 = u_xlat1_;
    u_xlat0_.x = (_e66.x * _e68.y);
    let _e71 = vs_TEXCOORD0_1;
    let _e76 = _f_buffer0_.f_cb0_[4];
    let _e81 = hscard_bias.values[1];
    let _e84 = textureSampleBias(f_t1_, samplerf_s1_, _e71.zw, (_e76.x + _e81.x));
    u_xlat1_ = _e84;
    let _e85 = u_xlat1_;
    let _e90 = _f_buffer1_.f_cb1_[3];
    u_xlat2_ = (_e85.x * _e90.y);
    let _e94 = u_xlat0_;
    let _e96 = u_xlat2_;
    u_xlat0_.w = (_e94.x * _e96);
    let _e98 = vs_TEXCOORD1_1;
    let _e103 = _f_buffer0_.f_cb0_[4];
    let _e108 = hscard_bias.values[0];
    let _e111 = textureSampleBias(f_t0_, samplerf_s0_, _e98.xy, (_e103.x + _e108.x));
    u_xlat1_ = _e111;
    let _e112 = u_xlat0_;
    let _e114 = u_xlat1_;
    let _e115 = _e114.xyz;
    u_xlat0_.x = _e115.x;
    u_xlat0_.y = _e115.y;
    u_xlat0_.z = _e115.z;
    let _e122 = u_xlat0_;
    let _e123 = vs_COLOR0_1;
    SV_TARGET0_ = (_e122 * _e123);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(1) vs_TEXCOORD1_: vec4<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e32 = SV_TARGET0_;
    return FragmentOutput(_e32);
}
