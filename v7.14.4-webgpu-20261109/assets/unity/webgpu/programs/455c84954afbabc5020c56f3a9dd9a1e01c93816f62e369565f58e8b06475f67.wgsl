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
    var local: f32;

    let _e28 = vs_TEXCOORD0_1;
    let _e33 = _f_buffer0_.f_cb0_[4];
    let _e38 = hscard_bias.values[0];
    let _e41 = textureSampleBias(f_t0_, samplerf_s0_, _e28.xy, (_e33.x + _e38.x));
    u_xlat0_ = _e41;
    let _e46 = _f_buffer1_.f_cb1_[1];
    u_xlatb1_ = (0f < _e46.x);
    let _e49 = u_xlatb1_;
    if _e49 {
        {
            let _e50 = vs_TEXCOORD5_1;
            let _e55 = _f_buffer0_.f_cb0_[4];
            let _e60 = hscard_bias.values[1];
            let _e63 = textureSampleBias(f_t1_, samplerf_s1_, _e50.xy, (_e55.x + _e60.x));
            u_xlat1_ = _e63;
            let _e67 = _f_buffer1_.f_cb1_[3];
            let _e69 = u_xlat1_;
            u_xlatb1_ = (_e67.x < _e69.x);
            let _e73 = u_xlatb1_;
            if _e73 {
                local = 1f;
            } else {
                local = 0f;
            }
            let _e78 = local;
            u_xlat1_.x = _e78;
            let _e80 = u_xlat0_;
            let _e82 = u_xlat1_;
            SV_Target0_.w = (_e80.w * _e82.x);
        }
    } else {
        {
            let _e86 = u_xlat0_;
            SV_Target0_.w = _e86.w;
        }
    }
    let _e88 = SV_Target0_;
    let _e90 = u_xlat0_;
    let _e92 = vs_COLOR0_1;
    let _e94 = (_e90.xyz * _e92.xyz);
    SV_Target0_.x = _e94.x;
    SV_Target0_.y = _e94.y;
    SV_Target0_.z = _e94.z;
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
