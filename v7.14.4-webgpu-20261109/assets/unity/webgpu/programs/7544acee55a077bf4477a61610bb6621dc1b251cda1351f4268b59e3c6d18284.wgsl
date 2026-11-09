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
    let _e105 = vs_TEXCOORD5_1;
    let _e110 = _f_buffer0_.f_cb0_[4];
    let _e115 = hscard_bias.values[2];
    let _e118 = textureSampleBias(f_t2_, samplerf_s2_, _e105.xy, (_e110.x + _e115.x));
    u_xlat1_ = _e118;
    let _e120 = u_xlat1_;
    let _e125 = _f_buffer4_.f_cb4_[3];
    u_xlat1_.x = (_e120.x * _e125.x);
    let _e128 = u_xlat2_;
    let _e130 = u_xlat1_;
    let _e135 = _f_buffer4_.f_cb4_[2];
    let _e137 = (_e130.zzz * _e135.xyz);
    u_xlat2_.x = _e137.x;
    u_xlat2_.y = _e137.y;
    u_xlat2_.z = _e137.z;
    let _e144 = u_xlat0_;
    let _e146 = u_xlat0_;
    let _e148 = u_xlat1_;
    let _e151 = u_xlat2_;
    let _e153 = ((_e146.xyz * _e148.xxx) + _e151.xyz);
    u_xlat0_.x = _e153.x;
    u_xlat0_.y = _e153.y;
    u_xlat0_.z = _e153.z;
    let _e160 = u_xlat0_;
    let _e162 = u_xlat1_;
    let _e167 = _f_buffer4_.f_cb4_[3];
    let _e170 = u_xlat0_;
    let _e172 = ((_e162.yyy * _e167.yyy) + _e170.xyz);
    u_xlat0_.x = _e172.x;
    u_xlat0_.y = _e172.y;
    u_xlat0_.z = _e172.z;
    let _e180 = vs_NORMAL0_1;
    let _e182 = vs_NORMAL0_1;
    u_xlat1_.x = dot(_e180.xyz, _e182.xyz);
    let _e186 = u_xlat1_;
    u_xlat1_.x = inverseSqrt(_e186.x);
    let _e189 = u_xlat1_;
    let _e191 = u_xlat1_;
    let _e193 = vs_NORMAL0_1;
    let _e195 = (_e191.xxx * _e193.xyz);
    u_xlat1_.x = _e195.x;
    u_xlat1_.y = _e195.y;
    u_xlat1_.z = _e195.z;
    let _e202 = vs_TEXCOORDindex3_1;
    let _e203 = _e202.xy;
    let _e204 = vs_TEXCOORDindex3_1;
    txVec0_ = vec3<f32>(_e203.x, _e203.y, _e204.z);
    let _e210 = txVec0_;
    let _e214 = textureSampleCompareLevel(f_t0_, samplerf_s0_, _e210.xy, _e210.z);
    u_xlat19_ = _e214;
    let _e219 = _f_buffer3_.f_cb3_[27];
    u_xlat2_.x = (-(_e219.x) + 1f);
    let _e224 = u_xlat19_;
    let _e228 = _f_buffer3_.f_cb3_[27];
    let _e231 = u_xlat2_;
    u_xlat19_ = ((_e224 * _e228.x) + _e231.x);
    let _e235 = vs_TEXCOORDindex3_1;
    u_xlatb2_ = (0f >= _e235.z);
    let _e238 = vs_TEXCOORDindex3_1;
    u_xlatb8_ = (_e238.z >= 1f);
    let _e242 = u_xlatb8_;
    let _e243 = u_xlatb2_;
    u_xlatb2_ = (_e242 || _e243);
    let _e245 = u_xlatb2_;
    if _e245 {
        local = 1f;
    } else {
        let _e247 = u_xlat19_;
        local = _e247;
    }
    let _e249 = local;
    u_xlat19_ = _e249;
    let _e250 = u_xlat19_;
    let _e254 = _f_buffer2_.f_cb2_[11];
    u_xlat19_ = (_e250 * _e254.z);
    let _e257 = u_xlat2_;
    let _e259 = u_xlat19_;
    let _e264 = _f_buffer0_.f_cb0_[6];
    let _e266 = (vec3(_e259) * _e264.xyz);
    u_xlat2_.x = _e266.x;
    u_xlat2_.y = _e266.y;
    u_xlat2_.z = _e266.z;
    let _e273 = u_xlat1_;
    let _e278 = _f_buffer0_.f_cb0_[5];
    u_xlat19_ = dot(_e273.xyz, _e278.xyz);
    let _e281 = u_xlat19_;
    u_xlat19_ = clamp(_e281, 0f, 1f);
    let _e288 = _f_buffer0_.f_cb0_[10];
    let _e293 = _f_buffer2_.f_cb2_[11];
    u_xlat20_ = min(_e288.x, _e293.y);
    let _e296 = u_xlat20_;
    u_xlatu20_ = u32(i32(_e296));
    u_xlat3_.x = 0f;
    u_xlat3_.y = 0f;
    u_xlat3_.z = 0f;
    loop {
        let _e311 = u_xlatu_loop_1_;
        let _e312 = u_xlatu20_;
        if !((_e311 < _e312)) {
            break;
        }
        {
            let _e318 = u_xlatu_loop_1_;
            u_xlatu4_ = (_e318 >> 2u);
            let _e321 = u_xlatu_loop_1_;
            u_xlati10_ = i32((_e321 & 3u));
            let _e325 = u_xlatu4_;
            let _e331 = _f_buffer2_.f_cb2_[(i32(_e325) + 12i)];
            let _e332 = u_xlati10_;
            let _e336 = local_1[_e332];
            u_xlat4_ = dot(_e331, bitcast<vec4<f32>>(_e336));
            let _e339 = u_xlat4_;
            u_xlati4_ = i32(_e339);
            let _e341 = u_xlat10_;
            let _e343 = vs_TEXCOORD1_1;
            let _e346 = u_xlati4_;
            let _e349 = _f_buffer1_.f_cb1_[_e346];
            let _e352 = u_xlati4_;
            let _e355 = _f_buffer1_.f_cb1_[_e352];
            let _e357 = ((-(_e343.xyz) * _e349.www) + _e355.xyz);
            u_xlat10_.x = _e357.x;
            u_xlat10_.y = _e357.y;
            u_xlat10_.z = _e357.z;
            let _e365 = u_xlat10_;
            let _e367 = u_xlat10_;
            u_xlat5_.x = dot(_e365.xyz, _e367.xyz);
            let _e371 = u_xlat5_;
            u_xlat5_.x = max(_e371.x, 0.000061035156f);
            let _e375 = u_xlat5_;
            u_xlat11_ = inverseSqrt(_e375.x);
            let _e378 = u_xlat10_;
            let _e380 = u_xlat10_;
            let _e382 = u_xlat11_;
            let _e384 = (_e380.xyz * vec3(_e382));
            u_xlat10_.x = _e384.x;
            u_xlat10_.y = _e384.y;
            u_xlat10_.z = _e384.z;
            let _e393 = u_xlati4_;
            let _e398 = _f_buffer1_.f_cb1_[(_e393 + 512i)];
            u_xlat11_ = (1f / _e398.x);
            let _e402 = u_xlat5_;
            u_xlat5_.x = (_e402.x * 25f);
            let _e407 = u_xlat5_;
            let _e409 = u_xlat11_;
            u_xlat5_.x = (_e407.x / _e409);
            let _e412 = u_xlat5_;
            u_xlat5_.x = (_e412.x + 1f);
            let _e419 = u_xlat5_;
            u_xlat5_.x = (1f / _e419.x);
            let _e422 = u_xlati4_;
            let _e427 = _f_buffer1_.f_cb1_[(_e422 + 768i)];
            let _e429 = u_xlat10_;
            u_xlat11_ = dot(_e427.xyz, _e429.xyz);
            let _e432 = u_xlat11_;
            let _e433 = u_xlati4_;
            let _e438 = _f_buffer1_.f_cb1_[(_e433 + 512i)];
            let _e441 = u_xlati4_;
            let _e446 = _f_buffer1_.f_cb1_[(_e441 + 512i)];
            u_xlat11_ = ((_e432 * _e438.z) + _e446.w);
            let _e449 = u_xlat11_;
            u_xlat11_ = clamp(_e449, 0f, 1f);
            let _e453 = u_xlat11_;
            let _e454 = u_xlat11_;
            u_xlat11_ = (_e453 * _e454);
            let _e457 = u_xlat11_;
            let _e458 = u_xlat5_;
            u_xlat5_.x = (_e457 * _e458.x);
            let _e461 = u_xlat5_;
            let _e463 = u_xlat5_;
            let _e465 = u_xlati4_;
            let _e470 = _f_buffer1_.f_cb1_[(_e465 + 256i)];
            let _e472 = (_e463.xxx * _e470.xyz);
            u_xlat5_.x = _e472.x;
            u_xlat5_.y = _e472.y;
            u_xlat5_.z = _e472.z;
            let _e479 = u_xlat1_;
            let _e481 = u_xlat10_;
            u_xlat4_ = dot(_e479.xyz, _e481.xyz);
            let _e484 = u_xlat4_;
            u_xlat4_ = clamp(_e484, 0f, 1f);
            let _e488 = u_xlat3_;
            let _e490 = u_xlat5_;
            let _e492 = u_xlat4_;
            let _e495 = u_xlat3_;
            let _e497 = ((_e490.xyz * vec3(_e492)) + _e495.xyz);
            u_xlat3_.x = _e497.x;
            u_xlat3_.y = _e497.y;
            u_xlat3_.z = _e497.z;
        }
        continuing {
            let _e315 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e315 + 1u);
        }
    }
    let _e504 = u_xlat1_;
    let _e506 = u_xlat2_;
    let _e508 = u_xlat19_;
    let _e511 = u_xlat3_;
    let _e513 = ((_e506.xyz * vec3(_e508)) + _e511.xyz);
    u_xlat1_.x = _e513.x;
    u_xlat1_.y = _e513.y;
    u_xlat1_.z = _e513.z;
    let _e524 = _f_buffer2_.f_cb2_[27];
    u_xlat2_.x = abs(_e524.w);
    let _e531 = _f_buffer2_.f_cb2_[28];
    u_xlat2_.y = abs(_e531.w);
    let _e538 = _f_buffer2_.f_cb2_[29];
    u_xlat2_.z = abs(_e538.w);
    let _e541 = u_xlat2_;
    let _e543 = u_xlat2_;
    let _e545 = log2(_e543.xyz);
    u_xlat2_.x = _e545.x;
    u_xlat2_.y = _e545.y;
    u_xlat2_.z = _e545.z;
    let _e552 = u_xlat2_;
    let _e554 = u_xlat2_;
    let _e560 = (_e554.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat2_.x = _e560.x;
    u_xlat2_.y = _e560.y;
    u_xlat2_.z = _e560.z;
    let _e567 = u_xlat2_;
    let _e569 = u_xlat2_;
    let _e571 = exp2(_e569.xyz);
    u_xlat2_.x = _e571.x;
    u_xlat2_.y = _e571.y;
    u_xlat2_.z = _e571.z;
    let _e578 = u_xlat2_;
    let _e580 = u_xlat2_;
    let _e594 = ((_e580.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat2_.x = _e594.x;
    u_xlat2_.y = _e594.y;
    u_xlat2_.z = _e594.z;
    let _e601 = u_xlat2_;
    let _e603 = u_xlat2_;
    let _e609 = clamp(_e603.xyz, vec3(0f), vec3(1f));
    u_xlat2_.x = _e609.x;
    u_xlat2_.y = _e609.y;
    u_xlat2_.z = _e609.z;
    let _e616 = u_xlat1_;
    let _e618 = u_xlat1_;
    let _e620 = u_xlat2_;
    let _e622 = (_e618.xyz + _e620.xyz);
    u_xlat1_.x = _e622.x;
    u_xlat1_.y = _e622.y;
    u_xlat1_.z = _e622.z;
    let _e629 = SV_Target0_;
    let _e631 = u_xlat0_;
    let _e633 = u_xlat1_;
    let _e635 = (_e631.xyz * _e633.xyz);
    SV_Target0_.x = _e635.x;
    SV_Target0_.y = _e635.y;
    SV_Target0_.z = _e635.z;
    let _e643 = u_xlat0_;
    SV_Target0_.w = _e643.w;
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
