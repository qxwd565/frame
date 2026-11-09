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
@group(3) @binding(5) 
var samplerf_s2_: sampler;
@group(3) @binding(7) 
var samplerf_s3_: sampler;
@group(3) @binding(9) 
var samplerf_s4_: sampler;
@group(3) @binding(11) 
var samplerf_s5_: sampler;
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
@group(3) @binding(10) 
var f_t5_: texture_2d<f32>;
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
    var u_xlat3_: vec4<f32> = vec4(0f);
    var u_xlat4_: vec4<f32> = vec4(0f);
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

    let _e107 = vs_TEXCOORD0_1;
    let _e112 = _f_buffer0_.f_cb0_[4];
    let _e117 = hscard_bias.values[1];
    let _e120 = textureSampleBias(f_t1_, samplerf_s1_, _e107.xy, (_e112.x + _e117.x));
    u_xlat0_ = _e120;
    let _e121 = vs_TEXCOORD0_1;
    let _e126 = _f_buffer0_.f_cb0_[4];
    let _e131 = hscard_bias.values[2];
    let _e134 = textureSampleBias(f_t2_, samplerf_s2_, _e121.xy, (_e126.x + _e131.x));
    u_xlat1_ = _e134;
    let _e135 = vs_TEXCOORD0_1;
    let _e140 = _f_buffer0_.f_cb0_[4];
    let _e145 = hscard_bias.values[3];
    let _e148 = textureSampleBias(f_t3_, samplerf_s3_, _e135.xy, (_e140.x + _e145.x));
    u_xlat2_ = _e148;
    let _e149 = vs_TEXCOORD0_1;
    let _e154 = _f_buffer0_.f_cb0_[4];
    let _e159 = hscard_bias.values[4];
    let _e162 = textureSampleBias(f_t4_, samplerf_s4_, _e149.xy, (_e154.x + _e159.x));
    u_xlat3_ = _e162;
    let _e163 = vs_TEXCOORD0_1;
    let _e168 = _f_buffer0_.f_cb0_[4];
    let _e173 = hscard_bias.values[5];
    let _e176 = textureSampleBias(f_t5_, samplerf_s5_, _e163.xy, (_e168.x + _e173.x));
    u_xlat4_ = _e176;
    let _e177 = u_xlat0_;
    let _e179 = u_xlat1_;
    u_xlat1_ = (-(_e177) + _e179);
    let _e181 = u_xlat2_;
    let _e183 = u_xlat1_;
    let _e185 = u_xlat0_;
    u_xlat0_ = ((_e181.xxxx * _e183) + _e185);
    let _e187 = u_xlat0_;
    let _e189 = u_xlat3_;
    u_xlat1_ = (-(_e187) + _e189);
    let _e191 = u_xlat4_;
    let _e193 = u_xlat1_;
    let _e195 = u_xlat0_;
    u_xlat0_ = ((_e191.yyyy * _e193) + _e195);
    let _e197 = u_xlat1_;
    let _e199 = vs_TEXCOORD1_1;
    let _e204 = _f_buffer3_.f_cb3_[20];
    let _e207 = (_e199.xyz + -(_e204.xyz));
    u_xlat1_.x = _e207.x;
    u_xlat1_.y = _e207.y;
    u_xlat1_.z = _e207.z;
    let _e214 = u_xlat2_;
    let _e216 = vs_TEXCOORD1_1;
    let _e221 = _f_buffer3_.f_cb3_[21];
    let _e224 = (_e216.xyz + -(_e221.xyz));
    u_xlat2_.x = _e224.x;
    u_xlat2_.y = _e224.y;
    u_xlat2_.z = _e224.z;
    let _e231 = u_xlat3_;
    let _e233 = vs_TEXCOORD1_1;
    let _e238 = _f_buffer3_.f_cb3_[22];
    let _e241 = (_e233.xyz + -(_e238.xyz));
    u_xlat3_.x = _e241.x;
    u_xlat3_.y = _e241.y;
    u_xlat3_.z = _e241.z;
    let _e248 = u_xlat4_;
    let _e250 = vs_TEXCOORD1_1;
    let _e255 = _f_buffer3_.f_cb3_[23];
    let _e258 = (_e250.xyz + -(_e255.xyz));
    u_xlat4_.x = _e258.x;
    u_xlat4_.y = _e258.y;
    u_xlat4_.z = _e258.z;
    let _e266 = u_xlat1_;
    let _e268 = u_xlat1_;
    u_xlat1_.x = dot(_e266.xyz, _e268.xyz);
    let _e272 = u_xlat2_;
    let _e274 = u_xlat2_;
    u_xlat1_.y = dot(_e272.xyz, _e274.xyz);
    let _e278 = u_xlat3_;
    let _e280 = u_xlat3_;
    u_xlat1_.z = dot(_e278.xyz, _e280.xyz);
    let _e284 = u_xlat4_;
    let _e286 = u_xlat4_;
    u_xlat1_.w = dot(_e284.xyz, _e286.xyz);
    let _e289 = u_xlat1_;
    let _e293 = _f_buffer3_.f_cb3_[24];
    u_xlatb1_ = (_e289 < _e293);
    let _e296 = u_xlatb1_;
    if _e296.x {
        local = 1f;
    } else {
        local = 0f;
    }
    let _e302 = local;
    u_xlat2_.x = _e302;
    let _e304 = u_xlatb1_;
    if _e304.y {
        local_1 = 1f;
    } else {
        local_1 = 0f;
    }
    let _e310 = local_1;
    u_xlat2_.y = _e310;
    let _e312 = u_xlatb1_;
    if _e312.z {
        local_2 = 1f;
    } else {
        local_2 = 0f;
    }
    let _e318 = local_2;
    u_xlat2_.z = _e318;
    let _e320 = u_xlatb1_;
    if _e320.w {
        local_3 = 1f;
    } else {
        local_3 = 0f;
    }
    let _e326 = local_3;
    u_xlat2_.w = _e326;
    let _e328 = u_xlatb1_;
    if _e328.x {
        local_4 = -1f;
    } else {
        local_4 = -0f;
    }
    let _e337 = local_4;
    u_xlat1_.x = _e337;
    let _e339 = u_xlatb1_;
    if _e339.y {
        local_5 = -1f;
    } else {
        local_5 = -0f;
    }
    let _e348 = local_5;
    u_xlat1_.y = _e348;
    let _e350 = u_xlatb1_;
    if _e350.z {
        local_6 = -1f;
    } else {
        local_6 = -0f;
    }
    let _e359 = local_6;
    u_xlat1_.z = _e359;
    let _e360 = u_xlat1_;
    let _e362 = u_xlat1_;
    let _e364 = u_xlat2_;
    let _e366 = (_e362.xyz + _e364.yzw);
    u_xlat1_.x = _e366.x;
    u_xlat1_.y = _e366.y;
    u_xlat1_.z = _e366.z;
    let _e373 = u_xlat2_;
    let _e375 = u_xlat1_;
    let _e381 = max(_e375.xyz, vec3<f32>(0f, 0f, 0f));
    u_xlat2_.y = _e381.x;
    u_xlat2_.z = _e381.y;
    u_xlat2_.w = _e381.z;
    let _e389 = u_xlat2_;
    u_xlat1_.x = dot(_e389, vec4<f32>(4f, 3f, 2f, 1f));
    let _e397 = u_xlat1_;
    u_xlat1_.x = (-(_e397.x) + 4f);
    let _e402 = u_xlat1_;
    u_xlatu1_ = u32(_e402.x);
    let _e405 = u_xlatu1_;
    u_xlati1_ = (i32(_e405) << 2u);
    let _e410 = u_xlat7_;
    let _e412 = vs_TEXCOORD1_1;
    let _e414 = u_xlati1_;
    let _e419 = _f_buffer3_.f_cb3_[(_e414 + 1i)];
    let _e421 = (_e412.yyy * _e419.xyz);
    u_xlat7_.x = _e421.x;
    u_xlat7_.y = _e421.y;
    u_xlat7_.z = _e421.z;
    let _e428 = u_xlat7_;
    let _e430 = u_xlati1_;
    let _e433 = _f_buffer3_.f_cb3_[_e430];
    let _e435 = vs_TEXCOORD1_1;
    let _e438 = u_xlat7_;
    let _e440 = ((_e433.xyz * _e435.xxx) + _e438.xyz);
    u_xlat7_.x = _e440.x;
    u_xlat7_.y = _e440.y;
    u_xlat7_.z = _e440.z;
    let _e447 = u_xlat7_;
    let _e449 = u_xlati1_;
    let _e454 = _f_buffer3_.f_cb3_[(_e449 + 2i)];
    let _e456 = vs_TEXCOORD1_1;
    let _e459 = u_xlat7_;
    let _e461 = ((_e454.xyz * _e456.zzz) + _e459.xyz);
    u_xlat7_.x = _e461.x;
    u_xlat7_.y = _e461.y;
    u_xlat7_.z = _e461.z;
    let _e468 = u_xlat1_;
    let _e470 = u_xlat7_;
    let _e472 = u_xlati1_;
    let _e477 = _f_buffer3_.f_cb3_[(_e472 + 3i)];
    let _e479 = (_e470.xyz + _e477.xyz);
    u_xlat1_.x = _e479.x;
    u_xlat1_.y = _e479.y;
    u_xlat1_.z = _e479.z;
    let _e486 = vs_NORMAL0_1;
    let _e488 = vs_NORMAL0_1;
    u_xlat19_ = dot(_e486.xyz, _e488.xyz);
    let _e491 = u_xlat19_;
    u_xlat19_ = inverseSqrt(_e491);
    let _e493 = u_xlat2_;
    let _e495 = u_xlat19_;
    let _e497 = vs_NORMAL0_1;
    let _e499 = (vec3(_e495) * _e497.xyz);
    u_xlat2_.x = _e499.x;
    u_xlat2_.y = _e499.y;
    u_xlat2_.z = _e499.z;
    let _e506 = u_xlat1_;
    let _e507 = _e506.xy;
    let _e508 = u_xlat1_;
    txVec0_ = vec3<f32>(_e507.x, _e507.y, _e508.z);
    let _e515 = txVec0_;
    let _e519 = textureSampleCompareLevel(f_t0_, samplerf_s0_, _e515.xy, _e515.z);
    u_xlat1_.x = _e519;
    let _e524 = _f_buffer3_.f_cb3_[27];
    u_xlat7_.x = (-(_e524.x) + 1f);
    let _e530 = u_xlat1_;
    let _e535 = _f_buffer3_.f_cb3_[27];
    let _e538 = u_xlat7_;
    u_xlat1_.x = ((_e530.x * _e535.x) + _e538.x);
    let _e542 = u_xlat1_;
    u_xlatb7_ = (0f >= _e542.z);
    let _e545 = u_xlat1_;
    u_xlatb13_ = (_e545.z >= 1f);
    let _e549 = u_xlatb13_;
    let _e550 = u_xlatb7_;
    u_xlatb7_ = (_e549 || _e550);
    let _e553 = u_xlatb7_;
    if _e553 {
        local_7 = 1f;
    } else {
        let _e555 = u_xlat1_;
        local_7 = _e555.x;
    }
    let _e558 = local_7;
    u_xlat1_.x = _e558;
    let _e560 = u_xlat1_;
    let _e565 = _f_buffer2_.f_cb2_[11];
    u_xlat1_.x = (_e560.x * _e565.z);
    let _e568 = u_xlat1_;
    let _e570 = u_xlat1_;
    let _e575 = _f_buffer0_.f_cb0_[6];
    let _e577 = (_e570.xxx * _e575.xyz);
    u_xlat1_.x = _e577.x;
    u_xlat1_.y = _e577.y;
    u_xlat1_.z = _e577.z;
    let _e584 = u_xlat2_;
    let _e589 = _f_buffer0_.f_cb0_[5];
    u_xlat19_ = dot(_e584.xyz, _e589.xyz);
    let _e592 = u_xlat19_;
    u_xlat19_ = clamp(_e592, 0f, 1f);
    let _e599 = _f_buffer0_.f_cb0_[10];
    let _e604 = _f_buffer2_.f_cb2_[11];
    u_xlat20_ = min(_e599.x, _e604.y);
    let _e607 = u_xlat20_;
    u_xlatu20_ = u32(i32(_e607));
    u_xlat3_.x = 0f;
    u_xlat3_.y = 0f;
    u_xlat3_.z = 0f;
    loop {
        let _e622 = u_xlatu_loop_1_;
        let _e623 = u_xlatu20_;
        if !((_e622 < _e623)) {
            break;
        }
        {
            let _e629 = u_xlatu_loop_1_;
            u_xlatu4_ = (_e629 >> 2u);
            let _e632 = u_xlatu_loop_1_;
            u_xlati10_ = i32((_e632 & 3u));
            let _e637 = u_xlatu4_;
            let _e643 = _f_buffer2_.f_cb2_[(i32(_e637) + 12i)];
            let _e644 = u_xlati10_;
            let _e648 = local_8[_e644];
            u_xlat4_.x = dot(_e643, bitcast<vec4<f32>>(_e648));
            let _e651 = u_xlat4_;
            u_xlati4_ = i32(_e651.x);
            let _e654 = u_xlat10_;
            let _e656 = vs_TEXCOORD1_1;
            let _e659 = u_xlati4_;
            let _e662 = _f_buffer1_.f_cb1_[_e659];
            let _e665 = u_xlati4_;
            let _e668 = _f_buffer1_.f_cb1_[_e665];
            let _e670 = ((-(_e656.xyz) * _e662.www) + _e668.xyz);
            u_xlat10_.x = _e670.x;
            u_xlat10_.y = _e670.y;
            u_xlat10_.z = _e670.z;
            let _e678 = u_xlat10_;
            let _e680 = u_xlat10_;
            u_xlat5_.x = dot(_e678.xyz, _e680.xyz);
            let _e684 = u_xlat5_;
            u_xlat5_.x = max(_e684.x, 0.000061035156f);
            let _e688 = u_xlat5_;
            u_xlat11_ = inverseSqrt(_e688.x);
            let _e691 = u_xlat10_;
            let _e693 = u_xlat10_;
            let _e695 = u_xlat11_;
            let _e697 = (_e693.xyz * vec3(_e695));
            u_xlat10_.x = _e697.x;
            u_xlat10_.y = _e697.y;
            u_xlat10_.z = _e697.z;
            let _e706 = u_xlati4_;
            let _e711 = _f_buffer1_.f_cb1_[(_e706 + 512i)];
            u_xlat11_ = (1f / _e711.x);
            let _e715 = u_xlat5_;
            u_xlat5_.x = (_e715.x * 25f);
            let _e720 = u_xlat5_;
            let _e722 = u_xlat11_;
            u_xlat5_.x = (_e720.x / _e722);
            let _e725 = u_xlat5_;
            u_xlat5_.x = (_e725.x + 1f);
            let _e732 = u_xlat5_;
            u_xlat5_.x = (1f / _e732.x);
            let _e735 = u_xlati4_;
            let _e740 = _f_buffer1_.f_cb1_[(_e735 + 768i)];
            let _e742 = u_xlat10_;
            u_xlat11_ = dot(_e740.xyz, _e742.xyz);
            let _e745 = u_xlat11_;
            let _e746 = u_xlati4_;
            let _e751 = _f_buffer1_.f_cb1_[(_e746 + 512i)];
            let _e754 = u_xlati4_;
            let _e759 = _f_buffer1_.f_cb1_[(_e754 + 512i)];
            u_xlat11_ = ((_e745 * _e751.z) + _e759.w);
            let _e762 = u_xlat11_;
            u_xlat11_ = clamp(_e762, 0f, 1f);
            let _e766 = u_xlat11_;
            let _e767 = u_xlat11_;
            u_xlat11_ = (_e766 * _e767);
            let _e770 = u_xlat11_;
            let _e771 = u_xlat5_;
            u_xlat5_.x = (_e770 * _e771.x);
            let _e774 = u_xlat5_;
            let _e776 = u_xlat5_;
            let _e778 = u_xlati4_;
            let _e783 = _f_buffer1_.f_cb1_[(_e778 + 256i)];
            let _e785 = (_e776.xxx * _e783.xyz);
            u_xlat5_.x = _e785.x;
            u_xlat5_.y = _e785.y;
            u_xlat5_.z = _e785.z;
            let _e793 = u_xlat2_;
            let _e795 = u_xlat10_;
            u_xlat4_.x = dot(_e793.xyz, _e795.xyz);
            let _e799 = u_xlat4_;
            u_xlat4_.x = clamp(_e799.x, 0f, 1f);
            let _e804 = u_xlat3_;
            let _e806 = u_xlat5_;
            let _e808 = u_xlat4_;
            let _e811 = u_xlat3_;
            let _e813 = ((_e806.xyz * _e808.xxx) + _e811.xyz);
            u_xlat3_.x = _e813.x;
            u_xlat3_.y = _e813.y;
            u_xlat3_.z = _e813.z;
        }
        continuing {
            let _e626 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e626 + 1u);
        }
    }
    let _e820 = u_xlat1_;
    let _e822 = u_xlat1_;
    let _e824 = u_xlat19_;
    let _e827 = u_xlat3_;
    let _e829 = ((_e822.xyz * vec3(_e824)) + _e827.xyz);
    u_xlat1_.x = _e829.x;
    u_xlat1_.y = _e829.y;
    u_xlat1_.z = _e829.z;
    let _e840 = _f_buffer2_.f_cb2_[27];
    u_xlat2_.x = abs(_e840.w);
    let _e847 = _f_buffer2_.f_cb2_[28];
    u_xlat2_.y = abs(_e847.w);
    let _e854 = _f_buffer2_.f_cb2_[29];
    u_xlat2_.z = abs(_e854.w);
    let _e857 = u_xlat2_;
    let _e859 = u_xlat2_;
    let _e861 = log2(_e859.xyz);
    u_xlat2_.x = _e861.x;
    u_xlat2_.y = _e861.y;
    u_xlat2_.z = _e861.z;
    let _e868 = u_xlat2_;
    let _e870 = u_xlat2_;
    let _e876 = (_e870.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat2_.x = _e876.x;
    u_xlat2_.y = _e876.y;
    u_xlat2_.z = _e876.z;
    let _e883 = u_xlat2_;
    let _e885 = u_xlat2_;
    let _e887 = exp2(_e885.xyz);
    u_xlat2_.x = _e887.x;
    u_xlat2_.y = _e887.y;
    u_xlat2_.z = _e887.z;
    let _e894 = u_xlat2_;
    let _e896 = u_xlat2_;
    let _e910 = ((_e896.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat2_.x = _e910.x;
    u_xlat2_.y = _e910.y;
    u_xlat2_.z = _e910.z;
    let _e917 = u_xlat2_;
    let _e919 = u_xlat2_;
    let _e925 = clamp(_e919.xyz, vec3(0f), vec3(1f));
    u_xlat2_.x = _e925.x;
    u_xlat2_.y = _e925.y;
    u_xlat2_.z = _e925.z;
    let _e932 = u_xlat1_;
    let _e934 = u_xlat1_;
    let _e936 = u_xlat2_;
    let _e938 = (_e934.xyz + _e936.xyz);
    u_xlat1_.x = _e938.x;
    u_xlat1_.y = _e938.y;
    u_xlat1_.z = _e938.z;
    let _e945 = SV_Target0_;
    let _e947 = u_xlat0_;
    let _e949 = u_xlat1_;
    let _e951 = (_e947.xyz * _e949.xyz);
    SV_Target0_.x = _e951.x;
    SV_Target0_.y = _e951.y;
    SV_Target0_.z = _e951.z;
    let _e959 = u_xlat0_;
    SV_Target0_.w = _e959.w;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec3<f32>, @location(12) vs_NORMAL0_: vec3<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_NORMAL0_1 = vs_NORMAL0_;
    main_1();
    let _e56 = SV_Target0_;
    return FragmentOutput(_e56);
}
