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
    f_cb4_: array<vec4<f32>, 3>,
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
@group(1) @binding(4) 
var<uniform> _f_buffer4_: f_buffer4_;
@group(3) @binding(1) 
var samplerf_s0_: sampler_comparison;
@group(3) @binding(3) 
var samplerf_s1_: sampler;
@group(3) @binding(5) 
var samplerf_s2_: sampler;
@group(3) @binding(0) 
var f_t0_: texture_depth_2d;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
@group(3) @binding(4) 
var f_t2_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD1_1: vec3<f32>;
var<private> vs_TEXCOORDindex3_1: vec4<f32>;
var<private> vs_TEXCOORD4_1: vec4<f32>;
var<private> vs_NORMAL0_1: vec3<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec3<f32> = vec3(0f);
    var u_xlatb2_: bool = false;
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: f32 = 0f;
    var u_xlati4_: i32 = 0i;
    var u_xlatu4_: u32 = 0u;
    var u_xlatb4_: bool = false;
    var u_xlat5_: vec3<f32> = vec3(0f);
    var u_xlat8_: f32 = 0f;
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

    let _e94 = vs_TEXCOORD0_1;
    let _e99 = _f_buffer0_.f_cb0_[4];
    let _e104 = hscard_bias.values[1];
    let _e107 = textureSampleBias(f_t1_, samplerf_s1_, _e94.xy, (_e99.x + _e104.x));
    u_xlat0_ = _e107;
    let _e108 = vs_TEXCOORD0_1;
    let _e113 = _f_buffer0_.f_cb0_[4];
    let _e118 = hscard_bias.values[2];
    let _e121 = textureSampleBias(f_t2_, samplerf_s2_, _e108.xy, (_e113.x + _e118.x));
    u_xlat1_ = _e121;
    let _e123 = vs_TEXCOORD4_1;
    let _e128 = _f_buffer4_.f_cb4_[2];
    u_xlat2_.x = (_e123.z + _e128.x);
    let _e132 = u_xlat2_;
    let _e137 = _f_buffer4_.f_cb4_[2];
    u_xlat2_.x = (_e132.x + _e137.y);
    let _e143 = _f_buffer4_.f_cb4_[2];
    let _e148 = _f_buffer4_.f_cb4_[2];
    u_xlat8_ = (_e143.y + _e148.y);
    let _e152 = u_xlat2_;
    let _e154 = u_xlat8_;
    u_xlat2_.x = (_e152.x / _e154);
    let _e157 = u_xlat2_;
    u_xlat2_.x = clamp(_e157.x, 0f, 1f);
    let _e162 = u_xlat2_;
    u_xlat8_ = (-(_e162.x) + 1f);
    let _e167 = u_xlat1_;
    let _e168 = u_xlat2_;
    u_xlat1_ = (_e167 * _e168.xxxx);
    let _e171 = u_xlat0_;
    let _e172 = u_xlat8_;
    let _e175 = u_xlat1_;
    u_xlat0_ = ((_e171 * vec4(_e172)) + _e175);
    let _e178 = vs_NORMAL0_1;
    let _e180 = vs_NORMAL0_1;
    u_xlat1_.x = dot(_e178.xyz, _e180.xyz);
    let _e184 = u_xlat1_;
    u_xlat1_.x = inverseSqrt(_e184.x);
    let _e187 = u_xlat1_;
    let _e189 = u_xlat1_;
    let _e191 = vs_NORMAL0_1;
    let _e193 = (_e189.xxx * _e191.xyz);
    u_xlat1_.x = _e193.x;
    u_xlat1_.y = _e193.y;
    u_xlat1_.z = _e193.z;
    let _e200 = vs_TEXCOORDindex3_1;
    let _e201 = _e200.xy;
    let _e202 = vs_TEXCOORDindex3_1;
    txVec0_ = vec3<f32>(_e201.x, _e201.y, _e202.z);
    let _e208 = txVec0_;
    let _e212 = textureSampleCompareLevel(f_t0_, samplerf_s0_, _e208.xy, _e208.z);
    u_xlat19_ = _e212;
    let _e217 = _f_buffer3_.f_cb3_[27];
    u_xlat2_.x = (-(_e217.x) + 1f);
    let _e222 = u_xlat19_;
    let _e226 = _f_buffer3_.f_cb3_[27];
    let _e229 = u_xlat2_;
    u_xlat19_ = ((_e222 * _e226.x) + _e229.x);
    let _e233 = vs_TEXCOORDindex3_1;
    u_xlatb2_ = (0f >= _e233.z);
    let _e236 = vs_TEXCOORDindex3_1;
    u_xlatb8_ = (_e236.z >= 1f);
    let _e240 = u_xlatb8_;
    let _e241 = u_xlatb2_;
    u_xlatb2_ = (_e240 || _e241);
    let _e243 = u_xlatb2_;
    if _e243 {
        local = 1f;
    } else {
        let _e245 = u_xlat19_;
        local = _e245;
    }
    let _e247 = local;
    u_xlat19_ = _e247;
    let _e248 = u_xlat19_;
    let _e252 = _f_buffer2_.f_cb2_[11];
    u_xlat19_ = (_e248 * _e252.z);
    let _e255 = u_xlat2_;
    let _e257 = u_xlat19_;
    let _e262 = _f_buffer0_.f_cb0_[6];
    let _e264 = (vec3(_e257) * _e262.xyz);
    u_xlat2_.x = _e264.x;
    u_xlat2_.y = _e264.y;
    u_xlat2_.z = _e264.z;
    let _e271 = u_xlat1_;
    let _e276 = _f_buffer0_.f_cb0_[5];
    u_xlat19_ = dot(_e271.xyz, _e276.xyz);
    let _e279 = u_xlat19_;
    u_xlat19_ = clamp(_e279, 0f, 1f);
    let _e286 = _f_buffer0_.f_cb0_[10];
    let _e291 = _f_buffer2_.f_cb2_[11];
    u_xlat20_ = min(_e286.x, _e291.y);
    let _e294 = u_xlat20_;
    u_xlatu20_ = u32(i32(_e294));
    u_xlat3_.x = 0f;
    u_xlat3_.y = 0f;
    u_xlat3_.z = 0f;
    loop {
        let _e309 = u_xlatu_loop_1_;
        let _e310 = u_xlatu20_;
        if !((_e309 < _e310)) {
            break;
        }
        {
            let _e316 = u_xlatu_loop_1_;
            u_xlatu4_ = (_e316 >> 2u);
            let _e319 = u_xlatu_loop_1_;
            u_xlati10_ = i32((_e319 & 3u));
            let _e323 = u_xlatu4_;
            let _e329 = _f_buffer2_.f_cb2_[(i32(_e323) + 12i)];
            let _e330 = u_xlati10_;
            let _e334 = local_1[_e330];
            u_xlat4_ = dot(_e329, bitcast<vec4<f32>>(_e334));
            let _e337 = u_xlat4_;
            u_xlati4_ = i32(_e337);
            let _e339 = u_xlat10_;
            let _e341 = vs_TEXCOORD1_1;
            let _e344 = u_xlati4_;
            let _e347 = _f_buffer1_.f_cb1_[_e344];
            let _e350 = u_xlati4_;
            let _e353 = _f_buffer1_.f_cb1_[_e350];
            let _e355 = ((-(_e341.xyz) * _e347.www) + _e353.xyz);
            u_xlat10_.x = _e355.x;
            u_xlat10_.y = _e355.y;
            u_xlat10_.z = _e355.z;
            let _e363 = u_xlat10_;
            let _e365 = u_xlat10_;
            u_xlat5_.x = dot(_e363.xyz, _e365.xyz);
            let _e369 = u_xlat5_;
            u_xlat5_.x = max(_e369.x, 0.000061035156f);
            let _e373 = u_xlat5_;
            u_xlat11_ = inverseSqrt(_e373.x);
            let _e376 = u_xlat10_;
            let _e378 = u_xlat10_;
            let _e380 = u_xlat11_;
            let _e382 = (_e378.xyz * vec3(_e380));
            u_xlat10_.x = _e382.x;
            u_xlat10_.y = _e382.y;
            u_xlat10_.z = _e382.z;
            let _e391 = u_xlati4_;
            let _e396 = _f_buffer1_.f_cb1_[(_e391 + 512i)];
            u_xlat11_ = (1f / _e396.x);
            let _e400 = u_xlat5_;
            u_xlat5_.x = (_e400.x * 25f);
            let _e405 = u_xlat5_;
            let _e407 = u_xlat11_;
            u_xlat5_.x = (_e405.x / _e407);
            let _e410 = u_xlat5_;
            u_xlat5_.x = (_e410.x + 1f);
            let _e417 = u_xlat5_;
            u_xlat5_.x = (1f / _e417.x);
            let _e420 = u_xlati4_;
            let _e425 = _f_buffer1_.f_cb1_[(_e420 + 768i)];
            let _e427 = u_xlat10_;
            u_xlat11_ = dot(_e425.xyz, _e427.xyz);
            let _e430 = u_xlat11_;
            let _e431 = u_xlati4_;
            let _e436 = _f_buffer1_.f_cb1_[(_e431 + 512i)];
            let _e439 = u_xlati4_;
            let _e444 = _f_buffer1_.f_cb1_[(_e439 + 512i)];
            u_xlat11_ = ((_e430 * _e436.z) + _e444.w);
            let _e447 = u_xlat11_;
            u_xlat11_ = clamp(_e447, 0f, 1f);
            let _e451 = u_xlat11_;
            let _e452 = u_xlat11_;
            u_xlat11_ = (_e451 * _e452);
            let _e455 = u_xlat11_;
            let _e456 = u_xlat5_;
            u_xlat5_.x = (_e455 * _e456.x);
            let _e459 = u_xlat5_;
            let _e461 = u_xlat5_;
            let _e463 = u_xlati4_;
            let _e468 = _f_buffer1_.f_cb1_[(_e463 + 256i)];
            let _e470 = (_e461.xxx * _e468.xyz);
            u_xlat5_.x = _e470.x;
            u_xlat5_.y = _e470.y;
            u_xlat5_.z = _e470.z;
            let _e477 = u_xlat1_;
            let _e479 = u_xlat10_;
            u_xlat4_ = dot(_e477.xyz, _e479.xyz);
            let _e482 = u_xlat4_;
            u_xlat4_ = clamp(_e482, 0f, 1f);
            let _e486 = u_xlat3_;
            let _e488 = u_xlat5_;
            let _e490 = u_xlat4_;
            let _e493 = u_xlat3_;
            let _e495 = ((_e488.xyz * vec3(_e490)) + _e493.xyz);
            u_xlat3_.x = _e495.x;
            u_xlat3_.y = _e495.y;
            u_xlat3_.z = _e495.z;
        }
        continuing {
            let _e313 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e313 + 1u);
        }
    }
    let _e502 = u_xlat1_;
    let _e504 = u_xlat2_;
    let _e506 = u_xlat19_;
    let _e509 = u_xlat3_;
    let _e511 = ((_e504.xyz * vec3(_e506)) + _e509.xyz);
    u_xlat1_.x = _e511.x;
    u_xlat1_.y = _e511.y;
    u_xlat1_.z = _e511.z;
    let _e522 = _f_buffer2_.f_cb2_[27];
    u_xlat2_.x = abs(_e522.w);
    let _e529 = _f_buffer2_.f_cb2_[28];
    u_xlat2_.y = abs(_e529.w);
    let _e536 = _f_buffer2_.f_cb2_[29];
    u_xlat2_.z = abs(_e536.w);
    let _e539 = u_xlat2_;
    let _e541 = u_xlat2_;
    let _e543 = log2(_e541.xyz);
    u_xlat2_.x = _e543.x;
    u_xlat2_.y = _e543.y;
    u_xlat2_.z = _e543.z;
    let _e550 = u_xlat2_;
    let _e552 = u_xlat2_;
    let _e558 = (_e552.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat2_.x = _e558.x;
    u_xlat2_.y = _e558.y;
    u_xlat2_.z = _e558.z;
    let _e565 = u_xlat2_;
    let _e567 = u_xlat2_;
    let _e569 = exp2(_e567.xyz);
    u_xlat2_.x = _e569.x;
    u_xlat2_.y = _e569.y;
    u_xlat2_.z = _e569.z;
    let _e576 = u_xlat2_;
    let _e578 = u_xlat2_;
    let _e592 = ((_e578.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat2_.x = _e592.x;
    u_xlat2_.y = _e592.y;
    u_xlat2_.z = _e592.z;
    let _e599 = u_xlat2_;
    let _e601 = u_xlat2_;
    let _e607 = clamp(_e601.xyz, vec3(0f), vec3(1f));
    u_xlat2_.x = _e607.x;
    u_xlat2_.y = _e607.y;
    u_xlat2_.z = _e607.z;
    let _e614 = u_xlat1_;
    let _e616 = u_xlat1_;
    let _e618 = u_xlat2_;
    let _e620 = (_e616.xyz + _e618.xyz);
    u_xlat1_.x = _e620.x;
    u_xlat1_.y = _e620.y;
    u_xlat1_.z = _e620.z;
    let _e627 = SV_Target0_;
    let _e629 = u_xlat0_;
    let _e631 = u_xlat1_;
    let _e633 = (_e629.xyz * _e631.xyz);
    SV_Target0_.x = _e633.x;
    SV_Target0_.y = _e633.y;
    SV_Target0_.z = _e633.z;
    let _e641 = u_xlat0_;
    SV_Target0_.w = _e641.w;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec3<f32>, @location(3) vs_TEXCOORDindex3_: vec4<f32>, @location(4) vs_TEXCOORD4_: vec4<f32>, @location(12) vs_NORMAL0_: vec3<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_TEXCOORDindex3_1 = vs_TEXCOORDindex3_;
    vs_TEXCOORD4_1 = vs_TEXCOORD4_;
    vs_NORMAL0_1 = vs_NORMAL0_;
    main_1();
    let _e55 = SV_Target0_;
    return FragmentOutput(_e55);
}
