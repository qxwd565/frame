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
    f_cb4_: vec4<f32>,
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
var<private> vs_TEXCOORD1_1: vec2<f32>;
var<private> vs_TEXCOORD2_1: vec3<f32>;
var<private> vs_TEXCOORDindex3_1: vec4<f32>;
var<private> vs_NORMAL0_1: vec3<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
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

    let _e92 = vs_TEXCOORD0_1;
    let _e97 = _f_buffer0_.f_cb0_[4];
    let _e102 = hscard_bias.values[1];
    let _e105 = textureSampleBias(f_t1_, samplerf_s1_, _e92.xy, (_e97.x + _e102.x));
    u_xlat0_ = _e105;
    let _e106 = vs_TEXCOORD1_1;
    let _e111 = _f_buffer0_.f_cb0_[4];
    let _e116 = hscard_bias.values[2];
    let _e119 = textureSampleBias(f_t2_, samplerf_s2_, _e106.xy, (_e111.x + _e116.x));
    u_xlat1_ = _e119;
    let _e120 = u_xlat1_;
    let _e122 = vs_COLOR0_1;
    u_xlat2_ = (_e120.wwww * _e122);
    let _e124 = u_xlat0_;
    let _e126 = u_xlat1_;
    u_xlat1_ = (-(_e124) + _e126);
    let _e128 = u_xlat2_;
    let _e129 = u_xlat1_;
    let _e131 = u_xlat0_;
    u_xlat0_ = ((_e128 * _e129) + _e131);
    let _e133 = u_xlat0_;
    let _e134 = _f_buffer4_;
    u_xlat0_ = (_e133 * _e134.f_cb4_);
    let _e138 = vs_NORMAL0_1;
    let _e140 = vs_NORMAL0_1;
    u_xlat1_.x = dot(_e138.xyz, _e140.xyz);
    let _e144 = u_xlat1_;
    u_xlat1_.x = inverseSqrt(_e144.x);
    let _e147 = u_xlat1_;
    let _e149 = u_xlat1_;
    let _e151 = vs_NORMAL0_1;
    let _e153 = (_e149.xxx * _e151.xyz);
    u_xlat1_.x = _e153.x;
    u_xlat1_.y = _e153.y;
    u_xlat1_.z = _e153.z;
    let _e160 = vs_TEXCOORDindex3_1;
    let _e161 = _e160.xy;
    let _e162 = vs_TEXCOORDindex3_1;
    txVec0_ = vec3<f32>(_e161.x, _e161.y, _e162.z);
    let _e168 = txVec0_;
    let _e172 = textureSampleCompareLevel(f_t0_, samplerf_s0_, _e168.xy, _e168.z);
    u_xlat19_ = _e172;
    let _e177 = _f_buffer3_.f_cb3_[27];
    u_xlat2_.x = (-(_e177.x) + 1f);
    let _e182 = u_xlat19_;
    let _e186 = _f_buffer3_.f_cb3_[27];
    let _e189 = u_xlat2_;
    u_xlat19_ = ((_e182 * _e186.x) + _e189.x);
    let _e193 = vs_TEXCOORDindex3_1;
    u_xlatb2_ = (0f >= _e193.z);
    let _e196 = vs_TEXCOORDindex3_1;
    u_xlatb8_ = (_e196.z >= 1f);
    let _e200 = u_xlatb8_;
    let _e201 = u_xlatb2_;
    u_xlatb2_ = (_e200 || _e201);
    let _e203 = u_xlatb2_;
    if _e203 {
        local = 1f;
    } else {
        let _e205 = u_xlat19_;
        local = _e205;
    }
    let _e207 = local;
    u_xlat19_ = _e207;
    let _e208 = u_xlat19_;
    let _e212 = _f_buffer2_.f_cb2_[11];
    u_xlat19_ = (_e208 * _e212.z);
    let _e215 = u_xlat2_;
    let _e217 = u_xlat19_;
    let _e222 = _f_buffer0_.f_cb0_[6];
    let _e224 = (vec3(_e217) * _e222.xyz);
    u_xlat2_.x = _e224.x;
    u_xlat2_.y = _e224.y;
    u_xlat2_.z = _e224.z;
    let _e231 = u_xlat1_;
    let _e236 = _f_buffer0_.f_cb0_[5];
    u_xlat19_ = dot(_e231.xyz, _e236.xyz);
    let _e239 = u_xlat19_;
    u_xlat19_ = clamp(_e239, 0f, 1f);
    let _e246 = _f_buffer0_.f_cb0_[10];
    let _e251 = _f_buffer2_.f_cb2_[11];
    u_xlat20_ = min(_e246.x, _e251.y);
    let _e254 = u_xlat20_;
    u_xlatu20_ = u32(i32(_e254));
    u_xlat3_.x = 0f;
    u_xlat3_.y = 0f;
    u_xlat3_.z = 0f;
    loop {
        let _e269 = u_xlatu_loop_1_;
        let _e270 = u_xlatu20_;
        if !((_e269 < _e270)) {
            break;
        }
        {
            let _e276 = u_xlatu_loop_1_;
            u_xlatu4_ = (_e276 >> 2u);
            let _e279 = u_xlatu_loop_1_;
            u_xlati10_ = i32((_e279 & 3u));
            let _e283 = u_xlatu4_;
            let _e289 = _f_buffer2_.f_cb2_[(i32(_e283) + 12i)];
            let _e290 = u_xlati10_;
            let _e294 = local_1[_e290];
            u_xlat4_ = dot(_e289, bitcast<vec4<f32>>(_e294));
            let _e297 = u_xlat4_;
            u_xlati4_ = i32(_e297);
            let _e299 = u_xlat10_;
            let _e301 = vs_TEXCOORD2_1;
            let _e304 = u_xlati4_;
            let _e307 = _f_buffer1_.f_cb1_[_e304];
            let _e310 = u_xlati4_;
            let _e313 = _f_buffer1_.f_cb1_[_e310];
            let _e315 = ((-(_e301.xyz) * _e307.www) + _e313.xyz);
            u_xlat10_.x = _e315.x;
            u_xlat10_.y = _e315.y;
            u_xlat10_.z = _e315.z;
            let _e323 = u_xlat10_;
            let _e325 = u_xlat10_;
            u_xlat5_.x = dot(_e323.xyz, _e325.xyz);
            let _e329 = u_xlat5_;
            u_xlat5_.x = max(_e329.x, 0.000061035156f);
            let _e333 = u_xlat5_;
            u_xlat11_ = inverseSqrt(_e333.x);
            let _e336 = u_xlat10_;
            let _e338 = u_xlat10_;
            let _e340 = u_xlat11_;
            let _e342 = (_e338.xyz * vec3(_e340));
            u_xlat10_.x = _e342.x;
            u_xlat10_.y = _e342.y;
            u_xlat10_.z = _e342.z;
            let _e351 = u_xlati4_;
            let _e356 = _f_buffer1_.f_cb1_[(_e351 + 512i)];
            u_xlat11_ = (1f / _e356.x);
            let _e360 = u_xlat5_;
            u_xlat5_.x = (_e360.x * 25f);
            let _e365 = u_xlat5_;
            let _e367 = u_xlat11_;
            u_xlat5_.x = (_e365.x / _e367);
            let _e370 = u_xlat5_;
            u_xlat5_.x = (_e370.x + 1f);
            let _e377 = u_xlat5_;
            u_xlat5_.x = (1f / _e377.x);
            let _e380 = u_xlati4_;
            let _e385 = _f_buffer1_.f_cb1_[(_e380 + 768i)];
            let _e387 = u_xlat10_;
            u_xlat11_ = dot(_e385.xyz, _e387.xyz);
            let _e390 = u_xlat11_;
            let _e391 = u_xlati4_;
            let _e396 = _f_buffer1_.f_cb1_[(_e391 + 512i)];
            let _e399 = u_xlati4_;
            let _e404 = _f_buffer1_.f_cb1_[(_e399 + 512i)];
            u_xlat11_ = ((_e390 * _e396.z) + _e404.w);
            let _e407 = u_xlat11_;
            u_xlat11_ = clamp(_e407, 0f, 1f);
            let _e411 = u_xlat11_;
            let _e412 = u_xlat11_;
            u_xlat11_ = (_e411 * _e412);
            let _e415 = u_xlat11_;
            let _e416 = u_xlat5_;
            u_xlat5_.x = (_e415 * _e416.x);
            let _e419 = u_xlat5_;
            let _e421 = u_xlat5_;
            let _e423 = u_xlati4_;
            let _e428 = _f_buffer1_.f_cb1_[(_e423 + 256i)];
            let _e430 = (_e421.xxx * _e428.xyz);
            u_xlat5_.x = _e430.x;
            u_xlat5_.y = _e430.y;
            u_xlat5_.z = _e430.z;
            let _e437 = u_xlat1_;
            let _e439 = u_xlat10_;
            u_xlat4_ = dot(_e437.xyz, _e439.xyz);
            let _e442 = u_xlat4_;
            u_xlat4_ = clamp(_e442, 0f, 1f);
            let _e446 = u_xlat3_;
            let _e448 = u_xlat5_;
            let _e450 = u_xlat4_;
            let _e453 = u_xlat3_;
            let _e455 = ((_e448.xyz * vec3(_e450)) + _e453.xyz);
            u_xlat3_.x = _e455.x;
            u_xlat3_.y = _e455.y;
            u_xlat3_.z = _e455.z;
        }
        continuing {
            let _e273 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e273 + 1u);
        }
    }
    let _e462 = u_xlat1_;
    let _e464 = u_xlat2_;
    let _e466 = u_xlat19_;
    let _e469 = u_xlat3_;
    let _e471 = ((_e464.xyz * vec3(_e466)) + _e469.xyz);
    u_xlat1_.x = _e471.x;
    u_xlat1_.y = _e471.y;
    u_xlat1_.z = _e471.z;
    let _e482 = _f_buffer2_.f_cb2_[27];
    u_xlat2_.x = abs(_e482.w);
    let _e489 = _f_buffer2_.f_cb2_[28];
    u_xlat2_.y = abs(_e489.w);
    let _e496 = _f_buffer2_.f_cb2_[29];
    u_xlat2_.z = abs(_e496.w);
    let _e499 = u_xlat2_;
    let _e501 = u_xlat2_;
    let _e503 = log2(_e501.xyz);
    u_xlat2_.x = _e503.x;
    u_xlat2_.y = _e503.y;
    u_xlat2_.z = _e503.z;
    let _e510 = u_xlat2_;
    let _e512 = u_xlat2_;
    let _e518 = (_e512.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat2_.x = _e518.x;
    u_xlat2_.y = _e518.y;
    u_xlat2_.z = _e518.z;
    let _e525 = u_xlat2_;
    let _e527 = u_xlat2_;
    let _e529 = exp2(_e527.xyz);
    u_xlat2_.x = _e529.x;
    u_xlat2_.y = _e529.y;
    u_xlat2_.z = _e529.z;
    let _e536 = u_xlat2_;
    let _e538 = u_xlat2_;
    let _e552 = ((_e538.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat2_.x = _e552.x;
    u_xlat2_.y = _e552.y;
    u_xlat2_.z = _e552.z;
    let _e559 = u_xlat2_;
    let _e561 = u_xlat2_;
    let _e567 = clamp(_e561.xyz, vec3(0f), vec3(1f));
    u_xlat2_.x = _e567.x;
    u_xlat2_.y = _e567.y;
    u_xlat2_.z = _e567.z;
    let _e574 = u_xlat1_;
    let _e576 = u_xlat1_;
    let _e578 = u_xlat2_;
    let _e580 = (_e576.xyz + _e578.xyz);
    u_xlat1_.x = _e580.x;
    u_xlat1_.y = _e580.y;
    u_xlat1_.z = _e580.z;
    let _e587 = SV_Target0_;
    let _e589 = u_xlat0_;
    let _e591 = u_xlat1_;
    let _e593 = (_e589.xyz * _e591.xyz);
    SV_Target0_.x = _e593.x;
    SV_Target0_.y = _e593.y;
    SV_Target0_.z = _e593.z;
    let _e601 = u_xlat0_;
    SV_Target0_.w = _e601.w;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec2<f32>, @location(2) vs_TEXCOORD2_: vec3<f32>, @location(3) vs_TEXCOORDindex3_: vec4<f32>, @location(12) vs_NORMAL0_: vec3<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_TEXCOORD2_1 = vs_TEXCOORD2_;
    vs_TEXCOORDindex3_1 = vs_TEXCOORDindex3_;
    vs_NORMAL0_1 = vs_NORMAL0_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e59 = SV_Target0_;
    return FragmentOutput(_e59);
}
