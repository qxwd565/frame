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
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlatb1_: bool = false;
    var u_xlatb2_: bool = false;
    var u_xlat3_: vec4<f32> = vec4(0f);
    var u_xlat4_: vec4<f32> = vec4(0f);
    var u_xlatb4_: vec3<bool> = vec3(false);
    var u_xlat5_: vec3<f32> = vec3(0f);
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

    let _e67 = vs_TEXCOORD0_1;
    let _e72 = _f_buffer0_.f_cb0_[4];
    let _e77 = hscard_bias.values[0];
    let _e80 = textureSampleBias(f_t0_, samplerf_s0_, _e67.xy, (_e72.x + _e77.x));
    u_xlat0_ = _e80;
    let _e82 = u_xlat0_;
    let _e87 = _f_buffer2_.f_cb2_[2];
    let _e93 = _f_buffer2_.f_cb2_[5];
    u_xlat1_.x = ((_e82.w * _e87.w) + -(_e93.x));
    let _e97 = u_xlat0_;
    let _e102 = _f_buffer2_.f_cb2_[2];
    u_xlat0_ = (_e97.wxyz * _e102.wxyz);
    let _e105 = u_xlat0_;
    let _e107 = dpdx(_e105.x);
    u_xlat7_ = _e107;
    let _e108 = u_xlat0_;
    let _e110 = dpdy(_e108.x);
    u_xlat13_ = _e110;
    let _e111 = u_xlat13_;
    let _e113 = u_xlat7_;
    u_xlat7_ = (abs(_e111) + abs(_e113));
    let _e116 = u_xlat7_;
    let _e120 = u_xlat1_;
    u_xlat13_ = ((-(_e116) * 0.5f) + _e120.x);
    let _e123 = u_xlat7_;
    u_xlat7_ = max(_e123, 0.0001f);
    let _e126 = u_xlat13_;
    let _e127 = u_xlat7_;
    u_xlat7_ = (_e126 / _e127);
    let _e129 = u_xlat7_;
    u_xlat7_ = (_e129 + 1f);
    let _e132 = u_xlat7_;
    u_xlat7_ = clamp(_e132, 0f, 1f);
    let _e140 = _f_buffer2_.f_cb2_[5];
    if (0f >= _e140.x) {
        local = 4294967295u;
    } else {
        local = 0u;
    }
    let _e147 = local;
    u_xlati13_ = i32(_e147);
    let _e149 = u_xlati13_;
    if (_e149 != 0i) {
        local_1 = 1f;
    } else {
        let _e153 = u_xlat7_;
        local_1 = _e153;
    }
    let _e155 = local_1;
    u_xlat7_ = _e155;
    let _e156 = u_xlati13_;
    u_xlati13_ = ~(_e156);
    let _e158 = u_xlat7_;
    u_xlat19_ = (_e158 + -0.0001f);
    let _e165 = _f_buffer0_.f_cb0_[4];
    u_xlatb2_ = (_e165.z != 0f);
    let _e169 = u_xlatb2_;
    if _e169 {
        let _e170 = u_xlati13_;
        local_2 = _e170;
    } else {
        local_2 = 0i;
    }
    let _e174 = local_2;
    u_xlati13_ = _e174;
    let _e176 = u_xlati13_;
    if (_e176 != 0i) {
        let _e179 = u_xlat19_;
        local_3 = _e179;
    } else {
        let _e180 = u_xlat1_;
        local_3 = _e180.x;
    }
    let _e183 = local_3;
    u_xlat1_.x = _e183;
    let _e184 = u_xlat1_;
    u_xlatb1_ = (_e184.x < 0f);
    let _e188 = u_xlatb1_;
    if ((select(0i, 1i, _e188) * -1i) != 0i) {
        {
            discard;
        }
    }
    let _e198 = vs_TEXCOORD2_1;
    let _e200 = vs_TEXCOORD2_1;
    u_xlat1_.x = dot(_e198.xyz, _e200.xyz);
    let _e204 = u_xlat1_;
    u_xlat1_.x = inverseSqrt(_e204.x);
    let _e207 = u_xlat3_;
    let _e209 = u_xlat1_;
    let _e211 = vs_TEXCOORD2_1;
    let _e213 = (_e209.xxx * _e211.xyz);
    u_xlat3_.x = _e213.x;
    u_xlat3_.y = _e213.y;
    u_xlat3_.z = _e213.z;
    let _e221 = u_xlat3_;
    let _e223 = u_xlat3_;
    u_xlat1_.x = (_e221.y * _e223.y);
    let _e227 = u_xlat3_;
    let _e229 = u_xlat3_;
    let _e232 = u_xlat1_;
    u_xlat1_.x = ((_e227.x * _e229.x) + -(_e232.x));
    let _e236 = u_xlat3_;
    let _e238 = u_xlat3_;
    u_xlat4_ = (_e236.yzzx * _e238.xyzz);
    let _e245 = _f_buffer1_.f_cb1_[30];
    let _e246 = u_xlat4_;
    u_xlat5_.x = dot(_e245, _e246);
    let _e252 = _f_buffer1_.f_cb1_[31];
    let _e253 = u_xlat4_;
    u_xlat5_.y = dot(_e252, _e253);
    let _e259 = _f_buffer1_.f_cb1_[32];
    let _e260 = u_xlat4_;
    u_xlat5_.z = dot(_e259, _e260);
    let _e262 = u_xlat1_;
    let _e267 = _f_buffer1_.f_cb1_[33];
    let _e269 = u_xlat1_;
    let _e272 = u_xlat5_;
    let _e274 = ((_e267.xyz * _e269.xxx) + _e272.xyz);
    u_xlat1_.x = _e274.x;
    u_xlat1_.z = _e274.y;
    u_xlat1_.w = _e274.z;
    u_xlat3_.w = 1f;
    let _e287 = _f_buffer1_.f_cb1_[27];
    let _e288 = u_xlat3_;
    u_xlat4_.x = dot(_e287, _e288);
    let _e294 = _f_buffer1_.f_cb1_[28];
    let _e295 = u_xlat3_;
    u_xlat4_.y = dot(_e294, _e295);
    let _e301 = _f_buffer1_.f_cb1_[29];
    let _e302 = u_xlat3_;
    u_xlat4_.z = dot(_e301, _e302);
    let _e305 = u_xlat3_;
    let _e310 = _f_buffer0_.f_cb0_[5];
    u_xlat8_.x = dot(_e305.xyz, _e310.xyz);
    let _e314 = u_xlat8_;
    u_xlat8_.x = clamp(_e314.x, 0f, 1f);
    let _e319 = u_xlat1_;
    let _e321 = u_xlat1_;
    let _e323 = u_xlat4_;
    let _e325 = (_e321.xzw + _e323.xyz);
    u_xlat1_.x = _e325.x;
    u_xlat1_.z = _e325.y;
    u_xlat1_.w = _e325.z;
    let _e332 = u_xlat3_;
    let _e334 = u_xlat1_;
    let _e337 = log2(abs(_e334.xzw));
    u_xlat3_.x = _e337.x;
    u_xlat3_.y = _e337.y;
    u_xlat3_.z = _e337.z;
    let _e344 = u_xlat3_;
    let _e346 = u_xlat3_;
    let _e352 = (_e346.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat3_.x = _e352.x;
    u_xlat3_.y = _e352.y;
    u_xlat3_.z = _e352.z;
    let _e359 = u_xlat3_;
    let _e361 = u_xlat3_;
    let _e363 = exp2(_e361.xyz);
    u_xlat3_.x = _e363.x;
    u_xlat3_.y = _e363.y;
    u_xlat3_.z = _e363.z;
    let _e370 = u_xlat3_;
    let _e372 = u_xlat3_;
    let _e386 = ((_e372.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat3_.x = _e386.x;
    u_xlat3_.y = _e386.y;
    u_xlat3_.z = _e386.z;
    let _e393 = u_xlatb4_;
    let _e400 = u_xlat1_;
    let _e403 = (vec4<f32>(0.0031308f, 0.0031308f, 0.0031308f, 0f) >= _e400.xzwx).xyz;
    u_xlatb4_.x = _e403.x;
    u_xlatb4_.y = _e403.y;
    u_xlatb4_.z = _e403.z;
    let _e410 = u_xlat1_;
    let _e412 = u_xlat1_;
    let _e418 = (_e412.xzw * vec3<f32>(12.92321f, 12.92321f, 12.92321f));
    u_xlat1_.x = _e418.x;
    u_xlat1_.z = _e418.y;
    u_xlat1_.w = _e418.z;
    {
        let _e425 = u_xlat1_;
        hlslcc_movcTemp = _e425;
        let _e428 = u_xlatb4_;
        if _e428.x {
            let _e430 = u_xlat1_;
            local_4 = _e430.x;
        } else {
            let _e432 = u_xlat3_;
            local_4 = _e432.x;
        }
        let _e435 = local_4;
        hlslcc_movcTemp.x = _e435;
        let _e437 = u_xlatb4_;
        if _e437.y {
            let _e439 = u_xlat1_;
            local_5 = _e439.z;
        } else {
            let _e441 = u_xlat3_;
            local_5 = _e441.y;
        }
        let _e444 = local_5;
        hlslcc_movcTemp.z = _e444;
        let _e446 = u_xlatb4_;
        if _e446.z {
            let _e448 = u_xlat1_;
            local_6 = _e448.w;
        } else {
            let _e450 = u_xlat3_;
            local_6 = _e450.z;
        }
        let _e453 = local_6;
        hlslcc_movcTemp.w = _e453;
        let _e454 = hlslcc_movcTemp;
        u_xlat1_ = _e454;
    }
    let _e455 = u_xlat3_;
    let _e460 = _f_buffer0_.f_cb0_[6];
    let _e465 = _f_buffer1_.f_cb1_[11];
    let _e467 = (_e460.xyz * _e465.zzz);
    u_xlat3_.x = _e467.x;
    u_xlat3_.y = _e467.y;
    u_xlat3_.z = _e467.z;
    let _e474 = u_xlat8_;
    let _e476 = u_xlat8_;
    let _e478 = u_xlat3_;
    let _e480 = (_e476.xxx * _e478.xyz);
    u_xlat8_.x = _e480.x;
    u_xlat8_.y = _e480.y;
    u_xlat8_.z = _e480.z;
    let _e487 = u_xlat8_;
    let _e489 = u_xlat0_;
    let _e491 = u_xlat8_;
    let _e493 = (_e489.yzw * _e491.xyz);
    u_xlat8_.x = _e493.x;
    u_xlat8_.y = _e493.y;
    u_xlat8_.z = _e493.z;
    let _e500 = u_xlat1_;
    let _e502 = u_xlat1_;
    let _e504 = u_xlat0_;
    let _e507 = u_xlat8_;
    let _e509 = ((_e502.xzw * _e504.yzw) + _e507.xyz);
    u_xlat1_.x = _e509.x;
    u_xlat1_.z = _e509.y;
    u_xlat1_.w = _e509.z;
    let _e516 = SV_Target0_;
    let _e518 = vs_TEXCOORD5_1;
    let _e520 = u_xlat0_;
    let _e523 = u_xlat1_;
    let _e525 = ((_e518.yzw * _e520.yzw) + _e523.xzw);
    SV_Target0_.x = _e525.x;
    SV_Target0_.y = _e525.y;
    SV_Target0_.z = _e525.z;
    let _e533 = u_xlatb2_;
    if _e533 {
        let _e534 = u_xlat7_;
        local_7 = _e534;
    } else {
        let _e535 = u_xlat0_;
        local_7 = _e535.x;
    }
    let _e538 = local_7;
    u_xlat0_.x = _e538;
    let _e542 = _f_buffer2_.f_cb2_[5];
    u_xlatb6_ = (_e542.y == 1f);
    let _e546 = u_xlatb6_;
    let _e547 = u_xlatb2_;
    u_xlatb6_ = (_e546 || _e547);
    let _e550 = u_xlatb6_;
    if _e550 {
        let _e551 = u_xlat0_;
        local_8 = _e551.x;
    } else {
        local_8 = 1f;
    }
    let _e555 = local_8;
    SV_Target0_.w = _e555;
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
