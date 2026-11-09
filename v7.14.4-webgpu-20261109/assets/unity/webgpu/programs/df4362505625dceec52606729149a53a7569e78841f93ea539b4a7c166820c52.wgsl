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
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec4<f32> = vec4(0f);
    var u_xlat4_: vec4<f32> = vec4(0f);
    var u_xlat10_: vec2<f32> = vec2(0f);
    var u_xlat15_: f32 = 0f;

    let _e42 = in_POSITION0_1;
    let _e47 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e42.yyyy * _e47);
    let _e52 = _v_buffer1_.v_cb1_[0];
    let _e53 = in_POSITION0_1;
    let _e56 = u_xlat0_;
    u_xlat0_ = ((_e52 * _e53.xxxx) + _e56);
    let _e61 = _v_buffer1_.v_cb1_[2];
    let _e62 = in_POSITION0_1;
    let _e65 = u_xlat0_;
    u_xlat0_ = ((_e61 * _e62.zzzz) + _e65);
    let _e67 = u_xlat0_;
    let _e71 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e67 + _e71);
    let _e73 = u_xlat0_;
    let _e78 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e73.yyyy * _e78);
    let _e83 = _v_buffer0_.v_cb0_[79];
    let _e84 = u_xlat0_;
    let _e87 = u_xlat1_;
    u_xlat1_ = ((_e83 * _e84.xxxx) + _e87);
    let _e92 = _v_buffer0_.v_cb0_[81];
    let _e93 = u_xlat0_;
    let _e96 = u_xlat1_;
    u_xlat1_ = ((_e92 * _e93.zzzz) + _e96);
    let _e102 = _v_buffer0_.v_cb0_[82];
    let _e103 = u_xlat0_;
    let _e106 = u_xlat1_;
    gl_Position = ((_e102 * _e103.wwww) + _e106);
    let _e108 = u_xlat0_;
    let _e110 = in_TEXCOORD0_1;
    let _e115 = _v_buffer2_.v_cb2_[1];
    let _e121 = _v_buffer2_.v_cb2_[1];
    let _e123 = ((_e110.xy * _e115.xy) + _e121.zw);
    u_xlat0_.x = _e123.x;
    u_xlat0_.y = _e123.y;
    let _e128 = u_xlat10_;
    let _e130 = u_xlat0_;
    let _e133 = u_xlat0_;
    let _e135 = (-(_e130.xy) + _e133.yx);
    u_xlat10_.x = _e135.x;
    u_xlat10_.y = _e135.y;
    let _e140 = u_xlat0_;
    let _e145 = _v_buffer2_.v_cb2_[2];
    let _e147 = u_xlat10_;
    let _e150 = u_xlat0_;
    let _e152 = ((_e145.zz * _e147.xy) + _e150.xy);
    u_xlat0_.x = _e152.x;
    u_xlat0_.y = _e152.y;
    let _e157 = u_xlat10_;
    let _e162 = _v_buffer0_.v_cb0_[15];
    let _e167 = _v_buffer2_.v_cb2_[11];
    let _e169 = (_e162.zz * _e167.yz);
    u_xlat10_.x = _e169.x;
    u_xlat10_.y = _e169.y;
    let _e174 = u_xlat10_;
    let _e176 = u_xlat10_;
    let _e178 = fract(_e176.xy);
    u_xlat10_.x = _e178.x;
    u_xlat10_.y = _e178.y;
    let _e183 = vs_TEXCOORD0_;
    let _e185 = u_xlat10_;
    let _e187 = u_xlat0_;
    let _e189 = (_e185.xy + _e187.xy);
    vs_TEXCOORD0_.x = _e189.x;
    vs_TEXCOORD0_.y = _e189.y;
    let _e194 = u_xlat0_;
    let _e196 = in_TEXCOORD0_1;
    let _e201 = _v_buffer2_.v_cb2_[4];
    let _e207 = _v_buffer2_.v_cb2_[4];
    let _e209 = ((_e196.xy * _e201.xy) + _e207.zw);
    u_xlat0_.x = _e209.x;
    u_xlat0_.y = _e209.y;
    let _e214 = u_xlat10_;
    let _e216 = u_xlat0_;
    let _e219 = u_xlat0_;
    let _e221 = (-(_e216.xy) + _e219.yx);
    u_xlat10_.x = _e221.x;
    u_xlat10_.y = _e221.y;
    let _e226 = u_xlat0_;
    let _e231 = _v_buffer2_.v_cb2_[6];
    let _e233 = u_xlat10_;
    let _e236 = u_xlat0_;
    let _e238 = ((_e231.yy * _e233.xy) + _e236.xy);
    u_xlat0_.x = _e238.x;
    u_xlat0_.y = _e238.y;
    let _e243 = u_xlat10_;
    let _e248 = _v_buffer0_.v_cb0_[15];
    let _e253 = _v_buffer2_.v_cb2_[5];
    let _e255 = (_e248.zz * _e253.xy);
    u_xlat10_.x = _e255.x;
    u_xlat10_.y = _e255.y;
    let _e260 = u_xlat10_;
    let _e262 = u_xlat10_;
    let _e264 = fract(_e262.xy);
    u_xlat10_.x = _e264.x;
    u_xlat10_.y = _e264.y;
    let _e269 = vs_TEXCOORD0_;
    let _e271 = u_xlat10_;
    let _e273 = u_xlat0_;
    let _e275 = (_e271.xy + _e273.xy);
    vs_TEXCOORD0_.z = _e275.x;
    vs_TEXCOORD0_.w = _e275.y;
    let _e280 = u_xlat0_;
    let _e285 = _v_buffer0_.v_cb0_[21];
    let _e290 = _v_buffer1_.v_cb1_[5];
    let _e292 = (_e285.yyy * _e290.xyz);
    u_xlat0_.x = _e292.x;
    u_xlat0_.y = _e292.y;
    u_xlat0_.z = _e292.z;
    let _e299 = u_xlat0_;
    let _e304 = _v_buffer1_.v_cb1_[4];
    let _e309 = _v_buffer0_.v_cb0_[21];
    let _e312 = u_xlat0_;
    let _e314 = ((_e304.xyz * _e309.xxx) + _e312.xyz);
    u_xlat0_.x = _e314.x;
    u_xlat0_.y = _e314.y;
    u_xlat0_.z = _e314.z;
    let _e321 = u_xlat0_;
    let _e326 = _v_buffer1_.v_cb1_[6];
    let _e331 = _v_buffer0_.v_cb0_[21];
    let _e334 = u_xlat0_;
    let _e336 = ((_e326.xyz * _e331.zzz) + _e334.xyz);
    u_xlat0_.x = _e336.x;
    u_xlat0_.y = _e336.y;
    u_xlat0_.z = _e336.z;
    let _e343 = u_xlat0_;
    let _e345 = u_xlat0_;
    let _e350 = _v_buffer1_.v_cb1_[7];
    let _e352 = (_e345.xyz + _e350.xyz);
    u_xlat0_.x = _e352.x;
    u_xlat0_.y = _e352.y;
    u_xlat0_.z = _e352.z;
    let _e359 = u_xlat0_;
    let _e361 = u_xlat0_;
    let _e363 = in_POSITION0_1;
    let _e366 = (_e361.xyz + -(_e363.xyz));
    u_xlat0_.x = _e366.x;
    u_xlat0_.y = _e366.y;
    u_xlat0_.z = _e366.z;
    let _e373 = u_xlat0_;
    let _e375 = u_xlat0_;
    u_xlat15_ = dot(_e373.xyz, _e375.xyz);
    let _e378 = u_xlat15_;
    u_xlat15_ = inverseSqrt(_e378);
    let _e380 = u_xlat0_;
    let _e382 = u_xlat15_;
    let _e384 = u_xlat0_;
    let _e386 = (vec3(_e382) * _e384.xyz);
    u_xlat0_.x = _e386.x;
    u_xlat0_.y = _e386.y;
    u_xlat0_.z = _e386.z;
    let _e394 = in_NORMAL0_1;
    let _e396 = u_xlat0_;
    u_xlat0_.x = dot(_e394.xyz, _e396.xyz);
    let _e400 = u_xlat0_;
    u_xlat0_.x = (-(abs(_e400.x)) + 1f);
    let _e407 = u_xlat0_;
    u_xlat0_.x = log2(abs(_e407.x));
    let _e412 = u_xlat0_;
    let _e417 = _v_buffer2_.v_cb2_[16];
    u_xlat0_.x = (_e412.x * _e417.x);
    let _e421 = u_xlat0_;
    u_xlat0_.x = exp2(_e421.x);
    let _e424 = u_xlat1_;
    let _e429 = _v_buffer2_.v_cb2_[14];
    let _e434 = _v_buffer2_.v_cb2_[16];
    let _e436 = (_e429.xyz * _e434.yyy);
    u_xlat1_.x = _e436.x;
    u_xlat1_.y = _e436.y;
    u_xlat1_.z = _e436.z;
    let _e443 = u_xlat2_;
    let _e448 = _v_buffer2_.v_cb2_[15];
    let _e453 = _v_buffer2_.v_cb2_[16];
    let _e456 = u_xlat1_;
    let _e459 = ((_e448.xyz * _e453.zzz) + -(_e456.xyz));
    u_xlat2_.x = _e459.x;
    u_xlat2_.y = _e459.y;
    u_xlat2_.z = _e459.z;
    let _e470 = _v_buffer2_.v_cb2_[14];
    u_xlat1_.w = _e470.w;
    let _e473 = u_xlat1_;
    let _e479 = _v_buffer2_.v_cb2_[15];
    u_xlat2_.w = (-(_e473.w) + _e479.w);
    let _e482 = u_xlat0_;
    let _e484 = u_xlat2_;
    let _e486 = u_xlat1_;
    u_xlat0_ = ((_e482.xxxx * _e484) + _e486);
    let _e488 = in_COLOR0_1;
    let _e492 = _v_buffer2_.v_cb2_[0];
    u_xlat1_ = (_e488 * _e492);
    let _e495 = u_xlat1_;
    let _e497 = u_xlat1_;
    u_xlat2_.x = max(_e495.y, _e497.x);
    let _e501 = u_xlat1_;
    let _e503 = u_xlat2_;
    u_xlat2_.x = max(_e501.z, _e503.x);
    let _e507 = u_xlat2_;
    u_xlat2_.x = ((_e507.x * 2f) + -1f);
    let _e515 = u_xlat2_;
    u_xlat2_.x = clamp(_e515.x, 0f, 1f);
    let _e521 = u_xlat2_;
    u_xlat2_.w = (-(_e521.x) + 1f);
    let _e526 = u_xlat2_;
    let _e528 = u_xlat1_;
    let _e530 = u_xlat1_;
    let _e532 = (_e528.xyz + _e530.xyz);
    u_xlat2_.x = _e532.x;
    u_xlat2_.y = _e532.y;
    u_xlat2_.z = _e532.z;
    let _e540 = u_xlat1_;
    let _e545 = _v_buffer2_.v_cb2_[2];
    u_xlat1_.x = (_e540.w * _e545.w);
    let _e548 = u_xlat1_;
    let _e550 = u_xlat2_;
    u_xlat3_ = (_e548.xxxx * _e550);
    let _e552 = u_xlat4_;
    let _e554 = u_xlat0_;
    let _e556 = u_xlat3_;
    let _e558 = (_e554.xyz * _e556.www);
    u_xlat4_.x = _e558.x;
    u_xlat4_.y = _e558.y;
    u_xlat4_.z = _e558.z;
    let _e565 = u_xlat0_;
    let _e566 = u_xlat3_;
    u_xlat3_ = (_e565 * _e566);
    u_xlat4_.w = 0f;
    let _e570 = u_xlat2_;
    let _e571 = u_xlat1_;
    let _e574 = u_xlat4_;
    u_xlat1_ = ((_e570 * _e571.xxxx) + _e574);
    let _e576 = u_xlat1_;
    let _e577 = u_xlat0_;
    let _e580 = u_xlat3_;
    u_xlat0_ = ((_e576 * _e577.wwww) + -(_e580));
    let _e586 = _v_buffer2_.v_cb2_[16];
    let _e588 = u_xlat0_;
    let _e590 = u_xlat3_;
    vs_COLOR0_ = ((_e586.wwww * _e588) + _e590);
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
