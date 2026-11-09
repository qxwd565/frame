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
    @location(0) vs_TEXCOORD0_: vec2<f32>,
    @location(1) vs_TEXCOORD1_: vec3<f32>,
    @location(12) vs_NORMAL0_: vec3<f32>,
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
var<private> in_NORMAL0_1: vec3<f32>;
var<private> vs_TEXCOORD0_: vec2<f32>;
var<private> vs_TEXCOORD1_: vec3<f32>;
var<private> vs_NORMAL0_: vec3<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat6_: f32 = 0f;

    let _e26 = in_POSITION0_1;
    let _e31 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e26.yyyy * _e31);
    let _e36 = _v_buffer1_.v_cb1_[0];
    let _e37 = in_POSITION0_1;
    let _e40 = u_xlat0_;
    u_xlat0_ = ((_e36 * _e37.xxxx) + _e40);
    let _e45 = _v_buffer1_.v_cb1_[2];
    let _e46 = in_POSITION0_1;
    let _e49 = u_xlat0_;
    u_xlat0_ = ((_e45 * _e46.zzzz) + _e49);
    let _e51 = u_xlat0_;
    let _e55 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e51 + _e55);
    let _e57 = u_xlat0_;
    let _e62 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e57.yyyy * _e62);
    let _e67 = _v_buffer0_.v_cb0_[79];
    let _e68 = u_xlat0_;
    let _e71 = u_xlat1_;
    u_xlat1_ = ((_e67 * _e68.xxxx) + _e71);
    let _e76 = _v_buffer0_.v_cb0_[81];
    let _e77 = u_xlat0_;
    let _e80 = u_xlat1_;
    u_xlat1_ = ((_e76 * _e77.zzzz) + _e80);
    let _e86 = _v_buffer0_.v_cb0_[82];
    let _e87 = u_xlat0_;
    let _e90 = u_xlat1_;
    gl_Position = ((_e86 * _e87.wwww) + _e90);
    let _e92 = vs_TEXCOORD0_;
    let _e94 = in_TEXCOORD0_1;
    let _e96 = _v_buffer2_;
    let _e100 = _v_buffer2_;
    let _e103 = ((_e94.xy * _e96.v_cb2_.xy) + _e100.v_cb2_.zw);
    vs_TEXCOORD0_.x = _e103.x;
    vs_TEXCOORD0_.y = _e103.y;
    let _e108 = u_xlat0_;
    let _e110 = in_POSITION0_1;
    let _e115 = _v_buffer1_.v_cb1_[1];
    let _e117 = (_e110.yyy * _e115.xyz);
    u_xlat0_.x = _e117.x;
    u_xlat0_.y = _e117.y;
    u_xlat0_.z = _e117.z;
    let _e124 = u_xlat0_;
    let _e129 = _v_buffer1_.v_cb1_[0];
    let _e131 = in_POSITION0_1;
    let _e134 = u_xlat0_;
    let _e136 = ((_e129.xyz * _e131.xxx) + _e134.xyz);
    u_xlat0_.x = _e136.x;
    u_xlat0_.y = _e136.y;
    u_xlat0_.z = _e136.z;
    let _e143 = u_xlat0_;
    let _e148 = _v_buffer1_.v_cb1_[2];
    let _e150 = in_POSITION0_1;
    let _e153 = u_xlat0_;
    let _e155 = ((_e148.xyz * _e150.zzz) + _e153.xyz);
    u_xlat0_.x = _e155.x;
    u_xlat0_.y = _e155.y;
    u_xlat0_.z = _e155.z;
    let _e162 = vs_TEXCOORD1_;
    let _e164 = u_xlat0_;
    let _e169 = _v_buffer1_.v_cb1_[3];
    let _e171 = (_e164.xyz + _e169.xyz);
    vs_TEXCOORD1_.x = _e171.x;
    vs_TEXCOORD1_.y = _e171.y;
    vs_TEXCOORD1_.z = _e171.z;
    let _e179 = in_NORMAL0_1;
    let _e184 = _v_buffer1_.v_cb1_[4];
    u_xlat0_.x = dot(_e179.xyz, _e184.xyz);
    let _e188 = in_NORMAL0_1;
    let _e193 = _v_buffer1_.v_cb1_[5];
    u_xlat0_.y = dot(_e188.xyz, _e193.xyz);
    let _e197 = in_NORMAL0_1;
    let _e202 = _v_buffer1_.v_cb1_[6];
    u_xlat0_.z = dot(_e197.xyz, _e202.xyz);
    let _e205 = u_xlat0_;
    let _e207 = u_xlat0_;
    u_xlat6_ = dot(_e205.xyz, _e207.xyz);
    let _e210 = u_xlat6_;
    u_xlat6_ = max(_e210, 0.000000000000000000000000000000000000011754944f);
    let _e213 = u_xlat6_;
    u_xlat6_ = inverseSqrt(_e213);
    let _e215 = vs_NORMAL0_;
    let _e217 = u_xlat6_;
    let _e219 = u_xlat0_;
    let _e221 = (vec3(_e217) * _e219.xyz);
    vs_NORMAL0_.x = _e221.x;
    vs_NORMAL0_.y = _e221.y;
    vs_NORMAL0_.z = _e221.z;
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(1) in_NORMAL0_: vec3<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_NORMAL0_1 = in_NORMAL0_;
    main_1();
    let _e28 = vs_TEXCOORD0_;
    let _e30 = vs_TEXCOORD1_;
    let _e32 = vs_NORMAL0_;
    let _e34 = gl_Position;
    return VertexOutput(_e28, _e30, _e32, _e34);
}
