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
    f_cb3_: array<vec4<f32>, 5>,
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
@group(3) @binding(3) 
var samplerf_s1_: sampler;
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec4<f32>;
var<private> vs_TEXCOORD5_1: vec3<f32>;
var<private> vs_NORMAL0_1: vec3<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_TARGET0_: vec4<f32>;

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
    var u_xlat6_: vec3<f32> = vec3(0f);
    var u_xlat10_: vec3<f32> = vec3(0f);
    var u_xlati10_: i32 = 0i;
    var u_xlat11_: f32 = 0f;
    var u_xlat20_: f32 = 0f;
    var u_xlatu20_: u32 = 0u;
    var u_xlatu21_: u32 = 0u;
    var u_xlatu_loop_1_: u32 = 0u;
    var local: array<vec4<u32>, 4> = ImmCB_0_;

    let _e80 = u_xlat0_;
    let _e85 = _f_buffer3_.f_cb3_[3];
    let _e90 = _f_buffer3_.f_cb3_[4];
    let _e92 = (_e85.wzy * _e90.yyy);
    u_xlat0_.x = _e92.x;
    u_xlat0_.y = _e92.y;
    u_xlat0_.z = _e92.z;
    let _e103 = _f_buffer3_.f_cb3_[4];
    let _e108 = _f_buffer3_.f_cb3_[4];
    u_xlat1_.y = (_e103.x * _e108.y);
    let _e112 = vs_TEXCOORD0_1;
    u_xlat1_.x = (_e112.x * 2f);
    let _e117 = vs_TEXCOORD0_1;
    u_xlat0_.w = (_e117.y * 2f);
    let _e121 = u_xlat0_;
    let _e123 = u_xlat0_;
    let _e125 = u_xlat1_;
    let _e127 = (_e123.xw + _e125.xy);
    u_xlat0_.x = _e127.x;
    u_xlat0_.w = _e127.y;
    let _e132 = u_xlat0_;
    let _e134 = u_xlat0_;
    let _e139 = (_e134.xw * vec2<f32>(0.5f, 0.5f));
    u_xlat0_.x = _e139.x;
    u_xlat0_.w = _e139.y;
    let _e144 = u_xlat0_;
    let _e149 = _f_buffer0_.f_cb0_[4];
    let _e154 = hscard_bias.values[0];
    let _e157 = textureSampleBias(f_t0_, samplerf_s0_, _e144.xw, (_e149.x + _e154.x));
    u_xlat1_ = _e157;
    let _e159 = u_xlat1_;
    let _e164 = _f_buffer3_.f_cb3_[3];
    u_xlat0_.x = (_e159.x * _e164.x);
    let _e167 = u_xlat2_;
    let _e169 = u_xlat0_;
    let _e174 = _f_buffer3_.f_cb3_[1];
    let _e176 = (_e169.xxx * _e174.xyz);
    u_xlat2_.x = _e176.x;
    u_xlat2_.y = _e176.y;
    u_xlat2_.z = _e176.z;
    let _e183 = u_xlat0_;
    let _e185 = vs_TEXCOORD0_1;
    let _e191 = u_xlat0_;
    let _e193 = ((_e185.zw * vec2<f32>(2f, 2f)) + _e191.yz);
    u_xlat0_.x = _e193.x;
    u_xlat0_.y = _e193.y;
    let _e198 = u_xlat0_;
    let _e200 = u_xlat0_;
    let _e205 = _f_buffer3_.f_cb3_[2];
    let _e207 = (_e200.xy * _e205.xx);
    u_xlat0_.x = _e207.x;
    u_xlat0_.y = _e207.y;
    let _e212 = u_xlat0_;
    let _e217 = _f_buffer0_.f_cb0_[4];
    let _e222 = hscard_bias.values[1];
    let _e225 = textureSampleBias(f_t1_, samplerf_s1_, _e212.xy, (_e217.x + _e222.x));
    u_xlat0_ = _e225;
    let _e227 = u_xlat0_;
    u_xlat0_.x = log2(_e227.x);
    let _e231 = u_xlat0_;
    let _e236 = _f_buffer3_.f_cb3_[2];
    u_xlat0_.x = (_e231.x * _e236.y);
    let _e240 = u_xlat0_;
    u_xlat0_.x = exp2(_e240.x);
    let _e244 = u_xlat0_;
    let _e249 = _f_buffer3_.f_cb3_[2];
    u_xlat0_.x = min(_e244.x, _e249.y);
    let _e253 = u_xlat0_;
    let _e255 = u_xlat1_;
    u_xlat0_.x = (_e253.x * _e255.x);
    let _e259 = u_xlat0_;
    let _e264 = _f_buffer3_.f_cb3_[2];
    let _e270 = _f_buffer3_.f_cb3_[2];
    u_xlat0_.x = ((_e259.x * _e264.z) + -(_e270.w));
    let _e275 = u_xlat0_;
    let _e280 = _f_buffer3_.f_cb3_[1];
    u_xlat0_.x = (_e275.x * _e280.w);
    let _e283 = u_xlat6_;
    let _e285 = u_xlat1_;
    let _e287 = u_xlat2_;
    let _e289 = (_e285.www * _e287.xyz);
    u_xlat6_.x = _e289.x;
    u_xlat6_.y = _e289.y;
    u_xlat6_.z = _e289.z;
    let _e297 = vs_NORMAL0_1;
    let _e299 = vs_NORMAL0_1;
    u_xlat1_.x = dot(_e297.xyz, _e299.xyz);
    let _e303 = u_xlat1_;
    u_xlat1_.x = inverseSqrt(_e303.x);
    let _e306 = u_xlat1_;
    let _e308 = u_xlat1_;
    let _e310 = vs_NORMAL0_1;
    let _e312 = (_e308.xxx * _e310.xyz);
    u_xlat1_.x = _e312.x;
    u_xlat1_.y = _e312.y;
    u_xlat1_.z = _e312.z;
    let _e322 = _f_buffer0_.f_cb0_[10];
    let _e327 = _f_buffer2_.f_cb2_[11];
    u_xlat20_ = min(_e322.x, _e327.y);
    let _e330 = u_xlat20_;
    u_xlatu20_ = u32(i32(_e330));
    u_xlat3_.x = 0f;
    u_xlat3_.y = 0f;
    u_xlat3_.z = 0f;
    loop {
        let _e345 = u_xlatu_loop_1_;
        let _e346 = u_xlatu20_;
        if !((_e345 < _e346)) {
            break;
        }
        {
            let _e352 = u_xlatu_loop_1_;
            u_xlatu4_ = (_e352 >> 2u);
            let _e355 = u_xlatu_loop_1_;
            u_xlati10_ = i32((_e355 & 3u));
            let _e359 = u_xlatu4_;
            let _e365 = _f_buffer2_.f_cb2_[(i32(_e359) + 12i)];
            let _e366 = u_xlati10_;
            let _e370 = local[_e366];
            u_xlat4_ = dot(_e365, bitcast<vec4<f32>>(_e370));
            let _e373 = u_xlat4_;
            u_xlati4_ = i32(_e373);
            let _e375 = u_xlat10_;
            let _e377 = vs_TEXCOORD5_1;
            let _e380 = u_xlati4_;
            let _e383 = _f_buffer1_.f_cb1_[_e380];
            let _e386 = u_xlati4_;
            let _e389 = _f_buffer1_.f_cb1_[_e386];
            let _e391 = ((-(_e377.xyz) * _e383.www) + _e389.xyz);
            u_xlat10_.x = _e391.x;
            u_xlat10_.y = _e391.y;
            u_xlat10_.z = _e391.z;
            let _e399 = u_xlat10_;
            let _e401 = u_xlat10_;
            u_xlat5_.x = dot(_e399.xyz, _e401.xyz);
            let _e405 = u_xlat5_;
            u_xlat5_.x = max(_e405.x, 0.000061035156f);
            let _e409 = u_xlat5_;
            u_xlat11_ = inverseSqrt(_e409.x);
            let _e412 = u_xlat10_;
            let _e414 = u_xlat10_;
            let _e416 = u_xlat11_;
            let _e418 = (_e414.xyz * vec3(_e416));
            u_xlat10_.x = _e418.x;
            u_xlat10_.y = _e418.y;
            u_xlat10_.z = _e418.z;
            let _e427 = u_xlati4_;
            let _e432 = _f_buffer1_.f_cb1_[(_e427 + 512i)];
            u_xlat11_ = (1f / _e432.x);
            let _e436 = u_xlat5_;
            u_xlat5_.x = (_e436.x * 25f);
            let _e441 = u_xlat5_;
            let _e443 = u_xlat11_;
            u_xlat5_.x = (_e441.x / _e443);
            let _e446 = u_xlat5_;
            u_xlat5_.x = (_e446.x + 1f);
            let _e453 = u_xlat5_;
            u_xlat5_.x = (1f / _e453.x);
            let _e456 = u_xlati4_;
            let _e461 = _f_buffer1_.f_cb1_[(_e456 + 768i)];
            let _e463 = u_xlat10_;
            u_xlat11_ = dot(_e461.xyz, _e463.xyz);
            let _e466 = u_xlat11_;
            let _e467 = u_xlati4_;
            let _e472 = _f_buffer1_.f_cb1_[(_e467 + 512i)];
            let _e475 = u_xlati4_;
            let _e480 = _f_buffer1_.f_cb1_[(_e475 + 512i)];
            u_xlat11_ = ((_e466 * _e472.z) + _e480.w);
            let _e483 = u_xlat11_;
            u_xlat11_ = clamp(_e483, 0f, 1f);
            let _e487 = u_xlat11_;
            let _e488 = u_xlat11_;
            u_xlat11_ = (_e487 * _e488);
            let _e491 = u_xlat11_;
            let _e492 = u_xlat5_;
            u_xlat5_.x = (_e491 * _e492.x);
            let _e495 = u_xlat5_;
            let _e497 = u_xlat5_;
            let _e499 = u_xlati4_;
            let _e504 = _f_buffer1_.f_cb1_[(_e499 + 256i)];
            let _e506 = (_e497.xxx * _e504.xyz);
            u_xlat5_.x = _e506.x;
            u_xlat5_.y = _e506.y;
            u_xlat5_.z = _e506.z;
            let _e513 = u_xlat1_;
            let _e515 = u_xlat10_;
            u_xlat4_ = dot(_e513.xyz, _e515.xyz);
            let _e518 = u_xlat4_;
            u_xlat4_ = clamp(_e518, 0f, 1f);
            let _e522 = u_xlat3_;
            let _e524 = u_xlat5_;
            let _e526 = u_xlat4_;
            let _e529 = u_xlat3_;
            let _e531 = ((_e524.xyz * vec3(_e526)) + _e529.xyz);
            u_xlat3_.x = _e531.x;
            u_xlat3_.y = _e531.y;
            u_xlat3_.z = _e531.z;
        }
        continuing {
            let _e349 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e349 + 1u);
        }
    }
    let _e538 = u_xlat1_;
    let _e543 = _f_buffer0_.f_cb0_[6];
    let _e548 = _f_buffer2_.f_cb2_[11];
    let _e551 = u_xlat3_;
    let _e553 = ((_e543.xyz * _e548.zzz) + _e551.xyz);
    u_xlat1_.x = _e553.x;
    u_xlat1_.y = _e553.y;
    u_xlat1_.z = _e553.z;
    let _e560 = u_xlat2_;
    let _e562 = u_xlat2_;
    let _e564 = vs_COLOR0_1;
    let _e566 = (_e562.xyz * _e564.xyz);
    u_xlat2_.x = _e566.x;
    u_xlat2_.y = _e566.y;
    u_xlat2_.z = _e566.z;
    let _e573 = SV_TARGET0_;
    let _e575 = u_xlat6_;
    let _e577 = u_xlat1_;
    let _e580 = u_xlat2_;
    let _e582 = ((_e575.xyz * _e577.xyz) + _e580.xyz);
    SV_TARGET0_.x = _e582.x;
    SV_TARGET0_.y = _e582.y;
    SV_TARGET0_.z = _e582.z;
    let _e590 = u_xlat1_;
    let _e592 = u_xlat0_;
    SV_TARGET0_.w = (_e590.w * _e592.x);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(5) vs_TEXCOORD5_: vec3<f32>, @location(12) vs_NORMAL0_: vec3<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD5_1 = vs_TEXCOORD5_;
    vs_NORMAL0_1 = vs_NORMAL0_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e44 = SV_TARGET0_;
    return FragmentOutput(_e44);
}
