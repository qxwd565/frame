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
    f_cb3_: array<vec4<f32>, 2>,
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
var<private> vs_NORMAL0_1: vec3<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec3<f32> = vec3(0f);
    var u_xlat2_: vec3<f32> = vec3(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: f32 = 0f;
    var u_xlati4_: i32 = 0i;
    var u_xlatu4_: u32 = 0u;
    var u_xlatb4_: bool = false;
    var u_xlat5_: vec3<f32> = vec3(0f);
    var u_xlat10_: vec3<f32> = vec3(0f);
    var u_xlati10_: i32 = 0i;
    var u_xlat11_: f32 = 0f;
    var u_xlat19_: f32 = 0f;
    var u_xlat20_: f32 = 0f;
    var u_xlatu20_: u32 = 0u;
    var u_xlatu21_: u32 = 0u;
    var u_xlatu_loop_1_: u32 = 0u;
    var local: array<vec4<u32>, 4> = ImmCB_0_;

    let _e76 = vs_TEXCOORD0_1;
    let _e81 = _f_buffer0_.f_cb0_[4];
    let _e86 = hscard_bias.values[0];
    let _e89 = textureSampleBias(f_t0_, samplerf_s0_, _e76.xy, (_e81.x + _e86.x));
    u_xlat0_ = _e89;
    let _e90 = u_xlat0_;
    let _e94 = _f_buffer3_.f_cb3_[1];
    u_xlat0_ = (_e90 * _e94);
    let _e97 = vs_NORMAL0_1;
    let _e99 = vs_NORMAL0_1;
    u_xlat1_.x = dot(_e97.xyz, _e99.xyz);
    let _e103 = u_xlat1_;
    u_xlat1_.x = inverseSqrt(_e103.x);
    let _e106 = u_xlat1_;
    let _e108 = u_xlat1_;
    let _e110 = vs_NORMAL0_1;
    let _e112 = (_e108.xxx * _e110.xyz);
    u_xlat1_.x = _e112.x;
    u_xlat1_.y = _e112.y;
    u_xlat1_.z = _e112.z;
    let _e119 = u_xlat2_;
    let _e124 = _f_buffer0_.f_cb0_[6];
    let _e129 = _f_buffer2_.f_cb2_[11];
    let _e131 = (_e124.xyz * _e129.zzz);
    u_xlat2_.x = _e131.x;
    u_xlat2_.y = _e131.y;
    u_xlat2_.z = _e131.z;
    let _e138 = u_xlat1_;
    let _e143 = _f_buffer0_.f_cb0_[5];
    u_xlat19_ = dot(_e138.xyz, _e143.xyz);
    let _e146 = u_xlat19_;
    u_xlat19_ = clamp(_e146, 0f, 1f);
    let _e153 = _f_buffer0_.f_cb0_[10];
    let _e158 = _f_buffer2_.f_cb2_[11];
    u_xlat20_ = min(_e153.x, _e158.y);
    let _e161 = u_xlat20_;
    u_xlatu20_ = u32(i32(_e161));
    u_xlat3_.x = 0f;
    u_xlat3_.y = 0f;
    u_xlat3_.z = 0f;
    loop {
        let _e176 = u_xlatu_loop_1_;
        let _e177 = u_xlatu20_;
        if !((_e176 < _e177)) {
            break;
        }
        {
            let _e183 = u_xlatu_loop_1_;
            u_xlatu4_ = (_e183 >> 2u);
            let _e186 = u_xlatu_loop_1_;
            u_xlati10_ = i32((_e186 & 3u));
            let _e190 = u_xlatu4_;
            let _e196 = _f_buffer2_.f_cb2_[(i32(_e190) + 12i)];
            let _e197 = u_xlati10_;
            let _e201 = local[_e197];
            u_xlat4_ = dot(_e196, bitcast<vec4<f32>>(_e201));
            let _e204 = u_xlat4_;
            u_xlati4_ = i32(_e204);
            let _e206 = u_xlat10_;
            let _e208 = vs_TEXCOORD1_1;
            let _e211 = u_xlati4_;
            let _e214 = _f_buffer1_.f_cb1_[_e211];
            let _e217 = u_xlati4_;
            let _e220 = _f_buffer1_.f_cb1_[_e217];
            let _e222 = ((-(_e208.xyz) * _e214.www) + _e220.xyz);
            u_xlat10_.x = _e222.x;
            u_xlat10_.y = _e222.y;
            u_xlat10_.z = _e222.z;
            let _e230 = u_xlat10_;
            let _e232 = u_xlat10_;
            u_xlat5_.x = dot(_e230.xyz, _e232.xyz);
            let _e236 = u_xlat5_;
            u_xlat5_.x = max(_e236.x, 0.000061035156f);
            let _e240 = u_xlat5_;
            u_xlat11_ = inverseSqrt(_e240.x);
            let _e243 = u_xlat10_;
            let _e245 = u_xlat10_;
            let _e247 = u_xlat11_;
            let _e249 = (_e245.xyz * vec3(_e247));
            u_xlat10_.x = _e249.x;
            u_xlat10_.y = _e249.y;
            u_xlat10_.z = _e249.z;
            let _e258 = u_xlati4_;
            let _e263 = _f_buffer1_.f_cb1_[(_e258 + 512i)];
            u_xlat11_ = (1f / _e263.x);
            let _e267 = u_xlat5_;
            u_xlat5_.x = (_e267.x * 25f);
            let _e272 = u_xlat5_;
            let _e274 = u_xlat11_;
            u_xlat5_.x = (_e272.x / _e274);
            let _e277 = u_xlat5_;
            u_xlat5_.x = (_e277.x + 1f);
            let _e284 = u_xlat5_;
            u_xlat5_.x = (1f / _e284.x);
            let _e287 = u_xlati4_;
            let _e292 = _f_buffer1_.f_cb1_[(_e287 + 768i)];
            let _e294 = u_xlat10_;
            u_xlat11_ = dot(_e292.xyz, _e294.xyz);
            let _e297 = u_xlat11_;
            let _e298 = u_xlati4_;
            let _e303 = _f_buffer1_.f_cb1_[(_e298 + 512i)];
            let _e306 = u_xlati4_;
            let _e311 = _f_buffer1_.f_cb1_[(_e306 + 512i)];
            u_xlat11_ = ((_e297 * _e303.z) + _e311.w);
            let _e314 = u_xlat11_;
            u_xlat11_ = clamp(_e314, 0f, 1f);
            let _e318 = u_xlat11_;
            let _e319 = u_xlat11_;
            u_xlat11_ = (_e318 * _e319);
            let _e322 = u_xlat11_;
            let _e323 = u_xlat5_;
            u_xlat5_.x = (_e322 * _e323.x);
            let _e326 = u_xlat5_;
            let _e328 = u_xlat5_;
            let _e330 = u_xlati4_;
            let _e335 = _f_buffer1_.f_cb1_[(_e330 + 256i)];
            let _e337 = (_e328.xxx * _e335.xyz);
            u_xlat5_.x = _e337.x;
            u_xlat5_.y = _e337.y;
            u_xlat5_.z = _e337.z;
            let _e344 = u_xlat1_;
            let _e346 = u_xlat10_;
            u_xlat4_ = dot(_e344.xyz, _e346.xyz);
            let _e349 = u_xlat4_;
            u_xlat4_ = clamp(_e349, 0f, 1f);
            let _e353 = u_xlat3_;
            let _e355 = u_xlat5_;
            let _e357 = u_xlat4_;
            let _e360 = u_xlat3_;
            let _e362 = ((_e355.xyz * vec3(_e357)) + _e360.xyz);
            u_xlat3_.x = _e362.x;
            u_xlat3_.y = _e362.y;
            u_xlat3_.z = _e362.z;
        }
        continuing {
            let _e180 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e180 + 1u);
        }
    }
    let _e369 = u_xlat1_;
    let _e371 = u_xlat2_;
    let _e373 = u_xlat19_;
    let _e376 = u_xlat3_;
    let _e378 = ((_e371.xyz * vec3(_e373)) + _e376.xyz);
    u_xlat1_.x = _e378.x;
    u_xlat1_.y = _e378.y;
    u_xlat1_.z = _e378.z;
    let _e389 = _f_buffer2_.f_cb2_[27];
    u_xlat2_.x = abs(_e389.w);
    let _e396 = _f_buffer2_.f_cb2_[28];
    u_xlat2_.y = abs(_e396.w);
    let _e403 = _f_buffer2_.f_cb2_[29];
    u_xlat2_.z = abs(_e403.w);
    let _e406 = u_xlat2_;
    let _e408 = u_xlat2_;
    let _e410 = log2(_e408.xyz);
    u_xlat2_.x = _e410.x;
    u_xlat2_.y = _e410.y;
    u_xlat2_.z = _e410.z;
    let _e417 = u_xlat2_;
    let _e419 = u_xlat2_;
    let _e425 = (_e419.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat2_.x = _e425.x;
    u_xlat2_.y = _e425.y;
    u_xlat2_.z = _e425.z;
    let _e432 = u_xlat2_;
    let _e434 = u_xlat2_;
    let _e436 = exp2(_e434.xyz);
    u_xlat2_.x = _e436.x;
    u_xlat2_.y = _e436.y;
    u_xlat2_.z = _e436.z;
    let _e443 = u_xlat2_;
    let _e445 = u_xlat2_;
    let _e459 = ((_e445.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat2_.x = _e459.x;
    u_xlat2_.y = _e459.y;
    u_xlat2_.z = _e459.z;
    let _e466 = u_xlat2_;
    let _e468 = u_xlat2_;
    let _e474 = clamp(_e468.xyz, vec3(0f), vec3(1f));
    u_xlat2_.x = _e474.x;
    u_xlat2_.y = _e474.y;
    u_xlat2_.z = _e474.z;
    let _e481 = u_xlat1_;
    let _e483 = u_xlat1_;
    let _e485 = u_xlat2_;
    let _e487 = (_e483.xyz + _e485.xyz);
    u_xlat1_.x = _e487.x;
    u_xlat1_.y = _e487.y;
    u_xlat1_.z = _e487.z;
    let _e494 = SV_Target0_;
    let _e496 = u_xlat0_;
    let _e498 = u_xlat1_;
    let _e500 = (_e496.xyz * _e498.xyz);
    SV_Target0_.x = _e500.x;
    SV_Target0_.y = _e500.y;
    SV_Target0_.z = _e500.z;
    let _e508 = u_xlat0_;
    SV_Target0_.w = _e508.w;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec3<f32>, @location(12) vs_NORMAL0_: vec3<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_NORMAL0_1 = vs_NORMAL0_;
    main_1();
    let _e36 = SV_Target0_;
    return FragmentOutput(_e36);
}
