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
    f_cb2_: array<vec4<f32>, 14>,
}

struct f_buffer3_ {
    f_cb3_: array<vec4<f32>, 28>,
}

struct f_buffer4_ {
    f_cb4_: array<vec4<f32>, 5>,
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
@group(3) @binding(5) 
var samplerf_s2_: sampler;
@group(3) @binding(0) 
var f_t0_: texture_depth_2d;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
@group(3) @binding(4) 
var f_t2_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec4<f32>;
var<private> vs_TEXCOORD4_1: vec4<f32>;
var<private> vs_TEXCOORD5_1: vec3<f32>;
var<private> vs_NORMAL0_1: vec3<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_TARGET0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec3<f32> = vec3(0f);
    var u_xlat3_: f32 = 0f;
    var u_xlatu3_: u32 = 0u;
    var u_xlatb3_: bool = false;
    var u_xlatu4_: u32 = 0u;
    var u_xlat5_: vec3<f32> = vec3(0f);
    var u_xlat6_: vec3<f32> = vec3(0f);
    var u_xlat9_: vec3<f32> = vec3(0f);
    var u_xlatb9_: bool = false;
    var u_xlat10_: vec3<f32> = vec3(0f);
    var u_xlati10_: i32 = 0i;
    var u_xlatu10_: u32 = 0u;
    var u_xlatb10_: bool = false;
    var u_xlat16_: f32 = 0f;
    var u_xlati16_: i32 = 0i;
    var u_xlat20_: f32 = 0f;
    var u_xlat22_: f32 = 0f;
    var txVec0_: vec3<f32>;
    var local: f32;
    var u_xlatu_loop_1_: u32 = 0u;
    var local_1: array<vec4<u32>, 4> = ImmCB_0_;

