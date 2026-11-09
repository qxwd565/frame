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
    f_cb3_: array<vec4<f32>, 2>,
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
@group(3) @binding(1) 
var samplerf_s0_: sampler;
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD1_1: vec3<f32>;
var<private> vs_NORMAL0_1: vec3<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec3<f32> = vec3(0f);
    var u_xlat2_: vec3<f32> = vec3(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlat5_: vec3<f32> = vec3(0f);
    var u_xlati5_: i32 = 0i;
    var u_xlat6_: vec3<f32> = vec3(0f);
    var u_xlat22_: f32 = 0f;
    var u_xlat23_: f32 = 0f;
    var u_xlatu23_: u32 = 0u;
    var u_xlatu24_: u32 = 0u;
    var u_xlat25_: f32 = 0f;
    var u_xlati25_: i32 = 0i;
    var u_xlatu25_: u32 = 0u;
    var u_xlatb25_: bool = false;
    var u_xlat26_: f32 = 0f;
    var u_xlatu_loop_1_: u32 = 0u;
    var local: array<vec4<u32>, 4> = ImmCB_0_;

    let _e80 = vs_TEXCOORD0_1;
    let _e85 = _f_buffer0_.f_cb0_[4];
    let _e90 = hscard_bias.values[0];
    let _e93 = textureSampleBias(f_t0_, samplerf_s0_, _e80.xy, (_e85.x + _e90.x));
    u_xlat0_ = _e93;
    let _e94 = u_xlat1_;
    let _e96 = u_xlat0_;
    let _e101 = _f_buffer3_.f_cb3_[0];
    let _e103 = (_e96.xyz * _e101.xyz);
    u_xlat1_.x = _e103.x;
    u_xlat1_.y = _e103.y;
    u_xlat1_.z = _e103.z;
    let _e110 = u_xlat1_;
    let _e112 = u_xlat0_;
    let _e114 = u_xlat1_;
    let _e116 = (_e112.www * _e114.xyz);
    u_xlat1_.x = _e116.x;
    u_xlat1_.y = _e116.y;
    u_xlat1_.z = _e116.z;
    let _e123 = vs_NORMAL0_1;
    let _e125 = vs_NORMAL0_1;
    u_xlat22_ = dot(_e123.xyz, _e125.xyz);
    let _e128 = u_xlat22_;
    u_xlat22_ = inverseSqrt(_e128);
    let _e130 = u_xlat2_;
    let _e132 = u_xlat22_;
    let _e134 = vs_NORMAL0_1;
    let _e136 = (vec3(_e132) * _e134.xyz);
    u_xlat2_.x = _e136.x;
    u_xlat2_.y = _e136.y;
    u_xlat2_.z = _e136.z;
    let _e143 = u_xlat3_;
    let _e148 = _f_buffer0_.f_cb0_[6];
    let _e153 = _f_buffer2_.f_cb2_[11];
    let _e155 = (_e148.xyz * _e153.zzz);
    u_xlat3_.x = _e155.x;
    u_xlat3_.y = _e155.y;
    u_xlat3_.z = _e155.z;
    let _e162 = u_xlat2_;
    let _e167 = _f_buffer0_.f_cb0_[5];
    u_xlat22_ = dot(_e162.xyz, _e167.xyz);
    let _e170 = u_xlat22_;
    u_xlat22_ = clamp(_e170, 0f, 1f);
    let _e177 = _f_buffer0_.f_cb0_[10];
    let _e182 = _f_buffer2_.f_cb2_[11];
    u_xlat23_ = min(_e177.x, _e182.y);
    let _e185 = u_xlat23_;
    u_xlatu23_ = u32(i32(_e185));
    u_xlat4_.x = 0f;
    u_xlat4_.y = 0f;
    u_xlat4_.z = 0f;
    loop {
        let _e199 = u_xlatu_loop_1_;
        let _e200 = u_xlatu23_;
        if !((_e199 < _e200)) {
            break;
        }
        {
            let _e206 = u_xlatu_loop_1_;
            u_xlatu25_ = (_e206 >> 2u);
            let _e209 = u_xlatu_loop_1_;
            u_xlati5_ = i32((_e209 & 3u));
            let _e213 = u_xlatu25_;
            let _e219 = _f_buffer2_.f_cb2_[(i32(_e213) + 12i)];
            let _e220 = u_xlati5_;
            let _e224 = local[_e220];
            u_xlat25_ = dot(_e219, bitcast<vec4<f32>>(_e224));
            let _e227 = u_xlat25_;
            u_xlati25_ = i32(_e227);
            let _e229 = u_xlat5_;
            let _e231 = vs_TEXCOORD1_1;
            let _e234 = u_xlati25_;
            let _e237 = _f_buffer1_.f_cb1_[_e234];
            let _e240 = u_xlati25_;
            let _e243 = _f_buffer1_.f_cb1_[_e240];
            let _e245 = ((-(_e231.xyz) * _e237.www) + _e243.xyz);
            u_xlat5_.x = _e245.x;
            u_xlat5_.y = _e245.y;
            u_xlat5_.z = _e245.z;
            let _e252 = u_xlat5_;
            let _e254 = u_xlat5_;
            u_xlat26_ = dot(_e252.xyz, _e254.xyz);
            let _e257 = u_xlat26_;
            u_xlat26_ = max(_e257, 0.000061035156f);
            let _e261 = u_xlat26_;
            u_xlat6_.x = inverseSqrt(_e261);
            let _e263 = u_xlat5_;
            let _e265 = u_xlat5_;
            let _e267 = u_xlat6_;
            let _e269 = (_e265.xyz * _e267.xxx);
            u_xlat5_.x = _e269.x;
            u_xlat5_.y = _e269.y;
            u_xlat5_.z = _e269.z;
            let _e279 = u_xlati25_;
            let _e284 = _f_buffer1_.f_cb1_[(_e279 + 512i)];
            u_xlat6_.x = (1f / _e284.x);
            let _e287 = u_xlat26_;
            u_xlat26_ = (_e287 * 25f);
            let _e290 = u_xlat26_;
            let _e291 = u_xlat6_;
            u_xlat26_ = (_e290 / _e291.x);
            let _e294 = u_xlat26_;
            u_xlat26_ = (_e294 + 1f);
            let _e299 = u_xlat26_;
            u_xlat26_ = (1f / _e299);
            let _e302 = u_xlati25_;
            let _e307 = _f_buffer1_.f_cb1_[(_e302 + 768i)];
            let _e309 = u_xlat5_;
            u_xlat6_.x = dot(_e307.xyz, _e309.xyz);
            let _e313 = u_xlat6_;
            let _e315 = u_xlati25_;
            let _e320 = _f_buffer1_.f_cb1_[(_e315 + 512i)];
            let _e323 = u_xlati25_;
            let _e328 = _f_buffer1_.f_cb1_[(_e323 + 512i)];
            u_xlat6_.x = ((_e313.x * _e320.z) + _e328.w);
            let _e332 = u_xlat6_;
            u_xlat6_.x = clamp(_e332.x, 0f, 1f);
            let _e338 = u_xlat6_;
            let _e340 = u_xlat6_;
            u_xlat6_.x = (_e338.x * _e340.x);
            let _e343 = u_xlat26_;
            let _e344 = u_xlat6_;
            u_xlat26_ = (_e343 * _e344.x);
            let _e347 = u_xlat6_;
            let _e349 = u_xlat26_;
            let _e351 = u_xlati25_;
            let _e356 = _f_buffer1_.f_cb1_[(_e351 + 256i)];
            let _e358 = (vec3(_e349) * _e356.xyz);
            u_xlat6_.x = _e358.x;
            u_xlat6_.y = _e358.y;
            u_xlat6_.z = _e358.z;
            let _e365 = u_xlat2_;
            let _e367 = u_xlat5_;
            u_xlat25_ = dot(_e365.xyz, _e367.xyz);
            let _e370 = u_xlat25_;
            u_xlat25_ = clamp(_e370, 0f, 1f);
            let _e374 = u_xlat4_;
            let _e376 = u_xlat6_;
            let _e378 = u_xlat25_;
            let _e381 = u_xlat4_;
            let _e383 = ((_e376.xyz * vec3(_e378)) + _e381.xyz);
            u_xlat4_.x = _e383.x;
            u_xlat4_.y = _e383.y;
            u_xlat4_.z = _e383.z;
        }
        continuing {
            let _e203 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e203 + 1u);
        }
    }
    let _e390 = u_xlat2_;
    let _e392 = u_xlat3_;
    let _e394 = u_xlat22_;
    let _e397 = u_xlat4_;
    let _e399 = ((_e392.xyz * vec3(_e394)) + _e397.xyz);
    u_xlat2_.x = _e399.x;
    u_xlat2_.y = _e399.y;
    u_xlat2_.z = _e399.z;
    let _e410 = _f_buffer2_.f_cb2_[27];
    u_xlat3_.x = abs(_e410.w);
    let _e417 = _f_buffer2_.f_cb2_[28];
    u_xlat3_.y = abs(_e417.w);
    let _e424 = _f_buffer2_.f_cb2_[29];
    u_xlat3_.z = abs(_e424.w);
    let _e427 = u_xlat3_;
    let _e429 = u_xlat3_;
    let _e431 = log2(_e429.xyz);
    u_xlat3_.x = _e431.x;
    u_xlat3_.y = _e431.y;
    u_xlat3_.z = _e431.z;
    let _e438 = u_xlat3_;
    let _e440 = u_xlat3_;
    let _e446 = (_e440.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat3_.x = _e446.x;
    u_xlat3_.y = _e446.y;
    u_xlat3_.z = _e446.z;
    let _e453 = u_xlat3_;
    let _e455 = u_xlat3_;
    let _e457 = exp2(_e455.xyz);
    u_xlat3_.x = _e457.x;
    u_xlat3_.y = _e457.y;
    u_xlat3_.z = _e457.z;
    let _e464 = u_xlat3_;
    let _e466 = u_xlat3_;
    let _e480 = ((_e466.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat3_.x = _e480.x;
    u_xlat3_.y = _e480.y;
    u_xlat3_.z = _e480.z;
    let _e487 = u_xlat3_;
    let _e489 = u_xlat3_;
    let _e495 = clamp(_e489.xyz, vec3(0f), vec3(1f));
    u_xlat3_.x = _e495.x;
    u_xlat3_.y = _e495.y;
    u_xlat3_.z = _e495.z;
    let _e502 = u_xlat2_;
    let _e504 = u_xlat2_;
    let _e506 = u_xlat3_;
    let _e508 = (_e504.xyz + _e506.xyz);
    u_xlat2_.x = _e508.x;
    u_xlat2_.y = _e508.y;
    u_xlat2_.z = _e508.z;
    let _e515 = u_xlat0_;
    let _e517 = u_xlat0_;
    let _e519 = u_xlat0_;
    let _e521 = (_e517.www * _e519.xyz);
    u_xlat0_.x = _e521.x;
    u_xlat0_.y = _e521.y;
    u_xlat0_.z = _e521.z;
    let _e528 = u_xlat0_;
    let _e530 = u_xlat0_;
    let _e536 = (_e530.xyz * vec3<f32>(0.5f, 0.5f, 0.5f));
    u_xlat0_.x = _e536.x;
    u_xlat0_.y = _e536.y;
    u_xlat0_.z = _e536.z;
    let _e543 = u_xlat3_;
    let _e545 = u_xlat3_;
    let _e554 = (_e545.xyz + vec3<f32>(-1f, -1f, -1f));
    u_xlat3_.x = _e554.x;
    u_xlat3_.y = _e554.y;
    u_xlat3_.z = _e554.z;
    let _e561 = u_xlat3_;
    let _e566 = _f_buffer3_.f_cb3_[1];
    let _e568 = u_xlat3_;
    let _e575 = ((_e566.xxx * _e568.xyz) + vec3<f32>(1f, 1f, 1f));
    u_xlat3_.x = _e575.x;
    u_xlat3_.y = _e575.y;
    u_xlat3_.z = _e575.z;
    let _e582 = u_xlat0_;
    let _e584 = u_xlat0_;
    let _e586 = u_xlat3_;
    let _e588 = (_e584.xyz * _e586.xyz);
    u_xlat0_.x = _e588.x;
    u_xlat0_.y = _e588.y;
    u_xlat0_.z = _e588.z;
    let _e595 = SV_Target0_;
    let _e597 = u_xlat1_;
    let _e599 = u_xlat2_;
    let _e602 = u_xlat0_;
    let _e604 = ((_e597.xyz * _e599.xyz) + _e602.xyz);
    SV_Target0_.x = _e604.x;
    SV_Target0_.y = _e604.y;
    SV_Target0_.z = _e604.z;
    let _e612 = u_xlat0_;
    SV_Target0_.w = _e612.w;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec3<f32>, @location(12) vs_NORMAL0_: vec3<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_NORMAL0_1 = vs_NORMAL0_;
    main_1();
    let _e36 = SV_Target0_;
    return FragmentOutput(_e36);
}
