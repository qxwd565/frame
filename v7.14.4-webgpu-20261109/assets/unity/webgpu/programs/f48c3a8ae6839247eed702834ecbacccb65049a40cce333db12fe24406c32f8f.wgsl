struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 7>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 3>,
}

struct VertexOutput {
    @location(12) vs_NORMAL0_: vec3<f32>,
    @location(0) vs_TEXCOORD0_: vec2<f32>,
    @location(1) vs_TEXCOORD1_: vec2<f32>,
    @location(2) vs_TEXCOORD2_: vec3<f32>,
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
var<private> in_TEXCOORD1_1: vec2<f32>;
var<private> vs_NORMAL0_: vec3<f32>;
var<private> vs_TEXCOORD0_: vec2<f32>;
var<private> vs_TEXCOORD1_: vec2<f32>;
var<private> vs_TEXCOORD2_: vec3<f32>;
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
    let _e95 = in_NORMAL0_1;
    let _e100 = _v_buffer1_.v_cb1_[4];
    u_xlat1_.x = dot(_e95.xyz, _e100.xyz);
    let _e104 = in_NORMAL0_1;
    let _e109 = _v_buffer1_.v_cb1_[5];
    u_xlat1_.y = dot(_e104.xyz, _e109.xyz);
    let _e113 = in_NORMAL0_1;
    let _e118 = _v_buffer1_.v_cb1_[6];
    u_xlat1_.z = dot(_e113.xyz, _e118.xyz);
    let _e121 = u_xlat1_;
    let _e123 = u_xlat1_;
    u_xlat6_ = dot(_e121.xyz, _e123.xyz);
    let _e126 = u_xlat6_;
    u_xlat6_ = max(_e126, 0.000000000000000000000000000000000000011754944f);
    let _e129 = u_xlat6_;
    u_xlat6_ = inverseSqrt(_e129);
    let _e131 = u_xlat1_;
    let _e133 = u_xlat6_;
    let _e135 = u_xlat1_;
    let _e137 = (vec3(_e133) * _e135.xyz);
    u_xlat1_.x = _e137.x;
    u_xlat1_.y = _e137.y;
    u_xlat1_.z = _e137.z;
    let _e144 = vs_NORMAL0_;
    let _e146 = u_xlat1_;
    let _e147 = _e146.xyz;
    vs_NORMAL0_.x = _e147.x;
    vs_NORMAL0_.y = _e147.y;
    vs_NORMAL0_.z = _e147.z;
    let _e154 = u_xlat1_;
    let _e156 = u_xlat1_;
    let _e158 = in_TEXCOORD1_1;
    let _e161 = (_e156.xz * -(_e158.xx));
    u_xlat1_.x = _e161.x;
    u_xlat1_.y = _e161.y;
    let _e166 = u_xlat1_;
    let _e168 = u_xlat1_;
    let _e174 = u_xlat0_;
    let _e176 = ((_e168.xy * vec2<f32>(0.3f, 0.3f)) + _e174.xz);
    u_xlat1_.x = _e176.x;
    u_xlat1_.y = _e176.y;
    let _e181 = vs_TEXCOORD2_;
    let _e183 = u_xlat0_;
    let _e184 = _e183.xyz;
    vs_TEXCOORD2_.x = _e184.x;
    vs_TEXCOORD2_.y = _e184.y;
    vs_TEXCOORD2_.z = _e184.z;
    let _e195 = _v_buffer0_.v_cb0_[15];
    let _e200 = _v_buffer2_.v_cb2_[2];
    u_xlat0_.x = (_e195.x * _e200.y);
    let _e203 = vs_TEXCOORD1_;
    let _e205 = u_xlat1_;
    let _e211 = u_xlat0_;
    let _e213 = ((_e205.xy * vec2<f32>(0.07f, 0.07f)) + _e211.xx);
    vs_TEXCOORD1_.x = _e213.x;
    vs_TEXCOORD1_.y = _e213.y;
    let _e218 = vs_TEXCOORD0_;
    let _e220 = in_TEXCOORD0_1;
    let _e221 = _e220.xy;
    vs_TEXCOORD0_.x = _e221.x;
    vs_TEXCOORD0_.y = _e221.y;
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(1) in_NORMAL0_: vec3<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(5) in_TEXCOORD1_: vec2<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_NORMAL0_1 = in_NORMAL0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_TEXCOORD1_1 = in_TEXCOORD1_;
    main_1();
    let _e34 = vs_NORMAL0_;
    let _e36 = vs_TEXCOORD0_;
    let _e38 = vs_TEXCOORD1_;
    let _e40 = vs_TEXCOORD2_;
    let _e42 = gl_Position;
    return VertexOutput(_e34, _e36, _e38, _e40, _e42);
}
