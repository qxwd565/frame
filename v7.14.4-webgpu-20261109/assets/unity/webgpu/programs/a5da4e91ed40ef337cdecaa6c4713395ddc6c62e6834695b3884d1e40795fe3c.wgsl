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
var<private> vs_TEXCOORD5_1: vec2<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlatb1_: bool = false;
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec4<f32> = vec4(0f);
    var u_xlat5_: f32 = 0f;
    var local: f32;

    let _e39 = vs_TEXCOORD0_1;
    let _e44 = _f_buffer0_.f_cb0_[4];
    let _e49 = hscard_bias.values[0];
    let _e52 = textureSampleBias(f_t0_, samplerf_s0_, _e39.xy, (_e44.x + _e49.x));
    u_xlat0_ = _e52;
    let _e54 = vs_TEXCOORD0_1;
    let _e56 = dpdx(_e54.x);
    u_xlat1_.x = _e56;
    let _e57 = vs_TEXCOORD0_1;
    let _e59 = dpdy(_e57.x);
    u_xlat5_ = _e59;
    let _e61 = u_xlat5_;
    let _e63 = u_xlat1_;
    u_xlat1_.x = (abs(_e61) + abs(_e63.x));
    let _e67 = u_xlat1_;
    let _e69 = u_xlat1_;
    let _e75 = (_e69.xx * vec2<f32>(0.5f, -0.5f));
    u_xlat1_.x = _e75.x;
    u_xlat1_.y = _e75.y;
    u_xlat1_.z = 0f;
    let _e82 = u_xlat1_;
    let _e84 = vs_TEXCOORD0_1;
    u_xlat2_ = (_e82.xzyz + _e84.xyxy);
    let _e87 = u_xlat2_;
    let _e92 = _f_buffer0_.f_cb0_[4];
    let _e97 = hscard_bias.values[0];
    let _e100 = textureSampleBias(f_t0_, samplerf_s0_, _e87.xy, (_e92.x + _e97.x));
    u_xlat3_ = _e100;
    let _e101 = u_xlat0_;
    let _e102 = u_xlat3_;
    u_xlat0_ = (_e101 + _e102);
    let _e104 = u_xlat2_;
    let _e109 = _f_buffer0_.f_cb0_[4];
    let _e114 = hscard_bias.values[0];
    let _e117 = textureSampleBias(f_t0_, samplerf_s0_, _e104.zw, (_e109.x + _e114.x));
    u_xlat2_ = _e117;
    let _e118 = u_xlat0_;
    let _e119 = u_xlat2_;
    u_xlat0_ = (_e118 + _e119);
    let _e121 = u_xlat1_;
    let _e123 = vs_TEXCOORD0_1;
    u_xlat1_ = (_e121.zxzy + _e123.xyxy);
    let _e126 = u_xlat1_;
    let _e131 = _f_buffer0_.f_cb0_[4];
    let _e136 = hscard_bias.values[0];
    let _e139 = textureSampleBias(f_t0_, samplerf_s0_, _e126.xy, (_e131.x + _e136.x));
    u_xlat2_ = _e139;
    let _e140 = u_xlat0_;
    let _e141 = u_xlat2_;
    u_xlat0_ = (_e140 + _e141);
    let _e143 = u_xlat1_;
    let _e148 = _f_buffer0_.f_cb0_[4];
    let _e153 = hscard_bias.values[0];
    let _e156 = textureSampleBias(f_t0_, samplerf_s0_, _e143.zw, (_e148.x + _e153.x));
    u_xlat1_ = _e156;
    let _e157 = u_xlat0_;
    let _e158 = u_xlat1_;
    u_xlat0_ = (_e157 + _e158);
    let _e160 = u_xlat0_;
    u_xlat0_ = (_e160 * vec4<f32>(0.2f, 0.2f, 0.2f, 0.2f));
    let _e171 = _f_buffer1_.f_cb1_[1];
    u_xlatb1_ = (0f < _e171.x);
    let _e174 = u_xlatb1_;
    if _e174 {
        {
            let _e175 = vs_TEXCOORD5_1;
            let _e180 = _f_buffer0_.f_cb0_[4];
            let _e185 = hscard_bias.values[1];
            let _e188 = textureSampleBias(f_t1_, samplerf_s1_, _e175.xy, (_e180.x + _e185.x));
            u_xlat1_ = _e188;
            let _e192 = _f_buffer1_.f_cb1_[3];
            let _e194 = u_xlat1_;
            u_xlatb1_ = (_e192.x < _e194.x);
            let _e198 = u_xlatb1_;
            if _e198 {
                local = 1f;
            } else {
                local = 0f;
            }
            let _e203 = local;
            u_xlat1_.x = _e203;
            let _e205 = u_xlat0_;
            let _e207 = u_xlat1_;
            SV_Target0_.w = (_e205.w * _e207.x);
        }
    } else {
        {
            let _e211 = u_xlat0_;
            SV_Target0_.w = _e211.w;
        }
    }
    let _e213 = SV_Target0_;
    let _e215 = u_xlat0_;
    let _e217 = vs_COLOR0_1;
    let _e219 = (_e215.xyz * _e217.xyz);
    SV_Target0_.x = _e219.x;
    SV_Target0_.y = _e219.y;
    SV_Target0_.z = _e219.z;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(5) vs_TEXCOORD5_: vec2<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD5_1 = vs_TEXCOORD5_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e32 = SV_Target0_;
    return FragmentOutput(_e32);
}
