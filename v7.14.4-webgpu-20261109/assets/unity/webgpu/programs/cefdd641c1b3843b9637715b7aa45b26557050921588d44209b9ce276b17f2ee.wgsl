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
@group(3) @binding(5) 
var samplerf_s2_: sampler;
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
@group(3) @binding(4) 
var f_t2_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD5_1: vec2<f32>;
var<private> vs_TEXCOORD6_1: vec2<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);

    let _e36 = vs_TEXCOORD6_1;
    let _e41 = _f_buffer0_.f_cb0_[4];
    let _e46 = hscard_bias.values[2];
    let _e49 = textureSampleBias(f_t2_, samplerf_s2_, _e36.xy, (_e41.x + _e46.x));
    u_xlat0_ = _e49;
    let _e51 = u_xlat0_;
    u_xlat0_.x = (_e51.x + -1f);
    let _e60 = _f_buffer1_.f_cb1_[3];
    let _e62 = u_xlat0_;
    u_xlat0_.x = ((_e60.x * _e62.x) + 1f);
    let _e67 = vs_TEXCOORD5_1;
    let _e72 = _f_buffer0_.f_cb0_[4];
    let _e77 = hscard_bias.values[1];
    let _e80 = textureSampleBias(f_t1_, samplerf_s1_, _e67.xy, (_e72.x + _e77.x));
    u_xlat1_ = _e80;
    let _e81 = vs_TEXCOORD0_1;
    let _e86 = _f_buffer0_.f_cb0_[4];
    let _e91 = hscard_bias.values[0];
    let _e94 = textureSampleBias(f_t0_, samplerf_s0_, _e81.xy, (_e86.x + _e91.x));
    u_xlat2_ = _e94;
    let _e95 = u_xlat3_;
    let _e97 = u_xlat1_;
    let _e100 = u_xlat2_;
    let _e102 = (-(_e97.xyz) + _e100.xyz);
    u_xlat3_.x = _e102.x;
    u_xlat3_.y = _e102.y;
    u_xlat3_.z = _e102.z;
    let _e109 = u_xlat3_;
    let _e111 = u_xlat2_;
    let _e113 = u_xlat3_;
    let _e116 = u_xlat1_;
    let _e118 = ((_e111.www * _e113.xyz) + _e116.xyz);
    u_xlat3_.x = _e118.x;
    u_xlat3_.y = _e118.y;
    u_xlat3_.z = _e118.z;
    let _e126 = u_xlat2_;
    SV_Target0_.w = _e126.w;
    let _e128 = u_xlat0_;
    let _e130 = u_xlat0_;
    let _e132 = u_xlat3_;
    let _e134 = (_e130.xxx * _e132.xyz);
    u_xlat0_.x = _e134.x;
    u_xlat0_.y = _e134.y;
    u_xlat0_.z = _e134.z;
    let _e141 = SV_Target0_;
    let _e143 = u_xlat0_;
    let _e145 = vs_COLOR0_1;
    let _e147 = (_e143.xyz * _e145.xyz);
    SV_Target0_.x = _e147.x;
    SV_Target0_.y = _e147.y;
    SV_Target0_.z = _e147.z;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(5) vs_TEXCOORD5_: vec2<f32>, @location(6) vs_TEXCOORD6_: vec2<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD5_1 = vs_TEXCOORD5_;
    vs_TEXCOORD6_1 = vs_TEXCOORD6_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e40 = SV_Target0_;
    return FragmentOutput(_e40);
}
