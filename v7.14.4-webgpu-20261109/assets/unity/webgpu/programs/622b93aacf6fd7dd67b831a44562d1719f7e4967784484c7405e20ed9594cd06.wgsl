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
    f_cb2_: array<vec4<f32>, 34>,
}

struct f_buffer3_ {
    f_cb3_: array<vec4<f32>, 6>,
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
var samplerf_s0_: sampler;
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD1_1: vec3<f32>;
var<private> vs_TEXCOORD2_1: vec3<f32>;
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
    var u_xlatu23_: u32 = 0u;
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
    var u_xlatu_loop_1_: u32 = 0u;
    var local_3: array<vec4<u32>, 4> = ImmCB_0_;
    var local_4: f32;

    let _e91 = vs_TEXCOORD0_1;
    let _e96 = _f_buffer0_.f_cb0_[4];
    let _e101 = hscard_bias.values[0];
    let _e104 = textureSampleBias(f_t0_, samplerf_s0_, _e91.xy, (_e96.x + _e101.x));
    u_xlat0_ = _e104;
    let _e105 = u_xlat0_;
    let _e110 = _f_buffer3_.f_cb3_[2];
    u_xlat0_ = (_e105.wxyz * _e110.wxyz);
    let _e114 = vs_TEXCOORD2_1;
    let _e116 = vs_TEXCOORD2_1;
    u_xlat1_.x = dot(_e114.xyz, _e116.xyz);
    let _e120 = u_xlat1_;
    u_xlat1_.x = inverseSqrt(_e120.x);
    let _e123 = u_xlat1_;
    let _e125 = u_xlat1_;
    let _e127 = vs_TEXCOORD2_1;
    let _e129 = (_e125.xxx * _e127.xyz);
    u_xlat1_.x = _e129.x;
    u_xlat1_.y = _e129.y;
    u_xlat1_.z = _e129.z;
    u_xlat1_.w = 1f;
    let _e142 = _f_buffer2_.f_cb2_[27];
    let _e143 = u_xlat1_;
    u_xlat2_.x = dot(_e142, _e143);
    let _e149 = _f_buffer2_.f_cb2_[28];
    let _e150 = u_xlat1_;
    u_xlat2_.y = dot(_e149, _e150);
    let _e156 = _f_buffer2_.f_cb2_[29];
    let _e157 = u_xlat1_;
    u_xlat2_.z = dot(_e156, _e157);
    let _e159 = u_xlat1_;
    let _e161 = u_xlat1_;
    u_xlat3_ = (_e159.yzzx * _e161.xyzz);
    let _e168 = _f_buffer2_.f_cb2_[30];
    let _e169 = u_xlat3_;
    u_xlat4_.x = dot(_e168, _e169);
    let _e175 = _f_buffer2_.f_cb2_[31];
    let _e176 = u_xlat3_;
    u_xlat4_.y = dot(_e175, _e176);
    let _e182 = _f_buffer2_.f_cb2_[32];
    let _e183 = u_xlat3_;
    u_xlat4_.z = dot(_e182, _e183);
    let _e185 = u_xlat1_;
    let _e187 = u_xlat1_;
    u_xlat22_ = (_e185.y * _e187.y);
    let _e190 = u_xlat1_;
    let _e192 = u_xlat1_;
    let _e195 = u_xlat22_;
    u_xlat22_ = ((_e190.x * _e192.x) + -(_e195));
    let _e198 = u_xlat3_;
    let _e203 = _f_buffer2_.f_cb2_[33];
    let _e205 = u_xlat22_;
    let _e208 = u_xlat4_;
    let _e210 = ((_e203.xyz * vec3(_e205)) + _e208.xyz);
    u_xlat3_.x = _e210.x;
    u_xlat3_.y = _e210.y;
    u_xlat3_.z = _e210.z;
    let _e217 = u_xlat2_;
    let _e219 = u_xlat2_;
    let _e221 = u_xlat3_;
    let _e223 = (_e219.xyz + _e221.xyz);
    u_xlat2_.x = _e223.x;
    u_xlat2_.y = _e223.y;
    u_xlat2_.z = _e223.z;
    let _e230 = u_xlatb3_;
    let _e237 = u_xlat2_;
    let _e240 = (vec4<f32>(0.0031308f, 0.0031308f, 0.0031308f, 0f) >= _e237.xyzx).xyz;
    u_xlatb3_.x = _e240.x;
    u_xlatb3_.y = _e240.y;
    u_xlatb3_.z = _e240.z;
    let _e247 = u_xlat4_;
    let _e249 = u_xlat2_;
    let _e255 = (_e249.xyz * vec3<f32>(12.92321f, 12.92321f, 12.92321f));
    u_xlat4_.x = _e255.x;
    u_xlat4_.y = _e255.y;
    u_xlat4_.z = _e255.z;
    let _e262 = u_xlat2_;
    let _e264 = u_xlat2_;
    let _e267 = log2(abs(_e264.xyz));
    u_xlat2_.x = _e267.x;
    u_xlat2_.y = _e267.y;
    u_xlat2_.z = _e267.z;
    let _e274 = u_xlat2_;
    let _e276 = u_xlat2_;
    let _e282 = (_e276.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat2_.x = _e282.x;
    u_xlat2_.y = _e282.y;
    u_xlat2_.z = _e282.z;
    let _e289 = u_xlat2_;
    let _e291 = u_xlat2_;
    let _e293 = exp2(_e291.xyz);
    u_xlat2_.x = _e293.x;
    u_xlat2_.y = _e293.y;
    u_xlat2_.z = _e293.z;
    let _e300 = u_xlat2_;
    let _e302 = u_xlat2_;
    let _e316 = ((_e302.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat2_.x = _e316.x;
    u_xlat2_.y = _e316.y;
    u_xlat2_.z = _e316.z;
    {
        let _e323 = u_xlat2_;
        hlslcc_movcTemp = _e323;
        let _e326 = u_xlatb3_;
        if _e326.x {
            let _e328 = u_xlat4_;
            local = _e328.x;
        } else {
            let _e330 = u_xlat2_;
            local = _e330.x;
        }
        let _e333 = local;
        hlslcc_movcTemp.x = _e333;
        let _e335 = u_xlatb3_;
        if _e335.y {
            let _e337 = u_xlat4_;
            local_1 = _e337.y;
        } else {
            let _e339 = u_xlat2_;
            local_1 = _e339.y;
        }
        let _e342 = local_1;
        hlslcc_movcTemp.y = _e342;
        let _e344 = u_xlatb3_;
        if _e344.z {
            let _e346 = u_xlat4_;
            local_2 = _e346.z;
        } else {
            let _e348 = u_xlat2_;
            local_2 = _e348.z;
        }
        let _e351 = local_2;
        hlslcc_movcTemp.z = _e351;
        let _e352 = hlslcc_movcTemp;
        u_xlat2_ = _e352;
    }
    let _e353 = u_xlat3_;
    let _e358 = _f_buffer0_.f_cb0_[6];
    let _e363 = _f_buffer2_.f_cb2_[11];
    let _e365 = (_e358.xyz * _e363.zzz);
    u_xlat3_.x = _e365.x;
    u_xlat3_.y = _e365.y;
    u_xlat3_.z = _e365.z;
    let _e372 = u_xlat1_;
    let _e377 = _f_buffer0_.f_cb0_[5];
    u_xlat22_ = dot(_e372.xyz, _e377.xyz);
    let _e380 = u_xlat22_;
    u_xlat22_ = clamp(_e380, 0f, 1f);
    let _e384 = u_xlat3_;
    let _e386 = u_xlat22_;
    let _e388 = u_xlat3_;
    let _e390 = (vec3(_e386) * _e388.xyz);
    u_xlat3_.x = _e390.x;
    u_xlat3_.y = _e390.y;
    u_xlat3_.z = _e390.z;
    let _e397 = u_xlat3_;
    let _e399 = u_xlat0_;
    let _e401 = u_xlat3_;
    let _e403 = (_e399.yzw * _e401.xyz);
    u_xlat3_.x = _e403.x;
    u_xlat3_.y = _e403.y;
    u_xlat3_.z = _e403.z;
    let _e413 = _f_buffer0_.f_cb0_[10];
    let _e418 = _f_buffer2_.f_cb2_[11];
    u_xlat22_ = min(_e413.x, _e418.y);
    let _e421 = u_xlat22_;
    u_xlatu22_ = u32(i32(_e421));
    u_xlat4_.x = 0f;
    u_xlat4_.y = 0f;
    u_xlat4_.z = 0f;
    loop {
        let _e435 = u_xlatu_loop_1_;
        let _e436 = u_xlatu22_;
        if !((_e435 < _e436)) {
            break;
        }
        {
            let _e442 = u_xlatu_loop_1_;
            u_xlatu24_ = (_e442 >> 2u);
            let _e445 = u_xlatu_loop_1_;
            u_xlati25_ = i32((_e445 & 3u));
            let _e449 = u_xlatu24_;
            let _e455 = _f_buffer2_.f_cb2_[(i32(_e449) + 12i)];
            let _e456 = u_xlati25_;
            let _e460 = local_3[_e456];
            u_xlat24_ = dot(_e455, bitcast<vec4<f32>>(_e460));
            let _e463 = u_xlat24_;
            u_xlati24_ = i32(_e463);
            let _e465 = u_xlat5_;
            let _e467 = vs_TEXCOORD1_1;
            let _e470 = u_xlati24_;
            let _e473 = _f_buffer1_.f_cb1_[_e470];
            let _e476 = u_xlati24_;
            let _e479 = _f_buffer1_.f_cb1_[_e476];
            let _e481 = ((-(_e467.xyz) * _e473.www) + _e479.xyz);
            u_xlat5_.x = _e481.x;
            u_xlat5_.y = _e481.y;
            u_xlat5_.z = _e481.z;
            let _e488 = u_xlat5_;
            let _e490 = u_xlat5_;
            u_xlat25_ = dot(_e488.xyz, _e490.xyz);
            let _e493 = u_xlat25_;
            u_xlat25_ = max(_e493, 0.000061035156f);
            let _e496 = u_xlat25_;
            u_xlat26_ = inverseSqrt(_e496);
            let _e498 = u_xlat5_;
            let _e500 = u_xlat26_;
            let _e502 = u_xlat5_;
            let _e504 = (vec3(_e500) * _e502.xyz);
            u_xlat5_.x = _e504.x;
            u_xlat5_.y = _e504.y;
            u_xlat5_.z = _e504.z;
            let _e513 = u_xlat25_;
            u_xlat26_ = (1f / _e513);
            let _e515 = u_xlat25_;
            let _e516 = u_xlati24_;
            let _e521 = _f_buffer1_.f_cb1_[(_e516 + 512i)];
            u_xlat25_ = (_e515 * _e521.x);
            let _e524 = u_xlat25_;
            let _e526 = u_xlat25_;
            u_xlat25_ = ((-(_e524) * _e526) + 1f);
            let _e530 = u_xlat25_;
            u_xlat25_ = max(_e530, 0f);
            let _e533 = u_xlat25_;
            let _e534 = u_xlat25_;
            u_xlat25_ = (_e533 * _e534);
            let _e536 = u_xlat25_;
            let _e537 = u_xlat26_;
            u_xlat25_ = (_e536 * _e537);
            let _e539 = u_xlati24_;
            let _e544 = _f_buffer1_.f_cb1_[(_e539 + 768i)];
            let _e546 = u_xlat5_;
            u_xlat26_ = dot(_e544.xyz, _e546.xyz);
            let _e549 = u_xlat26_;
            let _e550 = u_xlati24_;
            let _e555 = _f_buffer1_.f_cb1_[(_e550 + 512i)];
            let _e558 = u_xlati24_;
            let _e563 = _f_buffer1_.f_cb1_[(_e558 + 512i)];
            u_xlat26_ = ((_e549 * _e555.z) + _e563.w);
            let _e566 = u_xlat26_;
            u_xlat26_ = clamp(_e566, 0f, 1f);
            let _e570 = u_xlat26_;
            let _e571 = u_xlat26_;
            u_xlat26_ = (_e570 * _e571);
            let _e573 = u_xlat25_;
            let _e574 = u_xlat26_;
            u_xlat25_ = (_e573 * _e574);
            let _e576 = u_xlat6_;
            let _e578 = u_xlat25_;
            let _e580 = u_xlati24_;
            let _e585 = _f_buffer1_.f_cb1_[(_e580 + 256i)];
            let _e587 = (vec3(_e578) * _e585.xyz);
            u_xlat6_.x = _e587.x;
            u_xlat6_.y = _e587.y;
            u_xlat6_.z = _e587.z;
            let _e594 = u_xlat1_;
            let _e596 = u_xlat5_;
            u_xlat24_ = dot(_e594.xyz, _e596.xyz);
            let _e599 = u_xlat24_;
            u_xlat24_ = clamp(_e599, 0f, 1f);
            let _e603 = u_xlat5_;
            let _e605 = u_xlat24_;
            let _e607 = u_xlat6_;
            let _e609 = (vec3(_e605) * _e607.xyz);
            u_xlat5_.x = _e609.x;
            u_xlat5_.y = _e609.y;
            u_xlat5_.z = _e609.z;
            let _e616 = u_xlat4_;
            let _e618 = u_xlat5_;
            let _e620 = u_xlat0_;
            let _e623 = u_xlat4_;
            let _e625 = ((_e618.xyz * _e620.yzw) + _e623.xyz);
            u_xlat4_.x = _e625.x;
            u_xlat4_.y = _e625.y;
            u_xlat4_.z = _e625.z;
        }
        continuing {
            let _e439 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e439 + 1u);
        }
    }
    let _e632 = u_xlat7_;
    let _e634 = u_xlat2_;
    let _e636 = u_xlat0_;
    let _e639 = u_xlat3_;
    let _e641 = ((_e634.xyz * _e636.yzw) + _e639.xyz);
    u_xlat7_.x = _e641.x;
    u_xlat7_.y = _e641.y;
    u_xlat7_.z = _e641.z;
    let _e648 = SV_Target0_;
    let _e650 = u_xlat4_;
    let _e652 = u_xlat7_;
    let _e654 = (_e650.xyz + _e652.xyz);
    SV_Target0_.x = _e654.x;
    SV_Target0_.y = _e654.y;
    SV_Target0_.z = _e654.z;
    let _e664 = _f_buffer3_.f_cb3_[5];
    u_xlatb7_ = (_e664.y == 1f);
    let _e669 = u_xlatb7_;
    if _e669 {
        let _e670 = u_xlat0_;
        local_4 = _e670.x;
    } else {
        local_4 = 1f;
    }
    let _e674 = local_4;
    SV_Target0_.w = _e674;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec3<f32>, @location(2) vs_TEXCOORD2_: vec3<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_TEXCOORD2_1 = vs_TEXCOORD2_;
    main_1();
    let _e36 = SV_Target0_;
    return FragmentOutput(_e36);
}
