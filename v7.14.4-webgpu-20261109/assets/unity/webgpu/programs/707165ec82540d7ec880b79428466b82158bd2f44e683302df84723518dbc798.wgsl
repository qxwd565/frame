struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 7>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 2>,
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

    let _e27 = in_POSITION0_1;
    let _e32 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e27.yyyy * _e32);
    let _e37 = _v_buffer1_.v_cb1_[0];
    let _e38 = in_POSITION0_1;
    let _e41 = u_xlat0_;
    u_xlat0_ = ((_e37 * _e38.xxxx) + _e41);
    let _e46 = _v_buffer1_.v_cb1_[2];
    let _e47 = in_POSITION0_1;
    let _e50 = u_xlat0_;
    u_xlat0_ = ((_e46 * _e47.zzzz) + _e50);
    let _e52 = u_xlat0_;
    let _e56 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e52 + _e56);
    let _e58 = u_xlat0_;
    let _e63 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e58.yyyy * _e63);
    let _e68 = _v_buffer0_.v_cb0_[79];
    let _e69 = u_xlat0_;
    let _e72 = u_xlat1_;
    u_xlat1_ = ((_e68 * _e69.xxxx) + _e72);
    let _e77 = _v_buffer0_.v_cb0_[81];
    let _e78 = u_xlat0_;
    let _e81 = u_xlat1_;
    u_xlat1_ = ((_e77 * _e78.zzzz) + _e81);
    let _e87 = _v_buffer0_.v_cb0_[82];
    let _e88 = u_xlat0_;
    let _e91 = u_xlat1_;
    gl_Position = ((_e87 * _e88.wwww) + _e91);
    let _e93 = vs_TEXCOORD2_;
    let _e95 = u_xlat0_;
    let _e96 = _e95.xyz;
    vs_TEXCOORD2_.x = _e96.x;
    vs_TEXCOORD2_.y = _e96.y;
    vs_TEXCOORD2_.z = _e96.z;
    let _e103 = vs_TEXCOORD0_;
    let _e105 = in_TEXCOORD0_1;
    let _e110 = _v_buffer2_.v_cb2_[0];
    let _e116 = _v_buffer2_.v_cb2_[0];
    let _e118 = ((_e105.xy * _e110.xy) + _e116.zw);
    vs_TEXCOORD0_.x = _e118.x;
    vs_TEXCOORD0_.y = _e118.y;
    let _e123 = vs_TEXCOORD1_;
    let _e125 = in_TEXCOORD0_1;
    let _e130 = _v_buffer2_.v_cb2_[1];
    let _e136 = _v_buffer2_.v_cb2_[1];
    let _e138 = ((_e125.xy * _e130.xy) + _e136.zw);
    vs_TEXCOORD1_.x = _e138.x;
    vs_TEXCOORD1_.y = _e138.y;
    let _e144 = in_NORMAL0_1;
    let _e149 = _v_buffer1_.v_cb1_[4];
    u_xlat0_.x = dot(_e144.xyz, _e149.xyz);
    let _e153 = in_NORMAL0_1;
    let _e158 = _v_buffer1_.v_cb1_[5];
    u_xlat0_.y = dot(_e153.xyz, _e158.xyz);
    let _e162 = in_NORMAL0_1;
    let _e167 = _v_buffer1_.v_cb1_[6];
    u_xlat0_.z = dot(_e162.xyz, _e167.xyz);
    let _e170 = u_xlat0_;
    let _e172 = u_xlat0_;
    u_xlat6_ = dot(_e170.xyz, _e172.xyz);
    let _e175 = u_xlat6_;
    u_xlat6_ = max(_e175, 0.000000000000000000000000000000000000011754944f);
    let _e178 = u_xlat6_;
    u_xlat6_ = inverseSqrt(_e178);
    let _e180 = vs_NORMAL0_;
    let _e182 = u_xlat6_;
    let _e184 = u_xlat0_;
    let _e186 = (vec3(_e182) * _e184.xyz);
    vs_NORMAL0_.x = _e186.x;
    vs_NORMAL0_.y = _e186.y;
    vs_NORMAL0_.z = _e186.z;
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
    let _e34 = vs_TEXCOORD2_;
    let _e36 = vs_NORMAL0_;
    let _e38 = gl_Position;
    return VertexOutput(_e30, _e32, _e34, _e36, _e38);
}
