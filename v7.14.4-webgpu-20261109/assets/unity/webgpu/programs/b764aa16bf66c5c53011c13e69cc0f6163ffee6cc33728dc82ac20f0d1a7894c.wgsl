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
var<private> vs_NORMAL0_1: vec3<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD1_1: vec3<f32>;
var<private> vs_TEXCOORDindex3_1: vec4<f32>;
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
    var u_xlat18_: f32 = 0f;
    var u_xlat19_: f32 = 0f;
    var u_xlat20_: f32 = 0f;
    var u_xlatu20_: u32 = 0u;
    var u_xlatu21_: u32 = 0u;
    var txVec0_: vec3<f32>;
    var local: f32;
    var u_xlatu_loop_1_: u32 = 0u;
    var local_1: array<vec4<u32>, 4> = ImmCB_0_;

    let _e91 = vs_TEXCOORD0_1;
    let _e96 = _f_buffer0_.f_cb0_[4];
    let _e101 = hscard_bias.values[1];
    let _e104 = textureSampleBias(f_t1_, samplerf_s1_, _e91.xy, (_e96.x + _e101.x));
    u_xlat0_ = _e104;
    let _e105 = u_xlat0_;
    let _e107 = u_xlat0_;
    let _e112 = _f_buffer4_.f_cb4_[0];
    let _e114 = (_e107.xyz * _e112.xyz);
    u_xlat0_.x = _e114.x;
    u_xlat0_.y = _e114.y;
    u_xlat0_.z = _e114.z;
    let _e121 = u_xlat0_;
    let _e126 = _f_buffer4_.f_cb4_[0];
    let _e132 = _f_buffer4_.f_cb4_[1];
    u_xlat18_ = ((_e121.w * _e126.w) + -(_e132.x));
    let _e136 = u_xlat18_;
    u_xlat18_ = ceil(_e136);
    let _e138 = u_xlat0_;
    let _e140 = u_xlat18_;
    let _e142 = u_xlat0_;
    let _e144 = (vec3(_e140) * _e142.xyz);
    u_xlat0_.x = _e144.x;
    u_xlat0_.y = _e144.y;
    u_xlat0_.z = _e144.z;
    let _e152 = vs_NORMAL0_1;
    let _e154 = vs_NORMAL0_1;
    u_xlat1_.x = dot(_e152.xyz, _e154.xyz);
    let _e158 = u_xlat1_;
    u_xlat1_.x = inverseSqrt(_e158.x);
    let _e161 = u_xlat1_;
    let _e163 = u_xlat1_;
    let _e165 = vs_NORMAL0_1;
    let _e167 = (_e163.xxx * _e165.xyz);
    u_xlat1_.x = _e167.x;
    u_xlat1_.y = _e167.y;
    u_xlat1_.z = _e167.z;
    let _e174 = vs_TEXCOORDindex3_1;
    let _e175 = _e174.xy;
    let _e176 = vs_TEXCOORDindex3_1;
    txVec0_ = vec3<f32>(_e175.x, _e175.y, _e176.z);
    let _e182 = txVec0_;
    let _e186 = textureSampleCompareLevel(f_t0_, samplerf_s0_, _e182.xy, _e182.z);
    u_xlat19_ = _e186;
    let _e191 = _f_buffer3_.f_cb3_[27];
    u_xlat2_.x = (-(_e191.x) + 1f);
    let _e196 = u_xlat19_;
    let _e200 = _f_buffer3_.f_cb3_[27];
    let _e203 = u_xlat2_;
    u_xlat19_ = ((_e196 * _e200.x) + _e203.x);
    let _e207 = vs_TEXCOORDindex3_1;
    u_xlatb2_ = (0f >= _e207.z);
    let _e210 = vs_TEXCOORDindex3_1;
    u_xlatb8_ = (_e210.z >= 1f);
    let _e214 = u_xlatb8_;
    let _e215 = u_xlatb2_;
    u_xlatb2_ = (_e214 || _e215);
    let _e217 = u_xlatb2_;
    if _e217 {
        local = 1f;
    } else {
        let _e219 = u_xlat19_;
        local = _e219;
    }
    let _e221 = local;
    u_xlat19_ = _e221;
    let _e222 = u_xlat19_;
    let _e226 = _f_buffer2_.f_cb2_[11];
    u_xlat19_ = (_e222 * _e226.z);
    let _e229 = u_xlat2_;
    let _e231 = u_xlat19_;
    let _e236 = _f_buffer0_.f_cb0_[6];
    let _e238 = (vec3(_e231) * _e236.xyz);
    u_xlat2_.x = _e238.x;
    u_xlat2_.y = _e238.y;
    u_xlat2_.z = _e238.z;
    let _e245 = u_xlat1_;
    let _e250 = _f_buffer0_.f_cb0_[5];
    u_xlat19_ = dot(_e245.xyz, _e250.xyz);
    let _e253 = u_xlat19_;
    u_xlat19_ = clamp(_e253, 0f, 1f);
    let _e260 = _f_buffer0_.f_cb0_[10];
    let _e265 = _f_buffer2_.f_cb2_[11];
    u_xlat20_ = min(_e260.x, _e265.y);
    let _e268 = u_xlat20_;
    u_xlatu20_ = u32(i32(_e268));
    u_xlat3_.x = 0f;
    u_xlat3_.y = 0f;
    u_xlat3_.z = 0f;
    loop {
        let _e283 = u_xlatu_loop_1_;
        let _e284 = u_xlatu20_;
        if !((_e283 < _e284)) {
            break;
        }
        {
            let _e290 = u_xlatu_loop_1_;
            u_xlatu4_ = (_e290 >> 2u);
            let _e293 = u_xlatu_loop_1_;
            u_xlati10_ = i32((_e293 & 3u));
            let _e297 = u_xlatu4_;
            let _e303 = _f_buffer2_.f_cb2_[(i32(_e297) + 12i)];
            let _e304 = u_xlati10_;
            let _e308 = local_1[_e304];
            u_xlat4_ = dot(_e303, bitcast<vec4<f32>>(_e308));
            let _e311 = u_xlat4_;
            u_xlati4_ = i32(_e311);
            let _e313 = u_xlat10_;
            let _e315 = vs_TEXCOORD1_1;
            let _e318 = u_xlati4_;
            let _e321 = _f_buffer1_.f_cb1_[_e318];
            let _e324 = u_xlati4_;
            let _e327 = _f_buffer1_.f_cb1_[_e324];
            let _e329 = ((-(_e315.xyz) * _e321.www) + _e327.xyz);
            u_xlat10_.x = _e329.x;
            u_xlat10_.y = _e329.y;
            u_xlat10_.z = _e329.z;
            let _e337 = u_xlat10_;
            let _e339 = u_xlat10_;
            u_xlat5_.x = dot(_e337.xyz, _e339.xyz);
            let _e343 = u_xlat5_;
            u_xlat5_.x = max(_e343.x, 0.000061035156f);
            let _e347 = u_xlat5_;
            u_xlat11_ = inverseSqrt(_e347.x);
            let _e350 = u_xlat10_;
            let _e352 = u_xlat10_;
            let _e354 = u_xlat11_;
            let _e356 = (_e352.xyz * vec3(_e354));
            u_xlat10_.x = _e356.x;
            u_xlat10_.y = _e356.y;
            u_xlat10_.z = _e356.z;
            let _e365 = u_xlati4_;
            let _e370 = _f_buffer1_.f_cb1_[(_e365 + 512i)];
            u_xlat11_ = (1f / _e370.x);
            let _e374 = u_xlat5_;
            u_xlat5_.x = (_e374.x * 25f);
            let _e379 = u_xlat5_;
            let _e381 = u_xlat11_;
            u_xlat5_.x = (_e379.x / _e381);
            let _e384 = u_xlat5_;
            u_xlat5_.x = (_e384.x + 1f);
            let _e391 = u_xlat5_;
            u_xlat5_.x = (1f / _e391.x);
            let _e394 = u_xlati4_;
            let _e399 = _f_buffer1_.f_cb1_[(_e394 + 768i)];
            let _e401 = u_xlat10_;
            u_xlat11_ = dot(_e399.xyz, _e401.xyz);
            let _e404 = u_xlat11_;
            let _e405 = u_xlati4_;
            let _e410 = _f_buffer1_.f_cb1_[(_e405 + 512i)];
            let _e413 = u_xlati4_;
            let _e418 = _f_buffer1_.f_cb1_[(_e413 + 512i)];
            u_xlat11_ = ((_e404 * _e410.z) + _e418.w);
            let _e421 = u_xlat11_;
            u_xlat11_ = clamp(_e421, 0f, 1f);
            let _e425 = u_xlat11_;
            let _e426 = u_xlat11_;
            u_xlat11_ = (_e425 * _e426);
            let _e429 = u_xlat11_;
            let _e430 = u_xlat5_;
            u_xlat5_.x = (_e429 * _e430.x);
            let _e433 = u_xlat5_;
            let _e435 = u_xlat5_;
            let _e437 = u_xlati4_;
            let _e442 = _f_buffer1_.f_cb1_[(_e437 + 256i)];
            let _e444 = (_e435.xxx * _e442.xyz);
            u_xlat5_.x = _e444.x;
            u_xlat5_.y = _e444.y;
            u_xlat5_.z = _e444.z;
            let _e451 = u_xlat1_;
            let _e453 = u_xlat10_;
            u_xlat4_ = dot(_e451.xyz, _e453.xyz);
            let _e456 = u_xlat4_;
            u_xlat4_ = clamp(_e456, 0f, 1f);
            let _e460 = u_xlat3_;
            let _e462 = u_xlat5_;
            let _e464 = u_xlat4_;
            let _e467 = u_xlat3_;
            let _e469 = ((_e462.xyz * vec3(_e464)) + _e467.xyz);
            u_xlat3_.x = _e469.x;
            u_xlat3_.y = _e469.y;
            u_xlat3_.z = _e469.z;
        }
        continuing {
            let _e287 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e287 + 1u);
        }
    }
    let _e476 = u_xlat1_;
    let _e478 = u_xlat2_;
    let _e480 = u_xlat19_;
    let _e483 = u_xlat3_;
    let _e485 = ((_e478.xyz * vec3(_e480)) + _e483.xyz);
    u_xlat1_.x = _e485.x;
    u_xlat1_.y = _e485.y;
    u_xlat1_.z = _e485.z;
    let _e496 = _f_buffer2_.f_cb2_[27];
    u_xlat2_.x = abs(_e496.w);
    let _e503 = _f_buffer2_.f_cb2_[28];
    u_xlat2_.y = abs(_e503.w);
    let _e510 = _f_buffer2_.f_cb2_[29];
    u_xlat2_.z = abs(_e510.w);
    let _e513 = u_xlat2_;
    let _e515 = u_xlat2_;
    let _e517 = log2(_e515.xyz);
    u_xlat2_.x = _e517.x;
    u_xlat2_.y = _e517.y;
    u_xlat2_.z = _e517.z;
    let _e524 = u_xlat2_;
    let _e526 = u_xlat2_;
    let _e532 = (_e526.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat2_.x = _e532.x;
    u_xlat2_.y = _e532.y;
    u_xlat2_.z = _e532.z;
    let _e539 = u_xlat2_;
    let _e541 = u_xlat2_;
    let _e543 = exp2(_e541.xyz);
    u_xlat2_.x = _e543.x;
    u_xlat2_.y = _e543.y;
    u_xlat2_.z = _e543.z;
    let _e550 = u_xlat2_;
    let _e552 = u_xlat2_;
    let _e566 = ((_e552.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat2_.x = _e566.x;
    u_xlat2_.y = _e566.y;
    u_xlat2_.z = _e566.z;
    let _e573 = u_xlat2_;
    let _e575 = u_xlat2_;
    let _e581 = clamp(_e575.xyz, vec3(0f), vec3(1f));
    u_xlat2_.x = _e581.x;
    u_xlat2_.y = _e581.y;
    u_xlat2_.z = _e581.z;
    let _e588 = u_xlat1_;
    let _e590 = u_xlat1_;
    let _e592 = u_xlat2_;
    let _e594 = (_e590.xyz + _e592.xyz);
    u_xlat1_.x = _e594.x;
    u_xlat1_.y = _e594.y;
    u_xlat1_.z = _e594.z;
    let _e601 = SV_TARGET0_;
    let _e603 = u_xlat0_;
    let _e605 = u_xlat1_;
    let _e607 = (_e603.xyz * _e605.xyz);
    SV_TARGET0_.x = _e607.x;
    SV_TARGET0_.y = _e607.y;
    SV_TARGET0_.z = _e607.z;
    let _e615 = u_xlat18_;
    SV_TARGET0_.w = _e615;
    return;
}

@fragment 
fn main(@location(12) vs_NORMAL0_: vec3<f32>, @location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec3<f32>, @location(3) vs_TEXCOORDindex3_: vec4<f32>) -> FragmentOutput {
    vs_NORMAL0_1 = vs_NORMAL0_;
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_TEXCOORDindex3_1 = vs_TEXCOORDindex3_;
    main_1();
    let _e47 = SV_TARGET0_;
    return FragmentOutput(_e47);
}
