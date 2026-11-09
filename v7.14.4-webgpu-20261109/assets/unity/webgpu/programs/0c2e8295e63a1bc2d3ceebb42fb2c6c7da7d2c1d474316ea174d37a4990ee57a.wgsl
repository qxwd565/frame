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

    let _e79 = vs_TEXCOORD0_1;
    let _e84 = _f_buffer0_.f_cb0_[4];
    let _e89 = hscard_bias.values[0];
    let _e92 = textureSampleBias(f_t0_, samplerf_s0_, _e79.xy, (_e84.x + _e89.x));
    u_xlat0_ = _e92;
    let _e93 = vs_TEXCOORD5_1;
    let _e98 = _f_buffer0_.f_cb0_[4];
    let _e103 = hscard_bias.values[1];
    let _e106 = textureSampleBias(f_t1_, samplerf_s1_, _e93.xy, (_e98.x + _e103.x));
    u_xlat1_ = _e106;
    let _e108 = u_xlat1_;
    let _e113 = _f_buffer3_.f_cb3_[3];
    u_xlat1_.x = (_e108.x * _e113.x);
    let _e116 = u_xlat2_;
    let _e118 = u_xlat1_;
    let _e123 = _f_buffer3_.f_cb3_[2];
    let _e125 = (_e118.zzz * _e123.xyz);
    u_xlat2_.x = _e125.x;
    u_xlat2_.y = _e125.y;
    u_xlat2_.z = _e125.z;
    let _e132 = u_xlat0_;
    let _e134 = u_xlat0_;
    let _e136 = u_xlat1_;
    let _e139 = u_xlat2_;
    let _e141 = ((_e134.xyz * _e136.xxx) + _e139.xyz);
    u_xlat0_.x = _e141.x;
    u_xlat0_.y = _e141.y;
    u_xlat0_.z = _e141.z;
    let _e148 = u_xlat0_;
    let _e150 = u_xlat1_;
    let _e155 = _f_buffer3_.f_cb3_[3];
    let _e158 = u_xlat0_;
    let _e160 = ((_e150.yyy * _e155.yyy) + _e158.xyz);
    u_xlat0_.x = _e160.x;
    u_xlat0_.y = _e160.y;
    u_xlat0_.z = _e160.z;
    let _e168 = vs_NORMAL0_1;
    let _e170 = vs_NORMAL0_1;
    u_xlat1_.x = dot(_e168.xyz, _e170.xyz);
    let _e174 = u_xlat1_;
    u_xlat1_.x = inverseSqrt(_e174.x);
    let _e177 = u_xlat1_;
    let _e179 = u_xlat1_;
    let _e181 = vs_NORMAL0_1;
    let _e183 = (_e179.xxx * _e181.xyz);
    u_xlat1_.x = _e183.x;
    u_xlat1_.y = _e183.y;
    u_xlat1_.z = _e183.z;
    let _e190 = u_xlat2_;
    let _e195 = _f_buffer0_.f_cb0_[6];
    let _e200 = _f_buffer2_.f_cb2_[11];
    let _e202 = (_e195.xyz * _e200.zzz);
    u_xlat2_.x = _e202.x;
    u_xlat2_.y = _e202.y;
    u_xlat2_.z = _e202.z;
    let _e209 = u_xlat1_;
    let _e214 = _f_buffer0_.f_cb0_[5];
    u_xlat19_ = dot(_e209.xyz, _e214.xyz);
    let _e217 = u_xlat19_;
    u_xlat19_ = clamp(_e217, 0f, 1f);
    let _e224 = _f_buffer0_.f_cb0_[10];
    let _e229 = _f_buffer2_.f_cb2_[11];
    u_xlat20_ = min(_e224.x, _e229.y);
    let _e232 = u_xlat20_;
    u_xlatu20_ = u32(i32(_e232));
    u_xlat3_.x = 0f;
    u_xlat3_.y = 0f;
    u_xlat3_.z = 0f;
    loop {
        let _e247 = u_xlatu_loop_1_;
        let _e248 = u_xlatu20_;
        if !((_e247 < _e248)) {
            break;
        }
        {
            let _e254 = u_xlatu_loop_1_;
            u_xlatu4_ = (_e254 >> 2u);
            let _e257 = u_xlatu_loop_1_;
            u_xlati10_ = i32((_e257 & 3u));
            let _e261 = u_xlatu4_;
            let _e267 = _f_buffer2_.f_cb2_[(i32(_e261) + 12i)];
            let _e268 = u_xlati10_;
            let _e272 = local[_e268];
            u_xlat4_ = dot(_e267, bitcast<vec4<f32>>(_e272));
            let _e275 = u_xlat4_;
            u_xlati4_ = i32(_e275);
            let _e277 = u_xlat10_;
            let _e279 = vs_TEXCOORD1_1;
            let _e282 = u_xlati4_;
            let _e285 = _f_buffer1_.f_cb1_[_e282];
            let _e288 = u_xlati4_;
            let _e291 = _f_buffer1_.f_cb1_[_e288];
            let _e293 = ((-(_e279.xyz) * _e285.www) + _e291.xyz);
            u_xlat10_.x = _e293.x;
            u_xlat10_.y = _e293.y;
            u_xlat10_.z = _e293.z;
            let _e301 = u_xlat10_;
            let _e303 = u_xlat10_;
            u_xlat5_.x = dot(_e301.xyz, _e303.xyz);
            let _e307 = u_xlat5_;
            u_xlat5_.x = max(_e307.x, 0.000061035156f);
            let _e311 = u_xlat5_;
            u_xlat11_ = inverseSqrt(_e311.x);
            let _e314 = u_xlat10_;
            let _e316 = u_xlat10_;
            let _e318 = u_xlat11_;
            let _e320 = (_e316.xyz * vec3(_e318));
            u_xlat10_.x = _e320.x;
            u_xlat10_.y = _e320.y;
            u_xlat10_.z = _e320.z;
            let _e329 = u_xlati4_;
            let _e334 = _f_buffer1_.f_cb1_[(_e329 + 512i)];
            u_xlat11_ = (1f / _e334.x);
            let _e338 = u_xlat5_;
            u_xlat5_.x = (_e338.x * 25f);
            let _e343 = u_xlat5_;
            let _e345 = u_xlat11_;
            u_xlat5_.x = (_e343.x / _e345);
            let _e348 = u_xlat5_;
            u_xlat5_.x = (_e348.x + 1f);
            let _e355 = u_xlat5_;
            u_xlat5_.x = (1f / _e355.x);
            let _e358 = u_xlati4_;
            let _e363 = _f_buffer1_.f_cb1_[(_e358 + 768i)];
            let _e365 = u_xlat10_;
            u_xlat11_ = dot(_e363.xyz, _e365.xyz);
            let _e368 = u_xlat11_;
            let _e369 = u_xlati4_;
            let _e374 = _f_buffer1_.f_cb1_[(_e369 + 512i)];
            let _e377 = u_xlati4_;
            let _e382 = _f_buffer1_.f_cb1_[(_e377 + 512i)];
            u_xlat11_ = ((_e368 * _e374.z) + _e382.w);
            let _e385 = u_xlat11_;
            u_xlat11_ = clamp(_e385, 0f, 1f);
            let _e389 = u_xlat11_;
            let _e390 = u_xlat11_;
            u_xlat11_ = (_e389 * _e390);
            let _e393 = u_xlat11_;
            let _e394 = u_xlat5_;
            u_xlat5_.x = (_e393 * _e394.x);
            let _e397 = u_xlat5_;
            let _e399 = u_xlat5_;
            let _e401 = u_xlati4_;
            let _e406 = _f_buffer1_.f_cb1_[(_e401 + 256i)];
            let _e408 = (_e399.xxx * _e406.xyz);
            u_xlat5_.x = _e408.x;
            u_xlat5_.y = _e408.y;
            u_xlat5_.z = _e408.z;
            let _e415 = u_xlat1_;
            let _e417 = u_xlat10_;
            u_xlat4_ = dot(_e415.xyz, _e417.xyz);
            let _e420 = u_xlat4_;
            u_xlat4_ = clamp(_e420, 0f, 1f);
            let _e424 = u_xlat3_;
            let _e426 = u_xlat5_;
            let _e428 = u_xlat4_;
            let _e431 = u_xlat3_;
            let _e433 = ((_e426.xyz * vec3(_e428)) + _e431.xyz);
            u_xlat3_.x = _e433.x;
            u_xlat3_.y = _e433.y;
            u_xlat3_.z = _e433.z;
        }
        continuing {
            let _e251 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e251 + 1u);
        }
    }
    let _e440 = u_xlat1_;
    let _e442 = u_xlat2_;
    let _e444 = u_xlat19_;
    let _e447 = u_xlat3_;
    let _e449 = ((_e442.xyz * vec3(_e444)) + _e447.xyz);
    u_xlat1_.x = _e449.x;
    u_xlat1_.y = _e449.y;
    u_xlat1_.z = _e449.z;
    let _e460 = _f_buffer2_.f_cb2_[27];
    u_xlat2_.x = abs(_e460.w);
    let _e467 = _f_buffer2_.f_cb2_[28];
    u_xlat2_.y = abs(_e467.w);
    let _e474 = _f_buffer2_.f_cb2_[29];
    u_xlat2_.z = abs(_e474.w);
    let _e477 = u_xlat2_;
    let _e479 = u_xlat2_;
    let _e481 = log2(_e479.xyz);
    u_xlat2_.x = _e481.x;
    u_xlat2_.y = _e481.y;
    u_xlat2_.z = _e481.z;
    let _e488 = u_xlat2_;
    let _e490 = u_xlat2_;
    let _e496 = (_e490.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat2_.x = _e496.x;
    u_xlat2_.y = _e496.y;
    u_xlat2_.z = _e496.z;
    let _e503 = u_xlat2_;
    let _e505 = u_xlat2_;
    let _e507 = exp2(_e505.xyz);
    u_xlat2_.x = _e507.x;
    u_xlat2_.y = _e507.y;
    u_xlat2_.z = _e507.z;
    let _e514 = u_xlat2_;
    let _e516 = u_xlat2_;
    let _e530 = ((_e516.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat2_.x = _e530.x;
    u_xlat2_.y = _e530.y;
    u_xlat2_.z = _e530.z;
    let _e537 = u_xlat2_;
    let _e539 = u_xlat2_;
    let _e545 = clamp(_e539.xyz, vec3(0f), vec3(1f));
    u_xlat2_.x = _e545.x;
    u_xlat2_.y = _e545.y;
    u_xlat2_.z = _e545.z;
    let _e552 = u_xlat1_;
    let _e554 = u_xlat1_;
    let _e556 = u_xlat2_;
    let _e558 = (_e554.xyz + _e556.xyz);
    u_xlat1_.x = _e558.x;
    u_xlat1_.y = _e558.y;
    u_xlat1_.z = _e558.z;
    let _e565 = SV_Target0_;
    let _e567 = u_xlat0_;
    let _e569 = u_xlat1_;
    let _e571 = (_e567.xyz * _e569.xyz);
    SV_Target0_.x = _e571.x;
    SV_Target0_.y = _e571.y;
    SV_Target0_.z = _e571.z;
    let _e579 = u_xlat0_;
    SV_Target0_.w = _e579.w;
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
