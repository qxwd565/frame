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
    f_cb4_: array<vec4<f32>, 4>,
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
var<private> vs_TEXCOORD5_1: vec2<f32>;
var<private> vs_TEXCOORD1_1: vec3<f32>;
var<private> vs_NORMAL0_1: vec3<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlati1_: i32 = 0i;
    var u_xlatu1_: u32 = 0u;
    var u_xlatb1_: vec4<bool> = vec4(false);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec4<f32> = vec4(0f);
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlati4_: i32 = 0i;
    var u_xlatu4_: u32 = 0u;
    var u_xlatb4_: bool = false;
    var u_xlat5_: vec3<f32> = vec3(0f);
    var u_xlat7_: vec3<f32> = vec3(0f);
    var u_xlatb7_: bool = false;
    var u_xlat10_: vec3<f32> = vec3(0f);
    var u_xlati10_: i32 = 0i;
    var u_xlat11_: f32 = 0f;
    var u_xlatb13_: bool = false;
    var u_xlat19_: f32 = 0f;
    var u_xlat20_: f32 = 0f;
    var u_xlatu20_: u32 = 0u;
    var u_xlatu21_: u32 = 0u;
    var local: f32;
    var local_1: f32;
    var local_2: f32;
    var local_3: f32;
    var local_4: f32;
    var local_5: f32;
    var local_6: f32;
    var local_7: f32;
    var txVec0_: vec3<f32>;
    var local_8: f32;
    var u_xlatu_loop_1_: u32 = 0u;
    var local_9: array<vec4<u32>, 4> = ImmCB_0_;

    let _e105 = vs_TEXCOORD0_1;
    let _e110 = _f_buffer0_.f_cb0_[4];
    let _e115 = hscard_bias.values[1];
    let _e118 = textureSampleBias(f_t1_, samplerf_s1_, _e105.xy, (_e110.x + _e115.x));
    u_xlat0_ = _e118;
    let _e120 = vs_TEXCOORD0_1;
    let _e122 = dpdx(_e120.x);
    u_xlat1_.x = _e122;
    let _e124 = vs_TEXCOORD0_1;
    let _e126 = dpdy(_e124.x);
    u_xlat7_.x = _e126;
    let _e128 = u_xlat7_;
    let _e131 = u_xlat1_;
    u_xlat1_.x = (abs(_e128.x) + abs(_e131.x));
    let _e135 = u_xlat1_;
    let _e137 = u_xlat1_;
    let _e143 = (_e137.xx * vec2<f32>(0.5f, -0.5f));
    u_xlat1_.x = _e143.x;
    u_xlat1_.y = _e143.y;
    u_xlat1_.z = 0f;
    let _e150 = u_xlat1_;
    let _e152 = vs_TEXCOORD0_1;
    u_xlat2_ = (_e150.xzyz + _e152.xyxy);
    let _e155 = u_xlat2_;
    let _e160 = _f_buffer0_.f_cb0_[4];
    let _e165 = hscard_bias.values[1];
    let _e168 = textureSampleBias(f_t1_, samplerf_s1_, _e155.xy, (_e160.x + _e165.x));
    u_xlat3_ = _e168;
    let _e169 = u_xlat0_;
    let _e170 = u_xlat3_;
    u_xlat0_ = (_e169 + _e170);
    let _e172 = u_xlat2_;
    let _e177 = _f_buffer0_.f_cb0_[4];
    let _e182 = hscard_bias.values[1];
    let _e185 = textureSampleBias(f_t1_, samplerf_s1_, _e172.zw, (_e177.x + _e182.x));
    u_xlat2_ = _e185;
    let _e186 = u_xlat0_;
    let _e187 = u_xlat2_;
    u_xlat0_ = (_e186 + _e187);
    let _e189 = u_xlat1_;
    let _e191 = vs_TEXCOORD0_1;
    u_xlat1_ = (_e189.zxzy + _e191.xyxy);
    let _e194 = u_xlat1_;
    let _e199 = _f_buffer0_.f_cb0_[4];
    let _e204 = hscard_bias.values[1];
    let _e207 = textureSampleBias(f_t1_, samplerf_s1_, _e194.xy, (_e199.x + _e204.x));
    u_xlat2_ = _e207;
    let _e208 = u_xlat0_;
    let _e209 = u_xlat2_;
    u_xlat0_ = (_e208 + _e209);
    let _e211 = u_xlat1_;
    let _e216 = _f_buffer0_.f_cb0_[4];
    let _e221 = hscard_bias.values[1];
    let _e224 = textureSampleBias(f_t1_, samplerf_s1_, _e211.zw, (_e216.x + _e221.x));
    u_xlat1_ = _e224;
    let _e225 = u_xlat0_;
    let _e226 = u_xlat1_;
    u_xlat0_ = (_e225 + _e226);
    let _e228 = u_xlat0_;
    u_xlat0_ = (_e228 * vec4<f32>(0.2f, 0.2f, 0.2f, 0.2f));
    let _e240 = _f_buffer4_.f_cb4_[1];
    u_xlatb1_.x = (0f < _e240.x);
    let _e243 = u_xlatb1_;
    if _e243.x {
        {
            let _e245 = vs_TEXCOORD5_1;
            let _e250 = _f_buffer0_.f_cb0_[4];
            let _e255 = hscard_bias.values[2];
            let _e258 = textureSampleBias(f_t2_, samplerf_s2_, _e245.xy, (_e250.x + _e255.x));
            u_xlat1_ = _e258;
            let _e263 = _f_buffer4_.f_cb4_[3];
            let _e265 = u_xlat1_;
            u_xlatb1_.x = (_e263.x < _e265.x);
            let _e269 = u_xlatb1_;
            if _e269.x {
                local = 1f;
            } else {
                local = 0f;
            }
            let _e275 = local;
            u_xlat1_.x = _e275;
            let _e277 = u_xlat0_;
            let _e279 = u_xlat1_;
            u_xlat0_.w = (_e277.w * _e279.x);
        }
    }
    let _e282 = u_xlat1_;
    let _e284 = vs_TEXCOORD1_1;
    let _e289 = _f_buffer3_.f_cb3_[20];
    let _e292 = (_e284.xyz + -(_e289.xyz));
    u_xlat1_.x = _e292.x;
    u_xlat1_.y = _e292.y;
    u_xlat1_.z = _e292.z;
    let _e299 = u_xlat2_;
    let _e301 = vs_TEXCOORD1_1;
    let _e306 = _f_buffer3_.f_cb3_[21];
    let _e309 = (_e301.xyz + -(_e306.xyz));
    u_xlat2_.x = _e309.x;
    u_xlat2_.y = _e309.y;
    u_xlat2_.z = _e309.z;
    let _e316 = u_xlat3_;
    let _e318 = vs_TEXCOORD1_1;
    let _e323 = _f_buffer3_.f_cb3_[22];
    let _e326 = (_e318.xyz + -(_e323.xyz));
    u_xlat3_.x = _e326.x;
    u_xlat3_.y = _e326.y;
    u_xlat3_.z = _e326.z;
    let _e333 = u_xlat4_;
    let _e335 = vs_TEXCOORD1_1;
    let _e340 = _f_buffer3_.f_cb3_[23];
    let _e343 = (_e335.xyz + -(_e340.xyz));
    u_xlat4_.x = _e343.x;
    u_xlat4_.y = _e343.y;
    u_xlat4_.z = _e343.z;
    let _e351 = u_xlat1_;
    let _e353 = u_xlat1_;
    u_xlat1_.x = dot(_e351.xyz, _e353.xyz);
    let _e357 = u_xlat2_;
    let _e359 = u_xlat2_;
    u_xlat1_.y = dot(_e357.xyz, _e359.xyz);
    let _e363 = u_xlat3_;
    let _e365 = u_xlat3_;
    u_xlat1_.z = dot(_e363.xyz, _e365.xyz);
    let _e369 = u_xlat4_;
    let _e371 = u_xlat4_;
    u_xlat1_.w = dot(_e369.xyz, _e371.xyz);
    let _e374 = u_xlat1_;
    let _e378 = _f_buffer3_.f_cb3_[24];
    u_xlatb1_ = (_e374 < _e378);
    let _e381 = u_xlatb1_;
    if _e381.x {
        local_1 = 1f;
    } else {
        local_1 = 0f;
    }
    let _e387 = local_1;
    u_xlat2_.x = _e387;
    let _e389 = u_xlatb1_;
    if _e389.y {
        local_2 = 1f;
    } else {
        local_2 = 0f;
    }
    let _e395 = local_2;
    u_xlat2_.y = _e395;
    let _e397 = u_xlatb1_;
    if _e397.z {
        local_3 = 1f;
    } else {
        local_3 = 0f;
    }
    let _e403 = local_3;
    u_xlat2_.z = _e403;
    let _e405 = u_xlatb1_;
    if _e405.w {
        local_4 = 1f;
    } else {
        local_4 = 0f;
    }
    let _e411 = local_4;
    u_xlat2_.w = _e411;
    let _e413 = u_xlatb1_;
    if _e413.x {
        local_5 = -1f;
    } else {
        local_5 = -0f;
    }
    let _e422 = local_5;
    u_xlat1_.x = _e422;
    let _e424 = u_xlatb1_;
    if _e424.y {
        local_6 = -1f;
    } else {
        local_6 = -0f;
    }
    let _e433 = local_6;
    u_xlat1_.y = _e433;
    let _e435 = u_xlatb1_;
    if _e435.z {
        local_7 = -1f;
    } else {
        local_7 = -0f;
    }
    let _e444 = local_7;
    u_xlat1_.z = _e444;
    let _e445 = u_xlat1_;
    let _e447 = u_xlat1_;
    let _e449 = u_xlat2_;
    let _e451 = (_e447.xyz + _e449.yzw);
    u_xlat1_.x = _e451.x;
    u_xlat1_.y = _e451.y;
    u_xlat1_.z = _e451.z;
    let _e458 = u_xlat2_;
    let _e460 = u_xlat1_;
    let _e466 = max(_e460.xyz, vec3<f32>(0f, 0f, 0f));
    u_xlat2_.y = _e466.x;
    u_xlat2_.z = _e466.y;
    u_xlat2_.w = _e466.z;
    let _e474 = u_xlat2_;
    u_xlat1_.x = dot(_e474, vec4<f32>(4f, 3f, 2f, 1f));
    let _e482 = u_xlat1_;
    u_xlat1_.x = (-(_e482.x) + 4f);
    let _e487 = u_xlat1_;
    u_xlatu1_ = u32(_e487.x);
    let _e490 = u_xlatu1_;
    u_xlati1_ = (i32(_e490) << 2u);
    let _e495 = u_xlat7_;
    let _e497 = vs_TEXCOORD1_1;
    let _e499 = u_xlati1_;
    let _e504 = _f_buffer3_.f_cb3_[(_e499 + 1i)];
    let _e506 = (_e497.yyy * _e504.xyz);
    u_xlat7_.x = _e506.x;
    u_xlat7_.y = _e506.y;
    u_xlat7_.z = _e506.z;
    let _e513 = u_xlat7_;
    let _e515 = u_xlati1_;
    let _e518 = _f_buffer3_.f_cb3_[_e515];
    let _e520 = vs_TEXCOORD1_1;
    let _e523 = u_xlat7_;
    let _e525 = ((_e518.xyz * _e520.xxx) + _e523.xyz);
    u_xlat7_.x = _e525.x;
    u_xlat7_.y = _e525.y;
    u_xlat7_.z = _e525.z;
    let _e532 = u_xlat7_;
    let _e534 = u_xlati1_;
    let _e539 = _f_buffer3_.f_cb3_[(_e534 + 2i)];
    let _e541 = vs_TEXCOORD1_1;
    let _e544 = u_xlat7_;
    let _e546 = ((_e539.xyz * _e541.zzz) + _e544.xyz);
    u_xlat7_.x = _e546.x;
    u_xlat7_.y = _e546.y;
    u_xlat7_.z = _e546.z;
    let _e553 = u_xlat1_;
    let _e555 = u_xlat7_;
    let _e557 = u_xlati1_;
    let _e562 = _f_buffer3_.f_cb3_[(_e557 + 3i)];
    let _e564 = (_e555.xyz + _e562.xyz);
    u_xlat1_.x = _e564.x;
    u_xlat1_.y = _e564.y;
    u_xlat1_.z = _e564.z;
    let _e571 = vs_NORMAL0_1;
    let _e573 = vs_NORMAL0_1;
    u_xlat19_ = dot(_e571.xyz, _e573.xyz);
    let _e576 = u_xlat19_;
    u_xlat19_ = inverseSqrt(_e576);
    let _e578 = u_xlat2_;
    let _e580 = u_xlat19_;
    let _e582 = vs_NORMAL0_1;
    let _e584 = (vec3(_e580) * _e582.xyz);
    u_xlat2_.x = _e584.x;
    u_xlat2_.y = _e584.y;
    u_xlat2_.z = _e584.z;
    let _e591 = u_xlat1_;
    let _e592 = _e591.xy;
    let _e593 = u_xlat1_;
    txVec0_ = vec3<f32>(_e592.x, _e592.y, _e593.z);
    let _e600 = txVec0_;
    let _e604 = textureSampleCompareLevel(f_t0_, samplerf_s0_, _e600.xy, _e600.z);
    u_xlat1_.x = _e604;
    let _e609 = _f_buffer3_.f_cb3_[27];
    u_xlat7_.x = (-(_e609.x) + 1f);
    let _e615 = u_xlat1_;
    let _e620 = _f_buffer3_.f_cb3_[27];
    let _e623 = u_xlat7_;
    u_xlat1_.x = ((_e615.x * _e620.x) + _e623.x);
    let _e627 = u_xlat1_;
    u_xlatb7_ = (0f >= _e627.z);
    let _e630 = u_xlat1_;
    u_xlatb13_ = (_e630.z >= 1f);
    let _e634 = u_xlatb13_;
    let _e635 = u_xlatb7_;
    u_xlatb7_ = (_e634 || _e635);
    let _e638 = u_xlatb7_;
    if _e638 {
        local_8 = 1f;
    } else {
        let _e640 = u_xlat1_;
        local_8 = _e640.x;
    }
    let _e643 = local_8;
    u_xlat1_.x = _e643;
    let _e645 = u_xlat1_;
    let _e650 = _f_buffer2_.f_cb2_[11];
    u_xlat1_.x = (_e645.x * _e650.z);
    let _e653 = u_xlat1_;
    let _e655 = u_xlat1_;
    let _e660 = _f_buffer0_.f_cb0_[6];
    let _e662 = (_e655.xxx * _e660.xyz);
    u_xlat1_.x = _e662.x;
    u_xlat1_.y = _e662.y;
    u_xlat1_.z = _e662.z;
    let _e669 = u_xlat2_;
    let _e674 = _f_buffer0_.f_cb0_[5];
    u_xlat19_ = dot(_e669.xyz, _e674.xyz);
    let _e677 = u_xlat19_;
    u_xlat19_ = clamp(_e677, 0f, 1f);
    let _e684 = _f_buffer0_.f_cb0_[10];
    let _e689 = _f_buffer2_.f_cb2_[11];
    u_xlat20_ = min(_e684.x, _e689.y);
    let _e692 = u_xlat20_;
    u_xlatu20_ = u32(i32(_e692));
    u_xlat3_.x = 0f;
    u_xlat3_.y = 0f;
    u_xlat3_.z = 0f;
    loop {
        let _e707 = u_xlatu_loop_1_;
        let _e708 = u_xlatu20_;
        if !((_e707 < _e708)) {
            break;
        }
        {
            let _e714 = u_xlatu_loop_1_;
            u_xlatu4_ = (_e714 >> 2u);
            let _e717 = u_xlatu_loop_1_;
            u_xlati10_ = i32((_e717 & 3u));
            let _e722 = u_xlatu4_;
            let _e728 = _f_buffer2_.f_cb2_[(i32(_e722) + 12i)];
            let _e729 = u_xlati10_;
            let _e733 = local_9[_e729];
            u_xlat4_.x = dot(_e728, bitcast<vec4<f32>>(_e733));
            let _e736 = u_xlat4_;
            u_xlati4_ = i32(_e736.x);
            let _e739 = u_xlat10_;
            let _e741 = vs_TEXCOORD1_1;
            let _e744 = u_xlati4_;
            let _e747 = _f_buffer1_.f_cb1_[_e744];
            let _e750 = u_xlati4_;
            let _e753 = _f_buffer1_.f_cb1_[_e750];
            let _e755 = ((-(_e741.xyz) * _e747.www) + _e753.xyz);
            u_xlat10_.x = _e755.x;
            u_xlat10_.y = _e755.y;
            u_xlat10_.z = _e755.z;
            let _e763 = u_xlat10_;
            let _e765 = u_xlat10_;
            u_xlat5_.x = dot(_e763.xyz, _e765.xyz);
            let _e769 = u_xlat5_;
            u_xlat5_.x = max(_e769.x, 0.000061035156f);
            let _e773 = u_xlat5_;
            u_xlat11_ = inverseSqrt(_e773.x);
            let _e776 = u_xlat10_;
            let _e778 = u_xlat10_;
            let _e780 = u_xlat11_;
            let _e782 = (_e778.xyz * vec3(_e780));
            u_xlat10_.x = _e782.x;
            u_xlat10_.y = _e782.y;
            u_xlat10_.z = _e782.z;
            let _e791 = u_xlati4_;
            let _e796 = _f_buffer1_.f_cb1_[(_e791 + 512i)];
            u_xlat11_ = (1f / _e796.x);
            let _e800 = u_xlat5_;
            u_xlat5_.x = (_e800.x * 25f);
            let _e805 = u_xlat5_;
            let _e807 = u_xlat11_;
            u_xlat5_.x = (_e805.x / _e807);
            let _e810 = u_xlat5_;
            u_xlat5_.x = (_e810.x + 1f);
            let _e817 = u_xlat5_;
            u_xlat5_.x = (1f / _e817.x);
            let _e820 = u_xlati4_;
            let _e825 = _f_buffer1_.f_cb1_[(_e820 + 768i)];
            let _e827 = u_xlat10_;
            u_xlat11_ = dot(_e825.xyz, _e827.xyz);
            let _e830 = u_xlat11_;
            let _e831 = u_xlati4_;
            let _e836 = _f_buffer1_.f_cb1_[(_e831 + 512i)];
            let _e839 = u_xlati4_;
            let _e844 = _f_buffer1_.f_cb1_[(_e839 + 512i)];
            u_xlat11_ = ((_e830 * _e836.z) + _e844.w);
            let _e847 = u_xlat11_;
            u_xlat11_ = clamp(_e847, 0f, 1f);
            let _e851 = u_xlat11_;
            let _e852 = u_xlat11_;
            u_xlat11_ = (_e851 * _e852);
            let _e855 = u_xlat11_;
            let _e856 = u_xlat5_;
            u_xlat5_.x = (_e855 * _e856.x);
            let _e859 = u_xlat5_;
            let _e861 = u_xlat5_;
            let _e863 = u_xlati4_;
            let _e868 = _f_buffer1_.f_cb1_[(_e863 + 256i)];
            let _e870 = (_e861.xxx * _e868.xyz);
            u_xlat5_.x = _e870.x;
            u_xlat5_.y = _e870.y;
            u_xlat5_.z = _e870.z;
            let _e878 = u_xlat2_;
            let _e880 = u_xlat10_;
            u_xlat4_.x = dot(_e878.xyz, _e880.xyz);
            let _e884 = u_xlat4_;
            u_xlat4_.x = clamp(_e884.x, 0f, 1f);
            let _e889 = u_xlat3_;
            let _e891 = u_xlat5_;
            let _e893 = u_xlat4_;
            let _e896 = u_xlat3_;
            let _e898 = ((_e891.xyz * _e893.xxx) + _e896.xyz);
            u_xlat3_.x = _e898.x;
            u_xlat3_.y = _e898.y;
            u_xlat3_.z = _e898.z;
        }
        continuing {
            let _e711 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e711 + 1u);
        }
    }
    let _e905 = u_xlat1_;
    let _e907 = u_xlat1_;
    let _e909 = u_xlat19_;
    let _e912 = u_xlat3_;
    let _e914 = ((_e907.xyz * vec3(_e909)) + _e912.xyz);
    u_xlat1_.x = _e914.x;
    u_xlat1_.y = _e914.y;
    u_xlat1_.z = _e914.z;
    let _e925 = _f_buffer2_.f_cb2_[27];
    u_xlat2_.x = abs(_e925.w);
    let _e932 = _f_buffer2_.f_cb2_[28];
    u_xlat2_.y = abs(_e932.w);
    let _e939 = _f_buffer2_.f_cb2_[29];
    u_xlat2_.z = abs(_e939.w);
    let _e942 = u_xlat2_;
    let _e944 = u_xlat2_;
    let _e946 = log2(_e944.xyz);
    u_xlat2_.x = _e946.x;
    u_xlat2_.y = _e946.y;
    u_xlat2_.z = _e946.z;
    let _e953 = u_xlat2_;
    let _e955 = u_xlat2_;
    let _e961 = (_e955.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat2_.x = _e961.x;
    u_xlat2_.y = _e961.y;
    u_xlat2_.z = _e961.z;
    let _e968 = u_xlat2_;
    let _e970 = u_xlat2_;
    let _e972 = exp2(_e970.xyz);
    u_xlat2_.x = _e972.x;
    u_xlat2_.y = _e972.y;
    u_xlat2_.z = _e972.z;
    let _e979 = u_xlat2_;
    let _e981 = u_xlat2_;
    let _e995 = ((_e981.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat2_.x = _e995.x;
    u_xlat2_.y = _e995.y;
    u_xlat2_.z = _e995.z;
    let _e1002 = u_xlat2_;
    let _e1004 = u_xlat2_;
    let _e1010 = clamp(_e1004.xyz, vec3(0f), vec3(1f));
    u_xlat2_.x = _e1010.x;
    u_xlat2_.y = _e1010.y;
    u_xlat2_.z = _e1010.z;
    let _e1017 = u_xlat1_;
    let _e1019 = u_xlat1_;
    let _e1021 = u_xlat2_;
    let _e1023 = (_e1019.xyz + _e1021.xyz);
    u_xlat1_.x = _e1023.x;
    u_xlat1_.y = _e1023.y;
    u_xlat1_.z = _e1023.z;
    let _e1030 = u_xlat1_;
    let _e1032 = u_xlat0_;
    let _e1034 = u_xlat1_;
    let _e1036 = (_e1032.xyz * _e1034.xyz);
    u_xlat1_.x = _e1036.x;
    u_xlat1_.y = _e1036.y;
    u_xlat1_.z = _e1036.z;
    let _e1043 = u_xlat0_;
    let _e1045 = u_xlat0_;
    let _e1047 = u_xlat1_;
    let _e1049 = (_e1045.www * _e1047.xyz);
    u_xlat0_.x = _e1049.x;
    u_xlat0_.y = _e1049.y;
    u_xlat0_.z = _e1049.z;
    let _e1056 = u_xlat0_;
    SV_Target0_ = _e1056;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(5) vs_TEXCOORD5_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec3<f32>, @location(12) vs_NORMAL0_: vec3<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD5_1 = vs_TEXCOORD5_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_NORMAL0_1 = vs_NORMAL0_;
    main_1();
    let _e51 = SV_Target0_;
    return FragmentOutput(_e51);
}
