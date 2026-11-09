struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 10>,
}

struct v_buffer2_ {
    v_cb2_: vec4<f32>,
}

struct v_buffer3_ {
    v_cb3_: array<vec4<f32>, 4>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec2<f32>,
    @location(5) vs_TEXCOORD5_: f32,
    @location(1) vs_TEXCOORD1_: vec3<f32>,
    @location(2) vs_TEXCOORD2_: vec4<f32>,
    @location(3) vs_TEXCOORD3_: vec4<f32>,
    @location(4) vs_TEXCOORD4_: vec4<f32>,
    @location(6) vs_TEXCOORD6_: vec4<f32>,
    @location(7) vs_TEXCOORD7_: vec3<f32>,
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
var<private> in_NORMAL0_1: vec3<f32>;
var<private> in_TANGENT0_1: vec4<f32>;
var<private> in_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD0_: vec2<f32>;
var<private> vs_TEXCOORD5_: f32;
var<private> vs_TEXCOORD1_: vec3<f32>;
var<private> vs_TEXCOORD2_: vec4<f32>;
var<private> vs_TEXCOORD3_: vec4<f32>;
var<private> vs_TEXCOORD4_: vec4<f32>;
var<private> vs_TEXCOORD6_: vec4<f32>;
var<private> vs_TEXCOORD7_: vec3<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec3<f32> = vec3(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat12_: f32 = 0f;
    var u_xlatb12_: bool = false;
    var u_xlat13_: f32 = 0f;
    var local: f32;
    var local_1: f32;
    var local_2: f32;
    var local_3: f32;

    let _e49 = vs_TEXCOORD0_;
    let _e51 = in_TEXCOORD0_1;
    let _e53 = _v_buffer2_;
    let _e57 = _v_buffer2_;
    let _e60 = ((_e51.xy * _e53.v_cb2_.xy) + _e57.v_cb2_.zw);
    vs_TEXCOORD0_.x = _e60.x;
    vs_TEXCOORD0_.y = _e60.y;
    vs_TEXCOORD5_ = 0f;
    let _e66 = u_xlat0_;
    let _e68 = in_POSITION0_1;
    let _e73 = _v_buffer1_.v_cb1_[1];
    let _e75 = (_e68.yyy * _e73.xyz);
    u_xlat0_.x = _e75.x;
    u_xlat0_.y = _e75.y;
    u_xlat0_.z = _e75.z;
    let _e82 = u_xlat0_;
    let _e87 = _v_buffer1_.v_cb1_[0];
    let _e89 = in_POSITION0_1;
    let _e92 = u_xlat0_;
    let _e94 = ((_e87.xyz * _e89.xxx) + _e92.xyz);
    u_xlat0_.x = _e94.x;
    u_xlat0_.y = _e94.y;
    u_xlat0_.z = _e94.z;
    let _e101 = u_xlat0_;
    let _e106 = _v_buffer1_.v_cb1_[2];
    let _e108 = in_POSITION0_1;
    let _e111 = u_xlat0_;
    let _e113 = ((_e106.xyz * _e108.zzz) + _e111.xyz);
    u_xlat0_.x = _e113.x;
    u_xlat0_.y = _e113.y;
    u_xlat0_.z = _e113.z;
    let _e120 = u_xlat0_;
    let _e122 = u_xlat0_;
    let _e127 = _v_buffer1_.v_cb1_[3];
    let _e129 = (_e122.xyz + _e127.xyz);
    u_xlat0_.x = _e129.x;
    u_xlat0_.y = _e129.y;
    u_xlat0_.z = _e129.z;
    let _e136 = vs_TEXCOORD1_;
    let _e138 = u_xlat0_;
    let _e139 = _e138.xyz;
    vs_TEXCOORD1_.x = _e139.x;
    vs_TEXCOORD1_.y = _e139.y;
    vs_TEXCOORD1_.z = _e139.z;
    let _e147 = in_NORMAL0_1;
    let _e152 = _v_buffer1_.v_cb1_[4];
    u_xlat1_.x = dot(_e147.xyz, _e152.xyz);
    let _e156 = in_NORMAL0_1;
    let _e161 = _v_buffer1_.v_cb1_[5];
    u_xlat1_.y = dot(_e156.xyz, _e161.xyz);
    let _e165 = in_NORMAL0_1;
    let _e170 = _v_buffer1_.v_cb1_[6];
    u_xlat1_.z = dot(_e165.xyz, _e170.xyz);
    let _e173 = u_xlat1_;
    let _e175 = u_xlat1_;
    u_xlat12_ = dot(_e173.xyz, _e175.xyz);
    let _e178 = u_xlat12_;
    u_xlat12_ = max(_e178, 0.000000000000000000000000000000000000011754944f);
    let _e181 = u_xlat12_;
    u_xlat12_ = inverseSqrt(_e181);
    let _e183 = u_xlat1_;
    let _e185 = u_xlat12_;
    let _e187 = u_xlat1_;
    let _e189 = (vec3(_e185) * _e187.xyz);
    u_xlat1_.x = _e189.x;
    u_xlat1_.y = _e189.y;
    u_xlat1_.z = _e189.z;
    let _e196 = vs_TEXCOORD2_;
    let _e198 = u_xlat1_;
    let _e199 = _e198.xyz;
    vs_TEXCOORD2_.x = _e199.x;
    vs_TEXCOORD2_.y = _e199.y;
    vs_TEXCOORD2_.z = _e199.z;
    let _e206 = u_xlat2_;
    let _e208 = u_xlat0_;
    let _e214 = _v_buffer0_.v_cb0_[21];
    let _e216 = (-(_e208.xyz) + _e214.xyz);
    u_xlat2_.x = _e216.x;
    u_xlat2_.y = _e216.y;
    u_xlat2_.z = _e216.z;
    let _e226 = _v_buffer0_.v_cb0_[25];
    u_xlatb12_ = (_e226.w == 0f);
    let _e231 = u_xlatb12_;
    if _e231 {
        let _e232 = u_xlat2_;
        local = _e232.x;
    } else {
        let _e237 = _v_buffer0_.v_cb0_[67];
        local = _e237.z;
    }
    let _e240 = local;
    vs_TEXCOORD2_.w = _e240;
    let _e241 = u_xlat3_;
    let _e243 = in_TANGENT0_1;
    let _e248 = _v_buffer1_.v_cb1_[1];
    let _e250 = (_e243.yyy * _e248.xyz);
    u_xlat3_.x = _e250.x;
    u_xlat3_.y = _e250.y;
    u_xlat3_.z = _e250.z;
    let _e257 = u_xlat3_;
    let _e262 = _v_buffer1_.v_cb1_[0];
    let _e264 = in_TANGENT0_1;
    let _e267 = u_xlat3_;
    let _e269 = ((_e262.xyz * _e264.xxx) + _e267.xyz);
    u_xlat3_.x = _e269.x;
    u_xlat3_.y = _e269.y;
    u_xlat3_.z = _e269.z;
    let _e276 = u_xlat3_;
    let _e281 = _v_buffer1_.v_cb1_[2];
    let _e283 = in_TANGENT0_1;
    let _e286 = u_xlat3_;
    let _e288 = ((_e281.xyz * _e283.zzz) + _e286.xyz);
    u_xlat3_.x = _e288.x;
    u_xlat3_.y = _e288.y;
    u_xlat3_.z = _e288.z;
    let _e295 = u_xlat3_;
    let _e297 = u_xlat3_;
    u_xlat13_ = dot(_e295.xyz, _e297.xyz);
    let _e300 = u_xlat13_;
    u_xlat13_ = max(_e300, 0.000000000000000000000000000000000000011754944f);
    let _e303 = u_xlat13_;
    u_xlat13_ = inverseSqrt(_e303);
    let _e305 = u_xlat3_;
    let _e307 = u_xlat13_;
    let _e309 = u_xlat3_;
    let _e311 = (vec3(_e307) * _e309.xyz);
    u_xlat3_.x = _e311.x;
    u_xlat3_.y = _e311.y;
    u_xlat3_.z = _e311.z;
    let _e318 = vs_TEXCOORD3_;
    let _e320 = u_xlat3_;
    let _e321 = _e320.xyz;
    vs_TEXCOORD3_.x = _e321.x;
    vs_TEXCOORD3_.y = _e321.y;
    vs_TEXCOORD3_.z = _e321.z;
    let _e329 = u_xlatb12_;
    if _e329 {
        let _e330 = u_xlat2_;
        local_1 = _e330.y;
    } else {
        let _e335 = _v_buffer0_.v_cb0_[68];
        local_1 = _e335.z;
    }
    let _e338 = local_1;
    vs_TEXCOORD3_.w = _e338;
    let _e340 = u_xlatb12_;
    if _e340 {
        let _e341 = u_xlat2_;
        local_2 = _e341.z;
    } else {
        let _e346 = _v_buffer0_.v_cb0_[69];
        local_2 = _e346.z;
    }
    let _e349 = local_2;
    vs_TEXCOORD4_.w = _e349;
    let _e350 = u_xlat2_;
    let _e352 = u_xlat1_;
    let _e354 = u_xlat3_;
    let _e356 = (_e352.zxy * _e354.yzx);
    u_xlat2_.x = _e356.x;
    u_xlat2_.y = _e356.y;
    u_xlat2_.z = _e356.z;
    let _e363 = u_xlat1_;
    let _e365 = u_xlat1_;
    let _e367 = u_xlat3_;
    let _e370 = u_xlat2_;
    let _e373 = ((_e365.yzx * _e367.zxy) + -(_e370.xyz));
    u_xlat1_.x = _e373.x;
    u_xlat1_.y = _e373.y;
    u_xlat1_.z = _e373.z;
    let _e383 = _v_buffer1_.v_cb1_[9];
    u_xlatb12_ = (_e383.w >= 0f);
    let _e387 = u_xlatb12_;
    if _e387 {
        local_3 = 1f;
    } else {
        local_3 = -1f;
    }
    let _e392 = local_3;
    u_xlat12_ = _e392;
    let _e393 = u_xlat12_;
    let _e394 = in_TANGENT0_1;
    u_xlat12_ = (_e393 * _e394.w);
    let _e397 = vs_TEXCOORD4_;
    let _e399 = u_xlat12_;
    let _e401 = u_xlat1_;
    let _e403 = (vec3(_e399) * _e401.xyz);
    vs_TEXCOORD4_.x = _e403.x;
    vs_TEXCOORD4_.y = _e403.y;
    vs_TEXCOORD4_.z = _e403.z;
    let _e410 = u_xlat1_;
    let _e412 = u_xlat0_;
    let _e417 = _v_buffer3_.v_cb3_[1];
    let _e419 = (_e412.yyy * _e417.xyz);
    u_xlat1_.x = _e419.x;
    u_xlat1_.y = _e419.y;
    u_xlat1_.z = _e419.z;
    let _e426 = u_xlat1_;
    let _e431 = _v_buffer3_.v_cb3_[0];
    let _e433 = u_xlat0_;
    let _e436 = u_xlat1_;
    let _e438 = ((_e431.xyz * _e433.xxx) + _e436.xyz);
    u_xlat1_.x = _e438.x;
    u_xlat1_.y = _e438.y;
    u_xlat1_.z = _e438.z;
    let _e445 = u_xlat1_;
    let _e450 = _v_buffer3_.v_cb3_[2];
    let _e452 = u_xlat0_;
    let _e455 = u_xlat1_;
    let _e457 = ((_e450.xyz * _e452.zzz) + _e455.xyz);
    u_xlat1_.x = _e457.x;
    u_xlat1_.y = _e457.y;
    u_xlat1_.z = _e457.z;
    let _e464 = vs_TEXCOORD6_;
    let _e466 = u_xlat1_;
    let _e471 = _v_buffer3_.v_cb3_[3];
    let _e473 = (_e466.xyz + _e471.xyz);
    vs_TEXCOORD6_.x = _e473.x;
    vs_TEXCOORD6_.y = _e473.y;
    vs_TEXCOORD6_.z = _e473.z;
    vs_TEXCOORD6_.w = 0f;
    let _e482 = vs_TEXCOORD7_;
    vs_TEXCOORD7_.x = 0f;
    vs_TEXCOORD7_.y = 0f;
    vs_TEXCOORD7_.z = 0f;
    let _e491 = u_xlat0_;
    let _e496 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e491.yyyy * _e496);
    let _e501 = _v_buffer0_.v_cb0_[79];
    let _e502 = u_xlat0_;
    let _e505 = u_xlat1_;
    u_xlat1_ = ((_e501 * _e502.xxxx) + _e505);
    let _e510 = _v_buffer0_.v_cb0_[81];
    let _e511 = u_xlat0_;
    let _e514 = u_xlat1_;
    u_xlat0_ = ((_e510 * _e511.zzzz) + _e514);
    let _e517 = u_xlat0_;
    let _e521 = _v_buffer0_.v_cb0_[82];
    gl_Position = (_e517 + _e521);
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(1) in_NORMAL0_: vec3<f32>, @location(2) in_TANGENT0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_NORMAL0_1 = in_NORMAL0_;
    in_TANGENT0_1 = in_TANGENT0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    main_1();
    let _e45 = vs_TEXCOORD0_;
    let _e47 = vs_TEXCOORD5_;
    let _e49 = vs_TEXCOORD1_;
    let _e51 = vs_TEXCOORD2_;
    let _e53 = vs_TEXCOORD3_;
    let _e55 = vs_TEXCOORD4_;
    let _e57 = vs_TEXCOORD6_;
    let _e59 = vs_TEXCOORD7_;
    let _e61 = gl_Position;
    return VertexOutput(_e45, _e47, _e49, _e51, _e53, _e55, _e57, _e59, _e61);
}
