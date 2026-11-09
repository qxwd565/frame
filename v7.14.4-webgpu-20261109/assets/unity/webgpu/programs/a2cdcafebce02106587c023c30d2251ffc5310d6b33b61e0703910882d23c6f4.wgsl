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
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD2_1: vec3<f32>;
var<private> vs_TEXCOORD5_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlatb0_: bool = false;
    var u_xlat1_: vec3<f32> = vec3(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlatb2_: vec3<bool> = vec3(false);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: vec3<f32> = vec3(0f);
    var hlslcc_movcTemp: vec3<f32>;
    var local: f32;
    var local_1: f32;
    var local_2: f32;
    var local_3: f32;

    let _e46 = vs_TEXCOORD2_1;
    let _e48 = vs_TEXCOORD2_1;
    u_xlat0_.x = dot(_e46.xyz, _e48.xyz);
    let _e52 = u_xlat0_;
    u_xlat0_.x = inverseSqrt(_e52.x);
    let _e55 = u_xlat0_;
    let _e57 = u_xlat0_;
    let _e59 = vs_TEXCOORD2_1;
    let _e61 = (_e57.xxx * _e59.xyz);
    u_xlat0_.x = _e61.x;
    u_xlat0_.y = _e61.y;
    u_xlat0_.z = _e61.z;
    let _e69 = u_xlat0_;
    let _e71 = u_xlat0_;
    u_xlat1_.x = (_e69.y * _e71.y);
    let _e75 = u_xlat0_;
    let _e77 = u_xlat0_;
    let _e80 = u_xlat1_;
    u_xlat1_.x = ((_e75.x * _e77.x) + -(_e80.x));
    let _e84 = u_xlat0_;
    let _e86 = u_xlat0_;
    u_xlat2_ = (_e84.yzzx * _e86.xyzz);
    let _e93 = _f_buffer1_.f_cb1_[30];
    let _e94 = u_xlat2_;
    u_xlat3_.x = dot(_e93, _e94);
    let _e100 = _f_buffer1_.f_cb1_[31];
    let _e101 = u_xlat2_;
    u_xlat3_.y = dot(_e100, _e101);
    let _e107 = _f_buffer1_.f_cb1_[32];
    let _e108 = u_xlat2_;
    u_xlat3_.z = dot(_e107, _e108);
    let _e110 = u_xlat1_;
    let _e115 = _f_buffer1_.f_cb1_[33];
    let _e117 = u_xlat1_;
    let _e120 = u_xlat3_;
    let _e122 = ((_e115.xyz * _e117.xxx) + _e120.xyz);
    u_xlat1_.x = _e122.x;
    u_xlat1_.y = _e122.y;
    u_xlat1_.z = _e122.z;
    u_xlat0_.w = 1f;
    let _e135 = _f_buffer1_.f_cb1_[27];
    let _e136 = u_xlat0_;
    u_xlat2_.x = dot(_e135, _e136);
    let _e142 = _f_buffer1_.f_cb1_[28];
    let _e143 = u_xlat0_;
    u_xlat2_.y = dot(_e142, _e143);
    let _e149 = _f_buffer1_.f_cb1_[29];
    let _e150 = u_xlat0_;
    u_xlat2_.z = dot(_e149, _e150);
    let _e153 = u_xlat0_;
    let _e158 = _f_buffer0_.f_cb0_[5];
    u_xlat0_.x = dot(_e153.xyz, _e158.xyz);
    let _e162 = u_xlat0_;
    u_xlat0_.x = clamp(_e162.x, 0f, 1f);
    let _e167 = u_xlat4_;
    let _e169 = u_xlat1_;
    let _e171 = u_xlat2_;
    let _e173 = (_e169.xyz + _e171.xyz);
    u_xlat4_.x = _e173.x;
    u_xlat4_.y = _e173.y;
    u_xlat4_.z = _e173.z;
    let _e180 = u_xlat1_;
    let _e182 = u_xlat4_;
    let _e185 = log2(abs(_e182.xyz));
    u_xlat1_.x = _e185.x;
    u_xlat1_.y = _e185.y;
    u_xlat1_.z = _e185.z;
    let _e192 = u_xlat1_;
    let _e194 = u_xlat1_;
    let _e200 = (_e194.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat1_.x = _e200.x;
    u_xlat1_.y = _e200.y;
    u_xlat1_.z = _e200.z;
    let _e207 = u_xlat1_;
    let _e209 = u_xlat1_;
    let _e211 = exp2(_e209.xyz);
    u_xlat1_.x = _e211.x;
    u_xlat1_.y = _e211.y;
    u_xlat1_.z = _e211.z;
    let _e218 = u_xlat1_;
    let _e220 = u_xlat1_;
    let _e234 = ((_e220.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat1_.x = _e234.x;
    u_xlat1_.y = _e234.y;
    u_xlat1_.z = _e234.z;
    let _e241 = u_xlatb2_;
    let _e248 = u_xlat4_;
    let _e251 = (vec4<f32>(0.0031308f, 0.0031308f, 0.0031308f, 0f) >= _e248.xyzx).xyz;
    u_xlatb2_.x = _e251.x;
    u_xlatb2_.y = _e251.y;
    u_xlatb2_.z = _e251.z;
    let _e258 = u_xlat4_;
    let _e260 = u_xlat4_;
    let _e266 = (_e260.xyz * vec3<f32>(12.92321f, 12.92321f, 12.92321f));
    u_xlat4_.x = _e266.x;
    u_xlat4_.y = _e266.y;
    u_xlat4_.z = _e266.z;
    {
        let _e273 = u_xlat4_;
        hlslcc_movcTemp = _e273;
        let _e276 = u_xlatb2_;
        if _e276.x {
            let _e278 = u_xlat4_;
            local = _e278.x;
        } else {
            let _e280 = u_xlat1_;
            local = _e280.x;
        }
        let _e283 = local;
        hlslcc_movcTemp.x = _e283;
        let _e285 = u_xlatb2_;
        if _e285.y {
            let _e287 = u_xlat4_;
            local_1 = _e287.y;
        } else {
            let _e289 = u_xlat1_;
            local_1 = _e289.y;
        }
        let _e292 = local_1;
        hlslcc_movcTemp.y = _e292;
        let _e294 = u_xlatb2_;
        if _e294.z {
            let _e296 = u_xlat4_;
            local_2 = _e296.z;
        } else {
            let _e298 = u_xlat1_;
            local_2 = _e298.z;
        }
        let _e301 = local_2;
        hlslcc_movcTemp.z = _e301;
        let _e302 = hlslcc_movcTemp;
        u_xlat4_ = _e302;
    }
    let _e303 = u_xlat1_;
    let _e308 = _f_buffer0_.f_cb0_[6];
    let _e313 = _f_buffer1_.f_cb1_[11];
    let _e315 = (_e308.xyz * _e313.zzz);
    u_xlat1_.x = _e315.x;
    u_xlat1_.y = _e315.y;
    u_xlat1_.z = _e315.z;
    let _e322 = u_xlat1_;
    let _e324 = u_xlat0_;
    let _e326 = u_xlat1_;
    let _e328 = (_e324.xxx * _e326.xyz);
    u_xlat1_.x = _e328.x;
    u_xlat1_.y = _e328.y;
    u_xlat1_.z = _e328.z;
    let _e335 = vs_TEXCOORD0_1;
    let _e340 = _f_buffer0_.f_cb0_[4];
    let _e345 = hscard_bias.values[0];
    let _e348 = textureSampleBias(f_t0_, samplerf_s0_, _e335.xy, (_e340.x + _e345.x));
    u_xlat2_ = _e348;
    let _e349 = u_xlat2_;
    let _e354 = _f_buffer2_.f_cb2_[2];
    u_xlat2_ = (_e349.wxyz * _e354.wxyz);
    let _e357 = u_xlat1_;
    let _e359 = u_xlat1_;
    let _e361 = u_xlat2_;
    let _e363 = (_e359.xyz * _e361.yzw);
    u_xlat1_.x = _e363.x;
    u_xlat1_.y = _e363.y;
    u_xlat1_.z = _e363.z;
    let _e370 = u_xlat0_;
    let _e372 = u_xlat4_;
    let _e374 = u_xlat2_;
    let _e377 = u_xlat1_;
    let _e379 = ((_e372.xyz * _e374.yzw) + _e377.xyz);
    u_xlat0_.x = _e379.x;
    u_xlat0_.y = _e379.y;
    u_xlat0_.z = _e379.z;
    let _e386 = SV_Target0_;
    let _e388 = vs_TEXCOORD5_1;
    let _e390 = u_xlat2_;
    let _e393 = u_xlat0_;
    let _e395 = ((_e388.yzw * _e390.yzw) + _e393.xyz);
    SV_Target0_.x = _e395.x;
    SV_Target0_.y = _e395.y;
    SV_Target0_.z = _e395.z;
    let _e405 = _f_buffer2_.f_cb2_[5];
    u_xlatb0_ = (_e405.y == 1f);
    let _e410 = u_xlatb0_;
    if _e410 {
        let _e411 = u_xlat2_;
        local_3 = _e411.x;
    } else {
        local_3 = 1f;
    }
    let _e415 = local_3;
    SV_Target0_.w = _e415;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(2) vs_TEXCOORD2_: vec3<f32>, @location(5) vs_TEXCOORD5_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD2_1 = vs_TEXCOORD2_;
    vs_TEXCOORD5_1 = vs_TEXCOORD5_;
    main_1();
    let _e31 = SV_Target0_;
    return FragmentOutput(_e31);
}
