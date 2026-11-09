struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 7>,
}

struct v_buffer2_ {
    v_cb2_: vec4<f32>,
}

struct VertexOutput {
    @location(12) vs_NORMAL0_: vec3<f32>,
    @location(0) vs_TEXCOORD0_: vec2<f32>,
    @location(1) vs_TEXCOORD1_: vec3<f32>,
    @builtin(position) gl_Position: vec4<f32>,
}

@group(0) @binding(0) 
var<uniform> _v_buffer0_: v_buffer0_;
@group(0) @binding(1) 
var<uniform> _v_buffer1_: v_buffer1_;
@group(0) @binding(2) 
var<uniform> _v_buffer2_: v_buffer2_;
var<private> in_POSITION0_1: vec4<f32>;
var<private> in_NORMAL0_1: vec3<f32>;
var<private> in_TEXCOORD0_1: vec2<f32>;
var<private> in_COLOR0_1: vec4<f32>;
var<private> vs_NORMAL0_: vec3<f32>;
var<private> vs_TEXCOORD0_: vec2<f32>;
var<private> vs_TEXCOORD1_: vec3<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: f32 = 0f;
    var u_xlat4_: vec2<f32> = vec2(0f);
    var u_xlat6_: f32 = 0f;

    let _e38 = _v_buffer0_.v_cb0_[15];
    let _e40 = _v_buffer2_;
    u_xlat0_.x = (_e38.x * _e40.v_cb2_.w);
    let _e44 = u_xlat0_;
    let _e46 = _v_buffer2_;
    u_xlat2_ = (_e44.x * _e46.v_cb2_.z);
    let _e50 = u_xlat2_;
    u_xlat2_ = sin(_e50);
    let _e52 = u_xlat2_;
    u_xlat2_ = (_e52 + 2f);
    let _e55 = u_xlat2_;
    let _e56 = _v_buffer2_;
    u_xlat2_ = (_e55 * _e56.v_cb2_.x);
    let _e60 = u_xlat2_;
    u_xlat2_ = (_e60 * 0.2f);
    let _e63 = u_xlat4_;
    let _e65 = in_POSITION0_1;
    let _e67 = _v_buffer2_;
    let _e70 = (_e65.xz * _e67.v_cb2_.yy);
    u_xlat4_.x = _e70.x;
    u_xlat4_.y = _e70.y;
    let _e75 = u_xlat0_;
    let _e77 = u_xlat0_;
    let _e83 = u_xlat4_;
    let _e85 = ((_e77.xx * vec2<f32>(30f, 42f)) + _e83.xy);
    u_xlat0_.x = _e85.x;
    u_xlat0_.z = _e85.y;
    let _e91 = u_xlat0_;
    u_xlat0_.x = sin(_e91.x);
    let _e95 = u_xlat0_;
    u_xlat0_.z = cos(_e95.z);
    let _e98 = u_xlat0_;
    let _e100 = u_xlat2_;
    let _e102 = u_xlat0_;
    let _e104 = (vec2(_e100) * _e102.xz);
    u_xlat0_.x = _e104.x;
    u_xlat0_.z = _e104.y;
    let _e109 = u_xlat0_;
    let _e111 = u_xlat0_;
    let _e116 = (_e111.xz * vec2<f32>(0.01f, 0.02f));
    u_xlat0_.x = _e116.x;
    u_xlat0_.z = _e116.y;
    let _e121 = u_xlat0_;
    let _e123 = u_xlat0_;
    let _e125 = in_COLOR0_1;
    let _e127 = (_e123.xz * _e125.xx);
    u_xlat0_.x = _e127.x;
    u_xlat0_.z = _e127.y;
    let _e132 = u_xlat0_;
    let _e134 = u_xlat0_;
    let _e142 = in_POSITION0_1;
    let _e144 = ((_e134.xxx * vec3<f32>(-0.5f, 0f, 0.25f)) + _e142.xyz);
    u_xlat0_.x = _e144.x;
    u_xlat0_.y = _e144.y;
    u_xlat0_.w = _e144.z;
    let _e151 = u_xlat0_;
    let _e153 = u_xlat0_;
    let _e162 = u_xlat0_;
    let _e164 = ((_e153.zzz * vec3<f32>(-0.3f, 0f, -0.5f)) + _e162.xyw);
    u_xlat0_.x = _e164.x;
    u_xlat0_.y = _e164.y;
    u_xlat0_.z = _e164.z;
    let _e171 = u_xlat0_;
    let _e176 = _v_buffer1_.v_cb1_[1];
    u_xlat1_ = (_e171.yyyy * _e176);
    let _e181 = _v_buffer1_.v_cb1_[0];
    let _e182 = u_xlat0_;
    let _e185 = u_xlat1_;
    u_xlat1_ = ((_e181 * _e182.xxxx) + _e185);
    let _e190 = _v_buffer1_.v_cb1_[2];
    let _e191 = u_xlat0_;
    let _e194 = u_xlat1_;
    u_xlat0_ = ((_e190 * _e191.zzzz) + _e194);
    let _e196 = u_xlat0_;
    let _e200 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e196 + _e200);
    let _e202 = u_xlat0_;
    let _e207 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e202.yyyy * _e207);
    let _e212 = _v_buffer0_.v_cb0_[79];
    let _e213 = u_xlat0_;
    let _e216 = u_xlat1_;
    u_xlat1_ = ((_e212 * _e213.xxxx) + _e216);
    let _e221 = _v_buffer0_.v_cb0_[81];
    let _e222 = u_xlat0_;
    let _e225 = u_xlat1_;
    u_xlat1_ = ((_e221 * _e222.zzzz) + _e225);
    let _e231 = _v_buffer0_.v_cb0_[82];
    let _e232 = u_xlat0_;
    let _e235 = u_xlat1_;
    gl_Position = ((_e231 * _e232.wwww) + _e235);
    let _e238 = in_NORMAL0_1;
    let _e243 = _v_buffer1_.v_cb1_[4];
    u_xlat0_.x = dot(_e238.xyz, _e243.xyz);
    let _e247 = in_NORMAL0_1;
    let _e252 = _v_buffer1_.v_cb1_[5];
    u_xlat0_.y = dot(_e247.xyz, _e252.xyz);
    let _e256 = in_NORMAL0_1;
    let _e261 = _v_buffer1_.v_cb1_[6];
    u_xlat0_.z = dot(_e256.xyz, _e261.xyz);
    let _e264 = u_xlat0_;
    let _e266 = u_xlat0_;
    u_xlat6_ = dot(_e264.xyz, _e266.xyz);
    let _e269 = u_xlat6_;
    u_xlat6_ = max(_e269, 0.000000000000000000000000000000000000011754944f);
    let _e272 = u_xlat6_;
    u_xlat6_ = inverseSqrt(_e272);
    let _e274 = vs_NORMAL0_;
    let _e276 = u_xlat6_;
    let _e278 = u_xlat0_;
    let _e280 = (vec3(_e276) * _e278.xyz);
    vs_NORMAL0_.x = _e280.x;
    vs_NORMAL0_.y = _e280.y;
    vs_NORMAL0_.z = _e280.z;
    let _e287 = vs_TEXCOORD0_;
    let _e289 = in_TEXCOORD0_1;
    let _e290 = _e289.xy;
    vs_TEXCOORD0_.x = _e290.x;
    vs_TEXCOORD0_.y = _e290.y;
    let _e295 = u_xlat0_;
    let _e297 = in_POSITION0_1;
    let _e302 = _v_buffer1_.v_cb1_[1];
    let _e304 = (_e297.yyy * _e302.xyz);
    u_xlat0_.x = _e304.x;
    u_xlat0_.y = _e304.y;
    u_xlat0_.z = _e304.z;
    let _e311 = u_xlat0_;
    let _e316 = _v_buffer1_.v_cb1_[0];
    let _e318 = in_POSITION0_1;
    let _e321 = u_xlat0_;
    let _e323 = ((_e316.xyz * _e318.xxx) + _e321.xyz);
    u_xlat0_.x = _e323.x;
    u_xlat0_.y = _e323.y;
    u_xlat0_.z = _e323.z;
    let _e330 = u_xlat0_;
    let _e335 = _v_buffer1_.v_cb1_[2];
    let _e337 = in_POSITION0_1;
    let _e340 = u_xlat0_;
    let _e342 = ((_e335.xyz * _e337.zzz) + _e340.xyz);
    u_xlat0_.x = _e342.x;
    u_xlat0_.y = _e342.y;
    u_xlat0_.z = _e342.z;
    let _e349 = vs_TEXCOORD1_;
    let _e351 = u_xlat0_;
    let _e356 = _v_buffer1_.v_cb1_[3];
    let _e358 = (_e351.xyz + _e356.xyz);
    vs_TEXCOORD1_.x = _e358.x;
    vs_TEXCOORD1_.y = _e358.y;
    vs_TEXCOORD1_.z = _e358.z;
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(1) in_NORMAL0_: vec3<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(3) in_COLOR0_: vec4<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_NORMAL0_1 = in_NORMAL0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_COLOR0_1 = in_COLOR0_;
    main_1();
    let _e32 = vs_NORMAL0_;
    let _e34 = vs_TEXCOORD0_;
    let _e36 = vs_TEXCOORD1_;
    let _e38 = gl_Position;
    return VertexOutput(_e32, _e34, _e36, _e38);
}
