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
var<private> vs_TEXCOORD0_1: vec4<f32>;
var<private> vs_COLOR1_1: vec4<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> vs_TEXCOORD1_1: f32;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat7_: f32 = 0f;

    let _e29 = u_xlat0_;
    let _e31 = vs_TEXCOORD0_1;
    let _e32 = _e31.xy;
    u_xlat0_.x = _e32.x;
    u_xlat0_.y = _e32.y;
    let _e37 = u_xlat0_;
    let _e39 = u_xlat0_;
    let _e45 = clamp(_e39.xy, vec2(0f), vec2(1f));
    u_xlat0_.x = _e45.x;
    u_xlat0_.y = _e45.y;
    let _e50 = u_xlat0_;
    let _e52 = u_xlat0_;
    let _e54 = vs_TEXCOORD0_1;
    let _e57 = (_e52.xy + -(_e54.xy));
    u_xlat0_.x = _e57.x;
    u_xlat0_.y = _e57.y;
    let _e62 = u_xlat0_;
    let _e67 = _f_buffer1_.f_cb1_[3];
    let _e69 = u_xlat0_;
    let _e72 = vs_TEXCOORD0_1;
    let _e74 = ((_e67.zz * _e69.xy) + _e72.xy);
    u_xlat0_.x = _e74.x;
    u_xlat0_.y = _e74.y;
    let _e79 = u_xlat0_;
    let _e84 = _f_buffer0_.f_cb0_[4];
    let _e89 = hscard_bias.values[0];
    let _e92 = textureSampleBias(f_t0_, samplerf_s0_, _e79.xy, (_e84.x + _e89.x));
    u_xlat0_ = _e92.yzwx;
    let _e94 = u_xlat1_;
    let _e96 = u_xlat0_;
    let _e101 = _f_buffer1_.f_cb1_[2];
    let _e103 = (_e96.wxy + _e101.yyy);
    u_xlat1_.x = _e103.x;
    u_xlat1_.y = _e103.y;
    u_xlat1_.z = _e103.z;
    let _e110 = u_xlat0_;
    let _e115 = _f_buffer1_.f_cb1_[3];
    u_xlat7_ = max(_e110.w, _e115.y);
    let _e118 = u_xlat1_;
    let _e120 = u_xlat7_;
    let _e122 = u_xlat1_;
    let _e124 = (vec3(_e120) * _e122.xyz);
    u_xlat1_.x = _e124.x;
    u_xlat1_.y = _e124.y;
    u_xlat1_.z = _e124.z;
    let _e131 = u_xlat0_;
    let _e133 = u_xlat1_;
    let _e138 = _f_buffer1_.f_cb1_[2];
    let _e140 = (_e133.xyz * _e138.xxx);
    u_xlat0_.x = _e140.x;
    u_xlat0_.y = _e140.y;
    u_xlat0_.z = _e140.z;
    let _e147 = vs_TEXCOORD0_1;
    let _e152 = _f_buffer0_.f_cb0_[4];
    let _e157 = hscard_bias.values[1];
    let _e160 = textureSampleBias(f_t1_, samplerf_s1_, _e147.zw, (_e152.x + _e157.x));
    u_xlat1_ = _e160;
    let _e161 = u_xlat1_;
    let _e163 = vs_COLOR1_1;
    let _e165 = u_xlat0_;
    u_xlat0_ = ((_e161.xyzx * _e163) + _e165);
    let _e168 = vs_TEXCOORD1_1;
    u_xlat1_.x = _e168;
    let _e170 = u_xlat1_;
    u_xlat1_.x = clamp(_e170.x, 0f, 1f);
    let _e175 = u_xlat1_;
    let _e177 = vs_COLOR0_1;
    u_xlat1_ = (_e175.xxxx * _e177);
    let _e179 = u_xlat0_;
    let _e180 = u_xlat1_;
    SV_Target0_ = (_e179 * _e180);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(11) vs_COLOR1_: vec4<f32>, @location(10) vs_COLOR0_: vec4<f32>, @location(1) vs_TEXCOORD1_: f32) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_COLOR1_1 = vs_COLOR1_;
    vs_COLOR0_1 = vs_COLOR0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    main_1();
    let _e36 = SV_Target0_;
    return FragmentOutput(_e36);
}
