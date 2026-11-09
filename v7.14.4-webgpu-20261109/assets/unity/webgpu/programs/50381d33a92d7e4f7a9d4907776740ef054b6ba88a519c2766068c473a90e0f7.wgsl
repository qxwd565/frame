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
    var u_xlatb0_: bool = false;
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlati1_: i32 = 0i;
    var u_xlatu1_: u32 = 0u;
    var u_xlatb1_: bool = false;
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec4<f32> = vec4(0f);
    var u_xlatb3_: vec4<bool> = vec4(false);
    var u_xlat4_: vec4<f32> = vec4(0f);
    var u_xlat5_: vec4<f32> = vec4(0f);
    var u_xlatb5_: vec3<bool> = vec3(false);
    var u_xlat6_: vec3<f32> = vec3(0f);
    var u_xlat7_: vec3<f32> = vec3(0f);
    var u_xlat8_: f32 = 0f;
    var u_xlati8_: i32 = 0i;
    var u_xlatu8_: u32 = 0u;
    var u_xlatb8_: bool = false;
    var u_xlat16_: f32 = 0f;
    var u_xlat24_: f32 = 0f;
    var u_xlatu24_: u32 = 0u;
    var u_xlatb24_: bool = false;
    var u_xlat26_: f32 = 0f;
    var u_xlati26_: i32 = 0i;
    var u_xlat27_: f32 = 0f;
    var local: u32;
    var local_1: f32;
    var local_2: i32;
    var local_3: f32;
    var local_4: f32;
    var local_5: f32;
    var local_6: f32;
    var local_7: f32;
    var local_8: f32;
    var local_9: f32;
    var local_10: f32;
    var local_11: f32;
    var hlslcc_movcTemp: vec4<f32>;
    var local_12: f32;
    var local_13: f32;
    var local_14: f32;
    var txVec0_: vec3<f32>;
    var local_15: f32;
    var u_xlatu_loop_1_: u32 = 0u;
    var local_16: array<vec4<u32>, 4> = ImmCB_0_;
    var local_17: f32;

    let _e112 = vs_TEXCOORD0_1;
    let _e117 = _f_buffer0_.f_cb0_[4];
    let _e122 = hscard_bias.values[0];
    let _e125 = textureSampleBias(f_t0_, samplerf_s0_, _e112.xy, (_e117.x + _e122.x));
    u_xlat0_ = _e125;
    let _e126 = u_xlat0_;
    let _e131 = _f_buffer3_.f_cb3_[2];
    u_xlat1_ = (_e126.wxyz * _e131.wxyz);
    let _e137 = _f_buffer0_.f_cb0_[4];
    u_xlatb0_ = (_e137.z != 0f);
    let _e145 = _f_buffer3_.f_cb3_[5];
    if (0f >= _e145.x) {
        local = 4294967295u;
    } else {
        local = 0u;
    }
    let _e152 = local;
    u_xlati8_ = i32(_e152);
    let _e154 = u_xlat1_;
    let _e156 = dpdx(_e154.x);
    u_xlat16_ = _e156;
    let _e158 = u_xlat1_;
    let _e160 = dpdy(_e158.x);
    u_xlat2_.x = _e160;
    let _e161 = u_xlat16_;
    let _e163 = u_xlat2_;
    u_xlat16_ = (abs(_e161) + abs(_e163.x));
    let _e167 = u_xlat0_;
    let _e172 = _f_buffer3_.f_cb3_[2];
    let _e178 = _f_buffer3_.f_cb3_[5];
    u_xlat24_ = ((_e167.w * _e172.w) + -(_e178.x));
    let _e183 = u_xlat16_;
    let _e187 = u_xlat24_;
    u_xlat2_.x = ((-(_e183) * 0.5f) + _e187);
    let _e189 = u_xlat16_;
    u_xlat16_ = max(_e189, 0.0001f);
    let _e192 = u_xlat2_;
    let _e194 = u_xlat16_;
    u_xlat16_ = (_e192.x / _e194);
    let _e196 = u_xlat16_;
    u_xlat16_ = (_e196 + 1f);
    let _e199 = u_xlat16_;
    u_xlat16_ = clamp(_e199, 0f, 1f);
    let _e203 = u_xlati8_;
    if (_e203 != 0i) {
        local_1 = 1f;
    } else {
        let _e207 = u_xlat16_;
        local_1 = _e207;
    }
    let _e209 = local_1;
    u_xlat16_ = _e209;
    let _e210 = u_xlati8_;
    u_xlati8_ = ~(_e210);
    let _e212 = u_xlatb0_;
    if _e212 {
        let _e213 = u_xlati8_;
        local_2 = _e213;
    } else {
        local_2 = 0i;
    }
    let _e217 = local_2;
    u_xlati8_ = _e217;
    let _e219 = u_xlat16_;
    u_xlat2_.x = (_e219 + -0.0001f);
    let _e223 = u_xlati8_;
    if (_e223 != 0i) {
        let _e226 = u_xlat2_;
        local_3 = _e226.x;
    } else {
        let _e228 = u_xlat24_;
        local_3 = _e228;
    }
    let _e230 = local_3;
    u_xlat8_ = _e230;
    let _e231 = u_xlatb0_;
    if _e231 {
        let _e232 = u_xlat16_;
        local_4 = _e232;
    } else {
        let _e233 = u_xlat1_;
        local_4 = _e233.x;
    }
    let _e236 = local_4;
    u_xlat16_ = _e236;
    let _e237 = u_xlat8_;
    u_xlatb8_ = (_e237 < 0f);
    let _e240 = u_xlatb8_;
    if ((select(0i, 1i, _e240) * -1i) != 0i) {
        {
            discard;
        }
    }
    let _e249 = vs_TEXCOORD2_1;
    let _e251 = vs_TEXCOORD2_1;
    u_xlat8_ = dot(_e249.xyz, _e251.xyz);
    let _e254 = u_xlat8_;
    u_xlat8_ = inverseSqrt(_e254);
    let _e256 = u_xlat2_;
    let _e258 = u_xlat8_;
    let _e260 = vs_TEXCOORD2_1;
    let _e262 = (vec3(_e258) * _e260.xyz);
    u_xlat2_.x = _e262.x;
    u_xlat2_.y = _e262.y;
    u_xlat2_.z = _e262.z;
    let _e269 = u_xlat3_;
    let _e271 = vs_TEXCOORD1_1;
    let _e276 = _f_buffer4_.f_cb4_[20];
    let _e279 = (_e271.xyz + -(_e276.xyz));
    u_xlat3_.x = _e279.x;
    u_xlat3_.y = _e279.y;
    u_xlat3_.z = _e279.z;
    let _e286 = u_xlat4_;
    let _e288 = vs_TEXCOORD1_1;
    let _e293 = _f_buffer4_.f_cb4_[21];
    let _e296 = (_e288.xyz + -(_e293.xyz));
    u_xlat4_.x = _e296.x;
    u_xlat4_.y = _e296.y;
    u_xlat4_.z = _e296.z;
    let _e303 = u_xlat5_;
    let _e305 = vs_TEXCOORD1_1;
    let _e310 = _f_buffer4_.f_cb4_[22];
    let _e313 = (_e305.xyz + -(_e310.xyz));
    u_xlat5_.x = _e313.x;
    u_xlat5_.y = _e313.y;
    u_xlat5_.z = _e313.z;
    let _e320 = u_xlat6_;
    let _e322 = vs_TEXCOORD1_1;
    let _e327 = _f_buffer4_.f_cb4_[23];
    let _e330 = (_e322.xyz + -(_e327.xyz));
    u_xlat6_.x = _e330.x;
    u_xlat6_.y = _e330.y;
    u_xlat6_.z = _e330.z;
    let _e338 = u_xlat3_;
    let _e340 = u_xlat3_;
    u_xlat3_.x = dot(_e338.xyz, _e340.xyz);
    let _e344 = u_xlat4_;
    let _e346 = u_xlat4_;
    u_xlat3_.y = dot(_e344.xyz, _e346.xyz);
    let _e350 = u_xlat5_;
    let _e352 = u_xlat5_;
    u_xlat3_.z = dot(_e350.xyz, _e352.xyz);
    let _e356 = u_xlat6_;
    let _e358 = u_xlat6_;
    u_xlat3_.w = dot(_e356.xyz, _e358.xyz);
    let _e361 = u_xlat3_;
    let _e365 = _f_buffer4_.f_cb4_[24];
    u_xlatb3_ = (_e361 < _e365);
    let _e368 = u_xlatb3_;
    if _e368.x {
        local_5 = 1f;
    } else {
        local_5 = 0f;
    }
    let _e374 = local_5;
    u_xlat4_.x = _e374;
    let _e376 = u_xlatb3_;
    if _e376.y {
        local_6 = 1f;
    } else {
        local_6 = 0f;
    }
    let _e382 = local_6;
    u_xlat4_.y = _e382;
    let _e384 = u_xlatb3_;
    if _e384.z {
        local_7 = 1f;
    } else {
        local_7 = 0f;
    }
    let _e390 = local_7;
    u_xlat4_.z = _e390;
    let _e392 = u_xlatb3_;
    if _e392.w {
        local_8 = 1f;
    } else {
        local_8 = 0f;
    }
    let _e398 = local_8;
    u_xlat4_.w = _e398;
    let _e400 = u_xlatb3_;
    if _e400.x {
        local_9 = -1f;
    } else {
        local_9 = -0f;
    }
    let _e409 = local_9;
    u_xlat3_.x = _e409;
    let _e411 = u_xlatb3_;
    if _e411.y {
        local_10 = -1f;
    } else {
        local_10 = -0f;
    }
    let _e420 = local_10;
    u_xlat3_.y = _e420;
    let _e422 = u_xlatb3_;
    if _e422.z {
        local_11 = -1f;
    } else {
        local_11 = -0f;
    }
    let _e431 = local_11;
    u_xlat3_.z = _e431;
    let _e432 = u_xlat3_;
    let _e434 = u_xlat3_;
    let _e436 = u_xlat4_;
    let _e438 = (_e434.xyz + _e436.yzw);
    u_xlat3_.x = _e438.x;
    u_xlat3_.y = _e438.y;
    u_xlat3_.z = _e438.z;
    let _e445 = u_xlat4_;
    let _e447 = u_xlat3_;
    let _e453 = max(_e447.xyz, vec3<f32>(0f, 0f, 0f));
    u_xlat4_.y = _e453.x;
    u_xlat4_.z = _e453.y;
    u_xlat4_.w = _e453.z;
    let _e460 = u_xlat4_;
    u_xlat8_ = dot(_e460, vec4<f32>(4f, 3f, 2f, 1f));
    let _e467 = u_xlat8_;
    u_xlat8_ = (-(_e467) + 4f);
    let _e471 = u_xlat8_;
    u_xlatu8_ = u32(_e471);
    let _e473 = u_xlatu8_;
    u_xlati8_ = (i32(_e473) << 2u);
    let _e478 = u_xlat3_;
    let _e480 = vs_TEXCOORD1_1;
    let _e482 = u_xlati8_;
    let _e487 = _f_buffer4_.f_cb4_[(_e482 + 1i)];
    let _e489 = (_e480.yyy * _e487.xyz);
    u_xlat3_.x = _e489.x;
    u_xlat3_.y = _e489.y;
    u_xlat3_.z = _e489.z;
    let _e496 = u_xlat3_;
    let _e498 = u_xlati8_;
    let _e501 = _f_buffer4_.f_cb4_[_e498];
    let _e503 = vs_TEXCOORD1_1;
    let _e506 = u_xlat3_;
    let _e508 = ((_e501.xyz * _e503.xxx) + _e506.xyz);
    u_xlat3_.x = _e508.x;
    u_xlat3_.y = _e508.y;
    u_xlat3_.z = _e508.z;
    let _e515 = u_xlat3_;
    let _e517 = u_xlati8_;
    let _e522 = _f_buffer4_.f_cb4_[(_e517 + 2i)];
    let _e524 = vs_TEXCOORD1_1;
    let _e527 = u_xlat3_;
    let _e529 = ((_e522.xyz * _e524.zzz) + _e527.xyz);
    u_xlat3_.x = _e529.x;
    u_xlat3_.y = _e529.y;
    u_xlat3_.z = _e529.z;
    let _e536 = u_xlat3_;
    let _e538 = u_xlat3_;
    let _e540 = u_xlati8_;
    let _e545 = _f_buffer4_.f_cb4_[(_e540 + 3i)];
    let _e547 = (_e538.xyz + _e545.xyz);
    u_xlat3_.x = _e547.x;
    u_xlat3_.y = _e547.y;
    u_xlat3_.z = _e547.z;
    u_xlat2_.w = 1f;
    let _e560 = _f_buffer2_.f_cb2_[27];
    let _e561 = u_xlat2_;
    u_xlat4_.x = dot(_e560, _e561);
    let _e567 = _f_buffer2_.f_cb2_[28];
    let _e568 = u_xlat2_;
    u_xlat4_.y = dot(_e567, _e568);
    let _e574 = _f_buffer2_.f_cb2_[29];
    let _e575 = u_xlat2_;
    u_xlat4_.z = dot(_e574, _e575);
    let _e577 = u_xlat2_;
    let _e579 = u_xlat2_;
    u_xlat5_ = (_e577.yzzx * _e579.xyzz);
    let _e586 = _f_buffer2_.f_cb2_[30];
    let _e587 = u_xlat5_;
    u_xlat6_.x = dot(_e586, _e587);
    let _e593 = _f_buffer2_.f_cb2_[31];
    let _e594 = u_xlat5_;
    u_xlat6_.y = dot(_e593, _e594);
    let _e600 = _f_buffer2_.f_cb2_[32];
    let _e601 = u_xlat5_;
    u_xlat6_.z = dot(_e600, _e601);
    let _e603 = u_xlat2_;
    let _e605 = u_xlat2_;
    u_xlat8_ = (_e603.y * _e605.y);
    let _e608 = u_xlat2_;
    let _e610 = u_xlat2_;
    let _e613 = u_xlat8_;
    u_xlat8_ = ((_e608.x * _e610.x) + -(_e613));
    let _e616 = u_xlat5_;
    let _e621 = _f_buffer2_.f_cb2_[33];
    let _e623 = u_xlat8_;
    let _e626 = u_xlat6_;
    let _e628 = ((_e621.xyz * vec3(_e623)) + _e626.xyz);
    u_xlat5_.x = _e628.x;
    u_xlat5_.y = _e628.y;
    u_xlat5_.z = _e628.z;
    let _e635 = u_xlat4_;
    let _e637 = u_xlat4_;
    let _e639 = u_xlat5_;
    let _e641 = (_e637.xyz + _e639.xyz);
    u_xlat4_.x = _e641.x;
    u_xlat4_.y = _e641.y;
    u_xlat4_.z = _e641.z;
    let _e648 = u_xlatb5_;
    let _e655 = u_xlat4_;
    let _e658 = (vec4<f32>(0.0031308f, 0.0031308f, 0.0031308f, 0f) >= _e655.xyzx).xyz;
    u_xlatb5_.x = _e658.x;
    u_xlatb5_.y = _e658.y;
    u_xlatb5_.z = _e658.z;
    let _e665 = u_xlat6_;
    let _e667 = u_xlat4_;
    let _e673 = (_e667.xyz * vec3<f32>(12.92321f, 12.92321f, 12.92321f));
    u_xlat6_.x = _e673.x;
    u_xlat6_.y = _e673.y;
    u_xlat6_.z = _e673.z;
    let _e680 = u_xlat4_;
    let _e682 = u_xlat4_;
    let _e685 = log2(abs(_e682.xyz));
    u_xlat4_.x = _e685.x;
    u_xlat4_.y = _e685.y;
    u_xlat4_.z = _e685.z;
    let _e692 = u_xlat4_;
    let _e694 = u_xlat4_;
    let _e700 = (_e694.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat4_.x = _e700.x;
    u_xlat4_.y = _e700.y;
    u_xlat4_.z = _e700.z;
    let _e707 = u_xlat4_;
    let _e709 = u_xlat4_;
    let _e711 = exp2(_e709.xyz);
    u_xlat4_.x = _e711.x;
    u_xlat4_.y = _e711.y;
    u_xlat4_.z = _e711.z;
    let _e718 = u_xlat4_;
    let _e720 = u_xlat4_;
    let _e734 = ((_e720.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat4_.x = _e734.x;
    u_xlat4_.y = _e734.y;
    u_xlat4_.z = _e734.z;
    {
        let _e741 = u_xlat4_;
        hlslcc_movcTemp = _e741;
        let _e744 = u_xlatb5_;
        if _e744.x {
            let _e746 = u_xlat6_;
            local_12 = _e746.x;
        } else {
            let _e748 = u_xlat4_;
            local_12 = _e748.x;
        }
        let _e751 = local_12;
        hlslcc_movcTemp.x = _e751;
        let _e753 = u_xlatb5_;
        if _e753.y {
            let _e755 = u_xlat6_;
            local_13 = _e755.y;
        } else {
            let _e757 = u_xlat4_;
            local_13 = _e757.y;
        }
        let _e760 = local_13;
        hlslcc_movcTemp.y = _e760;
        let _e762 = u_xlatb5_;
        if _e762.z {
            let _e764 = u_xlat6_;
            local_14 = _e764.z;
        } else {
            let _e766 = u_xlat4_;
            local_14 = _e766.z;
        }
        let _e769 = local_14;
        hlslcc_movcTemp.z = _e769;
        let _e770 = hlslcc_movcTemp;
        u_xlat4_ = _e770;
    }
    let _e771 = u_xlat3_;
    let _e772 = _e771.xy;
    let _e773 = u_xlat3_;
    txVec0_ = vec3<f32>(_e772.x, _e772.y, _e773.z);
    let _e779 = txVec0_;
    let _e783 = textureSampleCompareLevel(f_t1_, samplerf_s1_, _e779.xy, _e779.z);
    u_xlat8_ = _e783;
    let _e787 = _f_buffer4_.f_cb4_[27];
    u_xlat24_ = (-(_e787.x) + 1f);
    let _e792 = u_xlat8_;
    let _e796 = _f_buffer4_.f_cb4_[27];
    let _e799 = u_xlat24_;
    u_xlat8_ = ((_e792 * _e796.x) + _e799);
    let _e802 = u_xlat3_;
    u_xlatb24_ = (0f >= _e802.z);
    let _e805 = u_xlat3_;
    u_xlatb1_ = (_e805.z >= 1f);
    let _e809 = u_xlatb24_;
    let _e810 = u_xlatb1_;
    u_xlatb24_ = (_e809 || _e810);
    let _e812 = u_xlatb24_;
    if _e812 {
        local_15 = 1f;
    } else {
        let _e814 = u_xlat8_;
        local_15 = _e814;
    }
    let _e816 = local_15;
    u_xlat8_ = _e816;
    let _e817 = u_xlat3_;
    let _e819 = vs_TEXCOORD1_1;
    let _e824 = _f_buffer0_.f_cb0_[21];
    let _e827 = (_e819.xyz + -(_e824.xyz));
    u_xlat3_.x = _e827.x;
    u_xlat3_.y = _e827.y;
    u_xlat3_.z = _e827.z;
    let _e834 = u_xlat3_;
    let _e836 = u_xlat3_;
    u_xlat24_ = dot(_e834.xyz, _e836.xyz);
    let _e839 = u_xlat24_;
    let _e843 = _f_buffer4_.f_cb4_[27];
    let _e849 = _f_buffer4_.f_cb4_[27];
    u_xlat24_ = ((_e839 * _e843.z) + _e849.w);
    let _e852 = u_xlat24_;
    u_xlat24_ = clamp(_e852, 0f, 1f);
    let _e857 = u_xlat8_;
    u_xlat1_.x = (-(_e857) + 1f);
    let _e861 = u_xlat24_;
    let _e862 = u_xlat1_;
    let _e865 = u_xlat8_;
    u_xlat8_ = ((_e861 * _e862.x) + _e865);
    let _e867 = u_xlat8_;
    let _e871 = _f_buffer2_.f_cb2_[11];
    u_xlat8_ = (_e867 * _e871.z);
    let _e874 = u_xlat3_;
    let _e876 = u_xlat8_;
    let _e881 = _f_buffer0_.f_cb0_[6];
    let _e883 = (vec3(_e876) * _e881.xyz);
    u_xlat3_.x = _e883.x;
    u_xlat3_.y = _e883.y;
    u_xlat3_.z = _e883.z;
    let _e890 = u_xlat2_;
    let _e895 = _f_buffer0_.f_cb0_[5];
    u_xlat8_ = dot(_e890.xyz, _e895.xyz);
    let _e898 = u_xlat8_;
    u_xlat8_ = clamp(_e898, 0f, 1f);
    let _e902 = u_xlat3_;
    let _e904 = u_xlat8_;
    let _e906 = u_xlat3_;
    let _e908 = (vec3(_e904) * _e906.xyz);
    u_xlat3_.x = _e908.x;
    u_xlat3_.y = _e908.y;
    u_xlat3_.z = _e908.z;
    let _e915 = u_xlat3_;
    let _e917 = u_xlat1_;
    let _e919 = u_xlat3_;
    let _e921 = (_e917.yzw * _e919.xyz);
    u_xlat3_.x = _e921.x;
    u_xlat3_.y = _e921.y;
    u_xlat3_.z = _e921.z;
    let _e931 = _f_buffer0_.f_cb0_[10];
    let _e936 = _f_buffer2_.f_cb2_[11];
    u_xlat8_ = min(_e931.x, _e936.y);
    let _e939 = u_xlat8_;
    u_xlatu8_ = u32(i32(_e939));
    u_xlat5_.x = 0f;
    u_xlat5_.y = 0f;
    u_xlat5_.z = 0f;
    loop {
        let _e953 = u_xlatu_loop_1_;
        let _e954 = u_xlatu8_;
        if !((_e953 < _e954)) {
            break;
        }
        {
            let _e960 = u_xlatu_loop_1_;
            u_xlatu1_ = (_e960 >> 2u);
            let _e963 = u_xlatu_loop_1_;
            u_xlati26_ = i32((_e963 & 3u));
            let _e968 = u_xlatu1_;
            let _e974 = _f_buffer2_.f_cb2_[(i32(_e968) + 12i)];
            let _e975 = u_xlati26_;
            let _e979 = local_16[_e975];
            u_xlat1_.x = dot(_e974, bitcast<vec4<f32>>(_e979));
            let _e982 = u_xlat1_;
            u_xlati1_ = i32(_e982.x);
            let _e985 = u_xlat6_;
            let _e987 = vs_TEXCOORD1_1;
            let _e990 = u_xlati1_;
            let _e993 = _f_buffer1_.f_cb1_[_e990];
            let _e996 = u_xlati1_;
            let _e999 = _f_buffer1_.f_cb1_[_e996];
            let _e1001 = ((-(_e987.xyz) * _e993.www) + _e999.xyz);
            u_xlat6_.x = _e1001.x;
            u_xlat6_.y = _e1001.y;
            u_xlat6_.z = _e1001.z;
            let _e1008 = u_xlat6_;
            let _e1010 = u_xlat6_;
            u_xlat26_ = dot(_e1008.xyz, _e1010.xyz);
            let _e1013 = u_xlat26_;
            u_xlat26_ = max(_e1013, 0.000061035156f);
            let _e1016 = u_xlat26_;
            u_xlat27_ = inverseSqrt(_e1016);
            let _e1018 = u_xlat6_;
            let _e1020 = u_xlat27_;
            let _e1022 = u_xlat6_;
            let _e1024 = (vec3(_e1020) * _e1022.xyz);
            u_xlat6_.x = _e1024.x;
            u_xlat6_.y = _e1024.y;
            u_xlat6_.z = _e1024.z;
            let _e1033 = u_xlat26_;
            u_xlat27_ = (1f / _e1033);
            let _e1035 = u_xlat26_;
            let _e1036 = u_xlati1_;
            let _e1041 = _f_buffer1_.f_cb1_[(_e1036 + 512i)];
            u_xlat26_ = (_e1035 * _e1041.x);
            let _e1044 = u_xlat26_;
            let _e1046 = u_xlat26_;
            u_xlat26_ = ((-(_e1044) * _e1046) + 1f);
            let _e1050 = u_xlat26_;
            u_xlat26_ = max(_e1050, 0f);
            let _e1053 = u_xlat26_;
            let _e1054 = u_xlat26_;
            u_xlat26_ = (_e1053 * _e1054);
            let _e1056 = u_xlat26_;
            let _e1057 = u_xlat27_;
            u_xlat26_ = (_e1056 * _e1057);
            let _e1059 = u_xlati1_;
            let _e1064 = _f_buffer1_.f_cb1_[(_e1059 + 768i)];
            let _e1066 = u_xlat6_;
            u_xlat27_ = dot(_e1064.xyz, _e1066.xyz);
            let _e1069 = u_xlat27_;
            let _e1070 = u_xlati1_;
            let _e1075 = _f_buffer1_.f_cb1_[(_e1070 + 512i)];
            let _e1078 = u_xlati1_;
            let _e1083 = _f_buffer1_.f_cb1_[(_e1078 + 512i)];
            u_xlat27_ = ((_e1069 * _e1075.z) + _e1083.w);
            let _e1086 = u_xlat27_;
            u_xlat27_ = clamp(_e1086, 0f, 1f);
            let _e1090 = u_xlat27_;
            let _e1091 = u_xlat27_;
            u_xlat27_ = (_e1090 * _e1091);
            let _e1093 = u_xlat26_;
            let _e1094 = u_xlat27_;
            u_xlat26_ = (_e1093 * _e1094);
            let _e1096 = u_xlat7_;
            let _e1098 = u_xlat26_;
            let _e1100 = u_xlati1_;
            let _e1105 = _f_buffer1_.f_cb1_[(_e1100 + 256i)];
            let _e1107 = (vec3(_e1098) * _e1105.xyz);
            u_xlat7_.x = _e1107.x;
            u_xlat7_.y = _e1107.y;
            u_xlat7_.z = _e1107.z;
            let _e1115 = u_xlat2_;
            let _e1117 = u_xlat6_;
            u_xlat1_.x = dot(_e1115.xyz, _e1117.xyz);
            let _e1121 = u_xlat1_;
            u_xlat1_.x = clamp(_e1121.x, 0f, 1f);
            let _e1126 = u_xlat6_;
            let _e1128 = u_xlat1_;
            let _e1130 = u_xlat7_;
            let _e1132 = (_e1128.xxx * _e1130.xyz);
            u_xlat6_.x = _e1132.x;
            u_xlat6_.y = _e1132.y;
            u_xlat6_.z = _e1132.z;
            let _e1139 = u_xlat5_;
            let _e1141 = u_xlat6_;
            let _e1143 = u_xlat1_;
            let _e1146 = u_xlat5_;
            let _e1148 = ((_e1141.xyz * _e1143.yzw) + _e1146.xyz);
            u_xlat5_.x = _e1148.x;
            u_xlat5_.y = _e1148.y;
            u_xlat5_.z = _e1148.z;
        }
        continuing {
            let _e957 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e957 + 1u);
        }
    }
    let _e1155 = u_xlat1_;
    let _e1157 = u_xlat4_;
    let _e1159 = u_xlat1_;
    let _e1162 = u_xlat3_;
    let _e1164 = ((_e1157.xyz * _e1159.yzw) + _e1162.xyz);
    u_xlat1_.x = _e1164.x;
    u_xlat1_.y = _e1164.y;
    u_xlat1_.z = _e1164.z;
    let _e1171 = SV_Target0_;
    let _e1173 = u_xlat5_;
    let _e1175 = u_xlat1_;
    let _e1177 = (_e1173.xyz + _e1175.xyz);
    SV_Target0_.x = _e1177.x;
    SV_Target0_.y = _e1177.y;
    SV_Target0_.z = _e1177.z;
    let _e1187 = _f_buffer3_.f_cb3_[5];
    u_xlatb8_ = (_e1187.y == 1f);
    let _e1191 = u_xlatb8_;
    let _e1192 = u_xlatb0_;
    u_xlatb0_ = (_e1191 || _e1192);
    let _e1195 = u_xlatb0_;
    if _e1195 {
        let _e1196 = u_xlat16_;
        local_17 = _e1196;
    } else {
        local_17 = 1f;
    }
    let _e1199 = local_17;
    SV_Target0_.w = _e1199;
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
