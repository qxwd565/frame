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
    f_cb3_: array<vec4<f32>, 3>,
}

struct FragmentOutput {
    @location(0) SV_TARGET0_: vec4<f32>,
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
@group(3) @binding(3) 
var samplerf_s1_: sampler;
@group(3) @binding(5) 
var samplerf_s2_: sampler;
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
@group(3) @binding(4) 
var f_t2_: texture_2d<f32>;
var<private> vs_NORMAL0_1: vec3<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD1_1: vec2<f32>;
var<private> vs_TEXCOORD2_1: vec3<f32>;
var<private> SV_TARGET0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlat5_: vec3<f32> = vec3(0f);
    var u_xlat6_: vec3<f32> = vec3(0f);
    var u_xlat21_: f32 = 0f;
    var u_xlat22_: f32 = 0f;
    var u_xlatu22_: u32 = 0u;
    var u_xlatu23_: u32 = 0u;
    var u_xlat24_: f32 = 0f;
    var u_xlati24_: i32 = 0i;
    var u_xlatu24_: u32 = 0u;
    var u_xlatb24_: bool = false;
    var u_xlat25_: f32 = 0f;
    var u_xlati25_: i32 = 0i;
    var u_xlat26_: f32 = 0f;
    var u_xlatu_loop_1_: u32 = 0u;
    var local: array<vec4<u32>, 4> = ImmCB_0_;

