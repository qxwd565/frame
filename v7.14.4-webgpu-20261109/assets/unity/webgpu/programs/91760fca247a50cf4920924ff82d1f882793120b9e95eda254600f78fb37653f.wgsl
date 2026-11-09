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
    @location(4) vs_TEXCOORD4_: vec4<f32>,
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
var<private> vs_TEXCOORD4_: vec4<f32>;
var<private> vs_NORMAL0_: vec3<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec3<f32> = vec3(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat6_: f32 = 0f;

    let _e27 = u_xlat0_;
    let _e29 = in_POSITION0_1;
    let _e34 = _v_buffer1_.v_cb1_[1];
    let _e36 = (_e29.yyy * _e34.xyz);
    u_xlat0_.x = _e36.x;
    u_xlat0_.y = _e36.y;
    u_xlat0_.z = _e36.z;
    let _e43 = u_xlat0_;
    let _e48 = _v_buffer1_.v_cb1_[0];
    let _e50 = in_POSITION0_1;
    let _e53 = u_xlat0_;
    let _e55 = ((_e48.xyz * _e50.xxx) + _e53.xyz);
    u_xlat0_.x = _e55.x;
    u_xlat0_.y = _e55.y;
    u_xlat0_.z = _e55.z;
    let _e62 = u_xlat0_;
    let _e67 = _v_buffer1_.v_cb1_[2];
    let _e69 = in_POSITION0_1;
    let _e72 = u_xlat0_;
    let _e74 = ((_e67.xyz * _e69.zzz) + _e72.xyz);
    u_xlat0_.x = _e74.x;
    u_xlat0_.y = _e74.y;
    u_xlat0_.z = _e74.z;
    let _e81 = u_xlat0_;
    let _e83 = u_xlat0_;
    let _e88 = _v_buffer1_.v_cb1_[3];
    let _e90 = (_e83.xyz + _e88.xyz);
    u_xlat0_.x = _e90.x;
    u_xlat0_.y = _e90.y;
    u_xlat0_.z = _e90.z;
    let _e97 = u_xlat0_;
    let _e102 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e97.yyyy * _e102);
    let _e107 = _v_buffer0_.v_cb0_[79];
    let _e108 = u_xlat0_;
    let _e111 = u_xlat1_;
    u_xlat1_ = ((_e107 * _e108.xxxx) + _e111);
    let _e116 = _v_buffer0_.v_cb0_[81];
    let _e117 = u_xlat0_;
    let _e120 = u_xlat1_;
    u_xlat1_ = ((_e116 * _e117.zzzz) + _e120);
    let _e122 = vs_TEXCOORD1_;
    let _e124 = u_xlat0_;
    let _e125 = _e124.xyz;
    vs_TEXCOORD1_.x = _e125.x;
    vs_TEXCOORD1_.y = _e125.y;
    vs_TEXCOORD1_.z = _e125.z;
    let _e133 = u_xlat1_;
    let _e137 = _v_buffer0_.v_cb0_[82];
    gl_Position = (_e133 + _e137);
    let _e139 = vs_TEXCOORD0_;
    let _e141 = in_TEXCOORD0_1;
    let _e143 = _v_buffer2_;
    let _e147 = _v_buffer2_;
    let _e150 = ((_e141.xy * _e143.v_cb2_.xy) + _e147.v_cb2_.zw);
    vs_TEXCOORD0_.x = _e150.x;
    vs_TEXCOORD0_.y = _e150.y;
    let _e155 = in_POSITION0_1;
    vs_TEXCOORD4_ = _e155;
    let _e157 = in_NORMAL0_1;
    let _e162 = _v_buffer1_.v_cb1_[4];
    u_xlat0_.x = dot(_e157.xyz, _e162.xyz);
    let _e166 = in_NORMAL0_1;
    let _e171 = _v_buffer1_.v_cb1_[5];
    u_xlat0_.y = dot(_e166.xyz, _e171.xyz);
    let _e175 = in_NORMAL0_1;
    let _e180 = _v_buffer1_.v_cb1_[6];
    u_xlat0_.z = dot(_e175.xyz, _e180.xyz);
    let _e183 = u_xlat0_;
    let _e185 = u_xlat0_;
    u_xlat6_ = dot(_e183.xyz, _e185.xyz);
    let _e188 = u_xlat6_;
    u_xlat6_ = max(_e188, 0.000000000000000000000000000000000000011754944f);
    let _e191 = u_xlat6_;
    u_xlat6_ = inverseSqrt(_e191);
    let _e193 = vs_NORMAL0_;
    let _e195 = u_xlat6_;
    let _e197 = u_xlat0_;
    let _e199 = (vec3(_e195) * _e197.xyz);
    vs_NORMAL0_.x = _e199.x;
    vs_NORMAL0_.y = _e199.y;
    vs_NORMAL0_.z = _e199.z;
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(1) in_NORMAL0_: vec3<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_NORMAL0_1 = in_NORMAL0_;
    main_1();
    let _e30 = vs_TEXCOORD0_;
    let _e32 = vs_TEXCOORD1_;
    let _e34 = vs_TEXCOORD4_;
    let _e36 = vs_NORMAL0_;
    let _e38 = gl_Position;
    return VertexOutput(_e30, _e32, _e34, _e36, _e38);
}
