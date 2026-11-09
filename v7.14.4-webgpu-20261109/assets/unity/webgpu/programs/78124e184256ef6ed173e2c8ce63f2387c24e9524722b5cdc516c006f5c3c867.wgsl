struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 9>,
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
@group(3) @binding(5) 
var samplerf_s2_: sampler;
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
@group(3) @binding(4) 
var f_t2_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD1_1: vec4<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_TARGET0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);

    let _e35 = vs_TEXCOORD1_1;
    let _e40 = _f_buffer0_.f_cb0_[4];
    let _e45 = hscard_bias.values[1];
    let _e48 = textureSampleBias(f_t1_, samplerf_s1_, _e35.xy, (_e40.x + _e45.x));
    u_xlat0_ = _e48;
    let _e49 = u_xlat3_;
    let _e51 = u_xlat0_;
    let _e56 = _f_buffer1_.f_cb1_[7];
    let _e58 = (_e51.xy * _e56.xy);
    u_xlat3_.x = _e58.x;
    u_xlat3_.y = _e58.y;
    let _e63 = u_xlat3_;
    let _e65 = u_xlat3_;
    let _e70 = _f_buffer1_.f_cb1_[2];
    let _e73 = vs_TEXCOORD0_1;
    let _e75 = ((_e65.xy * _e70.yy) + _e73.xy);
    u_xlat3_.x = _e75.x;
    u_xlat3_.y = _e75.y;
    let _e80 = u_xlat3_;
    let _e85 = _f_buffer0_.f_cb0_[4];
    let _e90 = hscard_bias.values[0];
    let _e93 = textureSampleBias(f_t0_, samplerf_s0_, _e80.xy, (_e85.x + _e90.x));
    u_xlat1_ = _e93;
    let _e94 = u_xlat3_;
    let _e96 = u_xlat1_;
    let _e101 = _f_buffer1_.f_cb1_[8];
    let _e103 = (_e96.xyz * _e101.xyz);
    u_xlat3_.x = _e103.x;
    u_xlat3_.y = _e103.y;
    u_xlat3_.z = _e103.z;
    let _e110 = u_xlat1_;
    let _e112 = u_xlat3_;
    let _e114 = u_xlat3_;
    let _e116 = (_e112.xyz + _e114.xyz);
    u_xlat1_.x = _e116.x;
    u_xlat1_.y = _e116.y;
    u_xlat1_.z = _e116.z;
    let _e123 = vs_TEXCOORD1_1;
    let _e128 = _f_buffer0_.f_cb0_[4];
    let _e133 = hscard_bias.values[2];
    let _e136 = textureSampleBias(f_t2_, samplerf_s2_, _e123.zw, (_e128.x + _e133.x));
    u_xlat2_ = _e136;
    let _e138 = u_xlat2_;
    let _e143 = _f_buffer1_.f_cb1_[3];
    u_xlat3_.x = (_e138.x * _e143.z);
    let _e147 = u_xlat3_;
    let _e149 = u_xlat0_;
    u_xlat1_.w = (_e147.x * _e149.x);
    let _e152 = u_xlat1_;
    let _e153 = vs_COLOR0_1;
    SV_TARGET0_ = (_e152 * _e153);
    let _e155 = SV_TARGET0_;
    SV_TARGET0_ = clamp(_e155, vec4(0f), vec4(1f));
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec4<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e36 = SV_TARGET0_;
    return FragmentOutput(_e36);
}
