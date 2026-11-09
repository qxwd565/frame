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
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec3<f32> = vec3(0f);
    var u_xlat3_: vec4<f32> = vec4(0f);
    var u_xlatb3_: vec3<bool> = vec3(false);
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlat5_: vec3<f32> = vec3(0f);
    var u_xlat6_: vec3<f32> = vec3(0f);
    var u_xlat7_: vec3<f32> = vec3(0f);
    var u_xlatb7_: bool = false;
    var u_xlat22_: f32 = 0f;
    var u_xlatu22_: u32 = 0u;
    var u_xlat23_: f32 = 0f;
    var u_xlatu23_: u32 = 0u;
    var u_xlatb23_: bool = false;
    var u_xlat24_: f32 = 0f;
    var u_xlati24_: i32 = 0i;
    var u_xlatu24_: u32 = 0u;
    var u_xlatb24_: bool = false;
    var u_xlat25_: f32 = 0f;
    var u_xlati25_: i32 = 0i;
    var u_xlat26_: f32 = 0f;
    var hlslcc_movcTemp: vec3<f32>;
    var local: f32;
    var local_1: f32;
    var local_2: f32;
    var txVec0_: vec3<f32>;
    var local_3: f32;
    var u_xlatu_loop_1_: u32 = 0u;
    var local_4: array<vec4<u32>, 4> = ImmCB_0_;
    var local_5: f32;

    let _e103 = vs_TEXCOORD0_1;
    let _e108 = _f_buffer0_.f_cb0_[4];
    let _e113 = hscard_bias.values[0];
    let _e116 = textureSampleBias(f_t0_, samplerf_s0_, _e103.xy, (_e108.x + _e113.x));
    u_xlat0_ = _e116;
    let _e117 = u_xlat0_;
    let _e122 = _f_buffer3_.f_cb3_[2];
    u_xlat0_ = (_e117.wxyz * _e122.wxyz);
    let _e126 = vs_TEXCOORD2_1;
    let _e128 = vs_TEXCOORD2_1;
    u_xlat1_.x = dot(_e126.xyz, _e128.xyz);
    let _e132 = u_xlat1_;
    u_xlat1_.x = inverseSqrt(_e132.x);
    let _e135 = u_xlat1_;
    let _e137 = u_xlat1_;
    let _e139 = vs_TEXCOORD2_1;
    let _e141 = (_e137.xxx * _e139.xyz);
    u_xlat1_.x = _e141.x;
    u_xlat1_.y = _e141.y;
    u_xlat1_.z = _e141.z;
    u_xlat1_.w = 1f;
    let _e154 = _f_buffer2_.f_cb2_[27];
    let _e155 = u_xlat1_;
    u_xlat2_.x = dot(_e154, _e155);
    let _e161 = _f_buffer2_.f_cb2_[28];
    let _e162 = u_xlat1_;
    u_xlat2_.y = dot(_e161, _e162);
    let _e168 = _f_buffer2_.f_cb2_[29];
    let _e169 = u_xlat1_;
    u_xlat2_.z = dot(_e168, _e169);
    let _e171 = u_xlat1_;
    let _e173 = u_xlat1_;
    u_xlat3_ = (_e171.yzzx * _e173.xyzz);
    let _e180 = _f_buffer2_.f_cb2_[30];
    let _e181 = u_xlat3_;
    u_xlat4_.x = dot(_e180, _e181);
    let _e187 = _f_buffer2_.f_cb2_[31];
    let _e188 = u_xlat3_;
    u_xlat4_.y = dot(_e187, _e188);
    let _e194 = _f_buffer2_.f_cb2_[32];
    let _e195 = u_xlat3_;
    u_xlat4_.z = dot(_e194, _e195);
    let _e197 = u_xlat1_;
    let _e199 = u_xlat1_;
    u_xlat22_ = (_e197.y * _e199.y);
    let _e202 = u_xlat1_;
    let _e204 = u_xlat1_;
    let _e207 = u_xlat22_;
    u_xlat22_ = ((_e202.x * _e204.x) + -(_e207));
    let _e210 = u_xlat3_;
    let _e215 = _f_buffer2_.f_cb2_[33];
    let _e217 = u_xlat22_;
    let _e220 = u_xlat4_;
    let _e222 = ((_e215.xyz * vec3(_e217)) + _e220.xyz);
    u_xlat3_.x = _e222.x;
    u_xlat3_.y = _e222.y;
    u_xlat3_.z = _e222.z;
    let _e229 = u_xlat2_;
    let _e231 = u_xlat2_;
    let _e233 = u_xlat3_;
    let _e235 = (_e231.xyz + _e233.xyz);
    u_xlat2_.x = _e235.x;
    u_xlat2_.y = _e235.y;
    u_xlat2_.z = _e235.z;
    let _e242 = u_xlatb3_;
    let _e249 = u_xlat2_;
    let _e252 = (vec4<f32>(0.0031308f, 0.0031308f, 0.0031308f, 0f) >= _e249.xyzx).xyz;
    u_xlatb3_.x = _e252.x;
    u_xlatb3_.y = _e252.y;
    u_xlatb3_.z = _e252.z;
    let _e259 = u_xlat4_;
    let _e261 = u_xlat2_;
    let _e267 = (_e261.xyz * vec3<f32>(12.92321f, 12.92321f, 12.92321f));
    u_xlat4_.x = _e267.x;
    u_xlat4_.y = _e267.y;
    u_xlat4_.z = _e267.z;
    let _e274 = u_xlat2_;
    let _e276 = u_xlat2_;
    let _e279 = log2(abs(_e276.xyz));
    u_xlat2_.x = _e279.x;
    u_xlat2_.y = _e279.y;
    u_xlat2_.z = _e279.z;
    let _e286 = u_xlat2_;
    let _e288 = u_xlat2_;
    let _e294 = (_e288.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat2_.x = _e294.x;
    u_xlat2_.y = _e294.y;
    u_xlat2_.z = _e294.z;
    let _e301 = u_xlat2_;
    let _e303 = u_xlat2_;
    let _e305 = exp2(_e303.xyz);
    u_xlat2_.x = _e305.x;
    u_xlat2_.y = _e305.y;
    u_xlat2_.z = _e305.z;
    let _e312 = u_xlat2_;
    let _e314 = u_xlat2_;
    let _e328 = ((_e314.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat2_.x = _e328.x;
    u_xlat2_.y = _e328.y;
    u_xlat2_.z = _e328.z;
    {
        let _e335 = u_xlat2_;
        hlslcc_movcTemp = _e335;
        let _e338 = u_xlatb3_;
        if _e338.x {
            let _e340 = u_xlat4_;
            local = _e340.x;
        } else {
            let _e342 = u_xlat2_;
            local = _e342.x;
        }
        let _e345 = local;
        hlslcc_movcTemp.x = _e345;
        let _e347 = u_xlatb3_;
        if _e347.y {
            let _e349 = u_xlat4_;
            local_1 = _e349.y;
        } else {
            let _e351 = u_xlat2_;
            local_1 = _e351.y;
        }
        let _e354 = local_1;
        hlslcc_movcTemp.y = _e354;
        let _e356 = u_xlatb3_;
        if _e356.z {
            let _e358 = u_xlat4_;
            local_2 = _e358.z;
        } else {
            let _e360 = u_xlat2_;
            local_2 = _e360.z;
        }
        let _e363 = local_2;
        hlslcc_movcTemp.z = _e363;
        let _e364 = hlslcc_movcTemp;
        u_xlat2_ = _e364;
    }
    let _e365 = vs_TEXCOORD6_1;
    let _e366 = _e365.xy;
    let _e367 = vs_TEXCOORD6_1;
    txVec0_ = vec3<f32>(_e366.x, _e366.y, _e367.z);
    let _e373 = txVec0_;
    let _e377 = textureSampleCompareLevel(f_t1_, samplerf_s1_, _e373.xy, _e373.z);
    u_xlat22_ = _e377;
    let _e381 = _f_buffer4_.f_cb4_[27];
    u_xlat23_ = (-(_e381.x) + 1f);
    let _e386 = u_xlat22_;
    let _e390 = _f_buffer4_.f_cb4_[27];
    let _e393 = u_xlat23_;
    u_xlat22_ = ((_e386 * _e390.x) + _e393);
    let _e396 = vs_TEXCOORD6_1;
    u_xlatb23_ = (0f >= _e396.z);
    let _e400 = vs_TEXCOORD6_1;
    u_xlatb3_.x = (_e400.z >= 1f);
    let _e404 = u_xlatb23_;
    let _e405 = u_xlatb3_;
    u_xlatb23_ = (_e404 || _e405.x);
    let _e408 = u_xlatb23_;
    if _e408 {
        local_3 = 1f;
    } else {
        let _e410 = u_xlat22_;
        local_3 = _e410;
    }
    let _e412 = local_3;
    u_xlat22_ = _e412;
    let _e413 = u_xlat3_;
    let _e415 = vs_TEXCOORD1_1;
    let _e420 = _f_buffer0_.f_cb0_[21];
    let _e423 = (_e415.xyz + -(_e420.xyz));
    u_xlat3_.x = _e423.x;
    u_xlat3_.y = _e423.y;
    u_xlat3_.z = _e423.z;
    let _e430 = u_xlat3_;
    let _e432 = u_xlat3_;
    u_xlat23_ = dot(_e430.xyz, _e432.xyz);
    let _e435 = u_xlat23_;
    let _e439 = _f_buffer4_.f_cb4_[27];
    let _e445 = _f_buffer4_.f_cb4_[27];
    u_xlat23_ = ((_e435 * _e439.z) + _e445.w);
    let _e448 = u_xlat23_;
    u_xlat23_ = clamp(_e448, 0f, 1f);
    let _e453 = u_xlat22_;
    u_xlat3_.x = (-(_e453) + 1f);
    let _e457 = u_xlat23_;
    let _e458 = u_xlat3_;
    let _e461 = u_xlat22_;
    u_xlat22_ = ((_e457 * _e458.x) + _e461);
    let _e463 = u_xlat22_;
    let _e467 = _f_buffer2_.f_cb2_[11];
    u_xlat22_ = (_e463 * _e467.z);
    let _e470 = u_xlat3_;
    let _e472 = u_xlat22_;
    let _e477 = _f_buffer0_.f_cb0_[6];
    let _e479 = (vec3(_e472) * _e477.xyz);
    u_xlat3_.x = _e479.x;
    u_xlat3_.y = _e479.y;
    u_xlat3_.z = _e479.z;
    let _e486 = u_xlat1_;
    let _e491 = _f_buffer0_.f_cb0_[5];
    u_xlat22_ = dot(_e486.xyz, _e491.xyz);
    let _e494 = u_xlat22_;
    u_xlat22_ = clamp(_e494, 0f, 1f);
    let _e498 = u_xlat3_;
    let _e500 = u_xlat22_;
    let _e502 = u_xlat3_;
    let _e504 = (vec3(_e500) * _e502.xyz);
    u_xlat3_.x = _e504.x;
    u_xlat3_.y = _e504.y;
    u_xlat3_.z = _e504.z;
    let _e511 = u_xlat3_;
    let _e513 = u_xlat0_;
    let _e515 = u_xlat3_;
    let _e517 = (_e513.yzw * _e515.xyz);
    u_xlat3_.x = _e517.x;
    u_xlat3_.y = _e517.y;
    u_xlat3_.z = _e517.z;
    let _e527 = _f_buffer0_.f_cb0_[10];
    let _e532 = _f_buffer2_.f_cb2_[11];
    u_xlat22_ = min(_e527.x, _e532.y);
    let _e535 = u_xlat22_;
    u_xlatu22_ = u32(i32(_e535));
    u_xlat4_.x = 0f;
    u_xlat4_.y = 0f;
    u_xlat4_.z = 0f;
    loop {
        let _e549 = u_xlatu_loop_1_;
        let _e550 = u_xlatu22_;
        if !((_e549 < _e550)) {
            break;
        }
        {
            let _e556 = u_xlatu_loop_1_;
            u_xlatu24_ = (_e556 >> 2u);
            let _e559 = u_xlatu_loop_1_;
            u_xlati25_ = i32((_e559 & 3u));
            let _e563 = u_xlatu24_;
            let _e569 = _f_buffer2_.f_cb2_[(i32(_e563) + 12i)];
            let _e570 = u_xlati25_;
            let _e574 = local_4[_e570];
            u_xlat24_ = dot(_e569, bitcast<vec4<f32>>(_e574));
            let _e577 = u_xlat24_;
            u_xlati24_ = i32(_e577);
            let _e579 = u_xlat5_;
            let _e581 = vs_TEXCOORD1_1;
            let _e584 = u_xlati24_;
            let _e587 = _f_buffer1_.f_cb1_[_e584];
            let _e590 = u_xlati24_;
            let _e593 = _f_buffer1_.f_cb1_[_e590];
            let _e595 = ((-(_e581.xyz) * _e587.www) + _e593.xyz);
            u_xlat5_.x = _e595.x;
            u_xlat5_.y = _e595.y;
            u_xlat5_.z = _e595.z;
            let _e602 = u_xlat5_;
            let _e604 = u_xlat5_;
            u_xlat25_ = dot(_e602.xyz, _e604.xyz);
            let _e607 = u_xlat25_;
            u_xlat25_ = max(_e607, 0.000061035156f);
            let _e610 = u_xlat25_;
            u_xlat26_ = inverseSqrt(_e610);
            let _e612 = u_xlat5_;
            let _e614 = u_xlat26_;
            let _e616 = u_xlat5_;
            let _e618 = (vec3(_e614) * _e616.xyz);
            u_xlat5_.x = _e618.x;
            u_xlat5_.y = _e618.y;
            u_xlat5_.z = _e618.z;
            let _e627 = u_xlat25_;
            u_xlat26_ = (1f / _e627);
            let _e629 = u_xlat25_;
            let _e630 = u_xlati24_;
            let _e635 = _f_buffer1_.f_cb1_[(_e630 + 512i)];
            u_xlat25_ = (_e629 * _e635.x);
            let _e638 = u_xlat25_;
            let _e640 = u_xlat25_;
            u_xlat25_ = ((-(_e638) * _e640) + 1f);
            let _e644 = u_xlat25_;
            u_xlat25_ = max(_e644, 0f);
            let _e647 = u_xlat25_;
            let _e648 = u_xlat25_;
            u_xlat25_ = (_e647 * _e648);
            let _e650 = u_xlat25_;
            let _e651 = u_xlat26_;
            u_xlat25_ = (_e650 * _e651);
            let _e653 = u_xlati24_;
            let _e658 = _f_buffer1_.f_cb1_[(_e653 + 768i)];
            let _e660 = u_xlat5_;
            u_xlat26_ = dot(_e658.xyz, _e660.xyz);
            let _e663 = u_xlat26_;
            let _e664 = u_xlati24_;
            let _e669 = _f_buffer1_.f_cb1_[(_e664 + 512i)];
            let _e672 = u_xlati24_;
            let _e677 = _f_buffer1_.f_cb1_[(_e672 + 512i)];
            u_xlat26_ = ((_e663 * _e669.z) + _e677.w);
            let _e680 = u_xlat26_;
            u_xlat26_ = clamp(_e680, 0f, 1f);
            let _e684 = u_xlat26_;
            let _e685 = u_xlat26_;
            u_xlat26_ = (_e684 * _e685);
            let _e687 = u_xlat25_;
            let _e688 = u_xlat26_;
            u_xlat25_ = (_e687 * _e688);
            let _e690 = u_xlat6_;
            let _e692 = u_xlat25_;
            let _e694 = u_xlati24_;
            let _e699 = _f_buffer1_.f_cb1_[(_e694 + 256i)];
            let _e701 = (vec3(_e692) * _e699.xyz);
            u_xlat6_.x = _e701.x;
            u_xlat6_.y = _e701.y;
            u_xlat6_.z = _e701.z;
            let _e708 = u_xlat1_;
            let _e710 = u_xlat5_;
            u_xlat24_ = dot(_e708.xyz, _e710.xyz);
            let _e713 = u_xlat24_;
            u_xlat24_ = clamp(_e713, 0f, 1f);
            let _e717 = u_xlat5_;
            let _e719 = u_xlat24_;
            let _e721 = u_xlat6_;
            let _e723 = (vec3(_e719) * _e721.xyz);
            u_xlat5_.x = _e723.x;
            u_xlat5_.y = _e723.y;
            u_xlat5_.z = _e723.z;
            let _e730 = u_xlat4_;
            let _e732 = u_xlat5_;
            let _e734 = u_xlat0_;
            let _e737 = u_xlat4_;
            let _e739 = ((_e732.xyz * _e734.yzw) + _e737.xyz);
            u_xlat4_.x = _e739.x;
            u_xlat4_.y = _e739.y;
            u_xlat4_.z = _e739.z;
        }
        continuing {
            let _e553 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e553 + 1u);
        }
    }
    let _e746 = u_xlat7_;
    let _e748 = u_xlat2_;
    let _e750 = u_xlat0_;
    let _e753 = u_xlat3_;
    let _e755 = ((_e748.xyz * _e750.yzw) + _e753.xyz);
    u_xlat7_.x = _e755.x;
    u_xlat7_.y = _e755.y;
    u_xlat7_.z = _e755.z;
    let _e762 = SV_Target0_;
    let _e764 = u_xlat4_;
    let _e766 = u_xlat7_;
    let _e768 = (_e764.xyz + _e766.xyz);
    SV_Target0_.x = _e768.x;
    SV_Target0_.y = _e768.y;
    SV_Target0_.z = _e768.z;
    let _e778 = _f_buffer3_.f_cb3_[5];
    u_xlatb7_ = (_e778.y == 1f);
    let _e783 = u_xlatb7_;
    if _e783 {
        let _e784 = u_xlat0_;
        local_5 = _e784.x;
    } else {
        local_5 = 1f;
    }
    let _e788 = local_5;
    SV_Target0_.w = _e788;
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
