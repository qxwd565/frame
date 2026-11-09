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
    @location(1) vs_TEXCOORD1_: vec3<f32>,
    @location(3) vs_TEXCOORDindex3_: vec4<f32>,
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
var<private> vs_TEXCOORDindex3_: vec4<f32>;
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
    let _e93 = vs_TEXCOORD0_;
    let _e95 = in_TEXCOORD0_1;
    let _e96 = _e95.xy;
    vs_TEXCOORD0_.x = _e96.x;
    vs_TEXCOORD0_.y = _e96.y;
    let _e101 = vs_TEXCOORD1_;
    let _e103 = u_xlat0_;
    let _e104 = _e103.xyz;
    vs_TEXCOORD1_.x = _e104.x;
    vs_TEXCOORD1_.y = _e104.y;
    vs_TEXCOORD1_.z = _e104.z;
    let _e111 = u_xlat1_;
    let _e113 = u_xlat0_;
    let _e118 = _v_buffer2_.v_cb2_[1];
    let _e120 = (_e113.yyy * _e118.xyz);
    u_xlat1_.x = _e120.x;
    u_xlat1_.y = _e120.y;
    u_xlat1_.z = _e120.z;
    let _e127 = u_xlat0_;
    let _e132 = _v_buffer2_.v_cb2_[0];
    let _e134 = u_xlat0_;
    let _e137 = u_xlat1_;
    let _e139 = ((_e132.xyz * _e134.xxx) + _e137.xyz);
    u_xlat0_.x = _e139.x;
    u_xlat0_.y = _e139.y;
    u_xlat0_.w = _e139.z;
    let _e146 = u_xlat0_;
    let _e151 = _v_buffer2_.v_cb2_[2];
    let _e153 = u_xlat0_;
    let _e156 = u_xlat0_;
    let _e158 = ((_e151.xyz * _e153.zzz) + _e156.xyw);
    u_xlat0_.x = _e158.x;
    u_xlat0_.y = _e158.y;
    u_xlat0_.z = _e158.z;
    let _e165 = vs_TEXCOORDindex3_;
    let _e167 = u_xlat0_;
    let _e172 = _v_buffer2_.v_cb2_[3];
    let _e174 = (_e167.xyz + _e172.xyz);
    vs_TEXCOORDindex3_.x = _e174.x;
    vs_TEXCOORDindex3_.y = _e174.y;
    vs_TEXCOORDindex3_.z = _e174.z;
    vs_TEXCOORDindex3_.w = 0f;
    let _e184 = in_NORMAL0_1;
    let _e189 = _v_buffer1_.v_cb1_[4];
    u_xlat0_.x = dot(_e184.xyz, _e189.xyz);
    let _e193 = in_NORMAL0_1;
    let _e198 = _v_buffer1_.v_cb1_[5];
    u_xlat0_.y = dot(_e193.xyz, _e198.xyz);
    let _e202 = in_NORMAL0_1;
    let _e207 = _v_buffer1_.v_cb1_[6];
    u_xlat0_.z = dot(_e202.xyz, _e207.xyz);
    let _e210 = u_xlat0_;
    let _e212 = u_xlat0_;
    u_xlat6_ = dot(_e210.xyz, _e212.xyz);
    let _e215 = u_xlat6_;
    u_xlat6_ = max(_e215, 0.000000000000000000000000000000000000011754944f);
    let _e218 = u_xlat6_;
    u_xlat6_ = inverseSqrt(_e218);
    let _e220 = vs_NORMAL0_;
    let _e222 = u_xlat6_;
    let _e224 = u_xlat0_;
    let _e226 = (vec3(_e222) * _e224.xyz);
    vs_NORMAL0_.x = _e226.x;
    vs_NORMAL0_.y = _e226.y;
    vs_NORMAL0_.z = _e226.z;
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
    let _e34 = vs_TEXCOORDindex3_;
    let _e36 = vs_NORMAL0_;
    let _e38 = gl_Position;
    return VertexOutput(_e30, _e32, _e34, _e36, _e38);
}
