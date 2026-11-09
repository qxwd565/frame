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
    f_cb4_: array<vec4<f32>, 5>,
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
@group(3) @binding(5) 
var samplerf_s2_: sampler;
@group(3) @binding(0) 
var f_t0_: texture_depth_2d;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
@group(3) @binding(4) 
var f_t2_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD1_1: vec2<f32>;
var<private> vs_TEXCOORD2_1: vec3<f32>;
var<private> vs_NORMAL0_1: vec3<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlati1_: i32 = 0i;
    var u_xlatu1_: u32 = 0u;
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlatb2_: vec4<bool> = vec4(false);
    var u_xlat3_: vec4<f32> = vec4(0f);
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlat5_: vec3<f32> = vec3(0f);
    var u_xlati5_: i32 = 0i;
    var u_xlat6_: vec3<f32> = vec3(0f);
    var u_xlat8_: vec3<f32> = vec3(0f);
    var u_xlatb9_: bool = false;
    var u_xlat23_: f32 = 0f;
    var u_xlatu23_: u32 = 0u;
    var u_xlatu24_: u32 = 0u;
    var u_xlat25_: f32 = 0f;
    var u_xlati25_: i32 = 0i;
    var u_xlatu25_: u32 = 0u;
    var u_xlatb25_: bool = false;
    var u_xlat26_: f32 = 0f;
    var local: f32;
    var local_1: f32;
    var local_2: f32;
    var local_3: f32;
    var local_4: f32;
    var local_5: f32;
    var local_6: f32;
    var txVec0_: vec3<f32>;
    var local_7: f32;
    var u_xlatu_loop_1_: u32 = 0u;
    var local_8: array<vec4<u32>, 4> = ImmCB_0_;

    let _e102 = vs_TEXCOORD0_1;
    let _e107 = _f_buffer0_.f_cb0_[4];
    let _e112 = hscard_bias.values[1];
    let _e115 = textureSampleBias(f_t1_, samplerf_s1_, _e102.xy, (_e107.x + _e112.x));
    u_xlat0_ = _e115;
    let _e116 = vs_TEXCOORD1_1;
    let _e121 = _f_buffer0_.f_cb0_[4];
    let _e126 = hscard_bias.values[2];
    let _e129 = textureSampleBias(f_t2_, samplerf_s2_, _e116.xy, (_e121.x + _e126.x));
    u_xlat1_ = _e129;
    let _e130 = u_xlat1_;
    let _e132 = u_xlat0_;
    let _e135 = u_xlat1_;
    let _e137 = (-(_e132.xyz) + _e135.xyz);
    u_xlat1_.x = _e137.x;
    u_xlat1_.y = _e137.y;
    u_xlat1_.z = _e137.z;
    let _e144 = u_xlat0_;
    let _e149 = _f_buffer4_.f_cb4_[4];
    let _e151 = u_xlat1_;
    let _e154 = u_xlat0_;
    let _e156 = ((_e149.xxx * _e151.xyz) + _e154.xyz);
    u_xlat0_.x = _e156.x;
    u_xlat0_.y = _e156.y;
    u_xlat0_.z = _e156.z;
    let _e167 = _f_buffer4_.f_cb4_[4];
    u_xlat1_.x = _e167.y;
    let _e170 = u_xlat1_;
    u_xlat1_.x = clamp(_e170.x, 0f, 1f);
    let _e176 = u_xlat1_;
    u_xlat8_.x = (-(_e176.x) + 1f);
    let _e181 = u_xlat8_;
    let _e183 = u_xlat0_;
    let _e185 = u_xlat8_;
    let _e187 = (_e183.xyz * _e185.xxx);
    u_xlat8_.x = _e187.x;
    u_xlat8_.y = _e187.y;
    u_xlat8_.z = _e187.z;
    let _e195 = u_xlat1_;
    let _e200 = _f_buffer4_.f_cb4_[4];
    u_xlat1_.x = (_e195.x + _e200.z);
    let _e203 = u_xlat0_;
    let _e205 = u_xlat0_;
    let _e207 = u_xlat1_;
    let _e209 = (_e205.xyz * _e207.xxx);
    u_xlat0_.x = _e209.x;
    u_xlat0_.y = _e209.y;
    u_xlat0_.z = _e209.z;
    let _e216 = u_xlat2_;
    let _e218 = vs_TEXCOORD2_1;
    let _e223 = _f_buffer3_.f_cb3_[20];
    let _e226 = (_e218.xyz + -(_e223.xyz));
    u_xlat2_.x = _e226.x;
    u_xlat2_.y = _e226.y;
    u_xlat2_.z = _e226.z;
    let _e233 = u_xlat3_;
    let _e235 = vs_TEXCOORD2_1;
    let _e240 = _f_buffer3_.f_cb3_[21];
    let _e243 = (_e235.xyz + -(_e240.xyz));
    u_xlat3_.x = _e243.x;
    u_xlat3_.y = _e243.y;
    u_xlat3_.z = _e243.z;
    let _e250 = u_xlat4_;
    let _e252 = vs_TEXCOORD2_1;
    let _e257 = _f_buffer3_.f_cb3_[22];
    let _e260 = (_e252.xyz + -(_e257.xyz));
    u_xlat4_.x = _e260.x;
    u_xlat4_.y = _e260.y;
    u_xlat4_.z = _e260.z;
    let _e267 = u_xlat5_;
    let _e269 = vs_TEXCOORD2_1;
    let _e274 = _f_buffer3_.f_cb3_[23];
    let _e277 = (_e269.xyz + -(_e274.xyz));
    u_xlat5_.x = _e277.x;
    u_xlat5_.y = _e277.y;
    u_xlat5_.z = _e277.z;
    let _e285 = u_xlat2_;
    let _e287 = u_xlat2_;
    u_xlat2_.x = dot(_e285.xyz, _e287.xyz);
    let _e291 = u_xlat3_;
    let _e293 = u_xlat3_;
    u_xlat2_.y = dot(_e291.xyz, _e293.xyz);
    let _e297 = u_xlat4_;
    let _e299 = u_xlat4_;
    u_xlat2_.z = dot(_e297.xyz, _e299.xyz);
    let _e303 = u_xlat5_;
    let _e305 = u_xlat5_;
    u_xlat2_.w = dot(_e303.xyz, _e305.xyz);
    let _e308 = u_xlat2_;
    let _e312 = _f_buffer3_.f_cb3_[24];
    u_xlatb2_ = (_e308 < _e312);
    let _e315 = u_xlatb2_;
    if _e315.x {
        local = 1f;
    } else {
        local = 0f;
    }
    let _e321 = local;
    u_xlat3_.x = _e321;
    let _e323 = u_xlatb2_;
    if _e323.y {
        local_1 = 1f;
    } else {
        local_1 = 0f;
    }
    let _e329 = local_1;
    u_xlat3_.y = _e329;
    let _e331 = u_xlatb2_;
    if _e331.z {
        local_2 = 1f;
    } else {
        local_2 = 0f;
    }
    let _e337 = local_2;
    u_xlat3_.z = _e337;
    let _e339 = u_xlatb2_;
    if _e339.w {
        local_3 = 1f;
    } else {
        local_3 = 0f;
    }
    let _e345 = local_3;
    u_xlat3_.w = _e345;
    let _e347 = u_xlatb2_;
    if _e347.x {
        local_4 = -1f;
    } else {
        local_4 = -0f;
    }
    let _e356 = local_4;
    u_xlat2_.x = _e356;
    let _e358 = u_xlatb2_;
    if _e358.y {
        local_5 = -1f;
    } else {
        local_5 = -0f;
    }
    let _e367 = local_5;
    u_xlat2_.y = _e367;
    let _e369 = u_xlatb2_;
    if _e369.z {
        local_6 = -1f;
    } else {
        local_6 = -0f;
    }
    let _e378 = local_6;
    u_xlat2_.z = _e378;
    let _e379 = u_xlat2_;
    let _e381 = u_xlat2_;
    let _e383 = u_xlat3_;
    let _e385 = (_e381.xyz + _e383.yzw);
    u_xlat2_.x = _e385.x;
    u_xlat2_.y = _e385.y;
    u_xlat2_.z = _e385.z;
    let _e392 = u_xlat3_;
    let _e394 = u_xlat2_;
    let _e400 = max(_e394.xyz, vec3<f32>(0f, 0f, 0f));
    u_xlat3_.y = _e400.x;
    u_xlat3_.z = _e400.y;
    u_xlat3_.w = _e400.z;
    let _e408 = u_xlat3_;
    u_xlat1_.x = dot(_e408, vec4<f32>(4f, 3f, 2f, 1f));
    let _e416 = u_xlat1_;
    u_xlat1_.x = (-(_e416.x) + 4f);
    let _e421 = u_xlat1_;
    u_xlatu1_ = u32(_e421.x);
    let _e424 = u_xlatu1_;
    u_xlati1_ = (i32(_e424) << 2u);
    let _e429 = u_xlat2_;
    let _e431 = vs_TEXCOORD2_1;
    let _e433 = u_xlati1_;
    let _e438 = _f_buffer3_.f_cb3_[(_e433 + 1i)];
    let _e440 = (_e431.yyy * _e438.xyz);
    u_xlat2_.x = _e440.x;
    u_xlat2_.y = _e440.y;
    u_xlat2_.z = _e440.z;
    let _e447 = u_xlat2_;
    let _e449 = u_xlati1_;
    let _e452 = _f_buffer3_.f_cb3_[_e449];
    let _e454 = vs_TEXCOORD2_1;
    let _e457 = u_xlat2_;
    let _e459 = ((_e452.xyz * _e454.xxx) + _e457.xyz);
    u_xlat2_.x = _e459.x;
    u_xlat2_.y = _e459.y;
    u_xlat2_.z = _e459.z;
    let _e466 = u_xlat2_;
    let _e468 = u_xlati1_;
    let _e473 = _f_buffer3_.f_cb3_[(_e468 + 2i)];
    let _e475 = vs_TEXCOORD2_1;
    let _e478 = u_xlat2_;
    let _e480 = ((_e473.xyz * _e475.zzz) + _e478.xyz);
    u_xlat2_.x = _e480.x;
    u_xlat2_.y = _e480.y;
    u_xlat2_.z = _e480.z;
    let _e487 = u_xlat2_;
    let _e489 = u_xlat2_;
    let _e491 = u_xlati1_;
    let _e496 = _f_buffer3_.f_cb3_[(_e491 + 3i)];
    let _e498 = (_e489.xyz + _e496.xyz);
    u_xlat2_.x = _e498.x;
    u_xlat2_.y = _e498.y;
    u_xlat2_.z = _e498.z;
    let _e506 = vs_NORMAL0_1;
    let _e508 = vs_NORMAL0_1;
    u_xlat1_.x = dot(_e506.xyz, _e508.xyz);
    let _e512 = u_xlat1_;
    u_xlat1_.x = inverseSqrt(_e512.x);
    let _e515 = u_xlat3_;
    let _e517 = u_xlat1_;
    let _e519 = vs_NORMAL0_1;
    let _e521 = (_e517.xxx * _e519.xyz);
    u_xlat3_.x = _e521.x;
    u_xlat3_.y = _e521.y;
    u_xlat3_.z = _e521.z;
    let _e528 = u_xlat2_;
    let _e529 = _e528.xy;
    let _e530 = u_xlat2_;
    txVec0_ = vec3<f32>(_e529.x, _e529.y, _e530.z);
    let _e537 = txVec0_;
    let _e541 = textureSampleCompareLevel(f_t0_, samplerf_s0_, _e537.xy, _e537.z);
    u_xlat1_.x = _e541;
    let _e546 = _f_buffer3_.f_cb3_[27];
    u_xlat2_.x = (-(_e546.x) + 1f);
    let _e552 = u_xlat1_;
    let _e557 = _f_buffer3_.f_cb3_[27];
    let _e560 = u_xlat2_;
    u_xlat1_.x = ((_e552.x * _e557.x) + _e560.x);
    let _e565 = u_xlat2_;
    u_xlatb2_.x = (0f >= _e565.z);
    let _e568 = u_xlat2_;
    u_xlatb9_ = (_e568.z >= 1f);
    let _e573 = u_xlatb9_;
    let _e574 = u_xlatb2_;
    u_xlatb2_.x = (_e573 || _e574.x);
    let _e578 = u_xlatb2_;
    if _e578.x {
        local_7 = 1f;
    } else {
        let _e581 = u_xlat1_;
        local_7 = _e581.x;
    }
    let _e584 = local_7;
    u_xlat1_.x = _e584;
    let _e586 = u_xlat1_;
    let _e591 = _f_buffer2_.f_cb2_[11];
    u_xlat1_.x = (_e586.x * _e591.z);
    let _e594 = u_xlat2_;
    let _e596 = u_xlat1_;
    let _e601 = _f_buffer0_.f_cb0_[6];
    let _e603 = (_e596.xxx * _e601.xyz);
    u_xlat2_.x = _e603.x;
    u_xlat2_.y = _e603.y;
    u_xlat2_.z = _e603.z;
    let _e611 = u_xlat3_;
    let _e616 = _f_buffer0_.f_cb0_[5];
    u_xlat1_.x = dot(_e611.xyz, _e616.xyz);
    let _e620 = u_xlat1_;
    u_xlat1_.x = clamp(_e620.x, 0f, 1f);
    let _e628 = _f_buffer0_.f_cb0_[10];
    let _e633 = _f_buffer2_.f_cb2_[11];
    u_xlat23_ = min(_e628.x, _e633.y);
    let _e636 = u_xlat23_;
    u_xlatu23_ = u32(i32(_e636));
    u_xlat4_.x = 0f;
    u_xlat4_.y = 0f;
    u_xlat4_.z = 0f;
    loop {
        let _e650 = u_xlatu_loop_1_;
        let _e651 = u_xlatu23_;
        if !((_e650 < _e651)) {
            break;
        }
        {
            let _e657 = u_xlatu_loop_1_;
            u_xlatu25_ = (_e657 >> 2u);
            let _e660 = u_xlatu_loop_1_;
            u_xlati5_ = i32((_e660 & 3u));
            let _e664 = u_xlatu25_;
            let _e670 = _f_buffer2_.f_cb2_[(i32(_e664) + 12i)];
            let _e671 = u_xlati5_;
            let _e675 = local_8[_e671];
            u_xlat25_ = dot(_e670, bitcast<vec4<f32>>(_e675));
            let _e678 = u_xlat25_;
            u_xlati25_ = i32(_e678);
            let _e680 = u_xlat5_;
            let _e682 = vs_TEXCOORD2_1;
            let _e685 = u_xlati25_;
            let _e688 = _f_buffer1_.f_cb1_[_e685];
            let _e691 = u_xlati25_;
            let _e694 = _f_buffer1_.f_cb1_[_e691];
            let _e696 = ((-(_e682.xyz) * _e688.www) + _e694.xyz);
            u_xlat5_.x = _e696.x;
            u_xlat5_.y = _e696.y;
            u_xlat5_.z = _e696.z;
            let _e703 = u_xlat5_;
            let _e705 = u_xlat5_;
            u_xlat26_ = dot(_e703.xyz, _e705.xyz);
            let _e708 = u_xlat26_;
            u_xlat26_ = max(_e708, 0.000061035156f);
            let _e712 = u_xlat26_;
            u_xlat6_.x = inverseSqrt(_e712);
            let _e714 = u_xlat5_;
            let _e716 = u_xlat5_;
            let _e718 = u_xlat6_;
            let _e720 = (_e716.xyz * _e718.xxx);
            u_xlat5_.x = _e720.x;
            u_xlat5_.y = _e720.y;
            u_xlat5_.z = _e720.z;
            let _e730 = u_xlati25_;
            let _e735 = _f_buffer1_.f_cb1_[(_e730 + 512i)];
            u_xlat6_.x = (1f / _e735.x);
            let _e738 = u_xlat26_;
            u_xlat26_ = (_e738 * 25f);
            let _e741 = u_xlat26_;
            let _e742 = u_xlat6_;
            u_xlat26_ = (_e741 / _e742.x);
            let _e745 = u_xlat26_;
            u_xlat26_ = (_e745 + 1f);
            let _e750 = u_xlat26_;
            u_xlat26_ = (1f / _e750);
            let _e753 = u_xlati25_;
            let _e758 = _f_buffer1_.f_cb1_[(_e753 + 768i)];
            let _e760 = u_xlat5_;
            u_xlat6_.x = dot(_e758.xyz, _e760.xyz);
            let _e764 = u_xlat6_;
            let _e766 = u_xlati25_;
            let _e771 = _f_buffer1_.f_cb1_[(_e766 + 512i)];
            let _e774 = u_xlati25_;
            let _e779 = _f_buffer1_.f_cb1_[(_e774 + 512i)];
            u_xlat6_.x = ((_e764.x * _e771.z) + _e779.w);
            let _e783 = u_xlat6_;
            u_xlat6_.x = clamp(_e783.x, 0f, 1f);
            let _e789 = u_xlat6_;
            let _e791 = u_xlat6_;
            u_xlat6_.x = (_e789.x * _e791.x);
            let _e794 = u_xlat26_;
            let _e795 = u_xlat6_;
            u_xlat26_ = (_e794 * _e795.x);
            let _e798 = u_xlat6_;
            let _e800 = u_xlat26_;
            let _e802 = u_xlati25_;
            let _e807 = _f_buffer1_.f_cb1_[(_e802 + 256i)];
            let _e809 = (vec3(_e800) * _e807.xyz);
            u_xlat6_.x = _e809.x;
            u_xlat6_.y = _e809.y;
            u_xlat6_.z = _e809.z;
            let _e816 = u_xlat3_;
            let _e818 = u_xlat5_;
            u_xlat25_ = dot(_e816.xyz, _e818.xyz);
            let _e821 = u_xlat25_;
            u_xlat25_ = clamp(_e821, 0f, 1f);
            let _e825 = u_xlat4_;
            let _e827 = u_xlat6_;
            let _e829 = u_xlat25_;
            let _e832 = u_xlat4_;
            let _e834 = ((_e827.xyz * vec3(_e829)) + _e832.xyz);
            u_xlat4_.x = _e834.x;
            u_xlat4_.y = _e834.y;
            u_xlat4_.z = _e834.z;
        }
        continuing {
            let _e654 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e654 + 1u);
        }
    }
    let _e841 = u_xlat2_;
    let _e843 = u_xlat2_;
    let _e845 = u_xlat1_;
    let _e848 = u_xlat4_;
    let _e850 = ((_e843.xyz * _e845.xxx) + _e848.xyz);
    u_xlat2_.x = _e850.x;
    u_xlat2_.y = _e850.y;
    u_xlat2_.z = _e850.z;
    let _e861 = _f_buffer2_.f_cb2_[27];
    u_xlat3_.x = abs(_e861.w);
    let _e868 = _f_buffer2_.f_cb2_[28];
    u_xlat3_.y = abs(_e868.w);
    let _e875 = _f_buffer2_.f_cb2_[29];
    u_xlat3_.z = abs(_e875.w);
    let _e878 = u_xlat3_;
    let _e880 = u_xlat3_;
    let _e882 = log2(_e880.xyz);
    u_xlat3_.x = _e882.x;
    u_xlat3_.y = _e882.y;
    u_xlat3_.z = _e882.z;
    let _e889 = u_xlat3_;
    let _e891 = u_xlat3_;
    let _e897 = (_e891.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat3_.x = _e897.x;
    u_xlat3_.y = _e897.y;
    u_xlat3_.z = _e897.z;
    let _e904 = u_xlat3_;
    let _e906 = u_xlat3_;
    let _e908 = exp2(_e906.xyz);
    u_xlat3_.x = _e908.x;
    u_xlat3_.y = _e908.y;
    u_xlat3_.z = _e908.z;
    let _e915 = u_xlat3_;
    let _e917 = u_xlat3_;
    let _e931 = ((_e917.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat3_.x = _e931.x;
    u_xlat3_.y = _e931.y;
    u_xlat3_.z = _e931.z;
    let _e938 = u_xlat3_;
    let _e940 = u_xlat3_;
    let _e946 = clamp(_e940.xyz, vec3(0f), vec3(1f));
    u_xlat3_.x = _e946.x;
    u_xlat3_.y = _e946.y;
    u_xlat3_.z = _e946.z;
    let _e953 = u_xlat2_;
    let _e955 = u_xlat2_;
    let _e957 = u_xlat3_;
    let _e959 = (_e955.xyz + _e957.xyz);
    u_xlat2_.x = _e959.x;
    u_xlat2_.y = _e959.y;
    u_xlat2_.z = _e959.z;
    let _e966 = SV_Target0_;
    let _e968 = u_xlat8_;
    let _e970 = u_xlat2_;
    let _e973 = u_xlat0_;
    let _e975 = ((_e968.xyz * _e970.xyz) + _e973.xyz);
    SV_Target0_.x = _e975.x;
    SV_Target0_.y = _e975.y;
    SV_Target0_.z = _e975.z;
    let _e983 = u_xlat0_;
    SV_Target0_.w = _e983.w;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec2<f32>, @location(2) vs_TEXCOORD2_: vec3<f32>, @location(12) vs_NORMAL0_: vec3<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_TEXCOORD2_1 = vs_TEXCOORD2_;
    vs_NORMAL0_1 = vs_NORMAL0_;
    main_1();
    let _e51 = SV_Target0_;
    return FragmentOutput(_e51);
}
