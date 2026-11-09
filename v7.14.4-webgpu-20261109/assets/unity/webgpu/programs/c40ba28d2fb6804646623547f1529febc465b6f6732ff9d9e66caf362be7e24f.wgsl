struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 4>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 14>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec4<f32>,
    @location(11) vs_COLOR1_: vec4<f32>,
    @location(10) vs_COLOR0_: vec4<f32>,
    @location(1) vs_TEXCOORD1_: f32,
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
var<private> vs_TEXCOORD0_: vec4<f32>;
var<private> vs_COLOR1_: vec4<f32>;
var<private> vs_COLOR0_: vec4<f32>;
var<private> vs_TEXCOORD1_: f32;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: f32 = 0f;
    var u_xlat8_: vec2<f32> = vec2(0f);

    let _e39 = in_POSITION0_1;
    let _e44 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e39.yyyy * _e44);
    let _e49 = _v_buffer1_.v_cb1_[0];
    let _e50 = in_POSITION0_1;
    let _e53 = u_xlat0_;
    u_xlat0_ = ((_e49 * _e50.xxxx) + _e53);
    let _e58 = _v_buffer1_.v_cb1_[2];
    let _e59 = in_POSITION0_1;
    let _e62 = u_xlat0_;
    u_xlat0_ = ((_e58 * _e59.zzzz) + _e62);
    let _e64 = u_xlat0_;
    let _e68 = _v_buffer1_.v_cb1_[3];
    u_xlat1_ = (_e64 + _e68);
    let _e70 = u_xlat0_;
    let _e75 = _v_buffer1_.v_cb1_[3];
    let _e77 = in_POSITION0_1;
    let _e80 = u_xlat0_;
    let _e82 = ((_e75.xz * _e77.ww) + _e80.xz);
    u_xlat0_.x = _e82.x;
    u_xlat0_.y = _e82.y;
    let _e87 = u_xlat0_;
    let _e89 = u_xlat0_;
    let _e94 = _v_buffer2_.v_cb2_[4];
    let _e100 = _v_buffer2_.v_cb2_[4];
    let _e102 = ((_e89.xy * _e94.xy) + _e100.zw);
    u_xlat0_.x = _e102.x;
    u_xlat0_.y = _e102.y;
    let _e107 = u_xlat1_;
    let _e112 = _v_buffer0_.v_cb0_[80];
    u_xlat2_ = (_e107.yyyy * _e112);
    let _e117 = _v_buffer0_.v_cb0_[79];
    let _e118 = u_xlat1_;
    let _e121 = u_xlat2_;
    u_xlat2_ = ((_e117 * _e118.xxxx) + _e121);
    let _e126 = _v_buffer0_.v_cb0_[81];
    let _e127 = u_xlat1_;
    let _e130 = u_xlat2_;
    u_xlat2_ = ((_e126 * _e127.zzzz) + _e130);
    let _e136 = _v_buffer0_.v_cb0_[82];
    let _e137 = u_xlat1_;
    let _e140 = u_xlat2_;
    gl_Position = ((_e136 * _e137.wwww) + _e140);
    let _e142 = u_xlat8_;
    let _e144 = u_xlat0_;
    let _e147 = u_xlat0_;
    let _e149 = (-(_e144.xy) + _e147.yx);
    u_xlat8_.x = _e149.x;
    u_xlat8_.y = _e149.y;
    let _e154 = u_xlat0_;
    let _e159 = _v_buffer2_.v_cb2_[6];
    let _e161 = u_xlat8_;
    let _e164 = u_xlat0_;
    let _e166 = ((_e159.yy * _e161.xy) + _e164.xy);
    u_xlat0_.x = _e166.x;
    u_xlat0_.y = _e166.y;
    let _e171 = u_xlat8_;
    let _e176 = _v_buffer0_.v_cb0_[15];
    let _e181 = _v_buffer2_.v_cb2_[5];
    let _e183 = (_e176.zz * _e181.xy);
    u_xlat8_.x = _e183.x;
    u_xlat8_.y = _e183.y;
    let _e188 = u_xlat8_;
    let _e190 = u_xlat8_;
    let _e192 = fract(_e190.xy);
    u_xlat8_.x = _e192.x;
    u_xlat8_.y = _e192.y;
    let _e197 = u_xlat0_;
    let _e199 = u_xlat8_;
    let _e201 = u_xlat0_;
    let _e203 = (_e199.xy + _e201.xy);
    u_xlat0_.x = _e203.x;
    u_xlat0_.y = _e203.y;
    let _e208 = u_xlat0_;
    let _e213 = _v_buffer2_.v_cb2_[4];
    let _e220 = u_xlat0_;
    let _e222 = ((-(_e213.xy) * vec2<f32>(0.5f, 0.5f)) + _e220.xy);
    u_xlat0_.x = _e222.x;
    u_xlat0_.y = _e222.y;
    let _e231 = _v_buffer2_.v_cb2_[6];
    u_xlat8_.x = (_e231.w * 0.017453289f);
    let _e239 = _v_buffer2_.v_cb2_[6];
    let _e244 = _v_buffer0_.v_cb0_[15];
    let _e247 = u_xlat8_;
    u_xlat8_.x = ((_e239.z * _e244.z) + -(_e247.x));
    let _e252 = u_xlat8_;
    u_xlat1_.x = sin(_e252.x);
    let _e256 = u_xlat8_;
    u_xlat2_.x = cos(_e256.x);
    let _e260 = u_xlat1_;
    u_xlat3_.z = _e260.x;
    let _e263 = u_xlat2_;
    u_xlat3_.y = _e263.x;
    let _e266 = u_xlat1_;
    u_xlat3_.x = -(_e266.x);
    let _e270 = u_xlat0_;
    let _e272 = u_xlat3_;
    u_xlat8_.y = dot(_e270.xy, _e272.xy);
    let _e276 = u_xlat0_;
    let _e278 = u_xlat3_;
    u_xlat8_.x = dot(_e276.xy, _e278.yz);
    let _e281 = vs_TEXCOORD0_;
    let _e286 = _v_buffer2_.v_cb2_[4];
    let _e292 = u_xlat8_;
    let _e294 = ((_e286.xy * vec2<f32>(0.5f, 0.5f)) + _e292.xy);
    vs_TEXCOORD0_.z = _e294.x;
    vs_TEXCOORD0_.w = _e294.y;
    let _e299 = u_xlat0_;
    let _e301 = in_TEXCOORD0_1;
    let _e306 = _v_buffer2_.v_cb2_[1];
    let _e312 = _v_buffer2_.v_cb2_[1];
    let _e314 = ((_e301.xy * _e306.xy) + _e312.zw);
    u_xlat0_.x = _e314.x;
    u_xlat0_.y = _e314.y;
    let _e319 = u_xlat8_;
    let _e321 = u_xlat0_;
    let _e324 = u_xlat0_;
    let _e326 = (-(_e321.xy) + _e324.yx);
    u_xlat8_.x = _e326.x;
    u_xlat8_.y = _e326.y;
    let _e331 = vs_TEXCOORD0_;
    let _e336 = _v_buffer2_.v_cb2_[2];
    let _e338 = u_xlat8_;
    let _e341 = u_xlat0_;
    let _e343 = ((_e336.zz * _e338.xy) + _e341.xy);
    vs_TEXCOORD0_.x = _e343.x;
    vs_TEXCOORD0_.y = _e343.y;
    let _e349 = in_COLOR0_1;
    let _e354 = _v_buffer2_.v_cb2_[13];
    u_xlat0_.w = max(_e349.w, _e354.x);
    let _e357 = u_xlat0_;
    let _e359 = in_COLOR0_1;
    let _e360 = _e359.xyz;
    u_xlat0_.x = _e360.x;
    u_xlat0_.y = _e360.y;
    u_xlat0_.z = _e360.z;
    let _e367 = u_xlat0_;
    let _e371 = _v_buffer2_.v_cb2_[7];
    u_xlat1_ = (_e367 * _e371);
    let _e373 = u_xlat0_;
    let _e377 = _v_buffer2_.v_cb2_[0];
    u_xlat0_ = (_e373 * _e377);
    let _e380 = u_xlat1_;
    let _e382 = u_xlat1_;
    u_xlat2_.x = max(_e380.y, _e382.x);
    let _e386 = u_xlat1_;
    let _e388 = u_xlat2_;
    u_xlat2_.x = max(_e386.z, _e388.x);
    let _e392 = u_xlat2_;
    u_xlat2_.x = ((_e392.x * 2f) + -1f);
    let _e400 = u_xlat2_;
    u_xlat2_.x = clamp(_e400.x, 0f, 1f);
    let _e406 = u_xlat2_;
    u_xlat2_.w = (-(_e406.x) + 1f);
    let _e411 = u_xlat1_;
    let _e413 = u_xlat1_;
    let _e415 = u_xlat1_;
    let _e417 = (_e413.xyz + _e415.xyz);
    u_xlat1_.x = _e417.x;
    u_xlat1_.y = _e417.y;
    u_xlat1_.z = _e417.z;
    let _e424 = u_xlat2_;
    let _e426 = u_xlat1_;
    let _e431 = _v_buffer2_.v_cb2_[8];
    let _e433 = (_e426.xyz * _e431.xxx);
    u_xlat2_.x = _e433.x;
    u_xlat2_.y = _e433.y;
    u_xlat2_.z = _e433.z;
    let _e440 = u_xlat1_;
    let _e442 = u_xlat2_;
    vs_COLOR1_ = (_e440.wwww * _e442);
    let _e445 = u_xlat0_;
    let _e447 = u_xlat0_;
    u_xlat1_.x = max(_e445.y, _e447.x);
    let _e451 = u_xlat0_;
    let _e453 = u_xlat1_;
    u_xlat1_.x = max(_e451.z, _e453.x);
    let _e457 = u_xlat1_;
    u_xlat1_.x = ((_e457.x * 2f) + -1f);
    let _e465 = u_xlat1_;
    u_xlat1_.x = clamp(_e465.x, 0f, 1f);
    let _e471 = u_xlat1_;
    u_xlat1_.w = (-(_e471.x) + 1f);
    let _e476 = u_xlat1_;
    let _e478 = u_xlat0_;
    let _e480 = u_xlat0_;
    let _e482 = (_e478.xyz + _e480.xyz);
    u_xlat1_.x = _e482.x;
    u_xlat1_.y = _e482.y;
    u_xlat1_.z = _e482.z;
    let _e490 = u_xlat0_;
    let _e495 = _v_buffer2_.v_cb2_[2];
    u_xlat0_.x = (_e490.w * _e495.w);
    let _e498 = u_xlat0_;
    let _e500 = u_xlat1_;
    vs_COLOR0_ = (_e498.xxxx * _e500);
    let _e503 = in_COLOR0_1;
    u_xlat0_.x = (-(_e503.w) + 1f);
    let _e509 = u_xlat0_;
    let _e514 = _v_buffer2_.v_cb2_[12];
    u_xlat0_.x = (_e509.x + -(_e514.w));
    let _e521 = _v_buffer2_.v_cb2_[12];
    u_xlat4_ = (_e521.y * 1.01f);
    let _e526 = u_xlat4_;
    let _e527 = u_xlat0_;
    u_xlat0_.x = max(_e526, _e527.x);
    let _e533 = _v_buffer2_.v_cb2_[12];
    u_xlat4_ = ((_e533.z * 2f) + 1f);
    let _e539 = u_xlat0_;
    let _e541 = u_xlat4_;
    let _e546 = _v_buffer2_.v_cb2_[12];
    vs_TEXCOORD1_ = ((_e539.x * _e541) + -(_e546.z));
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(3) in_COLOR0_: vec4<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_COLOR0_1 = in_COLOR0_;
    main_1();
    let _e30 = vs_TEXCOORD0_;
    let _e32 = vs_COLOR1_;
    let _e34 = vs_COLOR0_;
    let _e36 = vs_TEXCOORD1_;
    let _e38 = gl_Position;
    return VertexOutput(_e30, _e32, _e34, _e36, _e38);
}
