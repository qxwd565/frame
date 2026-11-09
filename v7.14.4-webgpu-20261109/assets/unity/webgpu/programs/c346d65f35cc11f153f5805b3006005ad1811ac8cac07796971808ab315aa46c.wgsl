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
    f_cb4_: array<vec4<f32>, 2>,
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
var<private> vs_TEXCOORD0_1: vec4<f32>;
var<private> vs_TEXCOORD1_1: vec2<f32>;
var<private> vs_TEXCOORD2_1: vec3<f32>;
var<private> vs_TEXCOORDindex3_1: vec4<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> vs_NORMAL0_1: vec3<f32>;
var<private> SV_TARGET0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlatb2_: bool = false;
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: f32 = 0f;
    var u_xlati4_: i32 = 0i;
    var u_xlatu4_: u32 = 0u;
    var u_xlatb4_: bool = false;
    var u_xlat5_: vec3<f32> = vec3(0f);
    var u_xlatb8_: bool = false;
    var u_xlat10_: vec3<f32> = vec3(0f);
    var u_xlati10_: i32 = 0i;
    var u_xlat11_: f32 = 0f;
    var u_xlat18_: f32 = 0f;
    var u_xlat19_: f32 = 0f;
    var u_xlat20_: f32 = 0f;
    var u_xlatu20_: u32 = 0u;
    var u_xlatu21_: u32 = 0u;
    var txVec0_: vec3<f32>;
    var local: f32;
    var u_xlatu_loop_1_: u32 = 0u;
    var local_1: array<vec4<u32>, 4> = ImmCB_0_;

    let _e97 = vs_TEXCOORD0_1;
    let _e102 = _f_buffer0_.f_cb0_[4];
    let _e107 = hscard_bias.values[1];
    let _e110 = textureSampleBias(f_t1_, samplerf_s1_, _e97.xy, (_e102.x + _e107.x));
    u_xlat0_ = _e110;
    let _e111 = vs_TEXCOORD0_1;
    let _e116 = _f_buffer0_.f_cb0_[4];
    let _e121 = hscard_bias.values[2];
    let _e124 = textureSampleBias(f_t2_, samplerf_s2_, _e111.zw, (_e116.x + _e121.x));
    u_xlat1_ = _e124;
    let _e125 = u_xlat1_;
    let _e129 = _f_buffer4_.f_cb4_[1];
    u_xlat1_ = (_e125 * _e129.zzzz);
    let _e132 = vs_TEXCOORD1_1;
    let _e137 = _f_buffer0_.f_cb0_[4];
    let _e142 = hscard_bias.values[3];
    let _e145 = textureSampleBias(f_t3_, samplerf_s3_, _e132.xy, (_e137.x + _e142.x));
    u_xlat2_ = _e145;
    let _e146 = u_xlat0_;
    let _e150 = _f_buffer4_.f_cb4_[1];
    let _e153 = u_xlat1_;
    u_xlat0_ = ((_e146 * _e150.yyyy) + _e153);
    let _e155 = u_xlat0_;
    let _e156 = vs_COLOR0_1;
    u_xlat0_ = (_e155 * _e156);
    let _e158 = u_xlat0_;
    u_xlat0_ = clamp(_e158, vec4(0f), vec4(1f));
    let _e164 = u_xlat0_;
    let _e166 = u_xlat2_;
    u_xlat18_ = (_e164.w + _e166.x);
    let _e169 = u_xlat2_;
    let _e171 = u_xlat18_;
    u_xlat18_ = (_e169.x * _e171);
    let _e173 = u_xlat18_;
    let _e177 = _f_buffer4_.f_cb4_[1];
    u_xlat18_ = (_e173 * _e177.x);
    let _e180 = u_xlat18_;
    u_xlat18_ = clamp(_e180, 0f, 1f);
    let _e185 = vs_NORMAL0_1;
    let _e187 = vs_NORMAL0_1;
    u_xlat1_.x = dot(_e185.xyz, _e187.xyz);
    let _e191 = u_xlat1_;
    u_xlat1_.x = inverseSqrt(_e191.x);
    let _e194 = u_xlat1_;
    let _e196 = u_xlat1_;
    let _e198 = vs_NORMAL0_1;
    let _e200 = (_e196.xxx * _e198.xyz);
    u_xlat1_.x = _e200.x;
    u_xlat1_.y = _e200.y;
    u_xlat1_.z = _e200.z;
    let _e207 = vs_TEXCOORDindex3_1;
    let _e208 = _e207.xy;
    let _e209 = vs_TEXCOORDindex3_1;
    txVec0_ = vec3<f32>(_e208.x, _e208.y, _e209.z);
    let _e215 = txVec0_;
    let _e219 = textureSampleCompareLevel(f_t0_, samplerf_s0_, _e215.xy, _e215.z);
    u_xlat19_ = _e219;
    let _e224 = _f_buffer3_.f_cb3_[27];
    u_xlat2_.x = (-(_e224.x) + 1f);
    let _e229 = u_xlat19_;
    let _e233 = _f_buffer3_.f_cb3_[27];
    let _e236 = u_xlat2_;
    u_xlat19_ = ((_e229 * _e233.x) + _e236.x);
    let _e240 = vs_TEXCOORDindex3_1;
    u_xlatb2_ = (0f >= _e240.z);
    let _e243 = vs_TEXCOORDindex3_1;
    u_xlatb8_ = (_e243.z >= 1f);
    let _e247 = u_xlatb8_;
    let _e248 = u_xlatb2_;
    u_xlatb2_ = (_e247 || _e248);
    let _e250 = u_xlatb2_;
    if _e250 {
        local = 1f;
    } else {
        let _e252 = u_xlat19_;
        local = _e252;
    }
    let _e254 = local;
    u_xlat19_ = _e254;
    let _e255 = u_xlat19_;
    let _e259 = _f_buffer2_.f_cb2_[11];
    u_xlat19_ = (_e255 * _e259.z);
    let _e262 = u_xlat2_;
    let _e264 = u_xlat19_;
    let _e269 = _f_buffer0_.f_cb0_[6];
    let _e271 = (vec3(_e264) * _e269.xyz);
    u_xlat2_.x = _e271.x;
    u_xlat2_.y = _e271.y;
    u_xlat2_.z = _e271.z;
    let _e278 = u_xlat1_;
    let _e283 = _f_buffer0_.f_cb0_[5];
    u_xlat19_ = dot(_e278.xyz, _e283.xyz);
    let _e286 = u_xlat19_;
    u_xlat19_ = clamp(_e286, 0f, 1f);
    let _e293 = _f_buffer0_.f_cb0_[10];
    let _e298 = _f_buffer2_.f_cb2_[11];
    u_xlat20_ = min(_e293.x, _e298.y);
    let _e301 = u_xlat20_;
    u_xlatu20_ = u32(i32(_e301));
    u_xlat3_.x = 0f;
    u_xlat3_.y = 0f;
    u_xlat3_.z = 0f;
    loop {
        let _e316 = u_xlatu_loop_1_;
        let _e317 = u_xlatu20_;
        if !((_e316 < _e317)) {
            break;
        }
        {
            let _e323 = u_xlatu_loop_1_;
            u_xlatu4_ = (_e323 >> 2u);
            let _e326 = u_xlatu_loop_1_;
            u_xlati10_ = i32((_e326 & 3u));
            let _e330 = u_xlatu4_;
            let _e336 = _f_buffer2_.f_cb2_[(i32(_e330) + 12i)];
            let _e337 = u_xlati10_;
            let _e341 = local_1[_e337];
            u_xlat4_ = dot(_e336, bitcast<vec4<f32>>(_e341));
            let _e344 = u_xlat4_;
            u_xlati4_ = i32(_e344);
            let _e346 = u_xlat10_;
            let _e348 = vs_TEXCOORD2_1;
            let _e351 = u_xlati4_;
            let _e354 = _f_buffer1_.f_cb1_[_e351];
            let _e357 = u_xlati4_;
            let _e360 = _f_buffer1_.f_cb1_[_e357];
            let _e362 = ((-(_e348.xyz) * _e354.www) + _e360.xyz);
            u_xlat10_.x = _e362.x;
            u_xlat10_.y = _e362.y;
            u_xlat10_.z = _e362.z;
            let _e370 = u_xlat10_;
            let _e372 = u_xlat10_;
            u_xlat5_.x = dot(_e370.xyz, _e372.xyz);
            let _e376 = u_xlat5_;
            u_xlat5_.x = max(_e376.x, 0.000061035156f);
            let _e380 = u_xlat5_;
            u_xlat11_ = inverseSqrt(_e380.x);
            let _e383 = u_xlat10_;
            let _e385 = u_xlat10_;
            let _e387 = u_xlat11_;
            let _e389 = (_e385.xyz * vec3(_e387));
            u_xlat10_.x = _e389.x;
            u_xlat10_.y = _e389.y;
            u_xlat10_.z = _e389.z;
            let _e398 = u_xlati4_;
            let _e403 = _f_buffer1_.f_cb1_[(_e398 + 512i)];
            u_xlat11_ = (1f / _e403.x);
            let _e407 = u_xlat5_;
            u_xlat5_.x = (_e407.x * 25f);
            let _e412 = u_xlat5_;
            let _e414 = u_xlat11_;
            u_xlat5_.x = (_e412.x / _e414);
            let _e417 = u_xlat5_;
            u_xlat5_.x = (_e417.x + 1f);
            let _e424 = u_xlat5_;
            u_xlat5_.x = (1f / _e424.x);
            let _e427 = u_xlati4_;
            let _e432 = _f_buffer1_.f_cb1_[(_e427 + 768i)];
            let _e434 = u_xlat10_;
            u_xlat11_ = dot(_e432.xyz, _e434.xyz);
            let _e437 = u_xlat11_;
            let _e438 = u_xlati4_;
            let _e443 = _f_buffer1_.f_cb1_[(_e438 + 512i)];
            let _e446 = u_xlati4_;
            let _e451 = _f_buffer1_.f_cb1_[(_e446 + 512i)];
            u_xlat11_ = ((_e437 * _e443.z) + _e451.w);
            let _e454 = u_xlat11_;
            u_xlat11_ = clamp(_e454, 0f, 1f);
            let _e458 = u_xlat11_;
            let _e459 = u_xlat11_;
            u_xlat11_ = (_e458 * _e459);
            let _e462 = u_xlat11_;
            let _e463 = u_xlat5_;
            u_xlat5_.x = (_e462 * _e463.x);
            let _e466 = u_xlat5_;
            let _e468 = u_xlat5_;
            let _e470 = u_xlati4_;
            let _e475 = _f_buffer1_.f_cb1_[(_e470 + 256i)];
            let _e477 = (_e468.xxx * _e475.xyz);
            u_xlat5_.x = _e477.x;
            u_xlat5_.y = _e477.y;
            u_xlat5_.z = _e477.z;
            let _e484 = u_xlat1_;
            let _e486 = u_xlat10_;
            u_xlat4_ = dot(_e484.xyz, _e486.xyz);
            let _e489 = u_xlat4_;
            u_xlat4_ = clamp(_e489, 0f, 1f);
            let _e493 = u_xlat3_;
            let _e495 = u_xlat5_;
            let _e497 = u_xlat4_;
            let _e500 = u_xlat3_;
            let _e502 = ((_e495.xyz * vec3(_e497)) + _e500.xyz);
            u_xlat3_.x = _e502.x;
            u_xlat3_.y = _e502.y;
            u_xlat3_.z = _e502.z;
        }
        continuing {
            let _e320 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e320 + 1u);
        }
    }
    let _e509 = u_xlat1_;
    let _e511 = u_xlat2_;
    let _e513 = u_xlat19_;
    let _e516 = u_xlat3_;
    let _e518 = ((_e511.xyz * vec3(_e513)) + _e516.xyz);
    u_xlat1_.x = _e518.x;
    u_xlat1_.y = _e518.y;
    u_xlat1_.z = _e518.z;
    let _e529 = _f_buffer2_.f_cb2_[27];
    u_xlat2_.x = abs(_e529.w);
    let _e536 = _f_buffer2_.f_cb2_[28];
    u_xlat2_.y = abs(_e536.w);
    let _e543 = _f_buffer2_.f_cb2_[29];
    u_xlat2_.z = abs(_e543.w);
    let _e546 = u_xlat2_;
    let _e548 = u_xlat2_;
    let _e550 = log2(_e548.xyz);
    u_xlat2_.x = _e550.x;
    u_xlat2_.y = _e550.y;
    u_xlat2_.z = _e550.z;
    let _e557 = u_xlat2_;
    let _e559 = u_xlat2_;
    let _e565 = (_e559.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat2_.x = _e565.x;
    u_xlat2_.y = _e565.y;
    u_xlat2_.z = _e565.z;
    let _e572 = u_xlat2_;
    let _e574 = u_xlat2_;
    let _e576 = exp2(_e574.xyz);
    u_xlat2_.x = _e576.x;
    u_xlat2_.y = _e576.y;
    u_xlat2_.z = _e576.z;
    let _e583 = u_xlat2_;
    let _e585 = u_xlat2_;
    let _e599 = ((_e585.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat2_.x = _e599.x;
    u_xlat2_.y = _e599.y;
    u_xlat2_.z = _e599.z;
    let _e606 = u_xlat2_;
    let _e608 = u_xlat2_;
    let _e614 = clamp(_e608.xyz, vec3(0f), vec3(1f));
    u_xlat2_.x = _e614.x;
    u_xlat2_.y = _e614.y;
    u_xlat2_.z = _e614.z;
    let _e621 = u_xlat1_;
    let _e623 = u_xlat1_;
    let _e625 = u_xlat2_;
    let _e627 = (_e623.xyz + _e625.xyz);
    u_xlat1_.x = _e627.x;
    u_xlat1_.y = _e627.y;
    u_xlat1_.z = _e627.z;
    let _e634 = u_xlat1_;
    let _e636 = u_xlat18_;
    let _e638 = u_xlat1_;
    let _e640 = (vec3(_e636) * _e638.xyz);
    u_xlat1_.x = _e640.x;
    u_xlat1_.y = _e640.y;
    u_xlat1_.z = _e640.z;
    let _e647 = SV_TARGET0_;
    let _e649 = u_xlat0_;
    let _e651 = u_xlat1_;
    let _e653 = (_e649.xyz * _e651.xyz);
    SV_TARGET0_.x = _e653.x;
    SV_TARGET0_.y = _e653.y;
    SV_TARGET0_.z = _e653.z;
    let _e661 = u_xlat18_;
    SV_TARGET0_.w = _e661;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(1) vs_TEXCOORD1_: vec2<f32>, @location(2) vs_TEXCOORD2_: vec3<f32>, @location(3) vs_TEXCOORDindex3_: vec4<f32>, @location(10) vs_COLOR0_: vec4<f32>, @location(12) vs_NORMAL0_: vec3<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_TEXCOORD2_1 = vs_TEXCOORD2_;
    vs_TEXCOORDindex3_1 = vs_TEXCOORDindex3_;
    vs_COLOR0_1 = vs_COLOR0_;
    vs_NORMAL0_1 = vs_NORMAL0_;
    main_1();
    let _e63 = SV_TARGET0_;
    return FragmentOutput(_e63);
}
