struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 8>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 15>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec2<f32>,
    @location(5) vs_TEXCOORD5_: vec2<f32>,
    @location(12) vs_NORMAL0_: vec3<f32>,
    @builtin(position) gl_Position: vec4<f32>,
}

@group(0) @binding(0) 
var<uniform> _v_buffer0_: v_buffer0_;
@group(0) @binding(1) 
var<uniform> _v_buffer1_: v_buffer1_;
@group(0) @binding(2) 
var<uniform> _v_buffer2_: v_buffer2_;
var<private> in_POSITION0_1: vec4<f32>;
var<private> in_TEXCOORD0_1: vec2<f32>;
var<private> in_TEXCOORD1_1: vec2<f32>;
var<private> in_NORMAL0_1: vec3<f32>;
var<private> vs_TEXCOORD0_: vec2<f32>;
var<private> vs_TEXCOORD5_: vec2<f32>;
var<private> vs_NORMAL0_: vec3<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec3<f32> = vec3(0f);
    var u_xlat6_: f32 = 0f;

    let _e31 = u_xlat0_;
    let _e33 = in_POSITION0_1;
    let _e38 = _v_buffer1_.v_cb1_[1];
    let _e40 = (_e33.yyy * _e38.xyz);
    u_xlat0_.x = _e40.x;
    u_xlat0_.y = _e40.y;
    u_xlat0_.z = _e40.z;
    let _e47 = u_xlat0_;
    let _e52 = _v_buffer1_.v_cb1_[0];
    let _e54 = in_POSITION0_1;
    let _e57 = u_xlat0_;
    let _e59 = ((_e52.xyz * _e54.xxx) + _e57.xyz);
    u_xlat0_.x = _e59.x;
    u_xlat0_.y = _e59.y;
    u_xlat0_.z = _e59.z;
    let _e66 = u_xlat0_;
    let _e71 = _v_buffer1_.v_cb1_[2];
    let _e73 = in_POSITION0_1;
    let _e76 = u_xlat0_;
    let _e78 = ((_e71.xyz * _e73.zzz) + _e76.xyz);
    u_xlat0_.x = _e78.x;
    u_xlat0_.y = _e78.y;
    u_xlat0_.z = _e78.z;
    let _e85 = u_xlat0_;
    let _e87 = u_xlat0_;
    let _e92 = _v_buffer1_.v_cb1_[3];
    let _e94 = (_e87.xyz + _e92.xyz);
    u_xlat0_.x = _e94.x;
    u_xlat0_.y = _e94.y;
    u_xlat0_.z = _e94.z;
    let _e101 = u_xlat1_;
    let _e103 = u_xlat0_;
    let _e108 = _v_buffer0_.v_cb0_[68];
    let _e110 = (_e103.yyy * _e108.xyz);
    u_xlat1_.x = _e110.x;
    u_xlat1_.y = _e110.y;
    u_xlat1_.z = _e110.z;
    let _e117 = u_xlat0_;
    let _e122 = _v_buffer0_.v_cb0_[67];
    let _e124 = u_xlat0_;
    let _e127 = u_xlat1_;
    let _e129 = ((_e122.xyz * _e124.xxx) + _e127.xyz);
    u_xlat0_.x = _e129.x;
    u_xlat0_.y = _e129.y;
    u_xlat0_.w = _e129.z;
    let _e136 = u_xlat0_;
    let _e141 = _v_buffer0_.v_cb0_[69];
    let _e143 = u_xlat0_;
    let _e146 = u_xlat0_;
    let _e148 = ((_e141.xyz * _e143.zzz) + _e146.xyw);
    u_xlat0_.x = _e148.x;
    u_xlat0_.y = _e148.y;
    u_xlat0_.z = _e148.z;
    let _e155 = u_xlat0_;
    let _e157 = u_xlat0_;
    let _e162 = _v_buffer0_.v_cb0_[70];
    let _e164 = (_e157.xyz + _e162.xyz);
    u_xlat0_.x = _e164.x;
    u_xlat0_.y = _e164.y;
    u_xlat0_.z = _e164.z;
    let _e171 = u_xlat0_;
    let _e176 = _v_buffer2_.v_cb2_[13];
    u_xlat6_ = (_e171.y * _e176.w);
    let _e182 = _v_buffer0_.v_cb0_[15];
    let _e187 = _v_buffer2_.v_cb2_[14];
    let _e190 = u_xlat6_;
    u_xlat6_ = ((_e182.y * _e187.x) + _e190);
    let _e192 = u_xlat6_;
    u_xlat6_ = sin(_e192);
    let _e194 = u_xlat6_;
    u_xlat6_ = (_e194 + 1f);
    let _e201 = _v_buffer2_.v_cb2_[14];
    u_xlat1_.x = (-(_e201.y) + 1f);
    let _e206 = u_xlat6_;
    let _e207 = u_xlat1_;
    u_xlat6_ = (_e206 * _e207.x);
    let _e210 = u_xlat6_;
    let _e216 = _v_buffer2_.v_cb2_[14];
    u_xlat6_ = ((_e210 * 0.5f) + _e216.y);
    let _e220 = u_xlat6_;
    let _e221 = u_xlat0_;
    u_xlat0_.x = (_e220 * _e221.x);
    let _e224 = u_xlat1_;
    let _e226 = u_xlat0_;
    let _e231 = _v_buffer0_.v_cb0_[72];
    let _e233 = (_e226.yyy * _e231.xyz);
    u_xlat1_.x = _e233.x;
    u_xlat1_.y = _e233.y;
    u_xlat1_.z = _e233.z;
    let _e240 = u_xlat0_;
    let _e245 = _v_buffer0_.v_cb0_[71];
    let _e247 = u_xlat0_;
    let _e250 = u_xlat1_;
    let _e252 = ((_e245.xyz * _e247.xxx) + _e250.xyz);
    u_xlat0_.x = _e252.x;
    u_xlat0_.y = _e252.y;
    u_xlat0_.w = _e252.z;
    let _e259 = u_xlat0_;
    let _e264 = _v_buffer0_.v_cb0_[73];
    let _e266 = u_xlat0_;
    let _e269 = u_xlat0_;
    let _e271 = ((_e264.xyz * _e266.zzz) + _e269.xyw);
    u_xlat0_.x = _e271.x;
    u_xlat0_.y = _e271.y;
    u_xlat0_.z = _e271.z;
    let _e278 = u_xlat0_;
    let _e280 = u_xlat0_;
    let _e285 = _v_buffer0_.v_cb0_[74];
    let _e287 = (_e280.xyz + _e285.xyz);
    u_xlat0_.x = _e287.x;
    u_xlat0_.y = _e287.y;
    u_xlat0_.z = _e287.z;
    let _e294 = u_xlat1_;
    let _e296 = u_xlat0_;
    let _e301 = _v_buffer1_.v_cb1_[5];
    let _e303 = (_e296.yyy * _e301.xyz);
    u_xlat1_.x = _e303.x;
    u_xlat1_.y = _e303.y;
    u_xlat1_.z = _e303.z;
    let _e310 = u_xlat0_;
    let _e315 = _v_buffer1_.v_cb1_[4];
    let _e317 = u_xlat0_;
    let _e320 = u_xlat1_;
    let _e322 = ((_e315.xyz * _e317.xxx) + _e320.xyz);
    u_xlat0_.x = _e322.x;
    u_xlat0_.y = _e322.y;
    u_xlat0_.w = _e322.z;
    let _e329 = u_xlat0_;
    let _e334 = _v_buffer1_.v_cb1_[6];
    let _e336 = u_xlat0_;
    let _e339 = u_xlat0_;
    let _e341 = ((_e334.xyz * _e336.zzz) + _e339.xyw);
    u_xlat0_.x = _e341.x;
    u_xlat0_.y = _e341.y;
    u_xlat0_.z = _e341.z;
    let _e348 = u_xlat0_;
    let _e350 = u_xlat0_;
    let _e355 = _v_buffer1_.v_cb1_[7];
    let _e357 = (_e350.xyz + _e355.xyz);
    u_xlat0_.x = _e357.x;
    u_xlat0_.y = _e357.y;
    u_xlat0_.z = _e357.z;
    let _e364 = u_xlat0_;
    let _e369 = _v_buffer1_.v_cb1_[1];
    u_xlat1_ = (_e364.yyyy * _e369);
    let _e374 = _v_buffer1_.v_cb1_[0];
    let _e375 = u_xlat0_;
    let _e378 = u_xlat1_;
    u_xlat1_ = ((_e374 * _e375.xxxx) + _e378);
    let _e383 = _v_buffer1_.v_cb1_[2];
    let _e384 = u_xlat0_;
    let _e387 = u_xlat1_;
    u_xlat0_ = ((_e383 * _e384.zzzz) + _e387);
    let _e389 = u_xlat0_;
    let _e393 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e389 + _e393);
    let _e395 = u_xlat0_;
    let _e400 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e395.yyyy * _e400);
    let _e405 = _v_buffer0_.v_cb0_[79];
    let _e406 = u_xlat0_;
    let _e409 = u_xlat1_;
    u_xlat1_ = ((_e405 * _e406.xxxx) + _e409);
    let _e414 = _v_buffer0_.v_cb0_[81];
    let _e415 = u_xlat0_;
    let _e418 = u_xlat1_;
    u_xlat1_ = ((_e414 * _e415.zzzz) + _e418);
    let _e424 = _v_buffer0_.v_cb0_[82];
    let _e425 = u_xlat0_;
    let _e428 = u_xlat1_;
    gl_Position = ((_e424 * _e425.wwww) + _e428);
    let _e430 = u_xlat0_;
    let _e432 = in_TEXCOORD0_1;
    let _e435 = in_TEXCOORD1_1;
    let _e437 = (-(_e432.xy) + _e435.xy);
    u_xlat0_.x = _e437.x;
    u_xlat0_.y = _e437.y;
    let _e442 = vs_TEXCOORD0_;
    let _e447 = _v_buffer2_.v_cb2_[13];
    let _e449 = u_xlat0_;
    let _e452 = in_TEXCOORD0_1;
    let _e454 = ((_e447.xy * _e449.xy) + _e452.xy);
    vs_TEXCOORD0_.x = _e454.x;
    vs_TEXCOORD0_.y = _e454.y;
    let _e460 = in_NORMAL0_1;
    let _e465 = _v_buffer1_.v_cb1_[4];
    u_xlat0_.x = dot(_e460.xyz, _e465.xyz);
    let _e469 = in_NORMAL0_1;
    let _e474 = _v_buffer1_.v_cb1_[5];
    u_xlat0_.y = dot(_e469.xyz, _e474.xyz);
    let _e478 = in_NORMAL0_1;
    let _e483 = _v_buffer1_.v_cb1_[6];
    u_xlat0_.z = dot(_e478.xyz, _e483.xyz);
    let _e486 = u_xlat0_;
    let _e488 = u_xlat0_;
    u_xlat6_ = dot(_e486.xyz, _e488.xyz);
    let _e492 = u_xlat6_;
    u_xlat1_.x = inverseSqrt(_e492);
    let _e494 = u_xlat6_;
    u_xlat6_ = max(_e494, 0.000000000000000000000000000000000000011754944f);
    let _e497 = u_xlat6_;
    u_xlat6_ = inverseSqrt(_e497);
    let _e499 = vs_NORMAL0_;
    let _e501 = u_xlat6_;
    let _e503 = u_xlat0_;
    let _e505 = (vec3(_e501) * _e503.xyz);
    vs_NORMAL0_.x = _e505.x;
    vs_NORMAL0_.y = _e505.y;
    vs_NORMAL0_.z = _e505.z;
    let _e512 = u_xlat0_;
    let _e514 = u_xlat0_;
    let _e516 = u_xlat1_;
    let _e518 = (_e514.xyz * _e516.xxx);
    u_xlat0_.x = _e518.x;
    u_xlat0_.y = _e518.y;
    u_xlat0_.z = _e518.z;
    let _e525 = u_xlat2_;
    let _e527 = u_xlat0_;
    let _e532 = _v_buffer0_.v_cb0_[68];
    let _e534 = (_e527.yy * _e532.xy);
    u_xlat2_.x = _e534.x;
    u_xlat2_.z = _e534.y;
    let _e539 = u_xlat0_;
    let _e544 = _v_buffer0_.v_cb0_[67];
    let _e546 = u_xlat0_;
    let _e549 = u_xlat2_;
    let _e551 = ((_e544.xy * _e546.xx) + _e549.xz);
    u_xlat0_.x = _e551.x;
    u_xlat0_.y = _e551.y;
    let _e556 = u_xlat0_;
    let _e561 = _v_buffer0_.v_cb0_[69];
    let _e563 = u_xlat0_;
    let _e566 = u_xlat0_;
    let _e568 = ((_e561.xy * _e563.zz) + _e566.xy);
    u_xlat0_.x = _e568.x;
    u_xlat0_.y = _e568.y;
    let _e573 = vs_TEXCOORD5_;
    let _e575 = u_xlat0_;
    let _e584 = ((_e575.xy * vec2<f32>(0.499f, 0.499f)) + vec2<f32>(0.5f, 0.5f));
    vs_TEXCOORD5_.x = _e584.x;
    vs_TEXCOORD5_.y = _e584.y;
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(5) in_TEXCOORD1_: vec2<f32>, @location(1) in_NORMAL0_: vec3<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_TEXCOORD1_1 = in_TEXCOORD1_;
    in_NORMAL0_1 = in_NORMAL0_;
    main_1();
    let _e32 = vs_TEXCOORD0_;
    let _e34 = vs_TEXCOORD5_;
    let _e36 = vs_NORMAL0_;
    let _e38 = gl_Position;
    return VertexOutput(_e32, _e34, _e36, _e38);
}
