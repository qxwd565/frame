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
    var u_xlat4_: f32 = 0f;
    var u_xlati4_: i32 = 0i;
    var u_xlatu4_: u32 = 0u;
    var u_xlatb4_: bool = false;
    var u_xlat5_: vec3<f32> = vec3(0f);
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

    let _e97 = vs_TEXCOORD0_1;
    let _e102 = _f_buffer0_.f_cb0_[4];
    let _e107 = hscard_bias.values[1];
    let _e110 = textureSampleBias(f_t1_, samplerf_s1_, _e97.xy, (_e102.x + _e107.x));
    u_xlat0_ = _e110;
    let _e112 = vs_TEXCOORD0_1;
    let _e114 = dpdx(_e112.x);
    u_xlat1_.x = _e114;
    let _e115 = vs_TEXCOORD0_1;
    let _e117 = dpdy(_e115.x);
    u_xlat7_ = _e117;
    let _e119 = u_xlat7_;
    let _e121 = u_xlat1_;
    u_xlat1_.x = (abs(_e119) + abs(_e121.x));
    let _e125 = u_xlat1_;
    let _e127 = u_xlat1_;
    let _e133 = (_e127.xx * vec2<f32>(0.5f, -0.5f));
    u_xlat1_.x = _e133.x;
    u_xlat1_.y = _e133.y;
    u_xlat1_.z = 0f;
    let _e140 = u_xlat1_;
    let _e142 = vs_TEXCOORD0_1;
    u_xlat2_ = (_e140.xzyz + _e142.xyxy);
    let _e145 = u_xlat2_;
    let _e150 = _f_buffer0_.f_cb0_[4];
    let _e155 = hscard_bias.values[1];
    let _e158 = textureSampleBias(f_t1_, samplerf_s1_, _e145.xy, (_e150.x + _e155.x));
    u_xlat3_ = _e158;
    let _e159 = u_xlat0_;
    let _e160 = u_xlat3_;
    u_xlat0_ = (_e159 + _e160);
    let _e162 = u_xlat2_;
    let _e167 = _f_buffer0_.f_cb0_[4];
    let _e172 = hscard_bias.values[1];
    let _e175 = textureSampleBias(f_t1_, samplerf_s1_, _e162.zw, (_e167.x + _e172.x));
    u_xlat2_ = _e175;
    let _e176 = u_xlat0_;
    let _e177 = u_xlat2_;
    u_xlat0_ = (_e176 + _e177);
    let _e179 = u_xlat1_;
    let _e181 = vs_TEXCOORD0_1;
    u_xlat1_ = (_e179.zxzy + _e181.xyxy);
    let _e184 = u_xlat1_;
    let _e189 = _f_buffer0_.f_cb0_[4];
    let _e194 = hscard_bias.values[1];
    let _e197 = textureSampleBias(f_t1_, samplerf_s1_, _e184.xy, (_e189.x + _e194.x));
    u_xlat2_ = _e197;
    let _e198 = u_xlat0_;
    let _e199 = u_xlat2_;
    u_xlat0_ = (_e198 + _e199);
    let _e201 = u_xlat1_;
    let _e206 = _f_buffer0_.f_cb0_[4];
    let _e211 = hscard_bias.values[1];
    let _e214 = textureSampleBias(f_t1_, samplerf_s1_, _e201.zw, (_e206.x + _e211.x));
    u_xlat1_ = _e214;
    let _e215 = u_xlat0_;
    let _e216 = u_xlat1_;
    u_xlat0_ = (_e215 + _e216);
    let _e218 = u_xlat0_;
    u_xlat0_ = (_e218 * vec4<f32>(0.2f, 0.2f, 0.2f, 0.2f));
    let _e229 = _f_buffer4_.f_cb4_[1];
    u_xlatb1_ = (0f < _e229.x);
    let _e232 = u_xlatb1_;
    if _e232 {
        {
            let _e233 = vs_TEXCOORD5_1;
            let _e238 = _f_buffer0_.f_cb0_[4];
            let _e243 = hscard_bias.values[2];
            let _e246 = textureSampleBias(f_t2_, samplerf_s2_, _e233.xy, (_e238.x + _e243.x));
            u_xlat1_ = _e246;
            let _e250 = _f_buffer4_.f_cb4_[3];
            let _e252 = u_xlat1_;
            u_xlatb1_ = (_e250.x < _e252.x);
            let _e256 = u_xlatb1_;
            if _e256 {
                local = 1f;
            } else {
                local = 0f;
            }
            let _e261 = local;
            u_xlat1_.x = _e261;
            let _e263 = u_xlat0_;
            let _e265 = u_xlat1_;
            u_xlat0_.w = (_e263.w * _e265.x);
        }
    }
    let _e269 = vs_NORMAL0_1;
    let _e271 = vs_NORMAL0_1;
    u_xlat1_.x = dot(_e269.xyz, _e271.xyz);
    let _e275 = u_xlat1_;
    u_xlat1_.x = inverseSqrt(_e275.x);
    let _e278 = u_xlat1_;
    let _e280 = u_xlat1_;
    let _e282 = vs_NORMAL0_1;
    let _e284 = (_e280.xxx * _e282.xyz);
    u_xlat1_.x = _e284.x;
    u_xlat1_.y = _e284.y;
    u_xlat1_.z = _e284.z;
    let _e291 = vs_TEXCOORDindex3_1;
    let _e292 = _e291.xy;
    let _e293 = vs_TEXCOORDindex3_1;
    txVec0_ = vec3<f32>(_e292.x, _e292.y, _e293.z);
    let _e299 = txVec0_;
    let _e303 = textureSampleCompareLevel(f_t0_, samplerf_s0_, _e299.xy, _e299.z);
    u_xlat19_ = _e303;
    let _e308 = _f_buffer3_.f_cb3_[27];
    u_xlat2_.x = (-(_e308.x) + 1f);
    let _e313 = u_xlat19_;
    let _e317 = _f_buffer3_.f_cb3_[27];
    let _e320 = u_xlat2_;
    u_xlat19_ = ((_e313 * _e317.x) + _e320.x);
    let _e324 = vs_TEXCOORDindex3_1;
    u_xlatb2_ = (0f >= _e324.z);
    let _e327 = vs_TEXCOORDindex3_1;
    u_xlatb8_ = (_e327.z >= 1f);
    let _e331 = u_xlatb8_;
    let _e332 = u_xlatb2_;
    u_xlatb2_ = (_e331 || _e332);
    let _e334 = u_xlatb2_;
    if _e334 {
        local_1 = 1f;
    } else {
        let _e336 = u_xlat19_;
        local_1 = _e336;
    }
    let _e338 = local_1;
    u_xlat19_ = _e338;
    let _e339 = u_xlat19_;
    let _e343 = _f_buffer2_.f_cb2_[11];
    u_xlat19_ = (_e339 * _e343.z);
    let _e346 = u_xlat2_;
    let _e348 = u_xlat19_;
    let _e353 = _f_buffer0_.f_cb0_[6];
    let _e355 = (vec3(_e348) * _e353.xyz);
    u_xlat2_.x = _e355.x;
    u_xlat2_.y = _e355.y;
    u_xlat2_.z = _e355.z;
    let _e362 = u_xlat1_;
    let _e367 = _f_buffer0_.f_cb0_[5];
    u_xlat19_ = dot(_e362.xyz, _e367.xyz);
    let _e370 = u_xlat19_;
    u_xlat19_ = clamp(_e370, 0f, 1f);
    let _e377 = _f_buffer0_.f_cb0_[10];
    let _e382 = _f_buffer2_.f_cb2_[11];
    u_xlat20_ = min(_e377.x, _e382.y);
    let _e385 = u_xlat20_;
    u_xlatu20_ = u32(i32(_e385));
    u_xlat3_.x = 0f;
    u_xlat3_.y = 0f;
    u_xlat3_.z = 0f;
    loop {
        let _e400 = u_xlatu_loop_1_;
        let _e401 = u_xlatu20_;
        if !((_e400 < _e401)) {
            break;
        }
        {
            let _e407 = u_xlatu_loop_1_;
            u_xlatu4_ = (_e407 >> 2u);
            let _e410 = u_xlatu_loop_1_;
            u_xlati10_ = i32((_e410 & 3u));
            let _e414 = u_xlatu4_;
            let _e420 = _f_buffer2_.f_cb2_[(i32(_e414) + 12i)];
            let _e421 = u_xlati10_;
            let _e425 = local_2[_e421];
            u_xlat4_ = dot(_e420, bitcast<vec4<f32>>(_e425));
            let _e428 = u_xlat4_;
            u_xlati4_ = i32(_e428);
            let _e430 = u_xlat10_;
            let _e432 = vs_TEXCOORD1_1;
            let _e435 = u_xlati4_;
            let _e438 = _f_buffer1_.f_cb1_[_e435];
            let _e441 = u_xlati4_;
            let _e444 = _f_buffer1_.f_cb1_[_e441];
            let _e446 = ((-(_e432.xyz) * _e438.www) + _e444.xyz);
            u_xlat10_.x = _e446.x;
            u_xlat10_.y = _e446.y;
            u_xlat10_.z = _e446.z;
            let _e454 = u_xlat10_;
            let _e456 = u_xlat10_;
            u_xlat5_.x = dot(_e454.xyz, _e456.xyz);
            let _e460 = u_xlat5_;
            u_xlat5_.x = max(_e460.x, 0.000061035156f);
            let _e464 = u_xlat5_;
            u_xlat11_ = inverseSqrt(_e464.x);
            let _e467 = u_xlat10_;
            let _e469 = u_xlat10_;
            let _e471 = u_xlat11_;
            let _e473 = (_e469.xyz * vec3(_e471));
            u_xlat10_.x = _e473.x;
            u_xlat10_.y = _e473.y;
            u_xlat10_.z = _e473.z;
            let _e482 = u_xlati4_;
            let _e487 = _f_buffer1_.f_cb1_[(_e482 + 512i)];
            u_xlat11_ = (1f / _e487.x);
            let _e491 = u_xlat5_;
            u_xlat5_.x = (_e491.x * 25f);
            let _e496 = u_xlat5_;
            let _e498 = u_xlat11_;
            u_xlat5_.x = (_e496.x / _e498);
            let _e501 = u_xlat5_;
            u_xlat5_.x = (_e501.x + 1f);
            let _e508 = u_xlat5_;
            u_xlat5_.x = (1f / _e508.x);
            let _e511 = u_xlati4_;
            let _e516 = _f_buffer1_.f_cb1_[(_e511 + 768i)];
            let _e518 = u_xlat10_;
            u_xlat11_ = dot(_e516.xyz, _e518.xyz);
            let _e521 = u_xlat11_;
            let _e522 = u_xlati4_;
            let _e527 = _f_buffer1_.f_cb1_[(_e522 + 512i)];
            let _e530 = u_xlati4_;
            let _e535 = _f_buffer1_.f_cb1_[(_e530 + 512i)];
            u_xlat11_ = ((_e521 * _e527.z) + _e535.w);
            let _e538 = u_xlat11_;
            u_xlat11_ = clamp(_e538, 0f, 1f);
            let _e542 = u_xlat11_;
            let _e543 = u_xlat11_;
            u_xlat11_ = (_e542 * _e543);
            let _e546 = u_xlat11_;
            let _e547 = u_xlat5_;
            u_xlat5_.x = (_e546 * _e547.x);
            let _e550 = u_xlat5_;
            let _e552 = u_xlat5_;
            let _e554 = u_xlati4_;
            let _e559 = _f_buffer1_.f_cb1_[(_e554 + 256i)];
            let _e561 = (_e552.xxx * _e559.xyz);
            u_xlat5_.x = _e561.x;
            u_xlat5_.y = _e561.y;
            u_xlat5_.z = _e561.z;
            let _e568 = u_xlat1_;
            let _e570 = u_xlat10_;
            u_xlat4_ = dot(_e568.xyz, _e570.xyz);
            let _e573 = u_xlat4_;
            u_xlat4_ = clamp(_e573, 0f, 1f);
            let _e577 = u_xlat3_;
            let _e579 = u_xlat5_;
            let _e581 = u_xlat4_;
            let _e584 = u_xlat3_;
            let _e586 = ((_e579.xyz * vec3(_e581)) + _e584.xyz);
            u_xlat3_.x = _e586.x;
            u_xlat3_.y = _e586.y;
            u_xlat3_.z = _e586.z;
        }
        continuing {
            let _e404 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e404 + 1u);
        }
    }
    let _e593 = u_xlat1_;
    let _e595 = u_xlat2_;
    let _e597 = u_xlat19_;
    let _e600 = u_xlat3_;
    let _e602 = ((_e595.xyz * vec3(_e597)) + _e600.xyz);
    u_xlat1_.x = _e602.x;
    u_xlat1_.y = _e602.y;
    u_xlat1_.z = _e602.z;
    let _e613 = _f_buffer2_.f_cb2_[27];
    u_xlat2_.x = abs(_e613.w);
    let _e620 = _f_buffer2_.f_cb2_[28];
    u_xlat2_.y = abs(_e620.w);
    let _e627 = _f_buffer2_.f_cb2_[29];
    u_xlat2_.z = abs(_e627.w);
    let _e630 = u_xlat2_;
    let _e632 = u_xlat2_;
    let _e634 = log2(_e632.xyz);
    u_xlat2_.x = _e634.x;
    u_xlat2_.y = _e634.y;
    u_xlat2_.z = _e634.z;
    let _e641 = u_xlat2_;
    let _e643 = u_xlat2_;
    let _e649 = (_e643.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat2_.x = _e649.x;
    u_xlat2_.y = _e649.y;
    u_xlat2_.z = _e649.z;
    let _e656 = u_xlat2_;
    let _e658 = u_xlat2_;
    let _e660 = exp2(_e658.xyz);
    u_xlat2_.x = _e660.x;
    u_xlat2_.y = _e660.y;
    u_xlat2_.z = _e660.z;
    let _e667 = u_xlat2_;
    let _e669 = u_xlat2_;
    let _e683 = ((_e669.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat2_.x = _e683.x;
    u_xlat2_.y = _e683.y;
    u_xlat2_.z = _e683.z;
    let _e690 = u_xlat2_;
    let _e692 = u_xlat2_;
    let _e698 = clamp(_e692.xyz, vec3(0f), vec3(1f));
    u_xlat2_.x = _e698.x;
    u_xlat2_.y = _e698.y;
    u_xlat2_.z = _e698.z;
    let _e705 = u_xlat1_;
    let _e707 = u_xlat1_;
    let _e709 = u_xlat2_;
    let _e711 = (_e707.xyz + _e709.xyz);
    u_xlat1_.x = _e711.x;
    u_xlat1_.y = _e711.y;
    u_xlat1_.z = _e711.z;
    let _e718 = u_xlat1_;
    let _e720 = u_xlat0_;
    let _e722 = u_xlat1_;
    let _e724 = (_e720.xyz * _e722.xyz);
    u_xlat1_.x = _e724.x;
    u_xlat1_.y = _e724.y;
    u_xlat1_.z = _e724.z;
    let _e731 = u_xlat0_;
    let _e733 = u_xlat0_;
    let _e735 = u_xlat1_;
    let _e737 = (_e733.www * _e735.xyz);
    u_xlat0_.x = _e737.x;
    u_xlat0_.y = _e737.y;
    u_xlat0_.z = _e737.z;
    let _e744 = u_xlat0_;
    SV_Target0_ = _e744;
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
