struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 30>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 25>,
}

struct v_buffer3_ {
    v_cb3_: array<vec4<f32>, 5>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec4<f32>,
    @location(2) vs_TEXCOORD2_: vec3<f32>,
    @location(3) vs_TEXCOORD3_: vec3<f32>,
    @location(4) vs_TEXCOORD4_: vec4<f32>,
    @location(5) vs_TEXCOORD5_: vec3<f32>,
    @location(12) vs_NORMAL0_: vec3<f32>,
    @location(10) vs_COLOR0_: vec4<f32>,
    @builtin(position) gl_Position: vec4<f32>,
}

@group(0) @binding(0) 
var<uniform> _v_buffer0_: v_buffer0_;
@group(0) @binding(1) 
var<uniform> _v_buffer1_: v_buffer1_;
@group(0) @binding(2) 
var<uniform> _v_buffer2_: v_buffer2_;
@group(0) @binding(3) 
var<uniform> _v_buffer3_: v_buffer3_;
var<private> in_POSITION0_1: vec4<f32>;
var<private> in_TEXCOORD0_1: vec2<f32>;
var<private> in_TEXCOORD1_1: vec2<f32>;
var<private> in_NORMAL0_1: vec3<f32>;
var<private> vs_TEXCOORD0_: vec4<f32>;
var<private> vs_TEXCOORD2_: vec3<f32>;
var<private> vs_TEXCOORD3_: vec3<f32>;
var<private> vs_TEXCOORD4_: vec4<f32>;
var<private> vs_TEXCOORD5_: vec3<f32>;
var<private> vs_NORMAL0_: vec3<f32>;
var<private> vs_COLOR0_: vec4<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlatb1_: vec4<bool> = vec4(false);
    var u_xlat2_: vec3<f32> = vec3(0f);
    var u_xlat9_: f32 = 0f;
    var u_xlati9_: i32 = 0i;
    var u_xlatu9_: u32 = 0u;
    var local: f32;
    var local_1: f32;
    var local_2: f32;
    var local_3: f32;
    var local_4: f32;
    var local_5: f32;
    var local_6: f32;

    let _e48 = in_POSITION0_1;
    let _e53 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e48.yyyy * _e53);
    let _e58 = _v_buffer1_.v_cb1_[0];
    let _e59 = in_POSITION0_1;
    let _e62 = u_xlat0_;
    u_xlat0_ = ((_e58 * _e59.xxxx) + _e62);
    let _e67 = _v_buffer1_.v_cb1_[2];
    let _e68 = in_POSITION0_1;
    let _e71 = u_xlat0_;
    u_xlat0_ = ((_e67 * _e68.zzzz) + _e71);
    let _e73 = u_xlat0_;
    let _e77 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e73 + _e77);
    let _e79 = u_xlat0_;
    let _e84 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e79.yyyy * _e84);
    let _e89 = _v_buffer0_.v_cb0_[79];
    let _e90 = u_xlat0_;
    let _e93 = u_xlat1_;
    u_xlat1_ = ((_e89 * _e90.xxxx) + _e93);
    let _e98 = _v_buffer0_.v_cb0_[81];
    let _e99 = u_xlat0_;
    let _e102 = u_xlat1_;
    u_xlat1_ = ((_e98 * _e99.zzzz) + _e102);
    let _e108 = _v_buffer0_.v_cb0_[82];
    let _e109 = u_xlat0_;
    let _e112 = u_xlat1_;
    gl_Position = ((_e108 * _e109.wwww) + _e112);
    let _e114 = vs_TEXCOORD0_;
    let _e116 = in_TEXCOORD0_1;
    let _e117 = _e116.xy;
    vs_TEXCOORD0_.x = _e117.x;
    vs_TEXCOORD0_.y = _e117.y;
    let _e122 = vs_TEXCOORD0_;
    let _e124 = in_TEXCOORD1_1;
    let _e125 = _e124.xy;
    vs_TEXCOORD0_.z = _e125.x;
    vs_TEXCOORD0_.w = _e125.y;
    let _e130 = vs_TEXCOORD2_;
    let _e132 = u_xlat0_;
    let _e138 = _v_buffer0_.v_cb0_[21];
    let _e140 = (-(_e132.xyz) + _e138.xyz);
    vs_TEXCOORD2_.x = _e140.x;
    vs_TEXCOORD2_.y = _e140.y;
    vs_TEXCOORD2_.z = _e140.z;
    let _e147 = vs_TEXCOORD3_;
    let _e149 = u_xlat0_;
    let _e155 = _v_buffer0_.v_cb0_[5];
    let _e157 = (-(_e149.xyz) + _e155.xyz);
    vs_TEXCOORD3_.x = _e157.x;
    vs_TEXCOORD3_.y = _e157.y;
    vs_TEXCOORD3_.z = _e157.z;
    let _e164 = u_xlat1_;
    let _e166 = u_xlat0_;
    let _e171 = _v_buffer2_.v_cb2_[20];
    let _e174 = (_e166.xyz + -(_e171.xyz));
    u_xlat1_.x = _e174.x;
    u_xlat1_.y = _e174.y;
    u_xlat1_.z = _e174.z;
    let _e182 = u_xlat1_;
    let _e184 = u_xlat1_;
    u_xlat1_.x = dot(_e182.xyz, _e184.xyz);
    let _e187 = u_xlat2_;
    let _e189 = u_xlat0_;
    let _e194 = _v_buffer2_.v_cb2_[21];
    let _e197 = (_e189.xyz + -(_e194.xyz));
    u_xlat2_.x = _e197.x;
    u_xlat2_.y = _e197.y;
    u_xlat2_.z = _e197.z;
    let _e205 = u_xlat2_;
    let _e207 = u_xlat2_;
    u_xlat1_.y = dot(_e205.xyz, _e207.xyz);
    let _e210 = u_xlat2_;
    let _e212 = u_xlat0_;
    let _e217 = _v_buffer2_.v_cb2_[22];
    let _e220 = (_e212.xyz + -(_e217.xyz));
    u_xlat2_.x = _e220.x;
    u_xlat2_.y = _e220.y;
    u_xlat2_.z = _e220.z;
    let _e228 = u_xlat2_;
    let _e230 = u_xlat2_;
    u_xlat1_.z = dot(_e228.xyz, _e230.xyz);
    let _e233 = u_xlat2_;
    let _e235 = u_xlat0_;
    let _e240 = _v_buffer2_.v_cb2_[23];
    let _e243 = (_e235.xyz + -(_e240.xyz));
    u_xlat2_.x = _e243.x;
    u_xlat2_.y = _e243.y;
    u_xlat2_.z = _e243.z;
    let _e251 = u_xlat2_;
    let _e253 = u_xlat2_;
    u_xlat1_.w = dot(_e251.xyz, _e253.xyz);
    let _e256 = u_xlat1_;
    let _e260 = _v_buffer2_.v_cb2_[24];
    u_xlatb1_ = (_e256 < _e260);
    let _e263 = u_xlatb1_;
    if _e263.x {
        local = -1f;
    } else {
        local = -0f;
    }
    let _e272 = local;
    u_xlat2_.x = _e272;
    let _e274 = u_xlatb1_;
    if _e274.y {
        local_1 = -1f;
    } else {
        local_1 = -0f;
    }
    let _e283 = local_1;
    u_xlat2_.y = _e283;
    let _e285 = u_xlatb1_;
    if _e285.z {
        local_2 = -1f;
    } else {
        local_2 = -0f;
    }
    let _e294 = local_2;
    u_xlat2_.z = _e294;
    let _e296 = u_xlatb1_;
    if _e296.x {
        local_3 = 1f;
    } else {
        local_3 = 0f;
    }
    let _e302 = local_3;
    u_xlat1_.x = _e302;
    let _e304 = u_xlatb1_;
    if _e304.y {
        local_4 = 1f;
    } else {
        local_4 = 0f;
    }
    let _e310 = local_4;
    u_xlat1_.y = _e310;
    let _e312 = u_xlatb1_;
    if _e312.z {
        local_5 = 1f;
    } else {
        local_5 = 0f;
    }
    let _e318 = local_5;
    u_xlat1_.z = _e318;
    let _e320 = u_xlatb1_;
    if _e320.w {
        local_6 = 1f;
    } else {
        local_6 = 0f;
    }
    let _e326 = local_6;
    u_xlat1_.w = _e326;
    let _e327 = u_xlat2_;
    let _e329 = u_xlat2_;
    let _e331 = u_xlat1_;
    let _e333 = (_e329.xyz + _e331.yzw);
    u_xlat2_.x = _e333.x;
    u_xlat2_.y = _e333.y;
    u_xlat2_.z = _e333.z;
    let _e340 = u_xlat1_;
    let _e342 = u_xlat2_;
    let _e348 = max(_e342.xyz, vec3<f32>(0f, 0f, 0f));
    u_xlat1_.y = _e348.x;
    u_xlat1_.z = _e348.y;
    u_xlat1_.w = _e348.z;
    let _e355 = u_xlat1_;
    u_xlat9_ = dot(_e355, vec4<f32>(4f, 3f, 2f, 1f));
    let _e362 = u_xlat9_;
    u_xlat9_ = (-(_e362) + 4f);
    let _e366 = u_xlat9_;
    u_xlatu9_ = u32(_e366);
    let _e368 = u_xlatu9_;
    u_xlati9_ = (i32(_e368) << 2u);
    let _e373 = u_xlat1_;
    let _e375 = u_xlat0_;
    let _e377 = u_xlati9_;
    let _e382 = _v_buffer2_.v_cb2_[(_e377 + 1i)];
    let _e384 = (_e375.yyy * _e382.xyz);
    u_xlat1_.x = _e384.x;
    u_xlat1_.y = _e384.y;
    u_xlat1_.z = _e384.z;
    let _e391 = u_xlat1_;
    let _e393 = u_xlati9_;
    let _e396 = _v_buffer2_.v_cb2_[_e393];
    let _e398 = u_xlat0_;
    let _e401 = u_xlat1_;
    let _e403 = ((_e396.xyz * _e398.xxx) + _e401.xyz);
    u_xlat1_.x = _e403.x;
    u_xlat1_.y = _e403.y;
    u_xlat1_.z = _e403.z;
    let _e410 = u_xlat1_;
    let _e412 = u_xlati9_;
    let _e417 = _v_buffer2_.v_cb2_[(_e412 + 2i)];
    let _e419 = u_xlat0_;
    let _e422 = u_xlat1_;
    let _e424 = ((_e417.xyz * _e419.zzz) + _e422.xyz);
    u_xlat1_.x = _e424.x;
    u_xlat1_.y = _e424.y;
    u_xlat1_.z = _e424.z;
    let _e431 = vs_TEXCOORD4_;
    let _e433 = u_xlat1_;
    let _e435 = u_xlati9_;
    let _e440 = _v_buffer2_.v_cb2_[(_e435 + 3i)];
    let _e442 = (_e433.xyz + _e440.xyz);
    vs_TEXCOORD4_.x = _e442.x;
    vs_TEXCOORD4_.y = _e442.y;
    vs_TEXCOORD4_.z = _e442.z;
    let _e449 = vs_TEXCOORD5_;
    let _e451 = u_xlat0_;
    let _e452 = _e451.xyz;
    vs_TEXCOORD5_.x = _e452.x;
    vs_TEXCOORD5_.y = _e452.y;
    vs_TEXCOORD5_.z = _e452.z;
    vs_TEXCOORD4_.w = 0f;
    let _e462 = in_NORMAL0_1;
    let _e467 = _v_buffer1_.v_cb1_[4];
    u_xlat0_.x = dot(_e462.xyz, _e467.xyz);
    let _e471 = in_NORMAL0_1;
    let _e476 = _v_buffer1_.v_cb1_[5];
    u_xlat0_.y = dot(_e471.xyz, _e476.xyz);
    let _e480 = in_NORMAL0_1;
    let _e485 = _v_buffer1_.v_cb1_[6];
    u_xlat0_.z = dot(_e480.xyz, _e485.xyz);
    let _e488 = u_xlat0_;
    let _e490 = u_xlat0_;
    u_xlat9_ = dot(_e488.xyz, _e490.xyz);
    let _e493 = u_xlat9_;
    u_xlat9_ = max(_e493, 0.000000000000000000000000000000000000011754944f);
    let _e496 = u_xlat9_;
    u_xlat9_ = inverseSqrt(_e496);
    let _e498 = vs_NORMAL0_;
    let _e500 = u_xlat9_;
    let _e502 = u_xlat0_;
    let _e504 = (vec3(_e500) * _e502.xyz);
    vs_NORMAL0_.x = _e504.x;
    vs_NORMAL0_.y = _e504.y;
    vs_NORMAL0_.z = _e504.z;
    let _e515 = _v_buffer1_.v_cb1_[27];
    u_xlat0_.x = abs(_e515.w);
    let _e522 = _v_buffer1_.v_cb1_[28];
    u_xlat0_.y = abs(_e522.w);
    let _e529 = _v_buffer1_.v_cb1_[29];
    u_xlat0_.z = abs(_e529.w);
    let _e532 = u_xlat0_;
    let _e534 = u_xlat0_;
    let _e536 = log2(_e534.xyz);
    u_xlat0_.x = _e536.x;
    u_xlat0_.y = _e536.y;
    u_xlat0_.z = _e536.z;
    let _e543 = u_xlat0_;
    let _e545 = u_xlat0_;
    let _e551 = (_e545.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat0_.x = _e551.x;
    u_xlat0_.y = _e551.y;
    u_xlat0_.z = _e551.z;
    let _e558 = u_xlat0_;
    let _e560 = u_xlat0_;
    let _e562 = exp2(_e560.xyz);
    u_xlat0_.x = _e562.x;
    u_xlat0_.y = _e562.y;
    u_xlat0_.z = _e562.z;
    let _e569 = u_xlat0_;
    let _e571 = u_xlat0_;
    let _e585 = ((_e571.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat0_.x = _e585.x;
    u_xlat0_.y = _e585.y;
    u_xlat0_.z = _e585.z;
    let _e592 = u_xlat0_;
    let _e594 = u_xlat0_;
    let _e600 = clamp(_e594.xyz, vec3(0f), vec3(1f));
    u_xlat0_.x = _e600.x;
    u_xlat0_.y = _e600.y;
    u_xlat0_.z = _e600.z;
    let _e607 = u_xlat0_;
    let _e609 = u_xlat0_;
    let _e614 = _v_buffer0_.v_cb0_[6];
    let _e616 = (_e609.xyz + _e614.xyz);
    u_xlat0_.x = _e616.x;
    u_xlat0_.y = _e616.y;
    u_xlat0_.z = _e616.z;
    let _e623 = u_xlat0_;
    let _e625 = u_xlat0_;
    let _e634 = (_e625.xyz + vec3<f32>(-1f, -1f, -1f));
    u_xlat0_.x = _e634.x;
    u_xlat0_.y = _e634.y;
    u_xlat0_.z = _e634.z;
    u_xlat0_.w = 0f;
    let _e646 = _v_buffer3_.v_cb3_[4];
    let _e648 = u_xlat0_;
    u_xlat0_ = ((_e646.zzzz * _e648) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e656 = u_xlat0_;
    let _e660 = _v_buffer3_.v_cb3_[1];
    vs_COLOR0_ = (_e656 * _e660);
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(5) in_TEXCOORD1_: vec2<f32>, @location(1) in_NORMAL0_: vec3<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_TEXCOORD1_1 = in_TEXCOORD1_;
    in_NORMAL0_1 = in_NORMAL0_;
    main_1();
    let _e43 = vs_TEXCOORD0_;
    let _e45 = vs_TEXCOORD2_;
    let _e47 = vs_TEXCOORD3_;
    let _e49 = vs_TEXCOORD4_;
    let _e51 = vs_TEXCOORD5_;
    let _e53 = vs_NORMAL0_;
    let _e55 = vs_COLOR0_;
    let _e57 = gl_Position;
    return VertexOutput(_e43, _e45, _e47, _e49, _e51, _e53, _e55, _e57);
}
