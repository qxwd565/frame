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
    var u_xlat3_: vec4<f32> = vec4(0f);
    var u_xlat5_: f32 = 0f;
    var local: f32;

    let _e43 = vs_TEXCOORD0_1;
    let _e48 = _f_buffer0_.f_cb0_[4];
    let _e53 = hscard_bias.values[0];
    let _e56 = textureSampleBias(f_t0_, samplerf_s0_, _e43.xy, (_e48.x + _e53.x));
    u_xlat0_ = _e56;
    let _e58 = vs_TEXCOORD0_1;
    let _e60 = dpdx(_e58.x);
    u_xlat1_.x = _e60;
    let _e61 = vs_TEXCOORD0_1;
    let _e63 = dpdy(_e61.x);
    u_xlat5_ = _e63;
    let _e65 = u_xlat5_;
    let _e67 = u_xlat1_;
    u_xlat1_.x = (abs(_e65) + abs(_e67.x));
    let _e71 = u_xlat1_;
    let _e73 = u_xlat1_;
    let _e79 = (_e73.xx * vec2<f32>(0.5f, -0.5f));
    u_xlat1_.x = _e79.x;
    u_xlat1_.y = _e79.y;
    u_xlat1_.z = 0f;
    let _e86 = u_xlat1_;
    let _e88 = vs_TEXCOORD0_1;
    u_xlat2_ = (_e86.xzyz + _e88.xyxy);
    let _e91 = u_xlat2_;
    let _e96 = _f_buffer0_.f_cb0_[4];
    let _e101 = hscard_bias.values[0];
    let _e104 = textureSampleBias(f_t0_, samplerf_s0_, _e91.xy, (_e96.x + _e101.x));
    u_xlat3_ = _e104;
    let _e105 = u_xlat0_;
    let _e106 = u_xlat3_;
    u_xlat0_ = (_e105 + _e106);
    let _e108 = u_xlat2_;
    let _e113 = _f_buffer0_.f_cb0_[4];
    let _e118 = hscard_bias.values[0];
    let _e121 = textureSampleBias(f_t0_, samplerf_s0_, _e108.zw, (_e113.x + _e118.x));
    u_xlat2_ = _e121;
    let _e122 = u_xlat0_;
    let _e123 = u_xlat2_;
    u_xlat0_ = (_e122 + _e123);
    let _e125 = u_xlat1_;
    let _e127 = vs_TEXCOORD0_1;
    u_xlat1_ = (_e125.zxzy + _e127.xyxy);
    let _e130 = u_xlat1_;
    let _e135 = _f_buffer0_.f_cb0_[4];
    let _e140 = hscard_bias.values[0];
    let _e143 = textureSampleBias(f_t0_, samplerf_s0_, _e130.xy, (_e135.x + _e140.x));
    u_xlat2_ = _e143;
    let _e144 = u_xlat0_;
    let _e145 = u_xlat2_;
    u_xlat0_ = (_e144 + _e145);
    let _e147 = u_xlat1_;
    let _e152 = _f_buffer0_.f_cb0_[4];
    let _e157 = hscard_bias.values[0];
    let _e160 = textureSampleBias(f_t0_, samplerf_s0_, _e147.zw, (_e152.x + _e157.x));
    u_xlat1_ = _e160;
    let _e161 = u_xlat0_;
    let _e162 = u_xlat1_;
    u_xlat0_ = (_e161 + _e162);
    let _e164 = u_xlat0_;
    u_xlat0_ = (_e164 * vec4<f32>(0.2f, 0.2f, 0.2f, 0.2f));
    let _e175 = _f_buffer2_.f_cb2_[1];
    u_xlatb1_ = (0f < _e175.x);
    let _e178 = u_xlatb1_;
    if _e178 {
        {
            let _e179 = vs_TEXCOORD5_1;
            let _e184 = _f_buffer0_.f_cb0_[4];
            let _e189 = hscard_bias.values[1];
            let _e192 = textureSampleBias(f_t1_, samplerf_s1_, _e179.xy, (_e184.x + _e189.x));
            u_xlat1_ = _e192;
            let _e196 = _f_buffer2_.f_cb2_[3];
            let _e198 = u_xlat1_;
            u_xlatb1_ = (_e196.x < _e198.x);
            let _e202 = u_xlatb1_;
            if _e202 {
                local = 1f;
            } else {
                local = 0f;
            }
            let _e207 = local;
            u_xlat1_.x = _e207;
            let _e209 = u_xlat0_;
            let _e211 = u_xlat1_;
            u_xlat0_.w = (_e209.w * _e211.x);
        }
    }
    let _e215 = vs_NORMAL0_1;
    let _e217 = vs_NORMAL0_1;
    u_xlat1_.x = dot(_e215.xyz, _e217.xyz);
    let _e221 = u_xlat1_;
    u_xlat1_.x = inverseSqrt(_e221.x);
    let _e224 = u_xlat1_;
    let _e226 = u_xlat1_;
    let _e228 = vs_NORMAL0_1;
    let _e230 = (_e226.xxx * _e228.xyz);
    u_xlat1_.x = _e230.x;
    u_xlat1_.y = _e230.y;
    u_xlat1_.z = _e230.z;
    let _e237 = u_xlat2_;
    let _e242 = _f_buffer0_.f_cb0_[6];
    let _e247 = _f_buffer1_.f_cb1_[11];
    let _e249 = (_e242.xyz * _e247.zzz);
    u_xlat2_.x = _e249.x;
    u_xlat2_.y = _e249.y;
    u_xlat2_.z = _e249.z;
    let _e257 = u_xlat1_;
    let _e262 = _f_buffer0_.f_cb0_[5];
    u_xlat1_.x = dot(_e257.xyz, _e262.xyz);
    let _e266 = u_xlat1_;
    u_xlat1_.x = clamp(_e266.x, 0f, 1f);
    let _e271 = u_xlat1_;
    let _e273 = u_xlat2_;
    let _e275 = u_xlat1_;
    let _e278 = vs_TEXCOORD2_1;
    let _e280 = ((_e273.xyz * _e275.xxx) + _e278.xyz);
    u_xlat1_.x = _e280.x;
    u_xlat1_.y = _e280.y;
    u_xlat1_.z = _e280.z;
    let _e287 = u_xlat1_;
    let _e289 = u_xlat0_;
    let _e291 = u_xlat1_;
    let _e293 = (_e289.xyz * _e291.xyz);
    u_xlat1_.x = _e293.x;
    u_xlat1_.y = _e293.y;
    u_xlat1_.z = _e293.z;
    let _e300 = u_xlat0_;
    let _e302 = u_xlat0_;
    let _e304 = u_xlat1_;
    let _e306 = (_e302.www * _e304.xyz);
    u_xlat0_.x = _e306.x;
    u_xlat0_.y = _e306.y;
    u_xlat0_.z = _e306.z;
    let _e313 = u_xlat0_;
    SV_Target0_ = _e313;
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
