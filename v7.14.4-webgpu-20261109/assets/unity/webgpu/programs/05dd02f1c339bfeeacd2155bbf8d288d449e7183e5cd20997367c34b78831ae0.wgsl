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
var<private> vs_TEXCOORD1_1: vec2<f32>;
var<private> vs_TEXCOORD2_1: vec3<f32>;
var<private> vs_NORMAL0_1: vec3<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec3<f32> = vec3(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlati4_: i32 = 0i;
    var u_xlat5_: vec3<f32> = vec3(0f);
    var u_xlat6_: vec3<f32> = vec3(0f);
    var u_xlat18_: f32 = 0f;
    var u_xlat19_: f32 = 0f;
    var u_xlatu19_: u32 = 0u;
    var u_xlatu20_: u32 = 0u;
    var u_xlat21_: f32 = 0f;
    var u_xlati21_: i32 = 0i;
    var u_xlatu21_: u32 = 0u;
    var u_xlatb21_: bool = false;
    var u_xlat22_: f32 = 0f;
    var u_xlatu_loop_1_: u32 = 0u;
    var local: array<vec4<u32>, 4> = ImmCB_0_;

    let _e87 = _f_buffer3_.f_cb3_[3];
    let _e93 = _f_buffer3_.f_cb3_[3];
    u_xlat0_.x = (-(_e87.z) + _e93.y);
    let _e100 = _f_buffer3_.f_cb3_[3];
    let _e105 = _f_buffer3_.f_cb3_[3];
    u_xlat6_.x = (_e100.z + _e105.y);
    let _e109 = u_xlat0_;
    let _e112 = u_xlat6_;
    u_xlat6_.x = (-(_e109.x) + _e112.x);
    let _e116 = u_xlat0_;
    let _e119 = vs_TEXCOORD0_1;
    u_xlat0_.x = (-(_e116.x) + _e119.x);
    let _e125 = u_xlat6_;
    u_xlat6_.x = (1f / _e125.x);
    let _e129 = u_xlat6_;
    let _e131 = u_xlat0_;
    u_xlat0_.x = (_e129.x * _e131.x);
    let _e135 = u_xlat0_;
    u_xlat0_.x = clamp(_e135.x, 0f, 1f);
    let _e141 = u_xlat0_;
    u_xlat6_.x = ((_e141.x * -2f) + 3f);
    let _e149 = u_xlat0_;
    let _e151 = u_xlat0_;
    u_xlat0_.x = (_e149.x * _e151.x);
    let _e155 = u_xlat6_;
    let _e158 = u_xlat0_;
    u_xlat0_.x = ((-(_e155.x) * _e158.x) + 1f);
    let _e163 = vs_TEXCOORD0_1;
    let _e168 = _f_buffer0_.f_cb0_[4];
    let _e173 = hscard_bias.values[0];
    let _e176 = textureSampleBias(f_t0_, samplerf_s0_, _e163.xy, (_e168.x + _e173.x));
    u_xlat1_ = _e176;
    let _e177 = vs_TEXCOORD1_1;
    let _e182 = _f_buffer0_.f_cb0_[4];
    let _e187 = hscard_bias.values[1];
    let _e190 = textureSampleBias(f_t1_, samplerf_s1_, _e177.xy, (_e182.x + _e187.x));
    u_xlat2_ = _e190;
    let _e191 = u_xlat6_;
    let _e193 = u_xlat1_;
    let _e196 = u_xlat2_;
    let _e198 = (-(_e193.xyz) + _e196.xyz);
    u_xlat6_.x = _e198.x;
    u_xlat6_.y = _e198.y;
    u_xlat6_.z = _e198.z;
    let _e205 = u_xlat0_;
    let _e207 = u_xlat0_;
    let _e209 = u_xlat6_;
    let _e212 = u_xlat1_;
    let _e214 = ((_e207.xxx * _e209.xyz) + _e212.xyz);
    u_xlat0_.x = _e214.x;
    u_xlat0_.y = _e214.y;
    u_xlat0_.z = _e214.z;
    let _e221 = u_xlat0_;
    let _e223 = u_xlat0_;
    let _e228 = _f_buffer3_.f_cb3_[2];
    let _e230 = (_e223.xyz * _e228.xyz);
    u_xlat0_.x = _e230.x;
    u_xlat0_.y = _e230.y;
    u_xlat0_.z = _e230.z;
    let _e237 = vs_NORMAL0_1;
    let _e239 = vs_NORMAL0_1;
    u_xlat18_ = dot(_e237.xyz, _e239.xyz);
    let _e242 = u_xlat18_;
    u_xlat18_ = inverseSqrt(_e242);
    let _e244 = u_xlat1_;
    let _e246 = u_xlat18_;
    let _e248 = vs_NORMAL0_1;
    let _e250 = (vec3(_e246) * _e248.xyz);
    u_xlat1_.x = _e250.x;
    u_xlat1_.y = _e250.y;
    u_xlat1_.z = _e250.z;
    let _e257 = u_xlat2_;
    let _e262 = _f_buffer0_.f_cb0_[6];
    let _e267 = _f_buffer2_.f_cb2_[11];
    let _e269 = (_e262.xyz * _e267.zzz);
    u_xlat2_.x = _e269.x;
    u_xlat2_.y = _e269.y;
    u_xlat2_.z = _e269.z;
    let _e276 = u_xlat1_;
    let _e281 = _f_buffer0_.f_cb0_[5];
    u_xlat18_ = dot(_e276.xyz, _e281.xyz);
    let _e284 = u_xlat18_;
    u_xlat18_ = clamp(_e284, 0f, 1f);
    let _e291 = _f_buffer0_.f_cb0_[10];
    let _e296 = _f_buffer2_.f_cb2_[11];
    u_xlat19_ = min(_e291.x, _e296.y);
    let _e299 = u_xlat19_;
    u_xlatu19_ = u32(i32(_e299));
    u_xlat3_.x = 0f;
    u_xlat3_.y = 0f;
    u_xlat3_.z = 0f;
    loop {
        let _e313 = u_xlatu_loop_1_;
        let _e314 = u_xlatu19_;
        if !((_e313 < _e314)) {
            break;
        }
        {
            let _e320 = u_xlatu_loop_1_;
            u_xlatu21_ = (_e320 >> 2u);
            let _e323 = u_xlatu_loop_1_;
            u_xlati4_ = i32((_e323 & 3u));
            let _e327 = u_xlatu21_;
            let _e333 = _f_buffer2_.f_cb2_[(i32(_e327) + 12i)];
            let _e334 = u_xlati4_;
            let _e338 = local[_e334];
            u_xlat21_ = dot(_e333, bitcast<vec4<f32>>(_e338));
            let _e341 = u_xlat21_;
            u_xlati21_ = i32(_e341);
            let _e343 = u_xlat4_;
            let _e345 = vs_TEXCOORD2_1;
            let _e348 = u_xlati21_;
            let _e351 = _f_buffer1_.f_cb1_[_e348];
            let _e354 = u_xlati21_;
            let _e357 = _f_buffer1_.f_cb1_[_e354];
            let _e359 = ((-(_e345.xyz) * _e351.www) + _e357.xyz);
            u_xlat4_.x = _e359.x;
            u_xlat4_.y = _e359.y;
            u_xlat4_.z = _e359.z;
            let _e366 = u_xlat4_;
            let _e368 = u_xlat4_;
            u_xlat22_ = dot(_e366.xyz, _e368.xyz);
            let _e371 = u_xlat22_;
            u_xlat22_ = max(_e371, 0.000061035156f);
            let _e375 = u_xlat22_;
            u_xlat5_.x = inverseSqrt(_e375);
            let _e377 = u_xlat4_;
            let _e379 = u_xlat4_;
            let _e381 = u_xlat5_;
            let _e383 = (_e379.xyz * _e381.xxx);
            u_xlat4_.x = _e383.x;
            u_xlat4_.y = _e383.y;
            u_xlat4_.z = _e383.z;
            let _e393 = u_xlati21_;
            let _e398 = _f_buffer1_.f_cb1_[(_e393 + 512i)];
            u_xlat5_.x = (1f / _e398.x);
            let _e401 = u_xlat22_;
            u_xlat22_ = (_e401 * 25f);
            let _e404 = u_xlat22_;
            let _e405 = u_xlat5_;
            u_xlat22_ = (_e404 / _e405.x);
            let _e408 = u_xlat22_;
            u_xlat22_ = (_e408 + 1f);
            let _e413 = u_xlat22_;
            u_xlat22_ = (1f / _e413);
            let _e416 = u_xlati21_;
            let _e421 = _f_buffer1_.f_cb1_[(_e416 + 768i)];
            let _e423 = u_xlat4_;
            u_xlat5_.x = dot(_e421.xyz, _e423.xyz);
            let _e427 = u_xlat5_;
            let _e429 = u_xlati21_;
            let _e434 = _f_buffer1_.f_cb1_[(_e429 + 512i)];
            let _e437 = u_xlati21_;
            let _e442 = _f_buffer1_.f_cb1_[(_e437 + 512i)];
            u_xlat5_.x = ((_e427.x * _e434.z) + _e442.w);
            let _e446 = u_xlat5_;
            u_xlat5_.x = clamp(_e446.x, 0f, 1f);
            let _e452 = u_xlat5_;
            let _e454 = u_xlat5_;
            u_xlat5_.x = (_e452.x * _e454.x);
            let _e457 = u_xlat22_;
            let _e458 = u_xlat5_;
            u_xlat22_ = (_e457 * _e458.x);
            let _e461 = u_xlat5_;
            let _e463 = u_xlat22_;
            let _e465 = u_xlati21_;
            let _e470 = _f_buffer1_.f_cb1_[(_e465 + 256i)];
            let _e472 = (vec3(_e463) * _e470.xyz);
            u_xlat5_.x = _e472.x;
            u_xlat5_.y = _e472.y;
            u_xlat5_.z = _e472.z;
            let _e479 = u_xlat1_;
            let _e481 = u_xlat4_;
            u_xlat21_ = dot(_e479.xyz, _e481.xyz);
            let _e484 = u_xlat21_;
            u_xlat21_ = clamp(_e484, 0f, 1f);
            let _e488 = u_xlat3_;
            let _e490 = u_xlat5_;
            let _e492 = u_xlat21_;
            let _e495 = u_xlat3_;
            let _e497 = ((_e490.xyz * vec3(_e492)) + _e495.xyz);
            u_xlat3_.x = _e497.x;
            u_xlat3_.y = _e497.y;
            u_xlat3_.z = _e497.z;
        }
        continuing {
            let _e317 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e317 + 1u);
        }
    }
    let _e504 = u_xlat1_;
    let _e506 = u_xlat2_;
    let _e508 = u_xlat18_;
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
    let _e629 = u_xlat2_;
    let _e631 = u_xlat2_;
    let _e640 = (_e631.xyz + vec3<f32>(-1f, -1f, -1f));
    u_xlat2_.x = _e640.x;
    u_xlat2_.y = _e640.y;
    u_xlat2_.z = _e640.z;
    let _e647 = u_xlat2_;
    let _e652 = _f_buffer3_.f_cb3_[3];
    let _e654 = u_xlat2_;
    let _e661 = ((_e652.xxx * _e654.xyz) + vec3<f32>(1f, 1f, 1f));
    u_xlat2_.x = _e661.x;
    u_xlat2_.y = _e661.y;
    u_xlat2_.z = _e661.z;
    let _e668 = u_xlat2_;
    let _e670 = u_xlat0_;
    let _e672 = u_xlat2_;
    let _e674 = (_e670.xyz * _e672.xyz);
    u_xlat2_.x = _e674.x;
    u_xlat2_.y = _e674.y;
    u_xlat2_.z = _e674.z;
    let _e681 = SV_Target0_;
    let _e683 = u_xlat1_;
    let _e685 = u_xlat0_;
    let _e688 = u_xlat2_;
    let _e690 = ((_e683.xyz * _e685.xyz) + _e688.xyz);
    SV_Target0_.x = _e690.x;
    SV_Target0_.y = _e690.y;
    SV_Target0_.z = _e690.z;
    SV_Target0_.w = 1f;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec2<f32>, @location(2) vs_TEXCOORD2_: vec3<f32>, @location(12) vs_NORMAL0_: vec3<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_TEXCOORD2_1 = vs_TEXCOORD2_;
    vs_NORMAL0_1 = vs_NORMAL0_;
    main_1();
    let _e44 = SV_Target0_;
    return FragmentOutput(_e44);
}
