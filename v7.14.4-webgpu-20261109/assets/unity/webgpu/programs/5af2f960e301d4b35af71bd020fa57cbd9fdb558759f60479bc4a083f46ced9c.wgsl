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
    f_cb4_: array<vec4<f32>, 3>,
}

struct FragmentOutput {
    @location(0) SV_TARGET0_: vec4<f32>,
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
@group(3) @binding(0) 
var f_t0_: texture_depth_2d;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
@group(3) @binding(4) 
var f_t2_: texture_2d<f32>;
@group(3) @binding(6) 
var f_t3_: texture_2d<f32>;
var<private> vs_NORMAL0_1: vec3<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD1_1: vec2<f32>;
var<private> vs_TEXCOORD2_1: vec3<f32>;
var<private> SV_TARGET0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlatb2_: vec4<bool> = vec4(false);
    var u_xlat3_: vec4<f32> = vec4(0f);
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlat5_: vec3<f32> = vec3(0f);
    var u_xlat6_: vec3<f32> = vec3(0f);
    var u_xlat21_: f32 = 0f;
    var u_xlati21_: i32 = 0i;
    var u_xlatu21_: u32 = 0u;
    var u_xlat22_: f32 = 0f;
    var u_xlatu22_: u32 = 0u;
    var u_xlatb22_: bool = false;
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
    var txVec0_: vec3<f32>;
    var local_7: f32;
    var u_xlatu_loop_1_: u32 = 0u;
    var local_8: array<vec4<u32>, 4> = ImmCB_0_;

