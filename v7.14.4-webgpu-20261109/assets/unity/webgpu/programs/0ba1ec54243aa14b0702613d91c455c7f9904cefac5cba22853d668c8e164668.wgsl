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
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: f32 = 0f;
    var u_xlat3_: f32 = 0f;

    let _e24 = u_xlat0_;
    let _e26 = vs_TEXCOORD0_1;
    let _e27 = _e26.xy;
    u_xlat0_.x = _e27.x;
    u_xlat0_.y = _e27.y;
    let _e32 = u_xlat0_;
    let _e34 = u_xlat0_;
    let _e40 = clamp(_e34.xy, vec2(0f), vec2(1f));
    u_xlat0_.x = _e40.x;
    u_xlat0_.y = _e40.y;
    let _e45 = u_xlat0_;
    let _e47 = u_xlat0_;
    let _e49 = vs_TEXCOORD0_1;
    let _e52 = (_e47.xy + -(_e49.xy));
    u_xlat0_.x = _e52.x;
    u_xlat0_.y = _e52.y;
    let _e57 = u_xlat0_;
    let _e62 = _f_buffer1_.f_cb1_[3];
    let _e64 = u_xlat0_;
    let _e67 = vs_TEXCOORD0_1;
    let _e69 = ((_e62.zz * _e64.xy) + _e67.xy);
    u_xlat0_.x = _e69.x;
    u_xlat0_.y = _e69.y;
    let _e74 = u_xlat0_;
    let _e79 = _f_buffer0_.f_cb0_[4];
    let _e84 = hscard_bias.values[0];
    let _e87 = textureSampleBias(f_t0_, samplerf_s0_, _e74.xy, (_e79.x + _e84.x));
    u_xlat0_ = _e87;
    let _e89 = u_xlat0_;
    u_xlat0_.w = dot(_e89.xyz, vec3<f32>(0.299f, 0.587f, 0.114f));
    let _e96 = u_xlat0_;
    let _e101 = _f_buffer1_.f_cb1_[2];
    u_xlat1_ = (_e96.w + _e101.y);
    let _e104 = u_xlat0_;
    let _e109 = _f_buffer1_.f_cb1_[3];
    u_xlat3_ = max(_e104.w, _e109.y);
    let _e112 = u_xlat3_;
    let _e113 = u_xlat1_;
    u_xlat1_ = (_e112 * _e113);
    let _e115 = u_xlat0_;
    let _e117 = u_xlat1_;
    let _e122 = _f_buffer1_.f_cb1_[2];
    let _e124 = (vec3(_e117) * _e122.xxx);
    u_xlat0_.x = _e124.x;
    u_xlat0_.y = _e124.y;
    u_xlat0_.z = _e124.z;
    let _e131 = u_xlat0_;
    let _e132 = vs_COLOR0_1;
    SV_Target0_ = (_e131 * _e132);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e24 = SV_Target0_;
    return FragmentOutput(_e24);
}
