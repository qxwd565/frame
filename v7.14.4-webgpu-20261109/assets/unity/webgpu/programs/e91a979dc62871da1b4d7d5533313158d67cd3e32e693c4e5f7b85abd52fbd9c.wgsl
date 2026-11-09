struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 8>,
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
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: f32 = 0f;
    var u_xlat4_: vec2<f32> = vec2(0f);

    let _e31 = vs_TEXCOORD0_1;
    u_xlat0_ = _e31.zwxy;
    let _e33 = u_xlat0_;
    u_xlat0_ = clamp(_e33, vec4(0f), vec4(1f));
    let _e39 = u_xlat0_;
    let _e40 = vs_TEXCOORD0_1;
    u_xlat0_ = (_e39 + -(_e40.zwxy));
    let _e44 = u_xlat0_;
    let _e49 = _f_buffer1_.f_cb1_[6];
    let _e51 = u_xlat0_;
    let _e54 = vs_TEXCOORD0_1;
    let _e56 = ((_e49.xx * _e51.xy) + _e54.zw);
    u_xlat0_.x = _e56.x;
    u_xlat0_.y = _e56.y;
    let _e61 = u_xlat4_;
    let _e66 = _f_buffer1_.f_cb1_[3];
    let _e68 = u_xlat0_;
    let _e71 = vs_TEXCOORD0_1;
    let _e73 = ((_e66.zz * _e68.zw) + _e71.xy);
    u_xlat4_.x = _e73.x;
    u_xlat4_.y = _e73.y;
    let _e78 = u_xlat4_;
    let _e83 = _f_buffer0_.f_cb0_[4];
    let _e88 = hscard_bias.values[0];
    let _e91 = textureSampleBias(f_t0_, samplerf_s0_, _e78.xy, (_e83.x + _e88.x));
    u_xlat1_ = _e91;
    let _e92 = u_xlat0_;
    let _e97 = _f_buffer0_.f_cb0_[4];
    let _e102 = hscard_bias.values[1];
    let _e105 = textureSampleBias(f_t1_, samplerf_s1_, _e92.xy, (_e97.x + _e102.x));
    u_xlat0_ = _e105;
    let _e107 = u_xlat0_;
    u_xlat0_.x = (_e107.w + -1f);
    let _e116 = _f_buffer1_.f_cb1_[7];
    let _e118 = u_xlat0_;
    u_xlat0_.x = ((_e116.w * _e118.x) + 1f);
    let _e123 = u_xlat1_;
    let _e128 = _f_buffer1_.f_cb1_[2];
    u_xlat2_ = (_e123.w + _e128.y);
    let _e132 = u_xlat1_;
    let _e137 = _f_buffer1_.f_cb1_[3];
    u_xlat4_.x = max(_e132.w, _e137.y);
    let _e140 = u_xlat4_;
    let _e142 = u_xlat2_;
    u_xlat2_ = (_e140.x * _e142);
    let _e144 = u_xlat1_;
    let _e146 = u_xlat2_;
    let _e151 = _f_buffer1_.f_cb1_[2];
    let _e153 = (vec3(_e146) * _e151.xxx);
    u_xlat1_.x = _e153.x;
    u_xlat1_.y = _e153.y;
    u_xlat1_.z = _e153.z;
    let _e160 = u_xlat0_;
    let _e162 = u_xlat1_;
    u_xlat0_ = (_e160.xxxx * _e162);
    let _e164 = u_xlat0_;
    let _e165 = vs_COLOR0_1;
    SV_Target0_ = (_e164 * _e165);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e28 = SV_Target0_;
    return FragmentOutput(_e28);
}
