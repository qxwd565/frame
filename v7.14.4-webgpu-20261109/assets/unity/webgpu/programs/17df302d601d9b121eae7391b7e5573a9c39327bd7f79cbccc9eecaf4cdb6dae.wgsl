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
@group(3) @binding(3) 
var samplerf_s1_: sampler;
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD1_1: vec3<f32>;
var<private> vs_TEXCOORD2_1: vec3<f32>;
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
    var u_xlatu26_: u32 = 0u;
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
    var u_xlatu_loop_1_: u32 = 0u;
    var local_3: array<vec4<u32>, 4> = ImmCB_0_;
    var local_4: f32;

    let _e97 = vs_TEXCOORD0_1;
    let _e102 = _f_buffer0_.f_cb0_[4];
    let _e107 = hscard_bias.values[0];
    let _e110 = textureSampleBias(f_t0_, samplerf_s0_, _e97.xy, (_e102.x + _e107.x));
    u_xlat0_ = _e110;
    let _e111 = u_xlat0_;
    let _e116 = _f_buffer3_.f_cb3_[2];
    u_xlat0_ = (_e111.wxyz * _e116.wxyz);
    let _e119 = vs_TEXCOORD0_1;
    let _e124 = _f_buffer0_.f_cb0_[4];
    let _e129 = hscard_bias.values[1];
    let _e132 = textureSampleBias(f_t1_, samplerf_s1_, _e119.xy, (_e124.x + _e129.x));
    u_xlat1_ = _e132;
    let _e133 = vs_TEXCOORD2_1;
    let _e135 = vs_TEXCOORD2_1;
    u_xlat25_ = dot(_e133.xyz, _e135.xyz);
    let _e138 = u_xlat25_;
    u_xlat25_ = inverseSqrt(_e138);
    let _e140 = u_xlat2_;
    let _e142 = u_xlat25_;
    let _e144 = vs_TEXCOORD2_1;
    let _e146 = (vec3(_e142) * _e144.xyz);
    u_xlat2_.x = _e146.x;
    u_xlat2_.y = _e146.y;
    u_xlat2_.z = _e146.z;
    u_xlat2_.w = 1f;
    let _e159 = _f_buffer2_.f_cb2_[27];
    let _e160 = u_xlat2_;
    u_xlat3_.x = dot(_e159, _e160);
    let _e166 = _f_buffer2_.f_cb2_[28];
    let _e167 = u_xlat2_;
    u_xlat3_.y = dot(_e166, _e167);
    let _e173 = _f_buffer2_.f_cb2_[29];
    let _e174 = u_xlat2_;
    u_xlat3_.z = dot(_e173, _e174);
    let _e176 = u_xlat2_;
    let _e178 = u_xlat2_;
    u_xlat4_ = (_e176.yzzx * _e178.xyzz);
    let _e185 = _f_buffer2_.f_cb2_[30];
    let _e186 = u_xlat4_;
    u_xlat5_.x = dot(_e185, _e186);
    let _e192 = _f_buffer2_.f_cb2_[31];
    let _e193 = u_xlat4_;
    u_xlat5_.y = dot(_e192, _e193);
    let _e199 = _f_buffer2_.f_cb2_[32];
    let _e200 = u_xlat4_;
    u_xlat5_.z = dot(_e199, _e200);
    let _e202 = u_xlat2_;
    let _e204 = u_xlat2_;
    u_xlat25_ = (_e202.y * _e204.y);
    let _e207 = u_xlat2_;
    let _e209 = u_xlat2_;
    let _e212 = u_xlat25_;
    u_xlat25_ = ((_e207.x * _e209.x) + -(_e212));
    let _e215 = u_xlat4_;
    let _e220 = _f_buffer2_.f_cb2_[33];
    let _e222 = u_xlat25_;
    let _e225 = u_xlat5_;
    let _e227 = ((_e220.xyz * vec3(_e222)) + _e225.xyz);
    u_xlat4_.x = _e227.x;
    u_xlat4_.y = _e227.y;
    u_xlat4_.z = _e227.z;
    let _e234 = u_xlat3_;
    let _e236 = u_xlat3_;
    let _e238 = u_xlat4_;
    let _e240 = (_e236.xyz + _e238.xyz);
    u_xlat3_.x = _e240.x;
    u_xlat3_.y = _e240.y;
    u_xlat3_.z = _e240.z;
    let _e247 = u_xlatb4_;
    let _e254 = u_xlat3_;
    let _e257 = (vec4<f32>(0.0031308f, 0.0031308f, 0.0031308f, 0f) >= _e254.xyzx).xyz;
    u_xlatb4_.x = _e257.x;
    u_xlatb4_.y = _e257.y;
    u_xlatb4_.z = _e257.z;
    let _e264 = u_xlat5_;
    let _e266 = u_xlat3_;
    let _e272 = (_e266.xyz * vec3<f32>(12.92321f, 12.92321f, 12.92321f));
    u_xlat5_.x = _e272.x;
    u_xlat5_.y = _e272.y;
    u_xlat5_.z = _e272.z;
    let _e279 = u_xlat3_;
    let _e281 = u_xlat3_;
    let _e284 = log2(abs(_e281.xyz));
    u_xlat3_.x = _e284.x;
    u_xlat3_.y = _e284.y;
    u_xlat3_.z = _e284.z;
    let _e291 = u_xlat3_;
    let _e293 = u_xlat3_;
    let _e299 = (_e293.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat3_.x = _e299.x;
    u_xlat3_.y = _e299.y;
    u_xlat3_.z = _e299.z;
    let _e306 = u_xlat3_;
    let _e308 = u_xlat3_;
    let _e310 = exp2(_e308.xyz);
    u_xlat3_.x = _e310.x;
    u_xlat3_.y = _e310.y;
    u_xlat3_.z = _e310.z;
    let _e317 = u_xlat3_;
    let _e319 = u_xlat3_;
    let _e333 = ((_e319.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat3_.x = _e333.x;
    u_xlat3_.y = _e333.y;
    u_xlat3_.z = _e333.z;
    {
        let _e340 = u_xlat3_;
        hlslcc_movcTemp = _e340;
        let _e343 = u_xlatb4_;
        if _e343.x {
            let _e345 = u_xlat5_;
            local = _e345.x;
        } else {
            let _e347 = u_xlat3_;
            local = _e347.x;
        }
        let _e350 = local;
        hlslcc_movcTemp.x = _e350;
        let _e352 = u_xlatb4_;
        if _e352.y {
            let _e354 = u_xlat5_;
            local_1 = _e354.y;
        } else {
            let _e356 = u_xlat3_;
            local_1 = _e356.y;
        }
        let _e359 = local_1;
        hlslcc_movcTemp.y = _e359;
        let _e361 = u_xlatb4_;
        if _e361.z {
            let _e363 = u_xlat5_;
            local_2 = _e363.z;
        } else {
            let _e365 = u_xlat3_;
            local_2 = _e365.z;
        }
        let _e368 = local_2;
        hlslcc_movcTemp.z = _e368;
        let _e369 = hlslcc_movcTemp;
        u_xlat3_ = _e369;
    }
    let _e370 = u_xlat4_;
    let _e375 = _f_buffer0_.f_cb0_[6];
    let _e380 = _f_buffer2_.f_cb2_[11];
    let _e382 = (_e375.xyz * _e380.zzz);
    u_xlat4_.x = _e382.x;
    u_xlat4_.y = _e382.y;
    u_xlat4_.z = _e382.z;
    let _e389 = u_xlat2_;
    let _e394 = _f_buffer0_.f_cb0_[5];
    u_xlat25_ = dot(_e389.xyz, _e394.xyz);
    let _e397 = u_xlat25_;
    u_xlat25_ = clamp(_e397, 0f, 1f);
    let _e401 = u_xlat4_;
    let _e403 = u_xlat25_;
    let _e405 = u_xlat4_;
    let _e407 = (vec3(_e403) * _e405.xyz);
    u_xlat4_.x = _e407.x;
    u_xlat4_.y = _e407.y;
    u_xlat4_.z = _e407.z;
    let _e414 = u_xlat4_;
    let _e416 = u_xlat0_;
    let _e418 = u_xlat4_;
    let _e420 = (_e416.yzw * _e418.xyz);
    u_xlat4_.x = _e420.x;
    u_xlat4_.y = _e420.y;
    u_xlat4_.z = _e420.z;
    let _e430 = _f_buffer0_.f_cb0_[10];
    let _e435 = _f_buffer2_.f_cb2_[11];
    u_xlat25_ = min(_e430.x, _e435.y);
    let _e438 = u_xlat25_;
    u_xlatu25_ = u32(i32(_e438));
    u_xlat5_.x = 0f;
    u_xlat5_.y = 0f;
    u_xlat5_.z = 0f;
    loop {
        let _e452 = u_xlatu_loop_1_;
        let _e453 = u_xlatu25_;
        if !((_e452 < _e453)) {
            break;
        }
        {
            let _e459 = u_xlatu_loop_1_;
            u_xlatu27_ = (_e459 >> 2u);
            let _e462 = u_xlatu_loop_1_;
            u_xlati28_ = i32((_e462 & 3u));
            let _e466 = u_xlatu27_;
            let _e472 = _f_buffer2_.f_cb2_[(i32(_e466) + 12i)];
            let _e473 = u_xlati28_;
            let _e477 = local_3[_e473];
            u_xlat27_ = dot(_e472, bitcast<vec4<f32>>(_e477));
            let _e480 = u_xlat27_;
            u_xlati27_ = i32(_e480);
            let _e482 = u_xlat6_;
            let _e484 = vs_TEXCOORD1_1;
            let _e487 = u_xlati27_;
            let _e490 = _f_buffer1_.f_cb1_[_e487];
            let _e493 = u_xlati27_;
            let _e496 = _f_buffer1_.f_cb1_[_e493];
            let _e498 = ((-(_e484.xyz) * _e490.www) + _e496.xyz);
            u_xlat6_.x = _e498.x;
            u_xlat6_.y = _e498.y;
            u_xlat6_.z = _e498.z;
            let _e505 = u_xlat6_;
            let _e507 = u_xlat6_;
            u_xlat28_ = dot(_e505.xyz, _e507.xyz);
            let _e510 = u_xlat28_;
            u_xlat28_ = max(_e510, 0.000061035156f);
            let _e513 = u_xlat28_;
            u_xlat29_ = inverseSqrt(_e513);
            let _e515 = u_xlat6_;
            let _e517 = u_xlat29_;
            let _e519 = u_xlat6_;
            let _e521 = (vec3(_e517) * _e519.xyz);
            u_xlat6_.x = _e521.x;
            u_xlat6_.y = _e521.y;
            u_xlat6_.z = _e521.z;
            let _e530 = u_xlat28_;
            u_xlat29_ = (1f / _e530);
            let _e532 = u_xlat28_;
            let _e533 = u_xlati27_;
            let _e538 = _f_buffer1_.f_cb1_[(_e533 + 512i)];
            u_xlat28_ = (_e532 * _e538.x);
            let _e541 = u_xlat28_;
            let _e543 = u_xlat28_;
            u_xlat28_ = ((-(_e541) * _e543) + 1f);
            let _e547 = u_xlat28_;
            u_xlat28_ = max(_e547, 0f);
            let _e550 = u_xlat28_;
            let _e551 = u_xlat28_;
            u_xlat28_ = (_e550 * _e551);
            let _e553 = u_xlat28_;
            let _e554 = u_xlat29_;
            u_xlat28_ = (_e553 * _e554);
            let _e556 = u_xlati27_;
            let _e561 = _f_buffer1_.f_cb1_[(_e556 + 768i)];
            let _e563 = u_xlat6_;
            u_xlat29_ = dot(_e561.xyz, _e563.xyz);
            let _e566 = u_xlat29_;
            let _e567 = u_xlati27_;
            let _e572 = _f_buffer1_.f_cb1_[(_e567 + 512i)];
            let _e575 = u_xlati27_;
            let _e580 = _f_buffer1_.f_cb1_[(_e575 + 512i)];
            u_xlat29_ = ((_e566 * _e572.z) + _e580.w);
            let _e583 = u_xlat29_;
            u_xlat29_ = clamp(_e583, 0f, 1f);
            let _e587 = u_xlat29_;
            let _e588 = u_xlat29_;
            u_xlat29_ = (_e587 * _e588);
            let _e590 = u_xlat28_;
            let _e591 = u_xlat29_;
            u_xlat28_ = (_e590 * _e591);
            let _e593 = u_xlat7_;
            let _e595 = u_xlat28_;
            let _e597 = u_xlati27_;
            let _e602 = _f_buffer1_.f_cb1_[(_e597 + 256i)];
            let _e604 = (vec3(_e595) * _e602.xyz);
            u_xlat7_.x = _e604.x;
            u_xlat7_.y = _e604.y;
            u_xlat7_.z = _e604.z;
            let _e611 = u_xlat2_;
            let _e613 = u_xlat6_;
            u_xlat27_ = dot(_e611.xyz, _e613.xyz);
            let _e616 = u_xlat27_;
            u_xlat27_ = clamp(_e616, 0f, 1f);
            let _e620 = u_xlat6_;
            let _e622 = u_xlat27_;
            let _e624 = u_xlat7_;
            let _e626 = (vec3(_e622) * _e624.xyz);
            u_xlat6_.x = _e626.x;
            u_xlat6_.y = _e626.y;
            u_xlat6_.z = _e626.z;
            let _e633 = u_xlat5_;
            let _e635 = u_xlat6_;
            let _e637 = u_xlat0_;
            let _e640 = u_xlat5_;
            let _e642 = ((_e635.xyz * _e637.yzw) + _e640.xyz);
            u_xlat5_.x = _e642.x;
            u_xlat5_.y = _e642.y;
            u_xlat5_.z = _e642.z;
        }
        continuing {
            let _e456 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e456 + 1u);
        }
    }
    let _e649 = u_xlat8_;
    let _e651 = u_xlat3_;
    let _e653 = u_xlat0_;
    let _e656 = u_xlat4_;
    let _e658 = ((_e651.xyz * _e653.yzw) + _e656.xyz);
    u_xlat8_.x = _e658.x;
    u_xlat8_.y = _e658.y;
    u_xlat8_.z = _e658.z;
    let _e665 = u_xlat8_;
    let _e667 = u_xlat5_;
    let _e669 = u_xlat8_;
    let _e671 = (_e667.xyz + _e669.xyz);
    u_xlat8_.x = _e671.x;
    u_xlat8_.y = _e671.y;
    u_xlat8_.z = _e671.z;
    let _e678 = SV_Target0_;
    let _e680 = u_xlat1_;
    let _e685 = _f_buffer3_.f_cb3_[4];
    let _e688 = u_xlat8_;
    let _e690 = ((_e680.xyz * _e685.xyz) + _e688.xyz);
    SV_Target0_.x = _e690.x;
    SV_Target0_.y = _e690.y;
    SV_Target0_.z = _e690.z;
    let _e700 = _f_buffer3_.f_cb3_[5];
    u_xlatb8_ = (_e700.y == 1f);
    let _e705 = u_xlatb8_;
    if _e705 {
        let _e706 = u_xlat0_;
        local_4 = _e706.x;
    } else {
        local_4 = 1f;
    }
    let _e710 = local_4;
    SV_Target0_.w = _e710;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec3<f32>, @location(2) vs_TEXCOORD2_: vec3<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_TEXCOORD2_1 = vs_TEXCOORD2_;
    main_1();
    let _e40 = SV_Target0_;
    return FragmentOutput(_e40);
}
