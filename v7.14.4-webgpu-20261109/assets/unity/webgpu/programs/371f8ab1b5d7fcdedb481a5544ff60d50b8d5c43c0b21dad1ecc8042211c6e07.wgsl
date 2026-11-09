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
    var local: f32;
    var u_xlatu_loop_1_: u32 = 0u;
    var local_1: array<vec4<u32>, 4> = ImmCB_0_;

    let _e82 = vs_TEXCOORD0_1;
    let _e87 = _f_buffer0_.f_cb0_[4];
    let _e92 = hscard_bias.values[0];
    let _e95 = textureSampleBias(f_t0_, samplerf_s0_, _e82.xy, (_e87.x + _e92.x));
    u_xlat0_ = _e95;
    let _e100 = _f_buffer3_.f_cb3_[1];
    u_xlatb1_ = (0f < _e100.x);
    let _e103 = u_xlatb1_;
    if _e103 {
        {
            let _e104 = vs_TEXCOORD5_1;
            let _e109 = _f_buffer0_.f_cb0_[4];
            let _e114 = hscard_bias.values[1];
            let _e117 = textureSampleBias(f_t1_, samplerf_s1_, _e104.xy, (_e109.x + _e114.x));
            u_xlat1_ = _e117;
            let _e121 = _f_buffer3_.f_cb3_[3];
            let _e123 = u_xlat1_;
            u_xlatb1_ = (_e121.x < _e123.x);
            let _e127 = u_xlatb1_;
            if _e127 {
                local = 1f;
            } else {
                local = 0f;
            }
            let _e132 = local;
            u_xlat1_.x = _e132;
            let _e134 = u_xlat0_;
            let _e136 = u_xlat1_;
            u_xlat0_.w = (_e134.w * _e136.x);
        }
    }
    let _e140 = vs_NORMAL0_1;
    let _e142 = vs_NORMAL0_1;
    u_xlat1_.x = dot(_e140.xyz, _e142.xyz);
    let _e146 = u_xlat1_;
    u_xlat1_.x = inverseSqrt(_e146.x);
    let _e149 = u_xlat1_;
    let _e151 = u_xlat1_;
    let _e153 = vs_NORMAL0_1;
    let _e155 = (_e151.xxx * _e153.xyz);
    u_xlat1_.x = _e155.x;
    u_xlat1_.y = _e155.y;
    u_xlat1_.z = _e155.z;
    let _e162 = u_xlat2_;
    let _e167 = _f_buffer0_.f_cb0_[6];
    let _e172 = _f_buffer2_.f_cb2_[11];
    let _e174 = (_e167.xyz * _e172.zzz);
    u_xlat2_.x = _e174.x;
    u_xlat2_.y = _e174.y;
    u_xlat2_.z = _e174.z;
    let _e181 = u_xlat1_;
    let _e186 = _f_buffer0_.f_cb0_[5];
    u_xlat19_ = dot(_e181.xyz, _e186.xyz);
    let _e189 = u_xlat19_;
    u_xlat19_ = clamp(_e189, 0f, 1f);
    let _e196 = _f_buffer0_.f_cb0_[10];
    let _e201 = _f_buffer2_.f_cb2_[11];
    u_xlat20_ = min(_e196.x, _e201.y);
    let _e204 = u_xlat20_;
    u_xlatu20_ = u32(i32(_e204));
    u_xlat3_.x = 0f;
    u_xlat3_.y = 0f;
    u_xlat3_.z = 0f;
    loop {
        let _e219 = u_xlatu_loop_1_;
        let _e220 = u_xlatu20_;
        if !((_e219 < _e220)) {
            break;
        }
        {
            let _e226 = u_xlatu_loop_1_;
            u_xlatu4_ = (_e226 >> 2u);
            let _e229 = u_xlatu_loop_1_;
            u_xlati10_ = i32((_e229 & 3u));
            let _e233 = u_xlatu4_;
            let _e239 = _f_buffer2_.f_cb2_[(i32(_e233) + 12i)];
            let _e240 = u_xlati10_;
            let _e244 = local_1[_e240];
            u_xlat4_ = dot(_e239, bitcast<vec4<f32>>(_e244));
            let _e247 = u_xlat4_;
            u_xlati4_ = i32(_e247);
            let _e249 = u_xlat10_;
            let _e251 = vs_TEXCOORD1_1;
            let _e254 = u_xlati4_;
            let _e257 = _f_buffer1_.f_cb1_[_e254];
            let _e260 = u_xlati4_;
            let _e263 = _f_buffer1_.f_cb1_[_e260];
            let _e265 = ((-(_e251.xyz) * _e257.www) + _e263.xyz);
            u_xlat10_.x = _e265.x;
            u_xlat10_.y = _e265.y;
            u_xlat10_.z = _e265.z;
            let _e273 = u_xlat10_;
            let _e275 = u_xlat10_;
            u_xlat5_.x = dot(_e273.xyz, _e275.xyz);
            let _e279 = u_xlat5_;
            u_xlat5_.x = max(_e279.x, 0.000061035156f);
            let _e283 = u_xlat5_;
            u_xlat11_ = inverseSqrt(_e283.x);
            let _e286 = u_xlat10_;
            let _e288 = u_xlat10_;
            let _e290 = u_xlat11_;
            let _e292 = (_e288.xyz * vec3(_e290));
            u_xlat10_.x = _e292.x;
            u_xlat10_.y = _e292.y;
            u_xlat10_.z = _e292.z;
            let _e301 = u_xlati4_;
            let _e306 = _f_buffer1_.f_cb1_[(_e301 + 512i)];
            u_xlat11_ = (1f / _e306.x);
            let _e310 = u_xlat5_;
            u_xlat5_.x = (_e310.x * 25f);
            let _e315 = u_xlat5_;
            let _e317 = u_xlat11_;
            u_xlat5_.x = (_e315.x / _e317);
            let _e320 = u_xlat5_;
            u_xlat5_.x = (_e320.x + 1f);
            let _e327 = u_xlat5_;
            u_xlat5_.x = (1f / _e327.x);
            let _e330 = u_xlati4_;
            let _e335 = _f_buffer1_.f_cb1_[(_e330 + 768i)];
            let _e337 = u_xlat10_;
            u_xlat11_ = dot(_e335.xyz, _e337.xyz);
            let _e340 = u_xlat11_;
            let _e341 = u_xlati4_;
            let _e346 = _f_buffer1_.f_cb1_[(_e341 + 512i)];
            let _e349 = u_xlati4_;
            let _e354 = _f_buffer1_.f_cb1_[(_e349 + 512i)];
            u_xlat11_ = ((_e340 * _e346.z) + _e354.w);
            let _e357 = u_xlat11_;
            u_xlat11_ = clamp(_e357, 0f, 1f);
            let _e361 = u_xlat11_;
            let _e362 = u_xlat11_;
            u_xlat11_ = (_e361 * _e362);
            let _e365 = u_xlat11_;
            let _e366 = u_xlat5_;
            u_xlat5_.x = (_e365 * _e366.x);
            let _e369 = u_xlat5_;
            let _e371 = u_xlat5_;
            let _e373 = u_xlati4_;
            let _e378 = _f_buffer1_.f_cb1_[(_e373 + 256i)];
            let _e380 = (_e371.xxx * _e378.xyz);
            u_xlat5_.x = _e380.x;
            u_xlat5_.y = _e380.y;
            u_xlat5_.z = _e380.z;
            let _e387 = u_xlat1_;
            let _e389 = u_xlat10_;
            u_xlat4_ = dot(_e387.xyz, _e389.xyz);
            let _e392 = u_xlat4_;
            u_xlat4_ = clamp(_e392, 0f, 1f);
            let _e396 = u_xlat3_;
            let _e398 = u_xlat5_;
            let _e400 = u_xlat4_;
            let _e403 = u_xlat3_;
            let _e405 = ((_e398.xyz * vec3(_e400)) + _e403.xyz);
            u_xlat3_.x = _e405.x;
            u_xlat3_.y = _e405.y;
            u_xlat3_.z = _e405.z;
        }
        continuing {
            let _e223 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e223 + 1u);
        }
    }
    let _e412 = u_xlat1_;
    let _e414 = u_xlat2_;
    let _e416 = u_xlat19_;
    let _e419 = u_xlat3_;
    let _e421 = ((_e414.xyz * vec3(_e416)) + _e419.xyz);
    u_xlat1_.x = _e421.x;
    u_xlat1_.y = _e421.y;
    u_xlat1_.z = _e421.z;
    let _e432 = _f_buffer2_.f_cb2_[27];
    u_xlat2_.x = abs(_e432.w);
    let _e439 = _f_buffer2_.f_cb2_[28];
    u_xlat2_.y = abs(_e439.w);
    let _e446 = _f_buffer2_.f_cb2_[29];
    u_xlat2_.z = abs(_e446.w);
    let _e449 = u_xlat2_;
    let _e451 = u_xlat2_;
    let _e453 = log2(_e451.xyz);
    u_xlat2_.x = _e453.x;
    u_xlat2_.y = _e453.y;
    u_xlat2_.z = _e453.z;
    let _e460 = u_xlat2_;
    let _e462 = u_xlat2_;
    let _e468 = (_e462.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat2_.x = _e468.x;
    u_xlat2_.y = _e468.y;
    u_xlat2_.z = _e468.z;
    let _e475 = u_xlat2_;
    let _e477 = u_xlat2_;
    let _e479 = exp2(_e477.xyz);
    u_xlat2_.x = _e479.x;
    u_xlat2_.y = _e479.y;
    u_xlat2_.z = _e479.z;
    let _e486 = u_xlat2_;
    let _e488 = u_xlat2_;
    let _e502 = ((_e488.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat2_.x = _e502.x;
    u_xlat2_.y = _e502.y;
    u_xlat2_.z = _e502.z;
    let _e509 = u_xlat2_;
    let _e511 = u_xlat2_;
    let _e517 = clamp(_e511.xyz, vec3(0f), vec3(1f));
    u_xlat2_.x = _e517.x;
    u_xlat2_.y = _e517.y;
    u_xlat2_.z = _e517.z;
    let _e524 = u_xlat1_;
    let _e526 = u_xlat1_;
    let _e528 = u_xlat2_;
    let _e530 = (_e526.xyz + _e528.xyz);
    u_xlat1_.x = _e530.x;
    u_xlat1_.y = _e530.y;
    u_xlat1_.z = _e530.z;
    let _e537 = u_xlat1_;
    let _e539 = u_xlat0_;
    let _e541 = u_xlat1_;
    let _e543 = (_e539.xyz * _e541.xyz);
    u_xlat1_.x = _e543.x;
    u_xlat1_.y = _e543.y;
    u_xlat1_.z = _e543.z;
    let _e550 = u_xlat0_;
    let _e552 = u_xlat0_;
    let _e554 = u_xlat1_;
    let _e556 = (_e552.www * _e554.xyz);
    u_xlat0_.x = _e556.x;
    u_xlat0_.y = _e556.y;
    u_xlat0_.z = _e556.z;
    let _e563 = u_xlat0_;
    SV_Target0_ = _e563;
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
