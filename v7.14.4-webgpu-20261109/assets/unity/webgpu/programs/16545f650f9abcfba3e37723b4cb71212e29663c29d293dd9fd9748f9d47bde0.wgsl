struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 7>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 4>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec2<f32>,
    @location(1) vs_TEXCOORD1_: vec2<f32>,
    @location(2) vs_TEXCOORD2_: vec3<f32>,
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
var<private> in_TEXCOORD1_1: vec2<f32>;
var<private> in_NORMAL0_1: vec3<f32>;
var<private> vs_TEXCOORD0_: vec2<f32>;
var<private> vs_TEXCOORD1_: vec2<f32>;
var<private> vs_TEXCOORD2_: vec3<f32>;
var<private> vs_NORMAL0_: vec3<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat6_: f32 = 0f;

    let _e28 = in_POSITION0_1;
    let _e33 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e28.yyyy * _e33);
    let _e38 = _v_buffer1_.v_cb1_[0];
    let _e39 = in_POSITION0_1;
    let _e42 = u_xlat0_;
    u_xlat0_ = ((_e38 * _e39.xxxx) + _e42);
    let _e47 = _v_buffer1_.v_cb1_[2];
    let _e48 = in_POSITION0_1;
    let _e51 = u_xlat0_;
    u_xlat0_ = ((_e47 * _e48.zzzz) + _e51);
    let _e53 = u_xlat0_;
    let _e57 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e53 + _e57);
    let _e59 = u_xlat0_;
    let _e64 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e59.yyyy * _e64);
    let _e69 = _v_buffer0_.v_cb0_[79];
    let _e70 = u_xlat0_;
    let _e73 = u_xlat1_;
    u_xlat1_ = ((_e69 * _e70.xxxx) + _e73);
    let _e78 = _v_buffer0_.v_cb0_[81];
    let _e79 = u_xlat0_;
    let _e82 = u_xlat1_;
    u_xlat1_ = ((_e78 * _e79.zzzz) + _e82);
    let _e88 = _v_buffer0_.v_cb0_[82];
    let _e89 = u_xlat0_;
    let _e92 = u_xlat1_;
    gl_Position = ((_e88 * _e89.wwww) + _e92);
    let _e94 = vs_TEXCOORD2_;
    let _e96 = u_xlat0_;
    let _e97 = _e96.xyz;
    vs_TEXCOORD2_.x = _e97.x;
    vs_TEXCOORD2_.y = _e97.y;
    vs_TEXCOORD2_.z = _e97.z;
    let _e104 = u_xlat0_;
    let _e106 = in_TEXCOORD0_1;
    let _e111 = _v_buffer2_.v_cb2_[3];
    let _e113 = (_e106.xy + _e111.xy);
    u_xlat0_.x = _e113.x;
    u_xlat0_.y = _e113.y;
    let _e118 = vs_TEXCOORD0_;
    let _e120 = u_xlat0_;
    let _e125 = _v_buffer2_.v_cb2_[0];
    let _e131 = _v_buffer2_.v_cb2_[0];
    let _e133 = ((_e120.xy * _e125.xy) + _e131.zw);
    vs_TEXCOORD0_.x = _e133.x;
    vs_TEXCOORD0_.y = _e133.y;
    let _e138 = u_xlat0_;
    let _e140 = in_TEXCOORD1_1;
    let _e145 = _v_buffer2_.v_cb2_[3];
    let _e147 = (_e140.xy + _e145.zw);
    u_xlat0_.x = _e147.x;
    u_xlat0_.y = _e147.y;
    let _e152 = vs_TEXCOORD1_;
    let _e154 = u_xlat0_;
    let _e159 = _v_buffer2_.v_cb2_[1];
    let _e165 = _v_buffer2_.v_cb2_[1];
    let _e167 = ((_e154.xy * _e159.xy) + _e165.zw);
    vs_TEXCOORD1_.x = _e167.x;
    vs_TEXCOORD1_.y = _e167.y;
    let _e173 = in_NORMAL0_1;
    let _e178 = _v_buffer1_.v_cb1_[4];
    u_xlat0_.x = dot(_e173.xyz, _e178.xyz);
    let _e182 = in_NORMAL0_1;
    let _e187 = _v_buffer1_.v_cb1_[5];
    u_xlat0_.y = dot(_e182.xyz, _e187.xyz);
    let _e191 = in_NORMAL0_1;
    let _e196 = _v_buffer1_.v_cb1_[6];
    u_xlat0_.z = dot(_e191.xyz, _e196.xyz);
    let _e199 = u_xlat0_;
    let _e201 = u_xlat0_;
    u_xlat6_ = dot(_e199.xyz, _e201.xyz);
    let _e204 = u_xlat6_;
    u_xlat6_ = max(_e204, 0.000000000000000000000000000000000000011754944f);
    let _e207 = u_xlat6_;
    u_xlat6_ = inverseSqrt(_e207);
    let _e209 = vs_NORMAL0_;
    let _e211 = u_xlat6_;
    let _e213 = u_xlat0_;
    let _e215 = (vec3(_e211) * _e213.xyz);
    vs_NORMAL0_.x = _e215.x;
    vs_NORMAL0_.y = _e215.y;
    vs_NORMAL0_.z = _e215.z;
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(5) in_TEXCOORD1_: vec2<f32>, @location(1) in_NORMAL0_: vec3<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_TEXCOORD1_1 = in_TEXCOORD1_;
    in_NORMAL0_1 = in_NORMAL0_;
    main_1();
    let _e34 = vs_TEXCOORD0_;
    let _e36 = vs_TEXCOORD1_;
    let _e38 = vs_TEXCOORD2_;
    let _e40 = vs_NORMAL0_;
    let _e42 = gl_Position;
    return VertexOutput(_e34, _e36, _e38, _e40, _e42);
}
