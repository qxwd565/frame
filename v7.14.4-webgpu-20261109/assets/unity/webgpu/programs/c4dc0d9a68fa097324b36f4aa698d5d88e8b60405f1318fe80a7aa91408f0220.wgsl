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
var samplerf_s1_: sampler_comparison;
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
@group(3) @binding(2) 
var f_t1_: texture_depth_2d;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD1_1: vec3<f32>;
var<private> vs_TEXCOORD2_1: vec3<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlati2_: i32 = 0i;
    var u_xlatu2_: u32 = 0u;
    var u_xlatb2_: vec4<bool> = vec4(false);
    var u_xlat3_: vec4<f32> = vec4(0f);
    var u_xlat4_: vec4<f32> = vec4(0f);
    var u_xlatb4_: vec3<bool> = vec3(false);
    var u_xlat5_: vec3<f32> = vec3(0f);
    var u_xlat6_: vec3<f32> = vec3(0f);
    var u_xlat7_: vec3<f32> = vec3(0f);
    var u_xlatb7_: bool = false;
    var u_xlat9_: vec3<f32> = vec3(0f);
    var u_xlatb9_: bool = false;
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

    let _e113 = vs_TEXCOORD0_1;
    let _e118 = _f_buffer0_.f_cb0_[4];
    let _e123 = hscard_bias.values[0];
    let _e126 = textureSampleBias(f_t0_, samplerf_s0_, _e113.xy, (_e118.x + _e123.x));
    u_xlat0_ = _e126;
    let _e127 = u_xlat0_;
    let _e132 = _f_buffer3_.f_cb3_[2];
    u_xlat0_ = (_e127.wxyz * _e132.wxyz);
    let _e136 = vs_TEXCOORD2_1;
    let _e138 = vs_TEXCOORD2_1;
    u_xlat1_.x = dot(_e136.xyz, _e138.xyz);
    let _e142 = u_xlat1_;
    u_xlat1_.x = inverseSqrt(_e142.x);
    let _e145 = u_xlat1_;
    let _e147 = u_xlat1_;
    let _e149 = vs_TEXCOORD2_1;
    let _e151 = (_e147.xxx * _e149.xyz);
    u_xlat1_.x = _e151.x;
    u_xlat1_.y = _e151.y;
    u_xlat1_.z = _e151.z;
    let _e158 = u_xlat2_;
    let _e160 = vs_TEXCOORD1_1;
    let _e165 = _f_buffer4_.f_cb4_[20];
    let _e168 = (_e160.xyz + -(_e165.xyz));
    u_xlat2_.x = _e168.x;
    u_xlat2_.y = _e168.y;
    u_xlat2_.z = _e168.z;
    let _e175 = u_xlat3_;
    let _e177 = vs_TEXCOORD1_1;
    let _e182 = _f_buffer4_.f_cb4_[21];
    let _e185 = (_e177.xyz + -(_e182.xyz));
    u_xlat3_.x = _e185.x;
    u_xlat3_.y = _e185.y;
    u_xlat3_.z = _e185.z;
    let _e192 = u_xlat4_;
    let _e194 = vs_TEXCOORD1_1;
    let _e199 = _f_buffer4_.f_cb4_[22];
    let _e202 = (_e194.xyz + -(_e199.xyz));
    u_xlat4_.x = _e202.x;
    u_xlat4_.y = _e202.y;
    u_xlat4_.z = _e202.z;
    let _e209 = u_xlat5_;
    let _e211 = vs_TEXCOORD1_1;
    let _e216 = _f_buffer4_.f_cb4_[23];
    let _e219 = (_e211.xyz + -(_e216.xyz));
    u_xlat5_.x = _e219.x;
    u_xlat5_.y = _e219.y;
    u_xlat5_.z = _e219.z;
    let _e227 = u_xlat2_;
    let _e229 = u_xlat2_;
    u_xlat2_.x = dot(_e227.xyz, _e229.xyz);
    let _e233 = u_xlat3_;
    let _e235 = u_xlat3_;
    u_xlat2_.y = dot(_e233.xyz, _e235.xyz);
    let _e239 = u_xlat4_;
    let _e241 = u_xlat4_;
    u_xlat2_.z = dot(_e239.xyz, _e241.xyz);
    let _e245 = u_xlat5_;
    let _e247 = u_xlat5_;
    u_xlat2_.w = dot(_e245.xyz, _e247.xyz);
    let _e250 = u_xlat2_;
    let _e254 = _f_buffer4_.f_cb4_[24];
    u_xlatb2_ = (_e250 < _e254);
    let _e257 = u_xlatb2_;
    if _e257.x {
        local = 1f;
    } else {
        local = 0f;
    }
    let _e263 = local;
    u_xlat3_.x = _e263;
    let _e265 = u_xlatb2_;
    if _e265.y {
        local_1 = 1f;
    } else {
        local_1 = 0f;
    }
    let _e271 = local_1;
    u_xlat3_.y = _e271;
    let _e273 = u_xlatb2_;
    if _e273.z {
        local_2 = 1f;
    } else {
        local_2 = 0f;
    }
    let _e279 = local_2;
    u_xlat3_.z = _e279;
    let _e281 = u_xlatb2_;
    if _e281.w {
        local_3 = 1f;
    } else {
        local_3 = 0f;
    }
    let _e287 = local_3;
    u_xlat3_.w = _e287;
    let _e289 = u_xlatb2_;
    if _e289.x {
        local_4 = -1f;
    } else {
        local_4 = -0f;
    }
    let _e298 = local_4;
    u_xlat2_.x = _e298;
    let _e300 = u_xlatb2_;
    if _e300.y {
        local_5 = -1f;
    } else {
        local_5 = -0f;
    }
    let _e309 = local_5;
    u_xlat2_.y = _e309;
    let _e311 = u_xlatb2_;
    if _e311.z {
        local_6 = -1f;
    } else {
        local_6 = -0f;
    }
    let _e320 = local_6;
    u_xlat2_.z = _e320;
    let _e321 = u_xlat2_;
    let _e323 = u_xlat2_;
    let _e325 = u_xlat3_;
    let _e327 = (_e323.xyz + _e325.yzw);
    u_xlat2_.x = _e327.x;
    u_xlat2_.y = _e327.y;
    u_xlat2_.z = _e327.z;
    let _e334 = u_xlat3_;
    let _e336 = u_xlat2_;
    let _e342 = max(_e336.xyz, vec3<f32>(0f, 0f, 0f));
    u_xlat3_.y = _e342.x;
    u_xlat3_.z = _e342.y;
    u_xlat3_.w = _e342.z;
    let _e350 = u_xlat3_;
    u_xlat2_.x = dot(_e350, vec4<f32>(4f, 3f, 2f, 1f));
    let _e358 = u_xlat2_;
    u_xlat2_.x = (-(_e358.x) + 4f);
    let _e363 = u_xlat2_;
    u_xlatu2_ = u32(_e363.x);
    let _e366 = u_xlatu2_;
    u_xlati2_ = (i32(_e366) << 2u);
    let _e371 = u_xlat9_;
    let _e373 = vs_TEXCOORD1_1;
    let _e375 = u_xlati2_;
    let _e380 = _f_buffer4_.f_cb4_[(_e375 + 1i)];
    let _e382 = (_e373.yyy * _e380.xyz);
    u_xlat9_.x = _e382.x;
    u_xlat9_.y = _e382.y;
    u_xlat9_.z = _e382.z;
    let _e389 = u_xlat9_;
    let _e391 = u_xlati2_;
    let _e394 = _f_buffer4_.f_cb4_[_e391];
    let _e396 = vs_TEXCOORD1_1;
    let _e399 = u_xlat9_;
    let _e401 = ((_e394.xyz * _e396.xxx) + _e399.xyz);
    u_xlat9_.x = _e401.x;
    u_xlat9_.y = _e401.y;
    u_xlat9_.z = _e401.z;
    let _e408 = u_xlat9_;
    let _e410 = u_xlati2_;
    let _e415 = _f_buffer4_.f_cb4_[(_e410 + 2i)];
    let _e417 = vs_TEXCOORD1_1;
    let _e420 = u_xlat9_;
    let _e422 = ((_e415.xyz * _e417.zzz) + _e420.xyz);
    u_xlat9_.x = _e422.x;
    u_xlat9_.y = _e422.y;
    u_xlat9_.z = _e422.z;
    let _e429 = u_xlat2_;
    let _e431 = u_xlat9_;
    let _e433 = u_xlati2_;
    let _e438 = _f_buffer4_.f_cb4_[(_e433 + 3i)];
    let _e440 = (_e431.xyz + _e438.xyz);
    u_xlat2_.x = _e440.x;
    u_xlat2_.y = _e440.y;
    u_xlat2_.z = _e440.z;
    u_xlat1_.w = 1f;
    let _e453 = _f_buffer2_.f_cb2_[27];
    let _e454 = u_xlat1_;
    u_xlat3_.x = dot(_e453, _e454);
    let _e460 = _f_buffer2_.f_cb2_[28];
    let _e461 = u_xlat1_;
    u_xlat3_.y = dot(_e460, _e461);
    let _e467 = _f_buffer2_.f_cb2_[29];
    let _e468 = u_xlat1_;
    u_xlat3_.z = dot(_e467, _e468);
    let _e470 = u_xlat1_;
    let _e472 = u_xlat1_;
    u_xlat4_ = (_e470.yzzx * _e472.xyzz);
    let _e479 = _f_buffer2_.f_cb2_[30];
    let _e480 = u_xlat4_;
    u_xlat5_.x = dot(_e479, _e480);
    let _e486 = _f_buffer2_.f_cb2_[31];
    let _e487 = u_xlat4_;
    u_xlat5_.y = dot(_e486, _e487);
    let _e493 = _f_buffer2_.f_cb2_[32];
    let _e494 = u_xlat4_;
    u_xlat5_.z = dot(_e493, _e494);
    let _e496 = u_xlat1_;
    let _e498 = u_xlat1_;
    u_xlat22_ = (_e496.y * _e498.y);
    let _e501 = u_xlat1_;
    let _e503 = u_xlat1_;
    let _e506 = u_xlat22_;
    u_xlat22_ = ((_e501.x * _e503.x) + -(_e506));
    let _e509 = u_xlat4_;
    let _e514 = _f_buffer2_.f_cb2_[33];
    let _e516 = u_xlat22_;
    let _e519 = u_xlat5_;
    let _e521 = ((_e514.xyz * vec3(_e516)) + _e519.xyz);
    u_xlat4_.x = _e521.x;
    u_xlat4_.y = _e521.y;
    u_xlat4_.z = _e521.z;
    let _e528 = u_xlat3_;
    let _e530 = u_xlat3_;
    let _e532 = u_xlat4_;
    let _e534 = (_e530.xyz + _e532.xyz);
    u_xlat3_.x = _e534.x;
    u_xlat3_.y = _e534.y;
    u_xlat3_.z = _e534.z;
    let _e541 = u_xlatb4_;
    let _e548 = u_xlat3_;
    let _e551 = (vec4<f32>(0.0031308f, 0.0031308f, 0.0031308f, 0f) >= _e548.xyzx).xyz;
    u_xlatb4_.x = _e551.x;
    u_xlatb4_.y = _e551.y;
    u_xlatb4_.z = _e551.z;
    let _e558 = u_xlat5_;
    let _e560 = u_xlat3_;
    let _e566 = (_e560.xyz * vec3<f32>(12.92321f, 12.92321f, 12.92321f));
    u_xlat5_.x = _e566.x;
    u_xlat5_.y = _e566.y;
    u_xlat5_.z = _e566.z;
    let _e573 = u_xlat3_;
    let _e575 = u_xlat3_;
    let _e578 = log2(abs(_e575.xyz));
    u_xlat3_.x = _e578.x;
    u_xlat3_.y = _e578.y;
    u_xlat3_.z = _e578.z;
    let _e585 = u_xlat3_;
    let _e587 = u_xlat3_;
    let _e593 = (_e587.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat3_.x = _e593.x;
    u_xlat3_.y = _e593.y;
    u_xlat3_.z = _e593.z;
    let _e600 = u_xlat3_;
    let _e602 = u_xlat3_;
    let _e604 = exp2(_e602.xyz);
    u_xlat3_.x = _e604.x;
    u_xlat3_.y = _e604.y;
    u_xlat3_.z = _e604.z;
    let _e611 = u_xlat3_;
    let _e613 = u_xlat3_;
    let _e627 = ((_e613.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat3_.x = _e627.x;
    u_xlat3_.y = _e627.y;
    u_xlat3_.z = _e627.z;
    {
        let _e634 = u_xlat3_;
        hlslcc_movcTemp = _e634;
        let _e637 = u_xlatb4_;
        if _e637.x {
            let _e639 = u_xlat5_;
            local_7 = _e639.x;
        } else {
            let _e641 = u_xlat3_;
            local_7 = _e641.x;
        }
        let _e644 = local_7;
        hlslcc_movcTemp.x = _e644;
        let _e646 = u_xlatb4_;
        if _e646.y {
            let _e648 = u_xlat5_;
            local_8 = _e648.y;
        } else {
            let _e650 = u_xlat3_;
            local_8 = _e650.y;
        }
        let _e653 = local_8;
        hlslcc_movcTemp.y = _e653;
        let _e655 = u_xlatb4_;
        if _e655.z {
            let _e657 = u_xlat5_;
            local_9 = _e657.z;
        } else {
            let _e659 = u_xlat3_;
            local_9 = _e659.z;
        }
        let _e662 = local_9;
        hlslcc_movcTemp.z = _e662;
        let _e663 = hlslcc_movcTemp;
        u_xlat3_ = _e663;
    }
    let _e664 = u_xlat2_;
    let _e665 = _e664.xy;
    let _e666 = u_xlat2_;
    txVec0_ = vec3<f32>(_e665.x, _e665.y, _e666.z);
    let _e672 = txVec0_;
    let _e676 = textureSampleCompareLevel(f_t1_, samplerf_s1_, _e672.xy, _e672.z);
    u_xlat22_ = _e676;
    let _e681 = _f_buffer4_.f_cb4_[27];
    u_xlat2_.x = (-(_e681.x) + 1f);
    let _e686 = u_xlat22_;
    let _e690 = _f_buffer4_.f_cb4_[27];
    let _e693 = u_xlat2_;
    u_xlat22_ = ((_e686 * _e690.x) + _e693.x);
    let _e698 = u_xlat2_;
    u_xlatb2_.x = (0f >= _e698.z);
    let _e701 = u_xlat2_;
    u_xlatb9_ = (_e701.z >= 1f);
    let _e706 = u_xlatb9_;
    let _e707 = u_xlatb2_;
    u_xlatb2_.x = (_e706 || _e707.x);
    let _e710 = u_xlatb2_;
    if _e710.x {
        local_10 = 1f;
    } else {
        let _e713 = u_xlat22_;
        local_10 = _e713;
    }
    let _e715 = local_10;
    u_xlat22_ = _e715;
    let _e716 = u_xlat2_;
    let _e718 = vs_TEXCOORD1_1;
    let _e723 = _f_buffer0_.f_cb0_[21];
    let _e726 = (_e718.xyz + -(_e723.xyz));
    u_xlat2_.x = _e726.x;
    u_xlat2_.y = _e726.y;
    u_xlat2_.z = _e726.z;
    let _e734 = u_xlat2_;
    let _e736 = u_xlat2_;
    u_xlat2_.x = dot(_e734.xyz, _e736.xyz);
    let _e740 = u_xlat2_;
    let _e745 = _f_buffer4_.f_cb4_[27];
    let _e751 = _f_buffer4_.f_cb4_[27];
    u_xlat2_.x = ((_e740.x * _e745.z) + _e751.w);
    let _e755 = u_xlat2_;
    u_xlat2_.x = clamp(_e755.x, 0f, 1f);
    let _e761 = u_xlat22_;
    u_xlat9_.x = (-(_e761) + 1f);
    let _e765 = u_xlat2_;
    let _e767 = u_xlat9_;
    let _e770 = u_xlat22_;
    u_xlat22_ = ((_e765.x * _e767.x) + _e770);
    let _e772 = u_xlat22_;
    let _e776 = _f_buffer2_.f_cb2_[11];
    u_xlat22_ = (_e772 * _e776.z);
    let _e779 = u_xlat2_;
    let _e781 = u_xlat22_;
    let _e786 = _f_buffer0_.f_cb0_[6];
    let _e788 = (vec3(_e781) * _e786.xyz);
    u_xlat2_.x = _e788.x;
    u_xlat2_.y = _e788.y;
    u_xlat2_.z = _e788.z;
    let _e795 = u_xlat1_;
    let _e800 = _f_buffer0_.f_cb0_[5];
    u_xlat22_ = dot(_e795.xyz, _e800.xyz);
    let _e803 = u_xlat22_;
    u_xlat22_ = clamp(_e803, 0f, 1f);
    let _e807 = u_xlat2_;
    let _e809 = u_xlat22_;
    let _e811 = u_xlat2_;
    let _e813 = (vec3(_e809) * _e811.xyz);
    u_xlat2_.x = _e813.x;
    u_xlat2_.y = _e813.y;
    u_xlat2_.z = _e813.z;
    let _e820 = u_xlat2_;
    let _e822 = u_xlat0_;
    let _e824 = u_xlat2_;
    let _e826 = (_e822.yzw * _e824.xyz);
    u_xlat2_.x = _e826.x;
    u_xlat2_.y = _e826.y;
    u_xlat2_.z = _e826.z;
    let _e836 = _f_buffer0_.f_cb0_[10];
    let _e841 = _f_buffer2_.f_cb2_[11];
    u_xlat22_ = min(_e836.x, _e841.y);
    let _e844 = u_xlat22_;
    u_xlatu22_ = u32(i32(_e844));
    u_xlat4_.x = 0f;
    u_xlat4_.y = 0f;
    u_xlat4_.z = 0f;
    loop {
        let _e858 = u_xlatu_loop_1_;
        let _e859 = u_xlatu22_;
        if !((_e858 < _e859)) {
            break;
        }
        {
            let _e865 = u_xlatu_loop_1_;
            u_xlatu24_ = (_e865 >> 2u);
            let _e868 = u_xlatu_loop_1_;
            u_xlati25_ = i32((_e868 & 3u));
            let _e872 = u_xlatu24_;
            let _e878 = _f_buffer2_.f_cb2_[(i32(_e872) + 12i)];
            let _e879 = u_xlati25_;
            let _e883 = local_11[_e879];
            u_xlat24_ = dot(_e878, bitcast<vec4<f32>>(_e883));
            let _e886 = u_xlat24_;
            u_xlati24_ = i32(_e886);
            let _e888 = u_xlat5_;
            let _e890 = vs_TEXCOORD1_1;
            let _e893 = u_xlati24_;
            let _e896 = _f_buffer1_.f_cb1_[_e893];
            let _e899 = u_xlati24_;
            let _e902 = _f_buffer1_.f_cb1_[_e899];
            let _e904 = ((-(_e890.xyz) * _e896.www) + _e902.xyz);
            u_xlat5_.x = _e904.x;
            u_xlat5_.y = _e904.y;
            u_xlat5_.z = _e904.z;
            let _e911 = u_xlat5_;
            let _e913 = u_xlat5_;
            u_xlat25_ = dot(_e911.xyz, _e913.xyz);
            let _e916 = u_xlat25_;
            u_xlat25_ = max(_e916, 0.000061035156f);
            let _e919 = u_xlat25_;
            u_xlat26_ = inverseSqrt(_e919);
            let _e921 = u_xlat5_;
            let _e923 = u_xlat26_;
            let _e925 = u_xlat5_;
            let _e927 = (vec3(_e923) * _e925.xyz);
            u_xlat5_.x = _e927.x;
            u_xlat5_.y = _e927.y;
            u_xlat5_.z = _e927.z;
            let _e936 = u_xlat25_;
            u_xlat26_ = (1f / _e936);
            let _e938 = u_xlat25_;
            let _e939 = u_xlati24_;
            let _e944 = _f_buffer1_.f_cb1_[(_e939 + 512i)];
            u_xlat25_ = (_e938 * _e944.x);
            let _e947 = u_xlat25_;
            let _e949 = u_xlat25_;
            u_xlat25_ = ((-(_e947) * _e949) + 1f);
            let _e953 = u_xlat25_;
            u_xlat25_ = max(_e953, 0f);
            let _e956 = u_xlat25_;
            let _e957 = u_xlat25_;
            u_xlat25_ = (_e956 * _e957);
            let _e959 = u_xlat25_;
            let _e960 = u_xlat26_;
            u_xlat25_ = (_e959 * _e960);
            let _e962 = u_xlati24_;
            let _e967 = _f_buffer1_.f_cb1_[(_e962 + 768i)];
            let _e969 = u_xlat5_;
            u_xlat26_ = dot(_e967.xyz, _e969.xyz);
            let _e972 = u_xlat26_;
            let _e973 = u_xlati24_;
            let _e978 = _f_buffer1_.f_cb1_[(_e973 + 512i)];
            let _e981 = u_xlati24_;
            let _e986 = _f_buffer1_.f_cb1_[(_e981 + 512i)];
            u_xlat26_ = ((_e972 * _e978.z) + _e986.w);
            let _e989 = u_xlat26_;
            u_xlat26_ = clamp(_e989, 0f, 1f);
            let _e993 = u_xlat26_;
            let _e994 = u_xlat26_;
            u_xlat26_ = (_e993 * _e994);
            let _e996 = u_xlat25_;
            let _e997 = u_xlat26_;
            u_xlat25_ = (_e996 * _e997);
            let _e999 = u_xlat6_;
            let _e1001 = u_xlat25_;
            let _e1003 = u_xlati24_;
            let _e1008 = _f_buffer1_.f_cb1_[(_e1003 + 256i)];
            let _e1010 = (vec3(_e1001) * _e1008.xyz);
            u_xlat6_.x = _e1010.x;
            u_xlat6_.y = _e1010.y;
            u_xlat6_.z = _e1010.z;
            let _e1017 = u_xlat1_;
            let _e1019 = u_xlat5_;
            u_xlat24_ = dot(_e1017.xyz, _e1019.xyz);
            let _e1022 = u_xlat24_;
            u_xlat24_ = clamp(_e1022, 0f, 1f);
            let _e1026 = u_xlat5_;
            let _e1028 = u_xlat24_;
            let _e1030 = u_xlat6_;
            let _e1032 = (vec3(_e1028) * _e1030.xyz);
            u_xlat5_.x = _e1032.x;
            u_xlat5_.y = _e1032.y;
            u_xlat5_.z = _e1032.z;
            let _e1039 = u_xlat4_;
            let _e1041 = u_xlat5_;
            let _e1043 = u_xlat0_;
            let _e1046 = u_xlat4_;
            let _e1048 = ((_e1041.xyz * _e1043.yzw) + _e1046.xyz);
            u_xlat4_.x = _e1048.x;
            u_xlat4_.y = _e1048.y;
            u_xlat4_.z = _e1048.z;
        }
        continuing {
            let _e862 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e862 + 1u);
        }
    }
    let _e1055 = u_xlat7_;
    let _e1057 = u_xlat3_;
    let _e1059 = u_xlat0_;
    let _e1062 = u_xlat2_;
    let _e1064 = ((_e1057.xyz * _e1059.yzw) + _e1062.xyz);
    u_xlat7_.x = _e1064.x;
    u_xlat7_.y = _e1064.y;
    u_xlat7_.z = _e1064.z;
    let _e1071 = SV_Target0_;
    let _e1073 = u_xlat4_;
    let _e1075 = u_xlat7_;
    let _e1077 = (_e1073.xyz + _e1075.xyz);
    SV_Target0_.x = _e1077.x;
    SV_Target0_.y = _e1077.y;
    SV_Target0_.z = _e1077.z;
    let _e1087 = _f_buffer3_.f_cb3_[5];
    u_xlatb7_ = (_e1087.y == 1f);
    let _e1092 = u_xlatb7_;
    if _e1092 {
        let _e1093 = u_xlat0_;
        local_12 = _e1093.x;
    } else {
        local_12 = 1f;
    }
    let _e1097 = local_12;
    SV_Target0_.w = _e1097;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec3<f32>, @location(2) vs_TEXCOORD2_: vec3<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_TEXCOORD2_1 = vs_TEXCOORD2_;
    main_1();
    let _e43 = SV_Target0_;
    return FragmentOutput(_e43);
}
