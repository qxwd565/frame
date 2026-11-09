struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 30>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 10>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec4<f32>,
    @location(1) vs_TEXCOORD1_: vec4<f32>,
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
var<private> in_TEXCOORD1_1: vec2<f32>;
var<private> in_COLOR0_1: vec4<f32>;
var<private> vs_TEXCOORD0_: vec4<f32>;
var<private> vs_TEXCOORD1_: vec4<f32>;
var<private> vs_COLOR0_: vec4<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat4_: vec2<f32> = vec2(0f);
    var u_xlat5_: vec2<f32> = vec2(0f);

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
    let _e100 = in_TEXCOORD1_1;
    let _e105 = _v_buffer2_.v_cb2_[0];
    let _e111 = _v_buffer2_.v_cb2_[0];
    let _e113 = ((_e100.xy * _e105.xy) + _e111.zw);
    u_xlat0_.x = _e113.x;
    u_xlat0_.y = _e113.y;
    let _e118 = vs_TEXCOORD0_;
    let _e123 = _v_buffer0_.v_cb0_[15];
    let _e128 = _v_buffer2_.v_cb2_[6];
    let _e131 = u_xlat0_;
    let _e133 = ((_e123.xx * _e128.yz) + _e131.xy);
    vs_TEXCOORD0_.x = _e133.x;
    vs_TEXCOORD0_.y = _e133.y;
    let _e138 = u_xlat0_;
    let _e140 = in_TEXCOORD0_1;
    let _e145 = _v_buffer2_.v_cb2_[0];
    let _e151 = _v_buffer2_.v_cb2_[0];
    let _e153 = ((_e140.xy * _e145.xy) + _e151.zw);
    u_xlat0_.x = _e153.x;
    u_xlat0_.y = _e153.y;
    let _e159 = u_xlat0_;
    let _e164 = _v_buffer2_.v_cb2_[7];
    u_xlat4_.x = (_e159.x * _e164.y);
    let _e171 = _v_buffer0_.v_cb0_[15];
    let _e176 = _v_buffer2_.v_cb2_[6];
    let _e179 = u_xlat4_;
    u_xlat4_.x = ((_e171.x * _e176.w) + _e179.x);
    let _e182 = u_xlat1_;
    let _e187 = _v_buffer0_.v_cb0_[15];
    let _e192 = _v_buffer2_.v_cb2_[7];
    let _e194 = (_e187.xx * _e192.xw);
    u_xlat1_.x = _e194.x;
    u_xlat1_.y = _e194.y;
    let _e200 = u_xlat0_;
    let _e205 = _v_buffer2_.v_cb2_[7];
    let _e208 = u_xlat1_;
    u_xlat4_.y = ((_e200.y * _e205.z) + _e208.x);
    let _e211 = vs_TEXCOORD0_;
    let _e213 = u_xlat4_;
    let _e218 = _v_buffer2_.v_cb2_[9];
    let _e220 = (_e213.xy + _e218.xx);
    vs_TEXCOORD0_.z = _e220.x;
    vs_TEXCOORD0_.w = _e220.y;
    let _e225 = u_xlat4_;
    let _e227 = u_xlat0_;
    let _e232 = _v_buffer2_.v_cb2_[4];
    let _e234 = (_e227.xy + _e232.yz);
    u_xlat4_.x = _e234.x;
    u_xlat4_.y = _e234.y;
    let _e239 = u_xlat0_;
    let _e241 = u_xlat0_;
    let _e246 = _v_buffer2_.v_cb2_[5];
    let _e248 = (_e241.xy * _e246.ww);
    u_xlat0_.x = _e248.x;
    u_xlat0_.y = _e248.y;
    let _e254 = u_xlat4_;
    let _e259 = _v_buffer2_.v_cb2_[8];
    let _e262 = u_xlat1_;
    u_xlat5_.x = ((_e254.x * _e259.y) + _e262.y);
    let _e266 = u_xlat4_;
    let _e271 = _v_buffer2_.v_cb2_[8];
    u_xlat4_.x = (_e266.y * _e271.z);
    let _e278 = _v_buffer0_.v_cb0_[15];
    let _e283 = _v_buffer2_.v_cb2_[8];
    let _e286 = u_xlat4_;
    u_xlat5_.y = ((_e278.x * _e283.x) + _e286.x);
    let _e289 = vs_TEXCOORD1_;
    let _e291 = u_xlat5_;
    let _e296 = _v_buffer2_.v_cb2_[9];
    let _e298 = (_e291.xy + _e296.xx);
    vs_TEXCOORD1_.z = _e298.x;
    vs_TEXCOORD1_.w = _e298.y;
    let _e307 = _v_buffer0_.v_cb0_[15];
    let _e312 = _v_buffer2_.v_cb2_[4];
    let _e315 = u_xlat0_;
    u_xlat1_.x = ((_e307.x * _e312.w) + _e315.x);
    let _e322 = _v_buffer0_.v_cb0_[15];
    let _e327 = _v_buffer2_.v_cb2_[5];
    let _e330 = u_xlat0_;
    u_xlat1_.y = ((_e322.x * _e327.x) + _e330.y);
    let _e333 = vs_TEXCOORD1_;
    let _e335 = u_xlat1_;
    let _e340 = _v_buffer2_.v_cb2_[5];
    let _e342 = (_e335.xy + _e340.yz);
    vs_TEXCOORD1_.x = _e342.x;
    vs_TEXCOORD1_.y = _e342.y;
    let _e351 = _v_buffer1_.v_cb1_[27];
    u_xlat0_.x = abs(_e351.w);
    let _e358 = _v_buffer1_.v_cb1_[28];
    u_xlat0_.y = abs(_e358.w);
    let _e365 = _v_buffer1_.v_cb1_[29];
    u_xlat0_.z = abs(_e365.w);
    let _e368 = u_xlat0_;
    let _e370 = u_xlat0_;
    let _e372 = log2(_e370.xyz);
    u_xlat0_.x = _e372.x;
    u_xlat0_.y = _e372.y;
    u_xlat0_.z = _e372.z;
    let _e379 = u_xlat0_;
    let _e381 = u_xlat0_;
    let _e387 = (_e381.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat0_.x = _e387.x;
    u_xlat0_.y = _e387.y;
    u_xlat0_.z = _e387.z;
    let _e394 = u_xlat0_;
    let _e396 = u_xlat0_;
    let _e398 = exp2(_e396.xyz);
    u_xlat0_.x = _e398.x;
    u_xlat0_.y = _e398.y;
    u_xlat0_.z = _e398.z;
    let _e405 = u_xlat0_;
    let _e407 = u_xlat0_;
    let _e421 = ((_e407.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat0_.x = _e421.x;
    u_xlat0_.y = _e421.y;
    u_xlat0_.z = _e421.z;
    let _e428 = u_xlat0_;
    let _e430 = u_xlat0_;
    let _e436 = clamp(_e430.xyz, vec3(0f), vec3(1f));
    u_xlat0_.x = _e436.x;
    u_xlat0_.y = _e436.y;
    u_xlat0_.z = _e436.z;
    let _e443 = u_xlat0_;
    let _e445 = u_xlat0_;
    let _e450 = _v_buffer0_.v_cb0_[6];
    let _e452 = (_e445.xyz + _e450.xyz);
    u_xlat0_.x = _e452.x;
    u_xlat0_.y = _e452.y;
    u_xlat0_.z = _e452.z;
    let _e459 = u_xlat0_;
    let _e461 = u_xlat0_;
    let _e470 = (_e461.xyz + vec3<f32>(-1f, -1f, -1f));
    u_xlat0_.x = _e470.x;
    u_xlat0_.y = _e470.y;
    u_xlat0_.z = _e470.z;
    u_xlat0_.w = 0f;
    let _e482 = _v_buffer2_.v_cb2_[8];
    let _e484 = u_xlat0_;
    u_xlat0_ = ((_e482.wwww * _e484) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e492 = in_COLOR0_1;
    let _e496 = _v_buffer2_.v_cb2_[3];
    u_xlat1_ = (_e492 * _e496.xxxx);
    let _e499 = u_xlat1_;
    let _e503 = _v_buffer2_.v_cb2_[1];
    u_xlat1_ = (_e499 * _e503);
    let _e505 = u_xlat0_;
    let _e506 = u_xlat1_;
    vs_COLOR0_ = (_e505 * _e506);
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(5) in_TEXCOORD1_: vec2<f32>, @location(3) in_COLOR0_: vec4<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_TEXCOORD1_1 = in_TEXCOORD1_;
    in_COLOR0_1 = in_COLOR0_;
    main_1();
    let _e32 = vs_TEXCOORD0_;
    let _e34 = vs_TEXCOORD1_;
    let _e36 = vs_COLOR0_;
    let _e38 = gl_Position;
    return VertexOutput(_e32, _e34, _e36, _e38);
}
