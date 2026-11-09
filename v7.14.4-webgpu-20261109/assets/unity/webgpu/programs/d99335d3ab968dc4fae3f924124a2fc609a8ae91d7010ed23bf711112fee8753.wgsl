struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 22>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 1024>,
}

struct f_buffer2_ {
    f_cb2_: array<vec4<f32>, 34>,
}

struct f_buffer3_ {
    f_cb3_: array<vec4<f32>, 6>,
}

struct f_buffer4_ {
    f_cb4_: array<vec4<f32>, 28>,
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
var samplerf_s0_: sampler;
@group(3) @binding(3) 
var samplerf_s1_: sampler;
@group(3) @binding(5) 
var samplerf_s2_: sampler_comparison;
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
@group(3) @binding(4) 
var f_t2_: texture_depth_2d;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD1_1: vec3<f32>;
var<private> vs_TEXCOORD2_1: vec3<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec4<f32> = vec4(0f);
    var u_xlatb3_: vec4<bool> = vec4(false);
    var u_xlat4_: vec4<f32> = vec4(0f);
    var u_xlat5_: vec4<f32> = vec4(0f);
    var u_xlatb5_: vec3<bool> = vec3(false);
    var u_xlat6_: vec3<f32> = vec3(0f);
    var u_xlat7_: vec3<f32> = vec3(0f);
    var u_xlat8_: vec3<f32> = vec3(0f);
    var u_xlatb8_: bool = false;
    var u_xlat25_: f32 = 0f;
    var u_xlati25_: i32 = 0i;
    var u_xlatu25_: u32 = 0u;
    var u_xlat26_: f32 = 0f;
    var u_xlatu26_: u32 = 0u;
    var u_xlatb26_: bool = false;
    var u_xlat27_: f32 = 0f;
    var u_xlati27_: i32 = 0i;
    var u_xlatu27_: u32 = 0u;
    var u_xlatb27_: bool = false;
    var u_xlat28_: f32 = 0f;
    var u_xlati28_: i32 = 0i;
    var u_xlat29_: f32 = 0f;
    var local: f32;
    var local_1: f32;
    var local_2: f32;
    var local_3: f32;
    var local_4: f32;
    var local_5: f32;
    var local_6: f32;
    var hlslcc_movcTemp: vec4<f32>;
    var local_7: f32;
    var local_8: f32;
    var local_9: f32;
    var txVec0_: vec3<f32>;
    var local_10: f32;
    var u_xlatu_loop_1_: u32 = 0u;
    var local_11: array<vec4<u32>, 4> = ImmCB_0_;
    var local_12: f32;

