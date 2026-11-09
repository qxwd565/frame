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
    f_cb4_: array<vec4<f32>, 4>,
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
var<private> vs_TEXCOORD5_1: vec2<f32>;
var<private> vs_TEXCOORD1_1: vec3<f32>;
var<private> vs_TEXCOORDindex3_1: vec4<f32>;
var<private> vs_NORMAL0_1: vec3<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlatb1_: bool = false;
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlatb2_: bool = false;
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: f32 = 0f;
    var u_xlati4_: i32 = 0i;
    var u_xlatu4_: u32 = 0u;
    var u_xlatb4_: bool = false;
    var u_xlat5_: vec3<f32> = vec3(0f);
    var u_xlat7_: f32 = 0f;
    var u_xlatb8_: bool = false;
    var u_xlat10_: vec3<f32> = vec3(0f);
    var u_xlati10_: i32 = 0i;
    var u_xlat11_: f32 = 0f;
    var u_xlat19_: f32 = 0f;
    var u_xlat20_: f32 = 0f;
    var u_xlatu20_: u32 = 0u;
    var u_xlatu21_: u32 = 0u;
    var local: f32;
    var txVec0_: vec3<f32>;
    var local_1: f32;
    var u_xlatu_loop_1_: u32 = 0u;
    var local_2: array<vec4<u32>, 4> = ImmCB_0_;

    let _e97 = vs_TEXCOORD0_1;
    let _e102 = _f_buffer0_.f_cb0_[4];
    let _e107 = hscard_bias.values[1];
    let _e110 = textureSampleBias(f_t1_, samplerf_s1_, _e97.xy, (_e102.x + _e107.x));
    u_xlat0_ = _e110;
    let _e112 = vs_TEXCOORD0_1;
    let _e114 = dpdx(_e112.x);
    u_xlat1_.x = _e114;
    let _e115 = vs_TEXCOORD0_1;
    let _e117 = dpdy(_e115.x);
    u_xlat7_ = _e117;
    let _e119 = u_xlat7_;
    let _e121 = u_xlat1_;
    u_xlat1_.x = (abs(_e119) + abs(_e121.x));
    let _e125 = u_xlat1_;
    let _e135 = vs_TEXCOORD0_1;
    u_xlat1_ = ((_e125.xxxx * vec4<f32>(-0.5f, -0.5f, 0.5f, 0.5f)) + _e135.xyxy);
    let _e138 = u_xlat1_;
    let _e143 = _f_buffer0_.f_cb0_[4];
    let _e148 = hscard_bias.values[1];
    let _e151 = textureSampleBias(f_t1_, samplerf_s1_, _e138.xy, (_e143.x + _e148.x));
    u_xlat2_ = _e151;
    let _e152 = u_xlat0_;
    let _e153 = u_xlat2_;
    u_xlat0_ = (_e152 + _e153);
    let _e155 = u_xlat1_;
    let _e160 = _f_buffer0_.f_cb0_[4];
    let _e165 = hscard_bias.values[1];
    let _e168 = textureSampleBias(f_t1_, samplerf_s1_, _e155.zw, (_e160.x + _e165.x));
    u_xlat1_ = _e168;
    let _e169 = u_xlat0_;
    let _e170 = u_xlat1_;
    u_xlat0_ = (_e169 + _e170);
    let _e172 = u_xlat0_;
    u_xlat0_ = (_e172 * vec4<f32>(0.33333334f, 0.33333334f, 0.33333334f, 0.33333334f));
    let _e183 = _f_buffer4_.f_cb4_[1];
    u_xlatb1_ = (0f < _e183.x);
    let _e186 = u_xlatb1_;
    if _e186 {
        {
            let _e187 = vs_TEXCOORD5_1;
            let _e192 = _f_buffer0_.f_cb0_[4];
            let _e197 = hscard_bias.values[2];
            let _e200 = textureSampleBias(f_t2_, samplerf_s2_, _e187.xy, (_e192.x + _e197.x));
            u_xlat1_ = _e200;
            let _e204 = _f_buffer4_.f_cb4_[3];
            let _e206 = u_xlat1_;
            u_xlatb1_ = (_e204.x < _e206.x);
            let _e210 = u_xlatb1_;
            if _e210 {
                local = 1f;
            } else {
                local = 0f;
            }
            let _e215 = local;
            u_xlat1_.x = _e215;
            let _e217 = u_xlat0_;
            let _e219 = u_xlat1_;
            u_xlat0_.w = (_e217.w * _e219.x);
        }
    }
    let _e223 = vs_NORMAL0_1;
    let _e225 = vs_NORMAL0_1;
    u_xlat1_.x = dot(_e223.xyz, _e225.xyz);
    let _e229 = u_xlat1_;
    u_xlat1_.x = inverseSqrt(_e229.x);
    let _e232 = u_xlat1_;
    let _e234 = u_xlat1_;
    let _e236 = vs_NORMAL0_1;
    let _e238 = (_e234.xxx * _e236.xyz);
    u_xlat1_.x = _e238.x;
    u_xlat1_.y = _e238.y;
    u_xlat1_.z = _e238.z;
    let _e245 = vs_TEXCOORDindex3_1;
    let _e246 = _e245.xy;
    let _e247 = vs_TEXCOORDindex3_1;
    txVec0_ = vec3<f32>(_e246.x, _e246.y, _e247.z);
    let _e253 = txVec0_;
    let _e257 = textureSampleCompareLevel(f_t0_, samplerf_s0_, _e253.xy, _e253.z);
    u_xlat19_ = _e257;
    let _e262 = _f_buffer3_.f_cb3_[27];
    u_xlat2_.x = (-(_e262.x) + 1f);
    let _e267 = u_xlat19_;
    let _e271 = _f_buffer3_.f_cb3_[27];
    let _e274 = u_xlat2_;
    u_xlat19_ = ((_e267 * _e271.x) + _e274.x);
    let _e278 = vs_TEXCOORDindex3_1;
    u_xlatb2_ = (0f >= _e278.z);
    let _e281 = vs_TEXCOORDindex3_1;
    u_xlatb8_ = (_e281.z >= 1f);
    let _e285 = u_xlatb8_;
    let _e286 = u_xlatb2_;
    u_xlatb2_ = (_e285 || _e286);
    let _e288 = u_xlatb2_;
    if _e288 {
        local_1 = 1f;
    } else {
        let _e290 = u_xlat19_;
        local_1 = _e290;
    }
    let _e292 = local_1;
    u_xlat19_ = _e292;
    let _e293 = u_xlat19_;
    let _e297 = _f_buffer2_.f_cb2_[11];
    u_xlat19_ = (_e293 * _e297.z);
    let _e300 = u_xlat2_;
    let _e302 = u_xlat19_;
    let _e307 = _f_buffer0_.f_cb0_[6];
    let _e309 = (vec3(_e302) * _e307.xyz);
    u_xlat2_.x = _e309.x;
    u_xlat2_.y = _e309.y;
    u_xlat2_.z = _e309.z;
    let _e316 = u_xlat1_;
    let _e321 = _f_buffer0_.f_cb0_[5];
    u_xlat19_ = dot(_e316.xyz, _e321.xyz);
    let _e324 = u_xlat19_;
    u_xlat19_ = clamp(_e324, 0f, 1f);
    let _e331 = _f_buffer0_.f_cb0_[10];
    let _e336 = _f_buffer2_.f_cb2_[11];
    u_xlat20_ = min(_e331.x, _e336.y);
    let _e339 = u_xlat20_;
    u_xlatu20_ = u32(i32(_e339));
    u_xlat3_.x = 0f;
    u_xlat3_.y = 0f;
    u_xlat3_.z = 0f;
    loop {
        let _e354 = u_xlatu_loop_1_;
        let _e355 = u_xlatu20_;
        if !((_e354 < _e355)) {
            break;
        }
        {
            let _e361 = u_xlatu_loop_1_;
            u_xlatu4_ = (_e361 >> 2u);
            let _e364 = u_xlatu_loop_1_;
            u_xlati10_ = i32((_e364 & 3u));
            let _e368 = u_xlatu4_;
            let _e374 = _f_buffer2_.f_cb2_[(i32(_e368) + 12i)];
            let _e375 = u_xlati10_;
            let _e379 = local_2[_e375];
            u_xlat4_ = dot(_e374, bitcast<vec4<f32>>(_e379));
            let _e382 = u_xlat4_;
            u_xlati4_ = i32(_e382);
            let _e384 = u_xlat10_;
            let _e386 = vs_TEXCOORD1_1;
            let _e389 = u_xlati4_;
            let _e392 = _f_buffer1_.f_cb1_[_e389];
            let _e395 = u_xlati4_;
            let _e398 = _f_buffer1_.f_cb1_[_e395];
            let _e400 = ((-(_e386.xyz) * _e392.www) + _e398.xyz);
            u_xlat10_.x = _e400.x;
            u_xlat10_.y = _e400.y;
            u_xlat10_.z = _e400.z;
            let _e408 = u_xlat10_;
            let _e410 = u_xlat10_;
            u_xlat5_.x = dot(_e408.xyz, _e410.xyz);
            let _e414 = u_xlat5_;
            u_xlat5_.x = max(_e414.x, 0.000061035156f);
            let _e418 = u_xlat5_;
            u_xlat11_ = inverseSqrt(_e418.x);
            let _e421 = u_xlat10_;
            let _e423 = u_xlat10_;
            let _e425 = u_xlat11_;
            let _e427 = (_e423.xyz * vec3(_e425));
            u_xlat10_.x = _e427.x;
            u_xlat10_.y = _e427.y;
            u_xlat10_.z = _e427.z;
            let _e436 = u_xlati4_;
            let _e441 = _f_buffer1_.f_cb1_[(_e436 + 512i)];
            u_xlat11_ = (1f / _e441.x);
            let _e445 = u_xlat5_;
            u_xlat5_.x = (_e445.x * 25f);
            let _e450 = u_xlat5_;
            let _e452 = u_xlat11_;
            u_xlat5_.x = (_e450.x / _e452);
            let _e455 = u_xlat5_;
            u_xlat5_.x = (_e455.x + 1f);
            let _e462 = u_xlat5_;
            u_xlat5_.x = (1f / _e462.x);
            let _e465 = u_xlati4_;
            let _e470 = _f_buffer1_.f_cb1_[(_e465 + 768i)];
            let _e472 = u_xlat10_;
            u_xlat11_ = dot(_e470.xyz, _e472.xyz);
            let _e475 = u_xlat11_;
            let _e476 = u_xlati4_;
            let _e481 = _f_buffer1_.f_cb1_[(_e476 + 512i)];
            let _e484 = u_xlati4_;
            let _e489 = _f_buffer1_.f_cb1_[(_e484 + 512i)];
            u_xlat11_ = ((_e475 * _e481.z) + _e489.w);
            let _e492 = u_xlat11_;
            u_xlat11_ = clamp(_e492, 0f, 1f);
            let _e496 = u_xlat11_;
            let _e497 = u_xlat11_;
            u_xlat11_ = (_e496 * _e497);
            let _e500 = u_xlat11_;
            let _e501 = u_xlat5_;
            u_xlat5_.x = (_e500 * _e501.x);
            let _e504 = u_xlat5_;
            let _e506 = u_xlat5_;
            let _e508 = u_xlati4_;
            let _e513 = _f_buffer1_.f_cb1_[(_e508 + 256i)];
            let _e515 = (_e506.xxx * _e513.xyz);
            u_xlat5_.x = _e515.x;
            u_xlat5_.y = _e515.y;
            u_xlat5_.z = _e515.z;
            let _e522 = u_xlat1_;
            let _e524 = u_xlat10_;
            u_xlat4_ = dot(_e522.xyz, _e524.xyz);
            let _e527 = u_xlat4_;
            u_xlat4_ = clamp(_e527, 0f, 1f);
            let _e531 = u_xlat3_;
            let _e533 = u_xlat5_;
            let _e535 = u_xlat4_;
            let _e538 = u_xlat3_;
            let _e540 = ((_e533.xyz * vec3(_e535)) + _e538.xyz);
            u_xlat3_.x = _e540.x;
            u_xlat3_.y = _e540.y;
            u_xlat3_.z = _e540.z;
        }
        continuing {
            let _e358 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e358 + 1u);
        }
    }
    let _e547 = u_xlat1_;
    let _e549 = u_xlat2_;
    let _e551 = u_xlat19_;
    let _e554 = u_xlat3_;
    let _e556 = ((_e549.xyz * vec3(_e551)) + _e554.xyz);
    u_xlat1_.x = _e556.x;
    u_xlat1_.y = _e556.y;
    u_xlat1_.z = _e556.z;
    let _e567 = _f_buffer2_.f_cb2_[27];
    u_xlat2_.x = abs(_e567.w);
    let _e574 = _f_buffer2_.f_cb2_[28];
    u_xlat2_.y = abs(_e574.w);
    let _e581 = _f_buffer2_.f_cb2_[29];
    u_xlat2_.z = abs(_e581.w);
    let _e584 = u_xlat2_;
    let _e586 = u_xlat2_;
    let _e588 = log2(_e586.xyz);
    u_xlat2_.x = _e588.x;
    u_xlat2_.y = _e588.y;
    u_xlat2_.z = _e588.z;
    let _e595 = u_xlat2_;
    let _e597 = u_xlat2_;
    let _e603 = (_e597.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat2_.x = _e603.x;
    u_xlat2_.y = _e603.y;
    u_xlat2_.z = _e603.z;
    let _e610 = u_xlat2_;
    let _e612 = u_xlat2_;
    let _e614 = exp2(_e612.xyz);
    u_xlat2_.x = _e614.x;
    u_xlat2_.y = _e614.y;
    u_xlat2_.z = _e614.z;
    let _e621 = u_xlat2_;
    let _e623 = u_xlat2_;
    let _e637 = ((_e623.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat2_.x = _e637.x;
    u_xlat2_.y = _e637.y;
    u_xlat2_.z = _e637.z;
    let _e644 = u_xlat2_;
    let _e646 = u_xlat2_;
    let _e652 = clamp(_e646.xyz, vec3(0f), vec3(1f));
    u_xlat2_.x = _e652.x;
    u_xlat2_.y = _e652.y;
    u_xlat2_.z = _e652.z;
    let _e659 = u_xlat1_;
    let _e661 = u_xlat1_;
    let _e663 = u_xlat2_;
    let _e665 = (_e661.xyz + _e663.xyz);
    u_xlat1_.x = _e665.x;
    u_xlat1_.y = _e665.y;
    u_xlat1_.z = _e665.z;
    let _e672 = u_xlat1_;
    let _e674 = u_xlat0_;
    let _e676 = u_xlat1_;
    let _e678 = (_e674.xyz * _e676.xyz);
    u_xlat1_.x = _e678.x;
    u_xlat1_.y = _e678.y;
    u_xlat1_.z = _e678.z;
    let _e685 = u_xlat0_;
    let _e687 = u_xlat0_;
    let _e689 = u_xlat1_;
    let _e691 = (_e687.www * _e689.xyz);
    u_xlat0_.x = _e691.x;
    u_xlat0_.y = _e691.y;
    u_xlat0_.z = _e691.z;
    let _e698 = u_xlat0_;
    SV_Target0_ = _e698;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(5) vs_TEXCOORD5_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec3<f32>, @location(3) vs_TEXCOORDindex3_: vec4<f32>, @location(12) vs_NORMAL0_: vec3<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD5_1 = vs_TEXCOORD5_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_TEXCOORDindex3_1 = vs_TEXCOORDindex3_;
    vs_NORMAL0_1 = vs_NORMAL0_;
    main_1();
    let _e55 = SV_Target0_;
    return FragmentOutput(_e55);
}
