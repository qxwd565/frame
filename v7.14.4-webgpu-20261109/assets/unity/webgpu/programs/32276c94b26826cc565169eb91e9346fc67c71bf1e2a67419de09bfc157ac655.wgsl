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
@group(3) @binding(1) 
var samplerf_s0_: sampler_comparison;
@group(3) @binding(3) 
var samplerf_s1_: sampler;
@group(3) @binding(0) 
var f_t0_: texture_depth_2d;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
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
    var u_xlat3_: vec3<f32> = vec3(0f);
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
    var txVec0_: vec3<f32>;
    var local_7: f32;
    var u_xlatu_loop_1_: u32 = 0u;
    var local_8: array<vec4<u32>, 4> = ImmCB_0_;

    let _e99 = vs_TEXCOORD0_1;
    let _e104 = _f_buffer0_.f_cb0_[4];
    let _e109 = hscard_bias.values[1];
    let _e112 = textureSampleBias(f_t1_, samplerf_s1_, _e99.xy, (_e104.x + _e109.x));
    u_xlat0_ = _e112;
    let _e113 = u_xlat1_;
    let _e115 = vs_TEXCOORD1_1;
    let _e120 = _f_buffer3_.f_cb3_[20];
    let _e123 = (_e115.xyz + -(_e120.xyz));
    u_xlat1_.x = _e123.x;
    u_xlat1_.y = _e123.y;
    u_xlat1_.z = _e123.z;
    let _e130 = u_xlat2_;
    let _e132 = vs_TEXCOORD1_1;
    let _e137 = _f_buffer3_.f_cb3_[21];
    let _e140 = (_e132.xyz + -(_e137.xyz));
    u_xlat2_.x = _e140.x;
    u_xlat2_.y = _e140.y;
    u_xlat2_.z = _e140.z;
    let _e147 = u_xlat3_;
    let _e149 = vs_TEXCOORD1_1;
    let _e154 = _f_buffer3_.f_cb3_[22];
    let _e157 = (_e149.xyz + -(_e154.xyz));
    u_xlat3_.x = _e157.x;
    u_xlat3_.y = _e157.y;
    u_xlat3_.z = _e157.z;
    let _e164 = u_xlat4_;
    let _e166 = vs_TEXCOORD1_1;
    let _e171 = _f_buffer3_.f_cb3_[23];
    let _e174 = (_e166.xyz + -(_e171.xyz));
    u_xlat4_.x = _e174.x;
    u_xlat4_.y = _e174.y;
    u_xlat4_.z = _e174.z;
    let _e182 = u_xlat1_;
    let _e184 = u_xlat1_;
    u_xlat1_.x = dot(_e182.xyz, _e184.xyz);
    let _e188 = u_xlat2_;
    let _e190 = u_xlat2_;
    u_xlat1_.y = dot(_e188.xyz, _e190.xyz);
    let _e194 = u_xlat3_;
    let _e196 = u_xlat3_;
    u_xlat1_.z = dot(_e194.xyz, _e196.xyz);
    let _e200 = u_xlat4_;
    let _e202 = u_xlat4_;
    u_xlat1_.w = dot(_e200.xyz, _e202.xyz);
    let _e205 = u_xlat1_;
    let _e209 = _f_buffer3_.f_cb3_[24];
    u_xlatb1_ = (_e205 < _e209);
    let _e212 = u_xlatb1_;
    if _e212.x {
        local = 1f;
    } else {
        local = 0f;
    }
    let _e218 = local;
    u_xlat2_.x = _e218;
    let _e220 = u_xlatb1_;
    if _e220.y {
        local_1 = 1f;
    } else {
        local_1 = 0f;
    }
    let _e226 = local_1;
    u_xlat2_.y = _e226;
    let _e228 = u_xlatb1_;
    if _e228.z {
        local_2 = 1f;
    } else {
        local_2 = 0f;
    }
    let _e234 = local_2;
    u_xlat2_.z = _e234;
    let _e236 = u_xlatb1_;
    if _e236.w {
        local_3 = 1f;
    } else {
        local_3 = 0f;
    }
    let _e242 = local_3;
    u_xlat2_.w = _e242;
    let _e244 = u_xlatb1_;
    if _e244.x {
        local_4 = -1f;
    } else {
        local_4 = -0f;
    }
    let _e253 = local_4;
    u_xlat1_.x = _e253;
    let _e255 = u_xlatb1_;
    if _e255.y {
        local_5 = -1f;
    } else {
        local_5 = -0f;
    }
    let _e264 = local_5;
    u_xlat1_.y = _e264;
    let _e266 = u_xlatb1_;
    if _e266.z {
        local_6 = -1f;
    } else {
        local_6 = -0f;
    }
    let _e275 = local_6;
    u_xlat1_.z = _e275;
    let _e276 = u_xlat1_;
    let _e278 = u_xlat1_;
    let _e280 = u_xlat2_;
    let _e282 = (_e278.xyz + _e280.yzw);
    u_xlat1_.x = _e282.x;
    u_xlat1_.y = _e282.y;
    u_xlat1_.z = _e282.z;
    let _e289 = u_xlat2_;
    let _e291 = u_xlat1_;
    let _e297 = max(_e291.xyz, vec3<f32>(0f, 0f, 0f));
    u_xlat2_.y = _e297.x;
    u_xlat2_.z = _e297.y;
    u_xlat2_.w = _e297.z;
    let _e305 = u_xlat2_;
    u_xlat1_.x = dot(_e305, vec4<f32>(4f, 3f, 2f, 1f));
    let _e313 = u_xlat1_;
    u_xlat1_.x = (-(_e313.x) + 4f);
    let _e318 = u_xlat1_;
    u_xlatu1_ = u32(_e318.x);
    let _e321 = u_xlatu1_;
    u_xlati1_ = (i32(_e321) << 2u);
    let _e326 = u_xlat7_;
    let _e328 = vs_TEXCOORD1_1;
    let _e330 = u_xlati1_;
    let _e335 = _f_buffer3_.f_cb3_[(_e330 + 1i)];
    let _e337 = (_e328.yyy * _e335.xyz);
    u_xlat7_.x = _e337.x;
    u_xlat7_.y = _e337.y;
    u_xlat7_.z = _e337.z;
    let _e344 = u_xlat7_;
    let _e346 = u_xlati1_;
    let _e349 = _f_buffer3_.f_cb3_[_e346];
    let _e351 = vs_TEXCOORD1_1;
    let _e354 = u_xlat7_;
    let _e356 = ((_e349.xyz * _e351.xxx) + _e354.xyz);
    u_xlat7_.x = _e356.x;
    u_xlat7_.y = _e356.y;
    u_xlat7_.z = _e356.z;
    let _e363 = u_xlat7_;
    let _e365 = u_xlati1_;
    let _e370 = _f_buffer3_.f_cb3_[(_e365 + 2i)];
    let _e372 = vs_TEXCOORD1_1;
    let _e375 = u_xlat7_;
    let _e377 = ((_e370.xyz * _e372.zzz) + _e375.xyz);
    u_xlat7_.x = _e377.x;
    u_xlat7_.y = _e377.y;
    u_xlat7_.z = _e377.z;
    let _e384 = u_xlat1_;
    let _e386 = u_xlat7_;
    let _e388 = u_xlati1_;
    let _e393 = _f_buffer3_.f_cb3_[(_e388 + 3i)];
    let _e395 = (_e386.xyz + _e393.xyz);
    u_xlat1_.x = _e395.x;
    u_xlat1_.y = _e395.y;
    u_xlat1_.z = _e395.z;
    let _e402 = vs_NORMAL0_1;
    let _e404 = vs_NORMAL0_1;
    u_xlat19_ = dot(_e402.xyz, _e404.xyz);
    let _e407 = u_xlat19_;
    u_xlat19_ = inverseSqrt(_e407);
    let _e409 = u_xlat2_;
    let _e411 = u_xlat19_;
    let _e413 = vs_NORMAL0_1;
    let _e415 = (vec3(_e411) * _e413.xyz);
    u_xlat2_.x = _e415.x;
    u_xlat2_.y = _e415.y;
    u_xlat2_.z = _e415.z;
    let _e422 = u_xlat1_;
    let _e423 = _e422.xy;
    let _e424 = u_xlat1_;
    txVec0_ = vec3<f32>(_e423.x, _e423.y, _e424.z);
    let _e431 = txVec0_;
    let _e435 = textureSampleCompareLevel(f_t0_, samplerf_s0_, _e431.xy, _e431.z);
    u_xlat1_.x = _e435;
    let _e440 = _f_buffer3_.f_cb3_[27];
    u_xlat7_.x = (-(_e440.x) + 1f);
    let _e446 = u_xlat1_;
    let _e451 = _f_buffer3_.f_cb3_[27];
    let _e454 = u_xlat7_;
    u_xlat1_.x = ((_e446.x * _e451.x) + _e454.x);
    let _e458 = u_xlat1_;
    u_xlatb7_ = (0f >= _e458.z);
    let _e461 = u_xlat1_;
    u_xlatb13_ = (_e461.z >= 1f);
    let _e465 = u_xlatb13_;
    let _e466 = u_xlatb7_;
    u_xlatb7_ = (_e465 || _e466);
    let _e469 = u_xlatb7_;
    if _e469 {
        local_7 = 1f;
    } else {
        let _e471 = u_xlat1_;
        local_7 = _e471.x;
    }
    let _e474 = local_7;
    u_xlat1_.x = _e474;
    let _e476 = u_xlat1_;
    let _e481 = _f_buffer2_.f_cb2_[11];
    u_xlat1_.x = (_e476.x * _e481.z);
    let _e484 = u_xlat1_;
    let _e486 = u_xlat1_;
    let _e491 = _f_buffer0_.f_cb0_[6];
    let _e493 = (_e486.xxx * _e491.xyz);
    u_xlat1_.x = _e493.x;
    u_xlat1_.y = _e493.y;
    u_xlat1_.z = _e493.z;
    let _e500 = u_xlat2_;
    let _e505 = _f_buffer0_.f_cb0_[5];
    u_xlat19_ = dot(_e500.xyz, _e505.xyz);
    let _e508 = u_xlat19_;
    u_xlat19_ = clamp(_e508, 0f, 1f);
    let _e515 = _f_buffer0_.f_cb0_[10];
    let _e520 = _f_buffer2_.f_cb2_[11];
    u_xlat20_ = min(_e515.x, _e520.y);
    let _e523 = u_xlat20_;
    u_xlatu20_ = u32(i32(_e523));
    u_xlat3_.x = 0f;
    u_xlat3_.y = 0f;
    u_xlat3_.z = 0f;
    loop {
        let _e538 = u_xlatu_loop_1_;
        let _e539 = u_xlatu20_;
        if !((_e538 < _e539)) {
            break;
        }
        {
            let _e545 = u_xlatu_loop_1_;
            u_xlatu4_ = (_e545 >> 2u);
            let _e548 = u_xlatu_loop_1_;
            u_xlati10_ = i32((_e548 & 3u));
            let _e553 = u_xlatu4_;
            let _e559 = _f_buffer2_.f_cb2_[(i32(_e553) + 12i)];
            let _e560 = u_xlati10_;
            let _e564 = local_8[_e560];
            u_xlat4_.x = dot(_e559, bitcast<vec4<f32>>(_e564));
            let _e567 = u_xlat4_;
            u_xlati4_ = i32(_e567.x);
            let _e570 = u_xlat10_;
            let _e572 = vs_TEXCOORD1_1;
            let _e575 = u_xlati4_;
            let _e578 = _f_buffer1_.f_cb1_[_e575];
            let _e581 = u_xlati4_;
            let _e584 = _f_buffer1_.f_cb1_[_e581];
            let _e586 = ((-(_e572.xyz) * _e578.www) + _e584.xyz);
            u_xlat10_.x = _e586.x;
            u_xlat10_.y = _e586.y;
            u_xlat10_.z = _e586.z;
            let _e594 = u_xlat10_;
            let _e596 = u_xlat10_;
            u_xlat5_.x = dot(_e594.xyz, _e596.xyz);
            let _e600 = u_xlat5_;
            u_xlat5_.x = max(_e600.x, 0.000061035156f);
            let _e604 = u_xlat5_;
            u_xlat11_ = inverseSqrt(_e604.x);
            let _e607 = u_xlat10_;
            let _e609 = u_xlat10_;
            let _e611 = u_xlat11_;
            let _e613 = (_e609.xyz * vec3(_e611));
            u_xlat10_.x = _e613.x;
            u_xlat10_.y = _e613.y;
            u_xlat10_.z = _e613.z;
            let _e622 = u_xlati4_;
            let _e627 = _f_buffer1_.f_cb1_[(_e622 + 512i)];
            u_xlat11_ = (1f / _e627.x);
            let _e631 = u_xlat5_;
            u_xlat5_.x = (_e631.x * 25f);
            let _e636 = u_xlat5_;
            let _e638 = u_xlat11_;
            u_xlat5_.x = (_e636.x / _e638);
            let _e641 = u_xlat5_;
            u_xlat5_.x = (_e641.x + 1f);
            let _e648 = u_xlat5_;
            u_xlat5_.x = (1f / _e648.x);
            let _e651 = u_xlati4_;
            let _e656 = _f_buffer1_.f_cb1_[(_e651 + 768i)];
            let _e658 = u_xlat10_;
            u_xlat11_ = dot(_e656.xyz, _e658.xyz);
            let _e661 = u_xlat11_;
            let _e662 = u_xlati4_;
            let _e667 = _f_buffer1_.f_cb1_[(_e662 + 512i)];
            let _e670 = u_xlati4_;
            let _e675 = _f_buffer1_.f_cb1_[(_e670 + 512i)];
            u_xlat11_ = ((_e661 * _e667.z) + _e675.w);
            let _e678 = u_xlat11_;
            u_xlat11_ = clamp(_e678, 0f, 1f);
            let _e682 = u_xlat11_;
            let _e683 = u_xlat11_;
            u_xlat11_ = (_e682 * _e683);
            let _e686 = u_xlat11_;
            let _e687 = u_xlat5_;
            u_xlat5_.x = (_e686 * _e687.x);
            let _e690 = u_xlat5_;
            let _e692 = u_xlat5_;
            let _e694 = u_xlati4_;
            let _e699 = _f_buffer1_.f_cb1_[(_e694 + 256i)];
            let _e701 = (_e692.xxx * _e699.xyz);
            u_xlat5_.x = _e701.x;
            u_xlat5_.y = _e701.y;
            u_xlat5_.z = _e701.z;
            let _e709 = u_xlat2_;
            let _e711 = u_xlat10_;
            u_xlat4_.x = dot(_e709.xyz, _e711.xyz);
            let _e715 = u_xlat4_;
            u_xlat4_.x = clamp(_e715.x, 0f, 1f);
            let _e720 = u_xlat3_;
            let _e722 = u_xlat5_;
            let _e724 = u_xlat4_;
            let _e727 = u_xlat3_;
            let _e729 = ((_e722.xyz * _e724.xxx) + _e727.xyz);
            u_xlat3_.x = _e729.x;
            u_xlat3_.y = _e729.y;
            u_xlat3_.z = _e729.z;
        }
        continuing {
            let _e542 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e542 + 1u);
        }
    }
    let _e736 = u_xlat1_;
    let _e738 = u_xlat1_;
    let _e740 = u_xlat19_;
    let _e743 = u_xlat3_;
    let _e745 = ((_e738.xyz * vec3(_e740)) + _e743.xyz);
    u_xlat1_.x = _e745.x;
    u_xlat1_.y = _e745.y;
    u_xlat1_.z = _e745.z;
    let _e756 = _f_buffer2_.f_cb2_[27];
    u_xlat2_.x = abs(_e756.w);
    let _e763 = _f_buffer2_.f_cb2_[28];
    u_xlat2_.y = abs(_e763.w);
    let _e770 = _f_buffer2_.f_cb2_[29];
    u_xlat2_.z = abs(_e770.w);
    let _e773 = u_xlat2_;
    let _e775 = u_xlat2_;
    let _e777 = log2(_e775.xyz);
    u_xlat2_.x = _e777.x;
    u_xlat2_.y = _e777.y;
    u_xlat2_.z = _e777.z;
    let _e784 = u_xlat2_;
    let _e786 = u_xlat2_;
    let _e792 = (_e786.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat2_.x = _e792.x;
    u_xlat2_.y = _e792.y;
    u_xlat2_.z = _e792.z;
    let _e799 = u_xlat2_;
    let _e801 = u_xlat2_;
    let _e803 = exp2(_e801.xyz);
    u_xlat2_.x = _e803.x;
    u_xlat2_.y = _e803.y;
    u_xlat2_.z = _e803.z;
    let _e810 = u_xlat2_;
    let _e812 = u_xlat2_;
    let _e826 = ((_e812.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat2_.x = _e826.x;
    u_xlat2_.y = _e826.y;
    u_xlat2_.z = _e826.z;
    let _e833 = u_xlat2_;
    let _e835 = u_xlat2_;
    let _e841 = clamp(_e835.xyz, vec3(0f), vec3(1f));
    u_xlat2_.x = _e841.x;
    u_xlat2_.y = _e841.y;
    u_xlat2_.z = _e841.z;
    let _e848 = u_xlat1_;
    let _e850 = u_xlat1_;
    let _e852 = u_xlat2_;
    let _e854 = (_e850.xyz + _e852.xyz);
    u_xlat1_.x = _e854.x;
    u_xlat1_.y = _e854.y;
    u_xlat1_.z = _e854.z;
    let _e861 = SV_Target0_;
    let _e863 = u_xlat0_;
    let _e865 = u_xlat1_;
    let _e867 = (_e863.xyz * _e865.xyz);
    SV_Target0_.x = _e867.x;
    SV_Target0_.y = _e867.y;
    SV_Target0_.z = _e867.z;
    let _e875 = u_xlat0_;
    SV_Target0_.w = _e875.w;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec3<f32>, @location(12) vs_NORMAL0_: vec3<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_NORMAL0_1 = vs_NORMAL0_;
    main_1();
    let _e40 = SV_Target0_;
    return FragmentOutput(_e40);
}
