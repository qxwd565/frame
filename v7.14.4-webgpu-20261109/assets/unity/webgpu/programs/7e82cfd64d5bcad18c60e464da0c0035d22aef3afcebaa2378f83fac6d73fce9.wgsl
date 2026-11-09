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
    var u_xlat4_: vec4<f32> = vec4(0f);
    var u_xlati4_: i32 = 0i;
    var u_xlatu4_: u32 = 0u;
    var u_xlatb4_: bool = false;
    var u_xlat5_: vec4<f32> = vec4(0f);
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
    let _e136 = u_xlat1_;
    u_xlat2_.x = (_e136.x * 0.5f);
    u_xlat2_.y = 0f;
    let _e142 = u_xlat2_;
    let _e144 = vs_TEXCOORD0_1;
    u_xlat2_ = (_e142.xyxx + _e144.xyxy);
    let _e147 = u_xlat2_;
    let _e152 = _f_buffer0_.f_cb0_[4];
    let _e157 = hscard_bias.values[1];
    let _e160 = textureSampleBias(f_t1_, samplerf_s1_, _e147.xy, (_e152.x + _e157.x));
    u_xlat3_ = _e160;
    let _e161 = u_xlat0_;
    let _e162 = u_xlat3_;
    u_xlat0_ = (_e161 + _e162);
    u_xlat1_.y = 0f;
    let _e166 = u_xlat1_;
    let _e168 = vs_TEXCOORD0_1;
    u_xlat3_ = (_e166.xyyx + _e168.xyxy);
    let _e171 = u_xlat3_;
    let _e176 = _f_buffer0_.f_cb0_[4];
    let _e181 = hscard_bias.values[1];
    let _e184 = textureSampleBias(f_t1_, samplerf_s1_, _e171.xy, (_e176.x + _e181.x));
    u_xlat4_ = _e184;
    let _e185 = u_xlat0_;
    let _e186 = u_xlat4_;
    u_xlat0_ = (_e185 + _e186);
    let _e188 = u_xlat1_;
    let _e190 = u_xlat1_;
    let _e195 = (_e190.xx * vec2<f32>(0.5f, 0.5f));
    u_xlat1_.z = _e195.x;
    u_xlat1_.w = _e195.y;
    let _e200 = u_xlat1_;
    let _e202 = vs_TEXCOORD0_1;
    u_xlat4_ = (_e200.yzxz + _e202.xyxy);
    let _e205 = u_xlat4_;
    let _e210 = _f_buffer0_.f_cb0_[4];
    let _e215 = hscard_bias.values[1];
    let _e218 = textureSampleBias(f_t1_, samplerf_s1_, _e205.xy, (_e210.x + _e215.x));
    u_xlat5_ = _e218;
    let _e219 = u_xlat0_;
    let _e220 = u_xlat5_;
    u_xlat0_ = (_e219 + _e220);
    let _e222 = u_xlat2_;
    let _e227 = _f_buffer0_.f_cb0_[4];
    let _e232 = hscard_bias.values[1];
    let _e235 = textureSampleBias(f_t1_, samplerf_s1_, _e222.zw, (_e227.x + _e232.x));
    u_xlat2_ = _e235;
    let _e236 = u_xlat0_;
    let _e237 = u_xlat2_;
    u_xlat0_ = (_e236 + _e237);
    let _e239 = u_xlat4_;
    let _e244 = _f_buffer0_.f_cb0_[4];
    let _e249 = hscard_bias.values[1];
    let _e252 = textureSampleBias(f_t1_, samplerf_s1_, _e239.zw, (_e244.x + _e249.x));
    u_xlat2_ = _e252;
    let _e253 = u_xlat0_;
    let _e254 = u_xlat2_;
    u_xlat0_ = (_e253 + _e254);
    let _e256 = u_xlat3_;
    let _e261 = _f_buffer0_.f_cb0_[4];
    let _e266 = hscard_bias.values[1];
    let _e269 = textureSampleBias(f_t1_, samplerf_s1_, _e256.zw, (_e261.x + _e266.x));
    u_xlat2_ = _e269;
    let _e270 = u_xlat0_;
    let _e271 = u_xlat2_;
    u_xlat0_ = (_e270 + _e271);
    let _e273 = u_xlat1_;
    let _e275 = vs_TEXCOORD0_1;
    u_xlat1_ = (_e273.wxxx + _e275.xyxy);
    let _e278 = u_xlat1_;
    let _e283 = _f_buffer0_.f_cb0_[4];
    let _e288 = hscard_bias.values[1];
    let _e291 = textureSampleBias(f_t1_, samplerf_s1_, _e278.xy, (_e283.x + _e288.x));
    u_xlat2_ = _e291;
    let _e292 = u_xlat0_;
    let _e293 = u_xlat2_;
    u_xlat0_ = (_e292 + _e293);
    let _e295 = u_xlat1_;
    let _e300 = _f_buffer0_.f_cb0_[4];
    let _e305 = hscard_bias.values[1];
    let _e308 = textureSampleBias(f_t1_, samplerf_s1_, _e295.zw, (_e300.x + _e305.x));
    u_xlat1_ = _e308;
    let _e309 = u_xlat0_;
    let _e310 = u_xlat1_;
    u_xlat0_ = (_e309 + _e310);
    let _e312 = u_xlat0_;
    u_xlat0_ = (_e312 * vec4<f32>(0.11111111f, 0.11111111f, 0.11111111f, 0.11111111f));
    let _e324 = _f_buffer4_.f_cb4_[1];
    u_xlatb1_.x = (0f < _e324.x);
    let _e327 = u_xlatb1_;
    if _e327.x {
        {
            let _e329 = vs_TEXCOORD5_1;
            let _e334 = _f_buffer0_.f_cb0_[4];
            let _e339 = hscard_bias.values[2];
            let _e342 = textureSampleBias(f_t2_, samplerf_s2_, _e329.xy, (_e334.x + _e339.x));
            u_xlat1_ = _e342;
            let _e347 = _f_buffer4_.f_cb4_[3];
            let _e349 = u_xlat1_;
            u_xlatb1_.x = (_e347.x < _e349.x);
            let _e353 = u_xlatb1_;
            if _e353.x {
                local = 1f;
            } else {
                local = 0f;
            }
            let _e359 = local;
            u_xlat1_.x = _e359;
            let _e361 = u_xlat0_;
            let _e363 = u_xlat1_;
            u_xlat0_.w = (_e361.w * _e363.x);
        }
    }
    let _e366 = u_xlat1_;
    let _e368 = vs_TEXCOORD1_1;
    let _e373 = _f_buffer3_.f_cb3_[20];
    let _e376 = (_e368.xyz + -(_e373.xyz));
    u_xlat1_.x = _e376.x;
    u_xlat1_.y = _e376.y;
    u_xlat1_.z = _e376.z;
    let _e383 = u_xlat2_;
    let _e385 = vs_TEXCOORD1_1;
    let _e390 = _f_buffer3_.f_cb3_[21];
    let _e393 = (_e385.xyz + -(_e390.xyz));
    u_xlat2_.x = _e393.x;
    u_xlat2_.y = _e393.y;
    u_xlat2_.z = _e393.z;
    let _e400 = u_xlat3_;
    let _e402 = vs_TEXCOORD1_1;
    let _e407 = _f_buffer3_.f_cb3_[22];
    let _e410 = (_e402.xyz + -(_e407.xyz));
    u_xlat3_.x = _e410.x;
    u_xlat3_.y = _e410.y;
    u_xlat3_.z = _e410.z;
    let _e417 = u_xlat4_;
    let _e419 = vs_TEXCOORD1_1;
    let _e424 = _f_buffer3_.f_cb3_[23];
    let _e427 = (_e419.xyz + -(_e424.xyz));
    u_xlat4_.x = _e427.x;
    u_xlat4_.y = _e427.y;
    u_xlat4_.z = _e427.z;
    let _e435 = u_xlat1_;
    let _e437 = u_xlat1_;
    u_xlat1_.x = dot(_e435.xyz, _e437.xyz);
    let _e441 = u_xlat2_;
    let _e443 = u_xlat2_;
    u_xlat1_.y = dot(_e441.xyz, _e443.xyz);
    let _e447 = u_xlat3_;
    let _e449 = u_xlat3_;
    u_xlat1_.z = dot(_e447.xyz, _e449.xyz);
    let _e453 = u_xlat4_;
    let _e455 = u_xlat4_;
    u_xlat1_.w = dot(_e453.xyz, _e455.xyz);
    let _e458 = u_xlat1_;
    let _e462 = _f_buffer3_.f_cb3_[24];
    u_xlatb1_ = (_e458 < _e462);
    let _e465 = u_xlatb1_;
    if _e465.x {
        local_1 = 1f;
    } else {
        local_1 = 0f;
    }
    let _e471 = local_1;
    u_xlat2_.x = _e471;
    let _e473 = u_xlatb1_;
    if _e473.y {
        local_2 = 1f;
    } else {
        local_2 = 0f;
    }
    let _e479 = local_2;
    u_xlat2_.y = _e479;
    let _e481 = u_xlatb1_;
    if _e481.z {
        local_3 = 1f;
    } else {
        local_3 = 0f;
    }
    let _e487 = local_3;
    u_xlat2_.z = _e487;
    let _e489 = u_xlatb1_;
    if _e489.w {
        local_4 = 1f;
    } else {
        local_4 = 0f;
    }
    let _e495 = local_4;
    u_xlat2_.w = _e495;
    let _e497 = u_xlatb1_;
    if _e497.x {
        local_5 = -1f;
    } else {
        local_5 = -0f;
    }
    let _e506 = local_5;
    u_xlat1_.x = _e506;
    let _e508 = u_xlatb1_;
    if _e508.y {
        local_6 = -1f;
    } else {
        local_6 = -0f;
    }
    let _e517 = local_6;
    u_xlat1_.y = _e517;
    let _e519 = u_xlatb1_;
    if _e519.z {
        local_7 = -1f;
    } else {
        local_7 = -0f;
    }
    let _e528 = local_7;
    u_xlat1_.z = _e528;
    let _e529 = u_xlat1_;
    let _e531 = u_xlat1_;
    let _e533 = u_xlat2_;
    let _e535 = (_e531.xyz + _e533.yzw);
    u_xlat1_.x = _e535.x;
    u_xlat1_.y = _e535.y;
    u_xlat1_.z = _e535.z;
    let _e542 = u_xlat2_;
    let _e544 = u_xlat1_;
    let _e550 = max(_e544.xyz, vec3<f32>(0f, 0f, 0f));
    u_xlat2_.y = _e550.x;
    u_xlat2_.z = _e550.y;
    u_xlat2_.w = _e550.z;
    let _e558 = u_xlat2_;
    u_xlat1_.x = dot(_e558, vec4<f32>(4f, 3f, 2f, 1f));
    let _e566 = u_xlat1_;
    u_xlat1_.x = (-(_e566.x) + 4f);
    let _e571 = u_xlat1_;
    u_xlatu1_ = u32(_e571.x);
    let _e574 = u_xlatu1_;
    u_xlati1_ = (i32(_e574) << 2u);
    let _e579 = u_xlat7_;
    let _e581 = vs_TEXCOORD1_1;
    let _e583 = u_xlati1_;
    let _e588 = _f_buffer3_.f_cb3_[(_e583 + 1i)];
    let _e590 = (_e581.yyy * _e588.xyz);
    u_xlat7_.x = _e590.x;
    u_xlat7_.y = _e590.y;
    u_xlat7_.z = _e590.z;
    let _e597 = u_xlat7_;
    let _e599 = u_xlati1_;
    let _e602 = _f_buffer3_.f_cb3_[_e599];
    let _e604 = vs_TEXCOORD1_1;
    let _e607 = u_xlat7_;
    let _e609 = ((_e602.xyz * _e604.xxx) + _e607.xyz);
    u_xlat7_.x = _e609.x;
    u_xlat7_.y = _e609.y;
    u_xlat7_.z = _e609.z;
    let _e616 = u_xlat7_;
    let _e618 = u_xlati1_;
    let _e623 = _f_buffer3_.f_cb3_[(_e618 + 2i)];
    let _e625 = vs_TEXCOORD1_1;
    let _e628 = u_xlat7_;
    let _e630 = ((_e623.xyz * _e625.zzz) + _e628.xyz);
    u_xlat7_.x = _e630.x;
    u_xlat7_.y = _e630.y;
    u_xlat7_.z = _e630.z;
    let _e637 = u_xlat1_;
    let _e639 = u_xlat7_;
    let _e641 = u_xlati1_;
    let _e646 = _f_buffer3_.f_cb3_[(_e641 + 3i)];
    let _e648 = (_e639.xyz + _e646.xyz);
    u_xlat1_.x = _e648.x;
    u_xlat1_.y = _e648.y;
    u_xlat1_.z = _e648.z;
    let _e655 = vs_NORMAL0_1;
    let _e657 = vs_NORMAL0_1;
    u_xlat19_ = dot(_e655.xyz, _e657.xyz);
    let _e660 = u_xlat19_;
    u_xlat19_ = inverseSqrt(_e660);
    let _e662 = u_xlat2_;
    let _e664 = u_xlat19_;
    let _e666 = vs_NORMAL0_1;
    let _e668 = (vec3(_e664) * _e666.xyz);
    u_xlat2_.x = _e668.x;
    u_xlat2_.y = _e668.y;
    u_xlat2_.z = _e668.z;
    let _e675 = u_xlat1_;
    let _e676 = _e675.xy;
    let _e677 = u_xlat1_;
    txVec0_ = vec3<f32>(_e676.x, _e676.y, _e677.z);
    let _e684 = txVec0_;
    let _e688 = textureSampleCompareLevel(f_t0_, samplerf_s0_, _e684.xy, _e684.z);
    u_xlat1_.x = _e688;
    let _e693 = _f_buffer3_.f_cb3_[27];
    u_xlat7_.x = (-(_e693.x) + 1f);
    let _e699 = u_xlat1_;
    let _e704 = _f_buffer3_.f_cb3_[27];
    let _e707 = u_xlat7_;
    u_xlat1_.x = ((_e699.x * _e704.x) + _e707.x);
    let _e711 = u_xlat1_;
    u_xlatb7_ = (0f >= _e711.z);
    let _e714 = u_xlat1_;
    u_xlatb13_ = (_e714.z >= 1f);
    let _e718 = u_xlatb13_;
    let _e719 = u_xlatb7_;
    u_xlatb7_ = (_e718 || _e719);
    let _e722 = u_xlatb7_;
    if _e722 {
        local_8 = 1f;
    } else {
        let _e724 = u_xlat1_;
        local_8 = _e724.x;
    }
    let _e727 = local_8;
    u_xlat1_.x = _e727;
    let _e729 = u_xlat1_;
    let _e734 = _f_buffer2_.f_cb2_[11];
    u_xlat1_.x = (_e729.x * _e734.z);
    let _e737 = u_xlat1_;
    let _e739 = u_xlat1_;
    let _e744 = _f_buffer0_.f_cb0_[6];
    let _e746 = (_e739.xxx * _e744.xyz);
    u_xlat1_.x = _e746.x;
    u_xlat1_.y = _e746.y;
    u_xlat1_.z = _e746.z;
    let _e753 = u_xlat2_;
    let _e758 = _f_buffer0_.f_cb0_[5];
    u_xlat19_ = dot(_e753.xyz, _e758.xyz);
    let _e761 = u_xlat19_;
    u_xlat19_ = clamp(_e761, 0f, 1f);
    let _e768 = _f_buffer0_.f_cb0_[10];
    let _e773 = _f_buffer2_.f_cb2_[11];
    u_xlat20_ = min(_e768.x, _e773.y);
    let _e776 = u_xlat20_;
    u_xlatu20_ = u32(i32(_e776));
    u_xlat3_.x = 0f;
    u_xlat3_.y = 0f;
    u_xlat3_.z = 0f;
    loop {
        let _e791 = u_xlatu_loop_1_;
        let _e792 = u_xlatu20_;
        if !((_e791 < _e792)) {
            break;
        }
        {
            let _e798 = u_xlatu_loop_1_;
            u_xlatu4_ = (_e798 >> 2u);
            let _e801 = u_xlatu_loop_1_;
            u_xlati10_ = i32((_e801 & 3u));
            let _e806 = u_xlatu4_;
            let _e812 = _f_buffer2_.f_cb2_[(i32(_e806) + 12i)];
            let _e813 = u_xlati10_;
            let _e817 = local_9[_e813];
            u_xlat4_.x = dot(_e812, bitcast<vec4<f32>>(_e817));
            let _e820 = u_xlat4_;
            u_xlati4_ = i32(_e820.x);
            let _e823 = u_xlat10_;
            let _e825 = vs_TEXCOORD1_1;
            let _e828 = u_xlati4_;
            let _e831 = _f_buffer1_.f_cb1_[_e828];
            let _e834 = u_xlati4_;
            let _e837 = _f_buffer1_.f_cb1_[_e834];
            let _e839 = ((-(_e825.xyz) * _e831.www) + _e837.xyz);
            u_xlat10_.x = _e839.x;
            u_xlat10_.y = _e839.y;
            u_xlat10_.z = _e839.z;
            let _e847 = u_xlat10_;
            let _e849 = u_xlat10_;
            u_xlat5_.x = dot(_e847.xyz, _e849.xyz);
            let _e853 = u_xlat5_;
            u_xlat5_.x = max(_e853.x, 0.000061035156f);
            let _e857 = u_xlat5_;
            u_xlat11_ = inverseSqrt(_e857.x);
            let _e860 = u_xlat10_;
            let _e862 = u_xlat10_;
            let _e864 = u_xlat11_;
            let _e866 = (_e862.xyz * vec3(_e864));
            u_xlat10_.x = _e866.x;
            u_xlat10_.y = _e866.y;
            u_xlat10_.z = _e866.z;
            let _e875 = u_xlati4_;
            let _e880 = _f_buffer1_.f_cb1_[(_e875 + 512i)];
            u_xlat11_ = (1f / _e880.x);
            let _e884 = u_xlat5_;
            u_xlat5_.x = (_e884.x * 25f);
            let _e889 = u_xlat5_;
            let _e891 = u_xlat11_;
            u_xlat5_.x = (_e889.x / _e891);
            let _e894 = u_xlat5_;
            u_xlat5_.x = (_e894.x + 1f);
            let _e901 = u_xlat5_;
            u_xlat5_.x = (1f / _e901.x);
            let _e904 = u_xlati4_;
            let _e909 = _f_buffer1_.f_cb1_[(_e904 + 768i)];
            let _e911 = u_xlat10_;
            u_xlat11_ = dot(_e909.xyz, _e911.xyz);
            let _e914 = u_xlat11_;
            let _e915 = u_xlati4_;
            let _e920 = _f_buffer1_.f_cb1_[(_e915 + 512i)];
            let _e923 = u_xlati4_;
            let _e928 = _f_buffer1_.f_cb1_[(_e923 + 512i)];
            u_xlat11_ = ((_e914 * _e920.z) + _e928.w);
            let _e931 = u_xlat11_;
            u_xlat11_ = clamp(_e931, 0f, 1f);
            let _e935 = u_xlat11_;
            let _e936 = u_xlat11_;
            u_xlat11_ = (_e935 * _e936);
            let _e939 = u_xlat11_;
            let _e940 = u_xlat5_;
            u_xlat5_.x = (_e939 * _e940.x);
            let _e943 = u_xlat5_;
            let _e945 = u_xlat5_;
            let _e947 = u_xlati4_;
            let _e952 = _f_buffer1_.f_cb1_[(_e947 + 256i)];
            let _e954 = (_e945.xxx * _e952.xyz);
            u_xlat5_.x = _e954.x;
            u_xlat5_.y = _e954.y;
            u_xlat5_.z = _e954.z;
            let _e962 = u_xlat2_;
            let _e964 = u_xlat10_;
            u_xlat4_.x = dot(_e962.xyz, _e964.xyz);
            let _e968 = u_xlat4_;
            u_xlat4_.x = clamp(_e968.x, 0f, 1f);
            let _e973 = u_xlat3_;
            let _e975 = u_xlat5_;
            let _e977 = u_xlat4_;
            let _e980 = u_xlat3_;
            let _e982 = ((_e975.xyz * _e977.xxx) + _e980.xyz);
            u_xlat3_.x = _e982.x;
            u_xlat3_.y = _e982.y;
            u_xlat3_.z = _e982.z;
        }
        continuing {
            let _e795 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e795 + 1u);
        }
    }
    let _e989 = u_xlat1_;
    let _e991 = u_xlat1_;
    let _e993 = u_xlat19_;
    let _e996 = u_xlat3_;
    let _e998 = ((_e991.xyz * vec3(_e993)) + _e996.xyz);
    u_xlat1_.x = _e998.x;
    u_xlat1_.y = _e998.y;
    u_xlat1_.z = _e998.z;
    let _e1009 = _f_buffer2_.f_cb2_[27];
    u_xlat2_.x = abs(_e1009.w);
    let _e1016 = _f_buffer2_.f_cb2_[28];
    u_xlat2_.y = abs(_e1016.w);
    let _e1023 = _f_buffer2_.f_cb2_[29];
    u_xlat2_.z = abs(_e1023.w);
    let _e1026 = u_xlat2_;
    let _e1028 = u_xlat2_;
    let _e1030 = log2(_e1028.xyz);
    u_xlat2_.x = _e1030.x;
    u_xlat2_.y = _e1030.y;
    u_xlat2_.z = _e1030.z;
    let _e1037 = u_xlat2_;
    let _e1039 = u_xlat2_;
    let _e1045 = (_e1039.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat2_.x = _e1045.x;
    u_xlat2_.y = _e1045.y;
    u_xlat2_.z = _e1045.z;
    let _e1052 = u_xlat2_;
    let _e1054 = u_xlat2_;
    let _e1056 = exp2(_e1054.xyz);
    u_xlat2_.x = _e1056.x;
    u_xlat2_.y = _e1056.y;
    u_xlat2_.z = _e1056.z;
    let _e1063 = u_xlat2_;
    let _e1065 = u_xlat2_;
    let _e1079 = ((_e1065.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat2_.x = _e1079.x;
    u_xlat2_.y = _e1079.y;
    u_xlat2_.z = _e1079.z;
    let _e1086 = u_xlat2_;
    let _e1088 = u_xlat2_;
    let _e1094 = clamp(_e1088.xyz, vec3(0f), vec3(1f));
    u_xlat2_.x = _e1094.x;
    u_xlat2_.y = _e1094.y;
    u_xlat2_.z = _e1094.z;
    let _e1101 = u_xlat1_;
    let _e1103 = u_xlat1_;
    let _e1105 = u_xlat2_;
    let _e1107 = (_e1103.xyz + _e1105.xyz);
    u_xlat1_.x = _e1107.x;
    u_xlat1_.y = _e1107.y;
    u_xlat1_.z = _e1107.z;
    let _e1114 = u_xlat1_;
    let _e1116 = u_xlat0_;
    let _e1118 = u_xlat1_;
    let _e1120 = (_e1116.xyz * _e1118.xyz);
    u_xlat1_.x = _e1120.x;
    u_xlat1_.y = _e1120.y;
    u_xlat1_.z = _e1120.z;
    let _e1127 = u_xlat0_;
    let _e1129 = u_xlat0_;
    let _e1131 = u_xlat1_;
    let _e1133 = (_e1129.www * _e1131.xyz);
    u_xlat0_.x = _e1133.x;
    u_xlat0_.y = _e1133.y;
    u_xlat0_.z = _e1133.z;
    let _e1140 = u_xlat0_;
    SV_Target0_ = _e1140;
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
