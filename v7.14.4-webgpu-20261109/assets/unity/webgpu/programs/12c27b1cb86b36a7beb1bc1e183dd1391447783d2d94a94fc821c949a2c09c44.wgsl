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
    var u_xlat1_: vec3<f32> = vec3(0f);
    var u_xlat7_: f32 = 0f;

    let _e25 = u_xlat0_;
    let _e27 = vs_TEXCOORD0_1;
    let _e28 = _e27.xy;
    u_xlat0_.x = _e28.x;
    u_xlat0_.y = _e28.y;
    let _e33 = u_xlat0_;
    let _e35 = u_xlat0_;
    let _e41 = clamp(_e35.xy, vec2(0f), vec2(1f));
    u_xlat0_.x = _e41.x;
    u_xlat0_.y = _e41.y;
    let _e46 = u_xlat0_;
    let _e48 = u_xlat0_;
    let _e50 = vs_TEXCOORD0_1;
    let _e53 = (_e48.xy + -(_e50.xy));
    u_xlat0_.x = _e53.x;
    u_xlat0_.y = _e53.y;
    let _e58 = u_xlat0_;
    let _e63 = _f_buffer1_.f_cb1_[3];
    let _e65 = u_xlat0_;
    let _e68 = vs_TEXCOORD0_1;
    let _e70 = ((_e63.zz * _e65.xy) + _e68.xy);
    u_xlat0_.x = _e70.x;
    u_xlat0_.y = _e70.y;
    let _e75 = u_xlat0_;
    let _e80 = _f_buffer0_.f_cb0_[4];
    let _e85 = hscard_bias.values[0];
    let _e88 = textureSampleBias(f_t0_, samplerf_s0_, _e75.xy, (_e80.x + _e85.x));
    u_xlat0_ = _e88.yzwx;
    let _e90 = u_xlat1_;
    let _e92 = u_xlat0_;
    let _e97 = _f_buffer1_.f_cb1_[2];
    let _e99 = (_e92.wxy + _e97.yyy);
    u_xlat1_.x = _e99.x;
    u_xlat1_.y = _e99.y;
    u_xlat1_.z = _e99.z;
    let _e106 = u_xlat0_;
    let _e111 = _f_buffer1_.f_cb1_[3];
    u_xlat7_ = max(_e106.w, _e111.y);
    let _e114 = u_xlat1_;
    let _e116 = u_xlat7_;
    let _e118 = u_xlat1_;
    let _e120 = (vec3(_e116) * _e118.xyz);
    u_xlat1_.x = _e120.x;
    u_xlat1_.y = _e120.y;
    u_xlat1_.z = _e120.z;
    let _e127 = u_xlat0_;
    let _e129 = u_xlat1_;
    let _e134 = _f_buffer1_.f_cb1_[2];
    let _e136 = (_e129.xyz * _e134.xxx);
    u_xlat0_.x = _e136.x;
    u_xlat0_.y = _e136.y;
    u_xlat0_.z = _e136.z;
    let _e143 = u_xlat0_;
    let _e144 = vs_COLOR0_1;
    SV_Target0_ = (_e143 * _e144);
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
