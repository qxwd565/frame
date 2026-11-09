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
var<private> vs_TEXCOORD6_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlatb0_: bool = false;
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlati1_: i32 = 0i;
    var u_xlatu1_: u32 = 0u;
    var u_xlatb1_: bool = false;
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: vec4<f32> = vec4(0f);
    var u_xlatb4_: vec3<bool> = vec3(false);
    var u_xlat5_: vec3<f32> = vec3(0f);
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
    var hlslcc_movcTemp: vec3<f32>;
    var local_5: f32;
    var local_6: f32;
    var local_7: f32;
    var txVec0_: vec3<f32>;
    var local_8: f32;
    var u_xlatu_loop_1_: u32 = 0u;
    var local_9: array<vec4<u32>, 4> = ImmCB_0_;
    var local_10: f32;

    let _e109 = vs_TEXCOORD0_1;
    let _e114 = _f_buffer0_.f_cb0_[4];
    let _e119 = hscard_bias.values[0];
    let _e122 = textureSampleBias(f_t0_, samplerf_s0_, _e109.xy, (_e114.x + _e119.x));
    u_xlat0_ = _e122;
    let _e123 = u_xlat0_;
    let _e128 = _f_buffer3_.f_cb3_[2];
    u_xlat1_ = (_e123.wxyz * _e128.wxyz);
    let _e134 = _f_buffer0_.f_cb0_[4];
    u_xlatb0_ = (_e134.z != 0f);
    let _e142 = _f_buffer3_.f_cb3_[5];
    if (0f >= _e142.x) {
        local = 4294967295u;
    } else {
        local = 0u;
    }
    let _e149 = local;
    u_xlati8_ = i32(_e149);
    let _e151 = u_xlat1_;
    let _e153 = dpdx(_e151.x);
    u_xlat16_ = _e153;
    let _e155 = u_xlat1_;
    let _e157 = dpdy(_e155.x);
    u_xlat2_.x = _e157;
    let _e158 = u_xlat16_;
    let _e160 = u_xlat2_;
    u_xlat16_ = (abs(_e158) + abs(_e160.x));
    let _e164 = u_xlat0_;
    let _e169 = _f_buffer3_.f_cb3_[2];
    let _e175 = _f_buffer3_.f_cb3_[5];
    u_xlat24_ = ((_e164.w * _e169.w) + -(_e175.x));
    let _e180 = u_xlat16_;
    let _e184 = u_xlat24_;
    u_xlat2_.x = ((-(_e180) * 0.5f) + _e184);
    let _e186 = u_xlat16_;
    u_xlat16_ = max(_e186, 0.0001f);
    let _e189 = u_xlat2_;
    let _e191 = u_xlat16_;
    u_xlat16_ = (_e189.x / _e191);
    let _e193 = u_xlat16_;
    u_xlat16_ = (_e193 + 1f);
    let _e196 = u_xlat16_;
    u_xlat16_ = clamp(_e196, 0f, 1f);
    let _e200 = u_xlati8_;
    if (_e200 != 0i) {
        local_1 = 1f;
    } else {
        let _e204 = u_xlat16_;
        local_1 = _e204;
    }
    let _e206 = local_1;
    u_xlat16_ = _e206;
    let _e207 = u_xlati8_;
    u_xlati8_ = ~(_e207);
    let _e209 = u_xlatb0_;
    if _e209 {
        let _e210 = u_xlati8_;
        local_2 = _e210;
    } else {
        local_2 = 0i;
    }
    let _e214 = local_2;
    u_xlati8_ = _e214;
    let _e216 = u_xlat16_;
    u_xlat2_.x = (_e216 + -0.0001f);
    let _e220 = u_xlati8_;
    if (_e220 != 0i) {
        let _e223 = u_xlat2_;
        local_3 = _e223.x;
    } else {
        let _e225 = u_xlat24_;
        local_3 = _e225;
    }
    let _e227 = local_3;
    u_xlat8_ = _e227;
    let _e228 = u_xlatb0_;
    if _e228 {
        let _e229 = u_xlat16_;
        local_4 = _e229;
    } else {
        let _e230 = u_xlat1_;
        local_4 = _e230.x;
    }
    let _e233 = local_4;
    u_xlat16_ = _e233;
    let _e234 = u_xlat8_;
    u_xlatb8_ = (_e234 < 0f);
    let _e237 = u_xlatb8_;
    if ((select(0i, 1i, _e237) * -1i) != 0i) {
        {
            discard;
        }
    }
    let _e246 = vs_TEXCOORD2_1;
    let _e248 = vs_TEXCOORD2_1;
    u_xlat8_ = dot(_e246.xyz, _e248.xyz);
    let _e251 = u_xlat8_;
    u_xlat8_ = inverseSqrt(_e251);
    let _e253 = u_xlat2_;
    let _e255 = u_xlat8_;
    let _e257 = vs_TEXCOORD2_1;
    let _e259 = (vec3(_e255) * _e257.xyz);
    u_xlat2_.x = _e259.x;
    u_xlat2_.y = _e259.y;
    u_xlat2_.z = _e259.z;
    u_xlat2_.w = 1f;
    let _e272 = _f_buffer2_.f_cb2_[27];
    let _e273 = u_xlat2_;
    u_xlat3_.x = dot(_e272, _e273);
    let _e279 = _f_buffer2_.f_cb2_[28];
    let _e280 = u_xlat2_;
    u_xlat3_.y = dot(_e279, _e280);
    let _e286 = _f_buffer2_.f_cb2_[29];
    let _e287 = u_xlat2_;
    u_xlat3_.z = dot(_e286, _e287);
    let _e289 = u_xlat2_;
    let _e291 = u_xlat2_;
    u_xlat4_ = (_e289.yzzx * _e291.xyzz);
    let _e298 = _f_buffer2_.f_cb2_[30];
    let _e299 = u_xlat4_;
    u_xlat5_.x = dot(_e298, _e299);
    let _e305 = _f_buffer2_.f_cb2_[31];
    let _e306 = u_xlat4_;
    u_xlat5_.y = dot(_e305, _e306);
    let _e312 = _f_buffer2_.f_cb2_[32];
    let _e313 = u_xlat4_;
    u_xlat5_.z = dot(_e312, _e313);
    let _e315 = u_xlat2_;
    let _e317 = u_xlat2_;
    u_xlat8_ = (_e315.y * _e317.y);
    let _e320 = u_xlat2_;
    let _e322 = u_xlat2_;
    let _e325 = u_xlat8_;
    u_xlat8_ = ((_e320.x * _e322.x) + -(_e325));
    let _e328 = u_xlat4_;
    let _e333 = _f_buffer2_.f_cb2_[33];
    let _e335 = u_xlat8_;
    let _e338 = u_xlat5_;
    let _e340 = ((_e333.xyz * vec3(_e335)) + _e338.xyz);
    u_xlat4_.x = _e340.x;
    u_xlat4_.y = _e340.y;
    u_xlat4_.z = _e340.z;
    let _e347 = u_xlat3_;
    let _e349 = u_xlat3_;
    let _e351 = u_xlat4_;
    let _e353 = (_e349.xyz + _e351.xyz);
    u_xlat3_.x = _e353.x;
    u_xlat3_.y = _e353.y;
    u_xlat3_.z = _e353.z;
    let _e360 = u_xlatb4_;
    let _e367 = u_xlat3_;
    let _e370 = (vec4<f32>(0.0031308f, 0.0031308f, 0.0031308f, 0f) >= _e367.xyzx).xyz;
    u_xlatb4_.x = _e370.x;
    u_xlatb4_.y = _e370.y;
    u_xlatb4_.z = _e370.z;
    let _e377 = u_xlat5_;
    let _e379 = u_xlat3_;
    let _e385 = (_e379.xyz * vec3<f32>(12.92321f, 12.92321f, 12.92321f));
    u_xlat5_.x = _e385.x;
    u_xlat5_.y = _e385.y;
    u_xlat5_.z = _e385.z;
    let _e392 = u_xlat3_;
    let _e394 = u_xlat3_;
    let _e397 = log2(abs(_e394.xyz));
    u_xlat3_.x = _e397.x;
    u_xlat3_.y = _e397.y;
    u_xlat3_.z = _e397.z;
    let _e404 = u_xlat3_;
    let _e406 = u_xlat3_;
    let _e412 = (_e406.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat3_.x = _e412.x;
    u_xlat3_.y = _e412.y;
    u_xlat3_.z = _e412.z;
    let _e419 = u_xlat3_;
    let _e421 = u_xlat3_;
    let _e423 = exp2(_e421.xyz);
    u_xlat3_.x = _e423.x;
    u_xlat3_.y = _e423.y;
    u_xlat3_.z = _e423.z;
    let _e430 = u_xlat3_;
    let _e432 = u_xlat3_;
    let _e446 = ((_e432.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat3_.x = _e446.x;
    u_xlat3_.y = _e446.y;
    u_xlat3_.z = _e446.z;
    {
        let _e453 = u_xlat3_;
        hlslcc_movcTemp = _e453;
        let _e456 = u_xlatb4_;
        if _e456.x {
            let _e458 = u_xlat5_;
            local_5 = _e458.x;
        } else {
            let _e460 = u_xlat3_;
            local_5 = _e460.x;
        }
        let _e463 = local_5;
        hlslcc_movcTemp.x = _e463;
        let _e465 = u_xlatb4_;
        if _e465.y {
            let _e467 = u_xlat5_;
            local_6 = _e467.y;
        } else {
            let _e469 = u_xlat3_;
            local_6 = _e469.y;
        }
        let _e472 = local_6;
        hlslcc_movcTemp.y = _e472;
        let _e474 = u_xlatb4_;
        if _e474.z {
            let _e476 = u_xlat5_;
            local_7 = _e476.z;
        } else {
            let _e478 = u_xlat3_;
            local_7 = _e478.z;
        }
        let _e481 = local_7;
        hlslcc_movcTemp.z = _e481;
        let _e482 = hlslcc_movcTemp;
        u_xlat3_ = _e482;
    }
    let _e483 = vs_TEXCOORD6_1;
    let _e484 = _e483.xy;
    let _e485 = vs_TEXCOORD6_1;
    txVec0_ = vec3<f32>(_e484.x, _e484.y, _e485.z);
    let _e491 = txVec0_;
    let _e495 = textureSampleCompareLevel(f_t1_, samplerf_s1_, _e491.xy, _e491.z);
    u_xlat8_ = _e495;
    let _e499 = _f_buffer4_.f_cb4_[27];
    u_xlat24_ = (-(_e499.x) + 1f);
    let _e504 = u_xlat8_;
    let _e508 = _f_buffer4_.f_cb4_[27];
    let _e511 = u_xlat24_;
    u_xlat8_ = ((_e504 * _e508.x) + _e511);
    let _e514 = vs_TEXCOORD6_1;
    u_xlatb24_ = (0f >= _e514.z);
    let _e517 = vs_TEXCOORD6_1;
    u_xlatb1_ = (_e517.z >= 1f);
    let _e521 = u_xlatb24_;
    let _e522 = u_xlatb1_;
    u_xlatb24_ = (_e521 || _e522);
    let _e524 = u_xlatb24_;
    if _e524 {
        local_8 = 1f;
    } else {
        let _e526 = u_xlat8_;
        local_8 = _e526;
    }
    let _e528 = local_8;
    u_xlat8_ = _e528;
    let _e529 = u_xlat4_;
    let _e531 = vs_TEXCOORD1_1;
    let _e536 = _f_buffer0_.f_cb0_[21];
    let _e539 = (_e531.xyz + -(_e536.xyz));
    u_xlat4_.x = _e539.x;
    u_xlat4_.y = _e539.y;
    u_xlat4_.z = _e539.z;
    let _e546 = u_xlat4_;
    let _e548 = u_xlat4_;
    u_xlat24_ = dot(_e546.xyz, _e548.xyz);
    let _e551 = u_xlat24_;
    let _e555 = _f_buffer4_.f_cb4_[27];
    let _e561 = _f_buffer4_.f_cb4_[27];
    u_xlat24_ = ((_e551 * _e555.z) + _e561.w);
    let _e564 = u_xlat24_;
    u_xlat24_ = clamp(_e564, 0f, 1f);
    let _e569 = u_xlat8_;
    u_xlat1_.x = (-(_e569) + 1f);
    let _e573 = u_xlat24_;
    let _e574 = u_xlat1_;
    let _e577 = u_xlat8_;
    u_xlat8_ = ((_e573 * _e574.x) + _e577);
    let _e579 = u_xlat8_;
    let _e583 = _f_buffer2_.f_cb2_[11];
    u_xlat8_ = (_e579 * _e583.z);
    let _e586 = u_xlat4_;
    let _e588 = u_xlat8_;
    let _e593 = _f_buffer0_.f_cb0_[6];
    let _e595 = (vec3(_e588) * _e593.xyz);
    u_xlat4_.x = _e595.x;
    u_xlat4_.y = _e595.y;
    u_xlat4_.z = _e595.z;
    let _e602 = u_xlat2_;
    let _e607 = _f_buffer0_.f_cb0_[5];
    u_xlat8_ = dot(_e602.xyz, _e607.xyz);
    let _e610 = u_xlat8_;
    u_xlat8_ = clamp(_e610, 0f, 1f);
    let _e614 = u_xlat4_;
    let _e616 = u_xlat8_;
    let _e618 = u_xlat4_;
    let _e620 = (vec3(_e616) * _e618.xyz);
    u_xlat4_.x = _e620.x;
    u_xlat4_.y = _e620.y;
    u_xlat4_.z = _e620.z;
    let _e627 = u_xlat4_;
    let _e629 = u_xlat1_;
    let _e631 = u_xlat4_;
    let _e633 = (_e629.yzw * _e631.xyz);
    u_xlat4_.x = _e633.x;
    u_xlat4_.y = _e633.y;
    u_xlat4_.z = _e633.z;
    let _e643 = _f_buffer0_.f_cb0_[10];
    let _e648 = _f_buffer2_.f_cb2_[11];
    u_xlat8_ = min(_e643.x, _e648.y);
    let _e651 = u_xlat8_;
    u_xlatu8_ = u32(i32(_e651));
    u_xlat5_.x = 0f;
    u_xlat5_.y = 0f;
    u_xlat5_.z = 0f;
    loop {
        let _e665 = u_xlatu_loop_1_;
        let _e666 = u_xlatu8_;
        if !((_e665 < _e666)) {
            break;
        }
        {
            let _e672 = u_xlatu_loop_1_;
            u_xlatu1_ = (_e672 >> 2u);
            let _e675 = u_xlatu_loop_1_;
            u_xlati26_ = i32((_e675 & 3u));
            let _e680 = u_xlatu1_;
            let _e686 = _f_buffer2_.f_cb2_[(i32(_e680) + 12i)];
            let _e687 = u_xlati26_;
            let _e691 = local_9[_e687];
            u_xlat1_.x = dot(_e686, bitcast<vec4<f32>>(_e691));
            let _e694 = u_xlat1_;
            u_xlati1_ = i32(_e694.x);
            let _e697 = u_xlat6_;
            let _e699 = vs_TEXCOORD1_1;
            let _e702 = u_xlati1_;
            let _e705 = _f_buffer1_.f_cb1_[_e702];
            let _e708 = u_xlati1_;
            let _e711 = _f_buffer1_.f_cb1_[_e708];
            let _e713 = ((-(_e699.xyz) * _e705.www) + _e711.xyz);
            u_xlat6_.x = _e713.x;
            u_xlat6_.y = _e713.y;
            u_xlat6_.z = _e713.z;
            let _e720 = u_xlat6_;
            let _e722 = u_xlat6_;
            u_xlat26_ = dot(_e720.xyz, _e722.xyz);
            let _e725 = u_xlat26_;
            u_xlat26_ = max(_e725, 0.000061035156f);
            let _e728 = u_xlat26_;
            u_xlat27_ = inverseSqrt(_e728);
            let _e730 = u_xlat6_;
            let _e732 = u_xlat27_;
            let _e734 = u_xlat6_;
            let _e736 = (vec3(_e732) * _e734.xyz);
            u_xlat6_.x = _e736.x;
            u_xlat6_.y = _e736.y;
            u_xlat6_.z = _e736.z;
            let _e745 = u_xlat26_;
            u_xlat27_ = (1f / _e745);
            let _e747 = u_xlat26_;
            let _e748 = u_xlati1_;
            let _e753 = _f_buffer1_.f_cb1_[(_e748 + 512i)];
            u_xlat26_ = (_e747 * _e753.x);
            let _e756 = u_xlat26_;
            let _e758 = u_xlat26_;
            u_xlat26_ = ((-(_e756) * _e758) + 1f);
            let _e762 = u_xlat26_;
            u_xlat26_ = max(_e762, 0f);
            let _e765 = u_xlat26_;
            let _e766 = u_xlat26_;
            u_xlat26_ = (_e765 * _e766);
            let _e768 = u_xlat26_;
            let _e769 = u_xlat27_;
            u_xlat26_ = (_e768 * _e769);
            let _e771 = u_xlati1_;
            let _e776 = _f_buffer1_.f_cb1_[(_e771 + 768i)];
            let _e778 = u_xlat6_;
            u_xlat27_ = dot(_e776.xyz, _e778.xyz);
            let _e781 = u_xlat27_;
            let _e782 = u_xlati1_;
            let _e787 = _f_buffer1_.f_cb1_[(_e782 + 512i)];
            let _e790 = u_xlati1_;
            let _e795 = _f_buffer1_.f_cb1_[(_e790 + 512i)];
            u_xlat27_ = ((_e781 * _e787.z) + _e795.w);
            let _e798 = u_xlat27_;
            u_xlat27_ = clamp(_e798, 0f, 1f);
            let _e802 = u_xlat27_;
            let _e803 = u_xlat27_;
            u_xlat27_ = (_e802 * _e803);
            let _e805 = u_xlat26_;
            let _e806 = u_xlat27_;
            u_xlat26_ = (_e805 * _e806);
            let _e808 = u_xlat7_;
            let _e810 = u_xlat26_;
            let _e812 = u_xlati1_;
            let _e817 = _f_buffer1_.f_cb1_[(_e812 + 256i)];
            let _e819 = (vec3(_e810) * _e817.xyz);
            u_xlat7_.x = _e819.x;
            u_xlat7_.y = _e819.y;
            u_xlat7_.z = _e819.z;
            let _e827 = u_xlat2_;
            let _e829 = u_xlat6_;
            u_xlat1_.x = dot(_e827.xyz, _e829.xyz);
            let _e833 = u_xlat1_;
            u_xlat1_.x = clamp(_e833.x, 0f, 1f);
            let _e838 = u_xlat6_;
            let _e840 = u_xlat1_;
            let _e842 = u_xlat7_;
            let _e844 = (_e840.xxx * _e842.xyz);
            u_xlat6_.x = _e844.x;
            u_xlat6_.y = _e844.y;
            u_xlat6_.z = _e844.z;
            let _e851 = u_xlat5_;
            let _e853 = u_xlat6_;
            let _e855 = u_xlat1_;
            let _e858 = u_xlat5_;
            let _e860 = ((_e853.xyz * _e855.yzw) + _e858.xyz);
            u_xlat5_.x = _e860.x;
            u_xlat5_.y = _e860.y;
            u_xlat5_.z = _e860.z;
        }
        continuing {
            let _e669 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e669 + 1u);
        }
    }
    let _e867 = u_xlat1_;
    let _e869 = u_xlat3_;
    let _e871 = u_xlat1_;
    let _e874 = u_xlat4_;
    let _e876 = ((_e869.xyz * _e871.yzw) + _e874.xyz);
    u_xlat1_.x = _e876.x;
    u_xlat1_.y = _e876.y;
    u_xlat1_.z = _e876.z;
    let _e883 = SV_Target0_;
    let _e885 = u_xlat5_;
    let _e887 = u_xlat1_;
    let _e889 = (_e885.xyz + _e887.xyz);
    SV_Target0_.x = _e889.x;
    SV_Target0_.y = _e889.y;
    SV_Target0_.z = _e889.z;
    let _e899 = _f_buffer3_.f_cb3_[5];
    u_xlatb8_ = (_e899.y == 1f);
    let _e903 = u_xlatb8_;
    let _e904 = u_xlatb0_;
    u_xlatb0_ = (_e903 || _e904);
    let _e907 = u_xlatb0_;
    if _e907 {
        let _e908 = u_xlat16_;
        local_10 = _e908;
    } else {
        local_10 = 1f;
    }
    let _e911 = local_10;
    SV_Target0_.w = _e911;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec3<f32>, @location(2) vs_TEXCOORD2_: vec3<f32>, @location(6) vs_TEXCOORD6_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_TEXCOORD2_1 = vs_TEXCOORD2_;
    vs_TEXCOORD6_1 = vs_TEXCOORD6_;
    main_1();
    let _e47 = SV_Target0_;
    return FragmentOutput(_e47);
}
