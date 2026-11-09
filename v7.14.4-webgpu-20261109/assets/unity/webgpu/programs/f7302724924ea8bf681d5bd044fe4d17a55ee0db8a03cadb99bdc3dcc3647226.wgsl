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
@group(3) @binding(3) 
var samplerf_s1_: sampler;
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD1_1: vec3<f32>;
var<private> vs_TEXCOORD4_1: vec4<f32>;
var<private> vs_NORMAL0_1: vec3<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec3<f32> = vec3(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: f32 = 0f;
    var u_xlati4_: i32 = 0i;
    var u_xlatu4_: u32 = 0u;
    var u_xlatb4_: bool = false;
    var u_xlat5_: vec3<f32> = vec3(0f);
    var u_xlat8_: f32 = 0f;
    var u_xlat10_: vec3<f32> = vec3(0f);
    var u_xlati10_: i32 = 0i;
    var u_xlat11_: f32 = 0f;
    var u_xlat19_: f32 = 0f;
    var u_xlat20_: f32 = 0f;
    var u_xlatu20_: u32 = 0u;
    var u_xlatu21_: u32 = 0u;
    var u_xlatu_loop_1_: u32 = 0u;
    var local: array<vec4<u32>, 4> = ImmCB_0_;

    let _e82 = vs_TEXCOORD0_1;
    let _e87 = _f_buffer0_.f_cb0_[4];
    let _e92 = hscard_bias.values[0];
    let _e95 = textureSampleBias(f_t0_, samplerf_s0_, _e82.xy, (_e87.x + _e92.x));
    u_xlat0_ = _e95;
    let _e96 = vs_TEXCOORD0_1;
    let _e101 = _f_buffer0_.f_cb0_[4];
    let _e106 = hscard_bias.values[1];
    let _e109 = textureSampleBias(f_t1_, samplerf_s1_, _e96.xy, (_e101.x + _e106.x));
    u_xlat1_ = _e109;
    let _e111 = vs_TEXCOORD4_1;
    let _e116 = _f_buffer3_.f_cb3_[2];
    u_xlat2_.x = (_e111.z + _e116.x);
    let _e120 = u_xlat2_;
    let _e125 = _f_buffer3_.f_cb3_[2];
    u_xlat2_.x = (_e120.x + _e125.y);
    let _e131 = _f_buffer3_.f_cb3_[2];
    let _e136 = _f_buffer3_.f_cb3_[2];
    u_xlat8_ = (_e131.y + _e136.y);
    let _e140 = u_xlat2_;
    let _e142 = u_xlat8_;
    u_xlat2_.x = (_e140.x / _e142);
    let _e145 = u_xlat2_;
    u_xlat2_.x = clamp(_e145.x, 0f, 1f);
    let _e150 = u_xlat2_;
    u_xlat8_ = (-(_e150.x) + 1f);
    let _e155 = u_xlat1_;
    let _e156 = u_xlat2_;
    u_xlat1_ = (_e155 * _e156.xxxx);
    let _e159 = u_xlat0_;
    let _e160 = u_xlat8_;
    let _e163 = u_xlat1_;
    u_xlat0_ = ((_e159 * vec4(_e160)) + _e163);
    let _e166 = vs_NORMAL0_1;
    let _e168 = vs_NORMAL0_1;
    u_xlat1_.x = dot(_e166.xyz, _e168.xyz);
    let _e172 = u_xlat1_;
    u_xlat1_.x = inverseSqrt(_e172.x);
    let _e175 = u_xlat1_;
    let _e177 = u_xlat1_;
    let _e179 = vs_NORMAL0_1;
    let _e181 = (_e177.xxx * _e179.xyz);
    u_xlat1_.x = _e181.x;
    u_xlat1_.y = _e181.y;
    u_xlat1_.z = _e181.z;
    let _e188 = u_xlat2_;
    let _e193 = _f_buffer0_.f_cb0_[6];
    let _e198 = _f_buffer2_.f_cb2_[11];
    let _e200 = (_e193.xyz * _e198.zzz);
    u_xlat2_.x = _e200.x;
    u_xlat2_.y = _e200.y;
    u_xlat2_.z = _e200.z;
    let _e207 = u_xlat1_;
    let _e212 = _f_buffer0_.f_cb0_[5];
    u_xlat19_ = dot(_e207.xyz, _e212.xyz);
    let _e215 = u_xlat19_;
    u_xlat19_ = clamp(_e215, 0f, 1f);
    let _e222 = _f_buffer0_.f_cb0_[10];
    let _e227 = _f_buffer2_.f_cb2_[11];
    u_xlat20_ = min(_e222.x, _e227.y);
    let _e230 = u_xlat20_;
    u_xlatu20_ = u32(i32(_e230));
    u_xlat3_.x = 0f;
    u_xlat3_.y = 0f;
    u_xlat3_.z = 0f;
    loop {
        let _e245 = u_xlatu_loop_1_;
        let _e246 = u_xlatu20_;
        if !((_e245 < _e246)) {
            break;
        }
        {
            let _e252 = u_xlatu_loop_1_;
            u_xlatu4_ = (_e252 >> 2u);
            let _e255 = u_xlatu_loop_1_;
            u_xlati10_ = i32((_e255 & 3u));
            let _e259 = u_xlatu4_;
            let _e265 = _f_buffer2_.f_cb2_[(i32(_e259) + 12i)];
            let _e266 = u_xlati10_;
            let _e270 = local[_e266];
            u_xlat4_ = dot(_e265, bitcast<vec4<f32>>(_e270));
            let _e273 = u_xlat4_;
            u_xlati4_ = i32(_e273);
            let _e275 = u_xlat10_;
            let _e277 = vs_TEXCOORD1_1;
            let _e280 = u_xlati4_;
            let _e283 = _f_buffer1_.f_cb1_[_e280];
            let _e286 = u_xlati4_;
            let _e289 = _f_buffer1_.f_cb1_[_e286];
            let _e291 = ((-(_e277.xyz) * _e283.www) + _e289.xyz);
            u_xlat10_.x = _e291.x;
            u_xlat10_.y = _e291.y;
            u_xlat10_.z = _e291.z;
            let _e299 = u_xlat10_;
            let _e301 = u_xlat10_;
            u_xlat5_.x = dot(_e299.xyz, _e301.xyz);
            let _e305 = u_xlat5_;
            u_xlat5_.x = max(_e305.x, 0.000061035156f);
            let _e309 = u_xlat5_;
            u_xlat11_ = inverseSqrt(_e309.x);
            let _e312 = u_xlat10_;
            let _e314 = u_xlat10_;
            let _e316 = u_xlat11_;
            let _e318 = (_e314.xyz * vec3(_e316));
            u_xlat10_.x = _e318.x;
            u_xlat10_.y = _e318.y;
            u_xlat10_.z = _e318.z;
            let _e327 = u_xlati4_;
            let _e332 = _f_buffer1_.f_cb1_[(_e327 + 512i)];
            u_xlat11_ = (1f / _e332.x);
            let _e336 = u_xlat5_;
            u_xlat5_.x = (_e336.x * 25f);
            let _e341 = u_xlat5_;
            let _e343 = u_xlat11_;
            u_xlat5_.x = (_e341.x / _e343);
            let _e346 = u_xlat5_;
            u_xlat5_.x = (_e346.x + 1f);
            let _e353 = u_xlat5_;
            u_xlat5_.x = (1f / _e353.x);
            let _e356 = u_xlati4_;
            let _e361 = _f_buffer1_.f_cb1_[(_e356 + 768i)];
            let _e363 = u_xlat10_;
            u_xlat11_ = dot(_e361.xyz, _e363.xyz);
            let _e366 = u_xlat11_;
            let _e367 = u_xlati4_;
            let _e372 = _f_buffer1_.f_cb1_[(_e367 + 512i)];
            let _e375 = u_xlati4_;
            let _e380 = _f_buffer1_.f_cb1_[(_e375 + 512i)];
            u_xlat11_ = ((_e366 * _e372.z) + _e380.w);
            let _e383 = u_xlat11_;
            u_xlat11_ = clamp(_e383, 0f, 1f);
            let _e387 = u_xlat11_;
            let _e388 = u_xlat11_;
            u_xlat11_ = (_e387 * _e388);
            let _e391 = u_xlat11_;
            let _e392 = u_xlat5_;
            u_xlat5_.x = (_e391 * _e392.x);
            let _e395 = u_xlat5_;
            let _e397 = u_xlat5_;
            let _e399 = u_xlati4_;
            let _e404 = _f_buffer1_.f_cb1_[(_e399 + 256i)];
            let _e406 = (_e397.xxx * _e404.xyz);
            u_xlat5_.x = _e406.x;
            u_xlat5_.y = _e406.y;
            u_xlat5_.z = _e406.z;
            let _e413 = u_xlat1_;
            let _e415 = u_xlat10_;
            u_xlat4_ = dot(_e413.xyz, _e415.xyz);
            let _e418 = u_xlat4_;
            u_xlat4_ = clamp(_e418, 0f, 1f);
            let _e422 = u_xlat3_;
            let _e424 = u_xlat5_;
            let _e426 = u_xlat4_;
            let _e429 = u_xlat3_;
            let _e431 = ((_e424.xyz * vec3(_e426)) + _e429.xyz);
            u_xlat3_.x = _e431.x;
            u_xlat3_.y = _e431.y;
            u_xlat3_.z = _e431.z;
        }
        continuing {
            let _e249 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e249 + 1u);
        }
    }
    let _e438 = u_xlat1_;
    let _e440 = u_xlat2_;
    let _e442 = u_xlat19_;
    let _e445 = u_xlat3_;
    let _e447 = ((_e440.xyz * vec3(_e442)) + _e445.xyz);
    u_xlat1_.x = _e447.x;
    u_xlat1_.y = _e447.y;
    u_xlat1_.z = _e447.z;
    let _e458 = _f_buffer2_.f_cb2_[27];
    u_xlat2_.x = abs(_e458.w);
    let _e465 = _f_buffer2_.f_cb2_[28];
    u_xlat2_.y = abs(_e465.w);
    let _e472 = _f_buffer2_.f_cb2_[29];
    u_xlat2_.z = abs(_e472.w);
    let _e475 = u_xlat2_;
    let _e477 = u_xlat2_;
    let _e479 = log2(_e477.xyz);
    u_xlat2_.x = _e479.x;
    u_xlat2_.y = _e479.y;
    u_xlat2_.z = _e479.z;
    let _e486 = u_xlat2_;
    let _e488 = u_xlat2_;
    let _e494 = (_e488.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat2_.x = _e494.x;
    u_xlat2_.y = _e494.y;
    u_xlat2_.z = _e494.z;
    let _e501 = u_xlat2_;
    let _e503 = u_xlat2_;
    let _e505 = exp2(_e503.xyz);
    u_xlat2_.x = _e505.x;
    u_xlat2_.y = _e505.y;
    u_xlat2_.z = _e505.z;
    let _e512 = u_xlat2_;
    let _e514 = u_xlat2_;
    let _e528 = ((_e514.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat2_.x = _e528.x;
    u_xlat2_.y = _e528.y;
    u_xlat2_.z = _e528.z;
    let _e535 = u_xlat2_;
    let _e537 = u_xlat2_;
    let _e543 = clamp(_e537.xyz, vec3(0f), vec3(1f));
    u_xlat2_.x = _e543.x;
    u_xlat2_.y = _e543.y;
    u_xlat2_.z = _e543.z;
    let _e550 = u_xlat1_;
    let _e552 = u_xlat1_;
    let _e554 = u_xlat2_;
    let _e556 = (_e552.xyz + _e554.xyz);
    u_xlat1_.x = _e556.x;
    u_xlat1_.y = _e556.y;
    u_xlat1_.z = _e556.z;
    let _e563 = SV_Target0_;
    let _e565 = u_xlat0_;
    let _e567 = u_xlat1_;
    let _e569 = (_e565.xyz * _e567.xyz);
    SV_Target0_.x = _e569.x;
    SV_Target0_.y = _e569.y;
    SV_Target0_.z = _e569.z;
    let _e577 = u_xlat0_;
    SV_Target0_.w = _e577.w;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec3<f32>, @location(4) vs_TEXCOORD4_: vec4<f32>, @location(12) vs_NORMAL0_: vec3<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_TEXCOORD4_1 = vs_TEXCOORD4_;
    vs_NORMAL0_1 = vs_NORMAL0_;
    main_1();
    let _e44 = SV_Target0_;
    return FragmentOutput(_e44);
}
