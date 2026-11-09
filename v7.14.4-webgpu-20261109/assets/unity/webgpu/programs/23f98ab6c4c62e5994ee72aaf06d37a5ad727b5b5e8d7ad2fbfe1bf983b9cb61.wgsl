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
    f_cb4_: array<vec4<f32>, 12>,
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
@group(3) @binding(7) 
var samplerf_s3_: sampler;
@group(3) @binding(9) 
var samplerf_s4_: sampler;
@group(3) @binding(0) 
var f_t0_: texture_depth_2d;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
@group(3) @binding(4) 
var f_t2_: texture_2d<f32>;
@group(3) @binding(6) 
var f_t3_: texture_2d<f32>;
@group(3) @binding(8) 
var f_t4_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec4<f32>;
var<private> vs_TEXCOORD4_1: vec3<f32>;
var<private> vs_NORMAL0_1: vec3<f32>;
var<private> vs_TEXCOORD1_1: vec3<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec4<f32> = vec4(0f);
    var u_xlatb3_: vec2<bool> = vec2(false);
    var u_xlat4_: vec4<f32> = vec4(0f);
    var u_xlatb4_: vec4<bool> = vec4(false);
    var u_xlat5_: vec4<f32> = vec4(0f);
    var u_xlat6_: vec3<f32> = vec3(0f);
    var u_xlat7_: vec3<f32> = vec3(0f);
    var u_xlat8_: vec3<f32> = vec3(0f);
    var u_xlat12_: f32 = 0f;
    var u_xlat27_: f32 = 0f;
    var u_xlati27_: i32 = 0i;
    var u_xlatu27_: u32 = 0u;
    var u_xlat30_: f32 = 0f;
    var u_xlatu30_: u32 = 0u;
    var u_xlatb30_: bool = false;
    var u_xlatu31_: u32 = 0u;
    var u_xlat32_: f32 = 0f;
    var u_xlati32_: i32 = 0i;
    var u_xlatu32_: u32 = 0u;
    var u_xlatb32_: bool = false;
    var u_xlat33_: f32 = 0f;
    var u_xlati33_: i32 = 0i;
    var u_xlat34_: f32 = 0f;
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
    var local_9: vec3<f32>;
    var local_10: vec3<f32>;

    let _e123 = vs_TEXCOORD0_1;
    let _e128 = _f_buffer0_.f_cb0_[4];
    let _e133 = hscard_bias.values[1];
    let _e136 = textureSampleBias(f_t1_, samplerf_s1_, _e123.xy, (_e128.x + _e133.x));
    u_xlat0_ = _e136;
    let _e137 = vs_TEXCOORD0_1;
    let _e142 = _f_buffer0_.f_cb0_[4];
    let _e147 = hscard_bias.values[2];
    let _e150 = textureSampleBias(f_t2_, samplerf_s2_, _e137.xy, (_e142.x + _e147.x));
    u_xlat1_ = _e150;
    let _e151 = vs_TEXCOORD0_1;
    let _e156 = _f_buffer0_.f_cb0_[4];
    let _e161 = hscard_bias.values[3];
    let _e164 = textureSampleBias(f_t3_, samplerf_s3_, _e151.zw, (_e156.x + _e161.x));
    u_xlat2_ = _e164;
    let _e165 = vs_TEXCOORD4_1;
    let _e170 = _f_buffer0_.f_cb0_[4];
    let _e175 = hscard_bias.values[4];
    let _e178 = textureSampleBias(f_t4_, samplerf_s4_, _e165.xy, (_e170.x + _e175.x));
    u_xlat3_ = _e178;
    let _e179 = u_xlat4_;
    let _e181 = vs_TEXCOORD1_1;
    let _e186 = _f_buffer3_.f_cb3_[20];
    let _e189 = (_e181.xyz + -(_e186.xyz));
    u_xlat4_.x = _e189.x;
    u_xlat4_.y = _e189.y;
    u_xlat4_.z = _e189.z;
    let _e196 = u_xlat5_;
    let _e198 = vs_TEXCOORD1_1;
    let _e203 = _f_buffer3_.f_cb3_[21];
    let _e206 = (_e198.xyz + -(_e203.xyz));
    u_xlat5_.x = _e206.x;
    u_xlat5_.y = _e206.y;
    u_xlat5_.z = _e206.z;
    let _e213 = u_xlat6_;
    let _e215 = vs_TEXCOORD1_1;
    let _e220 = _f_buffer3_.f_cb3_[22];
    let _e223 = (_e215.xyz + -(_e220.xyz));
    u_xlat6_.x = _e223.x;
    u_xlat6_.y = _e223.y;
    u_xlat6_.z = _e223.z;
    let _e230 = u_xlat7_;
    let _e232 = vs_TEXCOORD1_1;
    let _e237 = _f_buffer3_.f_cb3_[23];
    let _e240 = (_e232.xyz + -(_e237.xyz));
    u_xlat7_.x = _e240.x;
    u_xlat7_.y = _e240.y;
    u_xlat7_.z = _e240.z;
    let _e248 = u_xlat4_;
    let _e250 = u_xlat4_;
    u_xlat4_.x = dot(_e248.xyz, _e250.xyz);
    let _e254 = u_xlat5_;
    let _e256 = u_xlat5_;
    u_xlat4_.y = dot(_e254.xyz, _e256.xyz);
    let _e260 = u_xlat6_;
    let _e262 = u_xlat6_;
    u_xlat4_.z = dot(_e260.xyz, _e262.xyz);
    let _e266 = u_xlat7_;
    let _e268 = u_xlat7_;
    u_xlat4_.w = dot(_e266.xyz, _e268.xyz);
    let _e271 = u_xlat4_;
    let _e275 = _f_buffer3_.f_cb3_[24];
    u_xlatb4_ = (_e271 < _e275);
    let _e278 = u_xlatb4_;
    if _e278.x {
        local = 1f;
    } else {
        local = 0f;
    }
    let _e284 = local;
    u_xlat5_.x = _e284;
    let _e286 = u_xlatb4_;
    if _e286.y {
        local_1 = 1f;
    } else {
        local_1 = 0f;
    }
    let _e292 = local_1;
    u_xlat5_.y = _e292;
    let _e294 = u_xlatb4_;
    if _e294.z {
        local_2 = 1f;
    } else {
        local_2 = 0f;
    }
    let _e300 = local_2;
    u_xlat5_.z = _e300;
    let _e302 = u_xlatb4_;
    if _e302.w {
        local_3 = 1f;
    } else {
        local_3 = 0f;
    }
    let _e308 = local_3;
    u_xlat5_.w = _e308;
    let _e310 = u_xlatb4_;
    if _e310.x {
        local_4 = -1f;
    } else {
        local_4 = -0f;
    }
    let _e319 = local_4;
    u_xlat4_.x = _e319;
    let _e321 = u_xlatb4_;
    if _e321.y {
        local_5 = -1f;
    } else {
        local_5 = -0f;
    }
    let _e330 = local_5;
    u_xlat4_.y = _e330;
    let _e332 = u_xlatb4_;
    if _e332.z {
        local_6 = -1f;
    } else {
        local_6 = -0f;
    }
    let _e341 = local_6;
    u_xlat4_.z = _e341;
    let _e342 = u_xlat4_;
    let _e344 = u_xlat4_;
    let _e346 = u_xlat5_;
    let _e348 = (_e344.xyz + _e346.yzw);
    u_xlat4_.x = _e348.x;
    u_xlat4_.y = _e348.y;
    u_xlat4_.z = _e348.z;
    let _e355 = u_xlat5_;
    let _e357 = u_xlat4_;
    let _e363 = max(_e357.xyz, vec3<f32>(0f, 0f, 0f));
    u_xlat5_.y = _e363.x;
    u_xlat5_.z = _e363.y;
    u_xlat5_.w = _e363.z;
    let _e370 = u_xlat5_;
    u_xlat27_ = dot(_e370, vec4<f32>(4f, 3f, 2f, 1f));
    let _e377 = u_xlat27_;
    u_xlat27_ = (-(_e377) + 4f);
    let _e381 = u_xlat27_;
    u_xlatu27_ = u32(_e381);
    let _e383 = u_xlatu27_;
    u_xlati27_ = (i32(_e383) << 2u);
    let _e388 = u_xlat4_;
    let _e390 = vs_TEXCOORD1_1;
    let _e392 = u_xlati27_;
    let _e397 = _f_buffer3_.f_cb3_[(_e392 + 1i)];
    let _e399 = (_e390.yyy * _e397.xyz);
    u_xlat4_.x = _e399.x;
    u_xlat4_.y = _e399.y;
    u_xlat4_.z = _e399.z;
    let _e406 = u_xlat4_;
    let _e408 = u_xlati27_;
    let _e411 = _f_buffer3_.f_cb3_[_e408];
    let _e413 = vs_TEXCOORD1_1;
    let _e416 = u_xlat4_;
    let _e418 = ((_e411.xyz * _e413.xxx) + _e416.xyz);
    u_xlat4_.x = _e418.x;
    u_xlat4_.y = _e418.y;
    u_xlat4_.z = _e418.z;
    let _e425 = u_xlat4_;
    let _e427 = u_xlati27_;
    let _e432 = _f_buffer3_.f_cb3_[(_e427 + 2i)];
    let _e434 = vs_TEXCOORD1_1;
    let _e437 = u_xlat4_;
    let _e439 = ((_e432.xyz * _e434.zzz) + _e437.xyz);
    u_xlat4_.x = _e439.x;
    u_xlat4_.y = _e439.y;
    u_xlat4_.z = _e439.z;
    let _e446 = u_xlat4_;
    let _e448 = u_xlat4_;
    let _e450 = u_xlati27_;
    let _e455 = _f_buffer3_.f_cb3_[(_e450 + 3i)];
    let _e457 = (_e448.xyz + _e455.xyz);
    u_xlat4_.x = _e457.x;
    u_xlat4_.y = _e457.y;
    u_xlat4_.z = _e457.z;
    let _e464 = vs_NORMAL0_1;
    let _e466 = vs_NORMAL0_1;
    u_xlat27_ = dot(_e464.xyz, _e466.xyz);
    let _e469 = u_xlat27_;
    u_xlat27_ = inverseSqrt(_e469);
    let _e471 = u_xlat5_;
    let _e473 = u_xlat27_;
    let _e475 = vs_NORMAL0_1;
    let _e477 = (vec3(_e473) * _e475.xyz);
    u_xlat5_.x = _e477.x;
    u_xlat5_.y = _e477.y;
    u_xlat5_.z = _e477.z;
    let _e484 = u_xlat4_;
    let _e485 = _e484.xy;
    let _e486 = u_xlat4_;
    txVec0_ = vec3<f32>(_e485.x, _e485.y, _e486.z);
    let _e492 = txVec0_;
    let _e496 = textureSampleCompareLevel(f_t0_, samplerf_s0_, _e492.xy, _e492.z);
    u_xlat27_ = _e496;
    let _e500 = _f_buffer3_.f_cb3_[27];
    u_xlat30_ = (-(_e500.x) + 1f);
    let _e505 = u_xlat27_;
    let _e509 = _f_buffer3_.f_cb3_[27];
    let _e512 = u_xlat30_;
    u_xlat27_ = ((_e505 * _e509.x) + _e512);
    let _e515 = u_xlat4_;
    u_xlatb30_ = (0f >= _e515.z);
    let _e519 = u_xlat4_;
    u_xlatb4_.x = (_e519.z >= 1f);
    let _e523 = u_xlatb30_;
    let _e524 = u_xlatb4_;
    u_xlatb30_ = (_e523 || _e524.x);
    let _e527 = u_xlatb30_;
    if _e527 {
        local_7 = 1f;
    } else {
        let _e529 = u_xlat27_;
        local_7 = _e529;
    }
    let _e531 = local_7;
    u_xlat27_ = _e531;
    let _e532 = u_xlat27_;
    let _e536 = _f_buffer2_.f_cb2_[11];
    u_xlat27_ = (_e532 * _e536.z);
    let _e539 = u_xlat4_;
    let _e541 = u_xlat27_;
    let _e546 = _f_buffer0_.f_cb0_[6];
    let _e548 = (vec3(_e541) * _e546.xyz);
    u_xlat4_.x = _e548.x;
    u_xlat4_.y = _e548.y;
    u_xlat4_.z = _e548.z;
    let _e555 = u_xlat5_;
    let _e560 = _f_buffer0_.f_cb0_[5];
    u_xlat27_ = dot(_e555.xyz, _e560.xyz);
    let _e563 = u_xlat27_;
    u_xlat27_ = clamp(_e563, 0f, 1f);
    let _e570 = _f_buffer0_.f_cb0_[10];
    let _e575 = _f_buffer2_.f_cb2_[11];
    u_xlat30_ = min(_e570.x, _e575.y);
    let _e578 = u_xlat30_;
    u_xlatu30_ = u32(i32(_e578));
    u_xlat6_.x = 0f;
    u_xlat6_.y = 0f;
    u_xlat6_.z = 0f;
    loop {
        let _e592 = u_xlatu_loop_1_;
        let _e593 = u_xlatu30_;
        if !((_e592 < _e593)) {
            break;
        }
        {
            let _e599 = u_xlatu_loop_1_;
            u_xlatu32_ = (_e599 >> 2u);
            let _e602 = u_xlatu_loop_1_;
            u_xlati33_ = i32((_e602 & 3u));
            let _e606 = u_xlatu32_;
            let _e612 = _f_buffer2_.f_cb2_[(i32(_e606) + 12i)];
            let _e613 = u_xlati33_;
            let _e617 = local_8[_e613];
            u_xlat32_ = dot(_e612, bitcast<vec4<f32>>(_e617));
            let _e620 = u_xlat32_;
            u_xlati32_ = i32(_e620);
            let _e622 = u_xlat7_;
            let _e624 = vs_TEXCOORD1_1;
            let _e627 = u_xlati32_;
            let _e630 = _f_buffer1_.f_cb1_[_e627];
            let _e633 = u_xlati32_;
            let _e636 = _f_buffer1_.f_cb1_[_e633];
            let _e638 = ((-(_e624.xyz) * _e630.www) + _e636.xyz);
            u_xlat7_.x = _e638.x;
            u_xlat7_.y = _e638.y;
            u_xlat7_.z = _e638.z;
            let _e645 = u_xlat7_;
            let _e647 = u_xlat7_;
            u_xlat33_ = dot(_e645.xyz, _e647.xyz);
            let _e650 = u_xlat33_;
            u_xlat33_ = max(_e650, 0.000061035156f);
            let _e653 = u_xlat33_;
            u_xlat34_ = inverseSqrt(_e653);
            let _e655 = u_xlat7_;
            let _e657 = u_xlat34_;
            let _e659 = u_xlat7_;
            let _e661 = (vec3(_e657) * _e659.xyz);
            u_xlat7_.x = _e661.x;
            u_xlat7_.y = _e661.y;
            u_xlat7_.z = _e661.z;
            let _e670 = u_xlati32_;
            let _e675 = _f_buffer1_.f_cb1_[(_e670 + 512i)];
            u_xlat34_ = (1f / _e675.x);
            let _e678 = u_xlat33_;
            u_xlat33_ = (_e678 * 25f);
            let _e681 = u_xlat33_;
            let _e682 = u_xlat34_;
            u_xlat33_ = (_e681 / _e682);
            let _e684 = u_xlat33_;
            u_xlat33_ = (_e684 + 1f);
            let _e689 = u_xlat33_;
            u_xlat33_ = (1f / _e689);
            let _e691 = u_xlati32_;
            let _e696 = _f_buffer1_.f_cb1_[(_e691 + 768i)];
            let _e698 = u_xlat7_;
            u_xlat34_ = dot(_e696.xyz, _e698.xyz);
            let _e701 = u_xlat34_;
            let _e702 = u_xlati32_;
            let _e707 = _f_buffer1_.f_cb1_[(_e702 + 512i)];
            let _e710 = u_xlati32_;
            let _e715 = _f_buffer1_.f_cb1_[(_e710 + 512i)];
            u_xlat34_ = ((_e701 * _e707.z) + _e715.w);
            let _e718 = u_xlat34_;
            u_xlat34_ = clamp(_e718, 0f, 1f);
            let _e722 = u_xlat34_;
            let _e723 = u_xlat34_;
            u_xlat34_ = (_e722 * _e723);
            let _e725 = u_xlat33_;
            let _e726 = u_xlat34_;
            u_xlat33_ = (_e725 * _e726);
            let _e728 = u_xlat8_;
            let _e730 = u_xlat33_;
            let _e732 = u_xlati32_;
            let _e737 = _f_buffer1_.f_cb1_[(_e732 + 256i)];
            let _e739 = (vec3(_e730) * _e737.xyz);
            u_xlat8_.x = _e739.x;
            u_xlat8_.y = _e739.y;
            u_xlat8_.z = _e739.z;
            let _e746 = u_xlat5_;
            let _e748 = u_xlat7_;
            u_xlat32_ = dot(_e746.xyz, _e748.xyz);
            let _e751 = u_xlat32_;
            u_xlat32_ = clamp(_e751, 0f, 1f);
            let _e755 = u_xlat6_;
            let _e757 = u_xlat8_;
            let _e759 = u_xlat32_;
            let _e762 = u_xlat6_;
            let _e764 = ((_e757.xyz * vec3(_e759)) + _e762.xyz);
            u_xlat6_.x = _e764.x;
            u_xlat6_.y = _e764.y;
            u_xlat6_.z = _e764.z;
        }
        continuing {
            let _e596 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e596 + 1u);
        }
    }
    let _e771 = u_xlat4_;
    let _e773 = u_xlat4_;
    let _e775 = u_xlat27_;
    let _e778 = u_xlat6_;
    let _e780 = ((_e773.xyz * vec3(_e775)) + _e778.xyz);
    u_xlat4_.x = _e780.x;
    u_xlat4_.y = _e780.y;
    u_xlat4_.z = _e780.z;
    let _e791 = _f_buffer2_.f_cb2_[27];
    u_xlat5_.x = abs(_e791.w);
    let _e798 = _f_buffer2_.f_cb2_[28];
    u_xlat5_.y = abs(_e798.w);
    let _e805 = _f_buffer2_.f_cb2_[29];
    u_xlat5_.z = abs(_e805.w);
    let _e808 = u_xlat5_;
    let _e810 = u_xlat5_;
    let _e812 = log2(_e810.xyz);
    u_xlat5_.x = _e812.x;
    u_xlat5_.y = _e812.y;
    u_xlat5_.z = _e812.z;
    let _e819 = u_xlat5_;
    let _e821 = u_xlat5_;
    let _e827 = (_e821.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat5_.x = _e827.x;
    u_xlat5_.y = _e827.y;
    u_xlat5_.z = _e827.z;
    let _e834 = u_xlat5_;
    let _e836 = u_xlat5_;
    let _e838 = exp2(_e836.xyz);
    u_xlat5_.x = _e838.x;
    u_xlat5_.y = _e838.y;
    u_xlat5_.z = _e838.z;
    let _e845 = u_xlat5_;
    let _e847 = u_xlat5_;
    let _e861 = ((_e847.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat5_.x = _e861.x;
    u_xlat5_.y = _e861.y;
    u_xlat5_.z = _e861.z;
    let _e868 = u_xlat5_;
    let _e870 = u_xlat5_;
    let _e876 = clamp(_e870.xyz, vec3(0f), vec3(1f));
    u_xlat5_.x = _e876.x;
    u_xlat5_.y = _e876.y;
    u_xlat5_.z = _e876.z;
    let _e883 = u_xlat4_;
    let _e885 = u_xlat4_;
    let _e887 = u_xlat5_;
    let _e889 = (_e885.xyz + _e887.xyz);
    u_xlat4_.x = _e889.x;
    u_xlat4_.y = _e889.y;
    u_xlat4_.z = _e889.z;
    let _e896 = u_xlat0_;
    let _e898 = u_xlat0_;
    let _e900 = u_xlat4_;
    let _e902 = (_e898.xyz * _e900.xyz);
    u_xlat0_.x = _e902.x;
    u_xlat0_.y = _e902.y;
    u_xlat0_.z = _e902.z;
    let _e909 = u_xlat3_;
    let _e911 = u_xlat3_;
    let _e916 = _f_buffer4_.f_cb4_[5];
    let _e918 = (_e911.zxy * _e916.zxy);
    u_xlat3_.x = _e918.x;
    u_xlat3_.y = _e918.y;
    u_xlat3_.z = _e918.z;
    let _e925 = u_xlat1_;
    let _e929 = _f_buffer4_.f_cb4_[3];
    u_xlat27_ = dot(_e925, _e929);
    let _e931 = u_xlat27_;
    u_xlat27_ = min(_e931, 1f);
    let _e934 = u_xlat27_;
    let _e935 = u_xlat3_;
    u_xlat27_ = (_e934 * _e935.z);
    let _e938 = u_xlat4_;
    let _e940 = u_xlat27_;
    let _e945 = _f_buffer4_.f_cb4_[2];
    let _e947 = (vec3(_e940) * _e945.xyz);
    u_xlat4_.x = _e947.x;
    u_xlat4_.y = _e947.y;
    u_xlat4_.z = _e947.z;
    let _e954 = u_xlat0_;
    let _e956 = u_xlat0_;
    let _e958 = u_xlat3_;
    let _e961 = u_xlat4_;
    let _e963 = ((_e956.xyz * _e958.yyy) + _e961.xyz);
    u_xlat0_.x = _e963.x;
    u_xlat0_.y = _e963.y;
    u_xlat0_.z = _e963.z;
    let _e970 = u_xlat0_;
    let _e972 = u_xlat3_;
    let _e977 = _f_buffer4_.f_cb4_[4];
    let _e980 = u_xlat0_;
    let _e982 = ((_e972.xxx * _e977.xyz) + _e980.xyz);
    u_xlat0_.x = _e982.x;
    u_xlat0_.y = _e982.y;
    u_xlat0_.z = _e982.z;
    let _e989 = u_xlat1_;
    let _e993 = _f_buffer4_.f_cb4_[7];
    u_xlat27_ = dot(_e989, _e993);
    let _e995 = u_xlat27_;
    u_xlat27_ = min(_e995, 1f);
    let _e1001 = _f_buffer4_.f_cb4_[8];
    let _e1007 = _f_buffer4_.f_cb4_[8];
    u_xlat12_ = (-(_e1001.x) + _e1007.y);
    let _e1010 = u_xlat27_;
    let _e1011 = u_xlat12_;
    let _e1016 = _f_buffer4_.f_cb4_[8];
    u_xlat27_ = ((_e1010 * _e1011) + _e1016.x);
    let _e1020 = u_xlat3_;
    u_xlat3_.x = _e1020.x;
    let _e1023 = u_xlat3_;
    u_xlat3_.x = clamp(_e1023.x, 0f, 1f);
    let _e1028 = u_xlat27_;
    let _e1033 = _f_buffer4_.f_cb4_[8];
    u_xlat12_ = (-(_e1028) + _e1033.y);
    let _e1037 = u_xlat12_;
    let _e1038 = u_xlat3_;
    u_xlat3_.x = (_e1037 * _e1038.x);
    let _e1045 = _f_buffer4_.f_cb4_[6];
    let _e1047 = u_xlat3_;
    let _e1050 = u_xlat27_;
    SV_Target0_.w = ((_e1045.x * _e1047.x) + _e1050);
    let _e1052 = u_xlat1_;
    let _e1056 = _f_buffer4_.f_cb4_[10];
    u_xlat27_ = dot(_e1052, _e1056);
    let _e1058 = u_xlat27_;
    u_xlat27_ = min(_e1058, 1f);
    let _e1061 = u_xlat2_;
    let _e1066 = _f_buffer4_.f_cb4_[9];
    u_xlat1_ = (_e1061.wxyz * _e1066.wxyz);
    let _e1069 = u_xlatb3_;
    let _e1079 = _f_buffer4_.f_cb4_[11];
    let _e1082 = (vec4<f32>(0f, 0f, 0f, 0f) < _e1079.wzww).xy;
    u_xlatb3_.x = _e1082.x;
    u_xlatb3_.y = _e1082.y;
    let _e1088 = u_xlat1_;
    let _e1093 = _f_buffer4_.f_cb4_[11];
    u_xlat1_.x = (_e1088.x * _e1093.w);
    let _e1097 = u_xlat1_;
    u_xlat1_.x = _e1097.x;
    let _e1100 = u_xlat1_;
    u_xlat1_.x = clamp(_e1100.x, 0f, 1f);
    let _e1105 = u_xlat4_;
    let _e1107 = u_xlat2_;
    let _e1112 = _f_buffer4_.f_cb4_[9];
    let _e1115 = u_xlat0_;
    let _e1118 = ((_e1107.xyz * _e1112.xyz) + -(_e1115.xyz));
    u_xlat4_.x = _e1118.x;
    u_xlat4_.y = _e1118.y;
    u_xlat4_.z = _e1118.z;
    let _e1125 = u_xlat4_;
    let _e1127 = u_xlat1_;
    let _e1129 = u_xlat4_;
    let _e1132 = u_xlat0_;
    let _e1134 = ((_e1127.xxx * _e1129.xyz) + _e1132.xyz);
    u_xlat4_.x = _e1134.x;
    u_xlat4_.y = _e1134.y;
    u_xlat4_.z = _e1134.z;
    let _e1141 = u_xlat3_;
    let _e1143 = u_xlatb3_;
    if _e1143.x {
        let _e1145 = u_xlat4_;
        local_9 = _e1145.xyz;
    } else {
        let _e1147 = u_xlat0_;
        local_9 = _e1147.xyz;
    }
    let _e1150 = local_9;
    u_xlat3_.x = _e1150.x;
    u_xlat3_.z = _e1150.y;
    u_xlat3_.w = _e1150.z;
    let _e1157 = u_xlat4_;
    let _e1159 = u_xlat1_;
    let _e1161 = u_xlat3_;
    let _e1163 = (_e1159.yzw * _e1161.xzw);
    u_xlat4_.x = _e1163.x;
    u_xlat4_.y = _e1163.y;
    u_xlat4_.z = _e1163.z;
    let _e1170 = u_xlat3_;
    let _e1172 = u_xlat4_;
    let _e1177 = _f_buffer4_.f_cb4_[11];
    let _e1180 = u_xlat3_;
    let _e1182 = ((_e1172.xyz * _e1177.yyy) + _e1180.xzw);
    u_xlat3_.x = _e1182.x;
    u_xlat3_.z = _e1182.y;
    u_xlat3_.w = _e1182.z;
    let _e1189 = u_xlat3_;
    let _e1194 = _f_buffer4_.f_cb4_[11];
    let _e1196 = u_xlat1_;
    let _e1199 = u_xlat3_;
    let _e1201 = ((_e1194.xxx * _e1196.yzw) + _e1199.xzw);
    u_xlat3_.x = _e1201.x;
    u_xlat3_.z = _e1201.y;
    u_xlat3_.w = _e1201.z;
    let _e1208 = u_xlat4_;
    let _e1210 = u_xlat3_;
    let _e1212 = u_xlat3_;
    let _e1214 = (_e1210.xzw + _e1212.xzw);
    u_xlat4_.x = _e1214.x;
    u_xlat4_.y = _e1214.y;
    u_xlat4_.z = _e1214.z;
    let _e1221 = u_xlat5_;
    let _e1223 = u_xlat1_;
    let _e1225 = u_xlat4_;
    let _e1227 = (_e1223.yzw * _e1225.xyz);
    u_xlat5_.x = _e1227.x;
    u_xlat5_.y = _e1227.y;
    u_xlat5_.z = _e1227.z;
    let _e1234 = u_xlat6_;
    let _e1236 = u_xlat3_;
    let _e1243 = (-(_e1236.xzw) + vec3<f32>(1f, 1f, 1f));
    u_xlat6_.x = _e1243.x;
    u_xlat6_.y = _e1243.y;
    u_xlat6_.z = _e1243.z;
    let _e1250 = u_xlat6_;
    let _e1252 = u_xlat6_;
    let _e1254 = u_xlat6_;
    let _e1256 = (_e1252.xyz + _e1254.xyz);
    u_xlat6_.x = _e1256.x;
    u_xlat6_.y = _e1256.y;
    u_xlat6_.z = _e1256.z;
    let _e1263 = u_xlat2_;
    let _e1265 = u_xlat2_;
    let _e1271 = _f_buffer4_.f_cb4_[9];
    let _e1278 = ((-(_e1265.xyz) * _e1271.xyz) + vec3<f32>(1f, 1f, 1f));
    u_xlat2_.x = _e1278.x;
    u_xlat2_.y = _e1278.y;
    u_xlat2_.z = _e1278.z;
    let _e1285 = u_xlat2_;
    let _e1287 = u_xlat6_;
    let _e1290 = u_xlat2_;
    let _e1297 = ((-(_e1287.xyz) * _e1290.xyz) + vec3<f32>(1f, 1f, 1f));
    u_xlat2_.x = _e1297.x;
    u_xlat2_.y = _e1297.y;
    u_xlat2_.z = _e1297.z;
    let _e1304 = u_xlat6_;
    let _e1306 = u_xlat4_;
    let _e1308 = floor(_e1306.xyz);
    u_xlat6_.x = _e1308.x;
    u_xlat6_.y = _e1308.y;
    u_xlat6_.z = _e1308.z;
    let _e1315 = u_xlat6_;
    let _e1317 = u_xlat6_;
    let _e1323 = min(_e1317.xyz, vec3<f32>(1f, 1f, 1f));
    u_xlat6_.x = _e1323.x;
    u_xlat6_.y = _e1323.y;
    u_xlat6_.z = _e1323.z;
    let _e1330 = u_xlat1_;
    let _e1332 = u_xlat4_;
    let _e1335 = u_xlat1_;
    let _e1338 = u_xlat2_;
    let _e1340 = ((-(_e1332.xyz) * _e1335.yzw) + _e1338.xyz);
    u_xlat1_.x = _e1340.x;
    u_xlat1_.y = _e1340.y;
    u_xlat1_.z = _e1340.z;
    let _e1347 = u_xlat1_;
    let _e1349 = u_xlat6_;
    let _e1351 = u_xlat1_;
    let _e1354 = u_xlat5_;
    let _e1356 = ((_e1349.xyz * _e1351.xyz) + _e1354.xyz);
    u_xlat1_.x = _e1356.x;
    u_xlat1_.y = _e1356.y;
    u_xlat1_.z = _e1356.z;
    let _e1363 = u_xlat1_;
    let _e1365 = u_xlat0_;
    let _e1368 = u_xlat1_;
    let _e1370 = (-(_e1365.xyz) + _e1368.xyz);
    u_xlat1_.x = _e1370.x;
    u_xlat1_.y = _e1370.y;
    u_xlat1_.z = _e1370.z;
    let _e1377 = u_xlat1_;
    let _e1382 = _f_buffer4_.f_cb4_[11];
    let _e1384 = u_xlat1_;
    let _e1387 = u_xlat0_;
    let _e1389 = ((_e1382.zzz * _e1384.xyz) + _e1387.xyz);
    u_xlat1_.x = _e1389.x;
    u_xlat1_.y = _e1389.y;
    u_xlat1_.z = _e1389.z;
    let _e1396 = u_xlat1_;
    let _e1398 = u_xlatb3_;
    if _e1398.y {
        let _e1400 = u_xlat1_;
        local_10 = _e1400.xyz;
    } else {
        let _e1402 = u_xlat3_;
        local_10 = _e1402.xzw;
    }
    let _e1405 = local_10;
    u_xlat1_.x = _e1405.x;
    u_xlat1_.y = _e1405.y;
    u_xlat1_.z = _e1405.z;
    let _e1412 = u_xlat1_;
    let _e1414 = u_xlat0_;
    let _e1417 = u_xlat1_;
    let _e1419 = (-(_e1414.xyz) + _e1417.xyz);
    u_xlat1_.x = _e1419.x;
    u_xlat1_.y = _e1419.y;
    u_xlat1_.z = _e1419.z;
    let _e1426 = SV_Target0_;
    let _e1428 = u_xlat27_;
    let _e1430 = u_xlat1_;
    let _e1433 = u_xlat0_;
    let _e1435 = ((vec3(_e1428) * _e1430.xyz) + _e1433.xyz);
    SV_Target0_.x = _e1435.x;
    SV_Target0_.y = _e1435.y;
    SV_Target0_.z = _e1435.z;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(4) vs_TEXCOORD4_: vec3<f32>, @location(12) vs_NORMAL0_: vec3<f32>, @location(1) vs_TEXCOORD1_: vec3<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD4_1 = vs_TEXCOORD4_;
    vs_NORMAL0_1 = vs_NORMAL0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    main_1();
    let _e59 = SV_Target0_;
    return FragmentOutput(_e59);
}
