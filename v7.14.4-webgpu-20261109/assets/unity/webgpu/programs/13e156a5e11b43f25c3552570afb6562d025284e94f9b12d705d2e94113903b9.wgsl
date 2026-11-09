struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 8>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 17>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec2<f32>,
    @location(1) vs_TEXCOORD1_: f32,
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
var<private> vs_TEXCOORD1_: f32;
var<private> vs_COLOR0_: vec4<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec4<f32> = vec4(0f);
    var u_xlat4_: vec4<f32> = vec4(0f);
    var u_xlat10_: vec2<f32> = vec2(0f);
    var u_xlat15_: f32 = 0f;

    let _e43 = in_POSITION0_1;
    let _e48 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e43.yyyy * _e48);
    let _e53 = _v_buffer1_.v_cb1_[0];
    let _e54 = in_POSITION0_1;
    let _e57 = u_xlat0_;
    u_xlat0_ = ((_e53 * _e54.xxxx) + _e57);
    let _e62 = _v_buffer1_.v_cb1_[2];
    let _e63 = in_POSITION0_1;
    let _e66 = u_xlat0_;
    u_xlat0_ = ((_e62 * _e63.zzzz) + _e66);
    let _e68 = u_xlat0_;
    let _e72 = _v_buffer1_.v_cb1_[3];
    u_xlat1_ = (_e68 + _e72);
    let _e78 = _v_buffer1_.v_cb1_[3];
    let _e80 = in_POSITION0_1;
    let _e83 = u_xlat0_;
    u_xlat0_.x = ((_e78.y * _e80.w) + _e83.y);
    let _e87 = u_xlat0_;
    let _e92 = _v_buffer2_.v_cb2_[12];
    u_xlat0_.x = (_e87.x + -(_e92.x));
    let _e96 = u_xlat0_;
    let _e101 = _v_buffer2_.v_cb2_[11];
    vs_TEXCOORD1_ = (_e96.x / _e101.w);
    let _e104 = u_xlat1_;
    let _e109 = _v_buffer0_.v_cb0_[80];
    u_xlat0_ = (_e104.yyyy * _e109);
    let _e114 = _v_buffer0_.v_cb0_[79];
    let _e115 = u_xlat1_;
    let _e118 = u_xlat0_;
    u_xlat0_ = ((_e114 * _e115.xxxx) + _e118);
    let _e123 = _v_buffer0_.v_cb0_[81];
    let _e124 = u_xlat1_;
    let _e127 = u_xlat0_;
    u_xlat0_ = ((_e123 * _e124.zzzz) + _e127);
    let _e133 = _v_buffer0_.v_cb0_[82];
    let _e134 = u_xlat1_;
    let _e137 = u_xlat0_;
    gl_Position = ((_e133 * _e134.wwww) + _e137);
    let _e139 = u_xlat0_;
    let _e141 = in_TEXCOORD0_1;
    let _e146 = _v_buffer2_.v_cb2_[1];
    let _e152 = _v_buffer2_.v_cb2_[1];
    let _e154 = ((_e141.xy * _e146.xy) + _e152.zw);
    u_xlat0_.x = _e154.x;
    u_xlat0_.y = _e154.y;
    let _e159 = u_xlat10_;
    let _e161 = u_xlat0_;
    let _e164 = u_xlat0_;
    let _e166 = (-(_e161.xy) + _e164.yx);
    u_xlat10_.x = _e166.x;
    u_xlat10_.y = _e166.y;
    let _e171 = vs_TEXCOORD0_;
    let _e176 = _v_buffer2_.v_cb2_[2];
    let _e178 = u_xlat10_;
    let _e181 = u_xlat0_;
    let _e183 = ((_e176.zz * _e178.xy) + _e181.xy);
    vs_TEXCOORD0_.x = _e183.x;
    vs_TEXCOORD0_.y = _e183.y;
    let _e188 = u_xlat0_;
    let _e193 = _v_buffer0_.v_cb0_[21];
    let _e198 = _v_buffer1_.v_cb1_[5];
    let _e200 = (_e193.yyy * _e198.xyz);
    u_xlat0_.x = _e200.x;
    u_xlat0_.y = _e200.y;
    u_xlat0_.z = _e200.z;
    let _e207 = u_xlat0_;
    let _e212 = _v_buffer1_.v_cb1_[4];
    let _e217 = _v_buffer0_.v_cb0_[21];
    let _e220 = u_xlat0_;
    let _e222 = ((_e212.xyz * _e217.xxx) + _e220.xyz);
    u_xlat0_.x = _e222.x;
    u_xlat0_.y = _e222.y;
    u_xlat0_.z = _e222.z;
    let _e229 = u_xlat0_;
    let _e234 = _v_buffer1_.v_cb1_[6];
    let _e239 = _v_buffer0_.v_cb0_[21];
    let _e242 = u_xlat0_;
    let _e244 = ((_e234.xyz * _e239.zzz) + _e242.xyz);
    u_xlat0_.x = _e244.x;
    u_xlat0_.y = _e244.y;
    u_xlat0_.z = _e244.z;
    let _e251 = u_xlat0_;
    let _e253 = u_xlat0_;
    let _e258 = _v_buffer1_.v_cb1_[7];
    let _e260 = (_e253.xyz + _e258.xyz);
    u_xlat0_.x = _e260.x;
    u_xlat0_.y = _e260.y;
    u_xlat0_.z = _e260.z;
    let _e267 = u_xlat0_;
    let _e269 = u_xlat0_;
    let _e271 = in_POSITION0_1;
    let _e274 = (_e269.xyz + -(_e271.xyz));
    u_xlat0_.x = _e274.x;
    u_xlat0_.y = _e274.y;
    u_xlat0_.z = _e274.z;
    let _e281 = u_xlat0_;
    let _e283 = u_xlat0_;
    u_xlat15_ = dot(_e281.xyz, _e283.xyz);
    let _e286 = u_xlat15_;
    u_xlat15_ = inverseSqrt(_e286);
    let _e288 = u_xlat0_;
    let _e290 = u_xlat15_;
    let _e292 = u_xlat0_;
    let _e294 = (vec3(_e290) * _e292.xyz);
    u_xlat0_.x = _e294.x;
    u_xlat0_.y = _e294.y;
    u_xlat0_.z = _e294.z;
    let _e302 = in_NORMAL0_1;
    let _e304 = u_xlat0_;
    u_xlat0_.x = dot(_e302.xyz, _e304.xyz);
    let _e308 = u_xlat0_;
    u_xlat0_.x = (-(abs(_e308.x)) + 1f);
    let _e315 = u_xlat0_;
    u_xlat0_.x = log2(abs(_e315.x));
    let _e320 = u_xlat0_;
    let _e325 = _v_buffer2_.v_cb2_[16];
    u_xlat0_.x = (_e320.x * _e325.x);
    let _e329 = u_xlat0_;
    u_xlat0_.x = exp2(_e329.x);
    let _e332 = u_xlat1_;
    let _e337 = _v_buffer2_.v_cb2_[14];
    let _e342 = _v_buffer2_.v_cb2_[16];
    let _e344 = (_e337.xyz * _e342.yyy);
    u_xlat1_.x = _e344.x;
    u_xlat1_.y = _e344.y;
    u_xlat1_.z = _e344.z;
    let _e351 = u_xlat2_;
    let _e356 = _v_buffer2_.v_cb2_[15];
    let _e361 = _v_buffer2_.v_cb2_[16];
    let _e364 = u_xlat1_;
    let _e367 = ((_e356.xyz * _e361.zzz) + -(_e364.xyz));
    u_xlat2_.x = _e367.x;
    u_xlat2_.y = _e367.y;
    u_xlat2_.z = _e367.z;
    let _e378 = _v_buffer2_.v_cb2_[14];
    u_xlat1_.w = _e378.w;
    let _e381 = u_xlat1_;
    let _e387 = _v_buffer2_.v_cb2_[15];
    u_xlat2_.w = (-(_e381.w) + _e387.w);
    let _e390 = u_xlat0_;
    let _e392 = u_xlat2_;
    let _e394 = u_xlat1_;
    u_xlat0_ = ((_e390.xxxx * _e392) + _e394);
    let _e396 = in_COLOR0_1;
    let _e400 = _v_buffer2_.v_cb2_[0];
    u_xlat1_ = (_e396 * _e400);
    let _e403 = u_xlat1_;
    let _e405 = u_xlat1_;
    u_xlat2_.x = max(_e403.y, _e405.x);
    let _e409 = u_xlat1_;
    let _e411 = u_xlat2_;
    u_xlat2_.x = max(_e409.z, _e411.x);
    let _e415 = u_xlat2_;
    u_xlat2_.x = ((_e415.x * 2f) + -1f);
    let _e423 = u_xlat2_;
    u_xlat2_.x = clamp(_e423.x, 0f, 1f);
    let _e429 = u_xlat2_;
    u_xlat2_.w = (-(_e429.x) + 1f);
    let _e434 = u_xlat2_;
    let _e436 = u_xlat1_;
    let _e438 = u_xlat1_;
    let _e440 = (_e436.xyz + _e438.xyz);
    u_xlat2_.x = _e440.x;
    u_xlat2_.y = _e440.y;
    u_xlat2_.z = _e440.z;
    let _e448 = u_xlat1_;
    let _e453 = _v_buffer2_.v_cb2_[2];
    u_xlat1_.x = (_e448.w * _e453.w);
    let _e456 = u_xlat1_;
    let _e458 = u_xlat2_;
    u_xlat3_ = (_e456.xxxx * _e458);
    let _e460 = u_xlat4_;
    let _e462 = u_xlat0_;
    let _e464 = u_xlat3_;
    let _e466 = (_e462.xyz * _e464.www);
    u_xlat4_.x = _e466.x;
    u_xlat4_.y = _e466.y;
    u_xlat4_.z = _e466.z;
    let _e473 = u_xlat0_;
    let _e474 = u_xlat3_;
    u_xlat3_ = (_e473 * _e474);
    u_xlat4_.w = 0f;
    let _e478 = u_xlat2_;
    let _e479 = u_xlat1_;
    let _e482 = u_xlat4_;
    u_xlat1_ = ((_e478 * _e479.xxxx) + _e482);
    let _e484 = u_xlat1_;
    let _e485 = u_xlat0_;
    let _e488 = u_xlat3_;
    u_xlat0_ = ((_e484 * _e485.wwww) + -(_e488));
    let _e494 = _v_buffer2_.v_cb2_[16];
    let _e496 = u_xlat0_;
    let _e498 = u_xlat3_;
    vs_COLOR0_ = ((_e494.wwww * _e496) + _e498);
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
    let _e34 = vs_TEXCOORD1_;
    let _e36 = vs_COLOR0_;
    let _e38 = gl_Position;
    return VertexOutput(_e32, _e34, _e36, _e38);
}
