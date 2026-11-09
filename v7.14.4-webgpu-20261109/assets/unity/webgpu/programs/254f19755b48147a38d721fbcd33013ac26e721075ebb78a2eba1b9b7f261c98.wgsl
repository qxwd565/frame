struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 4>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 20>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec2<f32>,
    @location(1) vs_TEXCOORD1_: f32,
    @location(11) vs_COLOR1_: vec4<f32>,
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
var<private> vs_TEXCOORD0_: vec2<f32>;
var<private> vs_TEXCOORD1_: f32;
var<private> vs_COLOR1_: vec4<f32>;
var<private> vs_COLOR0_: vec4<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec2<f32> = vec2(0f);
    var u_xlat4_: vec2<f32> = vec2(0f);

    let _e32 = in_POSITION0_1;
    let _e37 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e32.yyyy * _e37);
    let _e42 = _v_buffer1_.v_cb1_[0];
    let _e43 = in_POSITION0_1;
    let _e46 = u_xlat0_;
    u_xlat0_ = ((_e42 * _e43.xxxx) + _e46);
    let _e51 = _v_buffer1_.v_cb1_[2];
    let _e52 = in_POSITION0_1;
    let _e55 = u_xlat0_;
    u_xlat0_ = ((_e51 * _e52.zzzz) + _e55);
    let _e57 = u_xlat0_;
    let _e61 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e57 + _e61);
    let _e63 = u_xlat0_;
    let _e68 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e63.yyyy * _e68);
    let _e73 = _v_buffer0_.v_cb0_[79];
    let _e74 = u_xlat0_;
    let _e77 = u_xlat1_;
    u_xlat1_ = ((_e73 * _e74.xxxx) + _e77);
    let _e82 = _v_buffer0_.v_cb0_[81];
    let _e83 = u_xlat0_;
    let _e86 = u_xlat1_;
    u_xlat1_ = ((_e82 * _e83.zzzz) + _e86);
    let _e92 = _v_buffer0_.v_cb0_[82];
    let _e93 = u_xlat0_;
    let _e96 = u_xlat1_;
    gl_Position = ((_e92 * _e93.wwww) + _e96);
    let _e98 = u_xlat0_;
    let _e103 = _v_buffer2_.v_cb2_[19];
    let _e109 = _v_buffer2_.v_cb2_[19];
    let _e111 = (-(_e103.xz) + _e109.yw);
    u_xlat0_.x = _e111.x;
    u_xlat0_.y = _e111.y;
    let _e116 = u_xlat4_;
    let _e118 = in_TEXCOORD0_1;
    let _e123 = _v_buffer2_.v_cb2_[18];
    let _e129 = _v_buffer2_.v_cb2_[18];
    let _e131 = ((_e118.xy * _e123.xy) + _e129.zw);
    u_xlat4_.x = _e131.x;
    u_xlat4_.y = _e131.y;
    let _e136 = u_xlat0_;
    let _e138 = u_xlat4_;
    let _e140 = u_xlat0_;
    let _e146 = _v_buffer2_.v_cb2_[19];
    let _e148 = ((_e138.xx * _e140.xy) + _e146.xz);
    u_xlat0_.x = _e148.x;
    u_xlat0_.y = _e148.y;
    let _e154 = u_xlat0_;
    let _e157 = u_xlat0_;
    u_xlat2_.x = (-(_e154.x) + _e157.y);
    let _e161 = u_xlat4_;
    let _e163 = u_xlat2_;
    let _e166 = u_xlat0_;
    u_xlat0_.x = ((_e161.y * _e163.x) + _e166.x);
    let _e169 = u_xlat2_;
    let _e171 = u_xlat4_;
    let _e182 = ((_e171.xy * vec2<f32>(2f, 2f)) + vec2<f32>(-1f, -1f));
    u_xlat2_.x = _e182.x;
    u_xlat2_.y = _e182.y;
    let _e188 = u_xlat2_;
    let _e190 = u_xlat2_;
    u_xlat2_.x = dot(_e188.xy, _e190.xy);
    let _e194 = u_xlat2_;
    u_xlat2_.x = (-(_e194.x) + 1f);
    let _e200 = u_xlat2_;
    let _e205 = _v_buffer2_.v_cb2_[17];
    u_xlat2_.x = (_e200.x * _e205.x);
    let _e209 = u_xlat2_;
    u_xlat2_.x = clamp(_e209.x, 0f, 1f);
    let _e215 = u_xlat0_;
    let _e217 = u_xlat2_;
    u_xlat0_.x = (_e215.x * _e217.x);
    let _e221 = u_xlat0_;
    u_xlat0_.x = clamp(_e221.x, 0f, 1f);
    let _e227 = in_COLOR0_1;
    let _e230 = u_xlat0_;
    u_xlat2_.x = ((-(_e227.w) * _e230.x) + 1f);
    let _e236 = u_xlat0_;
    let _e238 = in_COLOR0_1;
    u_xlat0_.x = (_e236.x * _e238.w);
    let _e242 = u_xlat0_;
    let _e247 = _v_buffer2_.v_cb2_[13];
    u_xlat1_.w = max(_e242.x, _e247.x);
    let _e251 = u_xlat2_;
    let _e256 = _v_buffer2_.v_cb2_[12];
    u_xlat0_.x = (_e251.x + -(_e256.w));
    let _e264 = _v_buffer2_.v_cb2_[12];
    u_xlat2_.x = (_e264.y * 1.01f);
    let _e269 = u_xlat2_;
    let _e271 = u_xlat0_;
    u_xlat0_.x = max(_e269.x, _e271.x);
    let _e278 = _v_buffer2_.v_cb2_[12];
    u_xlat2_.x = ((_e278.z * 2f) + 1f);
    let _e284 = u_xlat0_;
    let _e286 = u_xlat2_;
    let _e292 = _v_buffer2_.v_cb2_[12];
    vs_TEXCOORD1_ = ((_e284.x * _e286.x) + -(_e292.z));
    let _e296 = u_xlat0_;
    let _e298 = in_TEXCOORD0_1;
    let _e303 = _v_buffer2_.v_cb2_[1];
    let _e309 = _v_buffer2_.v_cb2_[1];
    let _e311 = ((_e298.xy * _e303.xy) + _e309.zw);
    u_xlat0_.x = _e311.x;
    u_xlat0_.y = _e311.y;
    let _e316 = u_xlat4_;
    let _e318 = u_xlat0_;
    let _e321 = u_xlat0_;
    let _e323 = (-(_e318.xy) + _e321.yx);
    u_xlat4_.x = _e323.x;
    u_xlat4_.y = _e323.y;
    let _e328 = u_xlat0_;
    let _e333 = _v_buffer2_.v_cb2_[2];
    let _e335 = u_xlat4_;
    let _e338 = u_xlat0_;
    let _e340 = ((_e333.zz * _e335.xy) + _e338.xy);
    u_xlat0_.x = _e340.x;
    u_xlat0_.y = _e340.y;
    let _e345 = u_xlat4_;
    let _e350 = _v_buffer0_.v_cb0_[15];
    let _e355 = _v_buffer2_.v_cb2_[11];
    let _e357 = (_e350.zz * _e355.yz);
    u_xlat4_.x = _e357.x;
    u_xlat4_.y = _e357.y;
    let _e362 = u_xlat4_;
    let _e364 = u_xlat4_;
    let _e366 = fract(_e364.xy);
    u_xlat4_.x = _e366.x;
    u_xlat4_.y = _e366.y;
    let _e371 = vs_TEXCOORD0_;
    let _e373 = u_xlat4_;
    let _e375 = u_xlat0_;
    let _e377 = (_e373.xy + _e375.xy);
    vs_TEXCOORD0_.x = _e377.x;
    vs_TEXCOORD0_.y = _e377.y;
    vs_COLOR1_ = vec4<f32>(0f, 0f, 0f, 0f);
    let _e387 = u_xlat1_;
    let _e389 = in_COLOR0_1;
    let _e390 = _e389.xyz;
    u_xlat1_.x = _e390.x;
    u_xlat1_.y = _e390.y;
    u_xlat1_.z = _e390.z;
    let _e397 = u_xlat1_;
    let _e401 = _v_buffer2_.v_cb2_[0];
    u_xlat0_ = (_e397 * _e401);
    let _e404 = u_xlat0_;
    let _e406 = u_xlat0_;
    u_xlat1_.x = max(_e404.y, _e406.x);
    let _e410 = u_xlat0_;
    let _e412 = u_xlat1_;
    u_xlat1_.x = max(_e410.z, _e412.x);
    let _e416 = u_xlat1_;
    u_xlat1_.x = ((_e416.x * 2f) + -1f);
    let _e424 = u_xlat1_;
    u_xlat1_.x = clamp(_e424.x, 0f, 1f);
    let _e430 = u_xlat1_;
    u_xlat1_.w = (-(_e430.x) + 1f);
    let _e435 = u_xlat1_;
    let _e437 = u_xlat0_;
    let _e439 = u_xlat0_;
    let _e441 = (_e437.xyz + _e439.xyz);
    u_xlat1_.x = _e441.x;
    u_xlat1_.y = _e441.y;
    u_xlat1_.z = _e441.z;
    let _e449 = u_xlat0_;
    let _e454 = _v_buffer2_.v_cb2_[2];
    u_xlat0_.x = (_e449.w * _e454.w);
    let _e457 = u_xlat0_;
    let _e459 = u_xlat1_;
    vs_COLOR0_ = (_e457.xxxx * _e459);
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(3) in_COLOR0_: vec4<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_COLOR0_1 = in_COLOR0_;
    main_1();
    let _e30 = vs_TEXCOORD0_;
    let _e32 = vs_TEXCOORD1_;
    let _e34 = vs_COLOR1_;
    let _e36 = vs_COLOR0_;
    let _e38 = gl_Position;
    return VertexOutput(_e30, _e32, _e34, _e36, _e38);
}
