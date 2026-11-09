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
@group(3) @binding(1) 
var samplerf_s0_: sampler;
@group(3) @binding(3) 
var samplerf_s1_: sampler;
@group(3) @binding(5) 
var samplerf_s2_: sampler;
@group(3) @binding(7) 
var samplerf_s3_: sampler;
@group(3) @binding(9) 
var samplerf_s4_: sampler;
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
@group(3) @binding(4) 
var f_t2_: texture_2d<f32>;
@group(3) @binding(6) 
var f_t3_: texture_2d<f32>;
@group(3) @binding(8) 
var f_t4_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD1_1: vec3<f32>;
var<private> vs_NORMAL0_1: vec3<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec4<f32> = vec4(0f);
    var u_xlat4_: vec4<f32> = vec4(0f);
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
    let _e110 = vs_TEXCOORD0_1;
    let _e115 = _f_buffer0_.f_cb0_[4];
    let _e120 = hscard_bias.values[2];
    let _e123 = textureSampleBias(f_t2_, samplerf_s2_, _e110.xy, (_e115.x + _e120.x));
    u_xlat2_ = _e123;
    let _e124 = vs_TEXCOORD0_1;
    let _e129 = _f_buffer0_.f_cb0_[4];
    let _e134 = hscard_bias.values[3];
    let _e137 = textureSampleBias(f_t3_, samplerf_s3_, _e124.xy, (_e129.x + _e134.x));
    u_xlat3_ = _e137;
    let _e138 = vs_TEXCOORD0_1;
    let _e143 = _f_buffer0_.f_cb0_[4];
    let _e148 = hscard_bias.values[4];
    let _e151 = textureSampleBias(f_t4_, samplerf_s4_, _e138.xy, (_e143.x + _e148.x));
    u_xlat4_ = _e151;
    let _e152 = u_xlat0_;
    let _e154 = u_xlat1_;
    u_xlat1_ = (-(_e152) + _e154);
    let _e156 = u_xlat2_;
    let _e158 = u_xlat1_;
    let _e160 = u_xlat0_;
    u_xlat0_ = ((_e156.xxxx * _e158) + _e160);
    let _e162 = u_xlat0_;
    let _e164 = u_xlat3_;
    u_xlat1_ = (-(_e162) + _e164);
    let _e166 = u_xlat4_;
    let _e168 = u_xlat1_;
    let _e170 = u_xlat0_;
    u_xlat0_ = ((_e166.yyyy * _e168) + _e170);
    let _e173 = vs_NORMAL0_1;
    let _e175 = vs_NORMAL0_1;
    u_xlat1_.x = dot(_e173.xyz, _e175.xyz);
    let _e179 = u_xlat1_;
    u_xlat1_.x = inverseSqrt(_e179.x);
    let _e182 = u_xlat1_;
    let _e184 = u_xlat1_;
    let _e186 = vs_NORMAL0_1;
    let _e188 = (_e184.xxx * _e186.xyz);
    u_xlat1_.x = _e188.x;
    u_xlat1_.y = _e188.y;
    u_xlat1_.z = _e188.z;
    let _e195 = u_xlat2_;
    let _e200 = _f_buffer0_.f_cb0_[6];
    let _e205 = _f_buffer2_.f_cb2_[11];
    let _e207 = (_e200.xyz * _e205.zzz);
    u_xlat2_.x = _e207.x;
    u_xlat2_.y = _e207.y;
    u_xlat2_.z = _e207.z;
    let _e214 = u_xlat1_;
    let _e219 = _f_buffer0_.f_cb0_[5];
    u_xlat19_ = dot(_e214.xyz, _e219.xyz);
    let _e222 = u_xlat19_;
    u_xlat19_ = clamp(_e222, 0f, 1f);
    let _e229 = _f_buffer0_.f_cb0_[10];
    let _e234 = _f_buffer2_.f_cb2_[11];
    u_xlat20_ = min(_e229.x, _e234.y);
    let _e237 = u_xlat20_;
    u_xlatu20_ = u32(i32(_e237));
    u_xlat3_.x = 0f;
    u_xlat3_.y = 0f;
    u_xlat3_.z = 0f;
    loop {
        let _e252 = u_xlatu_loop_1_;
        let _e253 = u_xlatu20_;
        if !((_e252 < _e253)) {
            break;
        }
        {
            let _e259 = u_xlatu_loop_1_;
            u_xlatu4_ = (_e259 >> 2u);
            let _e262 = u_xlatu_loop_1_;
            u_xlati10_ = i32((_e262 & 3u));
            let _e267 = u_xlatu4_;
            let _e273 = _f_buffer2_.f_cb2_[(i32(_e267) + 12i)];
            let _e274 = u_xlati10_;
            let _e278 = local[_e274];
            u_xlat4_.x = dot(_e273, bitcast<vec4<f32>>(_e278));
            let _e281 = u_xlat4_;
            u_xlati4_ = i32(_e281.x);
            let _e284 = u_xlat10_;
            let _e286 = vs_TEXCOORD1_1;
            let _e289 = u_xlati4_;
            let _e292 = _f_buffer1_.f_cb1_[_e289];
            let _e295 = u_xlati4_;
            let _e298 = _f_buffer1_.f_cb1_[_e295];
            let _e300 = ((-(_e286.xyz) * _e292.www) + _e298.xyz);
            u_xlat10_.x = _e300.x;
            u_xlat10_.y = _e300.y;
            u_xlat10_.z = _e300.z;
            let _e308 = u_xlat10_;
            let _e310 = u_xlat10_;
            u_xlat5_.x = dot(_e308.xyz, _e310.xyz);
            let _e314 = u_xlat5_;
            u_xlat5_.x = max(_e314.x, 0.000061035156f);
            let _e318 = u_xlat5_;
            u_xlat11_ = inverseSqrt(_e318.x);
            let _e321 = u_xlat10_;
            let _e323 = u_xlat10_;
            let _e325 = u_xlat11_;
            let _e327 = (_e323.xyz * vec3(_e325));
            u_xlat10_.x = _e327.x;
            u_xlat10_.y = _e327.y;
            u_xlat10_.z = _e327.z;
            let _e336 = u_xlati4_;
            let _e341 = _f_buffer1_.f_cb1_[(_e336 + 512i)];
            u_xlat11_ = (1f / _e341.x);
            let _e345 = u_xlat5_;
            u_xlat5_.x = (_e345.x * 25f);
            let _e350 = u_xlat5_;
            let _e352 = u_xlat11_;
            u_xlat5_.x = (_e350.x / _e352);
            let _e355 = u_xlat5_;
            u_xlat5_.x = (_e355.x + 1f);
            let _e362 = u_xlat5_;
            u_xlat5_.x = (1f / _e362.x);
            let _e365 = u_xlati4_;
            let _e370 = _f_buffer1_.f_cb1_[(_e365 + 768i)];
            let _e372 = u_xlat10_;
            u_xlat11_ = dot(_e370.xyz, _e372.xyz);
            let _e375 = u_xlat11_;
            let _e376 = u_xlati4_;
            let _e381 = _f_buffer1_.f_cb1_[(_e376 + 512i)];
            let _e384 = u_xlati4_;
            let _e389 = _f_buffer1_.f_cb1_[(_e384 + 512i)];
            u_xlat11_ = ((_e375 * _e381.z) + _e389.w);
            let _e392 = u_xlat11_;
            u_xlat11_ = clamp(_e392, 0f, 1f);
            let _e396 = u_xlat11_;
            let _e397 = u_xlat11_;
            u_xlat11_ = (_e396 * _e397);
            let _e400 = u_xlat11_;
            let _e401 = u_xlat5_;
            u_xlat5_.x = (_e400 * _e401.x);
            let _e404 = u_xlat5_;
            let _e406 = u_xlat5_;
            let _e408 = u_xlati4_;
            let _e413 = _f_buffer1_.f_cb1_[(_e408 + 256i)];
            let _e415 = (_e406.xxx * _e413.xyz);
            u_xlat5_.x = _e415.x;
            u_xlat5_.y = _e415.y;
            u_xlat5_.z = _e415.z;
            let _e423 = u_xlat1_;
            let _e425 = u_xlat10_;
            u_xlat4_.x = dot(_e423.xyz, _e425.xyz);
            let _e429 = u_xlat4_;
            u_xlat4_.x = clamp(_e429.x, 0f, 1f);
            let _e434 = u_xlat3_;
            let _e436 = u_xlat5_;
            let _e438 = u_xlat4_;
            let _e441 = u_xlat3_;
            let _e443 = ((_e436.xyz * _e438.xxx) + _e441.xyz);
            u_xlat3_.x = _e443.x;
            u_xlat3_.y = _e443.y;
            u_xlat3_.z = _e443.z;
        }
        continuing {
            let _e256 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e256 + 1u);
        }
    }
    let _e450 = u_xlat1_;
    let _e452 = u_xlat2_;
    let _e454 = u_xlat19_;
    let _e457 = u_xlat3_;
    let _e459 = ((_e452.xyz * vec3(_e454)) + _e457.xyz);
    u_xlat1_.x = _e459.x;
    u_xlat1_.y = _e459.y;
    u_xlat1_.z = _e459.z;
    let _e470 = _f_buffer2_.f_cb2_[27];
    u_xlat2_.x = abs(_e470.w);
    let _e477 = _f_buffer2_.f_cb2_[28];
    u_xlat2_.y = abs(_e477.w);
    let _e484 = _f_buffer2_.f_cb2_[29];
    u_xlat2_.z = abs(_e484.w);
    let _e487 = u_xlat2_;
    let _e489 = u_xlat2_;
    let _e491 = log2(_e489.xyz);
    u_xlat2_.x = _e491.x;
    u_xlat2_.y = _e491.y;
    u_xlat2_.z = _e491.z;
    let _e498 = u_xlat2_;
    let _e500 = u_xlat2_;
    let _e506 = (_e500.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat2_.x = _e506.x;
    u_xlat2_.y = _e506.y;
    u_xlat2_.z = _e506.z;
    let _e513 = u_xlat2_;
    let _e515 = u_xlat2_;
    let _e517 = exp2(_e515.xyz);
    u_xlat2_.x = _e517.x;
    u_xlat2_.y = _e517.y;
    u_xlat2_.z = _e517.z;
    let _e524 = u_xlat2_;
    let _e526 = u_xlat2_;
    let _e540 = ((_e526.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat2_.x = _e540.x;
    u_xlat2_.y = _e540.y;
    u_xlat2_.z = _e540.z;
    let _e547 = u_xlat2_;
    let _e549 = u_xlat2_;
    let _e555 = clamp(_e549.xyz, vec3(0f), vec3(1f));
    u_xlat2_.x = _e555.x;
    u_xlat2_.y = _e555.y;
    u_xlat2_.z = _e555.z;
    let _e562 = u_xlat1_;
    let _e564 = u_xlat1_;
    let _e566 = u_xlat2_;
    let _e568 = (_e564.xyz + _e566.xyz);
    u_xlat1_.x = _e568.x;
    u_xlat1_.y = _e568.y;
    u_xlat1_.z = _e568.z;
    let _e575 = SV_Target0_;
    let _e577 = u_xlat0_;
    let _e579 = u_xlat1_;
    let _e581 = (_e577.xyz * _e579.xyz);
    SV_Target0_.x = _e581.x;
    SV_Target0_.y = _e581.y;
    SV_Target0_.z = _e581.z;
    let _e589 = u_xlat0_;
    SV_Target0_.w = _e589.w;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec3<f32>, @location(12) vs_NORMAL0_: vec3<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_NORMAL0_1 = vs_NORMAL0_;
    main_1();
    let _e49 = SV_Target0_;
    return FragmentOutput(_e49);
}
