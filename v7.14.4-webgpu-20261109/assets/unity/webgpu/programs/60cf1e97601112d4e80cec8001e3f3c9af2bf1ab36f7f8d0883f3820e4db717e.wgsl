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
@group(3) @binding(1) 
var samplerf_s0_: sampler;
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD1_1: vec3<f32>;
var<private> vs_NORMAL0_1: vec3<f32>;
var<private> SV_TARGET0_: vec4<f32>;

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
    let _e91 = vs_NORMAL0_1;
    let _e93 = vs_NORMAL0_1;
    u_xlat1_.x = dot(_e91.xyz, _e93.xyz);
    let _e97 = u_xlat1_;
    u_xlat1_.x = inverseSqrt(_e97.x);
    let _e100 = u_xlat1_;
    let _e102 = u_xlat1_;
    let _e104 = vs_NORMAL0_1;
    let _e106 = (_e102.xxx * _e104.xyz);
    u_xlat1_.x = _e106.x;
    u_xlat1_.y = _e106.y;
    u_xlat1_.z = _e106.z;
    let _e113 = u_xlat2_;
    let _e118 = _f_buffer0_.f_cb0_[6];
    let _e123 = _f_buffer2_.f_cb2_[11];
    let _e125 = (_e118.xyz * _e123.zzz);
    u_xlat2_.x = _e125.x;
    u_xlat2_.y = _e125.y;
    u_xlat2_.z = _e125.z;
    let _e132 = u_xlat1_;
    let _e137 = _f_buffer0_.f_cb0_[5];
    u_xlat19_ = dot(_e132.xyz, _e137.xyz);
    let _e140 = u_xlat19_;
    u_xlat19_ = clamp(_e140, 0f, 1f);
    let _e147 = _f_buffer0_.f_cb0_[10];
    let _e152 = _f_buffer2_.f_cb2_[11];
    u_xlat20_ = min(_e147.x, _e152.y);
    let _e155 = u_xlat20_;
    u_xlatu20_ = u32(i32(_e155));
    u_xlat3_.x = 0f;
    u_xlat3_.y = 0f;
    u_xlat3_.z = 0f;
    loop {
        let _e170 = u_xlatu_loop_1_;
        let _e171 = u_xlatu20_;
        if !((_e170 < _e171)) {
            break;
        }
        {
            let _e177 = u_xlatu_loop_1_;
            u_xlatu4_ = (_e177 >> 2u);
            let _e180 = u_xlatu_loop_1_;
            u_xlati10_ = i32((_e180 & 3u));
            let _e184 = u_xlatu4_;
            let _e190 = _f_buffer2_.f_cb2_[(i32(_e184) + 12i)];
            let _e191 = u_xlati10_;
            let _e195 = local[_e191];
            u_xlat4_ = dot(_e190, bitcast<vec4<f32>>(_e195));
            let _e198 = u_xlat4_;
            u_xlati4_ = i32(_e198);
            let _e200 = u_xlat10_;
            let _e202 = vs_TEXCOORD1_1;
            let _e205 = u_xlati4_;
            let _e208 = _f_buffer1_.f_cb1_[_e205];
            let _e211 = u_xlati4_;
            let _e214 = _f_buffer1_.f_cb1_[_e211];
            let _e216 = ((-(_e202.xyz) * _e208.www) + _e214.xyz);
            u_xlat10_.x = _e216.x;
            u_xlat10_.y = _e216.y;
            u_xlat10_.z = _e216.z;
            let _e224 = u_xlat10_;
            let _e226 = u_xlat10_;
            u_xlat5_.x = dot(_e224.xyz, _e226.xyz);
            let _e230 = u_xlat5_;
            u_xlat5_.x = max(_e230.x, 0.000061035156f);
            let _e234 = u_xlat5_;
            u_xlat11_ = inverseSqrt(_e234.x);
            let _e237 = u_xlat10_;
            let _e239 = u_xlat10_;
            let _e241 = u_xlat11_;
            let _e243 = (_e239.xyz * vec3(_e241));
            u_xlat10_.x = _e243.x;
            u_xlat10_.y = _e243.y;
            u_xlat10_.z = _e243.z;
            let _e252 = u_xlati4_;
            let _e257 = _f_buffer1_.f_cb1_[(_e252 + 512i)];
            u_xlat11_ = (1f / _e257.x);
            let _e261 = u_xlat5_;
            u_xlat5_.x = (_e261.x * 25f);
            let _e266 = u_xlat5_;
            let _e268 = u_xlat11_;
            u_xlat5_.x = (_e266.x / _e268);
            let _e271 = u_xlat5_;
            u_xlat5_.x = (_e271.x + 1f);
            let _e278 = u_xlat5_;
            u_xlat5_.x = (1f / _e278.x);
            let _e281 = u_xlati4_;
            let _e286 = _f_buffer1_.f_cb1_[(_e281 + 768i)];
            let _e288 = u_xlat10_;
            u_xlat11_ = dot(_e286.xyz, _e288.xyz);
            let _e291 = u_xlat11_;
            let _e292 = u_xlati4_;
            let _e297 = _f_buffer1_.f_cb1_[(_e292 + 512i)];
            let _e300 = u_xlati4_;
            let _e305 = _f_buffer1_.f_cb1_[(_e300 + 512i)];
            u_xlat11_ = ((_e291 * _e297.z) + _e305.w);
            let _e308 = u_xlat11_;
            u_xlat11_ = clamp(_e308, 0f, 1f);
            let _e312 = u_xlat11_;
            let _e313 = u_xlat11_;
            u_xlat11_ = (_e312 * _e313);
            let _e316 = u_xlat11_;
            let _e317 = u_xlat5_;
            u_xlat5_.x = (_e316 * _e317.x);
            let _e320 = u_xlat5_;
            let _e322 = u_xlat5_;
            let _e324 = u_xlati4_;
            let _e329 = _f_buffer1_.f_cb1_[(_e324 + 256i)];
            let _e331 = (_e322.xxx * _e329.xyz);
            u_xlat5_.x = _e331.x;
            u_xlat5_.y = _e331.y;
            u_xlat5_.z = _e331.z;
            let _e338 = u_xlat1_;
            let _e340 = u_xlat10_;
            u_xlat4_ = dot(_e338.xyz, _e340.xyz);
            let _e343 = u_xlat4_;
            u_xlat4_ = clamp(_e343, 0f, 1f);
            let _e347 = u_xlat3_;
            let _e349 = u_xlat5_;
            let _e351 = u_xlat4_;
            let _e354 = u_xlat3_;
            let _e356 = ((_e349.xyz * vec3(_e351)) + _e354.xyz);
            u_xlat3_.x = _e356.x;
            u_xlat3_.y = _e356.y;
            u_xlat3_.z = _e356.z;
        }
        continuing {
            let _e174 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e174 + 1u);
        }
    }
    let _e363 = u_xlat1_;
    let _e365 = u_xlat2_;
    let _e367 = u_xlat19_;
    let _e370 = u_xlat3_;
    let _e372 = ((_e365.xyz * vec3(_e367)) + _e370.xyz);
    u_xlat1_.x = _e372.x;
    u_xlat1_.y = _e372.y;
    u_xlat1_.z = _e372.z;
    let _e383 = _f_buffer2_.f_cb2_[27];
    u_xlat2_.x = abs(_e383.w);
    let _e390 = _f_buffer2_.f_cb2_[28];
    u_xlat2_.y = abs(_e390.w);
    let _e397 = _f_buffer2_.f_cb2_[29];
    u_xlat2_.z = abs(_e397.w);
    let _e400 = u_xlat2_;
    let _e402 = u_xlat2_;
    let _e404 = log2(_e402.xyz);
    u_xlat2_.x = _e404.x;
    u_xlat2_.y = _e404.y;
    u_xlat2_.z = _e404.z;
    let _e411 = u_xlat2_;
    let _e413 = u_xlat2_;
    let _e419 = (_e413.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat2_.x = _e419.x;
    u_xlat2_.y = _e419.y;
    u_xlat2_.z = _e419.z;
    let _e426 = u_xlat2_;
    let _e428 = u_xlat2_;
    let _e430 = exp2(_e428.xyz);
    u_xlat2_.x = _e430.x;
    u_xlat2_.y = _e430.y;
    u_xlat2_.z = _e430.z;
    let _e437 = u_xlat2_;
    let _e439 = u_xlat2_;
    let _e453 = ((_e439.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat2_.x = _e453.x;
    u_xlat2_.y = _e453.y;
    u_xlat2_.z = _e453.z;
    let _e460 = u_xlat2_;
    let _e462 = u_xlat2_;
    let _e468 = clamp(_e462.xyz, vec3(0f), vec3(1f));
    u_xlat2_.x = _e468.x;
    u_xlat2_.y = _e468.y;
    u_xlat2_.z = _e468.z;
    let _e475 = u_xlat1_;
    let _e477 = u_xlat1_;
    let _e479 = u_xlat2_;
    let _e481 = (_e477.xyz + _e479.xyz);
    u_xlat1_.x = _e481.x;
    u_xlat1_.y = _e481.y;
    u_xlat1_.z = _e481.z;
    let _e488 = u_xlat1_;
    let _e490 = u_xlat0_;
    let _e492 = u_xlat1_;
    let _e495 = u_xlat0_;
    let _e498 = ((_e490.xyz * _e492.xyz) + -(_e495.xyz));
    u_xlat1_.x = _e498.x;
    u_xlat1_.y = _e498.y;
    u_xlat1_.z = _e498.z;
    let _e505 = SV_TARGET0_;
    let _e510 = _f_buffer3_.f_cb3_[1];
    let _e512 = u_xlat1_;
    let _e515 = u_xlat0_;
    let _e517 = ((_e510.xxx * _e512.xyz) + _e515.xyz);
    SV_TARGET0_.x = _e517.x;
    SV_TARGET0_.y = _e517.y;
    SV_TARGET0_.z = _e517.z;
    let _e525 = u_xlat0_;
    SV_TARGET0_.w = _e525.w;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec3<f32>, @location(12) vs_NORMAL0_: vec3<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_NORMAL0_1 = vs_NORMAL0_;
    main_1();
    let _e36 = SV_TARGET0_;
    return FragmentOutput(_e36);
}
