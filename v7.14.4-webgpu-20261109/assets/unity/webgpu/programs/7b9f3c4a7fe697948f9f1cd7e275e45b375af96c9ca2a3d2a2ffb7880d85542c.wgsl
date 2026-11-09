struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 5>,
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
var<private> vs_TEXCOORD1_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec2<f32> = vec2(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec3<f32> = vec3(0f);
    var u_xlat4_: f32 = 0f;
    var u_xlat6_: f32 = 0f;

    let _e35 = vs_TEXCOORD1_1;
    u_xlat0_.x = (_e35.w * 0.05f);
    let _e40 = vs_TEXCOORD1_1;
    let _e45 = _f_buffer1_.f_cb1_[4];
    let _e48 = u_xlat0_;
    u_xlat0_.x = ((_e40.x * _e45.x) + _e48.x);
    let _e51 = vs_TEXCOORD1_1;
    let _e56 = _f_buffer1_.f_cb1_[3];
    u_xlat4_ = (_e51.w * _e56.w);
    let _e59 = vs_TEXCOORD0_1;
    let _e64 = _f_buffer0_.f_cb0_[4];
    let _e69 = hscard_bias.values[0];
    let _e72 = textureSampleBias(f_t0_, samplerf_s0_, _e59.xy, (_e64.x + _e69.x));
    u_xlat1_ = _e72;
    let _e73 = u_xlat1_;
    let _e78 = _f_buffer1_.f_cb1_[3];
    u_xlat6_ = (_e73.x * _e78.y);
    let _e81 = u_xlat6_;
    u_xlat6_ = (_e81 * 1.2f);
    let _e85 = u_xlat6_;
    let _e89 = _f_buffer1_.f_cb1_[4];
    let _e92 = u_xlat4_;
    u_xlat0_.y = ((_e85 * _e89.y) + _e92);
    let _e94 = u_xlat0_;
    let _e99 = _f_buffer0_.f_cb0_[4];
    let _e104 = hscard_bias.values[1];
    let _e107 = textureSampleBias(f_t1_, samplerf_s1_, _e94.xy, (_e99.x + _e104.x));
    u_xlat1_ = _e107;
    let _e109 = u_xlat1_;
    let _e111 = vs_TEXCOORD1_1;
    let _e114 = u_xlat6_;
    u_xlat0_.x = ((_e109.x * _e111.z) + _e114);
    let _e117 = u_xlat0_;
    let _e119 = u_xlat6_;
    u_xlat0_.x = dot(_e117.xx, vec2(_e119));
    let _e123 = u_xlat0_;
    let _e128 = _f_buffer1_.f_cb1_[3];
    u_xlat0_.x = (_e123.x * _e128.z);
    let _e131 = u_xlat2_;
    let _e136 = _f_buffer1_.f_cb1_[2];
    let _e138 = u_xlat0_;
    let _e144 = _f_buffer1_.f_cb1_[0];
    let _e147 = ((_e136.xyz * _e138.xxx) + -(_e144.xyz));
    u_xlat2_.x = _e147.x;
    u_xlat2_.y = _e147.y;
    u_xlat2_.z = _e147.z;
    let _e154 = u_xlat2_;
    let _e156 = u_xlat0_;
    let _e158 = u_xlat2_;
    let _e164 = _f_buffer1_.f_cb1_[0];
    let _e166 = ((_e156.xxx * _e158.xyz) + _e164.xyz);
    u_xlat2_.x = _e166.x;
    u_xlat2_.y = _e166.y;
    u_xlat2_.z = _e166.z;
    let _e173 = u_xlat1_;
    let _e175 = u_xlat2_;
    let _e180 = _f_buffer1_.f_cb1_[3];
    let _e182 = (_e175.xyz * _e180.xxx);
    u_xlat1_.x = _e182.x;
    u_xlat1_.y = _e182.y;
    u_xlat1_.z = _e182.z;
    let _e190 = vs_TEXCOORD1_1;
    u_xlat2_.x = (_e190.z + -1f);
    let _e199 = _f_buffer1_.f_cb1_[4];
    let _e201 = u_xlat2_;
    u_xlat2_.x = ((_e199.w * _e201.x) + 1f);
    let _e207 = u_xlat2_;
    let _e209 = u_xlat0_;
    u_xlat1_.w = (_e207.x * _e209.x);
    let _e212 = u_xlat1_;
    let _e216 = _f_buffer1_.f_cb1_[1];
    SV_Target0_ = (_e212 * _e216);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    main_1();
    let _e28 = SV_Target0_;
    return FragmentOutput(_e28);
}