    let _e95 = u_xlat0_;
    let _e100 = _f_buffer4_.f_cb4_[3];
    let _e105 = _f_buffer4_.f_cb4_[4];
    let _e107 = (_e100.wzy * _e105.yyy);
    u_xlat0_.x = _e107.x;
    u_xlat0_.y = _e107.y;
    u_xlat0_.z = _e107.z;
    let _e118 = _f_buffer4_.f_cb4_[4];
    let _e123 = _f_buffer4_.f_cb4_[4];
    u_xlat1_.y = (_e118.x * _e123.y);
    let _e127 = vs_TEXCOORD0_1;
    u_xlat1_.x = (_e127.x * 2f);
    let _e132 = vs_TEXCOORD0_1;
    u_xlat0_.w = (_e132.y * 2f);
    let _e136 = u_xlat0_;
    let _e138 = u_xlat0_;
    let _e140 = u_xlat1_;
    let _e142 = (_e138.xw + _e140.xy);
    u_xlat0_.x = _e142.x;
    u_xlat0_.w = _e142.y;
    let _e147 = u_xlat0_;
    let _e149 = u_xlat0_;
    let _e154 = (_e149.xw * vec2<f32>(0.5f, 0.5f));
    u_xlat0_.x = _e154.x;
    u_xlat0_.w = _e154.y;
    let _e159 = u_xlat0_;
    let _e164 = _f_buffer0_.f_cb0_[4];
    let _e169 = hscard_bias.values[1];
    let _e172 = textureSampleBias(f_t1_, samplerf_s1_, _e159.xw, (_e164.x + _e169.x));
    u_xlat1_ = _e172;
    let _e174 = u_xlat1_;
    let _e179 = _f_buffer4_.f_cb4_[3];
    u_xlat0_.x = (_e174.x * _e179.x);
    let _e182 = u_xlat2_;
    let _e184 = u_xlat0_;
    let _e189 = _f_buffer4_.f_cb4_[1];
    let _e191 = (_e184.xxx * _e189.xyz);
    u_xlat2_.x = _e191.x;
    u_xlat2_.y = _e191.y;
    u_xlat2_.z = _e191.z;
    let _e198 = u_xlat0_;
    let _e200 = vs_TEXCOORD0_1;
    let _e206 = u_xlat0_;
    let _e208 = ((_e200.zw * vec2<f32>(2f, 2f)) + _e206.yz);
    u_xlat0_.x = _e208.x;
    u_xlat0_.y = _e208.y;
    let _e213 = u_xlat0_;
    let _e215 = u_xlat0_;
    let _e220 = _f_buffer4_.f_cb4_[2];
    let _e222 = (_e215.xy * _e220.xx);
    u_xlat0_.x = _e222.x;
    u_xlat0_.y = _e222.y;
    let _e227 = u_xlat0_;
    let _e232 = _f_buffer0_.f_cb0_[4];
    let _e237 = hscard_bias.values[2];
    let _e240 = textureSampleBias(f_t2_, samplerf_s2_, _e227.xy, (_e232.x + _e237.x));
    u_xlat0_ = _e240;
    let _e242 = u_xlat0_;
    u_xlat0_.x = log2(_e242.x);
    let _e246 = u_xlat0_;
    let _e251 = _f_buffer4_.f_cb4_[2];
    u_xlat0_.x = (_e246.x * _e251.y);
    let _e255 = u_xlat0_;
    u_xlat0_.x = exp2(_e255.x);
    let _e259 = u_xlat0_;
    let _e264 = _f_buffer4_.f_cb4_[2];
    u_xlat0_.x = min(_e259.x, _e264.y);
    let _e268 = u_xlat0_;
    let _e270 = u_xlat1_;
    u_xlat0_.x = (_e268.x * _e270.x);
    let _e274 = u_xlat0_;
    let _e279 = _f_buffer4_.f_cb4_[2];
    let _e285 = _f_buffer4_.f_cb4_[2];
    u_xlat0_.x = ((_e274.x * _e279.z) + -(_e285.w));
    let _e290 = u_xlat0_;
    let _e295 = _f_buffer4_.f_cb4_[1];
    u_xlat0_.x = (_e290.x * _e295.w);
    let _e298 = u_xlat6_;
    let _e300 = u_xlat1_;
    let _e302 = u_xlat2_;
    let _e304 = (_e300.www * _e302.xyz);
    u_xlat6_.x = _e304.x;
    u_xlat6_.y = _e304.y;
    u_xlat6_.z = _e304.z;
    let _e312 = vs_NORMAL0_1;
    let _e314 = vs_NORMAL0_1;
    u_xlat1_.x = dot(_e312.xyz, _e314.xyz);
    let _e318 = u_xlat1_;
    u_xlat1_.x = inverseSqrt(_e318.x);
    let _e321 = u_xlat1_;
    let _e323 = u_xlat1_;
    let _e325 = vs_NORMAL0_1;
    let _e327 = (_e323.xxx * _e325.xyz);
    u_xlat1_.x = _e327.x;
    u_xlat1_.y = _e327.y;
    u_xlat1_.z = _e327.z;
    let _e334 = vs_TEXCOORD4_1;
    let _e335 = _e334.xy;
    let _e336 = vs_TEXCOORD4_1;
    txVec0_ = vec3<f32>(_e335.x, _e335.y, _e336.z);
    let _e342 = txVec0_;
    let _e346 = textureSampleCompareLevel(f_t0_, samplerf_s0_, _e342.xy, _e342.z);
    u_xlat20_ = _e346;
    let _e350 = _f_buffer3_.f_cb3_[27];
    u_xlat3_ = (-(_e350.x) + 1f);
    let _e355 = u_xlat20_;
    let _e359 = _f_buffer3_.f_cb3_[27];
    let _e362 = u_xlat3_;
    u_xlat20_ = ((_e355 * _e359.x) + _e362);
    let _e365 = vs_TEXCOORD4_1;
    u_xlatb3_ = (0f >= _e365.z);
    let _e368 = vs_TEXCOORD4_1;
    u_xlatb9_ = (_e368.z >= 1f);
    let _e372 = u_xlatb9_;
    let _e373 = u_xlatb3_;
    u_xlatb3_ = (_e372 || _e373);
    let _e375 = u_xlatb3_;
    if _e375 {
        local = 1f;
    } else {
        let _e377 = u_xlat20_;
        local = _e377;
    }
    let _e379 = local;
    u_xlat20_ = _e379;
    let _e380 = u_xlat20_;
    let _e384 = _f_buffer2_.f_cb2_[11];
    u_xlat20_ = (_e380 * _e384.z);
    let _e390 = _f_buffer0_.f_cb0_[10];
    let _e395 = _f_buffer2_.f_cb2_[11];
    u_xlat3_ = min(_e390.x, _e395.y);
    let _e398 = u_xlat3_;
    u_xlatu3_ = u32(i32(_e398));
    u_xlat9_.x = 0f;
    u_xlat9_.y = 0f;
    u_xlat9_.z = 0f;
    loop {
        let _e412 = u_xlatu_loop_1_;
        let _e413 = u_xlatu3_;
        if !((_e412 < _e413)) {
            break;
        }
        {
            let _e419 = u_xlatu_loop_1_;
            u_xlatu10_ = (_e419 >> 2u);
            let _e422 = u_xlatu_loop_1_;
            u_xlati16_ = i32((_e422 & 3u));
            let _e427 = u_xlatu10_;
            let _e433 = _f_buffer2_.f_cb2_[(i32(_e427) + 12i)];
            let _e434 = u_xlati16_;
            let _e438 = local_1[_e434];
            u_xlat10_.x = dot(_e433, bitcast<vec4<f32>>(_e438));
            let _e441 = u_xlat10_;
            u_xlati10_ = i32(_e441.x);
            let _e444 = u_xlat5_;
            let _e446 = vs_TEXCOORD5_1;
            let _e449 = u_xlati10_;
            let _e452 = _f_buffer1_.f_cb1_[_e449];
            let _e455 = u_xlati10_;
            let _e458 = _f_buffer1_.f_cb1_[_e455];
            let _e460 = ((-(_e446.xyz) * _e452.www) + _e458.xyz);
            u_xlat5_.x = _e460.x;
            u_xlat5_.y = _e460.y;
            u_xlat5_.z = _e460.z;
            let _e467 = u_xlat5_;
            let _e469 = u_xlat5_;
            u_xlat16_ = dot(_e467.xyz, _e469.xyz);
            let _e472 = u_xlat16_;
            u_xlat16_ = max(_e472, 0.000061035156f);
            let _e475 = u_xlat16_;
            u_xlat22_ = inverseSqrt(_e475);
            let _e477 = u_xlat5_;
            let _e479 = u_xlat22_;
            let _e481 = u_xlat5_;
            let _e483 = (vec3(_e479) * _e481.xyz);
            u_xlat5_.x = _e483.x;
            u_xlat5_.y = _e483.y;
            u_xlat5_.z = _e483.z;
            let _e492 = u_xlati10_;
            let _e497 = _f_buffer1_.f_cb1_[(_e492 + 512i)];
            u_xlat22_ = (1f / _e497.x);
            let _e500 = u_xlat16_;
            u_xlat16_ = (_e500 * 25f);
            let _e503 = u_xlat16_;
            let _e504 = u_xlat22_;
            u_xlat16_ = (_e503 / _e504);
            let _e506 = u_xlat16_;
            u_xlat16_ = (_e506 + 1f);
            let _e511 = u_xlat16_;
            u_xlat16_ = (1f / _e511);
            let _e513 = u_xlati10_;
            let _e518 = _f_buffer1_.f_cb1_[(_e513 + 768i)];
            let _e520 = u_xlat5_;
            u_xlat22_ = dot(_e518.xyz, _e520.xyz);
            let _e523 = u_xlat22_;
            let _e524 = u_xlati10_;
            let _e529 = _f_buffer1_.f_cb1_[(_e524 + 512i)];
            let _e532 = u_xlati10_;
            let _e537 = _f_buffer1_.f_cb1_[(_e532 + 512i)];
            u_xlat22_ = ((_e523 * _e529.z) + _e537.w);
            let _e540 = u_xlat22_;
            u_xlat22_ = clamp(_e540, 0f, 1f);
            let _e544 = u_xlat22_;
            let _e545 = u_xlat22_;
            u_xlat22_ = (_e544 * _e545);
            let _e547 = u_xlat22_;
            let _e548 = u_xlat16_;
            u_xlat16_ = (_e547 * _e548);
            let _e550 = u_xlat10_;
            let _e552 = u_xlat16_;
            let _e554 = u_xlati10_;
            let _e559 = _f_buffer1_.f_cb1_[(_e554 + 256i)];
            let _e561 = (vec3(_e552) * _e559.xyz);
            u_xlat10_.x = _e561.x;
            u_xlat10_.y = _e561.y;
            u_xlat10_.z = _e561.z;
            let _e569 = u_xlat1_;
            let _e571 = u_xlat5_;
            u_xlat5_.x = dot(_e569.xyz, _e571.xyz);
            let _e575 = u_xlat5_;
            u_xlat5_.x = clamp(_e575.x, 0f, 1f);
            let _e580 = u_xlat9_;
            let _e582 = u_xlat10_;
            let _e584 = u_xlat5_;
            let _e587 = u_xlat9_;
            let _e589 = ((_e582.xyz * _e584.xxx) + _e587.xyz);
            u_xlat9_.x = _e589.x;
            u_xlat9_.y = _e589.y;
            u_xlat9_.z = _e589.z;
        }
        continuing {
            let _e416 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e416 + 1u);
        }
    }
    let _e596 = u_xlat1_;
    let _e601 = _f_buffer0_.f_cb0_[6];
    let _e603 = u_xlat20_;
    let _e606 = u_xlat9_;
    let _e608 = ((_e601.xyz * vec3(_e603)) + _e606.xyz);
    u_xlat1_.x = _e608.x;
    u_xlat1_.y = _e608.y;
    u_xlat1_.z = _e608.z;
    let _e615 = u_xlat2_;
    let _e617 = u_xlat2_;
    let _e619 = vs_COLOR0_1;
    let _e621 = (_e617.xyz * _e619.xyz);
    u_xlat2_.x = _e621.x;
    u_xlat2_.y = _e621.y;
    u_xlat2_.z = _e621.z;
    let _e628 = SV_TARGET0_;
    let _e630 = u_xlat6_;
    let _e632 = u_xlat1_;
    let _e635 = u_xlat2_;
    let _e637 = ((_e630.xyz * _e632.xyz) + _e635.xyz);
    SV_TARGET0_.x = _e637.x;
    SV_TARGET0_.y = _e637.y;
    SV_TARGET0_.z = _e637.z;
    let _e645 = u_xlat1_;
    let _e647 = u_xlat0_;
    SV_TARGET0_.w = (_e645.w * _e647.x);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(4) vs_TEXCOORD4_: vec4<f32>, @location(5) vs_TEXCOORD5_: vec3<f32>, @location(12) vs_NORMAL0_: vec3<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD4_1 = vs_TEXCOORD4_;
    vs_TEXCOORD5_1 = vs_TEXCOORD5_;
    vs_NORMAL0_1 = vs_NORMAL0_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e55 = SV_TARGET0_;
    return FragmentOutput(_e55);
}
