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
    var u_xlat4_: f32 = 0f;
    var local: f32;

    let _e35 = vs_TEXCOORD0_1;
    let _e40 = _f_buffer0_.f_cb0_[4];
    let _e45 = hscard_bias.values[0];
    let _e48 = textureSampleBias(f_t0_, samplerf_s0_, _e35.xy, (_e40.x + _e45.x));
    u_xlat0_ = _e48;
    let _e50 = vs_TEXCOORD0_1;
    let _e52 = dpdx(_e50.x);
    u_xlat1_.x = _e52;
    let _e53 = vs_TEXCOORD0_1;
    let _e55 = dpdy(_e53.x);
    u_xlat4_ = _e55;
    let _e57 = u_xlat4_;
    let _e59 = u_xlat1_;
    u_xlat1_.x = (abs(_e57) + abs(_e59.x));
    let _e63 = u_xlat1_;
    let _e73 = vs_TEXCOORD0_1;
    u_xlat1_ = ((_e63.xxxx * vec4<f32>(-0.5f, -0.5f, 0.5f, 0.5f)) + _e73.xyxy);
    let _e76 = u_xlat1_;
    let _e81 = _f_buffer0_.f_cb0_[4];
    let _e86 = hscard_bias.values[0];
    let _e89 = textureSampleBias(f_t0_, samplerf_s0_, _e76.xy, (_e81.x + _e86.x));
    u_xlat2_ = _e89;
    let _e90 = u_xlat0_;
    let _e91 = u_xlat2_;
    u_xlat0_ = (_e90 + _e91);
    let _e93 = u_xlat1_;
    let _e98 = _f_buffer0_.f_cb0_[4];
    let _e103 = hscard_bias.values[0];
    let _e106 = textureSampleBias(f_t0_, samplerf_s0_, _e93.zw, (_e98.x + _e103.x));
    u_xlat1_ = _e106;
    let _e107 = u_xlat0_;
    let _e108 = u_xlat1_;
    u_xlat0_ = (_e107 + _e108);
    let _e110 = u_xlat0_;
    u_xlat0_ = (_e110 * vec4<f32>(0.33333334f, 0.33333334f, 0.33333334f, 0.33333334f));
    let _e121 = _f_buffer1_.f_cb1_[1];
    u_xlatb1_ = (0f < _e121.x);
    let _e124 = u_xlatb1_;
    if _e124 {
        {
            let _e125 = vs_TEXCOORD5_1;
            let _e130 = _f_buffer0_.f_cb0_[4];
            let _e135 = hscard_bias.values[1];
            let _e138 = textureSampleBias(f_t1_, samplerf_s1_, _e125.xy, (_e130.x + _e135.x));
            u_xlat1_ = _e138;
            let _e142 = _f_buffer1_.f_cb1_[3];
            let _e144 = u_xlat1_;
            u_xlatb1_ = (_e142.x < _e144.x);
            let _e148 = u_xlatb1_;
            if _e148 {
                local = 1f;
            } else {
                local = 0f;
            }
            let _e153 = local;
            u_xlat1_.x = _e153;
            let _e155 = u_xlat0_;
            let _e157 = u_xlat1_;
            SV_Target0_.w = (_e155.w * _e157.x);
        }
    } else {
        {
            let _e161 = u_xlat0_;
            SV_Target0_.w = _e161.w;
        }
    }
    let _e163 = SV_Target0_;
    let _e165 = u_xlat0_;
    let _e167 = vs_COLOR0_1;
    let _e169 = (_e165.xyz * _e167.xyz);
    SV_Target0_.x = _e169.x;
    SV_Target0_.y = _e169.y;
    SV_Target0_.z = _e169.z;
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
