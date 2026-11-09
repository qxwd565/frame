struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 7>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 34>,
}

struct f_buffer2_ {
    f_cb2_: array<vec4<f32>, 6>,
}

struct FragmentOutput {
    @location(0) SV_Target0_: vec4<f32>,
}

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
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD2_1: vec3<f32>;
var<private> vs_TEXCOORD5_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlatb1_: bool = false;
    var u_xlatb2_: bool = false;
    var u_xlat3_: vec4<f32> = vec4(0f);
    var u_xlat4_: vec4<f32> = vec4(0f);
    var u_xlatb4_: vec3<bool> = vec3(false);
    var u_xlat5_: vec3<f32> = vec3(0f);
    var u_xlat6_: vec3<f32> = vec3(0f);
    var u_xlatb6_: bool = false;
    var u_xlat7_: f32 = 0f;
    var u_xlat8_: vec3<f32> = vec3(0f);
    var u_xlat13_: f32 = 0f;
    var u_xlati13_: i32 = 0i;
    var u_xlat19_: f32 = 0f;
    var local: u32;
    var local_1: f32;
    var local_2: i32;
    var local_3: f32;
    var hlslcc_movcTemp: vec4<f32>;
    var local_4: f32;
    var local_5: f32;
    var local_6: f32;
    var local_7: f32;
    var local_8: f32;

    let _e73 = vs_TEXCOORD0_1;
    let _e78 = _f_buffer0_.f_cb0_[4];
    let _e83 = hscard_bias.values[0];
    let _e86 = textureSampleBias(f_t0_, samplerf_s0_, _e73.xy, (_e78.x + _e83.x));
    u_xlat0_ = _e86;
    let _e88 = u_xlat0_;
    let _e93 = _f_buffer2_.f_cb2_[2];
    let _e99 = _f_buffer2_.f_cb2_[5];
    u_xlat1_.x = ((_e88.w * _e93.w) + -(_e99.x));
    let _e103 = u_xlat0_;
    let _e108 = _f_buffer2_.f_cb2_[2];
    u_xlat0_ = (_e103.wxyz * _e108.wxyz);
    let _e111 = u_xlat0_;
    let _e113 = dpdx(_e111.x);
    u_xlat7_ = _e113;
    let _e114 = u_xlat0_;
    let _e116 = dpdy(_e114.x);
    u_xlat13_ = _e116;
    let _e117 = u_xlat13_;
    let _e119 = u_xlat7_;
    u_xlat7_ = (abs(_e117) + abs(_e119));
    let _e122 = u_xlat7_;
    let _e126 = u_xlat1_;
    u_xlat13_ = ((-(_e122) * 0.5f) + _e126.x);
    let _e129 = u_xlat7_;
    u_xlat7_ = max(_e129, 0.0001f);
    let _e132 = u_xlat13_;
    let _e133 = u_xlat7_;
    u_xlat7_ = (_e132 / _e133);
    let _e135 = u_xlat7_;
    u_xlat7_ = (_e135 + 1f);
    let _e138 = u_xlat7_;
    u_xlat7_ = clamp(_e138, 0f, 1f);
    let _e146 = _f_buffer2_.f_cb2_[5];
    if (0f >= _e146.x) {
        local = 4294967295u;
    } else {
        local = 0u;
    }
    let _e153 = local;
    u_xlati13_ = i32(_e153);
    let _e155 = u_xlati13_;
    if (_e155 != 0i) {
        local_1 = 1f;
    } else {
        let _e159 = u_xlat7_;
        local_1 = _e159;
    }
    let _e161 = local_1;
    u_xlat7_ = _e161;
    let _e162 = u_xlati13_;
    u_xlati13_ = ~(_e162);
    let _e164 = u_xlat7_;
    u_xlat19_ = (_e164 + -0.0001f);
    let _e171 = _f_buffer0_.f_cb0_[4];
    u_xlatb2_ = (_e171.z != 0f);
    let _e175 = u_xlatb2_;
    if _e175 {
        let _e176 = u_xlati13_;
        local_2 = _e176;
    } else {
        local_2 = 0i;
    }
    let _e180 = local_2;
    u_xlati13_ = _e180;
    let _e182 = u_xlati13_;
    if (_e182 != 0i) {
        let _e185 = u_xlat19_;
        local_3 = _e185;
    } else {
        let _e186 = u_xlat1_;
        local_3 = _e186.x;
    }
    let _e189 = local_3;
    u_xlat1_.x = _e189;
    let _e190 = u_xlat1_;
    u_xlatb1_ = (_e190.x < 0f);
    let _e194 = u_xlatb1_;
    if ((select(0i, 1i, _e194) * -1i) != 0i) {
        {
            discard;
        }
    }
    let _e204 = vs_TEXCOORD2_1;
    let _e206 = vs_TEXCOORD2_1;
    u_xlat1_.x = dot(_e204.xyz, _e206.xyz);
    let _e210 = u_xlat1_;
    u_xlat1_.x = inverseSqrt(_e210.x);
    let _e213 = u_xlat3_;
    let _e215 = u_xlat1_;
    let _e217 = vs_TEXCOORD2_1;
    let _e219 = (_e215.xxx * _e217.xyz);
    u_xlat3_.x = _e219.x;
    u_xlat3_.y = _e219.y;
    u_xlat3_.z = _e219.z;
    let _e227 = u_xlat3_;
    let _e229 = u_xlat3_;
    u_xlat1_.x = (_e227.y * _e229.y);
    let _e233 = u_xlat3_;
    let _e235 = u_xlat3_;
    let _e238 = u_xlat1_;
    u_xlat1_.x = ((_e233.x * _e235.x) + -(_e238.x));
    let _e242 = u_xlat3_;
    let _e244 = u_xlat3_;
    u_xlat4_ = (_e242.yzzx * _e244.xyzz);
    let _e251 = _f_buffer1_.f_cb1_[30];
    let _e252 = u_xlat4_;
    u_xlat5_.x = dot(_e251, _e252);
    let _e258 = _f_buffer1_.f_cb1_[31];
    let _e259 = u_xlat4_;
    u_xlat5_.y = dot(_e258, _e259);
    let _e265 = _f_buffer1_.f_cb1_[32];
    let _e266 = u_xlat4_;
    u_xlat5_.z = dot(_e265, _e266);
    let _e268 = u_xlat1_;
    let _e273 = _f_buffer1_.f_cb1_[33];
    let _e275 = u_xlat1_;
    let _e278 = u_xlat5_;
    let _e280 = ((_e273.xyz * _e275.xxx) + _e278.xyz);
    u_xlat1_.x = _e280.x;
    u_xlat1_.z = _e280.y;
    u_xlat1_.w = _e280.z;
    u_xlat3_.w = 1f;
    let _e293 = _f_buffer1_.f_cb1_[27];
    let _e294 = u_xlat3_;
    u_xlat4_.x = dot(_e293, _e294);
    let _e300 = _f_buffer1_.f_cb1_[28];
    let _e301 = u_xlat3_;
    u_xlat4_.y = dot(_e300, _e301);
    let _e307 = _f_buffer1_.f_cb1_[29];
    let _e308 = u_xlat3_;
    u_xlat4_.z = dot(_e307, _e308);
    let _e311 = u_xlat3_;
    let _e316 = _f_buffer0_.f_cb0_[5];
    u_xlat8_.x = dot(_e311.xyz, _e316.xyz);
    let _e320 = u_xlat8_;
    u_xlat8_.x = clamp(_e320.x, 0f, 1f);
    let _e325 = u_xlat1_;
    let _e327 = u_xlat1_;
    let _e329 = u_xlat4_;
    let _e331 = (_e327.xzw + _e329.xyz);
    u_xlat1_.x = _e331.x;
    u_xlat1_.z = _e331.y;
    u_xlat1_.w = _e331.z;
    let _e338 = u_xlat3_;
    let _e340 = u_xlat1_;
    let _e343 = log2(abs(_e340.xzw));
    u_xlat3_.x = _e343.x;
    u_xlat3_.y = _e343.y;
    u_xlat3_.z = _e343.z;
    let _e350 = u_xlat3_;
    let _e352 = u_xlat3_;
    let _e358 = (_e352.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat3_.x = _e358.x;
    u_xlat3_.y = _e358.y;
    u_xlat3_.z = _e358.z;
    let _e365 = u_xlat3_;
    let _e367 = u_xlat3_;
    let _e369 = exp2(_e367.xyz);
    u_xlat3_.x = _e369.x;
    u_xlat3_.y = _e369.y;
    u_xlat3_.z = _e369.z;
    let _e376 = u_xlat3_;
    let _e378 = u_xlat3_;
    let _e392 = ((_e378.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat3_.x = _e392.x;
    u_xlat3_.y = _e392.y;
    u_xlat3_.z = _e392.z;
    let _e399 = u_xlatb4_;
    let _e406 = u_xlat1_;
    let _e409 = (vec4<f32>(0.0031308f, 0.0031308f, 0.0031308f, 0f) >= _e406.xzwx).xyz;
    u_xlatb4_.x = _e409.x;
    u_xlatb4_.y = _e409.y;
    u_xlatb4_.z = _e409.z;
    let _e416 = u_xlat1_;
    let _e418 = u_xlat1_;
    let _e424 = (_e418.xzw * vec3<f32>(12.92321f, 12.92321f, 12.92321f));
    u_xlat1_.x = _e424.x;
    u_xlat1_.z = _e424.y;
    u_xlat1_.w = _e424.z;
    {
        let _e431 = u_xlat1_;
        hlslcc_movcTemp = _e431;
        let _e434 = u_xlatb4_;
        if _e434.x {
            let _e436 = u_xlat1_;
            local_4 = _e436.x;
        } else {
            let _e438 = u_xlat3_;
            local_4 = _e438.x;
        }
        let _e441 = local_4;
        hlslcc_movcTemp.x = _e441;
        let _e443 = u_xlatb4_;
        if _e443.y {
            let _e445 = u_xlat1_;
            local_5 = _e445.z;
        } else {
            let _e447 = u_xlat3_;
            local_5 = _e447.y;
        }
        let _e450 = local_5;
        hlslcc_movcTemp.z = _e450;
        let _e452 = u_xlatb4_;
        if _e452.z {
            let _e454 = u_xlat1_;
            local_6 = _e454.w;
        } else {
            let _e456 = u_xlat3_;
            local_6 = _e456.z;
        }
        let _e459 = local_6;
        hlslcc_movcTemp.w = _e459;
        let _e460 = hlslcc_movcTemp;
        u_xlat1_ = _e460;
    }
    let _e461 = u_xlat3_;
    let _e466 = _f_buffer0_.f_cb0_[6];
    let _e471 = _f_buffer1_.f_cb1_[11];
    let _e473 = (_e466.xyz * _e471.zzz);
    u_xlat3_.x = _e473.x;
    u_xlat3_.y = _e473.y;
    u_xlat3_.z = _e473.z;
    let _e480 = u_xlat8_;
    let _e482 = u_xlat8_;
    let _e484 = u_xlat3_;
    let _e486 = (_e482.xxx * _e484.xyz);
    u_xlat8_.x = _e486.x;
    u_xlat8_.y = _e486.y;
    u_xlat8_.z = _e486.z;
    let _e493 = u_xlat8_;
    let _e495 = u_xlat0_;
    let _e497 = u_xlat8_;
    let _e499 = (_e495.yzw * _e497.xyz);
    u_xlat8_.x = _e499.x;
    u_xlat8_.y = _e499.y;
    u_xlat8_.z = _e499.z;
    let _e506 = u_xlat1_;
    let _e508 = u_xlat1_;
    let _e510 = u_xlat0_;
    let _e513 = u_xlat8_;
    let _e515 = ((_e508.xzw * _e510.yzw) + _e513.xyz);
    u_xlat1_.x = _e515.x;
    u_xlat1_.z = _e515.y;
    u_xlat1_.w = _e515.z;
    let _e522 = u_xlat6_;
    let _e524 = vs_TEXCOORD5_1;
    let _e526 = u_xlat0_;
    let _e529 = u_xlat1_;
    let _e531 = ((_e524.yzw * _e526.yzw) + _e529.xzw);
    u_xlat6_.x = _e531.x;
    u_xlat6_.y = _e531.y;
    u_xlat6_.z = _e531.z;
    let _e539 = u_xlatb2_;
    if _e539 {
        let _e540 = u_xlat7_;
        local_7 = _e540;
    } else {
        let _e541 = u_xlat0_;
        local_7 = _e541.x;
    }
    let _e544 = local_7;
    u_xlat0_.x = _e544;
    let _e545 = vs_TEXCOORD0_1;
    let _e550 = _f_buffer0_.f_cb0_[4];
    let _e555 = hscard_bias.values[1];
    let _e558 = textureSampleBias(f_t1_, samplerf_s1_, _e545.xy, (_e550.x + _e555.x));
    u_xlat1_ = _e558;
    let _e559 = SV_Target0_;
    let _e561 = u_xlat1_;
    let _e566 = _f_buffer2_.f_cb2_[4];
    let _e569 = u_xlat6_;
    let _e571 = ((_e561.xyz * _e566.xyz) + _e569.xyz);
    SV_Target0_.x = _e571.x;
    SV_Target0_.y = _e571.y;
    SV_Target0_.z = _e571.z;
    let _e581 = _f_buffer2_.f_cb2_[5];
    u_xlatb6_ = (_e581.y == 1f);
    let _e585 = u_xlatb6_;
    let _e586 = u_xlatb2_;
    u_xlatb6_ = (_e585 || _e586);
    let _e589 = u_xlatb6_;
    if _e589 {
        let _e590 = u_xlat0_;
        local_8 = _e590.x;
    } else {
        local_8 = 1f;
    }
    let _e594 = local_8;
    SV_Target0_.w = _e594;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(2) vs_TEXCOORD2_: vec3<f32>, @location(5) vs_TEXCOORD5_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD2_1 = vs_TEXCOORD2_;
    vs_TEXCOORD5_1 = vs_TEXCOORD5_;
    main_1();
    let _e35 = SV_Target0_;
    return FragmentOutput(_e35);
}
