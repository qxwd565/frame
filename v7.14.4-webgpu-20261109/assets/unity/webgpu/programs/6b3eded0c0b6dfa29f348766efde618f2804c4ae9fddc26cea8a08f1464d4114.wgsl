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
var<private> vs_TEXCOORD1_1: vec2<f32>;
var<private> vs_TEXCOORD2_1: vec3<f32>;
var<private> vs_TEXCOORDindex3_1: vec4<f32>;
var<private> vs_NORMAL0_1: vec3<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec3<f32> = vec3(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlatb2_: bool = false;
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlati4_: i32 = 0i;
    var u_xlat5_: vec3<f32> = vec3(0f);
    var u_xlat6_: vec3<f32> = vec3(0f);
    var u_xlat18_: f32 = 0f;
    var u_xlat19_: f32 = 0f;
    var u_xlatu19_: u32 = 0u;
    var u_xlatb19_: bool = false;
    var u_xlatu20_: u32 = 0u;
    var u_xlat21_: f32 = 0f;
    var u_xlati21_: i32 = 0i;
    var u_xlatu21_: u32 = 0u;
    var u_xlatb21_: bool = false;
    var u_xlat22_: f32 = 0f;
    var txVec0_: vec3<f32>;
    var local: f32;
    var u_xlatu_loop_1_: u32 = 0u;
    var local_1: array<vec4<u32>, 4> = ImmCB_0_;

    let _e99 = _f_buffer4_.f_cb4_[3];
    let _e105 = _f_buffer4_.f_cb4_[3];
    u_xlat0_.x = (-(_e99.z) + _e105.y);
    let _e112 = _f_buffer4_.f_cb4_[3];
    let _e117 = _f_buffer4_.f_cb4_[3];
    u_xlat6_.x = (_e112.z + _e117.y);
    let _e121 = u_xlat0_;
    let _e124 = u_xlat6_;
    u_xlat6_.x = (-(_e121.x) + _e124.x);
    let _e128 = u_xlat0_;
    let _e131 = vs_TEXCOORD0_1;
    u_xlat0_.x = (-(_e128.x) + _e131.x);
    let _e137 = u_xlat6_;
    u_xlat6_.x = (1f / _e137.x);
    let _e141 = u_xlat6_;
    let _e143 = u_xlat0_;
    u_xlat0_.x = (_e141.x * _e143.x);
    let _e147 = u_xlat0_;
    u_xlat0_.x = clamp(_e147.x, 0f, 1f);
    let _e153 = u_xlat0_;
    u_xlat6_.x = ((_e153.x * -2f) + 3f);
    let _e161 = u_xlat0_;
    let _e163 = u_xlat0_;
    u_xlat0_.x = (_e161.x * _e163.x);
    let _e167 = u_xlat6_;
    let _e170 = u_xlat0_;
    u_xlat0_.x = ((-(_e167.x) * _e170.x) + 1f);
    let _e175 = vs_TEXCOORD0_1;
    let _e180 = _f_buffer0_.f_cb0_[4];
    let _e185 = hscard_bias.values[1];
    let _e188 = textureSampleBias(f_t1_, samplerf_s1_, _e175.xy, (_e180.x + _e185.x));
    u_xlat1_ = _e188;
    let _e189 = vs_TEXCOORD1_1;
    let _e194 = _f_buffer0_.f_cb0_[4];
    let _e199 = hscard_bias.values[2];
    let _e202 = textureSampleBias(f_t2_, samplerf_s2_, _e189.xy, (_e194.x + _e199.x));
    u_xlat2_ = _e202;
    let _e203 = u_xlat6_;
    let _e205 = u_xlat1_;
    let _e208 = u_xlat2_;
    let _e210 = (-(_e205.xyz) + _e208.xyz);
    u_xlat6_.x = _e210.x;
    u_xlat6_.y = _e210.y;
    u_xlat6_.z = _e210.z;
    let _e217 = u_xlat0_;
    let _e219 = u_xlat0_;
    let _e221 = u_xlat6_;
    let _e224 = u_xlat1_;
    let _e226 = ((_e219.xxx * _e221.xyz) + _e224.xyz);
    u_xlat0_.x = _e226.x;
    u_xlat0_.y = _e226.y;
    u_xlat0_.z = _e226.z;
    let _e233 = u_xlat0_;
    let _e235 = u_xlat0_;
    let _e240 = _f_buffer4_.f_cb4_[2];
    let _e242 = (_e235.xyz * _e240.xyz);
    u_xlat0_.x = _e242.x;
    u_xlat0_.y = _e242.y;
    u_xlat0_.z = _e242.z;
    let _e249 = vs_NORMAL0_1;
    let _e251 = vs_NORMAL0_1;
    u_xlat18_ = dot(_e249.xyz, _e251.xyz);
    let _e254 = u_xlat18_;
    u_xlat18_ = inverseSqrt(_e254);
    let _e256 = u_xlat1_;
    let _e258 = u_xlat18_;
    let _e260 = vs_NORMAL0_1;
    let _e262 = (vec3(_e258) * _e260.xyz);
    u_xlat1_.x = _e262.x;
    u_xlat1_.y = _e262.y;
    u_xlat1_.z = _e262.z;
    let _e269 = vs_TEXCOORDindex3_1;
    let _e270 = _e269.xy;
    let _e271 = vs_TEXCOORDindex3_1;
    txVec0_ = vec3<f32>(_e270.x, _e270.y, _e271.z);
    let _e277 = txVec0_;
    let _e281 = textureSampleCompareLevel(f_t0_, samplerf_s0_, _e277.xy, _e277.z);
    u_xlat18_ = _e281;
    let _e285 = _f_buffer3_.f_cb3_[27];
    u_xlat19_ = (-(_e285.x) + 1f);
    let _e290 = u_xlat18_;
    let _e294 = _f_buffer3_.f_cb3_[27];
    let _e297 = u_xlat19_;
    u_xlat18_ = ((_e290 * _e294.x) + _e297);
    let _e300 = vs_TEXCOORDindex3_1;
    u_xlatb19_ = (0f >= _e300.z);
    let _e303 = vs_TEXCOORDindex3_1;
    u_xlatb2_ = (_e303.z >= 1f);
    let _e307 = u_xlatb19_;
    let _e308 = u_xlatb2_;
    u_xlatb19_ = (_e307 || _e308);
    let _e310 = u_xlatb19_;
    if _e310 {
        local = 1f;
    } else {
        let _e312 = u_xlat18_;
        local = _e312;
    }
    let _e314 = local;
    u_xlat18_ = _e314;
    let _e315 = u_xlat18_;
    let _e319 = _f_buffer2_.f_cb2_[11];
    u_xlat18_ = (_e315 * _e319.z);
    let _e322 = u_xlat2_;
    let _e324 = u_xlat18_;
    let _e329 = _f_buffer0_.f_cb0_[6];
    let _e331 = (vec3(_e324) * _e329.xyz);
    u_xlat2_.x = _e331.x;
    u_xlat2_.y = _e331.y;
    u_xlat2_.z = _e331.z;
    let _e338 = u_xlat1_;
    let _e343 = _f_buffer0_.f_cb0_[5];
    u_xlat18_ = dot(_e338.xyz, _e343.xyz);
    let _e346 = u_xlat18_;
    u_xlat18_ = clamp(_e346, 0f, 1f);
    let _e353 = _f_buffer0_.f_cb0_[10];
    let _e358 = _f_buffer2_.f_cb2_[11];
    u_xlat19_ = min(_e353.x, _e358.y);
    let _e361 = u_xlat19_;
    u_xlatu19_ = u32(i32(_e361));
    u_xlat3_.x = 0f;
    u_xlat3_.y = 0f;
    u_xlat3_.z = 0f;
    loop {
        let _e375 = u_xlatu_loop_1_;
        let _e376 = u_xlatu19_;
        if !((_e375 < _e376)) {
            break;
        }
        {
            let _e382 = u_xlatu_loop_1_;
            u_xlatu21_ = (_e382 >> 2u);
            let _e385 = u_xlatu_loop_1_;
            u_xlati4_ = i32((_e385 & 3u));
            let _e389 = u_xlatu21_;
            let _e395 = _f_buffer2_.f_cb2_[(i32(_e389) + 12i)];
            let _e396 = u_xlati4_;
            let _e400 = local_1[_e396];
            u_xlat21_ = dot(_e395, bitcast<vec4<f32>>(_e400));
            let _e403 = u_xlat21_;
            u_xlati21_ = i32(_e403);
            let _e405 = u_xlat4_;
            let _e407 = vs_TEXCOORD2_1;
            let _e410 = u_xlati21_;
            let _e413 = _f_buffer1_.f_cb1_[_e410];
            let _e416 = u_xlati21_;
            let _e419 = _f_buffer1_.f_cb1_[_e416];
            let _e421 = ((-(_e407.xyz) * _e413.www) + _e419.xyz);
            u_xlat4_.x = _e421.x;
            u_xlat4_.y = _e421.y;
            u_xlat4_.z = _e421.z;
            let _e428 = u_xlat4_;
            let _e430 = u_xlat4_;
            u_xlat22_ = dot(_e428.xyz, _e430.xyz);
            let _e433 = u_xlat22_;
            u_xlat22_ = max(_e433, 0.000061035156f);
            let _e437 = u_xlat22_;
            u_xlat5_.x = inverseSqrt(_e437);
            let _e439 = u_xlat4_;
            let _e441 = u_xlat4_;
            let _e443 = u_xlat5_;
            let _e445 = (_e441.xyz * _e443.xxx);
            u_xlat4_.x = _e445.x;
            u_xlat4_.y = _e445.y;
            u_xlat4_.z = _e445.z;
            let _e455 = u_xlati21_;
            let _e460 = _f_buffer1_.f_cb1_[(_e455 + 512i)];
            u_xlat5_.x = (1f / _e460.x);
            let _e463 = u_xlat22_;
            u_xlat22_ = (_e463 * 25f);
            let _e466 = u_xlat22_;
            let _e467 = u_xlat5_;
            u_xlat22_ = (_e466 / _e467.x);
            let _e470 = u_xlat22_;
            u_xlat22_ = (_e470 + 1f);
            let _e475 = u_xlat22_;
            u_xlat22_ = (1f / _e475);
            let _e478 = u_xlati21_;
            let _e483 = _f_buffer1_.f_cb1_[(_e478 + 768i)];
            let _e485 = u_xlat4_;
            u_xlat5_.x = dot(_e483.xyz, _e485.xyz);
            let _e489 = u_xlat5_;
            let _e491 = u_xlati21_;
            let _e496 = _f_buffer1_.f_cb1_[(_e491 + 512i)];
            let _e499 = u_xlati21_;
            let _e504 = _f_buffer1_.f_cb1_[(_e499 + 512i)];
            u_xlat5_.x = ((_e489.x * _e496.z) + _e504.w);
            let _e508 = u_xlat5_;
            u_xlat5_.x = clamp(_e508.x, 0f, 1f);
            let _e514 = u_xlat5_;
            let _e516 = u_xlat5_;
            u_xlat5_.x = (_e514.x * _e516.x);
            let _e519 = u_xlat22_;
            let _e520 = u_xlat5_;
            u_xlat22_ = (_e519 * _e520.x);
            let _e523 = u_xlat5_;
            let _e525 = u_xlat22_;
            let _e527 = u_xlati21_;
            let _e532 = _f_buffer1_.f_cb1_[(_e527 + 256i)];
            let _e534 = (vec3(_e525) * _e532.xyz);
            u_xlat5_.x = _e534.x;
            u_xlat5_.y = _e534.y;
            u_xlat5_.z = _e534.z;
            let _e541 = u_xlat1_;
            let _e543 = u_xlat4_;
            u_xlat21_ = dot(_e541.xyz, _e543.xyz);
            let _e546 = u_xlat21_;
            u_xlat21_ = clamp(_e546, 0f, 1f);
            let _e550 = u_xlat3_;
            let _e552 = u_xlat5_;
            let _e554 = u_xlat21_;
            let _e557 = u_xlat3_;
            let _e559 = ((_e552.xyz * vec3(_e554)) + _e557.xyz);
            u_xlat3_.x = _e559.x;
            u_xlat3_.y = _e559.y;
            u_xlat3_.z = _e559.z;
        }
        continuing {
            let _e379 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e379 + 1u);
        }
    }
    let _e566 = u_xlat1_;
    let _e568 = u_xlat2_;
    let _e570 = u_xlat18_;
    let _e573 = u_xlat3_;
    let _e575 = ((_e568.xyz * vec3(_e570)) + _e573.xyz);
    u_xlat1_.x = _e575.x;
    u_xlat1_.y = _e575.y;
    u_xlat1_.z = _e575.z;
    let _e586 = _f_buffer2_.f_cb2_[27];
    u_xlat2_.x = abs(_e586.w);
    let _e593 = _f_buffer2_.f_cb2_[28];
    u_xlat2_.y = abs(_e593.w);
    let _e600 = _f_buffer2_.f_cb2_[29];
    u_xlat2_.z = abs(_e600.w);
    let _e603 = u_xlat2_;
    let _e605 = u_xlat2_;
    let _e607 = log2(_e605.xyz);
    u_xlat2_.x = _e607.x;
    u_xlat2_.y = _e607.y;
    u_xlat2_.z = _e607.z;
    let _e614 = u_xlat2_;
    let _e616 = u_xlat2_;
    let _e622 = (_e616.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat2_.x = _e622.x;
    u_xlat2_.y = _e622.y;
    u_xlat2_.z = _e622.z;
    let _e629 = u_xlat2_;
    let _e631 = u_xlat2_;
    let _e633 = exp2(_e631.xyz);
    u_xlat2_.x = _e633.x;
    u_xlat2_.y = _e633.y;
    u_xlat2_.z = _e633.z;
    let _e640 = u_xlat2_;
    let _e642 = u_xlat2_;
    let _e656 = ((_e642.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat2_.x = _e656.x;
    u_xlat2_.y = _e656.y;
    u_xlat2_.z = _e656.z;
    let _e663 = u_xlat2_;
    let _e665 = u_xlat2_;
    let _e671 = clamp(_e665.xyz, vec3(0f), vec3(1f));
    u_xlat2_.x = _e671.x;
    u_xlat2_.y = _e671.y;
    u_xlat2_.z = _e671.z;
    let _e678 = u_xlat1_;
    let _e680 = u_xlat1_;
    let _e682 = u_xlat2_;
    let _e684 = (_e680.xyz + _e682.xyz);
    u_xlat1_.x = _e684.x;
    u_xlat1_.y = _e684.y;
    u_xlat1_.z = _e684.z;
    let _e691 = u_xlat2_;
    let _e693 = u_xlat2_;
    let _e702 = (_e693.xyz + vec3<f32>(-1f, -1f, -1f));
    u_xlat2_.x = _e702.x;
    u_xlat2_.y = _e702.y;
    u_xlat2_.z = _e702.z;
    let _e709 = u_xlat2_;
    let _e714 = _f_buffer4_.f_cb4_[3];
    let _e716 = u_xlat2_;
    let _e723 = ((_e714.xxx * _e716.xyz) + vec3<f32>(1f, 1f, 1f));
    u_xlat2_.x = _e723.x;
    u_xlat2_.y = _e723.y;
    u_xlat2_.z = _e723.z;
    let _e730 = u_xlat2_;
    let _e732 = u_xlat0_;
    let _e734 = u_xlat2_;
    let _e736 = (_e732.xyz * _e734.xyz);
    u_xlat2_.x = _e736.x;
    u_xlat2_.y = _e736.y;
    u_xlat2_.z = _e736.z;
    let _e743 = SV_Target0_;
    let _e745 = u_xlat1_;
    let _e747 = u_xlat0_;
    let _e750 = u_xlat2_;
    let _e752 = ((_e745.xyz * _e747.xyz) + _e750.xyz);
    SV_Target0_.x = _e752.x;
    SV_Target0_.y = _e752.y;
    SV_Target0_.z = _e752.z;
    SV_Target0_.w = 1f;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec2<f32>, @location(2) vs_TEXCOORD2_: vec3<f32>, @location(3) vs_TEXCOORDindex3_: vec4<f32>, @location(12) vs_NORMAL0_: vec3<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_TEXCOORD2_1 = vs_TEXCOORD2_;
    vs_TEXCOORDindex3_1 = vs_TEXCOORDindex3_;
    vs_NORMAL0_1 = vs_NORMAL0_;
    main_1();
    let _e55 = SV_Target0_;
    return FragmentOutput(_e55);
}
