struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct FragmentOutput {
    @location(0) SV_TARGET0_: vec4<f32>,
}

@group(1) @binding(31) 
var<uniform> hscard_bias: HScardSamplerBias;
@group(1) @binding(0) 
var<uniform> _f_buffer0_: f_buffer0_;
@group(3) @binding(1) 
var samplerf_s0_: sampler;
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> vs_TEXCOORD0_1: vec4<f32>;
var<private> vs_TEXCOORD1_1: vec4<f32>;
var<private> vs_TEXCOORD2_1: vec4<f32>;
var<private> vs_TEXCOORD3_1: vec4<f32>;
var<private> SV_TARGET0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);

    let _e22 = vs_TEXCOORD0_1;
    let _e27 = _f_buffer0_.f_cb0_[4];
    let _e32 = hscard_bias.values[0];
    let _e35 = textureSampleBias(f_t0_, samplerf_s0_, _e22.xy, (_e27.x + _e32.x));
    u_xlat0_ = _e35;
    let _e36 = vs_TEXCOORD0_1;
    let _e41 = _f_buffer0_.f_cb0_[4];
    let _e46 = hscard_bias.values[0];
    let _e49 = textureSampleBias(f_t0_, samplerf_s0_, _e36.zw, (_e41.x + _e46.x));
    u_xlat1_ = _e49;
    let _e51 = u_xlat0_;
    let _e53 = u_xlat1_;
    u_xlat0_.x = (_e51.w + _e53.w);
    let _e56 = vs_TEXCOORD1_1;
    let _e61 = _f_buffer0_.f_cb0_[4];
    let _e66 = hscard_bias.values[0];
    let _e69 = textureSampleBias(f_t0_, samplerf_s0_, _e56.xy, (_e61.x + _e66.x));
    u_xlat1_ = _e69;
    let _e71 = u_xlat0_;
    let _e73 = u_xlat1_;
    u_xlat0_.x = (_e71.x + _e73.w);
    let _e76 = vs_TEXCOORD1_1;
    let _e81 = _f_buffer0_.f_cb0_[4];
    let _e86 = hscard_bias.values[0];
    let _e89 = textureSampleBias(f_t0_, samplerf_s0_, _e76.zw, (_e81.x + _e86.x));
    u_xlat1_ = _e89;
    let _e91 = u_xlat0_;
    let _e93 = u_xlat1_;
    u_xlat0_.x = (_e91.x + _e93.w);
    let _e96 = vs_TEXCOORD2_1;
    let _e101 = _f_buffer0_.f_cb0_[4];
    let _e106 = hscard_bias.values[0];
    let _e109 = textureSampleBias(f_t0_, samplerf_s0_, _e96.xy, (_e101.x + _e106.x));
    u_xlat1_ = _e109;
    let _e111 = u_xlat0_;
    let _e113 = u_xlat1_;
    u_xlat0_.x = (_e111.x + _e113.w);
    let _e116 = vs_TEXCOORD2_1;
    let _e121 = _f_buffer0_.f_cb0_[4];
    let _e126 = hscard_bias.values[0];
    let _e129 = textureSampleBias(f_t0_, samplerf_s0_, _e116.zw, (_e121.x + _e126.x));
    u_xlat1_ = _e129;
    let _e131 = u_xlat0_;
    let _e133 = u_xlat1_;
    u_xlat0_.x = (_e131.x + _e133.w);
    let _e136 = vs_TEXCOORD3_1;
    let _e141 = _f_buffer0_.f_cb0_[4];
    let _e146 = hscard_bias.values[0];
    let _e149 = textureSampleBias(f_t0_, samplerf_s0_, _e136.xy, (_e141.x + _e146.x));
    u_xlat1_ = _e149;
    let _e151 = u_xlat0_;
    let _e153 = u_xlat1_;
    u_xlat0_.x = (_e151.x + _e153.w);
    let _e156 = vs_TEXCOORD3_1;
    let _e161 = _f_buffer0_.f_cb0_[4];
    let _e166 = hscard_bias.values[0];
    let _e169 = textureSampleBias(f_t0_, samplerf_s0_, _e156.zw, (_e161.x + _e166.x));
    u_xlat1_ = _e169;
    let _e171 = u_xlat0_;
    let _e173 = u_xlat1_;
    u_xlat0_.x = (_e171.x + _e173.w);
    let _e177 = u_xlat0_;
    SV_TARGET0_.w = (_e177.x * 0.23f);
    let _e181 = SV_TARGET0_;
    let _e183 = vs_COLOR0_1;
    let _e184 = _e183.xyz;
    SV_TARGET0_.x = _e184.x;
    SV_TARGET0_.y = _e184.y;
    SV_TARGET0_.z = _e184.z;
    return;
}

@fragment 
fn main(@location(10) vs_COLOR0_: vec4<f32>, @location(0) vs_TEXCOORD0_: vec4<f32>, @location(1) vs_TEXCOORD1_: vec4<f32>, @location(2) vs_TEXCOORD2_: vec4<f32>, @location(3) vs_TEXCOORD3_: vec4<f32>) -> FragmentOutput {
    vs_COLOR0_1 = vs_COLOR0_;
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_TEXCOORD2_1 = vs_TEXCOORD2_;
    vs_TEXCOORD3_1 = vs_TEXCOORD3_;
    main_1();
    let _e33 = SV_TARGET0_;
    return FragmentOutput(_e33);
}
