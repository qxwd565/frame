struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 7>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 12>,
}

struct f_buffer2_ {
    f_cb2_: array<vec4<f32>, 4>,
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
@group(1) @binding(2) 
var<uniform> _f_buffer2_: f_buffer2_;
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
var<private> vs_TEXCOORD2_1: vec3<f32>;
var<private> vs_NORMAL0_1: vec3<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlatb1_: bool = false;
    var u_xlat2_: vec3<f32> = vec3(0f);
    var local: f32;

    let _e36 = vs_TEXCOORD0_1;
    let _e41 = _f_buffer0_.f_cb0_[4];
    let _e46 = hscard_bias.values[0];
    let _e49 = textureSampleBias(f_t0_, samplerf_s0_, _e36.xy, (_e41.x + _e46.x));
    u_xlat0_ = _e49;
    let _e54 = _f_buffer2_.f_cb2_[1];
    u_xlatb1_ = (0f < _e54.x);
    let _e57 = u_xlatb1_;
    if _e57 {
        {
            let _e58 = vs_TEXCOORD5_1;
            let _e63 = _f_buffer0_.f_cb0_[4];
            let _e68 = hscard_bias.values[1];
            let _e71 = textureSampleBias(f_t1_, samplerf_s1_, _e58.xy, (_e63.x + _e68.x));
            u_xlat1_ = _e71;
            let _e75 = _f_buffer2_.f_cb2_[3];
            let _e77 = u_xlat1_;
            u_xlatb1_ = (_e75.x < _e77.x);
            let _e81 = u_xlatb1_;
            if _e81 {
                local = 1f;
            } else {
                local = 0f;
            }
            let _e86 = local;
            u_xlat1_.x = _e86;
            let _e88 = u_xlat0_;
            let _e90 = u_xlat1_;
            u_xlat0_.w = (_e88.w * _e90.x);
        }
    }
    let _e94 = vs_NORMAL0_1;
    let _e96 = vs_NORMAL0_1;
    u_xlat1_.x = dot(_e94.xyz, _e96.xyz);
    let _e100 = u_xlat1_;
    u_xlat1_.x = inverseSqrt(_e100.x);
    let _e103 = u_xlat1_;
    let _e105 = u_xlat1_;
    let _e107 = vs_NORMAL0_1;
    let _e109 = (_e105.xxx * _e107.xyz);
    u_xlat1_.x = _e109.x;
    u_xlat1_.y = _e109.y;
    u_xlat1_.z = _e109.z;
    let _e116 = u_xlat2_;
    let _e121 = _f_buffer0_.f_cb0_[6];
    let _e126 = _f_buffer1_.f_cb1_[11];
    let _e128 = (_e121.xyz * _e126.zzz);
    u_xlat2_.x = _e128.x;
    u_xlat2_.y = _e128.y;
    u_xlat2_.z = _e128.z;
    let _e136 = u_xlat1_;
    let _e141 = _f_buffer0_.f_cb0_[5];
    u_xlat1_.x = dot(_e136.xyz, _e141.xyz);
    let _e145 = u_xlat1_;
    u_xlat1_.x = clamp(_e145.x, 0f, 1f);
    let _e150 = u_xlat1_;
    let _e152 = u_xlat2_;
    let _e154 = u_xlat1_;
    let _e157 = vs_TEXCOORD2_1;
    let _e159 = ((_e152.xyz * _e154.xxx) + _e157.xyz);
    u_xlat1_.x = _e159.x;
    u_xlat1_.y = _e159.y;
    u_xlat1_.z = _e159.z;
    let _e166 = u_xlat1_;
    let _e168 = u_xlat0_;
    let _e170 = u_xlat1_;
    let _e172 = (_e168.xyz * _e170.xyz);
    u_xlat1_.x = _e172.x;
    u_xlat1_.y = _e172.y;
    u_xlat1_.z = _e172.z;
    let _e179 = u_xlat0_;
    let _e181 = u_xlat0_;
    let _e183 = u_xlat1_;
    let _e185 = (_e181.www * _e183.xyz);
    u_xlat0_.x = _e185.x;
    u_xlat0_.y = _e185.y;
    u_xlat0_.z = _e185.z;
    let _e192 = u_xlat0_;
    SV_Target0_ = _e192;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(5) vs_TEXCOORD5_: vec2<f32>, @location(2) vs_TEXCOORD2_: vec3<f32>, @location(12) vs_NORMAL0_: vec3<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD5_1 = vs_TEXCOORD5_;
    vs_TEXCOORD2_1 = vs_TEXCOORD2_;
    vs_NORMAL0_1 = vs_NORMAL0_;
    main_1();
    let _e39 = SV_Target0_;
    return FragmentOutput(_e39);
}
