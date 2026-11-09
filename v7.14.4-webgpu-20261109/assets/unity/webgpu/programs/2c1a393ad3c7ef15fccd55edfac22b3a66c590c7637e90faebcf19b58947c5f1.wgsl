struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 11>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 1024>,
}

struct f_buffer2_ {
    f_cb2_: array<vec4<f32>, 30>,
}

struct f_buffer3_ {
    f_cb3_: array<vec4<f32>, 28>,
}

struct f_buffer4_ {
    f_cb4_: array<vec4<f32>, 2>,
}

struct FragmentOutput {
    @location(0) SV_Target0_: vec4<f32>,
}

const ImmCB_0_: array<vec4<u32>, 4> = array<vec4<u32>, 4>(vec4<u32>(1065353216u, 0u, 0u, 0u), vec4<u32>(0u, 1065353216u, 0u, 0u), vec4<u32>(0u, 0u, 1065353216u, 0u), vec4<u32>(0u, 0u, 0u, 1065353216u));

@group(1) @binding(31) 
var<uniform> hscard_bias: HScardSamplerBias;
@group(1) @binding(0) 
var<uniform> _f_buffer0_: f_buffer0_;
@group(1) @binding(1) 
var<uniform> _f_buffer1_: f_buffer1_;
@group(1) @binding(2) 
var<uniform> _f_buffer2_: f_buffer2_;
@group(1) @binding(3) 
var<uniform> _f_buffer3_: f_buffer3_;
@group(1) @binding(4) 
var<uniform> _f_buffer4_: f_buffer4_;
@group(3) @binding(1) 
var samplerf_s0_: sampler_comparison;
@group(3) @binding(3) 
var samplerf_s1_: sampler;
@group(3) @binding(0) 
var f_t0_: texture_depth_2d;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD1_1: vec3<f32>;
var<private> vs_TEXCOORDindex3_1: vec4<f32>;
var<private> vs_NORMAL0_1: vec3<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec3<f32> = vec3(0f);
    var u_xlat2_: vec3<f32> = vec3(0f);
    var u_xlatb2_: bool = false;
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: f32 = 0f;
    var u_xlati4_: i32 = 0i;
    var u_xlatu4_: u32 = 0u;
    var u_xlatb4_: bool = false;
    var u_xlat5_: vec3<f32> = vec3(0f);
    var u_xlatb8_: bool = false;
    var u_xlat10_: vec3<f32> = vec3(0f);
    var u_xlati10_: i32 = 0i;
    var u_xlat11_: f32 = 0f;
    var u_xlat19_: f32 = 0f;
    var u_xlat20_: f32 = 0f;
    var u_xlatu20_: u32 = 0u;
    var u_xlatu21_: u32 = 0u;
    var txVec0_: vec3<f32>;
    var local: f32;
    var u_xlatu_loop_1_: u32 = 0u;
    var local_1: array<vec4<u32>, 4> = ImmCB_0_;

    let _e88 = vs_TEXCOORD0_1;
    let _e93 = _f_buffer0_.f_cb0_[4];
    let _e98 = hscard_bias.values[1];
    let _e101 = textureSampleBias(f_t1_, samplerf_s1_, _e88.xy, (_e93.x + _e98.x));
    u_xlat0_ = _e101;
    let _e102 = u_xlat0_;
    let _e106 = _f_buffer4_.f_cb4_[1];
    u_xlat0_ = (_e102 * _e106);
    let _e109 = vs_NORMAL0_1;
    let _e111 = vs_NORMAL0_1;
    u_xlat1_.x = dot(_e109.xyz, _e111.xyz);
    let _e115 = u_xlat1_;
    u_xlat1_.x = inverseSqrt(_e115.x);
    let _e118 = u_xlat1_;
    let _e120 = u_xlat1_;
    let _e122 = vs_NORMAL0_1;
    let _e124 = (_e120.xxx * _e122.xyz);
    u_xlat1_.x = _e124.x;
    u_xlat1_.y = _e124.y;
    u_xlat1_.z = _e124.z;
    let _e131 = vs_TEXCOORDindex3_1;
    let _e132 = _e131.xy;
    let _e133 = vs_TEXCOORDindex3_1;
    txVec0_ = vec3<f32>(_e132.x, _e132.y, _e133.z);
    let _e139 = txVec0_;
    let _e143 = textureSampleCompareLevel(f_t0_, samplerf_s0_, _e139.xy, _e139.z);
    u_xlat19_ = _e143;
    let _e148 = _f_buffer3_.f_cb3_[27];
    u_xlat2_.x = (-(_e148.x) + 1f);
    let _e153 = u_xlat19_;
    let _e157 = _f_buffer3_.f_cb3_[27];
    let _e160 = u_xlat2_;
    u_xlat19_ = ((_e153 * _e157.x) + _e160.x);
    let _e164 = vs_TEXCOORDindex3_1;
    u_xlatb2_ = (0f >= _e164.z);
    let _e167 = vs_TEXCOORDindex3_1;
    u_xlatb8_ = (_e167.z >= 1f);
    let _e171 = u_xlatb8_;
    let _e172 = u_xlatb2_;
    u_xlatb2_ = (_e171 || _e172);
    let _e174 = u_xlatb2_;
    if _e174 {
        local = 1f;
    } else {
        let _e176 = u_xlat19_;
        local = _e176;
    }
    let _e178 = local;
    u_xlat19_ = _e178;
    let _e179 = u_xlat19_;
    let _e183 = _f_buffer2_.f_cb2_[11];
    u_xlat19_ = (_e179 * _e183.z);
    let _e186 = u_xlat2_;
    let _e188 = u_xlat19_;
    let _e193 = _f_buffer0_.f_cb0_[6];
    let _e195 = (vec3(_e188) * _e193.xyz);
    u_xlat2_.x = _e195.x;
    u_xlat2_.y = _e195.y;
    u_xlat2_.z = _e195.z;
    let _e202 = u_xlat1_;
    let _e207 = _f_buffer0_.f_cb0_[5];
    u_xlat19_ = dot(_e202.xyz, _e207.xyz);
    let _e210 = u_xlat19_;
    u_xlat19_ = clamp(_e210, 0f, 1f);
    let _e217 = _f_buffer0_.f_cb0_[10];
    let _e222 = _f_buffer2_.f_cb2_[11];
    u_xlat20_ = min(_e217.x, _e222.y);
    let _e225 = u_xlat20_;
    u_xlatu20_ = u32(i32(_e225));
    u_xlat3_.x = 0f;
    u_xlat3_.y = 0f;
    u_xlat3_.z = 0f;
    loop {
        let _e240 = u_xlatu_loop_1_;
        let _e241 = u_xlatu20_;
        if !((_e240 < _e241)) {
            break;
        }
        {
            let _e247 = u_xlatu_loop_1_;
            u_xlatu4_ = (_e247 >> 2u);
            let _e250 = u_xlatu_loop_1_;
            u_xlati10_ = i32((_e250 & 3u));
            let _e254 = u_xlatu4_;
            let _e260 = _f_buffer2_.f_cb2_[(i32(_e254) + 12i)];
            let _e261 = u_xlati10_;
            let _e265 = local_1[_e261];
            u_xlat4_ = dot(_e260, bitcast<vec4<f32>>(_e265));
            let _e268 = u_xlat4_;
            u_xlati4_ = i32(_e268);
            let _e270 = u_xlat10_;
            let _e272 = vs_TEXCOORD1_1;
            let _e275 = u_xlati4_;
            let _e278 = _f_buffer1_.f_cb1_[_e275];
            let _e281 = u_xlati4_;
            let _e284 = _f_buffer1_.f_cb1_[_e281];
            let _e286 = ((-(_e272.xyz) * _e278.www) + _e284.xyz);
            u_xlat10_.x = _e286.x;
            u_xlat10_.y = _e286.y;
            u_xlat10_.z = _e286.z;
            let _e294 = u_xlat10_;
            let _e296 = u_xlat10_;
            u_xlat5_.x = dot(_e294.xyz, _e296.xyz);
            let _e300 = u_xlat5_;
            u_xlat5_.x = max(_e300.x, 0.000061035156f);
            let _e304 = u_xlat5_;
            u_xlat11_ = inverseSqrt(_e304.x);
            let _e307 = u_xlat10_;
            let _e309 = u_xlat10_;
            let _e311 = u_xlat11_;
            let _e313 = (_e309.xyz * vec3(_e311));
            u_xlat10_.x = _e313.x;
            u_xlat10_.y = _e313.y;
            u_xlat10_.z = _e313.z;
            let _e322 = u_xlati4_;
            let _e327 = _f_buffer1_.f_cb1_[(_e322 + 512i)];
            u_xlat11_ = (1f / _e327.x);
            let _e331 = u_xlat5_;
            u_xlat5_.x = (_e331.x * 25f);
            let _e336 = u_xlat5_;
            let _e338 = u_xlat11_;
            u_xlat5_.x = (_e336.x / _e338);
            let _e341 = u_xlat5_;
            u_xlat5_.x = (_e341.x + 1f);
            let _e348 = u_xlat5_;
            u_xlat5_.x = (1f / _e348.x);
            let _e351 = u_xlati4_;
            let _e356 = _f_buffer1_.f_cb1_[(_e351 + 768i)];
            let _e358 = u_xlat10_;
            u_xlat11_ = dot(_e356.xyz, _e358.xyz);
            let _e361 = u_xlat11_;
            let _e362 = u_xlati4_;
            let _e367 = _f_buffer1_.f_cb1_[(_e362 + 512i)];
            let _e370 = u_xlati4_;
            let _e375 = _f_buffer1_.f_cb1_[(_e370 + 512i)];
            u_xlat11_ = ((_e361 * _e367.z) + _e375.w);
            let _e378 = u_xlat11_;
            u_xlat11_ = clamp(_e378, 0f, 1f);
            let _e382 = u_xlat11_;
            let _e383 = u_xlat11_;
            u_xlat11_ = (_e382 * _e383);
            let _e386 = u_xlat11_;
            let _e387 = u_xlat5_;
            u_xlat5_.x = (_e386 * _e387.x);
            let _e390 = u_xlat5_;
            let _e392 = u_xlat5_;
            let _e394 = u_xlati4_;
            let _e399 = _f_buffer1_.f_cb1_[(_e394 + 256i)];
            let _e401 = (_e392.xxx * _e399.xyz);
            u_xlat5_.x = _e401.x;
            u_xlat5_.y = _e401.y;
            u_xlat5_.z = _e401.z;
            let _e408 = u_xlat1_;
            let _e410 = u_xlat10_;
            u_xlat4_ = dot(_e408.xyz, _e410.xyz);
            let _e413 = u_xlat4_;
            u_xlat4_ = clamp(_e413, 0f, 1f);
            let _e417 = u_xlat3_;
            let _e419 = u_xlat5_;
            let _e421 = u_xlat4_;
            let _e424 = u_xlat3_;
            let _e426 = ((_e419.xyz * vec3(_e421)) + _e424.xyz);
            u_xlat3_.x = _e426.x;
            u_xlat3_.y = _e426.y;
            u_xlat3_.z = _e426.z;
        }
        continuing {
            let _e244 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e244 + 1u);
        }
    }
    let _e433 = u_xlat1_;
    let _e435 = u_xlat2_;
    let _e437 = u_xlat19_;
    let _e440 = u_xlat3_;
    let _e442 = ((_e435.xyz * vec3(_e437)) + _e440.xyz);
    u_xlat1_.x = _e442.x;
    u_xlat1_.y = _e442.y;
    u_xlat1_.z = _e442.z;
    let _e453 = _f_buffer2_.f_cb2_[27];
    u_xlat2_.x = abs(_e453.w);
    let _e460 = _f_buffer2_.f_cb2_[28];
    u_xlat2_.y = abs(_e460.w);
    let _e467 = _f_buffer2_.f_cb2_[29];
    u_xlat2_.z = abs(_e467.w);
    let _e470 = u_xlat2_;
    let _e472 = u_xlat2_;
    let _e474 = log2(_e472.xyz);
    u_xlat2_.x = _e474.x;
    u_xlat2_.y = _e474.y;
    u_xlat2_.z = _e474.z;
    let _e481 = u_xlat2_;
    let _e483 = u_xlat2_;
    let _e489 = (_e483.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat2_.x = _e489.x;
    u_xlat2_.y = _e489.y;
    u_xlat2_.z = _e489.z;
    let _e496 = u_xlat2_;
    let _e498 = u_xlat2_;
    let _e500 = exp2(_e498.xyz);
    u_xlat2_.x = _e500.x;
    u_xlat2_.y = _e500.y;
    u_xlat2_.z = _e500.z;
    let _e507 = u_xlat2_;
    let _e509 = u_xlat2_;
    let _e523 = ((_e509.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat2_.x = _e523.x;
    u_xlat2_.y = _e523.y;
    u_xlat2_.z = _e523.z;
    let _e530 = u_xlat2_;
    let _e532 = u_xlat2_;
    let _e538 = clamp(_e532.xyz, vec3(0f), vec3(1f));
    u_xlat2_.x = _e538.x;
    u_xlat2_.y = _e538.y;
    u_xlat2_.z = _e538.z;
    let _e545 = u_xlat1_;
    let _e547 = u_xlat1_;
    let _e549 = u_xlat2_;
    let _e551 = (_e547.xyz + _e549.xyz);
    u_xlat1_.x = _e551.x;
    u_xlat1_.y = _e551.y;
    u_xlat1_.z = _e551.z;
    let _e558 = SV_Target0_;
    let _e560 = u_xlat0_;
    let _e562 = u_xlat1_;
    let _e564 = (_e560.xyz * _e562.xyz);
    SV_Target0_.x = _e564.x;
    SV_Target0_.y = _e564.y;
    SV_Target0_.z = _e564.z;
    let _e572 = u_xlat0_;
    SV_Target0_.w = _e572.w;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec3<f32>, @location(3) vs_TEXCOORDindex3_: vec4<f32>, @location(12) vs_NORMAL0_: vec3<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_TEXCOORDindex3_1 = vs_TEXCOORDindex3_;
    vs_NORMAL0_1 = vs_NORMAL0_;
    main_1();
    let _e47 = SV_Target0_;
    return FragmentOutput(_e47);
}
