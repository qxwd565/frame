struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 4>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 13>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec4<f32>,
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
var<private> vs_COLOR0_: vec4<f32>;
var<private> vs_TEXCOORD1_: f32;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: vec3<f32> = vec3(0f);
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
    let _e82 = ((_e75.xyz * _e77.www) + _e80.xyz);
    u_xlat0_.x = _e82.x;
    u_xlat0_.y = _e82.y;
    u_xlat0_.z = _e82.z;
    let _e89 = u_xlat1_;
    let _e94 = _v_buffer0_.v_cb0_[80];
    u_xlat2_ = (_e89.yyyy * _e94);
    let _e99 = _v_buffer0_.v_cb0_[79];
    let _e100 = u_xlat1_;
    let _e103 = u_xlat2_;
    u_xlat2_ = ((_e99 * _e100.xxxx) + _e103);
    let _e108 = _v_buffer0_.v_cb0_[81];
    let _e109 = u_xlat1_;
    let _e112 = u_xlat2_;
    u_xlat2_ = ((_e108 * _e109.zzzz) + _e112);
    let _e118 = _v_buffer0_.v_cb0_[82];
    let _e119 = u_xlat1_;
    let _e122 = u_xlat2_;
    gl_Position = ((_e118 * _e119.wwww) + _e122);
    let _e124 = u_xlat0_;
    let _e126 = u_xlat0_;
    let _e131 = _v_buffer2_.v_cb2_[4];
    let _e137 = _v_buffer2_.v_cb2_[4];
    let _e139 = ((_e126.xz * _e131.xy) + _e137.zw);
    u_xlat0_.x = _e139.x;
    u_xlat0_.z = _e139.y;
    let _e145 = u_xlat0_;
    let _e150 = _v_buffer2_.v_cb2_[12];
    u_xlat4_.x = (_e145.y + -(_e150.x));
    let _e154 = u_xlat4_;
    let _e159 = _v_buffer2_.v_cb2_[11];
    vs_TEXCOORD1_ = (_e154.x / _e159.w);
    let _e162 = u_xlat4_;
    let _e164 = u_xlat0_;
    let _e167 = u_xlat0_;
    let _e169 = (-(_e164.xz) + _e167.zx);
    u_xlat4_.x = _e169.x;
    u_xlat4_.z = _e169.y;
    let _e174 = u_xlat0_;
    let _e179 = _v_buffer2_.v_cb2_[6];
    let _e181 = u_xlat4_;
    let _e184 = u_xlat0_;
    let _e186 = ((_e179.yy * _e181.xz) + _e184.xz);
    u_xlat0_.x = _e186.x;
    u_xlat0_.y = _e186.y;
    let _e191 = u_xlat8_;
    let _e196 = _v_buffer0_.v_cb0_[15];
    let _e201 = _v_buffer2_.v_cb2_[5];
    let _e203 = (_e196.zz * _e201.xy);
    u_xlat8_.x = _e203.x;
    u_xlat8_.y = _e203.y;
    let _e208 = u_xlat8_;
    let _e210 = u_xlat8_;
    let _e212 = fract(_e210.xy);
    u_xlat8_.x = _e212.x;
    u_xlat8_.y = _e212.y;
    let _e217 = u_xlat0_;
    let _e219 = u_xlat8_;
    let _e221 = u_xlat0_;
    let _e223 = (_e219.xy + _e221.xy);
    u_xlat0_.x = _e223.x;
    u_xlat0_.y = _e223.y;
    let _e228 = u_xlat0_;
    let _e233 = _v_buffer2_.v_cb2_[4];
    let _e240 = u_xlat0_;
    let _e242 = ((-(_e233.xy) * vec2<f32>(0.5f, 0.5f)) + _e240.xy);
    u_xlat0_.x = _e242.x;
    u_xlat0_.y = _e242.y;
    let _e251 = _v_buffer2_.v_cb2_[6];
    u_xlat8_.x = (_e251.w * 0.017453289f);
    let _e259 = _v_buffer2_.v_cb2_[6];
    let _e264 = _v_buffer0_.v_cb0_[15];
    let _e267 = u_xlat8_;
    u_xlat8_.x = ((_e259.z * _e264.z) + -(_e267.x));
    let _e272 = u_xlat8_;
    u_xlat1_.x = sin(_e272.x);
    let _e276 = u_xlat8_;
    u_xlat2_.x = cos(_e276.x);
    let _e280 = u_xlat1_;
    u_xlat3_.z = _e280.x;
    let _e283 = u_xlat2_;
    u_xlat3_.y = _e283.x;
    let _e286 = u_xlat1_;
    u_xlat3_.x = -(_e286.x);
    let _e290 = u_xlat0_;
    let _e292 = u_xlat3_;
    u_xlat8_.y = dot(_e290.xy, _e292.xy);
    let _e296 = u_xlat0_;
    let _e298 = u_xlat3_;
    u_xlat8_.x = dot(_e296.xy, _e298.yz);
    let _e301 = vs_TEXCOORD0_;
    let _e306 = _v_buffer2_.v_cb2_[4];
    let _e312 = u_xlat8_;
    let _e314 = ((_e306.xy * vec2<f32>(0.5f, 0.5f)) + _e312.xy);
    vs_TEXCOORD0_.z = _e314.x;
    vs_TEXCOORD0_.w = _e314.y;
    let _e319 = u_xlat0_;
    let _e321 = in_TEXCOORD0_1;
    let _e326 = _v_buffer2_.v_cb2_[1];
    let _e332 = _v_buffer2_.v_cb2_[1];
    let _e334 = ((_e321.xy * _e326.xy) + _e332.zw);
    u_xlat0_.x = _e334.x;
    u_xlat0_.y = _e334.y;
    let _e339 = u_xlat8_;
    let _e341 = u_xlat0_;
    let _e344 = u_xlat0_;
    let _e346 = (-(_e341.xy) + _e344.yx);
    u_xlat8_.x = _e346.x;
    u_xlat8_.y = _e346.y;
    let _e351 = vs_TEXCOORD0_;
    let _e356 = _v_buffer2_.v_cb2_[2];
    let _e358 = u_xlat8_;
    let _e361 = u_xlat0_;
    let _e363 = ((_e356.zz * _e358.xy) + _e361.xy);
    vs_TEXCOORD0_.x = _e363.x;
    vs_TEXCOORD0_.y = _e363.y;
    let _e368 = in_COLOR0_1;
    let _e372 = _v_buffer2_.v_cb2_[0];
    u_xlat0_ = (_e368 * _e372);
    let _e375 = u_xlat0_;
    let _e377 = u_xlat0_;
    u_xlat1_.x = max(_e375.y, _e377.x);
    let _e381 = u_xlat0_;
    let _e383 = u_xlat1_;
    u_xlat1_.x = max(_e381.z, _e383.x);
    let _e387 = u_xlat1_;
    u_xlat1_.x = ((_e387.x * 2f) + -1f);
    let _e395 = u_xlat1_;
    u_xlat1_.x = clamp(_e395.x, 0f, 1f);
    let _e401 = u_xlat1_;
    u_xlat1_.w = (-(_e401.x) + 1f);
    let _e406 = u_xlat1_;
    let _e408 = u_xlat0_;
    let _e410 = u_xlat0_;
    let _e412 = (_e408.xyz + _e410.xyz);
    u_xlat1_.x = _e412.x;
    u_xlat1_.y = _e412.y;
    u_xlat1_.z = _e412.z;
    let _e420 = u_xlat0_;
    let _e425 = _v_buffer2_.v_cb2_[2];
    u_xlat0_.x = (_e420.w * _e425.w);
    let _e428 = u_xlat0_;
    let _e430 = u_xlat1_;
    vs_COLOR0_ = (_e428.xxxx * _e430);
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(3) in_COLOR0_: vec4<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_COLOR0_1 = in_COLOR0_;
    main_1();
    let _e28 = vs_TEXCOORD0_;
    let _e30 = vs_COLOR0_;
    let _e32 = vs_TEXCOORD1_;
    let _e34 = gl_Position;
    return VertexOutput(_e28, _e30, _e32, _e34);
}
