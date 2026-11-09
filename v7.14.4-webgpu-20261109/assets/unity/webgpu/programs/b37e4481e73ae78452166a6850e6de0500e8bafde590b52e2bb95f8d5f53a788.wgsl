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
var<private> phase0_Input0_1_: vec4<f32>;
var<private> vs_TEXCOORD1_1: f32;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: f32 = 0f;
    var u_xlat3_: vec2<f32> = vec2(0f);
    var u_xlat5_: f32 = 0f;

    let _e34 = vs_TEXCOORD0_1;
    let _e35 = vs_TEXCOORD1_1;
    phase0_Input0_1_ = vec4<f32>(_e34.x, _e34.y, _e35, 0f);
    let _e41 = u_xlat0_;
    let _e43 = phase0_Input0_1_;
    let _e44 = _e43.zxy;
    u_xlat0_.x = _e44.x;
    u_xlat0_.y = _e44.y;
    u_xlat0_.z = _e44.z;
    let _e51 = u_xlat0_;
    let _e53 = u_xlat0_;
    let _e59 = clamp(_e53.xyz, vec3(0f), vec3(1f));
    u_xlat0_.x = _e59.x;
    u_xlat0_.y = _e59.y;
    u_xlat0_.z = _e59.z;
    let _e66 = u_xlat3_;
    let _e68 = u_xlat0_;
    let _e70 = phase0_Input0_1_;
    let _e73 = (_e68.yz + -(_e70.xy));
    u_xlat3_.x = _e73.x;
    u_xlat3_.y = _e73.y;
    let _e78 = u_xlat0_;
    let _e80 = vs_COLOR0_1;
    u_xlat1_ = (_e78.xxxx * _e80);
    let _e82 = u_xlat0_;
    let _e87 = _f_buffer1_.f_cb1_[3];
    let _e89 = u_xlat3_;
    let _e92 = phase0_Input0_1_;
    let _e94 = ((_e87.zz * _e89.xy) + _e92.xy);
    u_xlat0_.x = _e94.x;
    u_xlat0_.y = _e94.y;
    let _e99 = u_xlat0_;
    let _e104 = _f_buffer0_.f_cb0_[4];
    let _e109 = hscard_bias.values[0];
    let _e112 = textureSampleBias(f_t0_, samplerf_s0_, _e99.xy, (_e104.x + _e109.x));
    u_xlat0_ = _e112;
    let _e114 = u_xlat0_;
    u_xlat0_.w = dot(_e114.xyz, vec3<f32>(0.299f, 0.587f, 0.114f));
    let _e121 = u_xlat0_;
    let _e126 = _f_buffer1_.f_cb1_[2];
    u_xlat2_ = (_e121.w + _e126.y);
    let _e129 = u_xlat0_;
    let _e134 = _f_buffer1_.f_cb1_[3];
    u_xlat5_ = max(_e129.w, _e134.y);
    let _e137 = u_xlat5_;
    let _e138 = u_xlat2_;
    u_xlat2_ = (_e137 * _e138);
    let _e140 = u_xlat0_;
    let _e142 = u_xlat2_;
    let _e147 = _f_buffer1_.f_cb1_[2];
    let _e149 = (vec3(_e142) * _e147.xxx);
    u_xlat0_.x = _e149.x;
    u_xlat0_.y = _e149.y;
    u_xlat0_.z = _e149.z;
    let _e156 = u_xlat1_;
    let _e157 = u_xlat0_;
    SV_Target0_ = (_e156 * _e157);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: f32, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e30 = SV_Target0_;
    return FragmentOutput(_e30);
}