    let _e88 = vs_TEXCOORD0_1;
    let _e93 = _f_buffer0_.f_cb0_[4];
    let _e98 = hscard_bias.values[0];
    let _e101 = textureSampleBias(f_t0_, samplerf_s0_, _e88.xy, (_e93.x + _e98.x));
    u_xlat0_ = _e101;
    let _e102 = vs_TEXCOORD0_1;
    let _e107 = _f_buffer0_.f_cb0_[4];
    let _e112 = hscard_bias.values[1];
    let _e115 = textureSampleBias(f_t1_, samplerf_s1_, _e102.xy, (_e107.x + _e112.x));
    u_xlat1_ = _e115;
    let _e116 = u_xlat2_;
    let _e118 = vs_TEXCOORD1_1;
    let _e120 = vs_TEXCOORD1_1;
    let _e122 = (_e118.xy + _e120.xy);
    u_xlat2_.x = _e122.x;
    u_xlat2_.y = _e122.y;
    let _e127 = u_xlat2_;
    let _e132 = _f_buffer0_.f_cb0_[4];
    let _e137 = hscard_bias.values[2];
    let _e140 = textureSampleBias(f_t2_, samplerf_s2_, _e127.xy, (_e132.x + _e137.x));
    u_xlat2_ = _e140;
    let _e141 = u_xlat1_;
    let _e143 = u_xlat1_;
    let _e145 = u_xlat2_;
    let _e147 = (_e143.xyz * _e145.xyz);
    u_xlat1_.x = _e147.x;
    u_xlat1_.y = _e147.y;
    u_xlat1_.z = _e147.z;
    let _e154 = u_xlat1_;
    let _e156 = u_xlat1_;
    let _e161 = _f_buffer3_.f_cb3_[2];
    let _e163 = (_e156.xyz * _e161.xxx);
    u_xlat1_.x = _e163.x;
    u_xlat1_.y = _e163.y;
    u_xlat1_.z = _e163.z;
    let _e170 = u_xlat1_;
    let _e172 = u_xlat1_;
    let _e177 = _f_buffer3_.f_cb3_[1];
    let _e180 = u_xlat0_;
    let _e182 = ((_e172.xyz * _e177.xyz) + _e180.xyz);
    u_xlat1_.x = _e182.x;
    u_xlat1_.y = _e182.y;
    u_xlat1_.z = _e182.z;
    let _e189 = u_xlat1_;
    let _e191 = u_xlat1_;
    let _e196 = _f_buffer3_.f_cb3_[0];
    let _e198 = (_e191.xyz * _e196.xyz);
    u_xlat1_.x = _e198.x;
    u_xlat1_.y = _e198.y;
    u_xlat1_.z = _e198.z;
    let _e205 = vs_NORMAL0_1;
    let _e207 = vs_NORMAL0_1;
    u_xlat21_ = dot(_e205.xyz, _e207.xyz);
    let _e210 = u_xlat21_;
    u_xlat21_ = inverseSqrt(_e210);
    let _e212 = u_xlat2_;
    let _e214 = u_xlat21_;
    let _e216 = vs_NORMAL0_1;
    let _e218 = (vec3(_e214) * _e216.xyz);
    u_xlat2_.x = _e218.x;
    u_xlat2_.y = _e218.y;
    u_xlat2_.z = _e218.z;
    let _e225 = u_xlat3_;
    let _e230 = _f_buffer0_.f_cb0_[6];
    let _e235 = _f_buffer2_.f_cb2_[11];
    let _e237 = (_e230.xyz * _e235.zzz);
    u_xlat3_.x = _e237.x;
    u_xlat3_.y = _e237.y;
    u_xlat3_.z = _e237.z;
    let _e244 = u_xlat2_;
    let _e249 = _f_buffer0_.f_cb0_[5];
    u_xlat21_ = dot(_e244.xyz, _e249.xyz);
    let _e252 = u_xlat21_;
    u_xlat21_ = clamp(_e252, 0f, 1f);
    let _e259 = _f_buffer0_.f_cb0_[10];
    let _e264 = _f_buffer2_.f_cb2_[11];
    u_xlat22_ = min(_e259.x, _e264.y);
    let _e267 = u_xlat22_;
    u_xlatu22_ = u32(i32(_e267));
    u_xlat4_.x = 0f;
    u_xlat4_.y = 0f;
    u_xlat4_.z = 0f;
    loop {
        let _e281 = u_xlatu_loop_1_;
        let _e282 = u_xlatu22_;
        if !((_e281 < _e282)) {
            break;
        }
        {
            let _e288 = u_xlatu_loop_1_;
            u_xlatu24_ = (_e288 >> 2u);
            let _e291 = u_xlatu_loop_1_;
            u_xlati25_ = i32((_e291 & 3u));
            let _e295 = u_xlatu24_;
            let _e301 = _f_buffer2_.f_cb2_[(i32(_e295) + 12i)];
            let _e302 = u_xlati25_;
            let _e306 = local[_e302];
            u_xlat24_ = dot(_e301, bitcast<vec4<f32>>(_e306));
            let _e309 = u_xlat24_;
            u_xlati24_ = i32(_e309);
            let _e311 = u_xlat5_;
            let _e313 = vs_TEXCOORD2_1;
            let _e316 = u_xlati24_;
            let _e319 = _f_buffer1_.f_cb1_[_e316];
            let _e322 = u_xlati24_;
            let _e325 = _f_buffer1_.f_cb1_[_e322];
            let _e327 = ((-(_e313.xyz) * _e319.www) + _e325.xyz);
            u_xlat5_.x = _e327.x;
            u_xlat5_.y = _e327.y;
            u_xlat5_.z = _e327.z;
            let _e334 = u_xlat5_;
            let _e336 = u_xlat5_;
            u_xlat25_ = dot(_e334.xyz, _e336.xyz);
            let _e339 = u_xlat25_;
            u_xlat25_ = max(_e339, 0.000061035156f);
            let _e342 = u_xlat25_;
            u_xlat26_ = inverseSqrt(_e342);
            let _e344 = u_xlat5_;
            let _e346 = u_xlat26_;
            let _e348 = u_xlat5_;
            let _e350 = (vec3(_e346) * _e348.xyz);
            u_xlat5_.x = _e350.x;
            u_xlat5_.y = _e350.y;
            u_xlat5_.z = _e350.z;
            let _e359 = u_xlati24_;
            let _e364 = _f_buffer1_.f_cb1_[(_e359 + 512i)];
            u_xlat26_ = (1f / _e364.x);
            let _e367 = u_xlat25_;
            u_xlat25_ = (_e367 * 25f);
            let _e370 = u_xlat25_;
            let _e371 = u_xlat26_;
            u_xlat25_ = (_e370 / _e371);
            let _e373 = u_xlat25_;
            u_xlat25_ = (_e373 + 1f);
            let _e378 = u_xlat25_;
            u_xlat25_ = (1f / _e378);
            let _e380 = u_xlati24_;
            let _e385 = _f_buffer1_.f_cb1_[(_e380 + 768i)];
            let _e387 = u_xlat5_;
            u_xlat26_ = dot(_e385.xyz, _e387.xyz);
            let _e390 = u_xlat26_;
            let _e391 = u_xlati24_;
            let _e396 = _f_buffer1_.f_cb1_[(_e391 + 512i)];
            let _e399 = u_xlati24_;
            let _e404 = _f_buffer1_.f_cb1_[(_e399 + 512i)];
            u_xlat26_ = ((_e390 * _e396.z) + _e404.w);
            let _e407 = u_xlat26_;
            u_xlat26_ = clamp(_e407, 0f, 1f);
            let _e411 = u_xlat26_;
            let _e412 = u_xlat26_;
            u_xlat26_ = (_e411 * _e412);
            let _e414 = u_xlat25_;
            let _e415 = u_xlat26_;
            u_xlat25_ = (_e414 * _e415);
            let _e417 = u_xlat6_;
            let _e419 = u_xlat25_;
            let _e421 = u_xlati24_;
            let _e426 = _f_buffer1_.f_cb1_[(_e421 + 256i)];
            let _e428 = (vec3(_e419) * _e426.xyz);
            u_xlat6_.x = _e428.x;
            u_xlat6_.y = _e428.y;
            u_xlat6_.z = _e428.z;
            let _e435 = u_xlat2_;
            let _e437 = u_xlat5_;
            u_xlat24_ = dot(_e435.xyz, _e437.xyz);
            let _e440 = u_xlat24_;
            u_xlat24_ = clamp(_e440, 0f, 1f);
            let _e444 = u_xlat4_;
            let _e446 = u_xlat6_;
            let _e448 = u_xlat24_;
            let _e451 = u_xlat4_;
            let _e453 = ((_e446.xyz * vec3(_e448)) + _e451.xyz);
            u_xlat4_.x = _e453.x;
            u_xlat4_.y = _e453.y;
            u_xlat4_.z = _e453.z;
        }
        continuing {
            let _e285 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e285 + 1u);
        }
    }
    let _e460 = u_xlat2_;
    let _e462 = u_xlat3_;
    let _e464 = u_xlat21_;
    let _e467 = u_xlat4_;
    let _e469 = ((_e462.xyz * vec3(_e464)) + _e467.xyz);
    u_xlat2_.x = _e469.x;
    u_xlat2_.y = _e469.y;
    u_xlat2_.z = _e469.z;
    let _e480 = _f_buffer2_.f_cb2_[27];
    u_xlat3_.x = abs(_e480.w);
    let _e487 = _f_buffer2_.f_cb2_[28];
    u_xlat3_.y = abs(_e487.w);
    let _e494 = _f_buffer2_.f_cb2_[29];
    u_xlat3_.z = abs(_e494.w);
    let _e497 = u_xlat3_;
    let _e499 = u_xlat3_;
    let _e501 = log2(_e499.xyz);
    u_xlat3_.x = _e501.x;
    u_xlat3_.y = _e501.y;
    u_xlat3_.z = _e501.z;
    let _e508 = u_xlat3_;
    let _e510 = u_xlat3_;
    let _e516 = (_e510.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat3_.x = _e516.x;
    u_xlat3_.y = _e516.y;
    u_xlat3_.z = _e516.z;
    let _e523 = u_xlat3_;
    let _e525 = u_xlat3_;
    let _e527 = exp2(_e525.xyz);
    u_xlat3_.x = _e527.x;
    u_xlat3_.y = _e527.y;
    u_xlat3_.z = _e527.z;
    let _e534 = u_xlat3_;
    let _e536 = u_xlat3_;
    let _e550 = ((_e536.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat3_.x = _e550.x;
    u_xlat3_.y = _e550.y;
    u_xlat3_.z = _e550.z;
    let _e557 = u_xlat3_;
    let _e559 = u_xlat3_;
    let _e565 = clamp(_e559.xyz, vec3(0f), vec3(1f));
    u_xlat3_.x = _e565.x;
    u_xlat3_.y = _e565.y;
    u_xlat3_.z = _e565.z;
    let _e572 = u_xlat2_;
    let _e574 = u_xlat2_;
    let _e576 = u_xlat3_;
    let _e578 = (_e574.xyz + _e576.xyz);
    u_xlat2_.x = _e578.x;
    u_xlat2_.y = _e578.y;
    u_xlat2_.z = _e578.z;
    let _e585 = u_xlat1_;
    let _e587 = u_xlat2_;
    let _e589 = u_xlat1_;
    let _e592 = u_xlat0_;
    let _e595 = ((_e587.xyz * _e589.xyz) + -(_e592.xyz));
    u_xlat1_.x = _e595.x;
    u_xlat1_.y = _e595.y;
    u_xlat1_.z = _e595.z;
    let _e602 = SV_TARGET0_;
    let _e607 = _f_buffer3_.f_cb3_[2];
    let _e609 = u_xlat1_;
    let _e612 = u_xlat0_;
    let _e614 = ((_e607.zzz * _e609.xyz) + _e612.xyz);
    SV_TARGET0_.x = _e614.x;
    SV_TARGET0_.y = _e614.y;
    SV_TARGET0_.z = _e614.z;
    SV_TARGET0_.w = 1f;
    return;
}

@fragment 
fn main(@location(12) vs_NORMAL0_: vec3<f32>, @location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec2<f32>, @location(2) vs_TEXCOORD2_: vec3<f32>) -> FragmentOutput {
    vs_NORMAL0_1 = vs_NORMAL0_;
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_TEXCOORD2_1 = vs_TEXCOORD2_;
    main_1();
    let _e48 = SV_TARGET0_;
    return FragmentOutput(_e48);
}