    let _e115 = vs_TEXCOORD0_1;
    let _e120 = _f_buffer0_.f_cb0_[4];
    let _e125 = hscard_bias.values[0];
    let _e128 = textureSampleBias(f_t0_, samplerf_s0_, _e115.xy, (_e120.x + _e125.x));
    u_xlat0_ = _e128;
    let _e129 = u_xlat0_;
    let _e134 = _f_buffer3_.f_cb3_[2];
    u_xlat0_ = (_e129.wxyz * _e134.wxyz);
    let _e137 = vs_TEXCOORD0_1;
    let _e142 = _f_buffer0_.f_cb0_[4];
    let _e147 = hscard_bias.values[1];
    let _e150 = textureSampleBias(f_t1_, samplerf_s1_, _e137.xy, (_e142.x + _e147.x));
    u_xlat1_ = _e150;
    let _e151 = vs_TEXCOORD2_1;
    let _e153 = vs_TEXCOORD2_1;
    u_xlat25_ = dot(_e151.xyz, _e153.xyz);
    let _e156 = u_xlat25_;
    u_xlat25_ = inverseSqrt(_e156);
    let _e158 = u_xlat2_;
    let _e160 = u_xlat25_;
    let _e162 = vs_TEXCOORD2_1;
    let _e164 = (vec3(_e160) * _e162.xyz);
    u_xlat2_.x = _e164.x;
    u_xlat2_.y = _e164.y;
    u_xlat2_.z = _e164.z;
    let _e171 = u_xlat3_;
    let _e173 = vs_TEXCOORD1_1;
    let _e178 = _f_buffer4_.f_cb4_[20];
    let _e181 = (_e173.xyz + -(_e178.xyz));
    u_xlat3_.x = _e181.x;
    u_xlat3_.y = _e181.y;
    u_xlat3_.z = _e181.z;
    let _e188 = u_xlat4_;
    let _e190 = vs_TEXCOORD1_1;
    let _e195 = _f_buffer4_.f_cb4_[21];
    let _e198 = (_e190.xyz + -(_e195.xyz));
    u_xlat4_.x = _e198.x;
    u_xlat4_.y = _e198.y;
    u_xlat4_.z = _e198.z;
    let _e205 = u_xlat5_;
    let _e207 = vs_TEXCOORD1_1;
    let _e212 = _f_buffer4_.f_cb4_[22];
    let _e215 = (_e207.xyz + -(_e212.xyz));
    u_xlat5_.x = _e215.x;
    u_xlat5_.y = _e215.y;
    u_xlat5_.z = _e215.z;
    let _e222 = u_xlat6_;
    let _e224 = vs_TEXCOORD1_1;
    let _e229 = _f_buffer4_.f_cb4_[23];
    let _e232 = (_e224.xyz + -(_e229.xyz));
    u_xlat6_.x = _e232.x;
    u_xlat6_.y = _e232.y;
    u_xlat6_.z = _e232.z;
    let _e240 = u_xlat3_;
    let _e242 = u_xlat3_;
    u_xlat3_.x = dot(_e240.xyz, _e242.xyz);
    let _e246 = u_xlat4_;
    let _e248 = u_xlat4_;
    u_xlat3_.y = dot(_e246.xyz, _e248.xyz);
    let _e252 = u_xlat5_;
    let _e254 = u_xlat5_;
    u_xlat3_.z = dot(_e252.xyz, _e254.xyz);
    let _e258 = u_xlat6_;
    let _e260 = u_xlat6_;
    u_xlat3_.w = dot(_e258.xyz, _e260.xyz);
    let _e263 = u_xlat3_;
    let _e267 = _f_buffer4_.f_cb4_[24];
    u_xlatb3_ = (_e263 < _e267);
    let _e270 = u_xlatb3_;
    if _e270.x {
        local = 1f;
    } else {
        local = 0f;
    }
    let _e276 = local;
    u_xlat4_.x = _e276;
    let _e278 = u_xlatb3_;
    if _e278.y {
        local_1 = 1f;
    } else {
        local_1 = 0f;
    }
    let _e284 = local_1;
    u_xlat4_.y = _e284;
    let _e286 = u_xlatb3_;
    if _e286.z {
        local_2 = 1f;
    } else {
        local_2 = 0f;
    }
    let _e292 = local_2;
    u_xlat4_.z = _e292;
    let _e294 = u_xlatb3_;
    if _e294.w {
        local_3 = 1f;
    } else {
        local_3 = 0f;
    }
    let _e300 = local_3;
    u_xlat4_.w = _e300;
    let _e302 = u_xlatb3_;
    if _e302.x {
        local_4 = -1f;
    } else {
        local_4 = -0f;
    }
    let _e311 = local_4;
    u_xlat3_.x = _e311;
    let _e313 = u_xlatb3_;
    if _e313.y {
        local_5 = -1f;
    } else {
        local_5 = -0f;
    }
    let _e322 = local_5;
    u_xlat3_.y = _e322;
    let _e324 = u_xlatb3_;
    if _e324.z {
        local_6 = -1f;
    } else {
        local_6 = -0f;
    }
    let _e333 = local_6;
    u_xlat3_.z = _e333;
    let _e334 = u_xlat3_;
    let _e336 = u_xlat3_;
    let _e338 = u_xlat4_;
    let _e340 = (_e336.xyz + _e338.yzw);
    u_xlat3_.x = _e340.x;
    u_xlat3_.y = _e340.y;
    u_xlat3_.z = _e340.z;
    let _e347 = u_xlat4_;
    let _e349 = u_xlat3_;
    let _e355 = max(_e349.xyz, vec3<f32>(0f, 0f, 0f));
    u_xlat4_.y = _e355.x;
    u_xlat4_.z = _e355.y;
    u_xlat4_.w = _e355.z;
    let _e362 = u_xlat4_;
    u_xlat25_ = dot(_e362, vec4<f32>(4f, 3f, 2f, 1f));
    let _e369 = u_xlat25_;
    u_xlat25_ = (-(_e369) + 4f);
    let _e373 = u_xlat25_;
    u_xlatu25_ = u32(_e373);
    let _e375 = u_xlatu25_;
    u_xlati25_ = (i32(_e375) << 2u);
    let _e380 = u_xlat3_;
    let _e382 = vs_TEXCOORD1_1;
    let _e384 = u_xlati25_;
    let _e389 = _f_buffer4_.f_cb4_[(_e384 + 1i)];
    let _e391 = (_e382.yyy * _e389.xyz);
    u_xlat3_.x = _e391.x;
    u_xlat3_.y = _e391.y;
    u_xlat3_.z = _e391.z;
    let _e398 = u_xlat3_;
    let _e400 = u_xlati25_;
    let _e403 = _f_buffer4_.f_cb4_[_e400];
    let _e405 = vs_TEXCOORD1_1;
    let _e408 = u_xlat3_;
    let _e410 = ((_e403.xyz * _e405.xxx) + _e408.xyz);
    u_xlat3_.x = _e410.x;
    u_xlat3_.y = _e410.y;
    u_xlat3_.z = _e410.z;
    let _e417 = u_xlat3_;
    let _e419 = u_xlati25_;
    let _e424 = _f_buffer4_.f_cb4_[(_e419 + 2i)];
    let _e426 = vs_TEXCOORD1_1;
    let _e429 = u_xlat3_;
    let _e431 = ((_e424.xyz * _e426.zzz) + _e429.xyz);
    u_xlat3_.x = _e431.x;
    u_xlat3_.y = _e431.y;
    u_xlat3_.z = _e431.z;
    let _e438 = u_xlat3_;
    let _e440 = u_xlat3_;
    let _e442 = u_xlati25_;
    let _e447 = _f_buffer4_.f_cb4_[(_e442 + 3i)];
    let _e449 = (_e440.xyz + _e447.xyz);
    u_xlat3_.x = _e449.x;
    u_xlat3_.y = _e449.y;
    u_xlat3_.z = _e449.z;
    u_xlat2_.w = 1f;
    let _e462 = _f_buffer2_.f_cb2_[27];
    let _e463 = u_xlat2_;
    u_xlat4_.x = dot(_e462, _e463);
    let _e469 = _f_buffer2_.f_cb2_[28];
    let _e470 = u_xlat2_;
    u_xlat4_.y = dot(_e469, _e470);
    let _e476 = _f_buffer2_.f_cb2_[29];
    let _e477 = u_xlat2_;
    u_xlat4_.z = dot(_e476, _e477);
    let _e479 = u_xlat2_;
    let _e481 = u_xlat2_;
    u_xlat5_ = (_e479.yzzx * _e481.xyzz);
    let _e488 = _f_buffer2_.f_cb2_[30];
    let _e489 = u_xlat5_;
    u_xlat6_.x = dot(_e488, _e489);
    let _e495 = _f_buffer2_.f_cb2_[31];
    let _e496 = u_xlat5_;
    u_xlat6_.y = dot(_e495, _e496);
    let _e502 = _f_buffer2_.f_cb2_[32];
    let _e503 = u_xlat5_;
    u_xlat6_.z = dot(_e502, _e503);
    let _e505 = u_xlat2_;
    let _e507 = u_xlat2_;
    u_xlat25_ = (_e505.y * _e507.y);
    let _e510 = u_xlat2_;
    let _e512 = u_xlat2_;
    let _e515 = u_xlat25_;
    u_xlat25_ = ((_e510.x * _e512.x) + -(_e515));
    let _e518 = u_xlat5_;
    let _e523 = _f_buffer2_.f_cb2_[33];
    let _e525 = u_xlat25_;
    let _e528 = u_xlat6_;
    let _e530 = ((_e523.xyz * vec3(_e525)) + _e528.xyz);
    u_xlat5_.x = _e530.x;
    u_xlat5_.y = _e530.y;
    u_xlat5_.z = _e530.z;
    let _e537 = u_xlat4_;
    let _e539 = u_xlat4_;
    let _e541 = u_xlat5_;
    let _e543 = (_e539.xyz + _e541.xyz);
    u_xlat4_.x = _e543.x;
    u_xlat4_.y = _e543.y;
    u_xlat4_.z = _e543.z;
    let _e550 = u_xlatb5_;
    let _e557 = u_xlat4_;
    let _e560 = (vec4<f32>(0.0031308f, 0.0031308f, 0.0031308f, 0f) >= _e557.xyzx).xyz;
    u_xlatb5_.x = _e560.x;
    u_xlatb5_.y = _e560.y;
    u_xlatb5_.z = _e560.z;
    let _e567 = u_xlat6_;
    let _e569 = u_xlat4_;
    let _e575 = (_e569.xyz * vec3<f32>(12.92321f, 12.92321f, 12.92321f));
    u_xlat6_.x = _e575.x;
    u_xlat6_.y = _e575.y;
    u_xlat6_.z = _e575.z;
    let _e582 = u_xlat4_;
    let _e584 = u_xlat4_;
    let _e587 = log2(abs(_e584.xyz));
    u_xlat4_.x = _e587.x;
    u_xlat4_.y = _e587.y;
    u_xlat4_.z = _e587.z;
    let _e594 = u_xlat4_;
    let _e596 = u_xlat4_;
    let _e602 = (_e596.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat4_.x = _e602.x;
    u_xlat4_.y = _e602.y;
    u_xlat4_.z = _e602.z;
    let _e609 = u_xlat4_;
    let _e611 = u_xlat4_;
    let _e613 = exp2(_e611.xyz);
    u_xlat4_.x = _e613.x;
    u_xlat4_.y = _e613.y;
    u_xlat4_.z = _e613.z;
    let _e620 = u_xlat4_;
    let _e622 = u_xlat4_;
    let _e636 = ((_e622.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat4_.x = _e636.x;
    u_xlat4_.y = _e636.y;
    u_xlat4_.z = _e636.z;
    {
        let _e643 = u_xlat4_;
        hlslcc_movcTemp = _e643;
        let _e646 = u_xlatb5_;
        if _e646.x {
            let _e648 = u_xlat6_;
            local_7 = _e648.x;
        } else {
            let _e650 = u_xlat4_;
            local_7 = _e650.x;
        }
        let _e653 = local_7;
        hlslcc_movcTemp.x = _e653;
        let _e655 = u_xlatb5_;
        if _e655.y {
            let _e657 = u_xlat6_;
            local_8 = _e657.y;
        } else {
            let _e659 = u_xlat4_;
            local_8 = _e659.y;
        }
        let _e662 = local_8;
        hlslcc_movcTemp.y = _e662;
        let _e664 = u_xlatb5_;
        if _e664.z {
            let _e666 = u_xlat6_;
            local_9 = _e666.z;
        } else {
            let _e668 = u_xlat4_;
            local_9 = _e668.z;
        }
        let _e671 = local_9;
        hlslcc_movcTemp.z = _e671;
        let _e672 = hlslcc_movcTemp;
        u_xlat4_ = _e672;
    }
    let _e673 = u_xlat3_;
    let _e674 = _e673.xy;
    let _e675 = u_xlat3_;
    txVec0_ = vec3<f32>(_e674.x, _e674.y, _e675.z);
    let _e681 = txVec0_;
    let _e685 = textureSampleCompareLevel(f_t2_, samplerf_s2_, _e681.xy, _e681.z);
    u_xlat25_ = _e685;
    let _e689 = _f_buffer4_.f_cb4_[27];
    u_xlat26_ = (-(_e689.x) + 1f);
    let _e694 = u_xlat25_;
    let _e698 = _f_buffer4_.f_cb4_[27];
    let _e701 = u_xlat26_;
    u_xlat25_ = ((_e694 * _e698.x) + _e701);
    let _e704 = u_xlat3_;
    u_xlatb26_ = (0f >= _e704.z);
    let _e708 = u_xlat3_;
    u_xlatb3_.x = (_e708.z >= 1f);
    let _e712 = u_xlatb26_;
    let _e713 = u_xlatb3_;
    u_xlatb26_ = (_e712 || _e713.x);
    let _e716 = u_xlatb26_;
    if _e716 {
        local_10 = 1f;
    } else {
        let _e718 = u_xlat25_;
        local_10 = _e718;
    }
    let _e720 = local_10;
    u_xlat25_ = _e720;
    let _e721 = u_xlat3_;
    let _e723 = vs_TEXCOORD1_1;
    let _e728 = _f_buffer0_.f_cb0_[21];
    let _e731 = (_e723.xyz + -(_e728.xyz));
    u_xlat3_.x = _e731.x;
    u_xlat3_.y = _e731.y;
    u_xlat3_.z = _e731.z;
    let _e738 = u_xlat3_;
    let _e740 = u_xlat3_;
    u_xlat26_ = dot(_e738.xyz, _e740.xyz);
    let _e743 = u_xlat26_;
    let _e747 = _f_buffer4_.f_cb4_[27];
    let _e753 = _f_buffer4_.f_cb4_[27];
    u_xlat26_ = ((_e743 * _e747.z) + _e753.w);
    let _e756 = u_xlat26_;
    u_xlat26_ = clamp(_e756, 0f, 1f);
    let _e761 = u_xlat25_;
    u_xlat3_.x = (-(_e761) + 1f);
    let _e765 = u_xlat26_;
    let _e766 = u_xlat3_;
    let _e769 = u_xlat25_;
    u_xlat25_ = ((_e765 * _e766.x) + _e769);
    let _e771 = u_xlat25_;
    let _e775 = _f_buffer2_.f_cb2_[11];
    u_xlat25_ = (_e771 * _e775.z);
    let _e778 = u_xlat3_;
    let _e780 = u_xlat25_;
    let _e785 = _f_buffer0_.f_cb0_[6];
    let _e787 = (vec3(_e780) * _e785.xyz);
    u_xlat3_.x = _e787.x;
    u_xlat3_.y = _e787.y;
    u_xlat3_.z = _e787.z;
    let _e794 = u_xlat2_;
    let _e799 = _f_buffer0_.f_cb0_[5];
    u_xlat25_ = dot(_e794.xyz, _e799.xyz);
    let _e802 = u_xlat25_;
    u_xlat25_ = clamp(_e802, 0f, 1f);
    let _e806 = u_xlat3_;
    let _e808 = u_xlat25_;
    let _e810 = u_xlat3_;
    let _e812 = (vec3(_e808) * _e810.xyz);
    u_xlat3_.x = _e812.x;
    u_xlat3_.y = _e812.y;
    u_xlat3_.z = _e812.z;
    let _e819 = u_xlat3_;
    let _e821 = u_xlat0_;
    let _e823 = u_xlat3_;
    let _e825 = (_e821.yzw * _e823.xyz);
    u_xlat3_.x = _e825.x;
    u_xlat3_.y = _e825.y;
    u_xlat3_.z = _e825.z;
    let _e835 = _f_buffer0_.f_cb0_[10];
    let _e840 = _f_buffer2_.f_cb2_[11];
    u_xlat25_ = min(_e835.x, _e840.y);
    let _e843 = u_xlat25_;
    u_xlatu25_ = u32(i32(_e843));
    u_xlat5_.x = 0f;
    u_xlat5_.y = 0f;
    u_xlat5_.z = 0f;
    loop {
        let _e857 = u_xlatu_loop_1_;
        let _e858 = u_xlatu25_;
        if !((_e857 < _e858)) {
            break;
        }
        {
            let _e864 = u_xlatu_loop_1_;
            u_xlatu27_ = (_e864 >> 2u);
            let _e867 = u_xlatu_loop_1_;
            u_xlati28_ = i32((_e867 & 3u));
            let _e871 = u_xlatu27_;
            let _e877 = _f_buffer2_.f_cb2_[(i32(_e871) + 12i)];
            let _e878 = u_xlati28_;
            let _e882 = local_11[_e878];
            u_xlat27_ = dot(_e877, bitcast<vec4<f32>>(_e882));
            let _e885 = u_xlat27_;
            u_xlati27_ = i32(_e885);
            let _e887 = u_xlat6_;
            let _e889 = vs_TEXCOORD1_1;
            let _e892 = u_xlati27_;
            let _e895 = _f_buffer1_.f_cb1_[_e892];
            let _e898 = u_xlati27_;
            let _e901 = _f_buffer1_.f_cb1_[_e898];
            let _e903 = ((-(_e889.xyz) * _e895.www) + _e901.xyz);
            u_xlat6_.x = _e903.x;
            u_xlat6_.y = _e903.y;
            u_xlat6_.z = _e903.z;
            let _e910 = u_xlat6_;
            let _e912 = u_xlat6_;
            u_xlat28_ = dot(_e910.xyz, _e912.xyz);
            let _e915 = u_xlat28_;
            u_xlat28_ = max(_e915, 0.000061035156f);
            let _e918 = u_xlat28_;
            u_xlat29_ = inverseSqrt(_e918);
            let _e920 = u_xlat6_;
            let _e922 = u_xlat29_;
            let _e924 = u_xlat6_;
            let _e926 = (vec3(_e922) * _e924.xyz);
            u_xlat6_.x = _e926.x;
            u_xlat6_.y = _e926.y;
            u_xlat6_.z = _e926.z;
            let _e935 = u_xlat28_;
            u_xlat29_ = (1f / _e935);
            let _e937 = u_xlat28_;
            let _e938 = u_xlati27_;
            let _e943 = _f_buffer1_.f_cb1_[(_e938 + 512i)];
            u_xlat28_ = (_e937 * _e943.x);
            let _e946 = u_xlat28_;
            let _e948 = u_xlat28_;
            u_xlat28_ = ((-(_e946) * _e948) + 1f);
            let _e952 = u_xlat28_;
            u_xlat28_ = max(_e952, 0f);
            let _e955 = u_xlat28_;
            let _e956 = u_xlat28_;
            u_xlat28_ = (_e955 * _e956);
            let _e958 = u_xlat28_;
            let _e959 = u_xlat29_;
            u_xlat28_ = (_e958 * _e959);
            let _e961 = u_xlati27_;
            let _e966 = _f_buffer1_.f_cb1_[(_e961 + 768i)];
            let _e968 = u_xlat6_;
            u_xlat29_ = dot(_e966.xyz, _e968.xyz);
            let _e971 = u_xlat29_;
            let _e972 = u_xlati27_;
            let _e977 = _f_buffer1_.f_cb1_[(_e972 + 512i)];
            let _e980 = u_xlati27_;
            let _e985 = _f_buffer1_.f_cb1_[(_e980 + 512i)];
            u_xlat29_ = ((_e971 * _e977.z) + _e985.w);
            let _e988 = u_xlat29_;
            u_xlat29_ = clamp(_e988, 0f, 1f);
            let _e992 = u_xlat29_;
            let _e993 = u_xlat29_;
            u_xlat29_ = (_e992 * _e993);
            let _e995 = u_xlat28_;
            let _e996 = u_xlat29_;
            u_xlat28_ = (_e995 * _e996);
            let _e998 = u_xlat7_;
            let _e1000 = u_xlat28_;
            let _e1002 = u_xlati27_;
            let _e1007 = _f_buffer1_.f_cb1_[(_e1002 + 256i)];
            let _e1009 = (vec3(_e1000) * _e1007.xyz);
            u_xlat7_.x = _e1009.x;
            u_xlat7_.y = _e1009.y;
            u_xlat7_.z = _e1009.z;
            let _e1016 = u_xlat2_;
            let _e1018 = u_xlat6_;
            u_xlat27_ = dot(_e1016.xyz, _e1018.xyz);
            let _e1021 = u_xlat27_;
            u_xlat27_ = clamp(_e1021, 0f, 1f);
            let _e1025 = u_xlat6_;
            let _e1027 = u_xlat27_;
            let _e1029 = u_xlat7_;
            let _e1031 = (vec3(_e1027) * _e1029.xyz);
            u_xlat6_.x = _e1031.x;
            u_xlat6_.y = _e1031.y;
            u_xlat6_.z = _e1031.z;
            let _e1038 = u_xlat5_;
            let _e1040 = u_xlat6_;
            let _e1042 = u_xlat0_;
            let _e1045 = u_xlat5_;
            let _e1047 = ((_e1040.xyz * _e1042.yzw) + _e1045.xyz);
            u_xlat5_.x = _e1047.x;
            u_xlat5_.y = _e1047.y;
            u_xlat5_.z = _e1047.z;
        }
        continuing {
            let _e861 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e861 + 1u);
        }
    }
    let _e1054 = u_xlat8_;
    let _e1056 = u_xlat4_;
    let _e1058 = u_xlat0_;
    let _e1061 = u_xlat3_;
    let _e1063 = ((_e1056.xyz * _e1058.yzw) + _e1061.xyz);
    u_xlat8_.x = _e1063.x;
    u_xlat8_.y = _e1063.y;
    u_xlat8_.z = _e1063.z;
    let _e1070 = u_xlat8_;
    let _e1072 = u_xlat5_;
    let _e1074 = u_xlat8_;
    let _e1076 = (_e1072.xyz + _e1074.xyz);
    u_xlat8_.x = _e1076.x;
    u_xlat8_.y = _e1076.y;
    u_xlat8_.z = _e1076.z;
    let _e1083 = SV_Target0_;
    let _e1085 = u_xlat1_;
    let _e1090 = _f_buffer3_.f_cb3_[4];
    let _e1093 = u_xlat8_;
    let _e1095 = ((_e1085.xyz * _e1090.xyz) + _e1093.xyz);
    SV_Target0_.x = _e1095.x;
    SV_Target0_.y = _e1095.y;
    SV_Target0_.z = _e1095.z;
    let _e1105 = _f_buffer3_.f_cb3_[5];
    u_xlatb8_ = (_e1105.y == 1f);
    let _e1110 = u_xlatb8_;
    if _e1110 {
        let _e1111 = u_xlat0_;
        local_12 = _e1111.x;
    } else {
        local_12 = 1f;
    }
    let _e1115 = local_12;
    SV_Target0_.w = _e1115;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec3<f32>, @location(2) vs_TEXCOORD2_: vec3<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_TEXCOORD2_1 = vs_TEXCOORD2_;
    main_1();
    let _e47 = SV_Target0_;
    return FragmentOutput(_e47);
}
