struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 8>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 12>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec4<f32>,
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
var<private> in_NORMAL0_1: vec3<f32>;
var<private> vs_TEXCOORD0_: vec4<f32>;
var<private> vs_COLOR1_: vec4<f32>;
var<private> vs_COLOR0_: vec4<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat4_: vec2<f32> = vec2(0f);

    let _e28 = in_POSITION0_1;
    let _e33 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e28.yyyy * _e33);
    let _e38 = _v_buffer1_.v_cb1_[0];
    let _e39 = in_POSITION0_1;
    let _e42 = u_xlat0_;
    u_xlat0_ = ((_e38 * _e39.xxxx) + _e42);
    let _e47 = _v_buffer1_.v_cb1_[2];
    let _e48 = in_POSITION0_1;
    let _e51 = u_xlat0_;
    u_xlat0_ = ((_e47 * _e48.zzzz) + _e51);
    let _e53 = u_xlat0_;
    let _e57 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e53 + _e57);
    let _e59 = u_xlat0_;
    let _e64 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e59.yyyy * _e64);
    let _e69 = _v_buffer0_.v_cb0_[79];
    let _e70 = u_xlat0_;
    let _e73 = u_xlat1_;
    u_xlat1_ = ((_e69 * _e70.xxxx) + _e73);
    let _e78 = _v_buffer0_.v_cb0_[81];
    let _e79 = u_xlat0_;
    let _e82 = u_xlat1_;
    u_xlat1_ = ((_e78 * _e79.zzzz) + _e82);
    let _e88 = _v_buffer0_.v_cb0_[82];
    let _e89 = u_xlat0_;
    let _e92 = u_xlat1_;
    gl_Position = ((_e88 * _e89.wwww) + _e92);
    let _e94 = u_xlat0_;
    let _e99 = _v_buffer0_.v_cb0_[73];
    let _e104 = _v_buffer1_.v_cb1_[5];
    let _e106 = (_e99.yyy * _e104.xyz);
    u_xlat0_.x = _e106.x;
    u_xlat0_.y = _e106.y;
    u_xlat0_.z = _e106.z;
    let _e113 = u_xlat0_;
    let _e118 = _v_buffer1_.v_cb1_[4];
    let _e123 = _v_buffer0_.v_cb0_[73];
    let _e126 = u_xlat0_;
    let _e128 = ((_e118.xyz * _e123.xxx) + _e126.xyz);
    u_xlat0_.x = _e128.x;
    u_xlat0_.y = _e128.y;
    u_xlat0_.z = _e128.z;
    let _e135 = u_xlat0_;
    let _e140 = _v_buffer1_.v_cb1_[6];
    let _e145 = _v_buffer0_.v_cb0_[73];
    let _e148 = u_xlat0_;
    let _e150 = ((_e140.xyz * _e145.zzz) + _e148.xyz);
    u_xlat0_.x = _e150.x;
    u_xlat0_.y = _e150.y;
    u_xlat0_.z = _e150.z;
    let _e157 = u_xlat0_;
    let _e162 = _v_buffer1_.v_cb1_[7];
    let _e167 = _v_buffer0_.v_cb0_[73];
    let _e170 = u_xlat0_;
    let _e172 = ((_e162.xyz * _e167.www) + _e170.xyz);
    u_xlat0_.x = _e172.x;
    u_xlat0_.y = _e172.y;
    u_xlat0_.z = _e172.z;
    let _e180 = u_xlat0_;
    let _e182 = in_NORMAL0_1;
    u_xlat0_.z = dot(_e180.xyz, _e182.xyz);
    let _e185 = u_xlat1_;
    let _e190 = _v_buffer0_.v_cb0_[71];
    let _e195 = _v_buffer1_.v_cb1_[5];
    let _e197 = (_e190.yyy * _e195.xyz);
    u_xlat1_.x = _e197.x;
    u_xlat1_.y = _e197.y;
    u_xlat1_.z = _e197.z;
    let _e204 = u_xlat1_;
    let _e209 = _v_buffer1_.v_cb1_[4];
    let _e214 = _v_buffer0_.v_cb0_[71];
    let _e217 = u_xlat1_;
    let _e219 = ((_e209.xyz * _e214.xxx) + _e217.xyz);
    u_xlat1_.x = _e219.x;
    u_xlat1_.y = _e219.y;
    u_xlat1_.z = _e219.z;
    let _e226 = u_xlat1_;
    let _e231 = _v_buffer1_.v_cb1_[6];
    let _e236 = _v_buffer0_.v_cb0_[71];
    let _e239 = u_xlat1_;
    let _e241 = ((_e231.xyz * _e236.zzz) + _e239.xyz);
    u_xlat1_.x = _e241.x;
    u_xlat1_.y = _e241.y;
    u_xlat1_.z = _e241.z;
    let _e248 = u_xlat1_;
    let _e253 = _v_buffer1_.v_cb1_[7];
    let _e258 = _v_buffer0_.v_cb0_[71];
    let _e261 = u_xlat1_;
    let _e263 = ((_e253.xyz * _e258.www) + _e261.xyz);
    u_xlat1_.x = _e263.x;
    u_xlat1_.y = _e263.y;
    u_xlat1_.z = _e263.z;
    let _e271 = u_xlat1_;
    let _e273 = in_NORMAL0_1;
    u_xlat0_.x = dot(_e271.xyz, _e273.xyz);
    let _e276 = u_xlat1_;
    let _e281 = _v_buffer0_.v_cb0_[72];
    let _e286 = _v_buffer1_.v_cb1_[5];
    let _e288 = (_e281.yyy * _e286.xyz);
    u_xlat1_.x = _e288.x;
    u_xlat1_.y = _e288.y;
    u_xlat1_.z = _e288.z;
    let _e295 = u_xlat1_;
    let _e300 = _v_buffer1_.v_cb1_[4];
    let _e305 = _v_buffer0_.v_cb0_[72];
    let _e308 = u_xlat1_;
    let _e310 = ((_e300.xyz * _e305.xxx) + _e308.xyz);
    u_xlat1_.x = _e310.x;
    u_xlat1_.y = _e310.y;
    u_xlat1_.z = _e310.z;
    let _e317 = u_xlat1_;
    let _e322 = _v_buffer1_.v_cb1_[6];
    let _e327 = _v_buffer0_.v_cb0_[72];
    let _e330 = u_xlat1_;
    let _e332 = ((_e322.xyz * _e327.zzz) + _e330.xyz);
    u_xlat1_.x = _e332.x;
    u_xlat1_.y = _e332.y;
    u_xlat1_.z = _e332.z;
    let _e339 = u_xlat1_;
    let _e344 = _v_buffer1_.v_cb1_[7];
    let _e349 = _v_buffer0_.v_cb0_[72];
    let _e352 = u_xlat1_;
    let _e354 = ((_e344.xyz * _e349.www) + _e352.xyz);
    u_xlat1_.x = _e354.x;
    u_xlat1_.y = _e354.y;
    u_xlat1_.z = _e354.z;
    let _e362 = u_xlat1_;
    let _e364 = in_NORMAL0_1;
    u_xlat0_.y = dot(_e362.xyz, _e364.xyz);
    let _e368 = u_xlat0_;
    let _e370 = u_xlat0_;
    u_xlat4_.x = dot(_e368.xyz, _e370.xyz);
    let _e374 = u_xlat4_;
    u_xlat4_.x = inverseSqrt(_e374.x);
    let _e377 = u_xlat0_;
    let _e379 = u_xlat4_;
    let _e381 = u_xlat0_;
    let _e383 = (_e379.xx * _e381.xy);
    u_xlat0_.x = _e383.x;
    u_xlat0_.y = _e383.y;
    let _e388 = vs_TEXCOORD0_;
    let _e390 = u_xlat0_;
    let _e399 = ((_e390.xy * vec2<f32>(0.5f, 0.5f)) + vec2<f32>(0.5f, 0.5f));
    vs_TEXCOORD0_.z = _e399.x;
    vs_TEXCOORD0_.w = _e399.y;
    let _e404 = u_xlat0_;
    let _e406 = in_TEXCOORD0_1;
    let _e411 = _v_buffer2_.v_cb2_[1];
    let _e417 = _v_buffer2_.v_cb2_[1];
    let _e419 = ((_e406.xy * _e411.xy) + _e417.zw);
    u_xlat0_.x = _e419.x;
    u_xlat0_.y = _e419.y;
    let _e424 = u_xlat4_;
    let _e426 = u_xlat0_;
    let _e429 = u_xlat0_;
    let _e431 = (-(_e426.xy) + _e429.yx);
    u_xlat4_.x = _e431.x;
    u_xlat4_.y = _e431.y;
    let _e436 = u_xlat0_;
    let _e441 = _v_buffer2_.v_cb2_[2];
    let _e443 = u_xlat4_;
    let _e446 = u_xlat0_;
    let _e448 = ((_e441.zz * _e443.xy) + _e446.xy);
    u_xlat0_.x = _e448.x;
    u_xlat0_.y = _e448.y;
    let _e453 = u_xlat4_;
    let _e458 = _v_buffer0_.v_cb0_[15];
    let _e463 = _v_buffer2_.v_cb2_[11];
    let _e465 = (_e458.zz * _e463.yz);
    u_xlat4_.x = _e465.x;
    u_xlat4_.y = _e465.y;
    let _e470 = u_xlat4_;
    let _e472 = u_xlat4_;
    let _e474 = fract(_e472.xy);
    u_xlat4_.x = _e474.x;
    u_xlat4_.y = _e474.y;
    let _e479 = vs_TEXCOORD0_;
    let _e481 = u_xlat4_;
    let _e483 = u_xlat0_;
    let _e485 = (_e481.xy + _e483.xy);
    vs_TEXCOORD0_.x = _e485.x;
    vs_TEXCOORD0_.y = _e485.y;
    let _e490 = in_COLOR0_1;
    let _e494 = _v_buffer2_.v_cb2_[7];
    u_xlat0_ = (_e490 * _e494);
    let _e497 = u_xlat0_;
    let _e499 = u_xlat0_;
    u_xlat1_.x = max(_e497.y, _e499.x);
    let _e503 = u_xlat0_;
    let _e505 = u_xlat1_;
    u_xlat1_.x = max(_e503.z, _e505.x);
    let _e509 = u_xlat1_;
    u_xlat1_.x = ((_e509.x * 2f) + -1f);
    let _e517 = u_xlat1_;
    u_xlat1_.x = clamp(_e517.x, 0f, 1f);
    let _e523 = u_xlat1_;
    u_xlat1_.w = (-(_e523.x) + 1f);
    let _e528 = u_xlat0_;
    let _e530 = u_xlat0_;
    let _e532 = u_xlat0_;
    let _e534 = (_e530.xyz + _e532.xyz);
    u_xlat0_.x = _e534.x;
    u_xlat0_.y = _e534.y;
    u_xlat0_.z = _e534.z;
    let _e541 = u_xlat1_;
    let _e543 = u_xlat0_;
    let _e548 = _v_buffer2_.v_cb2_[8];
    let _e550 = (_e543.xyz * _e548.xxx);
    u_xlat1_.x = _e550.x;
    u_xlat1_.y = _e550.y;
    u_xlat1_.z = _e550.z;
    let _e557 = u_xlat0_;
    let _e559 = u_xlat1_;
    vs_COLOR1_ = (_e557.wwww * _e559);
    let _e561 = in_COLOR0_1;
    let _e565 = _v_buffer2_.v_cb2_[0];
    u_xlat0_ = (_e561 * _e565);
    let _e568 = u_xlat0_;
    let _e570 = u_xlat0_;
    u_xlat1_.x = max(_e568.y, _e570.x);
    let _e574 = u_xlat0_;
    let _e576 = u_xlat1_;
    u_xlat1_.x = max(_e574.z, _e576.x);
    let _e580 = u_xlat1_;
    u_xlat1_.x = ((_e580.x * 2f) + -1f);
    let _e588 = u_xlat1_;
    u_xlat1_.x = clamp(_e588.x, 0f, 1f);
    let _e594 = u_xlat1_;
    u_xlat1_.w = (-(_e594.x) + 1f);
    let _e599 = u_xlat1_;
    let _e601 = u_xlat0_;
    let _e603 = u_xlat0_;
    let _e605 = (_e601.xyz + _e603.xyz);
    u_xlat1_.x = _e605.x;
    u_xlat1_.y = _e605.y;
    u_xlat1_.z = _e605.z;
    let _e613 = u_xlat0_;
    let _e618 = _v_buffer2_.v_cb2_[2];
    u_xlat0_.x = (_e613.w * _e618.w);
    let _e621 = u_xlat0_;
    let _e623 = u_xlat1_;
    vs_COLOR0_ = (_e621.xxxx * _e623);
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(3) in_COLOR0_: vec4<f32>, @location(1) in_NORMAL0_: vec3<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_COLOR0_1 = in_COLOR0_;
    in_NORMAL0_1 = in_NORMAL0_;
    main_1();
    let _e32 = vs_TEXCOORD0_;
    let _e34 = vs_COLOR1_;
    let _e36 = vs_COLOR0_;
    let _e38 = gl_Position;
    return VertexOutput(_e32, _e34, _e36, _e38);
}
