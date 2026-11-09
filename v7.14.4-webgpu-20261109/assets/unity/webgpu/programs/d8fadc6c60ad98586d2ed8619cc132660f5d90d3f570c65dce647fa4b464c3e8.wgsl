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
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat4_: f32 = 0f;
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
    u_xlat4_ = _e59;
    let _e61 = u_xlat4_;
    let _e63 = u_xlat1_;
    u_xlat1_.x = (abs(_e61) + abs(_e63.x));
    let _e67 = u_xlat1_;
    let _e77 = vs_TEXCOORD0_1;
    u_xlat1_ = ((_e67.xxxx * vec4<f32>(-0.5f, -0.5f, 0.5f, 0.5f)) + _e77.xyxy);
    let _e80 = u_xlat1_;
    let _e85 = _f_buffer0_.f_cb0_[4];
    let _e90 = hscard_bias.values[0];
    let _e93 = textureSampleBias(f_t0_, samplerf_s0_, _e80.xy, (_e85.x + _e90.x));
    u_xlat2_ = _e93;
    let _e94 = u_xlat0_;
    let _e95 = u_xlat2_;
    u_xlat0_ = (_e94 + _e95);
    let _e97 = u_xlat1_;
    let _e102 = _f_buffer0_.f_cb0_[4];
    let _e107 = hscard_bias.values[0];
    let _e110 = textureSampleBias(f_t0_, samplerf_s0_, _e97.zw, (_e102.x + _e107.x));
    u_xlat1_ = _e110;
    let _e111 = u_xlat0_;
    let _e112 = u_xlat1_;
    u_xlat0_ = (_e111 + _e112);
    let _e114 = u_xlat0_;
    u_xlat0_ = (_e114 * vec4<f32>(0.33333334f, 0.33333334f, 0.33333334f, 0.33333334f));
    let _e125 = _f_buffer2_.f_cb2_[1];
    u_xlatb1_ = (0f < _e125.x);
    let _e128 = u_xlatb1_;
    if _e128 {
        {
            let _e129 = vs_TEXCOORD5_1;
            let _e134 = _f_buffer0_.f_cb0_[4];
            let _e139 = hscard_bias.values[1];
            let _e142 = textureSampleBias(f_t1_, samplerf_s1_, _e129.xy, (_e134.x + _e139.x));
            u_xlat1_ = _e142;
            let _e146 = _f_buffer2_.f_cb2_[3];
            let _e148 = u_xlat1_;
            u_xlatb1_ = (_e146.x < _e148.x);
            let _e152 = u_xlatb1_;
            if _e152 {
                local = 1f;
            } else {
                local = 0f;
            }
            let _e157 = local;
            u_xlat1_.x = _e157;
            let _e159 = u_xlat0_;
            let _e161 = u_xlat1_;
            u_xlat0_.w = (_e159.w * _e161.x);
        }
    }
    let _e165 = vs_NORMAL0_1;
    let _e167 = vs_NORMAL0_1;
    u_xlat1_.x = dot(_e165.xyz, _e167.xyz);
    let _e171 = u_xlat1_;
    u_xlat1_.x = inverseSqrt(_e171.x);
    let _e174 = u_xlat1_;
    let _e176 = u_xlat1_;
    let _e178 = vs_NORMAL0_1;
    let _e180 = (_e176.xxx * _e178.xyz);
    u_xlat1_.x = _e180.x;
    u_xlat1_.y = _e180.y;
    u_xlat1_.z = _e180.z;
    let _e187 = u_xlat2_;
    let _e192 = _f_buffer0_.f_cb0_[6];
    let _e197 = _f_buffer1_.f_cb1_[11];
    let _e199 = (_e192.xyz * _e197.zzz);
    u_xlat2_.x = _e199.x;
    u_xlat2_.y = _e199.y;
    u_xlat2_.z = _e199.z;
    let _e207 = u_xlat1_;
    let _e212 = _f_buffer0_.f_cb0_[5];
    u_xlat1_.x = dot(_e207.xyz, _e212.xyz);
    let _e216 = u_xlat1_;
    u_xlat1_.x = clamp(_e216.x, 0f, 1f);
    let _e221 = u_xlat1_;
    let _e223 = u_xlat2_;
    let _e225 = u_xlat1_;
    let _e228 = vs_TEXCOORD2_1;
    let _e230 = ((_e223.xyz * _e225.xxx) + _e228.xyz);
    u_xlat1_.x = _e230.x;
    u_xlat1_.y = _e230.y;
    u_xlat1_.z = _e230.z;
    let _e237 = u_xlat1_;
    let _e239 = u_xlat0_;
    let _e241 = u_xlat1_;
    let _e243 = (_e239.xyz * _e241.xyz);
    u_xlat1_.x = _e243.x;
    u_xlat1_.y = _e243.y;
    u_xlat1_.z = _e243.z;
    let _e250 = u_xlat0_;
    let _e252 = u_xlat0_;
    let _e254 = u_xlat1_;
    let _e256 = (_e252.www * _e254.xyz);
    u_xlat0_.x = _e256.x;
    u_xlat0_.y = _e256.y;
    u_xlat0_.z = _e256.z;
    let _e263 = u_xlat0_;
    SV_Target0_ = _e263;
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
