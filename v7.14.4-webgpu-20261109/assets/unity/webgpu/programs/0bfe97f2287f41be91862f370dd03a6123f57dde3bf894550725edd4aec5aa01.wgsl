struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 6>,
}

struct FragmentOutput {
    @location(0) SV_TARGET0_: f32,
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
var<private> SV_TARGET0_: f32;
var<private> gl_FragCoord_1: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlatb0_: bool = false;
    var u_xlat1_: f32 = 0f;
    var u_xlat2_: f32 = 0f;
    var u_xlati2_: i32 = 0i;
    var u_xlatb3_: bool = false;
    var hlslcc_FragCoord: vec4<f32>;
    var local: u32;
    var local_1: f32;
    var local_2: i32;
    var local_3: f32;

    let _e33 = gl_FragCoord_1;
    let _e34 = _e33.xyz;
    let _e36 = gl_FragCoord_1;
    hlslcc_FragCoord = vec4<f32>(_e34.x, _e34.y, _e34.z, (1f / _e36.w));
    let _e44 = vs_TEXCOORD0_1;
    let _e49 = _f_buffer0_.f_cb0_[4];
    let _e54 = hscard_bias.values[0];
    let _e57 = textureSampleBias(f_t0_, samplerf_s0_, _e44.xy, (_e49.x + _e54.x));
    u_xlat0_ = _e57;
    let _e59 = u_xlat0_;
    let _e64 = _f_buffer1_.f_cb1_[2];
    u_xlat0_.x = (_e59.w * _e64.w);
    let _e67 = u_xlat0_;
    let _e72 = _f_buffer1_.f_cb1_[2];
    let _e78 = _f_buffer1_.f_cb1_[5];
    u_xlat1_ = ((_e67.w * _e72.w) + -(_e78.x));
    let _e82 = u_xlat0_;
    let _e84 = dpdx(_e82.x);
    u_xlat2_ = _e84;
    let _e86 = u_xlat0_;
    let _e88 = dpdy(_e86.x);
    u_xlat0_.x = _e88;
    let _e90 = u_xlat0_;
    let _e93 = u_xlat2_;
    u_xlat0_.x = (abs(_e90.x) + abs(_e93));
    let _e96 = u_xlat0_;
    let _e101 = u_xlat1_;
    u_xlat2_ = ((-(_e96.x) * 0.5f) + _e101);
    let _e104 = u_xlat0_;
    u_xlat0_.x = max(_e104.x, 0.0001f);
    let _e109 = u_xlat2_;
    let _e110 = u_xlat0_;
    u_xlat0_.x = (_e109 / _e110.x);
    let _e114 = u_xlat0_;
    u_xlat0_.x = (_e114.x + 1f);
    let _e119 = u_xlat0_;
    u_xlat0_.x = clamp(_e119.x, 0f, 1f);
    let _e125 = u_xlat0_;
    u_xlat0_.x = (_e125.x + -0.0001f);
    let _e134 = _f_buffer1_.f_cb1_[5];
    if (0f >= _e134.x) {
        local = 4294967295u;
    } else {
        local = 0u;
    }
    let _e141 = local;
    u_xlati2_ = i32(_e141);
    let _e144 = u_xlati2_;
    if (_e144 != 0i) {
        local_1 = 0.9999f;
    } else {
        let _e148 = u_xlat0_;
        local_1 = _e148.x;
    }
    let _e151 = local_1;
    u_xlat0_.x = _e151;
    let _e152 = u_xlati2_;
    u_xlati2_ = ~(_e152);
    let _e157 = _f_buffer0_.f_cb0_[4];
    u_xlatb3_ = (_e157.z != 0f);
    let _e161 = u_xlatb3_;
    if _e161 {
        let _e162 = u_xlati2_;
        local_2 = _e162;
    } else {
        local_2 = 0i;
    }
    let _e166 = local_2;
    u_xlati2_ = _e166;
    let _e168 = u_xlati2_;
    if (_e168 != 0i) {
        let _e171 = u_xlat0_;
        local_3 = _e171.x;
    } else {
        let _e173 = u_xlat1_;
        local_3 = _e173;
    }
    let _e175 = local_3;
    u_xlat0_.x = _e175;
    let _e176 = u_xlat0_;
    u_xlatb0_ = (_e176.x < 0f);
    let _e180 = u_xlatb0_;
    if ((select(0i, 1i, _e180) * -1i) != 0i) {
        {
            discard;
        }
    }
    let _e189 = hlslcc_FragCoord;
    SV_TARGET0_ = _e189.z;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @builtin(position) gl_FragCoord: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    gl_FragCoord_1 = gl_FragCoord;
    main_1();
    let _e22 = SV_TARGET0_;
    return FragmentOutput(_e22);
}
