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
    var u_xlat2_: vec3<f32> = vec3(0f);
    var u_xlat3_: vec2<f32> = vec2(0f);
    var u_xlat11_: f32 = 0f;

    let _e35 = vs_TEXCOORD0_1;
    let _e36 = vs_TEXCOORD1_1;
    phase0_Input0_1_ = vec4<f32>(_e35.x, _e35.y, _e36, 0f);
    let _e42 = u_xlat0_;
    let _e44 = phase0_Input0_1_;
    let _e45 = _e44.zxy;
    u_xlat0_.x = _e45.x;
    u_xlat0_.y = _e45.y;
    u_xlat0_.z = _e45.z;
    let _e52 = u_xlat0_;
    let _e54 = u_xlat0_;
    let _e60 = clamp(_e54.xyz, vec3(0f), vec3(1f));
    u_xlat0_.x = _e60.x;
    u_xlat0_.y = _e60.y;
    u_xlat0_.z = _e60.z;
    let _e67 = u_xlat3_;
    let _e69 = u_xlat0_;
    let _e71 = phase0_Input0_1_;
    let _e74 = (_e69.yz + -(_e71.xy));
    u_xlat3_.x = _e74.x;
    u_xlat3_.y = _e74.y;
    let _e79 = u_xlat0_;
    let _e81 = vs_COLOR0_1;
    u_xlat1_ = (_e79.xxxx * _e81);
    let _e83 = u_xlat0_;
    let _e88 = _f_buffer1_.f_cb1_[3];
    let _e90 = u_xlat3_;
    let _e93 = phase0_Input0_1_;
    let _e95 = ((_e88.zz * _e90.xy) + _e93.xy);
    u_xlat0_.x = _e95.x;
    u_xlat0_.y = _e95.y;
    let _e100 = u_xlat0_;
    let _e105 = _f_buffer0_.f_cb0_[4];
    let _e110 = hscard_bias.values[0];
    let _e113 = textureSampleBias(f_t0_, samplerf_s0_, _e100.xy, (_e105.x + _e110.x));
    u_xlat0_ = _e113;
    let _e114 = u_xlat2_;
    let _e116 = u_xlat0_;
    let _e121 = _f_buffer1_.f_cb1_[2];
    let _e123 = (_e116.xyz + _e121.yyy);
    u_xlat2_.x = _e123.x;
    u_xlat2_.y = _e123.y;
    u_xlat2_.z = _e123.z;
    let _e130 = u_xlat0_;
    let _e135 = _f_buffer1_.f_cb1_[3];
    u_xlat11_ = max(_e130.w, _e135.y);
    let _e138 = u_xlat2_;
    let _e140 = u_xlat11_;
    let _e142 = u_xlat2_;
    let _e144 = (vec3(_e140) * _e142.xyz);
    u_xlat2_.x = _e144.x;
    u_xlat2_.y = _e144.y;
    u_xlat2_.z = _e144.z;
    let _e151 = u_xlat0_;
    let _e153 = u_xlat2_;
    let _e158 = _f_buffer1_.f_cb1_[2];
    let _e160 = (_e153.xyz * _e158.xxx);
    u_xlat0_.x = _e160.x;
    u_xlat0_.y = _e160.y;
    u_xlat0_.z = _e160.z;
    let _e167 = u_xlat1_;
    let _e168 = u_xlat0_;
    SV_Target0_ = (_e167 * _e168);
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
