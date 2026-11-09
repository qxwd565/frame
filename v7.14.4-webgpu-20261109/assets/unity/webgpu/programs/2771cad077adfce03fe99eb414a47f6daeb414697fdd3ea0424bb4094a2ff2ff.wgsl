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
    var u_xlat3_: vec4<f32> = vec4(0f);
    var u_xlat5_: f32 = 0f;

    let _e36 = vs_TEXCOORD0_1;
    let _e41 = _f_buffer0_.f_cb0_[4];
    let _e46 = hscard_bias.values[0];
    let _e49 = textureSampleBias(f_t0_, samplerf_s0_, _e36.xy, (_e41.x + _e46.x));
    u_xlat0_ = _e49;
    let _e51 = vs_TEXCOORD0_1;
    let _e53 = dpdx(_e51.x);
    u_xlat1_.x = _e53;
    let _e54 = vs_TEXCOORD0_1;
    let _e56 = dpdy(_e54.x);
    u_xlat5_ = _e56;
    let _e58 = u_xlat5_;
    let _e60 = u_xlat1_;
    u_xlat1_.x = (abs(_e58) + abs(_e60.x));
    let _e64 = u_xlat1_;
    let _e66 = u_xlat1_;
    let _e72 = (_e66.xx * vec2<f32>(0.5f, -0.5f));
    u_xlat1_.x = _e72.x;
    u_xlat1_.y = _e72.y;
    u_xlat1_.z = 0f;
    let _e79 = u_xlat1_;
    let _e81 = vs_TEXCOORD0_1;
    u_xlat2_ = (_e79.xzyz + _e81.xyxy);
    let _e84 = u_xlat1_;
    let _e86 = vs_TEXCOORD0_1;
    u_xlat1_ = (_e84.zxzy + _e86.xyxy);
    let _e89 = u_xlat2_;
    let _e94 = _f_buffer0_.f_cb0_[4];
    let _e99 = hscard_bias.values[0];
    let _e102 = textureSampleBias(f_t0_, samplerf_s0_, _e89.xy, (_e94.x + _e99.x));
    u_xlat3_ = _e102;
    let _e103 = u_xlat2_;
    let _e108 = _f_buffer0_.f_cb0_[4];
    let _e113 = hscard_bias.values[0];
    let _e116 = textureSampleBias(f_t0_, samplerf_s0_, _e103.zw, (_e108.x + _e113.x));
    u_xlat2_ = _e116;
    let _e117 = u_xlat0_;
    let _e118 = u_xlat3_;
    u_xlat0_ = (_e117 + _e118);
    let _e120 = u_xlat2_;
    let _e121 = u_xlat0_;
    u_xlat0_ = (_e120 + _e121);
    let _e123 = u_xlat1_;
    let _e128 = _f_buffer0_.f_cb0_[4];
    let _e133 = hscard_bias.values[0];
    let _e136 = textureSampleBias(f_t0_, samplerf_s0_, _e123.xy, (_e128.x + _e133.x));
    u_xlat2_ = _e136;
    let _e137 = u_xlat1_;
    let _e142 = _f_buffer0_.f_cb0_[4];
    let _e147 = hscard_bias.values[0];
    let _e150 = textureSampleBias(f_t0_, samplerf_s0_, _e137.zw, (_e142.x + _e147.x));
    u_xlat1_ = _e150;
    let _e151 = u_xlat0_;
    let _e152 = u_xlat2_;
    u_xlat0_ = (_e151 + _e152);
    let _e154 = u_xlat1_;
    let _e155 = u_xlat0_;
    u_xlat0_ = (_e154 + _e155);
    let _e157 = u_xlat0_;
    u_xlat0_ = (_e157 * vec4<f32>(0.2f, 0.2f, 0.2f, 0.2f));
    let _e164 = vs_TEXCOORD6_1;
    let _e169 = _f_buffer0_.f_cb0_[4];
    let _e174 = hscard_bias.values[1];
    let _e177 = textureSampleBias(f_t1_, samplerf_s1_, _e164.xy, (_e169.x + _e174.x));
    u_xlat1_ = _e177;
    let _e179 = u_xlat1_;
    u_xlat1_.x = (_e179.x + -1f);
    let _e188 = _f_buffer1_.f_cb1_[3];
    let _e190 = u_xlat1_;
    u_xlat1_.x = ((_e188.x * _e190.x) + 1f);
    let _e195 = u_xlat0_;
    let _e197 = u_xlat0_;
    let _e199 = u_xlat1_;
    let _e201 = (_e197.xyz * _e199.xxx);
    u_xlat0_.x = _e201.x;
    u_xlat0_.y = _e201.y;
    u_xlat0_.z = _e201.z;
    let _e209 = u_xlat0_;
    SV_Target0_.w = _e209.w;
    let _e211 = SV_Target0_;
    let _e213 = u_xlat0_;
    let _e215 = vs_COLOR0_1;
    let _e217 = (_e213.xyz * _e215.xyz);
    SV_Target0_.x = _e217.x;
    SV_Target0_.y = _e217.y;
    SV_Target0_.z = _e217.z;
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
