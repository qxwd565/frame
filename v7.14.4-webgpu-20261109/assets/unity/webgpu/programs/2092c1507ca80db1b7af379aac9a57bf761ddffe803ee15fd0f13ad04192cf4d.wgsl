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
var samplerf_s1_: sampler;
@group(3) @binding(5) 
var samplerf_s2_: sampler_comparison;
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
@group(3) @binding(4) 
var f_t2_: texture_depth_2d;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD1_1: vec3<f32>;
var<private> vs_TEXCOORD2_1: vec3<f32>;
var<private> vs_TEXCOORD6_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: vec4<f32> = vec4(0f);
    var u_xlatb4_: vec3<bool> = vec3(false);
    var u_xlat5_: vec3<f32> = vec3(0f);
    var u_xlat6_: vec3<f32> = vec3(0f);
    var u_xlat7_: vec3<f32> = vec3(0f);
    var u_xlat8_: vec3<f32> = vec3(0f);
    var u_xlatb8_: bool = false;
    var u_xlat25_: f32 = 0f;
    var u_xlatu25_: u32 = 0u;
    var u_xlat26_: f32 = 0f;
    var u_xlatu26_: u32 = 0u;
    var u_xlatb26_: bool = false;
    var u_xlat27_: f32 = 0f;
    var u_xlati27_: i32 = 0i;
    var u_xlatu27_: u32 = 0u;
    var u_xlatb27_: bool = false;
    var u_xlat28_: f32 = 0f;
    var u_xlati28_: i32 = 0i;
    var u_xlat29_: f32 = 0f;
    var hlslcc_movcTemp: vec3<f32>;
    var local: f32;
    var local_1: f32;
    var local_2: f32;
    var txVec0_: vec3<f32>;
    var local_3: f32;
    var u_xlatu_loop_1_: u32 = 0u;
    var local_4: array<vec4<u32>, 4> = ImmCB_0_;
    var local_5: f32;

    let _e109 = vs_TEXCOORD0_1;
    let _e114 = _f_buffer0_.f_cb0_[4];
    let _e119 = hscard_bias.values[0];
    let _e122 = textureSampleBias(f_t0_, samplerf_s0_, _e109.xy, (_e114.x + _e119.x));
    u_xlat0_ = _e122;
    let _e123 = u_xlat0_;
    let _e128 = _f_buffer3_.f_cb3_[2];
    u_xlat0_ = (_e123.wxyz * _e128.wxyz);
    let _e131 = vs_TEXCOORD0_1;
    let _e136 = _f_buffer0_.f_cb0_[4];
    let _e141 = hscard_bias.values[1];
    let _e144 = textureSampleBias(f_t1_, samplerf_s1_, _e131.xy, (_e136.x + _e141.x));
    u_xlat1_ = _e144;
    let _e145 = vs_TEXCOORD2_1;
    let _e147 = vs_TEXCOORD2_1;
    u_xlat25_ = dot(_e145.xyz, _e147.xyz);
    let _e150 = u_xlat25_;
    u_xlat25_ = inverseSqrt(_e150);
    let _e152 = u_xlat2_;
    let _e154 = u_xlat25_;
    let _e156 = vs_TEXCOORD2_1;
    let _e158 = (vec3(_e154) * _e156.xyz);
    u_xlat2_.x = _e158.x;
    u_xlat2_.y = _e158.y;
    u_xlat2_.z = _e158.z;
    u_xlat2_.w = 1f;
    let _e171 = _f_buffer2_.f_cb2_[27];
    let _e172 = u_xlat2_;
    u_xlat3_.x = dot(_e171, _e172);
    let _e178 = _f_buffer2_.f_cb2_[28];
    let _e179 = u_xlat2_;
    u_xlat3_.y = dot(_e178, _e179);
    let _e185 = _f_buffer2_.f_cb2_[29];
    let _e186 = u_xlat2_;
    u_xlat3_.z = dot(_e185, _e186);
    let _e188 = u_xlat2_;
    let _e190 = u_xlat2_;
    u_xlat4_ = (_e188.yzzx * _e190.xyzz);
    let _e197 = _f_buffer2_.f_cb2_[30];
    let _e198 = u_xlat4_;
    u_xlat5_.x = dot(_e197, _e198);
    let _e204 = _f_buffer2_.f_cb2_[31];
    let _e205 = u_xlat4_;
    u_xlat5_.y = dot(_e204, _e205);
    let _e211 = _f_buffer2_.f_cb2_[32];
    let _e212 = u_xlat4_;
    u_xlat5_.z = dot(_e211, _e212);
    let _e214 = u_xlat2_;
    let _e216 = u_xlat2_;
    u_xlat25_ = (_e214.y * _e216.y);
    let _e219 = u_xlat2_;
    let _e221 = u_xlat2_;
    let _e224 = u_xlat25_;
    u_xlat25_ = ((_e219.x * _e221.x) + -(_e224));
    let _e227 = u_xlat4_;
    let _e232 = _f_buffer2_.f_cb2_[33];
    let _e234 = u_xlat25_;
    let _e237 = u_xlat5_;
    let _e239 = ((_e232.xyz * vec3(_e234)) + _e237.xyz);
    u_xlat4_.x = _e239.x;
    u_xlat4_.y = _e239.y;
    u_xlat4_.z = _e239.z;
    let _e246 = u_xlat3_;
    let _e248 = u_xlat3_;
    let _e250 = u_xlat4_;
    let _e252 = (_e248.xyz + _e250.xyz);
    u_xlat3_.x = _e252.x;
    u_xlat3_.y = _e252.y;
    u_xlat3_.z = _e252.z;
    let _e259 = u_xlatb4_;
    let _e266 = u_xlat3_;
    let _e269 = (vec4<f32>(0.0031308f, 0.0031308f, 0.0031308f, 0f) >= _e266.xyzx).xyz;
    u_xlatb4_.x = _e269.x;
    u_xlatb4_.y = _e269.y;
    u_xlatb4_.z = _e269.z;
    let _e276 = u_xlat5_;
    let _e278 = u_xlat3_;
    let _e284 = (_e278.xyz * vec3<f32>(12.92321f, 12.92321f, 12.92321f));
    u_xlat5_.x = _e284.x;
    u_xlat5_.y = _e284.y;
    u_xlat5_.z = _e284.z;
    let _e291 = u_xlat3_;
    let _e293 = u_xlat3_;
    let _e296 = log2(abs(_e293.xyz));
    u_xlat3_.x = _e296.x;
    u_xlat3_.y = _e296.y;
    u_xlat3_.z = _e296.z;
    let _e303 = u_xlat3_;
    let _e305 = u_xlat3_;
    let _e311 = (_e305.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat3_.x = _e311.x;
    u_xlat3_.y = _e311.y;
    u_xlat3_.z = _e311.z;
    let _e318 = u_xlat3_;
    let _e320 = u_xlat3_;
    let _e322 = exp2(_e320.xyz);
    u_xlat3_.x = _e322.x;
    u_xlat3_.y = _e322.y;
    u_xlat3_.z = _e322.z;
    let _e329 = u_xlat3_;
    let _e331 = u_xlat3_;
    let _e345 = ((_e331.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat3_.x = _e345.x;
    u_xlat3_.y = _e345.y;
    u_xlat3_.z = _e345.z;
    {
        let _e352 = u_xlat3_;
        hlslcc_movcTemp = _e352;
        let _e355 = u_xlatb4_;
        if _e355.x {
            let _e357 = u_xlat5_;
            local = _e357.x;
        } else {
            let _e359 = u_xlat3_;
            local = _e359.x;
        }
        let _e362 = local;
        hlslcc_movcTemp.x = _e362;
        let _e364 = u_xlatb4_;
        if _e364.y {
            let _e366 = u_xlat5_;
            local_1 = _e366.y;
        } else {
            let _e368 = u_xlat3_;
            local_1 = _e368.y;
        }
        let _e371 = local_1;
        hlslcc_movcTemp.y = _e371;
        let _e373 = u_xlatb4_;
        if _e373.z {
            let _e375 = u_xlat5_;
            local_2 = _e375.z;
        } else {
            let _e377 = u_xlat3_;
            local_2 = _e377.z;
        }
        let _e380 = local_2;
        hlslcc_movcTemp.z = _e380;
        let _e381 = hlslcc_movcTemp;
        u_xlat3_ = _e381;
    }
    let _e382 = vs_TEXCOORD6_1;
    let _e383 = _e382.xy;
    let _e384 = vs_TEXCOORD6_1;
    txVec0_ = vec3<f32>(_e383.x, _e383.y, _e384.z);
    let _e390 = txVec0_;
    let _e394 = textureSampleCompareLevel(f_t2_, samplerf_s2_, _e390.xy, _e390.z);
    u_xlat25_ = _e394;
    let _e398 = _f_buffer4_.f_cb4_[27];
    u_xlat26_ = (-(_e398.x) + 1f);
    let _e403 = u_xlat25_;
    let _e407 = _f_buffer4_.f_cb4_[27];
    let _e410 = u_xlat26_;
    u_xlat25_ = ((_e403 * _e407.x) + _e410);
    let _e413 = vs_TEXCOORD6_1;
    u_xlatb26_ = (0f >= _e413.z);
    let _e416 = vs_TEXCOORD6_1;
    u_xlatb27_ = (_e416.z >= 1f);
    let _e420 = u_xlatb26_;
    let _e421 = u_xlatb27_;
    u_xlatb26_ = (_e420 || _e421);
    let _e423 = u_xlatb26_;
    if _e423 {
        local_3 = 1f;
    } else {
        let _e425 = u_xlat25_;
        local_3 = _e425;
    }
    let _e427 = local_3;
    u_xlat25_ = _e427;
    let _e428 = u_xlat4_;
    let _e430 = vs_TEXCOORD1_1;
    let _e435 = _f_buffer0_.f_cb0_[21];
    let _e438 = (_e430.xyz + -(_e435.xyz));
    u_xlat4_.x = _e438.x;
    u_xlat4_.y = _e438.y;
    u_xlat4_.z = _e438.z;
    let _e445 = u_xlat4_;
    let _e447 = u_xlat4_;
    u_xlat26_ = dot(_e445.xyz, _e447.xyz);
    let _e450 = u_xlat26_;
    let _e454 = _f_buffer4_.f_cb4_[27];
    let _e460 = _f_buffer4_.f_cb4_[27];
    u_xlat26_ = ((_e450 * _e454.z) + _e460.w);
    let _e463 = u_xlat26_;
    u_xlat26_ = clamp(_e463, 0f, 1f);
    let _e467 = u_xlat25_;
    u_xlat27_ = (-(_e467) + 1f);
    let _e471 = u_xlat26_;
    let _e472 = u_xlat27_;
    let _e474 = u_xlat25_;
    u_xlat25_ = ((_e471 * _e472) + _e474);
    let _e476 = u_xlat25_;
    let _e480 = _f_buffer2_.f_cb2_[11];
    u_xlat25_ = (_e476 * _e480.z);
    let _e483 = u_xlat4_;
    let _e485 = u_xlat25_;
    let _e490 = _f_buffer0_.f_cb0_[6];
    let _e492 = (vec3(_e485) * _e490.xyz);
    u_xlat4_.x = _e492.x;
    u_xlat4_.y = _e492.y;
    u_xlat4_.z = _e492.z;
    let _e499 = u_xlat2_;
    let _e504 = _f_buffer0_.f_cb0_[5];
    u_xlat25_ = dot(_e499.xyz, _e504.xyz);
    let _e507 = u_xlat25_;
    u_xlat25_ = clamp(_e507, 0f, 1f);
    let _e511 = u_xlat4_;
    let _e513 = u_xlat25_;
    let _e515 = u_xlat4_;
    let _e517 = (vec3(_e513) * _e515.xyz);
    u_xlat4_.x = _e517.x;
    u_xlat4_.y = _e517.y;
    u_xlat4_.z = _e517.z;
    let _e524 = u_xlat4_;
    let _e526 = u_xlat0_;
    let _e528 = u_xlat4_;
    let _e530 = (_e526.yzw * _e528.xyz);
    u_xlat4_.x = _e530.x;
    u_xlat4_.y = _e530.y;
    u_xlat4_.z = _e530.z;
    let _e540 = _f_buffer0_.f_cb0_[10];
    let _e545 = _f_buffer2_.f_cb2_[11];
    u_xlat25_ = min(_e540.x, _e545.y);
    let _e548 = u_xlat25_;
    u_xlatu25_ = u32(i32(_e548));
    u_xlat5_.x = 0f;
    u_xlat5_.y = 0f;
    u_xlat5_.z = 0f;
    loop {
        let _e562 = u_xlatu_loop_1_;
        let _e563 = u_xlatu25_;
        if !((_e562 < _e563)) {
            break;
        }
        {
            let _e569 = u_xlatu_loop_1_;
            u_xlatu27_ = (_e569 >> 2u);
            let _e572 = u_xlatu_loop_1_;
            u_xlati28_ = i32((_e572 & 3u));
            let _e576 = u_xlatu27_;
            let _e582 = _f_buffer2_.f_cb2_[(i32(_e576) + 12i)];
            let _e583 = u_xlati28_;
            let _e587 = local_4[_e583];
            u_xlat27_ = dot(_e582, bitcast<vec4<f32>>(_e587));
            let _e590 = u_xlat27_;
            u_xlati27_ = i32(_e590);
            let _e592 = u_xlat6_;
            let _e594 = vs_TEXCOORD1_1;
            let _e597 = u_xlati27_;
            let _e600 = _f_buffer1_.f_cb1_[_e597];
            let _e603 = u_xlati27_;
            let _e606 = _f_buffer1_.f_cb1_[_e603];
            let _e608 = ((-(_e594.xyz) * _e600.www) + _e606.xyz);
            u_xlat6_.x = _e608.x;
            u_xlat6_.y = _e608.y;
            u_xlat6_.z = _e608.z;
            let _e615 = u_xlat6_;
            let _e617 = u_xlat6_;
            u_xlat28_ = dot(_e615.xyz, _e617.xyz);
            let _e620 = u_xlat28_;
            u_xlat28_ = max(_e620, 0.000061035156f);
            let _e623 = u_xlat28_;
            u_xlat29_ = inverseSqrt(_e623);
            let _e625 = u_xlat6_;
            let _e627 = u_xlat29_;
            let _e629 = u_xlat6_;
            let _e631 = (vec3(_e627) * _e629.xyz);
            u_xlat6_.x = _e631.x;
            u_xlat6_.y = _e631.y;
            u_xlat6_.z = _e631.z;
            let _e640 = u_xlat28_;
            u_xlat29_ = (1f / _e640);
            let _e642 = u_xlat28_;
            let _e643 = u_xlati27_;
            let _e648 = _f_buffer1_.f_cb1_[(_e643 + 512i)];
            u_xlat28_ = (_e642 * _e648.x);
            let _e651 = u_xlat28_;
            let _e653 = u_xlat28_;
            u_xlat28_ = ((-(_e651) * _e653) + 1f);
            let _e657 = u_xlat28_;
            u_xlat28_ = max(_e657, 0f);
            let _e660 = u_xlat28_;
            let _e661 = u_xlat28_;
            u_xlat28_ = (_e660 * _e661);
            let _e663 = u_xlat28_;
            let _e664 = u_xlat29_;
            u_xlat28_ = (_e663 * _e664);
            let _e666 = u_xlati27_;
            let _e671 = _f_buffer1_.f_cb1_[(_e666 + 768i)];
            let _e673 = u_xlat6_;
            u_xlat29_ = dot(_e671.xyz, _e673.xyz);
            let _e676 = u_xlat29_;
            let _e677 = u_xlati27_;
            let _e682 = _f_buffer1_.f_cb1_[(_e677 + 512i)];
            let _e685 = u_xlati27_;
            let _e690 = _f_buffer1_.f_cb1_[(_e685 + 512i)];
            u_xlat29_ = ((_e676 * _e682.z) + _e690.w);
            let _e693 = u_xlat29_;
            u_xlat29_ = clamp(_e693, 0f, 1f);
            let _e697 = u_xlat29_;
            let _e698 = u_xlat29_;
            u_xlat29_ = (_e697 * _e698);
            let _e700 = u_xlat28_;
            let _e701 = u_xlat29_;
            u_xlat28_ = (_e700 * _e701);
            let _e703 = u_xlat7_;
            let _e705 = u_xlat28_;
            let _e707 = u_xlati27_;
            let _e712 = _f_buffer1_.f_cb1_[(_e707 + 256i)];
            let _e714 = (vec3(_e705) * _e712.xyz);
            u_xlat7_.x = _e714.x;
            u_xlat7_.y = _e714.y;
            u_xlat7_.z = _e714.z;
            let _e721 = u_xlat2_;
            let _e723 = u_xlat6_;
            u_xlat27_ = dot(_e721.xyz, _e723.xyz);
            let _e726 = u_xlat27_;
            u_xlat27_ = clamp(_e726, 0f, 1f);
            let _e730 = u_xlat6_;
            let _e732 = u_xlat27_;
            let _e734 = u_xlat7_;
            let _e736 = (vec3(_e732) * _e734.xyz);
            u_xlat6_.x = _e736.x;
            u_xlat6_.y = _e736.y;
            u_xlat6_.z = _e736.z;
            let _e743 = u_xlat5_;
            let _e745 = u_xlat6_;
            let _e747 = u_xlat0_;
            let _e750 = u_xlat5_;
            let _e752 = ((_e745.xyz * _e747.yzw) + _e750.xyz);
            u_xlat5_.x = _e752.x;
            u_xlat5_.y = _e752.y;
            u_xlat5_.z = _e752.z;
        }
        continuing {
            let _e566 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e566 + 1u);
        }
    }
    let _e759 = u_xlat8_;
    let _e761 = u_xlat3_;
    let _e763 = u_xlat0_;
    let _e766 = u_xlat4_;
    let _e768 = ((_e761.xyz * _e763.yzw) + _e766.xyz);
    u_xlat8_.x = _e768.x;
    u_xlat8_.y = _e768.y;
    u_xlat8_.z = _e768.z;
    let _e775 = u_xlat8_;
    let _e777 = u_xlat5_;
    let _e779 = u_xlat8_;
    let _e781 = (_e777.xyz + _e779.xyz);
    u_xlat8_.x = _e781.x;
    u_xlat8_.y = _e781.y;
    u_xlat8_.z = _e781.z;
    let _e788 = SV_Target0_;
    let _e790 = u_xlat1_;
    let _e795 = _f_buffer3_.f_cb3_[4];
    let _e798 = u_xlat8_;
    let _e800 = ((_e790.xyz * _e795.xyz) + _e798.xyz);
    SV_Target0_.x = _e800.x;
    SV_Target0_.y = _e800.y;
    SV_Target0_.z = _e800.z;
    let _e810 = _f_buffer3_.f_cb3_[5];
    u_xlatb8_ = (_e810.y == 1f);
    let _e815 = u_xlatb8_;
    if _e815 {
        let _e816 = u_xlat0_;
        local_5 = _e816.x;
    } else {
        local_5 = 1f;
    }
    let _e820 = local_5;
    SV_Target0_.w = _e820;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec3<f32>, @location(2) vs_TEXCOORD2_: vec3<f32>, @location(6) vs_TEXCOORD6_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_TEXCOORD2_1 = vs_TEXCOORD2_;
    vs_TEXCOORD6_1 = vs_TEXCOORD6_;
    main_1();
    let _e51 = SV_Target0_;
    return FragmentOutput(_e51);
}
