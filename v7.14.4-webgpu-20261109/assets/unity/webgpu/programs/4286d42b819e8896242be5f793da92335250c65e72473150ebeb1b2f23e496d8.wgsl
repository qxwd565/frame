struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 30>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 5>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec2<f32>,
    @location(10) vs_COLOR0_: vec4<f32>,
    @location(11) vs_COLOR1_: vec4<f32>,
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
var<private> vs_COLOR1_: vec4<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: f32 = 0f;
    var u_xlat6_: f32 = 0f;

    let _e30 = in_POSITION0_1;
    let _e35 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e30.yyyy * _e35);
    let _e40 = _v_buffer1_.v_cb1_[0];
    let _e41 = in_POSITION0_1;
    let _e44 = u_xlat0_;
    u_xlat0_ = ((_e40 * _e41.xxxx) + _e44);
    let _e49 = _v_buffer1_.v_cb1_[2];
    let _e50 = in_POSITION0_1;
    let _e53 = u_xlat0_;
    u_xlat0_ = ((_e49 * _e50.zzzz) + _e53);
    let _e55 = u_xlat0_;
    let _e59 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e55 + _e59);
    let _e61 = u_xlat0_;
    let _e66 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e61.yyyy * _e66);
    let _e71 = _v_buffer0_.v_cb0_[79];
    let _e72 = u_xlat0_;
    let _e75 = u_xlat1_;
    u_xlat1_ = ((_e71 * _e72.xxxx) + _e75);
    let _e80 = _v_buffer0_.v_cb0_[81];
    let _e81 = u_xlat0_;
    let _e84 = u_xlat1_;
    u_xlat1_ = ((_e80 * _e81.zzzz) + _e84);
    let _e90 = _v_buffer0_.v_cb0_[82];
    let _e91 = u_xlat0_;
    let _e94 = u_xlat1_;
    gl_Position = ((_e90 * _e91.wwww) + _e94);
    let _e96 = vs_TEXCOORD0_;
    let _e98 = in_TEXCOORD0_1;
    let _e103 = _v_buffer2_.v_cb2_[0];
    let _e109 = _v_buffer2_.v_cb2_[0];
    let _e111 = ((_e98.xy * _e103.xy) + _e109.zw);
    vs_TEXCOORD0_.x = _e111.x;
    vs_TEXCOORD0_.y = _e111.y;
    let _e120 = _v_buffer1_.v_cb1_[27];
    u_xlat0_.x = abs(_e120.w);
    let _e127 = _v_buffer1_.v_cb1_[28];
    u_xlat0_.y = abs(_e127.w);
    let _e134 = _v_buffer1_.v_cb1_[29];
    u_xlat0_.z = abs(_e134.w);
    let _e137 = u_xlat0_;
    let _e139 = u_xlat0_;
    let _e141 = log2(_e139.xyz);
    u_xlat0_.x = _e141.x;
    u_xlat0_.y = _e141.y;
    u_xlat0_.z = _e141.z;
    let _e148 = u_xlat0_;
    let _e150 = u_xlat0_;
    let _e156 = (_e150.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat0_.x = _e156.x;
    u_xlat0_.y = _e156.y;
    u_xlat0_.z = _e156.z;
    let _e163 = u_xlat0_;
    let _e165 = u_xlat0_;
    let _e167 = exp2(_e165.xyz);
    u_xlat0_.x = _e167.x;
    u_xlat0_.y = _e167.y;
    u_xlat0_.z = _e167.z;
    let _e174 = u_xlat0_;
    let _e176 = u_xlat0_;
    let _e190 = ((_e176.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat0_.x = _e190.x;
    u_xlat0_.y = _e190.y;
    u_xlat0_.z = _e190.z;
    let _e197 = u_xlat0_;
    let _e199 = u_xlat0_;
    let _e205 = clamp(_e199.xyz, vec3(0f), vec3(1f));
    u_xlat0_.x = _e205.x;
    u_xlat0_.y = _e205.y;
    u_xlat0_.z = _e205.z;
    let _e212 = u_xlat0_;
    let _e214 = u_xlat0_;
    let _e219 = _v_buffer0_.v_cb0_[6];
    let _e221 = (_e214.xyz + _e219.xyz);
    u_xlat0_.x = _e221.x;
    u_xlat0_.y = _e221.y;
    u_xlat0_.z = _e221.z;
    u_xlat0_.w = 1f;
    let _e230 = u_xlat0_;
    let _e231 = in_COLOR0_1;
    u_xlat0_ = (_e230 + -(_e231));
    let _e237 = _v_buffer2_.v_cb2_[4];
    let _e239 = u_xlat0_;
    let _e241 = in_COLOR0_1;
    u_xlat0_ = ((_e237.yyyy * _e239) + _e241);
    let _e243 = u_xlat0_;
    let _e247 = _v_buffer2_.v_cb2_[1];
    vs_COLOR0_ = (_e243 * _e247);
    let _e249 = u_xlat0_;
    let _e254 = _v_buffer0_.v_cb0_[21];
    let _e259 = _v_buffer1_.v_cb1_[5];
    let _e261 = (_e254.yyy * _e259.xyz);
    u_xlat0_.x = _e261.x;
    u_xlat0_.y = _e261.y;
    u_xlat0_.z = _e261.z;
    let _e268 = u_xlat0_;
    let _e273 = _v_buffer1_.v_cb1_[4];
    let _e278 = _v_buffer0_.v_cb0_[21];
    let _e281 = u_xlat0_;
    let _e283 = ((_e273.xyz * _e278.xxx) + _e281.xyz);
    u_xlat0_.x = _e283.x;
    u_xlat0_.y = _e283.y;
    u_xlat0_.z = _e283.z;
    let _e290 = u_xlat0_;
    let _e295 = _v_buffer1_.v_cb1_[6];
    let _e300 = _v_buffer0_.v_cb0_[21];
    let _e303 = u_xlat0_;
    let _e305 = ((_e295.xyz * _e300.zzz) + _e303.xyz);
    u_xlat0_.x = _e305.x;
    u_xlat0_.y = _e305.y;
    u_xlat0_.z = _e305.z;
    let _e312 = u_xlat0_;
    let _e314 = u_xlat0_;
    let _e319 = _v_buffer1_.v_cb1_[7];
    let _e321 = (_e314.xyz + _e319.xyz);
    u_xlat0_.x = _e321.x;
    u_xlat0_.y = _e321.y;
    u_xlat0_.z = _e321.z;
    let _e328 = u_xlat0_;
    let _e330 = u_xlat0_;
    let _e332 = in_POSITION0_1;
    let _e335 = (_e330.xyz + -(_e332.xyz));
    u_xlat0_.x = _e335.x;
    u_xlat0_.y = _e335.y;
    u_xlat0_.z = _e335.z;
    let _e342 = u_xlat0_;
    let _e344 = u_xlat0_;
    u_xlat6_ = dot(_e342.xyz, _e344.xyz);
    let _e347 = u_xlat6_;
    u_xlat6_ = inverseSqrt(_e347);
    let _e349 = u_xlat0_;
    let _e351 = u_xlat6_;
    let _e353 = u_xlat0_;
    let _e355 = (vec3(_e351) * _e353.xyz);
    u_xlat0_.x = _e355.x;
    u_xlat0_.y = _e355.y;
    u_xlat0_.z = _e355.z;
    let _e363 = in_NORMAL0_1;
    let _e365 = u_xlat0_;
    u_xlat0_.x = dot(_e363.xyz, _e365.xyz);
    let _e369 = u_xlat0_;
    u_xlat0_.x = clamp(_e369.x, 0f, 1f);
    let _e375 = u_xlat0_;
    u_xlat0_.x = (-(_e375.x) + 1f);
    let _e383 = _v_buffer2_.v_cb2_[2];
    u_xlat2_ = (-(_e383.x) + 1f);
    let _e389 = u_xlat2_;
    let _e391 = u_xlat0_;
    u_xlat0_.x = (-(_e389) + _e391.x);
    let _e394 = u_xlat2_;
    u_xlat2_ = (-(_e394) + 1f);
    let _e400 = u_xlat2_;
    u_xlat2_ = (1f / _e400);
    let _e403 = u_xlat2_;
    let _e404 = u_xlat0_;
    u_xlat0_.x = (_e403 * _e404.x);
    let _e408 = u_xlat0_;
    u_xlat0_.x = clamp(_e408.x, 0f, 1f);
    let _e413 = u_xlat0_;
    u_xlat2_ = ((_e413.x * -2f) + 3f);
    let _e421 = u_xlat0_;
    let _e423 = u_xlat0_;
    u_xlat0_.x = (_e421.x * _e423.x);
    let _e427 = u_xlat0_;
    let _e429 = u_xlat2_;
    u_xlat0_.x = (_e427.x * _e429);
    let _e432 = u_xlat0_;
    u_xlat0_.x = (_e432.x * 0.5f);
    let _e436 = u_xlat0_;
    let _e441 = _v_buffer2_.v_cb2_[3];
    u_xlat0_ = (_e436.xxxx * _e441);
    let _e443 = u_xlat0_;
    let _e447 = _v_buffer2_.v_cb2_[4];
    vs_COLOR1_ = (_e443 * _e447.xxxx);
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
    let _e36 = vs_COLOR1_;
    let _e38 = gl_Position;
    return VertexOutput(_e32, _e34, _e36, _e38);
}
