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
    f_cb4_: array<vec4<f32>, 3>,
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
@group(1) @binding(4) 
var<uniform> _f_buffer4_: f_buffer4_;
@group(3) @binding(1) 
var samplerf_s0_: sampler_comparison;
@group(3) @binding(3) 
var samplerf_s1_: sampler;
@group(3) @binding(5) 
var samplerf_s2_: sampler;
@group(3) @binding(7) 
var samplerf_s3_: sampler;
@group(3) @binding(0) 
var f_t0_: texture_depth_2d;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
@group(3) @binding(4) 
var f_t2_: texture_2d<f32>;
@group(3) @binding(6) 
var f_t3_: texture_2d<f32>;
var<private> vs_NORMAL0_1: vec3<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD1_1: vec2<f32>;
var<private> vs_TEXCOORD2_1: vec3<f32>;
var<private> vs_TEXCOORDindex3_1: vec4<f32>;
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
    var u_xlatb22_: bool = false;
    var u_xlatu23_: u32 = 0u;
    var u_xlatb23_: bool = false;
    var u_xlat24_: f32 = 0f;
    var u_xlati24_: i32 = 0i;
    var u_xlatu24_: u32 = 0u;
    var u_xlatb24_: bool = false;
    var u_xlat25_: f32 = 0f;
    var u_xlati25_: i32 = 0i;
    var u_xlat26_: f32 = 0f;
    var txVec0_: vec3<f32>;
    var local: f32;
    var u_xlatu_loop_1_: u32 = 0u;
    var local_1: array<vec4<u32>, 4> = ImmCB_0_;

    let _e100 = vs_TEXCOORD0_1;
    let _e105 = _f_buffer0_.f_cb0_[4];
    let _e110 = hscard_bias.values[1];
    let _e113 = textureSampleBias(f_t1_, samplerf_s1_, _e100.xy, (_e105.x + _e110.x));
    u_xlat0_ = _e113;
    let _e114 = vs_TEXCOORD0_1;
    let _e119 = _f_buffer0_.f_cb0_[4];
    let _e124 = hscard_bias.values[2];
    let _e127 = textureSampleBias(f_t2_, samplerf_s2_, _e114.xy, (_e119.x + _e124.x));
    u_xlat1_ = _e127;
    let _e128 = u_xlat2_;
    let _e130 = vs_TEXCOORD1_1;
    let _e132 = vs_TEXCOORD1_1;
    let _e134 = (_e130.xy + _e132.xy);
    u_xlat2_.x = _e134.x;
    u_xlat2_.y = _e134.y;
    let _e139 = u_xlat2_;
    let _e144 = _f_buffer0_.f_cb0_[4];
    let _e149 = hscard_bias.values[3];
    let _e152 = textureSampleBias(f_t3_, samplerf_s3_, _e139.xy, (_e144.x + _e149.x));
    u_xlat2_ = _e152;
    let _e153 = u_xlat1_;
    let _e155 = u_xlat1_;
    let _e157 = u_xlat2_;
    let _e159 = (_e155.xyz * _e157.xyz);
    u_xlat1_.x = _e159.x;
    u_xlat1_.y = _e159.y;
    u_xlat1_.z = _e159.z;
    let _e166 = u_xlat1_;
    let _e168 = u_xlat1_;
    let _e173 = _f_buffer4_.f_cb4_[2];
    let _e175 = (_e168.xyz * _e173.xxx);
    u_xlat1_.x = _e175.x;
    u_xlat1_.y = _e175.y;
    u_xlat1_.z = _e175.z;
    let _e182 = u_xlat1_;
    let _e184 = u_xlat1_;
    let _e189 = _f_buffer4_.f_cb4_[1];
    let _e192 = u_xlat0_;
    let _e194 = ((_e184.xyz * _e189.xyz) + _e192.xyz);
    u_xlat1_.x = _e194.x;
    u_xlat1_.y = _e194.y;
    u_xlat1_.z = _e194.z;
    let _e201 = u_xlat1_;
    let _e203 = u_xlat1_;
    let _e208 = _f_buffer4_.f_cb4_[0];
    let _e210 = (_e203.xyz * _e208.xyz);
    u_xlat1_.x = _e210.x;
    u_xlat1_.y = _e210.y;
    u_xlat1_.z = _e210.z;
    let _e217 = vs_NORMAL0_1;
    let _e219 = vs_NORMAL0_1;
    u_xlat21_ = dot(_e217.xyz, _e219.xyz);
    let _e222 = u_xlat21_;
    u_xlat21_ = inverseSqrt(_e222);
    let _e224 = u_xlat2_;
    let _e226 = u_xlat21_;
    let _e228 = vs_NORMAL0_1;
    let _e230 = (vec3(_e226) * _e228.xyz);
    u_xlat2_.x = _e230.x;
    u_xlat2_.y = _e230.y;
    u_xlat2_.z = _e230.z;
    let _e237 = vs_TEXCOORDindex3_1;
    let _e238 = _e237.xy;
    let _e239 = vs_TEXCOORDindex3_1;
    txVec0_ = vec3<f32>(_e238.x, _e238.y, _e239.z);
    let _e245 = txVec0_;
    let _e249 = textureSampleCompareLevel(f_t0_, samplerf_s0_, _e245.xy, _e245.z);
    u_xlat21_ = _e249;
    let _e253 = _f_buffer3_.f_cb3_[27];
    u_xlat22_ = (-(_e253.x) + 1f);
    let _e258 = u_xlat21_;
    let _e262 = _f_buffer3_.f_cb3_[27];
    let _e265 = u_xlat22_;
    u_xlat21_ = ((_e258 * _e262.x) + _e265);
    let _e268 = vs_TEXCOORDindex3_1;
    u_xlatb22_ = (0f >= _e268.z);
    let _e271 = vs_TEXCOORDindex3_1;
    u_xlatb23_ = (_e271.z >= 1f);
    let _e275 = u_xlatb22_;
    let _e276 = u_xlatb23_;
    u_xlatb22_ = (_e275 || _e276);
    let _e278 = u_xlatb22_;
    if _e278 {
        local = 1f;
    } else {
        let _e280 = u_xlat21_;
        local = _e280;
    }
    let _e282 = local;
    u_xlat21_ = _e282;
    let _e283 = u_xlat21_;
    let _e287 = _f_buffer2_.f_cb2_[11];
    u_xlat21_ = (_e283 * _e287.z);
    let _e290 = u_xlat3_;
    let _e292 = u_xlat21_;
    let _e297 = _f_buffer0_.f_cb0_[6];
    let _e299 = (vec3(_e292) * _e297.xyz);
    u_xlat3_.x = _e299.x;
    u_xlat3_.y = _e299.y;
    u_xlat3_.z = _e299.z;
    let _e306 = u_xlat2_;
    let _e311 = _f_buffer0_.f_cb0_[5];
    u_xlat21_ = dot(_e306.xyz, _e311.xyz);
    let _e314 = u_xlat21_;
    u_xlat21_ = clamp(_e314, 0f, 1f);
    let _e321 = _f_buffer0_.f_cb0_[10];
    let _e326 = _f_buffer2_.f_cb2_[11];
    u_xlat22_ = min(_e321.x, _e326.y);
    let _e329 = u_xlat22_;
    u_xlatu22_ = u32(i32(_e329));
    u_xlat4_.x = 0f;
    u_xlat4_.y = 0f;
    u_xlat4_.z = 0f;
    loop {
        let _e343 = u_xlatu_loop_1_;
        let _e344 = u_xlatu22_;
        if !((_e343 < _e344)) {
            break;
        }
        {
            let _e350 = u_xlatu_loop_1_;
            u_xlatu24_ = (_e350 >> 2u);
            let _e353 = u_xlatu_loop_1_;
            u_xlati25_ = i32((_e353 & 3u));
            let _e357 = u_xlatu24_;
            let _e363 = _f_buffer2_.f_cb2_[(i32(_e357) + 12i)];
            let _e364 = u_xlati25_;
            let _e368 = local_1[_e364];
            u_xlat24_ = dot(_e363, bitcast<vec4<f32>>(_e368));
            let _e371 = u_xlat24_;
            u_xlati24_ = i32(_e371);
            let _e373 = u_xlat5_;
            let _e375 = vs_TEXCOORD2_1;
            let _e378 = u_xlati24_;
            let _e381 = _f_buffer1_.f_cb1_[_e378];
            let _e384 = u_xlati24_;
            let _e387 = _f_buffer1_.f_cb1_[_e384];
            let _e389 = ((-(_e375.xyz) * _e381.www) + _e387.xyz);
            u_xlat5_.x = _e389.x;
            u_xlat5_.y = _e389.y;
            u_xlat5_.z = _e389.z;
            let _e396 = u_xlat5_;
            let _e398 = u_xlat5_;
            u_xlat25_ = dot(_e396.xyz, _e398.xyz);
            let _e401 = u_xlat25_;
            u_xlat25_ = max(_e401, 0.000061035156f);
            let _e404 = u_xlat25_;
            u_xlat26_ = inverseSqrt(_e404);
            let _e406 = u_xlat5_;
            let _e408 = u_xlat26_;
            let _e410 = u_xlat5_;
            let _e412 = (vec3(_e408) * _e410.xyz);
            u_xlat5_.x = _e412.x;
            u_xlat5_.y = _e412.y;
            u_xlat5_.z = _e412.z;
            let _e421 = u_xlati24_;
            let _e426 = _f_buffer1_.f_cb1_[(_e421 + 512i)];
            u_xlat26_ = (1f / _e426.x);
            let _e429 = u_xlat25_;
            u_xlat25_ = (_e429 * 25f);
            let _e432 = u_xlat25_;
            let _e433 = u_xlat26_;
            u_xlat25_ = (_e432 / _e433);
            let _e435 = u_xlat25_;
            u_xlat25_ = (_e435 + 1f);
            let _e440 = u_xlat25_;
            u_xlat25_ = (1f / _e440);
            let _e442 = u_xlati24_;
            let _e447 = _f_buffer1_.f_cb1_[(_e442 + 768i)];
            let _e449 = u_xlat5_;
            u_xlat26_ = dot(_e447.xyz, _e449.xyz);
            let _e452 = u_xlat26_;
            let _e453 = u_xlati24_;
            let _e458 = _f_buffer1_.f_cb1_[(_e453 + 512i)];
            let _e461 = u_xlati24_;
            let _e466 = _f_buffer1_.f_cb1_[(_e461 + 512i)];
            u_xlat26_ = ((_e452 * _e458.z) + _e466.w);
            let _e469 = u_xlat26_;
            u_xlat26_ = clamp(_e469, 0f, 1f);
            let _e473 = u_xlat26_;
            let _e474 = u_xlat26_;
            u_xlat26_ = (_e473 * _e474);
            let _e476 = u_xlat25_;
            let _e477 = u_xlat26_;
            u_xlat25_ = (_e476 * _e477);
            let _e479 = u_xlat6_;
            let _e481 = u_xlat25_;
            let _e483 = u_xlati24_;
            let _e488 = _f_buffer1_.f_cb1_[(_e483 + 256i)];
            let _e490 = (vec3(_e481) * _e488.xyz);
            u_xlat6_.x = _e490.x;
            u_xlat6_.y = _e490.y;
            u_xlat6_.z = _e490.z;
            let _e497 = u_xlat2_;
            let _e499 = u_xlat5_;
            u_xlat24_ = dot(_e497.xyz, _e499.xyz);
            let _e502 = u_xlat24_;
            u_xlat24_ = clamp(_e502, 0f, 1f);
            let _e506 = u_xlat4_;
            let _e508 = u_xlat6_;
            let _e510 = u_xlat24_;
            let _e513 = u_xlat4_;
            let _e515 = ((_e508.xyz * vec3(_e510)) + _e513.xyz);
            u_xlat4_.x = _e515.x;
            u_xlat4_.y = _e515.y;
            u_xlat4_.z = _e515.z;
        }
        continuing {
            let _e347 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e347 + 1u);
        }
    }
    let _e522 = u_xlat2_;
    let _e524 = u_xlat3_;
    let _e526 = u_xlat21_;
    let _e529 = u_xlat4_;
    let _e531 = ((_e524.xyz * vec3(_e526)) + _e529.xyz);
    u_xlat2_.x = _e531.x;
    u_xlat2_.y = _e531.y;
    u_xlat2_.z = _e531.z;
    let _e542 = _f_buffer2_.f_cb2_[27];
    u_xlat3_.x = abs(_e542.w);
    let _e549 = _f_buffer2_.f_cb2_[28];
    u_xlat3_.y = abs(_e549.w);
    let _e556 = _f_buffer2_.f_cb2_[29];
    u_xlat3_.z = abs(_e556.w);
    let _e559 = u_xlat3_;
    let _e561 = u_xlat3_;
    let _e563 = log2(_e561.xyz);
    u_xlat3_.x = _e563.x;
    u_xlat3_.y = _e563.y;
    u_xlat3_.z = _e563.z;
    let _e570 = u_xlat3_;
    let _e572 = u_xlat3_;
    let _e578 = (_e572.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat3_.x = _e578.x;
    u_xlat3_.y = _e578.y;
    u_xlat3_.z = _e578.z;
    let _e585 = u_xlat3_;
    let _e587 = u_xlat3_;
    let _e589 = exp2(_e587.xyz);
    u_xlat3_.x = _e589.x;
    u_xlat3_.y = _e589.y;
    u_xlat3_.z = _e589.z;
    let _e596 = u_xlat3_;
    let _e598 = u_xlat3_;
    let _e612 = ((_e598.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat3_.x = _e612.x;
    u_xlat3_.y = _e612.y;
    u_xlat3_.z = _e612.z;
    let _e619 = u_xlat3_;
    let _e621 = u_xlat3_;
    let _e627 = clamp(_e621.xyz, vec3(0f), vec3(1f));
    u_xlat3_.x = _e627.x;
    u_xlat3_.y = _e627.y;
    u_xlat3_.z = _e627.z;
    let _e634 = u_xlat2_;
    let _e636 = u_xlat2_;
    let _e638 = u_xlat3_;
    let _e640 = (_e636.xyz + _e638.xyz);
    u_xlat2_.x = _e640.x;
    u_xlat2_.y = _e640.y;
    u_xlat2_.z = _e640.z;
    let _e647 = u_xlat1_;
    let _e649 = u_xlat2_;
    let _e651 = u_xlat1_;
    let _e654 = u_xlat0_;
    let _e657 = ((_e649.xyz * _e651.xyz) + -(_e654.xyz));
    u_xlat1_.x = _e657.x;
    u_xlat1_.y = _e657.y;
    u_xlat1_.z = _e657.z;
    let _e664 = SV_TARGET0_;
    let _e669 = _f_buffer4_.f_cb4_[2];
    let _e671 = u_xlat1_;
    let _e674 = u_xlat0_;
    let _e676 = ((_e669.zzz * _e671.xyz) + _e674.xyz);
    SV_TARGET0_.x = _e676.x;
    SV_TARGET0_.y = _e676.y;
    SV_TARGET0_.z = _e676.z;
    SV_TARGET0_.w = 1f;
    return;
}

@fragment 
fn main(@location(12) vs_NORMAL0_: vec3<f32>, @location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec2<f32>, @location(2) vs_TEXCOORD2_: vec3<f32>, @location(3) vs_TEXCOORDindex3_: vec4<f32>) -> FragmentOutput {
    vs_NORMAL0_1 = vs_NORMAL0_;
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_TEXCOORD2_1 = vs_TEXCOORD2_;
    vs_TEXCOORDindex3_1 = vs_TEXCOORDindex3_;
    main_1();
    let _e59 = SV_TARGET0_;
    return FragmentOutput(_e59);
}
