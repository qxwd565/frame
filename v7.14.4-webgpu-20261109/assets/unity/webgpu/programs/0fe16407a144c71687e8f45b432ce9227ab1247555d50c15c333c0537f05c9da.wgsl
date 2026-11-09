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
var<private> vs_TEXCOORDindex3_1: vec4<f32>;
var<private> vs_NORMAL0_1: vec3<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlatb1_: bool = false;
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlatb2_: bool = false;
    var u_xlat3_: vec4<f32> = vec4(0f);
    var u_xlat4_: vec4<f32> = vec4(0f);
    var u_xlati4_: i32 = 0i;
    var u_xlatu4_: u32 = 0u;
    var u_xlatb4_: bool = false;
    var u_xlat5_: vec4<f32> = vec4(0f);
    var u_xlat7_: f32 = 0f;
    var u_xlatb8_: bool = false;
    var u_xlat10_: vec3<f32> = vec3(0f);
    var u_xlati10_: i32 = 0i;
    var u_xlat11_: f32 = 0f;
    var u_xlat19_: f32 = 0f;
    var u_xlat20_: f32 = 0f;
    var u_xlatu20_: u32 = 0u;
    var u_xlatu21_: u32 = 0u;
    var local: f32;
    var txVec0_: vec3<f32>;
    var local_1: f32;
    var u_xlatu_loop_1_: u32 = 0u;
    var local_2: array<vec4<u32>, 4> = ImmCB_0_;

    let _e98 = vs_TEXCOORD0_1;
    let _e103 = _f_buffer0_.f_cb0_[4];
    let _e108 = hscard_bias.values[1];
    let _e111 = textureSampleBias(f_t1_, samplerf_s1_, _e98.xy, (_e103.x + _e108.x));
    u_xlat0_ = _e111;
    let _e113 = vs_TEXCOORD0_1;
    let _e115 = dpdx(_e113.x);
    u_xlat1_.x = _e115;
    let _e116 = vs_TEXCOORD0_1;
    let _e118 = dpdy(_e116.x);
    u_xlat7_ = _e118;
    let _e120 = u_xlat7_;
    let _e122 = u_xlat1_;
    u_xlat1_.x = (abs(_e120) + abs(_e122.x));
    let _e127 = u_xlat1_;
    u_xlat2_.x = (_e127.x * 0.5f);
    u_xlat2_.y = 0f;
    let _e133 = u_xlat2_;
    let _e135 = vs_TEXCOORD0_1;
    u_xlat2_ = (_e133.xyxx + _e135.xyxy);
    let _e138 = u_xlat2_;
    let _e143 = _f_buffer0_.f_cb0_[4];
    let _e148 = hscard_bias.values[1];
    let _e151 = textureSampleBias(f_t1_, samplerf_s1_, _e138.xy, (_e143.x + _e148.x));
    u_xlat3_ = _e151;
    let _e152 = u_xlat0_;
    let _e153 = u_xlat3_;
    u_xlat0_ = (_e152 + _e153);
    u_xlat1_.y = 0f;
    let _e157 = u_xlat1_;
    let _e159 = vs_TEXCOORD0_1;
    u_xlat3_ = (_e157.xyyx + _e159.xyxy);
    let _e162 = u_xlat3_;
    let _e167 = _f_buffer0_.f_cb0_[4];
    let _e172 = hscard_bias.values[1];
    let _e175 = textureSampleBias(f_t1_, samplerf_s1_, _e162.xy, (_e167.x + _e172.x));
    u_xlat4_ = _e175;
    let _e176 = u_xlat0_;
    let _e177 = u_xlat4_;
    u_xlat0_ = (_e176 + _e177);
    let _e179 = u_xlat1_;
    let _e181 = u_xlat1_;
    let _e186 = (_e181.xx * vec2<f32>(0.5f, 0.5f));
    u_xlat1_.z = _e186.x;
    u_xlat1_.w = _e186.y;
    let _e191 = u_xlat1_;
    let _e193 = vs_TEXCOORD0_1;
    u_xlat4_ = (_e191.yzxz + _e193.xyxy);
    let _e196 = u_xlat4_;
    let _e201 = _f_buffer0_.f_cb0_[4];
    let _e206 = hscard_bias.values[1];
    let _e209 = textureSampleBias(f_t1_, samplerf_s1_, _e196.xy, (_e201.x + _e206.x));
    u_xlat5_ = _e209;
    let _e210 = u_xlat0_;
    let _e211 = u_xlat5_;
    u_xlat0_ = (_e210 + _e211);
    let _e213 = u_xlat2_;
    let _e218 = _f_buffer0_.f_cb0_[4];
    let _e223 = hscard_bias.values[1];
    let _e226 = textureSampleBias(f_t1_, samplerf_s1_, _e213.zw, (_e218.x + _e223.x));
    u_xlat2_ = _e226;
    let _e227 = u_xlat0_;
    let _e228 = u_xlat2_;
    u_xlat0_ = (_e227 + _e228);
    let _e230 = u_xlat4_;
    let _e235 = _f_buffer0_.f_cb0_[4];
    let _e240 = hscard_bias.values[1];
    let _e243 = textureSampleBias(f_t1_, samplerf_s1_, _e230.zw, (_e235.x + _e240.x));
    u_xlat2_ = _e243;
    let _e244 = u_xlat0_;
    let _e245 = u_xlat2_;
    u_xlat0_ = (_e244 + _e245);
    let _e247 = u_xlat3_;
    let _e252 = _f_buffer0_.f_cb0_[4];
    let _e257 = hscard_bias.values[1];
    let _e260 = textureSampleBias(f_t1_, samplerf_s1_, _e247.zw, (_e252.x + _e257.x));
    u_xlat2_ = _e260;
    let _e261 = u_xlat0_;
    let _e262 = u_xlat2_;
    u_xlat0_ = (_e261 + _e262);
    let _e264 = u_xlat1_;
    let _e266 = vs_TEXCOORD0_1;
    u_xlat1_ = (_e264.wxxx + _e266.xyxy);
    let _e269 = u_xlat1_;
    let _e274 = _f_buffer0_.f_cb0_[4];
    let _e279 = hscard_bias.values[1];
    let _e282 = textureSampleBias(f_t1_, samplerf_s1_, _e269.xy, (_e274.x + _e279.x));
    u_xlat2_ = _e282;
    let _e283 = u_xlat0_;
    let _e284 = u_xlat2_;
    u_xlat0_ = (_e283 + _e284);
    let _e286 = u_xlat1_;
    let _e291 = _f_buffer0_.f_cb0_[4];
    let _e296 = hscard_bias.values[1];
    let _e299 = textureSampleBias(f_t1_, samplerf_s1_, _e286.zw, (_e291.x + _e296.x));
    u_xlat1_ = _e299;
    let _e300 = u_xlat0_;
    let _e301 = u_xlat1_;
    u_xlat0_ = (_e300 + _e301);
    let _e303 = u_xlat0_;
    u_xlat0_ = (_e303 * vec4<f32>(0.11111111f, 0.11111111f, 0.11111111f, 0.11111111f));
    let _e314 = _f_buffer4_.f_cb4_[1];
    u_xlatb1_ = (0f < _e314.x);
    let _e317 = u_xlatb1_;
    if _e317 {
        {
            let _e318 = vs_TEXCOORD5_1;
            let _e323 = _f_buffer0_.f_cb0_[4];
            let _e328 = hscard_bias.values[2];
            let _e331 = textureSampleBias(f_t2_, samplerf_s2_, _e318.xy, (_e323.x + _e328.x));
            u_xlat1_ = _e331;
            let _e335 = _f_buffer4_.f_cb4_[3];
            let _e337 = u_xlat1_;
            u_xlatb1_ = (_e335.x < _e337.x);
            let _e341 = u_xlatb1_;
            if _e341 {
                local = 1f;
            } else {
                local = 0f;
            }
            let _e346 = local;
            u_xlat1_.x = _e346;
            let _e348 = u_xlat0_;
            let _e350 = u_xlat1_;
            u_xlat0_.w = (_e348.w * _e350.x);
        }
    }
    let _e354 = vs_NORMAL0_1;
    let _e356 = vs_NORMAL0_1;
    u_xlat1_.x = dot(_e354.xyz, _e356.xyz);
    let _e360 = u_xlat1_;
    u_xlat1_.x = inverseSqrt(_e360.x);
    let _e363 = u_xlat1_;
    let _e365 = u_xlat1_;
    let _e367 = vs_NORMAL0_1;
    let _e369 = (_e365.xxx * _e367.xyz);
    u_xlat1_.x = _e369.x;
    u_xlat1_.y = _e369.y;
    u_xlat1_.z = _e369.z;
    let _e376 = vs_TEXCOORDindex3_1;
    let _e377 = _e376.xy;
    let _e378 = vs_TEXCOORDindex3_1;
    txVec0_ = vec3<f32>(_e377.x, _e377.y, _e378.z);
    let _e384 = txVec0_;
    let _e388 = textureSampleCompareLevel(f_t0_, samplerf_s0_, _e384.xy, _e384.z);
    u_xlat19_ = _e388;
    let _e393 = _f_buffer3_.f_cb3_[27];
    u_xlat2_.x = (-(_e393.x) + 1f);
    let _e398 = u_xlat19_;
    let _e402 = _f_buffer3_.f_cb3_[27];
    let _e405 = u_xlat2_;
    u_xlat19_ = ((_e398 * _e402.x) + _e405.x);
    let _e409 = vs_TEXCOORDindex3_1;
    u_xlatb2_ = (0f >= _e409.z);
    let _e412 = vs_TEXCOORDindex3_1;
    u_xlatb8_ = (_e412.z >= 1f);
    let _e416 = u_xlatb8_;
    let _e417 = u_xlatb2_;
    u_xlatb2_ = (_e416 || _e417);
    let _e419 = u_xlatb2_;
    if _e419 {
        local_1 = 1f;
    } else {
        let _e421 = u_xlat19_;
        local_1 = _e421;
    }
    let _e423 = local_1;
    u_xlat19_ = _e423;
    let _e424 = u_xlat19_;
    let _e428 = _f_buffer2_.f_cb2_[11];
    u_xlat19_ = (_e424 * _e428.z);
    let _e431 = u_xlat2_;
    let _e433 = u_xlat19_;
    let _e438 = _f_buffer0_.f_cb0_[6];
    let _e440 = (vec3(_e433) * _e438.xyz);
    u_xlat2_.x = _e440.x;
    u_xlat2_.y = _e440.y;
    u_xlat2_.z = _e440.z;
    let _e447 = u_xlat1_;
    let _e452 = _f_buffer0_.f_cb0_[5];
    u_xlat19_ = dot(_e447.xyz, _e452.xyz);
    let _e455 = u_xlat19_;
    u_xlat19_ = clamp(_e455, 0f, 1f);
    let _e462 = _f_buffer0_.f_cb0_[10];
    let _e467 = _f_buffer2_.f_cb2_[11];
    u_xlat20_ = min(_e462.x, _e467.y);
    let _e470 = u_xlat20_;
    u_xlatu20_ = u32(i32(_e470));
    u_xlat3_.x = 0f;
    u_xlat3_.y = 0f;
    u_xlat3_.z = 0f;
    loop {
        let _e485 = u_xlatu_loop_1_;
        let _e486 = u_xlatu20_;
        if !((_e485 < _e486)) {
            break;
        }
        {
            let _e492 = u_xlatu_loop_1_;
            u_xlatu4_ = (_e492 >> 2u);
            let _e495 = u_xlatu_loop_1_;
            u_xlati10_ = i32((_e495 & 3u));
            let _e500 = u_xlatu4_;
            let _e506 = _f_buffer2_.f_cb2_[(i32(_e500) + 12i)];
            let _e507 = u_xlati10_;
            let _e511 = local_2[_e507];
            u_xlat4_.x = dot(_e506, bitcast<vec4<f32>>(_e511));
            let _e514 = u_xlat4_;
            u_xlati4_ = i32(_e514.x);
            let _e517 = u_xlat10_;
            let _e519 = vs_TEXCOORD1_1;
            let _e522 = u_xlati4_;
            let _e525 = _f_buffer1_.f_cb1_[_e522];
            let _e528 = u_xlati4_;
            let _e531 = _f_buffer1_.f_cb1_[_e528];
            let _e533 = ((-(_e519.xyz) * _e525.www) + _e531.xyz);
            u_xlat10_.x = _e533.x;
            u_xlat10_.y = _e533.y;
            u_xlat10_.z = _e533.z;
            let _e541 = u_xlat10_;
            let _e543 = u_xlat10_;
            u_xlat5_.x = dot(_e541.xyz, _e543.xyz);
            let _e547 = u_xlat5_;
            u_xlat5_.x = max(_e547.x, 0.000061035156f);
            let _e551 = u_xlat5_;
            u_xlat11_ = inverseSqrt(_e551.x);
            let _e554 = u_xlat10_;
            let _e556 = u_xlat10_;
            let _e558 = u_xlat11_;
            let _e560 = (_e556.xyz * vec3(_e558));
            u_xlat10_.x = _e560.x;
            u_xlat10_.y = _e560.y;
            u_xlat10_.z = _e560.z;
            let _e569 = u_xlati4_;
            let _e574 = _f_buffer1_.f_cb1_[(_e569 + 512i)];
            u_xlat11_ = (1f / _e574.x);
            let _e578 = u_xlat5_;
            u_xlat5_.x = (_e578.x * 25f);
            let _e583 = u_xlat5_;
            let _e585 = u_xlat11_;
            u_xlat5_.x = (_e583.x / _e585);
            let _e588 = u_xlat5_;
            u_xlat5_.x = (_e588.x + 1f);
            let _e595 = u_xlat5_;
            u_xlat5_.x = (1f / _e595.x);
            let _e598 = u_xlati4_;
            let _e603 = _f_buffer1_.f_cb1_[(_e598 + 768i)];
            let _e605 = u_xlat10_;
            u_xlat11_ = dot(_e603.xyz, _e605.xyz);
            let _e608 = u_xlat11_;
            let _e609 = u_xlati4_;
            let _e614 = _f_buffer1_.f_cb1_[(_e609 + 512i)];
            let _e617 = u_xlati4_;
            let _e622 = _f_buffer1_.f_cb1_[(_e617 + 512i)];
            u_xlat11_ = ((_e608 * _e614.z) + _e622.w);
            let _e625 = u_xlat11_;
            u_xlat11_ = clamp(_e625, 0f, 1f);
            let _e629 = u_xlat11_;
            let _e630 = u_xlat11_;
            u_xlat11_ = (_e629 * _e630);
            let _e633 = u_xlat11_;
            let _e634 = u_xlat5_;
            u_xlat5_.x = (_e633 * _e634.x);
            let _e637 = u_xlat5_;
            let _e639 = u_xlat5_;
            let _e641 = u_xlati4_;
            let _e646 = _f_buffer1_.f_cb1_[(_e641 + 256i)];
            let _e648 = (_e639.xxx * _e646.xyz);
            u_xlat5_.x = _e648.x;
            u_xlat5_.y = _e648.y;
            u_xlat5_.z = _e648.z;
            let _e656 = u_xlat1_;
            let _e658 = u_xlat10_;
            u_xlat4_.x = dot(_e656.xyz, _e658.xyz);
            let _e662 = u_xlat4_;
            u_xlat4_.x = clamp(_e662.x, 0f, 1f);
            let _e667 = u_xlat3_;
            let _e669 = u_xlat5_;
            let _e671 = u_xlat4_;
            let _e674 = u_xlat3_;
            let _e676 = ((_e669.xyz * _e671.xxx) + _e674.xyz);
            u_xlat3_.x = _e676.x;
            u_xlat3_.y = _e676.y;
            u_xlat3_.z = _e676.z;
        }
        continuing {
            let _e489 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e489 + 1u);
        }
    }
    let _e683 = u_xlat1_;
    let _e685 = u_xlat2_;
    let _e687 = u_xlat19_;
    let _e690 = u_xlat3_;
    let _e692 = ((_e685.xyz * vec3(_e687)) + _e690.xyz);
    u_xlat1_.x = _e692.x;
    u_xlat1_.y = _e692.y;
    u_xlat1_.z = _e692.z;
    let _e703 = _f_buffer2_.f_cb2_[27];
    u_xlat2_.x = abs(_e703.w);
    let _e710 = _f_buffer2_.f_cb2_[28];
    u_xlat2_.y = abs(_e710.w);
    let _e717 = _f_buffer2_.f_cb2_[29];
    u_xlat2_.z = abs(_e717.w);
    let _e720 = u_xlat2_;
    let _e722 = u_xlat2_;
    let _e724 = log2(_e722.xyz);
    u_xlat2_.x = _e724.x;
    u_xlat2_.y = _e724.y;
    u_xlat2_.z = _e724.z;
    let _e731 = u_xlat2_;
    let _e733 = u_xlat2_;
    let _e739 = (_e733.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat2_.x = _e739.x;
    u_xlat2_.y = _e739.y;
    u_xlat2_.z = _e739.z;
    let _e746 = u_xlat2_;
    let _e748 = u_xlat2_;
    let _e750 = exp2(_e748.xyz);
    u_xlat2_.x = _e750.x;
    u_xlat2_.y = _e750.y;
    u_xlat2_.z = _e750.z;
    let _e757 = u_xlat2_;
    let _e759 = u_xlat2_;
    let _e773 = ((_e759.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat2_.x = _e773.x;
    u_xlat2_.y = _e773.y;
    u_xlat2_.z = _e773.z;
    let _e780 = u_xlat2_;
    let _e782 = u_xlat2_;
    let _e788 = clamp(_e782.xyz, vec3(0f), vec3(1f));
    u_xlat2_.x = _e788.x;
    u_xlat2_.y = _e788.y;
    u_xlat2_.z = _e788.z;
    let _e795 = u_xlat1_;
    let _e797 = u_xlat1_;
    let _e799 = u_xlat2_;
    let _e801 = (_e797.xyz + _e799.xyz);
    u_xlat1_.x = _e801.x;
    u_xlat1_.y = _e801.y;
    u_xlat1_.z = _e801.z;
    let _e808 = u_xlat1_;
    let _e810 = u_xlat0_;
    let _e812 = u_xlat1_;
    let _e814 = (_e810.xyz * _e812.xyz);
    u_xlat1_.x = _e814.x;
    u_xlat1_.y = _e814.y;
    u_xlat1_.z = _e814.z;
    let _e821 = u_xlat0_;
    let _e823 = u_xlat0_;
    let _e825 = u_xlat1_;
    let _e827 = (_e823.www * _e825.xyz);
    u_xlat0_.x = _e827.x;
    u_xlat0_.y = _e827.y;
    u_xlat0_.z = _e827.z;
    let _e834 = u_xlat0_;
    SV_Target0_ = _e834;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(5) vs_TEXCOORD5_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec3<f32>, @location(3) vs_TEXCOORDindex3_: vec4<f32>, @location(12) vs_NORMAL0_: vec3<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD5_1 = vs_TEXCOORD5_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_TEXCOORDindex3_1 = vs_TEXCOORDindex3_;
    vs_NORMAL0_1 = vs_NORMAL0_;
    main_1();
    let _e55 = SV_Target0_;
    return FragmentOutput(_e55);
}
