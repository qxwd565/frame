struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 8>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 20>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec2<f32>,
    @location(10) vs_COLOR0_: vec4<f32>,
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
var<private> in_COLOR0_1: vec4<f32>;
var<private> in_NORMAL0_1: vec3<f32>;
var<private> vs_TEXCOORD0_: vec2<f32>;
var<private> vs_COLOR0_: vec4<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec4<f32> = vec4(0f);
    var u_xlat4_: vec4<f32> = vec4(0f);
    var u_xlat6_: vec2<f32> = vec2(0f);
    var u_xlat10_: vec2<f32> = vec2(0f);
    var u_xlat11_: vec2<f32> = vec2(0f);
    var u_xlat15_: f32 = 0f;

    let _e50 = in_POSITION0_1;
    let _e55 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e50.yyyy * _e55);
    let _e60 = _v_buffer1_.v_cb1_[0];
    let _e61 = in_POSITION0_1;
    let _e64 = u_xlat0_;
    u_xlat0_ = ((_e60 * _e61.xxxx) + _e64);
    let _e69 = _v_buffer1_.v_cb1_[2];
    let _e70 = in_POSITION0_1;
    let _e73 = u_xlat0_;
    u_xlat0_ = ((_e69 * _e70.zzzz) + _e73);
    let _e75 = u_xlat0_;
    let _e79 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e75 + _e79);
    let _e81 = u_xlat0_;
    let _e86 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e81.yyyy * _e86);
    let _e91 = _v_buffer0_.v_cb0_[79];
    let _e92 = u_xlat0_;
    let _e95 = u_xlat1_;
    u_xlat1_ = ((_e91 * _e92.xxxx) + _e95);
    let _e100 = _v_buffer0_.v_cb0_[81];
    let _e101 = u_xlat0_;
    let _e104 = u_xlat1_;
    u_xlat1_ = ((_e100 * _e101.zzzz) + _e104);
    let _e110 = _v_buffer0_.v_cb0_[82];
    let _e111 = u_xlat0_;
    let _e114 = u_xlat1_;
    gl_Position = ((_e110 * _e111.wwww) + _e114);
    let _e116 = u_xlat0_;
    let _e118 = in_TEXCOORD0_1;
    let _e123 = _v_buffer2_.v_cb2_[1];
    let _e129 = _v_buffer2_.v_cb2_[1];
    let _e131 = ((_e118.xy * _e123.xy) + _e129.zw);
    u_xlat0_.x = _e131.x;
    u_xlat0_.y = _e131.y;
    let _e136 = u_xlat10_;
    let _e138 = u_xlat0_;
    let _e141 = u_xlat0_;
    let _e143 = (-(_e138.xy) + _e141.yx);
    u_xlat10_.x = _e143.x;
    u_xlat10_.y = _e143.y;
    let _e148 = vs_TEXCOORD0_;
    let _e153 = _v_buffer2_.v_cb2_[2];
    let _e155 = u_xlat10_;
    let _e158 = u_xlat0_;
    let _e160 = ((_e153.zz * _e155.xy) + _e158.xy);
    vs_TEXCOORD0_.x = _e160.x;
    vs_TEXCOORD0_.y = _e160.y;
    let _e165 = u_xlat0_;
    let _e170 = _v_buffer0_.v_cb0_[21];
    let _e175 = _v_buffer1_.v_cb1_[5];
    let _e177 = (_e170.yyy * _e175.xyz);
    u_xlat0_.x = _e177.x;
    u_xlat0_.y = _e177.y;
    u_xlat0_.z = _e177.z;
    let _e184 = u_xlat0_;
    let _e189 = _v_buffer1_.v_cb1_[4];
    let _e194 = _v_buffer0_.v_cb0_[21];
    let _e197 = u_xlat0_;
    let _e199 = ((_e189.xyz * _e194.xxx) + _e197.xyz);
    u_xlat0_.x = _e199.x;
    u_xlat0_.y = _e199.y;
    u_xlat0_.z = _e199.z;
    let _e206 = u_xlat0_;
    let _e211 = _v_buffer1_.v_cb1_[6];
    let _e216 = _v_buffer0_.v_cb0_[21];
    let _e219 = u_xlat0_;
    let _e221 = ((_e211.xyz * _e216.zzz) + _e219.xyz);
    u_xlat0_.x = _e221.x;
    u_xlat0_.y = _e221.y;
    u_xlat0_.z = _e221.z;
    let _e228 = u_xlat0_;
    let _e230 = u_xlat0_;
    let _e235 = _v_buffer1_.v_cb1_[7];
    let _e237 = (_e230.xyz + _e235.xyz);
    u_xlat0_.x = _e237.x;
    u_xlat0_.y = _e237.y;
    u_xlat0_.z = _e237.z;
    let _e244 = u_xlat0_;
    let _e246 = u_xlat0_;
    let _e248 = in_POSITION0_1;
    let _e251 = (_e246.xyz + -(_e248.xyz));
    u_xlat0_.x = _e251.x;
    u_xlat0_.y = _e251.y;
    u_xlat0_.z = _e251.z;
    let _e258 = u_xlat0_;
    let _e260 = u_xlat0_;
    u_xlat15_ = dot(_e258.xyz, _e260.xyz);
    let _e263 = u_xlat15_;
    u_xlat15_ = inverseSqrt(_e263);
    let _e265 = u_xlat0_;
    let _e267 = u_xlat15_;
    let _e269 = u_xlat0_;
    let _e271 = (vec3(_e267) * _e269.xyz);
    u_xlat0_.x = _e271.x;
    u_xlat0_.y = _e271.y;
    u_xlat0_.z = _e271.z;
    let _e279 = in_NORMAL0_1;
    let _e281 = u_xlat0_;
    u_xlat0_.x = dot(_e279.xyz, _e281.xyz);
    let _e285 = u_xlat0_;
    u_xlat0_.x = (-(abs(_e285.x)) + 1f);
    let _e292 = u_xlat0_;
    u_xlat0_.x = log2(abs(_e292.x));
    let _e297 = u_xlat0_;
    let _e302 = _v_buffer2_.v_cb2_[16];
    u_xlat0_.x = (_e297.x * _e302.x);
    let _e306 = u_xlat0_;
    u_xlat0_.x = exp2(_e306.x);
    let _e309 = u_xlat1_;
    let _e314 = _v_buffer2_.v_cb2_[14];
    let _e319 = _v_buffer2_.v_cb2_[16];
    let _e321 = (_e314.xyz * _e319.yyy);
    u_xlat1_.x = _e321.x;
    u_xlat1_.y = _e321.y;
    u_xlat1_.z = _e321.z;
    let _e328 = u_xlat2_;
    let _e333 = _v_buffer2_.v_cb2_[15];
    let _e338 = _v_buffer2_.v_cb2_[16];
    let _e341 = u_xlat1_;
    let _e344 = ((_e333.xyz * _e338.zzz) + -(_e341.xyz));
    u_xlat2_.x = _e344.x;
    u_xlat2_.y = _e344.y;
    u_xlat2_.z = _e344.z;
    let _e355 = _v_buffer2_.v_cb2_[14];
    u_xlat1_.w = _e355.w;
    let _e358 = u_xlat1_;
    let _e364 = _v_buffer2_.v_cb2_[15];
    u_xlat2_.w = (-(_e358.w) + _e364.w);
    let _e367 = u_xlat0_;
    let _e369 = u_xlat2_;
    let _e371 = u_xlat1_;
    u_xlat0_ = ((_e367.xxxx * _e369) + _e371);
    let _e373 = u_xlat1_;
    let _e378 = _v_buffer2_.v_cb2_[19];
    let _e384 = _v_buffer2_.v_cb2_[19];
    let _e386 = (-(_e378.xz) + _e384.yw);
    u_xlat1_.x = _e386.x;
    u_xlat1_.y = _e386.y;
    let _e391 = u_xlat11_;
    let _e393 = in_TEXCOORD0_1;
    let _e398 = _v_buffer2_.v_cb2_[18];
    let _e404 = _v_buffer2_.v_cb2_[18];
    let _e406 = ((_e393.xy * _e398.xy) + _e404.zw);
    u_xlat11_.x = _e406.x;
    u_xlat11_.y = _e406.y;
    let _e411 = u_xlat1_;
    let _e413 = u_xlat11_;
    let _e415 = u_xlat1_;
    let _e421 = _v_buffer2_.v_cb2_[19];
    let _e423 = ((_e413.xx * _e415.xy) + _e421.xz);
    u_xlat1_.x = _e423.x;
    u_xlat1_.y = _e423.y;
    let _e429 = u_xlat1_;
    let _e432 = u_xlat1_;
    u_xlat6_.x = (-(_e429.x) + _e432.y);
    let _e436 = u_xlat11_;
    let _e438 = u_xlat6_;
    let _e441 = u_xlat1_;
    u_xlat1_.x = ((_e436.y * _e438.x) + _e441.x);
    let _e444 = u_xlat6_;
    let _e446 = u_xlat11_;
    let _e457 = ((_e446.xy * vec2<f32>(2f, 2f)) + vec2<f32>(-1f, -1f));
    u_xlat6_.x = _e457.x;
    u_xlat6_.y = _e457.y;
    let _e463 = u_xlat6_;
    let _e465 = u_xlat6_;
    u_xlat6_.x = dot(_e463.xy, _e465.xy);
    let _e469 = u_xlat6_;
    u_xlat6_.x = (-(_e469.x) + 1f);
    let _e475 = u_xlat6_;
    let _e480 = _v_buffer2_.v_cb2_[17];
    u_xlat6_.x = (_e475.x * _e480.x);
    let _e484 = u_xlat6_;
    u_xlat6_.x = clamp(_e484.x, 0f, 1f);
    let _e490 = u_xlat1_;
    let _e492 = u_xlat6_;
    u_xlat1_.x = (_e490.x * _e492.x);
    let _e496 = u_xlat1_;
    u_xlat1_.x = clamp(_e496.x, 0f, 1f);
    let _e502 = u_xlat1_;
    let _e504 = in_COLOR0_1;
    u_xlat1_.w = (_e502.x * _e504.w);
    let _e507 = u_xlat1_;
    let _e509 = in_COLOR0_1;
    let _e510 = _e509.xyz;
    u_xlat1_.x = _e510.x;
    u_xlat1_.y = _e510.y;
    u_xlat1_.z = _e510.z;
    let _e517 = u_xlat1_;
    let _e521 = _v_buffer2_.v_cb2_[0];
    u_xlat1_ = (_e517 * _e521);
    let _e524 = u_xlat1_;
    let _e526 = u_xlat1_;
    u_xlat2_.x = max(_e524.y, _e526.x);
    let _e530 = u_xlat1_;
    let _e532 = u_xlat2_;
    u_xlat2_.x = max(_e530.z, _e532.x);
    let _e536 = u_xlat2_;
    u_xlat2_.x = ((_e536.x * 2f) + -1f);
    let _e544 = u_xlat2_;
    u_xlat2_.x = clamp(_e544.x, 0f, 1f);
    let _e550 = u_xlat2_;
    u_xlat2_.w = (-(_e550.x) + 1f);
    let _e555 = u_xlat2_;
    let _e557 = u_xlat1_;
    let _e559 = u_xlat1_;
    let _e561 = (_e557.xyz + _e559.xyz);
    u_xlat2_.x = _e561.x;
    u_xlat2_.y = _e561.y;
    u_xlat2_.z = _e561.z;
    let _e569 = u_xlat1_;
    let _e574 = _v_buffer2_.v_cb2_[2];
    u_xlat1_.x = (_e569.w * _e574.w);
    let _e577 = u_xlat1_;
    let _e579 = u_xlat2_;
    u_xlat3_ = (_e577.xxxx * _e579);
    let _e581 = u_xlat4_;
    let _e583 = u_xlat0_;
    let _e585 = u_xlat3_;
    let _e587 = (_e583.xyz * _e585.www);
    u_xlat4_.x = _e587.x;
    u_xlat4_.y = _e587.y;
    u_xlat4_.z = _e587.z;
    let _e594 = u_xlat0_;
    let _e595 = u_xlat3_;
    u_xlat3_ = (_e594 * _e595);
    u_xlat4_.w = 0f;
    let _e599 = u_xlat2_;
    let _e600 = u_xlat1_;
    let _e603 = u_xlat4_;
    u_xlat1_ = ((_e599 * _e600.xxxx) + _e603);
    let _e605 = u_xlat1_;
    let _e606 = u_xlat0_;
    let _e609 = u_xlat3_;
    u_xlat0_ = ((_e605 * _e606.wwww) + -(_e609));
    let _e615 = _v_buffer2_.v_cb2_[16];
    let _e617 = u_xlat0_;
    let _e619 = u_xlat3_;
    vs_COLOR0_ = ((_e615.wwww * _e617) + _e619);
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(3) in_COLOR0_: vec4<f32>, @location(1) in_NORMAL0_: vec3<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_COLOR0_1 = in_COLOR0_;
    in_NORMAL0_1 = in_NORMAL0_;
    main_1();
    let _e30 = vs_TEXCOORD0_;
    let _e32 = vs_COLOR0_;
    let _e34 = gl_Position;
    return VertexOutput(_e30, _e32, _e34);
}
