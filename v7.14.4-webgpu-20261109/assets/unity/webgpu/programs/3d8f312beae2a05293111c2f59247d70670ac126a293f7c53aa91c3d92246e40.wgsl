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
    var u_xlat4_: vec4<f32> = vec4(0f);
    var u_xlat5_: vec4<f32> = vec4(0f);
    var u_xlat7_: f32 = 0f;
    var local: f32;

    let _e51 = vs_TEXCOORD0_1;
    let _e56 = _f_buffer0_.f_cb0_[4];
    let _e61 = hscard_bias.values[0];
    let _e64 = textureSampleBias(f_t0_, samplerf_s0_, _e51.xy, (_e56.x + _e61.x));
    u_xlat0_ = _e64;
    let _e66 = vs_TEXCOORD0_1;
    let _e68 = dpdx(_e66.x);
    u_xlat1_.x = _e68;
    let _e69 = vs_TEXCOORD0_1;
    let _e71 = dpdy(_e69.x);
    u_xlat7_ = _e71;
    let _e73 = u_xlat7_;
    let _e75 = u_xlat1_;
    u_xlat1_.x = (abs(_e73) + abs(_e75.x));
    let _e80 = u_xlat1_;
    u_xlat2_.x = (_e80.x * 0.5f);
    u_xlat2_.y = 0f;
    let _e86 = u_xlat2_;
    let _e88 = vs_TEXCOORD0_1;
    u_xlat2_ = (_e86.xyxx + _e88.xyxy);
    let _e91 = u_xlat2_;
    let _e96 = _f_buffer0_.f_cb0_[4];
    let _e101 = hscard_bias.values[0];
    let _e104 = textureSampleBias(f_t0_, samplerf_s0_, _e91.xy, (_e96.x + _e101.x));
    u_xlat3_ = _e104;
    let _e105 = u_xlat0_;
    let _e106 = u_xlat3_;
    u_xlat0_ = (_e105 + _e106);
    u_xlat1_.y = 0f;
    let _e110 = u_xlat1_;
    let _e112 = vs_TEXCOORD0_1;
    u_xlat3_ = (_e110.xyyx + _e112.xyxy);
    let _e115 = u_xlat3_;
    let _e120 = _f_buffer0_.f_cb0_[4];
    let _e125 = hscard_bias.values[0];
    let _e128 = textureSampleBias(f_t0_, samplerf_s0_, _e115.xy, (_e120.x + _e125.x));
    u_xlat4_ = _e128;
    let _e129 = u_xlat0_;
    let _e130 = u_xlat4_;
    u_xlat0_ = (_e129 + _e130);
    let _e132 = u_xlat1_;
    let _e134 = u_xlat1_;
    let _e139 = (_e134.xx * vec2<f32>(0.5f, 0.5f));
    u_xlat1_.z = _e139.x;
    u_xlat1_.w = _e139.y;
    let _e144 = u_xlat1_;
    let _e146 = vs_TEXCOORD0_1;
    u_xlat4_ = (_e144.yzxz + _e146.xyxy);
    let _e149 = u_xlat4_;
    let _e154 = _f_buffer0_.f_cb0_[4];
    let _e159 = hscard_bias.values[0];
    let _e162 = textureSampleBias(f_t0_, samplerf_s0_, _e149.xy, (_e154.x + _e159.x));
    u_xlat5_ = _e162;
    let _e163 = u_xlat0_;
    let _e164 = u_xlat5_;
    u_xlat0_ = (_e163 + _e164);
    let _e166 = u_xlat2_;
    let _e171 = _f_buffer0_.f_cb0_[4];
    let _e176 = hscard_bias.values[0];
    let _e179 = textureSampleBias(f_t0_, samplerf_s0_, _e166.zw, (_e171.x + _e176.x));
    u_xlat2_ = _e179;
    let _e180 = u_xlat0_;
    let _e181 = u_xlat2_;
    u_xlat0_ = (_e180 + _e181);
    let _e183 = u_xlat4_;
    let _e188 = _f_buffer0_.f_cb0_[4];
    let _e193 = hscard_bias.values[0];
    let _e196 = textureSampleBias(f_t0_, samplerf_s0_, _e183.zw, (_e188.x + _e193.x));
    u_xlat2_ = _e196;
    let _e197 = u_xlat0_;
    let _e198 = u_xlat2_;
    u_xlat0_ = (_e197 + _e198);
    let _e200 = u_xlat3_;
    let _e205 = _f_buffer0_.f_cb0_[4];
    let _e210 = hscard_bias.values[0];
    let _e213 = textureSampleBias(f_t0_, samplerf_s0_, _e200.zw, (_e205.x + _e210.x));
    u_xlat2_ = _e213;
    let _e214 = u_xlat0_;
    let _e215 = u_xlat2_;
    u_xlat0_ = (_e214 + _e215);
    let _e217 = u_xlat1_;
    let _e219 = vs_TEXCOORD0_1;
    u_xlat1_ = (_e217.wxxx + _e219.xyxy);
    let _e222 = u_xlat1_;
    let _e227 = _f_buffer0_.f_cb0_[4];
    let _e232 = hscard_bias.values[0];
    let _e235 = textureSampleBias(f_t0_, samplerf_s0_, _e222.xy, (_e227.x + _e232.x));
    u_xlat2_ = _e235;
    let _e236 = u_xlat0_;
    let _e237 = u_xlat2_;
    u_xlat0_ = (_e236 + _e237);
    let _e239 = u_xlat1_;
    let _e244 = _f_buffer0_.f_cb0_[4];
    let _e249 = hscard_bias.values[0];
    let _e252 = textureSampleBias(f_t0_, samplerf_s0_, _e239.zw, (_e244.x + _e249.x));
    u_xlat1_ = _e252;
    let _e253 = u_xlat0_;
    let _e254 = u_xlat1_;
    u_xlat0_ = (_e253 + _e254);
    let _e256 = u_xlat0_;
    u_xlat0_ = (_e256 * vec4<f32>(0.11111111f, 0.11111111f, 0.11111111f, 0.11111111f));
    let _e267 = _f_buffer2_.f_cb2_[1];
    u_xlatb1_ = (0f < _e267.x);
    let _e270 = u_xlatb1_;
    if _e270 {
        {
            let _e271 = vs_TEXCOORD5_1;
            let _e276 = _f_buffer0_.f_cb0_[4];
            let _e281 = hscard_bias.values[1];
            let _e284 = textureSampleBias(f_t1_, samplerf_s1_, _e271.xy, (_e276.x + _e281.x));
            u_xlat1_ = _e284;
            let _e288 = _f_buffer2_.f_cb2_[3];
            let _e290 = u_xlat1_;
            u_xlatb1_ = (_e288.x < _e290.x);
            let _e294 = u_xlatb1_;
            if _e294 {
                local = 1f;
            } else {
                local = 0f;
            }
            let _e299 = local;
            u_xlat1_.x = _e299;
            let _e301 = u_xlat0_;
            let _e303 = u_xlat1_;
            u_xlat0_.w = (_e301.w * _e303.x);
        }
    }
    let _e307 = vs_NORMAL0_1;
    let _e309 = vs_NORMAL0_1;
    u_xlat1_.x = dot(_e307.xyz, _e309.xyz);
    let _e313 = u_xlat1_;
    u_xlat1_.x = inverseSqrt(_e313.x);
    let _e316 = u_xlat1_;
    let _e318 = u_xlat1_;
    let _e320 = vs_NORMAL0_1;
    let _e322 = (_e318.xxx * _e320.xyz);
    u_xlat1_.x = _e322.x;
    u_xlat1_.y = _e322.y;
    u_xlat1_.z = _e322.z;
    let _e329 = u_xlat2_;
    let _e334 = _f_buffer0_.f_cb0_[6];
    let _e339 = _f_buffer1_.f_cb1_[11];
    let _e341 = (_e334.xyz * _e339.zzz);
    u_xlat2_.x = _e341.x;
    u_xlat2_.y = _e341.y;
    u_xlat2_.z = _e341.z;
    let _e349 = u_xlat1_;
    let _e354 = _f_buffer0_.f_cb0_[5];
    u_xlat1_.x = dot(_e349.xyz, _e354.xyz);
    let _e358 = u_xlat1_;
    u_xlat1_.x = clamp(_e358.x, 0f, 1f);
    let _e363 = u_xlat1_;
    let _e365 = u_xlat2_;
    let _e367 = u_xlat1_;
    let _e370 = vs_TEXCOORD2_1;
    let _e372 = ((_e365.xyz * _e367.xxx) + _e370.xyz);
    u_xlat1_.x = _e372.x;
    u_xlat1_.y = _e372.y;
    u_xlat1_.z = _e372.z;
    let _e379 = u_xlat1_;
    let _e381 = u_xlat0_;
    let _e383 = u_xlat1_;
    let _e385 = (_e381.xyz * _e383.xyz);
    u_xlat1_.x = _e385.x;
    u_xlat1_.y = _e385.y;
    u_xlat1_.z = _e385.z;
    let _e392 = u_xlat0_;
    let _e394 = u_xlat0_;
    let _e396 = u_xlat1_;
    let _e398 = (_e394.www * _e396.xyz);
    u_xlat0_.x = _e398.x;
    u_xlat0_.y = _e398.y;
    u_xlat0_.z = _e398.z;
    let _e405 = u_xlat0_;
    SV_Target0_ = _e405;
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
