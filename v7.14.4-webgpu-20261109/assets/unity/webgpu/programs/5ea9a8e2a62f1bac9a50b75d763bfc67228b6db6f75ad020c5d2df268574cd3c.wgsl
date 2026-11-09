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
    let _e146 = _v_buffer2_.v_cb2_[4];
    let _e152 = _v_buffer2_.v_cb2_[4];
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
    let _e176 = _v_buffer2_.v_cb2_[6];
    let _e178 = u_xlat10_;
    let _e181 = u_xlat0_;
    let _e183 = ((_e176.yy * _e178.xy) + _e181.xy);
    u_xlat0_.x = _e183.x;
    u_xlat0_.y = _e183.y;
    let _e188 = u_xlat10_;
    let _e193 = _v_buffer0_.v_cb0_[15];
    let _e198 = _v_buffer2_.v_cb2_[5];
    let _e200 = (_e193.zz * _e198.xy);
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
    vs_TEXCOORD0_.z = _e220.x;
    vs_TEXCOORD0_.w = _e220.y;
    let _e225 = u_xlat0_;
    let _e227 = in_TEXCOORD0_1;
    let _e232 = _v_buffer2_.v_cb2_[1];
    let _e238 = _v_buffer2_.v_cb2_[1];
    let _e240 = ((_e227.xy * _e232.xy) + _e238.zw);
    u_xlat0_.x = _e240.x;
    u_xlat0_.y = _e240.y;
    let _e245 = u_xlat10_;
    let _e247 = u_xlat0_;
    let _e250 = u_xlat0_;
    let _e252 = (-(_e247.xy) + _e250.yx);
    u_xlat10_.x = _e252.x;
    u_xlat10_.y = _e252.y;
    let _e257 = vs_TEXCOORD0_;
    let _e262 = _v_buffer2_.v_cb2_[2];
    let _e264 = u_xlat10_;
    let _e267 = u_xlat0_;
    let _e269 = ((_e262.zz * _e264.xy) + _e267.xy);
    vs_TEXCOORD0_.x = _e269.x;
    vs_TEXCOORD0_.y = _e269.y;
    let _e274 = u_xlat0_;
    let _e279 = _v_buffer0_.v_cb0_[21];
    let _e284 = _v_buffer1_.v_cb1_[5];
    let _e286 = (_e279.yyy * _e284.xyz);
    u_xlat0_.x = _e286.x;
    u_xlat0_.y = _e286.y;
    u_xlat0_.z = _e286.z;
    let _e293 = u_xlat0_;
    let _e298 = _v_buffer1_.v_cb1_[4];
    let _e303 = _v_buffer0_.v_cb0_[21];
    let _e306 = u_xlat0_;
    let _e308 = ((_e298.xyz * _e303.xxx) + _e306.xyz);
    u_xlat0_.x = _e308.x;
    u_xlat0_.y = _e308.y;
    u_xlat0_.z = _e308.z;
    let _e315 = u_xlat0_;
    let _e320 = _v_buffer1_.v_cb1_[6];
    let _e325 = _v_buffer0_.v_cb0_[21];
    let _e328 = u_xlat0_;
    let _e330 = ((_e320.xyz * _e325.zzz) + _e328.xyz);
    u_xlat0_.x = _e330.x;
    u_xlat0_.y = _e330.y;
    u_xlat0_.z = _e330.z;
    let _e337 = u_xlat0_;
    let _e339 = u_xlat0_;
    let _e344 = _v_buffer1_.v_cb1_[7];
    let _e346 = (_e339.xyz + _e344.xyz);
    u_xlat0_.x = _e346.x;
    u_xlat0_.y = _e346.y;
    u_xlat0_.z = _e346.z;
    let _e353 = u_xlat0_;
    let _e355 = u_xlat0_;
    let _e357 = in_POSITION0_1;
    let _e360 = (_e355.xyz + -(_e357.xyz));
    u_xlat0_.x = _e360.x;
    u_xlat0_.y = _e360.y;
    u_xlat0_.z = _e360.z;
    let _e367 = u_xlat0_;
    let _e369 = u_xlat0_;
    u_xlat15_ = dot(_e367.xyz, _e369.xyz);
    let _e372 = u_xlat15_;
    u_xlat15_ = inverseSqrt(_e372);
    let _e374 = u_xlat0_;
    let _e376 = u_xlat15_;
    let _e378 = u_xlat0_;
    let _e380 = (vec3(_e376) * _e378.xyz);
    u_xlat0_.x = _e380.x;
    u_xlat0_.y = _e380.y;
    u_xlat0_.z = _e380.z;
    let _e388 = in_NORMAL0_1;
    let _e390 = u_xlat0_;
    u_xlat0_.x = dot(_e388.xyz, _e390.xyz);
    let _e394 = u_xlat0_;
    u_xlat0_.x = (-(abs(_e394.x)) + 1f);
    let _e401 = u_xlat0_;
    u_xlat0_.x = log2(abs(_e401.x));
    let _e406 = u_xlat0_;
    let _e411 = _v_buffer2_.v_cb2_[16];
    u_xlat0_.x = (_e406.x * _e411.x);
    let _e415 = u_xlat0_;
    u_xlat0_.x = exp2(_e415.x);
    let _e418 = u_xlat1_;
    let _e423 = _v_buffer2_.v_cb2_[14];
    let _e428 = _v_buffer2_.v_cb2_[16];
    let _e430 = (_e423.xyz * _e428.yyy);
    u_xlat1_.x = _e430.x;
    u_xlat1_.y = _e430.y;
    u_xlat1_.z = _e430.z;
    let _e437 = u_xlat2_;
    let _e442 = _v_buffer2_.v_cb2_[15];
    let _e447 = _v_buffer2_.v_cb2_[16];
    let _e450 = u_xlat1_;
    let _e453 = ((_e442.xyz * _e447.zzz) + -(_e450.xyz));
    u_xlat2_.x = _e453.x;
    u_xlat2_.y = _e453.y;
    u_xlat2_.z = _e453.z;
    let _e464 = _v_buffer2_.v_cb2_[14];
    u_xlat1_.w = _e464.w;
    let _e467 = u_xlat1_;
    let _e473 = _v_buffer2_.v_cb2_[15];
    u_xlat2_.w = (-(_e467.w) + _e473.w);
    let _e476 = u_xlat0_;
    let _e478 = u_xlat2_;
    let _e480 = u_xlat1_;
    u_xlat0_ = ((_e476.xxxx * _e478) + _e480);
    let _e482 = in_COLOR0_1;
    let _e486 = _v_buffer2_.v_cb2_[0];
    u_xlat1_ = (_e482 * _e486);
    let _e489 = u_xlat1_;
    let _e491 = u_xlat1_;
    u_xlat2_.x = max(_e489.y, _e491.x);
    let _e495 = u_xlat1_;
    let _e497 = u_xlat2_;
    u_xlat2_.x = max(_e495.z, _e497.x);
    let _e501 = u_xlat2_;
    u_xlat2_.x = ((_e501.x * 2f) + -1f);
    let _e509 = u_xlat2_;
    u_xlat2_.x = clamp(_e509.x, 0f, 1f);
    let _e515 = u_xlat2_;
    u_xlat2_.w = (-(_e515.x) + 1f);
    let _e520 = u_xlat2_;
    let _e522 = u_xlat1_;
    let _e524 = u_xlat1_;
    let _e526 = (_e522.xyz + _e524.xyz);
    u_xlat2_.x = _e526.x;
    u_xlat2_.y = _e526.y;
    u_xlat2_.z = _e526.z;
    let _e534 = u_xlat1_;
    let _e539 = _v_buffer2_.v_cb2_[2];
    u_xlat1_.x = (_e534.w * _e539.w);
    let _e542 = u_xlat1_;
    let _e544 = u_xlat2_;
    u_xlat3_ = (_e542.xxxx * _e544);
    let _e546 = u_xlat4_;
    let _e548 = u_xlat0_;
    let _e550 = u_xlat3_;
    let _e552 = (_e548.xyz * _e550.www);
    u_xlat4_.x = _e552.x;
    u_xlat4_.y = _e552.y;
    u_xlat4_.z = _e552.z;
    let _e559 = u_xlat0_;
    let _e560 = u_xlat3_;
    u_xlat3_ = (_e559 * _e560);
    u_xlat4_.w = 0f;
    let _e564 = u_xlat2_;
    let _e565 = u_xlat1_;
    let _e568 = u_xlat4_;
    u_xlat1_ = ((_e564 * _e565.xxxx) + _e568);
    let _e570 = u_xlat1_;
    let _e571 = u_xlat0_;
    let _e574 = u_xlat3_;
    u_xlat0_ = ((_e570 * _e571.wwww) + -(_e574));
    let _e580 = _v_buffer2_.v_cb2_[16];
    let _e582 = u_xlat0_;
    let _e584 = u_xlat3_;
    vs_COLOR0_ = ((_e580.wwww * _e582) + _e584);
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
