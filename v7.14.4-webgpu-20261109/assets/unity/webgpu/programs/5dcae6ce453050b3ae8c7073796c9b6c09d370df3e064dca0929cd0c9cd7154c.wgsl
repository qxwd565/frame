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

    let _e25 = vs_TEXCOORD0_1;
    let _e30 = _f_buffer0_.f_cb0_[4];
    let _e35 = hscard_bias.values[0];
    let _e38 = textureSampleBias(f_t0_, samplerf_s0_, _e25.xy, (_e30.x + _e35.x));
    u_xlat0_ = _e38;
    let _e39 = vs_TEXCOORD0_1;
    let _e44 = _f_buffer0_.f_cb0_[4];
    let _e49 = hscard_bias.values[0];
    let _e52 = textureSampleBias(f_t0_, samplerf_s0_, _e39.zw, (_e44.x + _e49.x));
    u_xlat1_ = _e52;
    let _e54 = u_xlat0_;
    let _e56 = u_xlat1_;
    u_xlat0_.x = (_e54.w + _e56.w);
    let _e59 = vs_TEXCOORD1_1;
    let _e64 = _f_buffer0_.f_cb0_[4];
    let _e69 = hscard_bias.values[0];
    let _e72 = textureSampleBias(f_t0_, samplerf_s0_, _e59.xy, (_e64.x + _e69.x));
    u_xlat1_ = _e72;
    let _e74 = u_xlat0_;
    let _e76 = u_xlat1_;
    u_xlat0_.x = (_e74.x + _e76.w);
    let _e79 = vs_TEXCOORD1_1;
    let _e84 = _f_buffer0_.f_cb0_[4];
    let _e89 = hscard_bias.values[0];
    let _e92 = textureSampleBias(f_t0_, samplerf_s0_, _e79.zw, (_e84.x + _e89.x));
    u_xlat1_ = _e92;
    let _e94 = u_xlat0_;
    let _e96 = u_xlat1_;
    u_xlat0_.x = (_e94.x + _e96.w);
    let _e99 = vs_TEXCOORD2_1;
    let _e104 = _f_buffer0_.f_cb0_[4];
    let _e109 = hscard_bias.values[0];
    let _e112 = textureSampleBias(f_t0_, samplerf_s0_, _e99.xy, (_e104.x + _e109.x));
    u_xlat1_ = _e112;
    let _e114 = u_xlat0_;
    let _e116 = u_xlat1_;
    u_xlat0_.x = (_e114.x + _e116.w);
    let _e119 = vs_TEXCOORD2_1;
    let _e124 = _f_buffer0_.f_cb0_[4];
    let _e129 = hscard_bias.values[0];
    let _e132 = textureSampleBias(f_t0_, samplerf_s0_, _e119.zw, (_e124.x + _e129.x));
    u_xlat1_ = _e132;
    let _e134 = u_xlat0_;
    let _e136 = u_xlat1_;
    u_xlat0_.x = (_e134.x + _e136.w);
    let _e139 = vs_TEXCOORD3_1;
    let _e144 = _f_buffer0_.f_cb0_[4];
    let _e149 = hscard_bias.values[0];
    let _e152 = textureSampleBias(f_t0_, samplerf_s0_, _e139.xy, (_e144.x + _e149.x));
    u_xlat1_ = _e152;
    let _e154 = u_xlat0_;
    let _e156 = u_xlat1_;
    u_xlat0_.x = (_e154.x + _e156.w);
    let _e160 = vs_TEXCOORD3_1;
    let _e165 = _f_buffer1_.f_cb1_[3];
    u_xlat1_.x = (_e160.z + -(_e165.x));
    let _e170 = vs_TEXCOORD3_1;
    u_xlat1_.y = _e170.w;
    let _e172 = u_xlat1_;
    let _e177 = _f_buffer0_.f_cb0_[4];
    let _e182 = hscard_bias.values[0];
    let _e185 = textureSampleBias(f_t0_, samplerf_s0_, _e172.xy, (_e177.x + _e182.x));
    u_xlat1_ = _e185;
    let _e187 = u_xlat0_;
    let _e189 = u_xlat1_;
    u_xlat0_.x = (_e187.x + _e189.w);
    let _e192 = vs_TEXCOORD3_1;
    let _e197 = _f_buffer0_.f_cb0_[4];
    let _e202 = hscard_bias.values[0];
    let _e205 = textureSampleBias(f_t0_, samplerf_s0_, _e192.zw, (_e197.x + _e202.x));
    u_xlat1_ = _e205;
    let _e207 = u_xlat0_;
    let _e209 = u_xlat1_;
    u_xlat0_.x = (_e207.x + _e209.w);
    let _e213 = u_xlat0_;
    u_xlat0_.x = clamp(_e213.x, 0f, 1f);
    let _e219 = u_xlat0_;
    let _e221 = vs_COLOR0_1;
    SV_TARGET0_.w = (_e219.x * _e221.w);
    let _e224 = u_xlat0_;
    let _e226 = vs_COLOR0_1;
    let _e231 = _f_buffer1_.f_cb1_[2];
    let _e234 = (_e226.xyz + -(_e231.xyz));
    u_xlat0_.x = _e234.x;
    u_xlat0_.y = _e234.y;
    u_xlat0_.z = _e234.z;
    let _e241 = SV_TARGET0_;
    let _e243 = u_xlat1_;
    let _e245 = u_xlat0_;
    let _e251 = _f_buffer1_.f_cb1_[2];
    let _e253 = ((_e243.www * _e245.xyz) + _e251.xyz);
    SV_TARGET0_.x = _e253.x;
    SV_TARGET0_.y = _e253.y;
    SV_TARGET0_.z = _e253.z;
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
    let _e36 = SV_TARGET0_;
    return FragmentOutput(_e36);
}
