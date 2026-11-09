struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 30>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 7>,
}

struct VertexOutput {
    @location(10) vs_COLOR0_: vec4<f32>,
    @location(0) vs_TEXCOORD0_: vec3<f32>,
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
var<private> vs_COLOR0_: vec4<f32>;
var<private> vs_TEXCOORD0_: vec3<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: f32 = 0f;
    var u_xlat6_: f32 = 0f;

    let _e29 = in_POSITION0_1;
    let _e34 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e29.yyyy * _e34);
    let _e39 = _v_buffer1_.v_cb1_[0];
    let _e40 = in_POSITION0_1;
    let _e43 = u_xlat0_;
    u_xlat0_ = ((_e39 * _e40.xxxx) + _e43);
    let _e48 = _v_buffer1_.v_cb1_[2];
    let _e49 = in_POSITION0_1;
    let _e52 = u_xlat0_;
    u_xlat0_ = ((_e48 * _e49.zzzz) + _e52);
    let _e54 = u_xlat0_;
    let _e58 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e54 + _e58);
    let _e60 = u_xlat0_;
    let _e65 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e60.yyyy * _e65);
    let _e70 = _v_buffer0_.v_cb0_[79];
    let _e71 = u_xlat0_;
    let _e74 = u_xlat1_;
    u_xlat1_ = ((_e70 * _e71.xxxx) + _e74);
    let _e79 = _v_buffer0_.v_cb0_[81];
    let _e80 = u_xlat0_;
    let _e83 = u_xlat1_;
    u_xlat1_ = ((_e79 * _e80.zzzz) + _e83);
    let _e89 = _v_buffer0_.v_cb0_[82];
    let _e90 = u_xlat0_;
    let _e93 = u_xlat1_;
    gl_Position = ((_e89 * _e90.wwww) + _e93);
    let _e99 = _v_buffer1_.v_cb1_[27];
    u_xlat0_.x = abs(_e99.w);
    let _e106 = _v_buffer1_.v_cb1_[28];
    u_xlat0_.y = abs(_e106.w);
    let _e113 = _v_buffer1_.v_cb1_[29];
    u_xlat0_.z = abs(_e113.w);
    let _e116 = u_xlat0_;
    let _e118 = u_xlat0_;
    let _e120 = log2(_e118.xyz);
    u_xlat0_.x = _e120.x;
    u_xlat0_.y = _e120.y;
    u_xlat0_.z = _e120.z;
    let _e127 = u_xlat0_;
    let _e129 = u_xlat0_;
    let _e135 = (_e129.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat0_.x = _e135.x;
    u_xlat0_.y = _e135.y;
    u_xlat0_.z = _e135.z;
    let _e142 = u_xlat0_;
    let _e144 = u_xlat0_;
    let _e146 = exp2(_e144.xyz);
    u_xlat0_.x = _e146.x;
    u_xlat0_.y = _e146.y;
    u_xlat0_.z = _e146.z;
    let _e153 = u_xlat0_;
    let _e155 = u_xlat0_;
    let _e169 = ((_e155.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat0_.x = _e169.x;
    u_xlat0_.y = _e169.y;
    u_xlat0_.z = _e169.z;
    let _e176 = u_xlat0_;
    let _e178 = u_xlat0_;
    let _e184 = clamp(_e178.xyz, vec3(0f), vec3(1f));
    u_xlat0_.x = _e184.x;
    u_xlat0_.y = _e184.y;
    u_xlat0_.z = _e184.z;
    let _e191 = u_xlat0_;
    let _e193 = u_xlat0_;
    let _e198 = _v_buffer0_.v_cb0_[6];
    let _e200 = (_e193.xyz + _e198.xyz);
    u_xlat0_.x = _e200.x;
    u_xlat0_.y = _e200.y;
    u_xlat0_.z = _e200.z;
    let _e207 = u_xlat0_;
    let _e209 = u_xlat0_;
    let _e218 = (_e209.xyz + vec3<f32>(-1f, -1f, -1f));
    u_xlat0_.x = _e218.x;
    u_xlat0_.y = _e218.y;
    u_xlat0_.z = _e218.z;
    u_xlat0_.w = 0f;
    let _e230 = _v_buffer2_.v_cb2_[6];
    let _e232 = u_xlat0_;
    u_xlat0_ = ((_e230.xxxx * _e232) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e240 = u_xlat0_;
    let _e241 = in_COLOR0_1;
    u_xlat0_ = (_e240 * _e241);
    let _e243 = u_xlat0_;
    let _e247 = _v_buffer2_.v_cb2_[1];
    u_xlat0_ = (_e243 * _e247);
    let _e249 = u_xlat0_;
    let _e253 = _v_buffer2_.v_cb2_[0];
    vs_COLOR0_ = (_e249 * _e253.xxxx);
    let _e256 = u_xlat0_;
    let _e261 = _v_buffer0_.v_cb0_[21];
    let _e266 = _v_buffer1_.v_cb1_[5];
    let _e268 = (_e261.yyy * _e266.xyz);
    u_xlat0_.x = _e268.x;
    u_xlat0_.y = _e268.y;
    u_xlat0_.z = _e268.z;
    let _e275 = u_xlat0_;
    let _e280 = _v_buffer1_.v_cb1_[4];
    let _e285 = _v_buffer0_.v_cb0_[21];
    let _e288 = u_xlat0_;
    let _e290 = ((_e280.xyz * _e285.xxx) + _e288.xyz);
    u_xlat0_.x = _e290.x;
    u_xlat0_.y = _e290.y;
    u_xlat0_.z = _e290.z;
    let _e297 = u_xlat0_;
    let _e302 = _v_buffer1_.v_cb1_[6];
    let _e307 = _v_buffer0_.v_cb0_[21];
    let _e310 = u_xlat0_;
    let _e312 = ((_e302.xyz * _e307.zzz) + _e310.xyz);
    u_xlat0_.x = _e312.x;
    u_xlat0_.y = _e312.y;
    u_xlat0_.z = _e312.z;
    let _e319 = u_xlat0_;
    let _e321 = u_xlat0_;
    let _e326 = _v_buffer1_.v_cb1_[7];
    let _e328 = (_e321.xyz + _e326.xyz);
    u_xlat0_.x = _e328.x;
    u_xlat0_.y = _e328.y;
    u_xlat0_.z = _e328.z;
    let _e335 = u_xlat0_;
    let _e337 = u_xlat0_;
    let _e339 = in_POSITION0_1;
    let _e342 = (_e337.xyz + -(_e339.xyz));
    u_xlat0_.x = _e342.x;
    u_xlat0_.y = _e342.y;
    u_xlat0_.z = _e342.z;
    let _e349 = u_xlat0_;
    let _e351 = u_xlat0_;
    u_xlat6_ = dot(_e349.xyz, _e351.xyz);
    let _e354 = u_xlat6_;
    u_xlat6_ = inverseSqrt(_e354);
    let _e356 = u_xlat0_;
    let _e358 = u_xlat6_;
    let _e360 = u_xlat0_;
    let _e362 = (vec3(_e358) * _e360.xyz);
    u_xlat0_.x = _e362.x;
    u_xlat0_.y = _e362.y;
    u_xlat0_.z = _e362.z;
    let _e370 = in_NORMAL0_1;
    let _e372 = u_xlat0_;
    u_xlat0_.x = dot(_e370.xyz, _e372.xyz);
    let _e376 = u_xlat0_;
    u_xlat0_.x = clamp(_e376.x, 0f, 1f);
    let _e384 = _v_buffer2_.v_cb2_[4];
    u_xlat2_ = (-(_e384.x) + 1f);
    let _e390 = u_xlat2_;
    let _e392 = u_xlat0_;
    u_xlat0_.x = (-(_e390) + _e392.x);
    let _e395 = u_xlat2_;
    u_xlat2_ = (-(_e395) + 1f);
    let _e401 = u_xlat2_;
    u_xlat2_ = (1f / _e401);
    let _e404 = u_xlat2_;
    let _e405 = u_xlat0_;
    u_xlat0_.x = (_e404 * _e405.x);
    let _e409 = u_xlat0_;
    u_xlat0_.x = clamp(_e409.x, 0f, 1f);
    let _e414 = u_xlat0_;
    u_xlat2_ = ((_e414.x * -2f) + 3f);
    let _e422 = u_xlat0_;
    let _e424 = u_xlat0_;
    u_xlat0_.x = (_e422.x * _e424.x);
    let _e428 = u_xlat0_;
    let _e430 = u_xlat2_;
    u_xlat0_.x = (_e428.x * _e430);
    let _e433 = u_xlat0_;
    vs_TEXCOORD0_.z = (_e433.x * 0.5f);
    let _e437 = u_xlat0_;
    let _e439 = in_TEXCOORD0_1;
    let _e444 = _v_buffer2_.v_cb2_[2];
    let _e446 = (_e439.xy + _e444.xy);
    u_xlat0_.x = _e446.x;
    u_xlat0_.y = _e446.y;
    let _e451 = vs_TEXCOORD0_;
    let _e453 = u_xlat0_;
    let _e458 = _v_buffer2_.v_cb2_[5];
    let _e464 = _v_buffer2_.v_cb2_[5];
    let _e466 = ((_e453.xy * _e458.xy) + _e464.zw);
    vs_TEXCOORD0_.x = _e466.x;
    vs_TEXCOORD0_.y = _e466.y;
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(3) in_COLOR0_: vec4<f32>, @location(1) in_NORMAL0_: vec3<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_COLOR0_1 = in_COLOR0_;
    in_NORMAL0_1 = in_NORMAL0_;
    main_1();
    let _e30 = vs_COLOR0_;
    let _e32 = vs_TEXCOORD0_;
    let _e34 = gl_Position;
    return VertexOutput(_e30, _e32, _e34);
}
