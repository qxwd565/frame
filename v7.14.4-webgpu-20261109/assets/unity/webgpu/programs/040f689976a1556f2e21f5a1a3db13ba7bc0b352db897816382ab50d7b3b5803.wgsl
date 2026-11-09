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
    let _e124 = _f_buffer4_.f_cb4_[1];
    u_xlatb1_.x = (0f < _e124.x);
    let _e127 = u_xlatb1_;
    if _e127.x {
        {
            let _e129 = vs_TEXCOORD5_1;
            let _e134 = _f_buffer0_.f_cb0_[4];
            let _e139 = hscard_bias.values[2];
            let _e142 = textureSampleBias(f_t2_, samplerf_s2_, _e129.xy, (_e134.x + _e139.x));
            u_xlat1_ = _e142;
            let _e147 = _f_buffer4_.f_cb4_[3];
            let _e149 = u_xlat1_;
            u_xlatb1_.x = (_e147.x < _e149.x);
            let _e153 = u_xlatb1_;
            if _e153.x {
                local = 1f;
            } else {
                local = 0f;
            }
            let _e159 = local;
            u_xlat1_.x = _e159;
            let _e161 = u_xlat0_;
            let _e163 = u_xlat1_;
            u_xlat0_.w = (_e161.w * _e163.x);
        }
    }
    let _e166 = u_xlat1_;
    let _e168 = vs_TEXCOORD1_1;
    let _e173 = _f_buffer3_.f_cb3_[20];
    let _e176 = (_e168.xyz + -(_e173.xyz));
    u_xlat1_.x = _e176.x;
    u_xlat1_.y = _e176.y;
    u_xlat1_.z = _e176.z;
    let _e183 = u_xlat2_;
    let _e185 = vs_TEXCOORD1_1;
    let _e190 = _f_buffer3_.f_cb3_[21];
    let _e193 = (_e185.xyz + -(_e190.xyz));
    u_xlat2_.x = _e193.x;
    u_xlat2_.y = _e193.y;
    u_xlat2_.z = _e193.z;
    let _e200 = u_xlat3_;
    let _e202 = vs_TEXCOORD1_1;
    let _e207 = _f_buffer3_.f_cb3_[22];
    let _e210 = (_e202.xyz + -(_e207.xyz));
    u_xlat3_.x = _e210.x;
    u_xlat3_.y = _e210.y;
    u_xlat3_.z = _e210.z;
    let _e217 = u_xlat4_;
    let _e219 = vs_TEXCOORD1_1;
    let _e224 = _f_buffer3_.f_cb3_[23];
    let _e227 = (_e219.xyz + -(_e224.xyz));
    u_xlat4_.x = _e227.x;
    u_xlat4_.y = _e227.y;
    u_xlat4_.z = _e227.z;
    let _e235 = u_xlat1_;
    let _e237 = u_xlat1_;
    u_xlat1_.x = dot(_e235.xyz, _e237.xyz);
    let _e241 = u_xlat2_;
    let _e243 = u_xlat2_;
    u_xlat1_.y = dot(_e241.xyz, _e243.xyz);
    let _e247 = u_xlat3_;
    let _e249 = u_xlat3_;
    u_xlat1_.z = dot(_e247.xyz, _e249.xyz);
    let _e253 = u_xlat4_;
    let _e255 = u_xlat4_;
    u_xlat1_.w = dot(_e253.xyz, _e255.xyz);
    let _e258 = u_xlat1_;
    let _e262 = _f_buffer3_.f_cb3_[24];
    u_xlatb1_ = (_e258 < _e262);
    let _e265 = u_xlatb1_;
    if _e265.x {
        local_1 = 1f;
    } else {
        local_1 = 0f;
    }
    let _e271 = local_1;
    u_xlat2_.x = _e271;
    let _e273 = u_xlatb1_;
    if _e273.y {
        local_2 = 1f;
    } else {
        local_2 = 0f;
    }
    let _e279 = local_2;
    u_xlat2_.y = _e279;
    let _e281 = u_xlatb1_;
    if _e281.z {
        local_3 = 1f;
    } else {
        local_3 = 0f;
    }
    let _e287 = local_3;
    u_xlat2_.z = _e287;
    let _e289 = u_xlatb1_;
    if _e289.w {
        local_4 = 1f;
    } else {
        local_4 = 0f;
    }
    let _e295 = local_4;
    u_xlat2_.w = _e295;
    let _e297 = u_xlatb1_;
    if _e297.x {
        local_5 = -1f;
    } else {
        local_5 = -0f;
    }
    let _e306 = local_5;
    u_xlat1_.x = _e306;
    let _e308 = u_xlatb1_;
    if _e308.y {
        local_6 = -1f;
    } else {
        local_6 = -0f;
    }
    let _e317 = local_6;
    u_xlat1_.y = _e317;
    let _e319 = u_xlatb1_;
    if _e319.z {
        local_7 = -1f;
    } else {
        local_7 = -0f;
    }
    let _e328 = local_7;
    u_xlat1_.z = _e328;
    let _e329 = u_xlat1_;
    let _e331 = u_xlat1_;
    let _e333 = u_xlat2_;
    let _e335 = (_e331.xyz + _e333.yzw);
    u_xlat1_.x = _e335.x;
    u_xlat1_.y = _e335.y;
    u_xlat1_.z = _e335.z;
    let _e342 = u_xlat2_;
    let _e344 = u_xlat1_;
    let _e350 = max(_e344.xyz, vec3<f32>(0f, 0f, 0f));
    u_xlat2_.y = _e350.x;
    u_xlat2_.z = _e350.y;
    u_xlat2_.w = _e350.z;
    let _e358 = u_xlat2_;
    u_xlat1_.x = dot(_e358, vec4<f32>(4f, 3f, 2f, 1f));
    let _e366 = u_xlat1_;
    u_xlat1_.x = (-(_e366.x) + 4f);
    let _e371 = u_xlat1_;
    u_xlatu1_ = u32(_e371.x);
    let _e374 = u_xlatu1_;
    u_xlati1_ = (i32(_e374) << 2u);
    let _e379 = u_xlat7_;
    let _e381 = vs_TEXCOORD1_1;
    let _e383 = u_xlati1_;
    let _e388 = _f_buffer3_.f_cb3_[(_e383 + 1i)];
    let _e390 = (_e381.yyy * _e388.xyz);
    u_xlat7_.x = _e390.x;
    u_xlat7_.y = _e390.y;
    u_xlat7_.z = _e390.z;
    let _e397 = u_xlat7_;
    let _e399 = u_xlati1_;
    let _e402 = _f_buffer3_.f_cb3_[_e399];
    let _e404 = vs_TEXCOORD1_1;
    let _e407 = u_xlat7_;
    let _e409 = ((_e402.xyz * _e404.xxx) + _e407.xyz);
    u_xlat7_.x = _e409.x;
    u_xlat7_.y = _e409.y;
    u_xlat7_.z = _e409.z;
    let _e416 = u_xlat7_;
    let _e418 = u_xlati1_;
    let _e423 = _f_buffer3_.f_cb3_[(_e418 + 2i)];
    let _e425 = vs_TEXCOORD1_1;
    let _e428 = u_xlat7_;
    let _e430 = ((_e423.xyz * _e425.zzz) + _e428.xyz);
    u_xlat7_.x = _e430.x;
    u_xlat7_.y = _e430.y;
    u_xlat7_.z = _e430.z;
    let _e437 = u_xlat1_;
    let _e439 = u_xlat7_;
    let _e441 = u_xlati1_;
    let _e446 = _f_buffer3_.f_cb3_[(_e441 + 3i)];
    let _e448 = (_e439.xyz + _e446.xyz);
    u_xlat1_.x = _e448.x;
    u_xlat1_.y = _e448.y;
    u_xlat1_.z = _e448.z;
    let _e455 = vs_NORMAL0_1;
    let _e457 = vs_NORMAL0_1;
    u_xlat19_ = dot(_e455.xyz, _e457.xyz);
    let _e460 = u_xlat19_;
    u_xlat19_ = inverseSqrt(_e460);
    let _e462 = u_xlat2_;
    let _e464 = u_xlat19_;
    let _e466 = vs_NORMAL0_1;
    let _e468 = (vec3(_e464) * _e466.xyz);
    u_xlat2_.x = _e468.x;
    u_xlat2_.y = _e468.y;
    u_xlat2_.z = _e468.z;
    let _e475 = u_xlat1_;
    let _e476 = _e475.xy;
    let _e477 = u_xlat1_;
    txVec0_ = vec3<f32>(_e476.x, _e476.y, _e477.z);
    let _e484 = txVec0_;
    let _e488 = textureSampleCompareLevel(f_t0_, samplerf_s0_, _e484.xy, _e484.z);
    u_xlat1_.x = _e488;
    let _e493 = _f_buffer3_.f_cb3_[27];
    u_xlat7_.x = (-(_e493.x) + 1f);
    let _e499 = u_xlat1_;
    let _e504 = _f_buffer3_.f_cb3_[27];
    let _e507 = u_xlat7_;
    u_xlat1_.x = ((_e499.x * _e504.x) + _e507.x);
    let _e511 = u_xlat1_;
    u_xlatb7_ = (0f >= _e511.z);
    let _e514 = u_xlat1_;
    u_xlatb13_ = (_e514.z >= 1f);
    let _e518 = u_xlatb13_;
    let _e519 = u_xlatb7_;
    u_xlatb7_ = (_e518 || _e519);
    let _e522 = u_xlatb7_;
    if _e522 {
        local_8 = 1f;
    } else {
        let _e524 = u_xlat1_;
        local_8 = _e524.x;
    }
    let _e527 = local_8;
    u_xlat1_.x = _e527;
    let _e529 = u_xlat1_;
    let _e534 = _f_buffer2_.f_cb2_[11];
    u_xlat1_.x = (_e529.x * _e534.z);
    let _e537 = u_xlat1_;
    let _e539 = u_xlat1_;
    let _e544 = _f_buffer0_.f_cb0_[6];
    let _e546 = (_e539.xxx * _e544.xyz);
    u_xlat1_.x = _e546.x;
    u_xlat1_.y = _e546.y;
    u_xlat1_.z = _e546.z;
    let _e553 = u_xlat2_;
    let _e558 = _f_buffer0_.f_cb0_[5];
    u_xlat19_ = dot(_e553.xyz, _e558.xyz);
    let _e561 = u_xlat19_;
    u_xlat19_ = clamp(_e561, 0f, 1f);
    let _e568 = _f_buffer0_.f_cb0_[10];
    let _e573 = _f_buffer2_.f_cb2_[11];
    u_xlat20_ = min(_e568.x, _e573.y);
    let _e576 = u_xlat20_;
    u_xlatu20_ = u32(i32(_e576));
    u_xlat3_.x = 0f;
    u_xlat3_.y = 0f;
    u_xlat3_.z = 0f;
    loop {
        let _e591 = u_xlatu_loop_1_;
        let _e592 = u_xlatu20_;
        if !((_e591 < _e592)) {
            break;
        }
        {
            let _e598 = u_xlatu_loop_1_;
            u_xlatu4_ = (_e598 >> 2u);
            let _e601 = u_xlatu_loop_1_;
            u_xlati10_ = i32((_e601 & 3u));
            let _e606 = u_xlatu4_;
            let _e612 = _f_buffer2_.f_cb2_[(i32(_e606) + 12i)];
            let _e613 = u_xlati10_;
            let _e617 = local_9[_e613];
            u_xlat4_.x = dot(_e612, bitcast<vec4<f32>>(_e617));
            let _e620 = u_xlat4_;
            u_xlati4_ = i32(_e620.x);
            let _e623 = u_xlat10_;
            let _e625 = vs_TEXCOORD1_1;
            let _e628 = u_xlati4_;
            let _e631 = _f_buffer1_.f_cb1_[_e628];
            let _e634 = u_xlati4_;
            let _e637 = _f_buffer1_.f_cb1_[_e634];
            let _e639 = ((-(_e625.xyz) * _e631.www) + _e637.xyz);
            u_xlat10_.x = _e639.x;
            u_xlat10_.y = _e639.y;
            u_xlat10_.z = _e639.z;
            let _e647 = u_xlat10_;
            let _e649 = u_xlat10_;
            u_xlat5_.x = dot(_e647.xyz, _e649.xyz);
            let _e653 = u_xlat5_;
            u_xlat5_.x = max(_e653.x, 0.000061035156f);
            let _e657 = u_xlat5_;
            u_xlat11_ = inverseSqrt(_e657.x);
            let _e660 = u_xlat10_;
            let _e662 = u_xlat10_;
            let _e664 = u_xlat11_;
            let _e666 = (_e662.xyz * vec3(_e664));
            u_xlat10_.x = _e666.x;
            u_xlat10_.y = _e666.y;
            u_xlat10_.z = _e666.z;
            let _e675 = u_xlati4_;
            let _e680 = _f_buffer1_.f_cb1_[(_e675 + 512i)];
            u_xlat11_ = (1f / _e680.x);
            let _e684 = u_xlat5_;
            u_xlat5_.x = (_e684.x * 25f);
            let _e689 = u_xlat5_;
            let _e691 = u_xlat11_;
            u_xlat5_.x = (_e689.x / _e691);
            let _e694 = u_xlat5_;
            u_xlat5_.x = (_e694.x + 1f);
            let _e701 = u_xlat5_;
            u_xlat5_.x = (1f / _e701.x);
            let _e704 = u_xlati4_;
            let _e709 = _f_buffer1_.f_cb1_[(_e704 + 768i)];
            let _e711 = u_xlat10_;
            u_xlat11_ = dot(_e709.xyz, _e711.xyz);
            let _e714 = u_xlat11_;
            let _e715 = u_xlati4_;
            let _e720 = _f_buffer1_.f_cb1_[(_e715 + 512i)];
            let _e723 = u_xlati4_;
            let _e728 = _f_buffer1_.f_cb1_[(_e723 + 512i)];
            u_xlat11_ = ((_e714 * _e720.z) + _e728.w);
            let _e731 = u_xlat11_;
            u_xlat11_ = clamp(_e731, 0f, 1f);
            let _e735 = u_xlat11_;
            let _e736 = u_xlat11_;
            u_xlat11_ = (_e735 * _e736);
            let _e739 = u_xlat11_;
            let _e740 = u_xlat5_;
            u_xlat5_.x = (_e739 * _e740.x);
            let _e743 = u_xlat5_;
            let _e745 = u_xlat5_;
            let _e747 = u_xlati4_;
            let _e752 = _f_buffer1_.f_cb1_[(_e747 + 256i)];
            let _e754 = (_e745.xxx * _e752.xyz);
            u_xlat5_.x = _e754.x;
            u_xlat5_.y = _e754.y;
            u_xlat5_.z = _e754.z;
            let _e762 = u_xlat2_;
            let _e764 = u_xlat10_;
            u_xlat4_.x = dot(_e762.xyz, _e764.xyz);
            let _e768 = u_xlat4_;
            u_xlat4_.x = clamp(_e768.x, 0f, 1f);
            let _e773 = u_xlat3_;
            let _e775 = u_xlat5_;
            let _e777 = u_xlat4_;
            let _e780 = u_xlat3_;
            let _e782 = ((_e775.xyz * _e777.xxx) + _e780.xyz);
            u_xlat3_.x = _e782.x;
            u_xlat3_.y = _e782.y;
            u_xlat3_.z = _e782.z;
        }
        continuing {
            let _e595 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e595 + 1u);
        }
    }
    let _e789 = u_xlat1_;
    let _e791 = u_xlat1_;
    let _e793 = u_xlat19_;
    let _e796 = u_xlat3_;
    let _e798 = ((_e791.xyz * vec3(_e793)) + _e796.xyz);
    u_xlat1_.x = _e798.x;
    u_xlat1_.y = _e798.y;
    u_xlat1_.z = _e798.z;
    let _e809 = _f_buffer2_.f_cb2_[27];
    u_xlat2_.x = abs(_e809.w);
    let _e816 = _f_buffer2_.f_cb2_[28];
    u_xlat2_.y = abs(_e816.w);
    let _e823 = _f_buffer2_.f_cb2_[29];
    u_xlat2_.z = abs(_e823.w);
    let _e826 = u_xlat2_;
    let _e828 = u_xlat2_;
    let _e830 = log2(_e828.xyz);
    u_xlat2_.x = _e830.x;
    u_xlat2_.y = _e830.y;
    u_xlat2_.z = _e830.z;
    let _e837 = u_xlat2_;
    let _e839 = u_xlat2_;
    let _e845 = (_e839.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat2_.x = _e845.x;
    u_xlat2_.y = _e845.y;
    u_xlat2_.z = _e845.z;
    let _e852 = u_xlat2_;
    let _e854 = u_xlat2_;
    let _e856 = exp2(_e854.xyz);
    u_xlat2_.x = _e856.x;
    u_xlat2_.y = _e856.y;
    u_xlat2_.z = _e856.z;
    let _e863 = u_xlat2_;
    let _e865 = u_xlat2_;
    let _e879 = ((_e865.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat2_.x = _e879.x;
    u_xlat2_.y = _e879.y;
    u_xlat2_.z = _e879.z;
    let _e886 = u_xlat2_;
    let _e888 = u_xlat2_;
    let _e894 = clamp(_e888.xyz, vec3(0f), vec3(1f));
    u_xlat2_.x = _e894.x;
    u_xlat2_.y = _e894.y;
    u_xlat2_.z = _e894.z;
    let _e901 = u_xlat1_;
    let _e903 = u_xlat1_;
    let _e905 = u_xlat2_;
    let _e907 = (_e903.xyz + _e905.xyz);
    u_xlat1_.x = _e907.x;
    u_xlat1_.y = _e907.y;
    u_xlat1_.z = _e907.z;
    let _e914 = u_xlat1_;
    let _e916 = u_xlat0_;
    let _e918 = u_xlat1_;
    let _e920 = (_e916.xyz * _e918.xyz);
    u_xlat1_.x = _e920.x;
    u_xlat1_.y = _e920.y;
    u_xlat1_.z = _e920.z;
    let _e927 = u_xlat0_;
    let _e929 = u_xlat0_;
    let _e931 = u_xlat1_;
    let _e933 = (_e929.www * _e931.xyz);
    u_xlat0_.x = _e933.x;
    u_xlat0_.y = _e933.y;
    u_xlat0_.z = _e933.z;
    let _e940 = u_xlat0_;
    SV_Target0_ = _e940;
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
