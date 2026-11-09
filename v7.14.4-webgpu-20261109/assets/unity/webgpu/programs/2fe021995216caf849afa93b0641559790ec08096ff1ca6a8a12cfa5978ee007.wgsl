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
    f_cb3_: array<vec4<f32>, 3>,
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
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlati4_: i32 = 0i;
    var u_xlat5_: vec3<f32> = vec3(0f);
    var u_xlat18_: f32 = 0f;
    var u_xlat19_: f32 = 0f;
    var u_xlatu19_: u32 = 0u;
    var u_xlatu20_: u32 = 0u;
    var u_xlat21_: f32 = 0f;
    var u_xlati21_: i32 = 0i;
    var u_xlatu21_: u32 = 0u;
    var u_xlatb21_: bool = false;
    var u_xlat22_: f32 = 0f;
    var u_xlatu_loop_1_: u32 = 0u;
    var local: array<vec4<u32>, 4> = ImmCB_0_;

    let _e76 = vs_TEXCOORD0_1;
    let _e81 = _f_buffer0_.f_cb0_[4];
    let _e86 = hscard_bias.values[0];
    let _e89 = textureSampleBias(f_t0_, samplerf_s0_, _e76.xy, (_e81.x + _e86.x));
    u_xlat0_ = _e89;
    let _e90 = u_xlat0_;
    let _e92 = u_xlat0_;
    let _e97 = _f_buffer3_.f_cb3_[1];
    let _e99 = (_e92.xyz * _e97.xyz);
    u_xlat0_.x = _e99.x;
    u_xlat0_.y = _e99.y;
    u_xlat0_.z = _e99.z;
    let _e106 = vs_NORMAL0_1;
    let _e108 = vs_NORMAL0_1;
    u_xlat18_ = dot(_e106.xyz, _e108.xyz);
    let _e111 = u_xlat18_;
    u_xlat18_ = inverseSqrt(_e111);
    let _e113 = u_xlat1_;
    let _e115 = u_xlat18_;
    let _e117 = vs_NORMAL0_1;
    let _e119 = (vec3(_e115) * _e117.xyz);
    u_xlat1_.x = _e119.x;
    u_xlat1_.y = _e119.y;
    u_xlat1_.z = _e119.z;
    let _e126 = u_xlat2_;
    let _e131 = _f_buffer0_.f_cb0_[6];
    let _e136 = _f_buffer2_.f_cb2_[11];
    let _e138 = (_e131.xyz * _e136.zzz);
    u_xlat2_.x = _e138.x;
    u_xlat2_.y = _e138.y;
    u_xlat2_.z = _e138.z;
    let _e145 = u_xlat1_;
    let _e150 = _f_buffer0_.f_cb0_[5];
    u_xlat18_ = dot(_e145.xyz, _e150.xyz);
    let _e153 = u_xlat18_;
    u_xlat18_ = clamp(_e153, 0f, 1f);
    let _e160 = _f_buffer0_.f_cb0_[10];
    let _e165 = _f_buffer2_.f_cb2_[11];
    u_xlat19_ = min(_e160.x, _e165.y);
    let _e168 = u_xlat19_;
    u_xlatu19_ = u32(i32(_e168));
    u_xlat3_.x = 0f;
    u_xlat3_.y = 0f;
    u_xlat3_.z = 0f;
    loop {
        let _e182 = u_xlatu_loop_1_;
        let _e183 = u_xlatu19_;
        if !((_e182 < _e183)) {
            break;
        }
        {
            let _e189 = u_xlatu_loop_1_;
            u_xlatu21_ = (_e189 >> 2u);
            let _e192 = u_xlatu_loop_1_;
            u_xlati4_ = i32((_e192 & 3u));
            let _e196 = u_xlatu21_;
            let _e202 = _f_buffer2_.f_cb2_[(i32(_e196) + 12i)];
            let _e203 = u_xlati4_;
            let _e207 = local[_e203];
            u_xlat21_ = dot(_e202, bitcast<vec4<f32>>(_e207));
            let _e210 = u_xlat21_;
            u_xlati21_ = i32(_e210);
            let _e212 = u_xlat4_;
            let _e214 = vs_TEXCOORD1_1;
            let _e217 = u_xlati21_;
            let _e220 = _f_buffer1_.f_cb1_[_e217];
            let _e223 = u_xlati21_;
            let _e226 = _f_buffer1_.f_cb1_[_e223];
            let _e228 = ((-(_e214.xyz) * _e220.www) + _e226.xyz);
            u_xlat4_.x = _e228.x;
            u_xlat4_.y = _e228.y;
            u_xlat4_.z = _e228.z;
            let _e235 = u_xlat4_;
            let _e237 = u_xlat4_;
            u_xlat22_ = dot(_e235.xyz, _e237.xyz);
            let _e240 = u_xlat22_;
            u_xlat22_ = max(_e240, 0.000061035156f);
            let _e244 = u_xlat22_;
            u_xlat5_.x = inverseSqrt(_e244);
            let _e246 = u_xlat4_;
            let _e248 = u_xlat4_;
            let _e250 = u_xlat5_;
            let _e252 = (_e248.xyz * _e250.xxx);
            u_xlat4_.x = _e252.x;
            u_xlat4_.y = _e252.y;
            u_xlat4_.z = _e252.z;
            let _e262 = u_xlati21_;
            let _e267 = _f_buffer1_.f_cb1_[(_e262 + 512i)];
            u_xlat5_.x = (1f / _e267.x);
            let _e270 = u_xlat22_;
            u_xlat22_ = (_e270 * 25f);
            let _e273 = u_xlat22_;
            let _e274 = u_xlat5_;
            u_xlat22_ = (_e273 / _e274.x);
            let _e277 = u_xlat22_;
            u_xlat22_ = (_e277 + 1f);
            let _e282 = u_xlat22_;
            u_xlat22_ = (1f / _e282);
            let _e285 = u_xlati21_;
            let _e290 = _f_buffer1_.f_cb1_[(_e285 + 768i)];
            let _e292 = u_xlat4_;
            u_xlat5_.x = dot(_e290.xyz, _e292.xyz);
            let _e296 = u_xlat5_;
            let _e298 = u_xlati21_;
            let _e303 = _f_buffer1_.f_cb1_[(_e298 + 512i)];
            let _e306 = u_xlati21_;
            let _e311 = _f_buffer1_.f_cb1_[(_e306 + 512i)];
            u_xlat5_.x = ((_e296.x * _e303.z) + _e311.w);
            let _e315 = u_xlat5_;
            u_xlat5_.x = clamp(_e315.x, 0f, 1f);
            let _e321 = u_xlat5_;
            let _e323 = u_xlat5_;
            u_xlat5_.x = (_e321.x * _e323.x);
            let _e326 = u_xlat22_;
            let _e327 = u_xlat5_;
            u_xlat22_ = (_e326 * _e327.x);
            let _e330 = u_xlat5_;
            let _e332 = u_xlat22_;
            let _e334 = u_xlati21_;
            let _e339 = _f_buffer1_.f_cb1_[(_e334 + 256i)];
            let _e341 = (vec3(_e332) * _e339.xyz);
            u_xlat5_.x = _e341.x;
            u_xlat5_.y = _e341.y;
            u_xlat5_.z = _e341.z;
            let _e348 = u_xlat1_;
            let _e350 = u_xlat4_;
            u_xlat21_ = dot(_e348.xyz, _e350.xyz);
            let _e353 = u_xlat21_;
            u_xlat21_ = clamp(_e353, 0f, 1f);
            let _e357 = u_xlat3_;
            let _e359 = u_xlat5_;
            let _e361 = u_xlat21_;
            let _e364 = u_xlat3_;
            let _e366 = ((_e359.xyz * vec3(_e361)) + _e364.xyz);
            u_xlat3_.x = _e366.x;
            u_xlat3_.y = _e366.y;
            u_xlat3_.z = _e366.z;
        }
        continuing {
            let _e186 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e186 + 1u);
        }
    }
    let _e373 = u_xlat1_;
    let _e375 = u_xlat2_;
    let _e377 = u_xlat18_;
    let _e380 = u_xlat3_;
    let _e382 = ((_e375.xyz * vec3(_e377)) + _e380.xyz);
    u_xlat1_.x = _e382.x;
    u_xlat1_.y = _e382.y;
    u_xlat1_.z = _e382.z;
    let _e393 = _f_buffer2_.f_cb2_[27];
    u_xlat2_.x = abs(_e393.w);
    let _e400 = _f_buffer2_.f_cb2_[28];
    u_xlat2_.y = abs(_e400.w);
    let _e407 = _f_buffer2_.f_cb2_[29];
    u_xlat2_.z = abs(_e407.w);
    let _e410 = u_xlat2_;
    let _e412 = u_xlat2_;
    let _e414 = log2(_e412.xyz);
    u_xlat2_.x = _e414.x;
    u_xlat2_.y = _e414.y;
    u_xlat2_.z = _e414.z;
    let _e421 = u_xlat2_;
    let _e423 = u_xlat2_;
    let _e429 = (_e423.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat2_.x = _e429.x;
    u_xlat2_.y = _e429.y;
    u_xlat2_.z = _e429.z;
    let _e436 = u_xlat2_;
    let _e438 = u_xlat2_;
    let _e440 = exp2(_e438.xyz);
    u_xlat2_.x = _e440.x;
    u_xlat2_.y = _e440.y;
    u_xlat2_.z = _e440.z;
    let _e447 = u_xlat2_;
    let _e449 = u_xlat2_;
    let _e463 = ((_e449.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat2_.x = _e463.x;
    u_xlat2_.y = _e463.y;
    u_xlat2_.z = _e463.z;
    let _e470 = u_xlat2_;
    let _e472 = u_xlat2_;
    let _e478 = clamp(_e472.xyz, vec3(0f), vec3(1f));
    u_xlat2_.x = _e478.x;
    u_xlat2_.y = _e478.y;
    u_xlat2_.z = _e478.z;
    let _e485 = u_xlat1_;
    let _e487 = u_xlat1_;
    let _e489 = u_xlat2_;
    let _e491 = (_e487.xyz + _e489.xyz);
    u_xlat1_.x = _e491.x;
    u_xlat1_.y = _e491.y;
    u_xlat1_.z = _e491.z;
    let _e498 = u_xlat2_;
    let _e500 = u_xlat2_;
    let _e509 = (_e500.xyz + vec3<f32>(-1f, -1f, -1f));
    u_xlat2_.x = _e509.x;
    u_xlat2_.y = _e509.y;
    u_xlat2_.z = _e509.z;
    let _e516 = u_xlat2_;
    let _e521 = _f_buffer3_.f_cb3_[2];
    let _e523 = u_xlat2_;
    let _e530 = ((_e521.xxx * _e523.xyz) + vec3<f32>(1f, 1f, 1f));
    u_xlat2_.x = _e530.x;
    u_xlat2_.y = _e530.y;
    u_xlat2_.z = _e530.z;
    let _e537 = u_xlat2_;
    let _e539 = u_xlat0_;
    let _e541 = u_xlat2_;
    let _e543 = (_e539.xyz * _e541.xyz);
    u_xlat2_.x = _e543.x;
    u_xlat2_.y = _e543.y;
    u_xlat2_.z = _e543.z;
    let _e550 = SV_Target0_;
    let _e552 = u_xlat1_;
    let _e554 = u_xlat0_;
    let _e557 = u_xlat2_;
    let _e559 = ((_e552.xyz * _e554.xyz) + _e557.xyz);
    SV_Target0_.x = _e559.x;
    SV_Target0_.y = _e559.y;
    SV_Target0_.z = _e559.z;
    SV_Target0_.w = 1f;
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
