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
@group(3) @binding(0) 
var f_t0_: texture_depth_2d;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD1_1: vec3<f32>;
var<private> vs_TEXCOORDindex3_1: vec4<f32>;
var<private> vs_NORMAL0_1: vec3<f32>;
var<private> SV_TARGET0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec3<f32> = vec3(0f);
    var u_xlat2_: vec3<f32> = vec3(0f);
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
    var u_xlat19_: f32 = 0f;
    var u_xlat20_: f32 = 0f;
    var u_xlatu20_: u32 = 0u;
    var u_xlatu21_: u32 = 0u;
    var txVec0_: vec3<f32>;
    var local: f32;
    var u_xlatu_loop_1_: u32 = 0u;
    var local_1: array<vec4<u32>, 4> = ImmCB_0_;

    let _e88 = vs_TEXCOORD0_1;
    let _e93 = _f_buffer0_.f_cb0_[4];
    let _e98 = hscard_bias.values[1];
    let _e101 = textureSampleBias(f_t1_, samplerf_s1_, _e88.xy, (_e93.x + _e98.x));
    u_xlat0_ = _e101;
    let _e103 = vs_NORMAL0_1;
    let _e105 = vs_NORMAL0_1;
    u_xlat1_.x = dot(_e103.xyz, _e105.xyz);
    let _e109 = u_xlat1_;
    u_xlat1_.x = inverseSqrt(_e109.x);
    let _e112 = u_xlat1_;
    let _e114 = u_xlat1_;
    let _e116 = vs_NORMAL0_1;
    let _e118 = (_e114.xxx * _e116.xyz);
    u_xlat1_.x = _e118.x;
    u_xlat1_.y = _e118.y;
    u_xlat1_.z = _e118.z;
    let _e125 = vs_TEXCOORDindex3_1;
    let _e126 = _e125.xy;
    let _e127 = vs_TEXCOORDindex3_1;
    txVec0_ = vec3<f32>(_e126.x, _e126.y, _e127.z);
    let _e133 = txVec0_;
    let _e137 = textureSampleCompareLevel(f_t0_, samplerf_s0_, _e133.xy, _e133.z);
    u_xlat19_ = _e137;
    let _e142 = _f_buffer3_.f_cb3_[27];
    u_xlat2_.x = (-(_e142.x) + 1f);
    let _e147 = u_xlat19_;
    let _e151 = _f_buffer3_.f_cb3_[27];
    let _e154 = u_xlat2_;
    u_xlat19_ = ((_e147 * _e151.x) + _e154.x);
    let _e158 = vs_TEXCOORDindex3_1;
    u_xlatb2_ = (0f >= _e158.z);
    let _e161 = vs_TEXCOORDindex3_1;
    u_xlatb8_ = (_e161.z >= 1f);
    let _e165 = u_xlatb8_;
    let _e166 = u_xlatb2_;
    u_xlatb2_ = (_e165 || _e166);
    let _e168 = u_xlatb2_;
    if _e168 {
        local = 1f;
    } else {
        let _e170 = u_xlat19_;
        local = _e170;
    }
    let _e172 = local;
    u_xlat19_ = _e172;
    let _e173 = u_xlat19_;
    let _e177 = _f_buffer2_.f_cb2_[11];
    u_xlat19_ = (_e173 * _e177.z);
    let _e180 = u_xlat2_;
    let _e182 = u_xlat19_;
    let _e187 = _f_buffer0_.f_cb0_[6];
    let _e189 = (vec3(_e182) * _e187.xyz);
    u_xlat2_.x = _e189.x;
    u_xlat2_.y = _e189.y;
    u_xlat2_.z = _e189.z;
    let _e196 = u_xlat1_;
    let _e201 = _f_buffer0_.f_cb0_[5];
    u_xlat19_ = dot(_e196.xyz, _e201.xyz);
    let _e204 = u_xlat19_;
    u_xlat19_ = clamp(_e204, 0f, 1f);
    let _e211 = _f_buffer0_.f_cb0_[10];
    let _e216 = _f_buffer2_.f_cb2_[11];
    u_xlat20_ = min(_e211.x, _e216.y);
    let _e219 = u_xlat20_;
    u_xlatu20_ = u32(i32(_e219));
    u_xlat3_.x = 0f;
    u_xlat3_.y = 0f;
    u_xlat3_.z = 0f;
    loop {
        let _e234 = u_xlatu_loop_1_;
        let _e235 = u_xlatu20_;
        if !((_e234 < _e235)) {
            break;
        }
        {
            let _e241 = u_xlatu_loop_1_;
            u_xlatu4_ = (_e241 >> 2u);
            let _e244 = u_xlatu_loop_1_;
            u_xlati10_ = i32((_e244 & 3u));
            let _e248 = u_xlatu4_;
            let _e254 = _f_buffer2_.f_cb2_[(i32(_e248) + 12i)];
            let _e255 = u_xlati10_;
            let _e259 = local_1[_e255];
            u_xlat4_ = dot(_e254, bitcast<vec4<f32>>(_e259));
            let _e262 = u_xlat4_;
            u_xlati4_ = i32(_e262);
            let _e264 = u_xlat10_;
            let _e266 = vs_TEXCOORD1_1;
            let _e269 = u_xlati4_;
            let _e272 = _f_buffer1_.f_cb1_[_e269];
            let _e275 = u_xlati4_;
            let _e278 = _f_buffer1_.f_cb1_[_e275];
            let _e280 = ((-(_e266.xyz) * _e272.www) + _e278.xyz);
            u_xlat10_.x = _e280.x;
            u_xlat10_.y = _e280.y;
            u_xlat10_.z = _e280.z;
            let _e288 = u_xlat10_;
            let _e290 = u_xlat10_;
            u_xlat5_.x = dot(_e288.xyz, _e290.xyz);
            let _e294 = u_xlat5_;
            u_xlat5_.x = max(_e294.x, 0.000061035156f);
            let _e298 = u_xlat5_;
            u_xlat11_ = inverseSqrt(_e298.x);
            let _e301 = u_xlat10_;
            let _e303 = u_xlat10_;
            let _e305 = u_xlat11_;
            let _e307 = (_e303.xyz * vec3(_e305));
            u_xlat10_.x = _e307.x;
            u_xlat10_.y = _e307.y;
            u_xlat10_.z = _e307.z;
            let _e316 = u_xlati4_;
            let _e321 = _f_buffer1_.f_cb1_[(_e316 + 512i)];
            u_xlat11_ = (1f / _e321.x);
            let _e325 = u_xlat5_;
            u_xlat5_.x = (_e325.x * 25f);
            let _e330 = u_xlat5_;
            let _e332 = u_xlat11_;
            u_xlat5_.x = (_e330.x / _e332);
            let _e335 = u_xlat5_;
            u_xlat5_.x = (_e335.x + 1f);
            let _e342 = u_xlat5_;
            u_xlat5_.x = (1f / _e342.x);
            let _e345 = u_xlati4_;
            let _e350 = _f_buffer1_.f_cb1_[(_e345 + 768i)];
            let _e352 = u_xlat10_;
            u_xlat11_ = dot(_e350.xyz, _e352.xyz);
            let _e355 = u_xlat11_;
            let _e356 = u_xlati4_;
            let _e361 = _f_buffer1_.f_cb1_[(_e356 + 512i)];
            let _e364 = u_xlati4_;
            let _e369 = _f_buffer1_.f_cb1_[(_e364 + 512i)];
            u_xlat11_ = ((_e355 * _e361.z) + _e369.w);
            let _e372 = u_xlat11_;
            u_xlat11_ = clamp(_e372, 0f, 1f);
            let _e376 = u_xlat11_;
            let _e377 = u_xlat11_;
            u_xlat11_ = (_e376 * _e377);
            let _e380 = u_xlat11_;
            let _e381 = u_xlat5_;
            u_xlat5_.x = (_e380 * _e381.x);
            let _e384 = u_xlat5_;
            let _e386 = u_xlat5_;
            let _e388 = u_xlati4_;
            let _e393 = _f_buffer1_.f_cb1_[(_e388 + 256i)];
            let _e395 = (_e386.xxx * _e393.xyz);
            u_xlat5_.x = _e395.x;
            u_xlat5_.y = _e395.y;
            u_xlat5_.z = _e395.z;
            let _e402 = u_xlat1_;
            let _e404 = u_xlat10_;
            u_xlat4_ = dot(_e402.xyz, _e404.xyz);
            let _e407 = u_xlat4_;
            u_xlat4_ = clamp(_e407, 0f, 1f);
            let _e411 = u_xlat3_;
            let _e413 = u_xlat5_;
            let _e415 = u_xlat4_;
            let _e418 = u_xlat3_;
            let _e420 = ((_e413.xyz * vec3(_e415)) + _e418.xyz);
            u_xlat3_.x = _e420.x;
            u_xlat3_.y = _e420.y;
            u_xlat3_.z = _e420.z;
        }
        continuing {
            let _e238 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e238 + 1u);
        }
    }
    let _e427 = u_xlat1_;
    let _e429 = u_xlat2_;
    let _e431 = u_xlat19_;
    let _e434 = u_xlat3_;
    let _e436 = ((_e429.xyz * vec3(_e431)) + _e434.xyz);
    u_xlat1_.x = _e436.x;
    u_xlat1_.y = _e436.y;
    u_xlat1_.z = _e436.z;
    let _e447 = _f_buffer2_.f_cb2_[27];
    u_xlat2_.x = abs(_e447.w);
    let _e454 = _f_buffer2_.f_cb2_[28];
    u_xlat2_.y = abs(_e454.w);
    let _e461 = _f_buffer2_.f_cb2_[29];
    u_xlat2_.z = abs(_e461.w);
    let _e464 = u_xlat2_;
    let _e466 = u_xlat2_;
    let _e468 = log2(_e466.xyz);
    u_xlat2_.x = _e468.x;
    u_xlat2_.y = _e468.y;
    u_xlat2_.z = _e468.z;
    let _e475 = u_xlat2_;
    let _e477 = u_xlat2_;
    let _e483 = (_e477.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat2_.x = _e483.x;
    u_xlat2_.y = _e483.y;
    u_xlat2_.z = _e483.z;
    let _e490 = u_xlat2_;
    let _e492 = u_xlat2_;
    let _e494 = exp2(_e492.xyz);
    u_xlat2_.x = _e494.x;
    u_xlat2_.y = _e494.y;
    u_xlat2_.z = _e494.z;
    let _e501 = u_xlat2_;
    let _e503 = u_xlat2_;
    let _e517 = ((_e503.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat2_.x = _e517.x;
    u_xlat2_.y = _e517.y;
    u_xlat2_.z = _e517.z;
    let _e524 = u_xlat2_;
    let _e526 = u_xlat2_;
    let _e532 = clamp(_e526.xyz, vec3(0f), vec3(1f));
    u_xlat2_.x = _e532.x;
    u_xlat2_.y = _e532.y;
    u_xlat2_.z = _e532.z;
    let _e539 = u_xlat1_;
    let _e541 = u_xlat1_;
    let _e543 = u_xlat2_;
    let _e545 = (_e541.xyz + _e543.xyz);
    u_xlat1_.x = _e545.x;
    u_xlat1_.y = _e545.y;
    u_xlat1_.z = _e545.z;
    let _e552 = u_xlat1_;
    let _e554 = u_xlat0_;
    let _e556 = u_xlat1_;
    let _e559 = u_xlat0_;
    let _e562 = ((_e554.xyz * _e556.xyz) + -(_e559.xyz));
    u_xlat1_.x = _e562.x;
    u_xlat1_.y = _e562.y;
    u_xlat1_.z = _e562.z;
    let _e569 = SV_TARGET0_;
    let _e574 = _f_buffer4_.f_cb4_[1];
    let _e576 = u_xlat1_;
    let _e579 = u_xlat0_;
    let _e581 = ((_e574.xxx * _e576.xyz) + _e579.xyz);
    SV_TARGET0_.x = _e581.x;
    SV_TARGET0_.y = _e581.y;
    SV_TARGET0_.z = _e581.z;
    let _e589 = u_xlat0_;
    SV_TARGET0_.w = _e589.w;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec3<f32>, @location(3) vs_TEXCOORDindex3_: vec4<f32>, @location(12) vs_NORMAL0_: vec3<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_TEXCOORDindex3_1 = vs_TEXCOORDindex3_;
    vs_NORMAL0_1 = vs_NORMAL0_;
    main_1();
    let _e47 = SV_TARGET0_;
    return FragmentOutput(_e47);
}
