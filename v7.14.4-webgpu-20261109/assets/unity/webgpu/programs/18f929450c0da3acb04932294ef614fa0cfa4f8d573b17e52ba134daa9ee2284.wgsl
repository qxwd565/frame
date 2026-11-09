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
    f_cb3_: array<vec4<f32>, 4>,
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
var<private> vs_TEXCOORD5_1: vec2<f32>;
var<private> vs_TEXCOORD1_1: vec3<f32>;
var<private> vs_NORMAL0_1: vec3<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlatb1_: bool = false;
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec4<f32> = vec4(0f);
    var u_xlat4_: vec4<f32> = vec4(0f);
    var u_xlati4_: i32 = 0i;
    var u_xlatu4_: u32 = 0u;
    var u_xlatb4_: bool = false;
    var u_xlat5_: vec4<f32> = vec4(0f);
    var u_xlat7_: f32 = 0f;
    var u_xlat10_: vec3<f32> = vec3(0f);
    var u_xlati10_: i32 = 0i;
    var u_xlat11_: f32 = 0f;
    var u_xlat19_: f32 = 0f;
    var u_xlat20_: f32 = 0f;
    var u_xlatu20_: u32 = 0u;
    var u_xlatu21_: u32 = 0u;
    var local: f32;
    var u_xlatu_loop_1_: u32 = 0u;
    var local_1: array<vec4<u32>, 4> = ImmCB_0_;

    let _e86 = vs_TEXCOORD0_1;
    let _e91 = _f_buffer0_.f_cb0_[4];
    let _e96 = hscard_bias.values[0];
    let _e99 = textureSampleBias(f_t0_, samplerf_s0_, _e86.xy, (_e91.x + _e96.x));
    u_xlat0_ = _e99;
    let _e101 = vs_TEXCOORD0_1;
    let _e103 = dpdx(_e101.x);
    u_xlat1_.x = _e103;
    let _e104 = vs_TEXCOORD0_1;
    let _e106 = dpdy(_e104.x);
    u_xlat7_ = _e106;
    let _e108 = u_xlat7_;
    let _e110 = u_xlat1_;
    u_xlat1_.x = (abs(_e108) + abs(_e110.x));
    let _e115 = u_xlat1_;
    u_xlat2_.x = (_e115.x * 0.5f);
    u_xlat2_.y = 0f;
    let _e121 = u_xlat2_;
    let _e123 = vs_TEXCOORD0_1;
    u_xlat2_ = (_e121.xyxx + _e123.xyxy);
    let _e126 = u_xlat2_;
    let _e131 = _f_buffer0_.f_cb0_[4];
    let _e136 = hscard_bias.values[0];
    let _e139 = textureSampleBias(f_t0_, samplerf_s0_, _e126.xy, (_e131.x + _e136.x));
    u_xlat3_ = _e139;
    let _e140 = u_xlat0_;
    let _e141 = u_xlat3_;
    u_xlat0_ = (_e140 + _e141);
    u_xlat1_.y = 0f;
    let _e145 = u_xlat1_;
    let _e147 = vs_TEXCOORD0_1;
    u_xlat3_ = (_e145.xyyx + _e147.xyxy);
    let _e150 = u_xlat3_;
    let _e155 = _f_buffer0_.f_cb0_[4];
    let _e160 = hscard_bias.values[0];
    let _e163 = textureSampleBias(f_t0_, samplerf_s0_, _e150.xy, (_e155.x + _e160.x));
    u_xlat4_ = _e163;
    let _e164 = u_xlat0_;
    let _e165 = u_xlat4_;
    u_xlat0_ = (_e164 + _e165);
    let _e167 = u_xlat1_;
    let _e169 = u_xlat1_;
    let _e174 = (_e169.xx * vec2<f32>(0.5f, 0.5f));
    u_xlat1_.z = _e174.x;
    u_xlat1_.w = _e174.y;
    let _e179 = u_xlat1_;
    let _e181 = vs_TEXCOORD0_1;
    u_xlat4_ = (_e179.yzxz + _e181.xyxy);
    let _e184 = u_xlat4_;
    let _e189 = _f_buffer0_.f_cb0_[4];
    let _e194 = hscard_bias.values[0];
    let _e197 = textureSampleBias(f_t0_, samplerf_s0_, _e184.xy, (_e189.x + _e194.x));
    u_xlat5_ = _e197;
    let _e198 = u_xlat0_;
    let _e199 = u_xlat5_;
    u_xlat0_ = (_e198 + _e199);
    let _e201 = u_xlat2_;
    let _e206 = _f_buffer0_.f_cb0_[4];
    let _e211 = hscard_bias.values[0];
    let _e214 = textureSampleBias(f_t0_, samplerf_s0_, _e201.zw, (_e206.x + _e211.x));
    u_xlat2_ = _e214;
    let _e215 = u_xlat0_;
    let _e216 = u_xlat2_;
    u_xlat0_ = (_e215 + _e216);
    let _e218 = u_xlat4_;
    let _e223 = _f_buffer0_.f_cb0_[4];
    let _e228 = hscard_bias.values[0];
    let _e231 = textureSampleBias(f_t0_, samplerf_s0_, _e218.zw, (_e223.x + _e228.x));
    u_xlat2_ = _e231;
    let _e232 = u_xlat0_;
    let _e233 = u_xlat2_;
    u_xlat0_ = (_e232 + _e233);
    let _e235 = u_xlat3_;
    let _e240 = _f_buffer0_.f_cb0_[4];
    let _e245 = hscard_bias.values[0];
    let _e248 = textureSampleBias(f_t0_, samplerf_s0_, _e235.zw, (_e240.x + _e245.x));
    u_xlat2_ = _e248;
    let _e249 = u_xlat0_;
    let _e250 = u_xlat2_;
    u_xlat0_ = (_e249 + _e250);
    let _e252 = u_xlat1_;
    let _e254 = vs_TEXCOORD0_1;
    u_xlat1_ = (_e252.wxxx + _e254.xyxy);
    let _e257 = u_xlat1_;
    let _e262 = _f_buffer0_.f_cb0_[4];
    let _e267 = hscard_bias.values[0];
    let _e270 = textureSampleBias(f_t0_, samplerf_s0_, _e257.xy, (_e262.x + _e267.x));
    u_xlat2_ = _e270;
    let _e271 = u_xlat0_;
    let _e272 = u_xlat2_;
    u_xlat0_ = (_e271 + _e272);
    let _e274 = u_xlat1_;
    let _e279 = _f_buffer0_.f_cb0_[4];
    let _e284 = hscard_bias.values[0];
    let _e287 = textureSampleBias(f_t0_, samplerf_s0_, _e274.zw, (_e279.x + _e284.x));
    u_xlat1_ = _e287;
    let _e288 = u_xlat0_;
    let _e289 = u_xlat1_;
    u_xlat0_ = (_e288 + _e289);
    let _e291 = u_xlat0_;
    u_xlat0_ = (_e291 * vec4<f32>(0.11111111f, 0.11111111f, 0.11111111f, 0.11111111f));
    let _e302 = _f_buffer3_.f_cb3_[1];
    u_xlatb1_ = (0f < _e302.x);
    let _e305 = u_xlatb1_;
    if _e305 {
        {
            let _e306 = vs_TEXCOORD5_1;
            let _e311 = _f_buffer0_.f_cb0_[4];
            let _e316 = hscard_bias.values[1];
            let _e319 = textureSampleBias(f_t1_, samplerf_s1_, _e306.xy, (_e311.x + _e316.x));
            u_xlat1_ = _e319;
            let _e323 = _f_buffer3_.f_cb3_[3];
            let _e325 = u_xlat1_;
            u_xlatb1_ = (_e323.x < _e325.x);
            let _e329 = u_xlatb1_;
            if _e329 {
                local = 1f;
            } else {
                local = 0f;
            }
            let _e334 = local;
            u_xlat1_.x = _e334;
            let _e336 = u_xlat0_;
            let _e338 = u_xlat1_;
            u_xlat0_.w = (_e336.w * _e338.x);
        }
    }
    let _e342 = vs_NORMAL0_1;
    let _e344 = vs_NORMAL0_1;
    u_xlat1_.x = dot(_e342.xyz, _e344.xyz);
    let _e348 = u_xlat1_;
    u_xlat1_.x = inverseSqrt(_e348.x);
    let _e351 = u_xlat1_;
    let _e353 = u_xlat1_;
    let _e355 = vs_NORMAL0_1;
    let _e357 = (_e353.xxx * _e355.xyz);
    u_xlat1_.x = _e357.x;
    u_xlat1_.y = _e357.y;
    u_xlat1_.z = _e357.z;
    let _e364 = u_xlat2_;
    let _e369 = _f_buffer0_.f_cb0_[6];
    let _e374 = _f_buffer2_.f_cb2_[11];
    let _e376 = (_e369.xyz * _e374.zzz);
    u_xlat2_.x = _e376.x;
    u_xlat2_.y = _e376.y;
    u_xlat2_.z = _e376.z;
    let _e383 = u_xlat1_;
    let _e388 = _f_buffer0_.f_cb0_[5];
    u_xlat19_ = dot(_e383.xyz, _e388.xyz);
    let _e391 = u_xlat19_;
    u_xlat19_ = clamp(_e391, 0f, 1f);
    let _e398 = _f_buffer0_.f_cb0_[10];
    let _e403 = _f_buffer2_.f_cb2_[11];
    u_xlat20_ = min(_e398.x, _e403.y);
    let _e406 = u_xlat20_;
    u_xlatu20_ = u32(i32(_e406));
    u_xlat3_.x = 0f;
    u_xlat3_.y = 0f;
    u_xlat3_.z = 0f;
    loop {
        let _e421 = u_xlatu_loop_1_;
        let _e422 = u_xlatu20_;
        if !((_e421 < _e422)) {
            break;
        }
        {
            let _e428 = u_xlatu_loop_1_;
            u_xlatu4_ = (_e428 >> 2u);
            let _e431 = u_xlatu_loop_1_;
            u_xlati10_ = i32((_e431 & 3u));
            let _e436 = u_xlatu4_;
            let _e442 = _f_buffer2_.f_cb2_[(i32(_e436) + 12i)];
            let _e443 = u_xlati10_;
            let _e447 = local_1[_e443];
            u_xlat4_.x = dot(_e442, bitcast<vec4<f32>>(_e447));
            let _e450 = u_xlat4_;
            u_xlati4_ = i32(_e450.x);
            let _e453 = u_xlat10_;
            let _e455 = vs_TEXCOORD1_1;
            let _e458 = u_xlati4_;
            let _e461 = _f_buffer1_.f_cb1_[_e458];
            let _e464 = u_xlati4_;
            let _e467 = _f_buffer1_.f_cb1_[_e464];
            let _e469 = ((-(_e455.xyz) * _e461.www) + _e467.xyz);
            u_xlat10_.x = _e469.x;
            u_xlat10_.y = _e469.y;
            u_xlat10_.z = _e469.z;
            let _e477 = u_xlat10_;
            let _e479 = u_xlat10_;
            u_xlat5_.x = dot(_e477.xyz, _e479.xyz);
            let _e483 = u_xlat5_;
            u_xlat5_.x = max(_e483.x, 0.000061035156f);
            let _e487 = u_xlat5_;
            u_xlat11_ = inverseSqrt(_e487.x);
            let _e490 = u_xlat10_;
            let _e492 = u_xlat10_;
            let _e494 = u_xlat11_;
            let _e496 = (_e492.xyz * vec3(_e494));
            u_xlat10_.x = _e496.x;
            u_xlat10_.y = _e496.y;
            u_xlat10_.z = _e496.z;
            let _e505 = u_xlati4_;
            let _e510 = _f_buffer1_.f_cb1_[(_e505 + 512i)];
            u_xlat11_ = (1f / _e510.x);
            let _e514 = u_xlat5_;
            u_xlat5_.x = (_e514.x * 25f);
            let _e519 = u_xlat5_;
            let _e521 = u_xlat11_;
            u_xlat5_.x = (_e519.x / _e521);
            let _e524 = u_xlat5_;
            u_xlat5_.x = (_e524.x + 1f);
            let _e531 = u_xlat5_;
            u_xlat5_.x = (1f / _e531.x);
            let _e534 = u_xlati4_;
            let _e539 = _f_buffer1_.f_cb1_[(_e534 + 768i)];
            let _e541 = u_xlat10_;
            u_xlat11_ = dot(_e539.xyz, _e541.xyz);
            let _e544 = u_xlat11_;
            let _e545 = u_xlati4_;
            let _e550 = _f_buffer1_.f_cb1_[(_e545 + 512i)];
            let _e553 = u_xlati4_;
            let _e558 = _f_buffer1_.f_cb1_[(_e553 + 512i)];
            u_xlat11_ = ((_e544 * _e550.z) + _e558.w);
            let _e561 = u_xlat11_;
            u_xlat11_ = clamp(_e561, 0f, 1f);
            let _e565 = u_xlat11_;
            let _e566 = u_xlat11_;
            u_xlat11_ = (_e565 * _e566);
            let _e569 = u_xlat11_;
            let _e570 = u_xlat5_;
            u_xlat5_.x = (_e569 * _e570.x);
            let _e573 = u_xlat5_;
            let _e575 = u_xlat5_;
            let _e577 = u_xlati4_;
            let _e582 = _f_buffer1_.f_cb1_[(_e577 + 256i)];
            let _e584 = (_e575.xxx * _e582.xyz);
            u_xlat5_.x = _e584.x;
            u_xlat5_.y = _e584.y;
            u_xlat5_.z = _e584.z;
            let _e592 = u_xlat1_;
            let _e594 = u_xlat10_;
            u_xlat4_.x = dot(_e592.xyz, _e594.xyz);
            let _e598 = u_xlat4_;
            u_xlat4_.x = clamp(_e598.x, 0f, 1f);
            let _e603 = u_xlat3_;
            let _e605 = u_xlat5_;
            let _e607 = u_xlat4_;
            let _e610 = u_xlat3_;
            let _e612 = ((_e605.xyz * _e607.xxx) + _e610.xyz);
            u_xlat3_.x = _e612.x;
            u_xlat3_.y = _e612.y;
            u_xlat3_.z = _e612.z;
        }
        continuing {
            let _e425 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e425 + 1u);
        }
    }
    let _e619 = u_xlat1_;
    let _e621 = u_xlat2_;
    let _e623 = u_xlat19_;
    let _e626 = u_xlat3_;
    let _e628 = ((_e621.xyz * vec3(_e623)) + _e626.xyz);
    u_xlat1_.x = _e628.x;
    u_xlat1_.y = _e628.y;
    u_xlat1_.z = _e628.z;
    let _e639 = _f_buffer2_.f_cb2_[27];
    u_xlat2_.x = abs(_e639.w);
    let _e646 = _f_buffer2_.f_cb2_[28];
    u_xlat2_.y = abs(_e646.w);
    let _e653 = _f_buffer2_.f_cb2_[29];
    u_xlat2_.z = abs(_e653.w);
    let _e656 = u_xlat2_;
    let _e658 = u_xlat2_;
    let _e660 = log2(_e658.xyz);
    u_xlat2_.x = _e660.x;
    u_xlat2_.y = _e660.y;
    u_xlat2_.z = _e660.z;
    let _e667 = u_xlat2_;
    let _e669 = u_xlat2_;
    let _e675 = (_e669.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat2_.x = _e675.x;
    u_xlat2_.y = _e675.y;
    u_xlat2_.z = _e675.z;
    let _e682 = u_xlat2_;
    let _e684 = u_xlat2_;
    let _e686 = exp2(_e684.xyz);
    u_xlat2_.x = _e686.x;
    u_xlat2_.y = _e686.y;
    u_xlat2_.z = _e686.z;
    let _e693 = u_xlat2_;
    let _e695 = u_xlat2_;
    let _e709 = ((_e695.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat2_.x = _e709.x;
    u_xlat2_.y = _e709.y;
    u_xlat2_.z = _e709.z;
    let _e716 = u_xlat2_;
    let _e718 = u_xlat2_;
    let _e724 = clamp(_e718.xyz, vec3(0f), vec3(1f));
    u_xlat2_.x = _e724.x;
    u_xlat2_.y = _e724.y;
    u_xlat2_.z = _e724.z;
    let _e731 = u_xlat1_;
    let _e733 = u_xlat1_;
    let _e735 = u_xlat2_;
    let _e737 = (_e733.xyz + _e735.xyz);
    u_xlat1_.x = _e737.x;
    u_xlat1_.y = _e737.y;
    u_xlat1_.z = _e737.z;
    let _e744 = u_xlat1_;
    let _e746 = u_xlat0_;
    let _e748 = u_xlat1_;
    let _e750 = (_e746.xyz * _e748.xyz);
    u_xlat1_.x = _e750.x;
    u_xlat1_.y = _e750.y;
    u_xlat1_.z = _e750.z;
    let _e757 = u_xlat0_;
    let _e759 = u_xlat0_;
    let _e761 = u_xlat1_;
    let _e763 = (_e759.www * _e761.xyz);
    u_xlat0_.x = _e763.x;
    u_xlat0_.y = _e763.y;
    u_xlat0_.z = _e763.z;
    let _e770 = u_xlat0_;
    SV_Target0_ = _e770;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(5) vs_TEXCOORD5_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec3<f32>, @location(12) vs_NORMAL0_: vec3<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD5_1 = vs_TEXCOORD5_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_NORMAL0_1 = vs_NORMAL0_;
    main_1();
    let _e44 = SV_Target0_;
    return FragmentOutput(_e44);
}
