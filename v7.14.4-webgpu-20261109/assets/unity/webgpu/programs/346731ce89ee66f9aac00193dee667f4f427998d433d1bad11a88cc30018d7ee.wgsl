struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 4>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 4>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec2<f32>,
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
var<private> vs_TEXCOORD0_: vec2<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: f32 = 0f;
    var u_xlat4_: vec2<f32> = vec2(0f);

    let _e32 = _v_buffer0_.v_cb0_[15];
    let _e37 = _v_buffer2_.v_cb2_[3];
    u_xlat0_.x = (_e32.x * _e37.x);
    let _e40 = u_xlat0_;
    let _e45 = _v_buffer2_.v_cb2_[2];
    u_xlat2_ = (_e40.x * _e45.w);
    let _e48 = u_xlat2_;
    u_xlat2_ = sin(_e48);
    let _e50 = u_xlat2_;
    u_xlat2_ = (_e50 + 2f);
    let _e53 = u_xlat2_;
    u_xlat2_ = (_e53 * 0.2f);
    let _e56 = u_xlat4_;
    let _e58 = in_POSITION0_1;
    let _e63 = _v_buffer2_.v_cb2_[2];
    let _e65 = (_e58.xz * _e63.zz);
    u_xlat4_.x = _e65.x;
    u_xlat4_.y = _e65.y;
    let _e70 = u_xlat0_;
    let _e72 = u_xlat0_;
    let _e78 = u_xlat4_;
    let _e80 = ((_e72.xx * vec2<f32>(30f, 42f)) + _e78.xy);
    u_xlat0_.x = _e80.x;
    u_xlat0_.z = _e80.y;
    let _e86 = u_xlat0_;
    u_xlat0_.x = sin(_e86.x);
    let _e90 = u_xlat0_;
    u_xlat0_.z = cos(_e90.z);
    let _e93 = u_xlat0_;
    let _e95 = u_xlat0_;
    let _e100 = _v_buffer2_.v_cb2_[2];
    let _e102 = (_e95.xz * _e100.yy);
    u_xlat0_.x = _e102.x;
    u_xlat0_.z = _e102.y;
    let _e107 = u_xlat0_;
    let _e109 = u_xlat2_;
    let _e111 = u_xlat0_;
    let _e113 = (vec2(_e109) * _e111.xz);
    u_xlat0_.x = _e113.x;
    u_xlat0_.z = _e113.y;
    let _e118 = u_xlat0_;
    let _e120 = u_xlat0_;
    let _e125 = (_e120.xz * vec2<f32>(0.01f, 0.02f));
    u_xlat0_.x = _e125.x;
    u_xlat0_.z = _e125.y;
    let _e130 = u_xlat0_;
    let _e132 = u_xlat0_;
    let _e134 = in_COLOR0_1;
    let _e136 = (_e132.xz * _e134.xx);
    u_xlat0_.x = _e136.x;
    u_xlat0_.z = _e136.y;
    let _e141 = u_xlat0_;
    let _e143 = u_xlat0_;
    let _e151 = in_POSITION0_1;
    let _e153 = ((_e143.xxx * vec3<f32>(-1f, 0f, 0.5f)) + _e151.xyz);
    u_xlat0_.x = _e153.x;
    u_xlat0_.y = _e153.y;
    u_xlat0_.w = _e153.z;
    let _e160 = u_xlat0_;
    let _e162 = u_xlat0_;
    let _e171 = u_xlat0_;
    let _e173 = ((_e162.zzz * vec3<f32>(-0.3f, -1f, 0f)) + _e171.xyw);
    u_xlat0_.x = _e173.x;
    u_xlat0_.y = _e173.y;
    u_xlat0_.z = _e173.z;
    let _e180 = u_xlat0_;
    let _e185 = _v_buffer1_.v_cb1_[1];
    u_xlat1_ = (_e180.yyyy * _e185);
    let _e190 = _v_buffer1_.v_cb1_[0];
    let _e191 = u_xlat0_;
    let _e194 = u_xlat1_;
    u_xlat1_ = ((_e190 * _e191.xxxx) + _e194);
    let _e199 = _v_buffer1_.v_cb1_[2];
    let _e200 = u_xlat0_;
    let _e203 = u_xlat1_;
    u_xlat0_ = ((_e199 * _e200.zzzz) + _e203);
    let _e205 = u_xlat0_;
    let _e209 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e205 + _e209);
    let _e211 = u_xlat0_;
    let _e216 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e211.yyyy * _e216);
    let _e221 = _v_buffer0_.v_cb0_[79];
    let _e222 = u_xlat0_;
    let _e225 = u_xlat1_;
    u_xlat1_ = ((_e221 * _e222.xxxx) + _e225);
    let _e230 = _v_buffer0_.v_cb0_[81];
    let _e231 = u_xlat0_;
    let _e234 = u_xlat1_;
    u_xlat1_ = ((_e230 * _e231.zzzz) + _e234);
    let _e240 = _v_buffer0_.v_cb0_[82];
    let _e241 = u_xlat0_;
    let _e244 = u_xlat1_;
    gl_Position = ((_e240 * _e241.wwww) + _e244);
    let _e246 = vs_TEXCOORD0_;
    let _e248 = in_TEXCOORD0_1;
    let _e253 = _v_buffer2_.v_cb2_[0];
    let _e259 = _v_buffer2_.v_cb2_[0];
    let _e261 = ((_e248.xy * _e253.xy) + _e259.zw);
    vs_TEXCOORD0_.x = _e261.x;
    vs_TEXCOORD0_.y = _e261.y;
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(3) in_COLOR0_: vec4<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_COLOR0_1 = in_COLOR0_;
    main_1();
    let _e24 = vs_TEXCOORD0_;
    let _e26 = gl_Position;
    return VertexOutput(_e24, _e26);
}