    let _e106 = vs_TEXCOORD0_1;
    let _e111 = _f_buffer0_.f_cb0_[4];
    let _e116 = hscard_bias.values[1];
    let _e119 = textureSampleBias(f_t1_, samplerf_s1_, _e106.xy, (_e111.x + _e116.x));
    u_xlat0_ = _e119;
    let _e120 = vs_TEXCOORD0_1;
    let _e125 = _f_buffer0_.f_cb0_[4];
    let _e130 = hscard_bias.values[2];
    let _e133 = textureSampleBias(f_t2_, samplerf_s2_, _e120.xy, (_e125.x + _e130.x));
    u_xlat1_ = _e133;
    let _e134 = u_xlat2_;
    let _e136 = vs_TEXCOORD1_1;
    let _e138 = vs_TEXCOORD1_1;
    let _e140 = (_e136.xy + _e138.xy);
    u_xlat2_.x = _e140.x;
    u_xlat2_.y = _e140.y;
    let _e145 = u_xlat2_;
    let _e150 = _f_buffer0_.f_cb0_[4];
    let _e155 = hscard_bias.values[3];
    let _e158 = textureSampleBias(f_t3_, samplerf_s3_, _e145.xy, (_e150.x + _e155.x));
    u_xlat2_ = _e158;
    let _e159 = u_xlat1_;
    let _e161 = u_xlat1_;
    let _e163 = u_xlat2_;
    let _e165 = (_e161.xyz * _e163.xyz);
    u_xlat1_.x = _e165.x;
    u_xlat1_.y = _e165.y;
    u_xlat1_.z = _e165.z;
    let _e172 = u_xlat1_;
    let _e174 = u_xlat1_;
    let _e179 = _f_buffer4_.f_cb4_[2];
    let _e181 = (_e174.xyz * _e179.xxx);
    u_xlat1_.x = _e181.x;
    u_xlat1_.y = _e181.y;
    u_xlat1_.z = _e181.z;
    let _e188 = u_xlat1_;
    let _e190 = u_xlat1_;
    let _e195 = _f_buffer4_.f_cb4_[1];
    let _e198 = u_xlat0_;
    let _e200 = ((_e190.xyz * _e195.xyz) + _e198.xyz);
    u_xlat1_.x = _e200.x;
    u_xlat1_.y = _e200.y;
    u_xlat1_.z = _e200.z;
    let _e207 = u_xlat1_;
    let _e209 = u_xlat1_;
    let _e214 = _f_buffer4_.f_cb4_[0];
    let _e216 = (_e209.xyz * _e214.xyz);
    u_xlat1_.x = _e216.x;
    u_xlat1_.y = _e216.y;
    u_xlat1_.z = _e216.z;
    let _e223 = u_xlat2_;
    let _e225 = vs_TEXCOORD2_1;
    let _e230 = _f_buffer3_.f_cb3_[20];
    let _e233 = (_e225.xyz + -(_e230.xyz));
    u_xlat2_.x = _e233.x;
    u_xlat2_.y = _e233.y;
    u_xlat2_.z = _e233.z;
    let _e240 = u_xlat3_;
    let _e242 = vs_TEXCOORD2_1;
    let _e247 = _f_buffer3_.f_cb3_[21];
    let _e250 = (_e242.xyz + -(_e247.xyz));
    u_xlat3_.x = _e250.x;
    u_xlat3_.y = _e250.y;
    u_xlat3_.z = _e250.z;
    let _e257 = u_xlat4_;
    let _e259 = vs_TEXCOORD2_1;
    let _e264 = _f_buffer3_.f_cb3_[22];
    let _e267 = (_e259.xyz + -(_e264.xyz));
    u_xlat4_.x = _e267.x;
    u_xlat4_.y = _e267.y;
    u_xlat4_.z = _e267.z;
    let _e274 = u_xlat5_;
    let _e276 = vs_TEXCOORD2_1;
    let _e281 = _f_buffer3_.f_cb3_[23];
    let _e284 = (_e276.xyz + -(_e281.xyz));
    u_xlat5_.x = _e284.x;
    u_xlat5_.y = _e284.y;
    u_xlat5_.z = _e284.z;
    let _e292 = u_xlat2_;
    let _e294 = u_xlat2_;
    u_xlat2_.x = dot(_e292.xyz, _e294.xyz);
    let _e298 = u_xlat3_;
    let _e300 = u_xlat3_;
    u_xlat2_.y = dot(_e298.xyz, _e300.xyz);
    let _e304 = u_xlat4_;
    let _e306 = u_xlat4_;
    u_xlat2_.z = dot(_e304.xyz, _e306.xyz);
    let _e310 = u_xlat5_;
    let _e312 = u_xlat5_;
    u_xlat2_.w = dot(_e310.xyz, _e312.xyz);
    let _e315 = u_xlat2_;
    let _e319 = _f_buffer3_.f_cb3_[24];
    u_xlatb2_ = (_e315 < _e319);
    let _e322 = u_xlatb2_;
    if _e322.x {
        local = 1f;
    } else {
        local = 0f;
    }
    let _e328 = local;
    u_xlat3_.x = _e328;
    let _e330 = u_xlatb2_;
    if _e330.y {
        local_1 = 1f;
    } else {
        local_1 = 0f;
    }
    let _e336 = local_1;
    u_xlat3_.y = _e336;
    let _e338 = u_xlatb2_;
    if _e338.z {
        local_2 = 1f;
    } else {
        local_2 = 0f;
    }
    let _e344 = local_2;
    u_xlat3_.z = _e344;
    let _e346 = u_xlatb2_;
    if _e346.w {
        local_3 = 1f;
    } else {
        local_3 = 0f;
    }
    let _e352 = local_3;
    u_xlat3_.w = _e352;
    let _e354 = u_xlatb2_;
    if _e354.x {
        local_4 = -1f;
    } else {
        local_4 = -0f;
    }
    let _e363 = local_4;
    u_xlat2_.x = _e363;
    let _e365 = u_xlatb2_;
    if _e365.y {
        local_5 = -1f;
    } else {
        local_5 = -0f;
    }
    let _e374 = local_5;
    u_xlat2_.y = _e374;
    let _e376 = u_xlatb2_;
    if _e376.z {
        local_6 = -1f;
    } else {
        local_6 = -0f;
    }
    let _e385 = local_6;
    u_xlat2_.z = _e385;
    let _e386 = u_xlat2_;
    let _e388 = u_xlat2_;
    let _e390 = u_xlat3_;
    let _e392 = (_e388.xyz + _e390.yzw);
    u_xlat2_.x = _e392.x;
    u_xlat2_.y = _e392.y;
    u_xlat2_.z = _e392.z;
    let _e399 = u_xlat3_;
    let _e401 = u_xlat2_;
    let _e407 = max(_e401.xyz, vec3<f32>(0f, 0f, 0f));
    u_xlat3_.y = _e407.x;
    u_xlat3_.z = _e407.y;
    u_xlat3_.w = _e407.z;
    let _e414 = u_xlat3_;
    u_xlat21_ = dot(_e414, vec4<f32>(4f, 3f, 2f, 1f));
    let _e421 = u_xlat21_;
    u_xlat21_ = (-(_e421) + 4f);
    let _e425 = u_xlat21_;
    u_xlatu21_ = u32(_e425);
    let _e427 = u_xlatu21_;
    u_xlati21_ = (i32(_e427) << 2u);
    let _e432 = u_xlat2_;
    let _e434 = vs_TEXCOORD2_1;
    let _e436 = u_xlati21_;
    let _e441 = _f_buffer3_.f_cb3_[(_e436 + 1i)];
    let _e443 = (_e434.yyy * _e441.xyz);
    u_xlat2_.x = _e443.x;
    u_xlat2_.y = _e443.y;
    u_xlat2_.z = _e443.z;
    let _e450 = u_xlat2_;
    let _e452 = u_xlati21_;
    let _e455 = _f_buffer3_.f_cb3_[_e452];
    let _e457 = vs_TEXCOORD2_1;
    let _e460 = u_xlat2_;
    let _e462 = ((_e455.xyz * _e457.xxx) + _e460.xyz);
    u_xlat2_.x = _e462.x;
    u_xlat2_.y = _e462.y;
    u_xlat2_.z = _e462.z;
    let _e469 = u_xlat2_;
    let _e471 = u_xlati21_;
    let _e476 = _f_buffer3_.f_cb3_[(_e471 + 2i)];
    let _e478 = vs_TEXCOORD2_1;
    let _e481 = u_xlat2_;
    let _e483 = ((_e476.xyz * _e478.zzz) + _e481.xyz);
    u_xlat2_.x = _e483.x;
    u_xlat2_.y = _e483.y;
    u_xlat2_.z = _e483.z;
    let _e490 = u_xlat2_;
    let _e492 = u_xlat2_;
    let _e494 = u_xlati21_;
    let _e499 = _f_buffer3_.f_cb3_[(_e494 + 3i)];
    let _e501 = (_e492.xyz + _e499.xyz);
    u_xlat2_.x = _e501.x;
    u_xlat2_.y = _e501.y;
    u_xlat2_.z = _e501.z;
    let _e508 = vs_NORMAL0_1;
    let _e510 = vs_NORMAL0_1;
    u_xlat21_ = dot(_e508.xyz, _e510.xyz);
    let _e513 = u_xlat21_;
    u_xlat21_ = inverseSqrt(_e513);
    let _e515 = u_xlat3_;
    let _e517 = u_xlat21_;
    let _e519 = vs_NORMAL0_1;
    let _e521 = (vec3(_e517) * _e519.xyz);
    u_xlat3_.x = _e521.x;
    u_xlat3_.y = _e521.y;
    u_xlat3_.z = _e521.z;
    let _e528 = u_xlat2_;
    let _e529 = _e528.xy;
    let _e530 = u_xlat2_;
    txVec0_ = vec3<f32>(_e529.x, _e529.y, _e530.z);
    let _e536 = txVec0_;
    let _e540 = textureSampleCompareLevel(f_t0_, samplerf_s0_, _e536.xy, _e536.z);
    u_xlat21_ = _e540;
    let _e544 = _f_buffer3_.f_cb3_[27];
    u_xlat22_ = (-(_e544.x) + 1f);
    let _e549 = u_xlat21_;
    let _e553 = _f_buffer3_.f_cb3_[27];
    let _e556 = u_xlat22_;
    u_xlat21_ = ((_e549 * _e553.x) + _e556);
    let _e559 = u_xlat2_;
    u_xlatb22_ = (0f >= _e559.z);
    let _e563 = u_xlat2_;
    u_xlatb2_.x = (_e563.z >= 1f);
    let _e567 = u_xlatb22_;
    let _e568 = u_xlatb2_;
    u_xlatb22_ = (_e567 || _e568.x);
    let _e571 = u_xlatb22_;
    if _e571 {
        local_7 = 1f;
    } else {
        let _e573 = u_xlat21_;
        local_7 = _e573;
    }
    let _e575 = local_7;
    u_xlat21_ = _e575;
    let _e576 = u_xlat21_;
    let _e580 = _f_buffer2_.f_cb2_[11];
    u_xlat21_ = (_e576 * _e580.z);
    let _e583 = u_xlat2_;
    let _e585 = u_xlat21_;
    let _e590 = _f_buffer0_.f_cb0_[6];
    let _e592 = (vec3(_e585) * _e590.xyz);
    u_xlat2_.x = _e592.x;
    u_xlat2_.y = _e592.y;
    u_xlat2_.z = _e592.z;
    let _e599 = u_xlat3_;
    let _e604 = _f_buffer0_.f_cb0_[5];
    u_xlat21_ = dot(_e599.xyz, _e604.xyz);
    let _e607 = u_xlat21_;
    u_xlat21_ = clamp(_e607, 0f, 1f);
    let _e614 = _f_buffer0_.f_cb0_[10];
    let _e619 = _f_buffer2_.f_cb2_[11];
    u_xlat22_ = min(_e614.x, _e619.y);
    let _e622 = u_xlat22_;
    u_xlatu22_ = u32(i32(_e622));
    u_xlat4_.x = 0f;
    u_xlat4_.y = 0f;
    u_xlat4_.z = 0f;
    loop {
        let _e636 = u_xlatu_loop_1_;
        let _e637 = u_xlatu22_;
        if !((_e636 < _e637)) {
            break;
        }
        {
            let _e643 = u_xlatu_loop_1_;
            u_xlatu24_ = (_e643 >> 2u);
            let _e646 = u_xlatu_loop_1_;
            u_xlati25_ = i32((_e646 & 3u));
            let _e650 = u_xlatu24_;
            let _e656 = _f_buffer2_.f_cb2_[(i32(_e650) + 12i)];
            let _e657 = u_xlati25_;
            let _e661 = local_8[_e657];
            u_xlat24_ = dot(_e656, bitcast<vec4<f32>>(_e661));
            let _e664 = u_xlat24_;
            u_xlati24_ = i32(_e664);
            let _e666 = u_xlat5_;
            let _e668 = vs_TEXCOORD2_1;
            let _e671 = u_xlati24_;
            let _e674 = _f_buffer1_.f_cb1_[_e671];
            let _e677 = u_xlati24_;
            let _e680 = _f_buffer1_.f_cb1_[_e677];
            let _e682 = ((-(_e668.xyz) * _e674.www) + _e680.xyz);
            u_xlat5_.x = _e682.x;
            u_xlat5_.y = _e682.y;
            u_xlat5_.z = _e682.z;
            let _e689 = u_xlat5_;
            let _e691 = u_xlat5_;
            u_xlat25_ = dot(_e689.xyz, _e691.xyz);
            let _e694 = u_xlat25_;
            u_xlat25_ = max(_e694, 0.000061035156f);
            let _e697 = u_xlat25_;
            u_xlat26_ = inverseSqrt(_e697);
            let _e699 = u_xlat5_;
            let _e701 = u_xlat26_;
            let _e703 = u_xlat5_;
            let _e705 = (vec3(_e701) * _e703.xyz);
            u_xlat5_.x = _e705.x;
            u_xlat5_.y = _e705.y;
            u_xlat5_.z = _e705.z;
            let _e714 = u_xlati24_;
            let _e719 = _f_buffer1_.f_cb1_[(_e714 + 512i)];
            u_xlat26_ = (1f / _e719.x);
            let _e722 = u_xlat25_;
            u_xlat25_ = (_e722 * 25f);
            let _e725 = u_xlat25_;
            let _e726 = u_xlat26_;
            u_xlat25_ = (_e725 / _e726);
            let _e728 = u_xlat25_;
            u_xlat25_ = (_e728 + 1f);
            let _e733 = u_xlat25_;
            u_xlat25_ = (1f / _e733);
            let _e735 = u_xlati24_;
            let _e740 = _f_buffer1_.f_cb1_[(_e735 + 768i)];
            let _e742 = u_xlat5_;
            u_xlat26_ = dot(_e740.xyz, _e742.xyz);
            let _e745 = u_xlat26_;
            let _e746 = u_xlati24_;
            let _e751 = _f_buffer1_.f_cb1_[(_e746 + 512i)];
            let _e754 = u_xlati24_;
            let _e759 = _f_buffer1_.f_cb1_[(_e754 + 512i)];
            u_xlat26_ = ((_e745 * _e751.z) + _e759.w);
            let _e762 = u_xlat26_;
            u_xlat26_ = clamp(_e762, 0f, 1f);
            let _e766 = u_xlat26_;
            let _e767 = u_xlat26_;
            u_xlat26_ = (_e766 * _e767);
            let _e769 = u_xlat25_;
            let _e770 = u_xlat26_;
            u_xlat25_ = (_e769 * _e770);
            let _e772 = u_xlat6_;
            let _e774 = u_xlat25_;
            let _e776 = u_xlati24_;
            let _e781 = _f_buffer1_.f_cb1_[(_e776 + 256i)];
            let _e783 = (vec3(_e774) * _e781.xyz);
            u_xlat6_.x = _e783.x;
            u_xlat6_.y = _e783.y;
            u_xlat6_.z = _e783.z;
            let _e790 = u_xlat3_;
            let _e792 = u_xlat5_;
            u_xlat24_ = dot(_e790.xyz, _e792.xyz);
            let _e795 = u_xlat24_;
            u_xlat24_ = clamp(_e795, 0f, 1f);
            let _e799 = u_xlat4_;
            let _e801 = u_xlat6_;
            let _e803 = u_xlat24_;
            let _e806 = u_xlat4_;
            let _e808 = ((_e801.xyz * vec3(_e803)) + _e806.xyz);
            u_xlat4_.x = _e808.x;
            u_xlat4_.y = _e808.y;
            u_xlat4_.z = _e808.z;
        }
        continuing {
            let _e640 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e640 + 1u);
        }
    }
    let _e815 = u_xlat2_;
    let _e817 = u_xlat2_;
    let _e819 = u_xlat21_;
    let _e822 = u_xlat4_;
    let _e824 = ((_e817.xyz * vec3(_e819)) + _e822.xyz);
    u_xlat2_.x = _e824.x;
    u_xlat2_.y = _e824.y;
    u_xlat2_.z = _e824.z;
    let _e835 = _f_buffer2_.f_cb2_[27];
    u_xlat3_.x = abs(_e835.w);
    let _e842 = _f_buffer2_.f_cb2_[28];
    u_xlat3_.y = abs(_e842.w);
    let _e849 = _f_buffer2_.f_cb2_[29];
    u_xlat3_.z = abs(_e849.w);
    let _e852 = u_xlat3_;
    let _e854 = u_xlat3_;
    let _e856 = log2(_e854.xyz);
    u_xlat3_.x = _e856.x;
    u_xlat3_.y = _e856.y;
    u_xlat3_.z = _e856.z;
    let _e863 = u_xlat3_;
    let _e865 = u_xlat3_;
    let _e871 = (_e865.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat3_.x = _e871.x;
    u_xlat3_.y = _e871.y;
    u_xlat3_.z = _e871.z;
    let _e878 = u_xlat3_;
    let _e880 = u_xlat3_;
    let _e882 = exp2(_e880.xyz);
    u_xlat3_.x = _e882.x;
    u_xlat3_.y = _e882.y;
    u_xlat3_.z = _e882.z;
    let _e889 = u_xlat3_;
    let _e891 = u_xlat3_;
    let _e905 = ((_e891.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat3_.x = _e905.x;
    u_xlat3_.y = _e905.y;
    u_xlat3_.z = _e905.z;
    let _e912 = u_xlat3_;
    let _e914 = u_xlat3_;
    let _e920 = clamp(_e914.xyz, vec3(0f), vec3(1f));
    u_xlat3_.x = _e920.x;
    u_xlat3_.y = _e920.y;
    u_xlat3_.z = _e920.z;
    let _e927 = u_xlat2_;
    let _e929 = u_xlat2_;
    let _e931 = u_xlat3_;
    let _e933 = (_e929.xyz + _e931.xyz);
    u_xlat2_.x = _e933.x;
    u_xlat2_.y = _e933.y;
    u_xlat2_.z = _e933.z;
    let _e940 = u_xlat1_;
    let _e942 = u_xlat2_;
    let _e944 = u_xlat1_;
    let _e947 = u_xlat0_;
    let _e950 = ((_e942.xyz * _e944.xyz) + -(_e947.xyz));
    u_xlat1_.x = _e950.x;
    u_xlat1_.y = _e950.y;
    u_xlat1_.z = _e950.z;
    let _e957 = SV_TARGET0_;
    let _e962 = _f_buffer4_.f_cb4_[2];
    let _e964 = u_xlat1_;
    let _e967 = u_xlat0_;
    let _e969 = ((_e962.zzz * _e964.xyz) + _e967.xyz);
    SV_TARGET0_.x = _e969.x;
    SV_TARGET0_.y = _e969.y;
    SV_TARGET0_.z = _e969.z;
    SV_TARGET0_.w = 1f;
    return;
}

@fragment 
fn main(@location(12) vs_NORMAL0_: vec3<f32>, @location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec2<f32>, @location(2) vs_TEXCOORD2_: vec3<f32>) -> FragmentOutput {
    vs_NORMAL0_1 = vs_NORMAL0_;
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_TEXCOORD2_1 = vs_TEXCOORD2_;
    main_1();
    let _e55 = SV_TARGET0_;
    return FragmentOutput(_e55);
}
