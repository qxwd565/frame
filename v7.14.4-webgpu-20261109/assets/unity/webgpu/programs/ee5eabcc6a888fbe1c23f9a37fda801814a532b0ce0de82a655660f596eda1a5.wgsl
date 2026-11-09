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
    @location(12) vs_NORMAL0_: vec3<f32>,
    @location(0) vs_TEXCOORD0_: vec2<f32>,
    @location(1) vs_TEXCOORD1_: vec3<f32>,
    @location(3) vs_TEXCOORDindex3_: vec4<f32>,
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
var<private> vs_NORMAL0_: vec3<f32>;
var<private> vs_TEXCOORD0_: vec2<f32>;
var<private> vs_TEXCOORD1_: vec3<f32>;
var<private> vs_TEXCOORDindex3_: vec4<f32>;
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
    let _e94 = in_NORMAL0_1;
    let _e99 = _v_buffer1_.v_cb1_[4];
    u_xlat1_.x = dot(_e94.xyz, _e99.xyz);
    let _e103 = in_NORMAL0_1;
    let _e108 = _v_buffer1_.v_cb1_[5];
    u_xlat1_.y = dot(_e103.xyz, _e108.xyz);
    let _e112 = in_NORMAL0_1;
    let _e117 = _v_buffer1_.v_cb1_[6];
    u_xlat1_.z = dot(_e112.xyz, _e117.xyz);
    let _e120 = u_xlat1_;
    let _e122 = u_xlat1_;
    u_xlat6_ = dot(_e120.xyz, _e122.xyz);
    let _e125 = u_xlat6_;
    u_xlat6_ = max(_e125, 0.000000000000000000000000000000000000011754944f);
    let _e128 = u_xlat6_;
    u_xlat6_ = inverseSqrt(_e128);
    let _e130 = vs_NORMAL0_;
    let _e132 = u_xlat6_;
    let _e134 = u_xlat1_;
    let _e136 = (vec3(_e132) * _e134.xyz);
    vs_NORMAL0_.x = _e136.x;
    vs_NORMAL0_.y = _e136.y;
    vs_NORMAL0_.z = _e136.z;
    let _e143 = vs_TEXCOORD0_;
    let _e145 = in_TEXCOORD0_1;
    let _e146 = _e145.xy;
    vs_TEXCOORD0_.x = _e146.x;
    vs_TEXCOORD0_.y = _e146.y;
    let _e151 = vs_TEXCOORD1_;
    let _e153 = u_xlat0_;
    let _e154 = _e153.xyz;
    vs_TEXCOORD1_.x = _e154.x;
    vs_TEXCOORD1_.y = _e154.y;
    vs_TEXCOORD1_.z = _e154.z;
    let _e161 = u_xlat1_;
    let _e163 = u_xlat0_;
    let _e168 = _v_buffer2_.v_cb2_[1];
    let _e170 = (_e163.yyy * _e168.xyz);
    u_xlat1_.x = _e170.x;
    u_xlat1_.y = _e170.y;
    u_xlat1_.z = _e170.z;
    let _e177 = u_xlat0_;
    let _e182 = _v_buffer2_.v_cb2_[0];
    let _e184 = u_xlat0_;
    let _e187 = u_xlat1_;
    let _e189 = ((_e182.xyz * _e184.xxx) + _e187.xyz);
    u_xlat0_.x = _e189.x;
    u_xlat0_.y = _e189.y;
    u_xlat0_.w = _e189.z;
    let _e196 = u_xlat0_;
    let _e201 = _v_buffer2_.v_cb2_[2];
    let _e203 = u_xlat0_;
    let _e206 = u_xlat0_;
    let _e208 = ((_e201.xyz * _e203.zzz) + _e206.xyw);
    u_xlat0_.x = _e208.x;
    u_xlat0_.y = _e208.y;
    u_xlat0_.z = _e208.z;
    let _e215 = vs_TEXCOORDindex3_;
    let _e217 = u_xlat0_;
    let _e222 = _v_buffer2_.v_cb2_[3];
    let _e224 = (_e217.xyz + _e222.xyz);
    vs_TEXCOORDindex3_.x = _e224.x;
    vs_TEXCOORDindex3_.y = _e224.y;
    vs_TEXCOORDindex3_.z = _e224.z;
    vs_TEXCOORDindex3_.w = 0f;
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(1) in_NORMAL0_: vec3<f32>, @location(4) in_TEXCOORD0_: vec2<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_NORMAL0_1 = in_NORMAL0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    main_1();
    let _e30 = vs_NORMAL0_;
    let _e32 = vs_TEXCOORD0_;
    let _e34 = vs_TEXCOORD1_;
    let _e36 = vs_TEXCOORDindex3_;
    let _e38 = gl_Position;
    return VertexOutput(_e30, _e32, _e34, _e36, _e38);
}
