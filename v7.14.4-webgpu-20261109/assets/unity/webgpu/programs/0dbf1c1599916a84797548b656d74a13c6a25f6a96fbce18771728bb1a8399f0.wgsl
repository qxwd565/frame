struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 2>,
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
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD1_1: vec2<f32>;
var<private> vs_TEXCOORD2_1: vec2<f32>;
var<private> vs_TEXCOORD3_1: vec2<f32>;
var<private> vs_TEXCOORD4_1: vec2<f32>;
var<private> vs_TEXCOORD5_1: vec2<f32>;
var<private> vs_TEXCOORD6_1: vec2<f32>;
var<private> vs_TEXCOORD7_1: vec2<f32>;
var<private> SV_TARGET0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);

    let _e28 = vs_TEXCOORD0_1;
    let _e33 = _f_buffer0_.f_cb0_[4];
    let _e38 = hscard_bias.values[0];
    let _e41 = textureSampleBias(f_t0_, samplerf_s0_, _e28.xy, (_e33.x + _e38.x));
    u_xlat0_ = _e41;
    let _e42 = vs_TEXCOORD1_1;
    let _e47 = _f_buffer0_.f_cb0_[4];
    let _e52 = hscard_bias.values[0];
    let _e55 = textureSampleBias(f_t0_, samplerf_s0_, _e42.xy, (_e47.x + _e52.x));
    u_xlat1_ = _e55;
    let _e57 = u_xlat0_;
    let _e59 = u_xlat1_;
    u_xlat0_.x = (_e57.w + _e59.w);
    let _e62 = vs_TEXCOORD2_1;
    let _e67 = _f_buffer0_.f_cb0_[4];
    let _e72 = hscard_bias.values[0];
    let _e75 = textureSampleBias(f_t0_, samplerf_s0_, _e62.xy, (_e67.x + _e72.x));
    u_xlat1_ = _e75;
    let _e77 = u_xlat0_;
    let _e79 = u_xlat1_;
    u_xlat0_.x = (_e77.x + _e79.w);
    let _e82 = vs_TEXCOORD3_1;
    let _e87 = _f_buffer0_.f_cb0_[4];
    let _e92 = hscard_bias.values[0];
    let _e95 = textureSampleBias(f_t0_, samplerf_s0_, _e82.xy, (_e87.x + _e92.x));
    u_xlat1_ = _e95;
    let _e97 = u_xlat0_;
    let _e99 = u_xlat1_;
    u_xlat0_.x = (_e97.x + _e99.w);
    let _e102 = vs_TEXCOORD4_1;
    let _e107 = _f_buffer0_.f_cb0_[4];
    let _e112 = hscard_bias.values[0];
    let _e115 = textureSampleBias(f_t0_, samplerf_s0_, _e102.xy, (_e107.x + _e112.x));
    u_xlat1_ = _e115;
    let _e117 = u_xlat0_;
    let _e119 = u_xlat1_;
    u_xlat0_.x = (_e117.x + _e119.w);
    let _e122 = vs_TEXCOORD5_1;
    let _e127 = _f_buffer0_.f_cb0_[4];
    let _e132 = hscard_bias.values[0];
    let _e135 = textureSampleBias(f_t0_, samplerf_s0_, _e122.xy, (_e127.x + _e132.x));
    u_xlat1_ = _e135;
    let _e137 = u_xlat0_;
    let _e139 = u_xlat1_;
    u_xlat0_.x = (_e137.x + _e139.w);
    let _e142 = vs_TEXCOORD6_1;
    let _e147 = _f_buffer0_.f_cb0_[4];
    let _e152 = hscard_bias.values[0];
    let _e155 = textureSampleBias(f_t0_, samplerf_s0_, _e142.xy, (_e147.x + _e152.x));
    u_xlat1_ = _e155;
    let _e157 = u_xlat0_;
    let _e159 = u_xlat1_;
    u_xlat0_.x = (_e157.x + _e159.w);
    let _e162 = vs_TEXCOORD7_1;
    let _e167 = _f_buffer0_.f_cb0_[4];
    let _e172 = hscard_bias.values[0];
    let _e175 = textureSampleBias(f_t0_, samplerf_s0_, _e162.xy, (_e167.x + _e172.x));
    u_xlat1_ = _e175;
    let _e177 = u_xlat0_;
    let _e179 = u_xlat1_;
    u_xlat0_.x = (_e177.x + _e179.w);
    let _e183 = u_xlat0_;
    u_xlat0_.x = (_e183.x * 0.125f);
    let _e187 = u_xlat1_;
    let _e189 = u_xlat0_;
    let _e194 = _f_buffer1_.f_cb1_[1];
    let _e196 = (_e189.xxx * _e194.xyz);
    u_xlat1_.x = _e196.x;
    u_xlat1_.y = _e196.y;
    u_xlat1_.z = _e196.z;
    let _e204 = u_xlat0_;
    let _e206 = u_xlat0_;
    u_xlat1_.w = (_e204.x * _e206.x);
    let _e209 = u_xlat1_;
    let _e213 = _f_buffer1_.f_cb1_[1];
    SV_TARGET0_ = (_e209 * _e213.wwww);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec2<f32>, @location(2) vs_TEXCOORD2_: vec2<f32>, @location(3) vs_TEXCOORD3_: vec2<f32>, @location(4) vs_TEXCOORD4_: vec2<f32>, @location(5) vs_TEXCOORD5_: vec2<f32>, @location(6) vs_TEXCOORD6_: vec2<f32>, @location(7) vs_TEXCOORD7_: vec2<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_TEXCOORD2_1 = vs_TEXCOORD2_;
    vs_TEXCOORD3_1 = vs_TEXCOORD3_;
    vs_TEXCOORD4_1 = vs_TEXCOORD4_;
    vs_TEXCOORD5_1 = vs_TEXCOORD5_;
    vs_TEXCOORD6_1 = vs_TEXCOORD6_;
    vs_TEXCOORD7_1 = vs_TEXCOORD7_;
    main_1();
    let _e48 = SV_TARGET0_;
    return FragmentOutput(_e48);
}
