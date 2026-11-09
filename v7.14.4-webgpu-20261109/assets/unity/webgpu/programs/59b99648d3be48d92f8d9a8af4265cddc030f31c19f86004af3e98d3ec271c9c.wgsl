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
var<private> SV_Target0_: vec4<f32>;

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

    let _e85 = vs_TEXCOORD0_1;
    let _e90 = _f_buffer0_.f_cb0_[4];
    let _e95 = hscard_bias.values[1];
    let _e98 = textureSampleBias(f_t1_, samplerf_s1_, _e85.xy, (_e90.x + _e95.x));
    u_xlat0_ = _e98;
    let _e100 = vs_NORMAL0_1;
    let _e102 = vs_NORMAL0_1;
    u_xlat1_.x = dot(_e100.xyz, _e102.xyz);
    let _e106 = u_xlat1_;
    u_xlat1_.x = inverseSqrt(_e106.x);
    let _e109 = u_xlat1_;
    let _e111 = u_xlat1_;
    let _e113 = vs_NORMAL0_1;
    let _e115 = (_e111.xxx * _e113.xyz);
    u_xlat1_.x = _e115.x;
    u_xlat1_.y = _e115.y;
    u_xlat1_.z = _e115.z;
    let _e122 = vs_TEXCOORDindex3_1;
    let _e123 = _e122.xy;
    let _e124 = vs_TEXCOORDindex3_1;
    txVec0_ = vec3<f32>(_e123.x, _e123.y, _e124.z);
    let _e130 = txVec0_;
    let _e134 = textureSampleCompareLevel(f_t0_, samplerf_s0_, _e130.xy, _e130.z);
    u_xlat19_ = _e134;
    let _e139 = _f_buffer3_.f_cb3_[27];
    u_xlat2_.x = (-(_e139.x) + 1f);
    let _e144 = u_xlat19_;
    let _e148 = _f_buffer3_.f_cb3_[27];
    let _e151 = u_xlat2_;
    u_xlat19_ = ((_e144 * _e148.x) + _e151.x);
    let _e155 = vs_TEXCOORDindex3_1;
    u_xlatb2_ = (0f >= _e155.z);
    let _e158 = vs_TEXCOORDindex3_1;
    u_xlatb8_ = (_e158.z >= 1f);
    let _e162 = u_xlatb8_;
    let _e163 = u_xlatb2_;
    u_xlatb2_ = (_e162 || _e163);
    let _e165 = u_xlatb2_;
    if _e165 {
        local = 1f;
    } else {
        let _e167 = u_xlat19_;
        local = _e167;
    }
    let _e169 = local;
    u_xlat19_ = _e169;
    let _e170 = u_xlat19_;
    let _e174 = _f_buffer2_.f_cb2_[11];
    u_xlat19_ = (_e170 * _e174.z);
    let _e177 = u_xlat2_;
    let _e179 = u_xlat19_;
    let _e184 = _f_buffer0_.f_cb0_[6];
    let _e186 = (vec3(_e179) * _e184.xyz);
    u_xlat2_.x = _e186.x;
    u_xlat2_.y = _e186.y;
    u_xlat2_.z = _e186.z;
    let _e193 = u_xlat1_;
    let _e198 = _f_buffer0_.f_cb0_[5];
    u_xlat19_ = dot(_e193.xyz, _e198.xyz);
    let _e201 = u_xlat19_;
    u_xlat19_ = clamp(_e201, 0f, 1f);
    let _e208 = _f_buffer0_.f_cb0_[10];
    let _e213 = _f_buffer2_.f_cb2_[11];
    u_xlat20_ = min(_e208.x, _e213.y);
    let _e216 = u_xlat20_;
    u_xlatu20_ = u32(i32(_e216));
    u_xlat3_.x = 0f;
    u_xlat3_.y = 0f;
    u_xlat3_.z = 0f;
    loop {
        let _e231 = u_xlatu_loop_1_;
        let _e232 = u_xlatu20_;
        if !((_e231 < _e232)) {
            break;
        }
        {
            let _e238 = u_xlatu_loop_1_;
            u_xlatu4_ = (_e238 >> 2u);
            let _e241 = u_xlatu_loop_1_;
            u_xlati10_ = i32((_e241 & 3u));
            let _e245 = u_xlatu4_;
            let _e251 = _f_buffer2_.f_cb2_[(i32(_e245) + 12i)];
            let _e252 = u_xlati10_;
            let _e256 = local_1[_e252];
            u_xlat4_ = dot(_e251, bitcast<vec4<f32>>(_e256));
            let _e259 = u_xlat4_;
            u_xlati4_ = i32(_e259);
            let _e261 = u_xlat10_;
            let _e263 = vs_TEXCOORD1_1;
            let _e266 = u_xlati4_;
            let _e269 = _f_buffer1_.f_cb1_[_e266];
            let _e272 = u_xlati4_;
            let _e275 = _f_buffer1_.f_cb1_[_e272];
            let _e277 = ((-(_e263.xyz) * _e269.www) + _e275.xyz);
            u_xlat10_.x = _e277.x;
            u_xlat10_.y = _e277.y;
            u_xlat10_.z = _e277.z;
            let _e285 = u_xlat10_;
            let _e287 = u_xlat10_;
            u_xlat5_.x = dot(_e285.xyz, _e287.xyz);
            let _e291 = u_xlat5_;
            u_xlat5_.x = max(_e291.x, 0.000061035156f);
            let _e295 = u_xlat5_;
            u_xlat11_ = inverseSqrt(_e295.x);
            let _e298 = u_xlat10_;
            let _e300 = u_xlat10_;
            let _e302 = u_xlat11_;
            let _e304 = (_e300.xyz * vec3(_e302));
            u_xlat10_.x = _e304.x;
            u_xlat10_.y = _e304.y;
            u_xlat10_.z = _e304.z;
            let _e313 = u_xlati4_;
            let _e318 = _f_buffer1_.f_cb1_[(_e313 + 512i)];
            u_xlat11_ = (1f / _e318.x);
            let _e322 = u_xlat5_;
            u_xlat5_.x = (_e322.x * 25f);
            let _e327 = u_xlat5_;
            let _e329 = u_xlat11_;
            u_xlat5_.x = (_e327.x / _e329);
            let _e332 = u_xlat5_;
            u_xlat5_.x = (_e332.x + 1f);
            let _e339 = u_xlat5_;
            u_xlat5_.x = (1f / _e339.x);
            let _e342 = u_xlati4_;
            let _e347 = _f_buffer1_.f_cb1_[(_e342 + 768i)];
            let _e349 = u_xlat10_;
            u_xlat11_ = dot(_e347.xyz, _e349.xyz);
            let _e352 = u_xlat11_;
            let _e353 = u_xlati4_;
            let _e358 = _f_buffer1_.f_cb1_[(_e353 + 512i)];
            let _e361 = u_xlati4_;
            let _e366 = _f_buffer1_.f_cb1_[(_e361 + 512i)];
            u_xlat11_ = ((_e352 * _e358.z) + _e366.w);
            let _e369 = u_xlat11_;
            u_xlat11_ = clamp(_e369, 0f, 1f);
            let _e373 = u_xlat11_;
            let _e374 = u_xlat11_;
            u_xlat11_ = (_e373 * _e374);
            let _e377 = u_xlat11_;
            let _e378 = u_xlat5_;
            u_xlat5_.x = (_e377 * _e378.x);
            let _e381 = u_xlat5_;
            let _e383 = u_xlat5_;
            let _e385 = u_xlati4_;
            let _e390 = _f_buffer1_.f_cb1_[(_e385 + 256i)];
            let _e392 = (_e383.xxx * _e390.xyz);
            u_xlat5_.x = _e392.x;
            u_xlat5_.y = _e392.y;
            u_xlat5_.z = _e392.z;
            let _e399 = u_xlat1_;
            let _e401 = u_xlat10_;
            u_xlat4_ = dot(_e399.xyz, _e401.xyz);
            let _e404 = u_xlat4_;
            u_xlat4_ = clamp(_e404, 0f, 1f);
            let _e408 = u_xlat3_;
            let _e410 = u_xlat5_;
            let _e412 = u_xlat4_;
            let _e415 = u_xlat3_;
            let _e417 = ((_e410.xyz * vec3(_e412)) + _e415.xyz);
            u_xlat3_.x = _e417.x;
            u_xlat3_.y = _e417.y;
            u_xlat3_.z = _e417.z;
        }
        continuing {
            let _e235 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e235 + 1u);
        }
    }
    let _e424 = u_xlat1_;
    let _e426 = u_xlat2_;
    let _e428 = u_xlat19_;
    let _e431 = u_xlat3_;
    let _e433 = ((_e426.xyz * vec3(_e428)) + _e431.xyz);
    u_xlat1_.x = _e433.x;
    u_xlat1_.y = _e433.y;
    u_xlat1_.z = _e433.z;
    let _e444 = _f_buffer2_.f_cb2_[27];
    u_xlat2_.x = abs(_e444.w);
    let _e451 = _f_buffer2_.f_cb2_[28];
    u_xlat2_.y = abs(_e451.w);
    let _e458 = _f_buffer2_.f_cb2_[29];
    u_xlat2_.z = abs(_e458.w);
    let _e461 = u_xlat2_;
    let _e463 = u_xlat2_;
    let _e465 = log2(_e463.xyz);
    u_xlat2_.x = _e465.x;
    u_xlat2_.y = _e465.y;
    u_xlat2_.z = _e465.z;
    let _e472 = u_xlat2_;
    let _e474 = u_xlat2_;
    let _e480 = (_e474.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat2_.x = _e480.x;
    u_xlat2_.y = _e480.y;
    u_xlat2_.z = _e480.z;
    let _e487 = u_xlat2_;
    let _e489 = u_xlat2_;
    let _e491 = exp2(_e489.xyz);
    u_xlat2_.x = _e491.x;
    u_xlat2_.y = _e491.y;
    u_xlat2_.z = _e491.z;
    let _e498 = u_xlat2_;
    let _e500 = u_xlat2_;
    let _e514 = ((_e500.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat2_.x = _e514.x;
    u_xlat2_.y = _e514.y;
    u_xlat2_.z = _e514.z;
    let _e521 = u_xlat2_;
    let _e523 = u_xlat2_;
    let _e529 = clamp(_e523.xyz, vec3(0f), vec3(1f));
    u_xlat2_.x = _e529.x;
    u_xlat2_.y = _e529.y;
    u_xlat2_.z = _e529.z;
    let _e536 = u_xlat1_;
    let _e538 = u_xlat1_;
    let _e540 = u_xlat2_;
    let _e542 = (_e538.xyz + _e540.xyz);
    u_xlat1_.x = _e542.x;
    u_xlat1_.y = _e542.y;
    u_xlat1_.z = _e542.z;
    let _e549 = SV_Target0_;
    let _e551 = u_xlat0_;
    let _e553 = u_xlat1_;
    let _e555 = (_e551.xyz * _e553.xyz);
    SV_Target0_.x = _e555.x;
    SV_Target0_.y = _e555.y;
    SV_Target0_.z = _e555.z;
    let _e563 = u_xlat0_;
    SV_Target0_.w = _e563.w;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec3<f32>, @location(3) vs_TEXCOORDindex3_: vec4<f32>, @location(12) vs_NORMAL0_: vec3<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_TEXCOORDindex3_1 = vs_TEXCOORDindex3_;
    vs_NORMAL0_1 = vs_NORMAL0_;
    main_1();
    let _e44 = SV_Target0_;
    return FragmentOutput(_e44);
}
