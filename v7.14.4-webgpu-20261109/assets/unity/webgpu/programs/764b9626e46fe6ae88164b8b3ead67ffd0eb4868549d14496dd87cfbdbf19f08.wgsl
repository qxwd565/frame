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
    @location(0) SV_TARGET0_: vec4<f32>,
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
var<private> SV_TARGET0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlatb0_: bool = false;
    var u_xlat1_: f32 = 0f;
    var u_xlat2_: f32 = 0f;
    var u_xlati2_: i32 = 0i;
    var u_xlatb3_: bool = false;
    var local: u32;
    var local_1: f32;
    var local_2: i32;
    var local_3: f32;

    let _e32 = vs_TEXCOORD0_1;
    let _e37 = _f_buffer0_.f_cb0_[4];
    let _e42 = hscard_bias.values[0];
    let _e45 = textureSampleBias(f_t0_, samplerf_s0_, _e32.xy, (_e37.x + _e42.x));
    u_xlat0_ = _e45;
    let _e47 = u_xlat0_;
    let _e52 = _f_buffer1_.f_cb1_[2];
    u_xlat0_.x = (_e47.w * _e52.w);
    let _e55 = u_xlat0_;
    let _e60 = _f_buffer1_.f_cb1_[2];
    let _e66 = _f_buffer1_.f_cb1_[5];
    u_xlat1_ = ((_e55.w * _e60.w) + -(_e66.x));
    let _e70 = u_xlat0_;
    let _e72 = dpdx(_e70.x);
    u_xlat2_ = _e72;
    let _e74 = u_xlat0_;
    let _e76 = dpdy(_e74.x);
    u_xlat0_.x = _e76;
    let _e78 = u_xlat0_;
    let _e81 = u_xlat2_;
    u_xlat0_.x = (abs(_e78.x) + abs(_e81));
    let _e84 = u_xlat0_;
    let _e89 = u_xlat1_;
    u_xlat2_ = ((-(_e84.x) * 0.5f) + _e89);
    let _e92 = u_xlat0_;
    u_xlat0_.x = max(_e92.x, 0.0001f);
    let _e97 = u_xlat2_;
    let _e98 = u_xlat0_;
    u_xlat0_.x = (_e97 / _e98.x);
    let _e102 = u_xlat0_;
    u_xlat0_.x = (_e102.x + 1f);
    let _e107 = u_xlat0_;
    u_xlat0_.x = clamp(_e107.x, 0f, 1f);
    let _e113 = u_xlat0_;
    u_xlat0_.x = (_e113.x + -0.0001f);
    let _e122 = _f_buffer1_.f_cb1_[5];
    if (0f >= _e122.x) {
        local = 4294967295u;
    } else {
        local = 0u;
    }
    let _e129 = local;
    u_xlati2_ = i32(_e129);
    let _e132 = u_xlati2_;
    if (_e132 != 0i) {
        local_1 = 0.9999f;
    } else {
        let _e136 = u_xlat0_;
        local_1 = _e136.x;
    }
    let _e139 = local_1;
    u_xlat0_.x = _e139;
    let _e140 = u_xlati2_;
    u_xlati2_ = ~(_e140);
    let _e145 = _f_buffer0_.f_cb0_[4];
    u_xlatb3_ = (_e145.z != 0f);
    let _e149 = u_xlatb3_;
    if _e149 {
        let _e150 = u_xlati2_;
        local_2 = _e150;
    } else {
        local_2 = 0i;
    }
    let _e154 = local_2;
    u_xlati2_ = _e154;
    let _e156 = u_xlati2_;
    if (_e156 != 0i) {
        let _e159 = u_xlat0_;
        local_3 = _e159.x;
    } else {
        let _e161 = u_xlat1_;
        local_3 = _e161;
    }
    let _e163 = local_3;
    u_xlat0_.x = _e163;
    let _e164 = u_xlat0_;
    u_xlatb0_ = (_e164.x < 0f);
    let _e168 = u_xlatb0_;
    if ((select(0i, 1i, _e168) * -1i) != 0i) {
        {
            discard;
        }
    }
    SV_TARGET0_ = vec4<f32>(0f, 0f, 0f, 0f);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    main_1();
    let _e20 = SV_TARGET0_;
    return FragmentOutput(_e20);
}
