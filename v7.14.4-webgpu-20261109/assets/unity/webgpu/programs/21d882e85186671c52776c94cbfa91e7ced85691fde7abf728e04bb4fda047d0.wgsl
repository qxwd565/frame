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
var<private> in_NORMAL0_1: vec3<f32>;
var<private> vs_TEXCOORD0_: vec4<f32>;
var<private> vs_COLOR0_: vec4<f32>;
var<private> vs_TEXCOORD1_: f32;
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
    let _e171 = u_xlat0_;
    let _e176 = _v_buffer2_.v_cb2_[2];
    let _e178 = u_xlat10_;
    let _e181 = u_xlat0_;
    let _e183 = ((_e176.zz * _e178.xy) + _e181.xy);
    u_xlat0_.x = _e183.x;
    u_xlat0_.y = _e183.y;
    let _e188 = u_xlat10_;
    let _e193 = _v_buffer0_.v_cb0_[15];
    let _e198 = _v_buffer2_.v_cb2_[11];
    let _e200 = (_e193.zz * _e198.yz);
    u_xlat10_.x = _e200.x;
    u_xlat10_.y = _e200.y;
    let _e205 = u_xlat10_;
    let _e207 = u_xlat10_;
    let _e209 = fract(_e207.xy);
    u_xlat10_.x = _e209.x;
    u_xlat10_.y = _e209.y;
    let _e214 = vs_TEXCOORD0_;
    let _e216 = u_xlat10_;
    let _e218 = u_xlat0_;
    let _e220 = (_e216.xy + _e218.xy);
    vs_TEXCOORD0_.x = _e220.x;
    vs_TEXCOORD0_.y = _e220.y;
    let _e225 = u_xlat0_;
    let _e227 = in_TEXCOORD0_1;
    let _e232 = _v_buffer2_.v_cb2_[4];
    let _e238 = _v_buffer2_.v_cb2_[4];
    let _e240 = ((_e227.xy * _e232.xy) + _e238.zw);
    u_xlat0_.x = _e240.x;
    u_xlat0_.y = _e240.y;
    let _e245 = u_xlat10_;
    let _e247 = u_xlat0_;
    let _e250 = u_xlat0_;
    let _e252 = (-(_e247.xy) + _e250.yx);
    u_xlat10_.x = _e252.x;
    u_xlat10_.y = _e252.y;
    let _e257 = u_xlat0_;
    let _e262 = _v_buffer2_.v_cb2_[6];
    let _e264 = u_xlat10_;
    let _e267 = u_xlat0_;
    let _e269 = ((_e262.yy * _e264.xy) + _e267.xy);
    u_xlat0_.x = _e269.x;
    u_xlat0_.y = _e269.y;
    let _e274 = u_xlat10_;
    let _e279 = _v_buffer0_.v_cb0_[15];
    let _e284 = _v_buffer2_.v_cb2_[5];
    let _e286 = (_e279.zz * _e284.xy);
    u_xlat10_.x = _e286.x;
    u_xlat10_.y = _e286.y;
    let _e291 = u_xlat10_;
    let _e293 = u_xlat10_;
    let _e295 = fract(_e293.xy);
    u_xlat10_.x = _e295.x;
    u_xlat10_.y = _e295.y;
    let _e300 = vs_TEXCOORD0_;
    let _e302 = u_xlat10_;
    let _e304 = u_xlat0_;
    let _e306 = (_e302.xy + _e304.xy);
    vs_TEXCOORD0_.z = _e306.x;
    vs_TEXCOORD0_.w = _e306.y;
    let _e311 = u_xlat0_;
    let _e316 = _v_buffer0_.v_cb0_[21];
    let _e321 = _v_buffer1_.v_cb1_[5];
    let _e323 = (_e316.yyy * _e321.xyz);
    u_xlat0_.x = _e323.x;
    u_xlat0_.y = _e323.y;
    u_xlat0_.z = _e323.z;
    let _e330 = u_xlat0_;
    let _e335 = _v_buffer1_.v_cb1_[4];
    let _e340 = _v_buffer0_.v_cb0_[21];
    let _e343 = u_xlat0_;
    let _e345 = ((_e335.xyz * _e340.xxx) + _e343.xyz);
    u_xlat0_.x = _e345.x;
    u_xlat0_.y = _e345.y;
    u_xlat0_.z = _e345.z;
    let _e352 = u_xlat0_;
    let _e357 = _v_buffer1_.v_cb1_[6];
    let _e362 = _v_buffer0_.v_cb0_[21];
    let _e365 = u_xlat0_;
    let _e367 = ((_e357.xyz * _e362.zzz) + _e365.xyz);
    u_xlat0_.x = _e367.x;
    u_xlat0_.y = _e367.y;
    u_xlat0_.z = _e367.z;
    let _e374 = u_xlat0_;
    let _e376 = u_xlat0_;
    let _e381 = _v_buffer1_.v_cb1_[7];
    let _e383 = (_e376.xyz + _e381.xyz);
    u_xlat0_.x = _e383.x;
    u_xlat0_.y = _e383.y;
    u_xlat0_.z = _e383.z;
    let _e390 = u_xlat0_;
    let _e392 = u_xlat0_;
    let _e394 = in_POSITION0_1;
    let _e397 = (_e392.xyz + -(_e394.xyz));
    u_xlat0_.x = _e397.x;
    u_xlat0_.y = _e397.y;
    u_xlat0_.z = _e397.z;
    let _e404 = u_xlat0_;
    let _e406 = u_xlat0_;
    u_xlat15_ = dot(_e404.xyz, _e406.xyz);
    let _e409 = u_xlat15_;
    u_xlat15_ = inverseSqrt(_e409);
    let _e411 = u_xlat0_;
    let _e413 = u_xlat15_;
    let _e415 = u_xlat0_;
    let _e417 = (vec3(_e413) * _e415.xyz);
    u_xlat0_.x = _e417.x;
    u_xlat0_.y = _e417.y;
    u_xlat0_.z = _e417.z;
    let _e425 = in_NORMAL0_1;
    let _e427 = u_xlat0_;
    u_xlat0_.x = dot(_e425.xyz, _e427.xyz);
    let _e431 = u_xlat0_;
    u_xlat0_.x = (-(abs(_e431.x)) + 1f);
    let _e438 = u_xlat0_;
    u_xlat0_.x = log2(abs(_e438.x));
    let _e443 = u_xlat0_;
    let _e448 = _v_buffer2_.v_cb2_[16];
    u_xlat0_.x = (_e443.x * _e448.x);
    let _e452 = u_xlat0_;
    u_xlat0_.x = exp2(_e452.x);
    let _e455 = u_xlat1_;
    let _e460 = _v_buffer2_.v_cb2_[14];
    let _e465 = _v_buffer2_.v_cb2_[16];
    let _e467 = (_e460.xyz * _e465.yyy);
    u_xlat1_.x = _e467.x;
    u_xlat1_.y = _e467.y;
    u_xlat1_.z = _e467.z;
    let _e474 = u_xlat2_;
    let _e479 = _v_buffer2_.v_cb2_[15];
    let _e484 = _v_buffer2_.v_cb2_[16];
    let _e487 = u_xlat1_;
    let _e490 = ((_e479.xyz * _e484.zzz) + -(_e487.xyz));
    u_xlat2_.x = _e490.x;
    u_xlat2_.y = _e490.y;
    u_xlat2_.z = _e490.z;
    let _e501 = _v_buffer2_.v_cb2_[14];
    u_xlat1_.w = _e501.w;
    let _e504 = u_xlat1_;
    let _e510 = _v_buffer2_.v_cb2_[15];
    u_xlat2_.w = (-(_e504.w) + _e510.w);
    let _e513 = u_xlat0_;
    let _e515 = u_xlat2_;
    let _e517 = u_xlat1_;
    u_xlat0_ = ((_e513.xxxx * _e515) + _e517);
    let _e519 = in_COLOR0_1;
    let _e523 = _v_buffer2_.v_cb2_[0];
    u_xlat1_ = (_e519 * _e523);
    let _e526 = u_xlat1_;
    let _e528 = u_xlat1_;
    u_xlat2_.x = max(_e526.y, _e528.x);
    let _e532 = u_xlat1_;
    let _e534 = u_xlat2_;
    u_xlat2_.x = max(_e532.z, _e534.x);
    let _e538 = u_xlat2_;
    u_xlat2_.x = ((_e538.x * 2f) + -1f);
    let _e546 = u_xlat2_;
    u_xlat2_.x = clamp(_e546.x, 0f, 1f);
    let _e552 = u_xlat2_;
    u_xlat2_.w = (-(_e552.x) + 1f);
    let _e557 = u_xlat2_;
    let _e559 = u_xlat1_;
    let _e561 = u_xlat1_;
    let _e563 = (_e559.xyz + _e561.xyz);
    u_xlat2_.x = _e563.x;
    u_xlat2_.y = _e563.y;
    u_xlat2_.z = _e563.z;
    let _e571 = u_xlat1_;
    let _e576 = _v_buffer2_.v_cb2_[2];
    u_xlat1_.x = (_e571.w * _e576.w);
    let _e579 = u_xlat1_;
    let _e581 = u_xlat2_;
    u_xlat3_ = (_e579.xxxx * _e581);
    let _e583 = u_xlat4_;
    let _e585 = u_xlat0_;
    let _e587 = u_xlat3_;
    let _e589 = (_e585.xyz * _e587.www);
    u_xlat4_.x = _e589.x;
    u_xlat4_.y = _e589.y;
    u_xlat4_.z = _e589.z;
    let _e596 = u_xlat0_;
    let _e597 = u_xlat3_;
    u_xlat3_ = (_e596 * _e597);
    u_xlat4_.w = 0f;
    let _e601 = u_xlat2_;
    let _e602 = u_xlat1_;
    let _e605 = u_xlat4_;
    u_xlat1_ = ((_e601 * _e602.xxxx) + _e605);
    let _e607 = u_xlat1_;
    let _e608 = u_xlat0_;
    let _e611 = u_xlat3_;
    u_xlat0_ = ((_e607 * _e608.wwww) + -(_e611));
    let _e617 = _v_buffer2_.v_cb2_[16];
    let _e619 = u_xlat0_;
    let _e621 = u_xlat3_;
    vs_COLOR0_ = ((_e617.wwww * _e619) + _e621);
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
    let _e34 = vs_COLOR0_;
    let _e36 = vs_TEXCOORD1_;
    let _e38 = gl_Position;
    return VertexOutput(_e32, _e34, _e36, _e38);
}
