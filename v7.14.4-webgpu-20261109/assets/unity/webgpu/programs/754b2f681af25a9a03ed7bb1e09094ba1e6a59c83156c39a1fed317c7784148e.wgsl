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
    var u_xlatb0_: bool = false;
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlatb2_: vec3<bool> = vec3(false);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: vec3<f32> = vec3(0f);
    var hlslcc_movcTemp: vec3<f32>;
    var local: f32;
    var local_1: f32;
    var local_2: f32;
    var local_3: f32;

    let _e48 = vs_TEXCOORD2_1;
    let _e50 = vs_TEXCOORD2_1;
    u_xlat0_.x = dot(_e48.xyz, _e50.xyz);
    let _e54 = u_xlat0_;
    u_xlat0_.x = inverseSqrt(_e54.x);
    let _e57 = u_xlat0_;
    let _e59 = u_xlat0_;
    let _e61 = vs_TEXCOORD2_1;
    let _e63 = (_e59.xxx * _e61.xyz);
    u_xlat0_.x = _e63.x;
    u_xlat0_.y = _e63.y;
    u_xlat0_.z = _e63.z;
    let _e71 = u_xlat0_;
    let _e73 = u_xlat0_;
    u_xlat1_.x = (_e71.y * _e73.y);
    let _e77 = u_xlat0_;
    let _e79 = u_xlat0_;
    let _e82 = u_xlat1_;
    u_xlat1_.x = ((_e77.x * _e79.x) + -(_e82.x));
    let _e86 = u_xlat0_;
    let _e88 = u_xlat0_;
    u_xlat2_ = (_e86.yzzx * _e88.xyzz);
    let _e95 = _f_buffer1_.f_cb1_[30];
    let _e96 = u_xlat2_;
    u_xlat3_.x = dot(_e95, _e96);
    let _e102 = _f_buffer1_.f_cb1_[31];
    let _e103 = u_xlat2_;
    u_xlat3_.y = dot(_e102, _e103);
    let _e109 = _f_buffer1_.f_cb1_[32];
    let _e110 = u_xlat2_;
    u_xlat3_.z = dot(_e109, _e110);
    let _e112 = u_xlat1_;
    let _e117 = _f_buffer1_.f_cb1_[33];
    let _e119 = u_xlat1_;
    let _e122 = u_xlat3_;
    let _e124 = ((_e117.xyz * _e119.xxx) + _e122.xyz);
    u_xlat1_.x = _e124.x;
    u_xlat1_.y = _e124.y;
    u_xlat1_.z = _e124.z;
    u_xlat0_.w = 1f;
    let _e137 = _f_buffer1_.f_cb1_[27];
    let _e138 = u_xlat0_;
    u_xlat2_.x = dot(_e137, _e138);
    let _e144 = _f_buffer1_.f_cb1_[28];
    let _e145 = u_xlat0_;
    u_xlat2_.y = dot(_e144, _e145);
    let _e151 = _f_buffer1_.f_cb1_[29];
    let _e152 = u_xlat0_;
    u_xlat2_.z = dot(_e151, _e152);
    let _e155 = u_xlat0_;
    let _e160 = _f_buffer0_.f_cb0_[5];
    u_xlat0_.x = dot(_e155.xyz, _e160.xyz);
    let _e164 = u_xlat0_;
    u_xlat0_.x = clamp(_e164.x, 0f, 1f);
    let _e169 = u_xlat4_;
    let _e171 = u_xlat1_;
    let _e173 = u_xlat2_;
    let _e175 = (_e171.xyz + _e173.xyz);
    u_xlat4_.x = _e175.x;
    u_xlat4_.y = _e175.y;
    u_xlat4_.z = _e175.z;
    let _e182 = u_xlat1_;
    let _e184 = u_xlat4_;
    let _e187 = log2(abs(_e184.xyz));
    u_xlat1_.x = _e187.x;
    u_xlat1_.y = _e187.y;
    u_xlat1_.z = _e187.z;
    let _e194 = u_xlat1_;
    let _e196 = u_xlat1_;
    let _e202 = (_e196.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat1_.x = _e202.x;
    u_xlat1_.y = _e202.y;
    u_xlat1_.z = _e202.z;
    let _e209 = u_xlat1_;
    let _e211 = u_xlat1_;
    let _e213 = exp2(_e211.xyz);
    u_xlat1_.x = _e213.x;
    u_xlat1_.y = _e213.y;
    u_xlat1_.z = _e213.z;
    let _e220 = u_xlat1_;
    let _e222 = u_xlat1_;
    let _e236 = ((_e222.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat1_.x = _e236.x;
    u_xlat1_.y = _e236.y;
    u_xlat1_.z = _e236.z;
    let _e243 = u_xlatb2_;
    let _e250 = u_xlat4_;
    let _e253 = (vec4<f32>(0.0031308f, 0.0031308f, 0.0031308f, 0f) >= _e250.xyzx).xyz;
    u_xlatb2_.x = _e253.x;
    u_xlatb2_.y = _e253.y;
    u_xlatb2_.z = _e253.z;
    let _e260 = u_xlat4_;
    let _e262 = u_xlat4_;
    let _e268 = (_e262.xyz * vec3<f32>(12.92321f, 12.92321f, 12.92321f));
    u_xlat4_.x = _e268.x;
    u_xlat4_.y = _e268.y;
    u_xlat4_.z = _e268.z;
    {
        let _e275 = u_xlat4_;
        hlslcc_movcTemp = _e275;
        let _e278 = u_xlatb2_;
        if _e278.x {
            let _e280 = u_xlat4_;
            local = _e280.x;
        } else {
            let _e282 = u_xlat1_;
            local = _e282.x;
        }
        let _e285 = local;
        hlslcc_movcTemp.x = _e285;
        let _e287 = u_xlatb2_;
        if _e287.y {
            let _e289 = u_xlat4_;
            local_1 = _e289.y;
        } else {
            let _e291 = u_xlat1_;
            local_1 = _e291.y;
        }
        let _e294 = local_1;
        hlslcc_movcTemp.y = _e294;
        let _e296 = u_xlatb2_;
        if _e296.z {
            let _e298 = u_xlat4_;
            local_2 = _e298.z;
        } else {
            let _e300 = u_xlat1_;
            local_2 = _e300.z;
        }
        let _e303 = local_2;
        hlslcc_movcTemp.z = _e303;
        let _e304 = hlslcc_movcTemp;
        u_xlat4_ = _e304;
    }
    let _e305 = u_xlat1_;
    let _e310 = _f_buffer0_.f_cb0_[6];
    let _e315 = _f_buffer1_.f_cb1_[11];
    let _e317 = (_e310.xyz * _e315.zzz);
    u_xlat1_.x = _e317.x;
    u_xlat1_.y = _e317.y;
    u_xlat1_.z = _e317.z;
    let _e324 = u_xlat1_;
    let _e326 = u_xlat0_;
    let _e328 = u_xlat1_;
    let _e330 = (_e326.xxx * _e328.xyz);
    u_xlat1_.x = _e330.x;
    u_xlat1_.y = _e330.y;
    u_xlat1_.z = _e330.z;
    let _e337 = vs_TEXCOORD0_1;
    let _e342 = _f_buffer0_.f_cb0_[4];
    let _e347 = hscard_bias.values[0];
    let _e350 = textureSampleBias(f_t0_, samplerf_s0_, _e337.xy, (_e342.x + _e347.x));
    u_xlat2_ = _e350;
    let _e351 = u_xlat2_;
    let _e356 = _f_buffer2_.f_cb2_[2];
    u_xlat2_ = (_e351.wxyz * _e356.wxyz);
    let _e359 = u_xlat1_;
    let _e361 = u_xlat1_;
    let _e363 = u_xlat2_;
    let _e365 = (_e361.xyz * _e363.yzw);
    u_xlat1_.x = _e365.x;
    u_xlat1_.y = _e365.y;
    u_xlat1_.z = _e365.z;
    let _e372 = u_xlat0_;
    let _e374 = u_xlat4_;
    let _e376 = u_xlat2_;
    let _e379 = u_xlat1_;
    let _e381 = ((_e374.xyz * _e376.yzw) + _e379.xyz);
    u_xlat0_.x = _e381.x;
    u_xlat0_.y = _e381.y;
    u_xlat0_.z = _e381.z;
    let _e388 = u_xlat0_;
    let _e390 = vs_TEXCOORD5_1;
    let _e392 = u_xlat2_;
    let _e395 = u_xlat0_;
    let _e397 = ((_e390.yzw * _e392.yzw) + _e395.xyz);
    u_xlat0_.x = _e397.x;
    u_xlat0_.y = _e397.y;
    u_xlat0_.z = _e397.z;
    let _e404 = vs_TEXCOORD0_1;
    let _e409 = _f_buffer0_.f_cb0_[4];
    let _e414 = hscard_bias.values[1];
    let _e417 = textureSampleBias(f_t1_, samplerf_s1_, _e404.xy, (_e409.x + _e414.x));
    u_xlat1_ = _e417;
    let _e418 = SV_Target0_;
    let _e420 = u_xlat1_;
    let _e425 = _f_buffer2_.f_cb2_[4];
    let _e428 = u_xlat0_;
    let _e430 = ((_e420.xyz * _e425.xyz) + _e428.xyz);
    SV_Target0_.x = _e430.x;
    SV_Target0_.y = _e430.y;
    SV_Target0_.z = _e430.z;
    let _e440 = _f_buffer2_.f_cb2_[5];
    u_xlatb0_ = (_e440.y == 1f);
    let _e445 = u_xlatb0_;
    if _e445 {
        let _e446 = u_xlat2_;
        local_3 = _e446.x;
    } else {
        local_3 = 1f;
    }
    let _e450 = local_3;
    SV_Target0_.w = _e450;
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
