struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 7>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 4>,
}

struct v_buffer3_ {
    v_cb3_: array<vec4<f32>, 2>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec2<f32>,
    @location(1) vs_TEXCOORD1_: vec2<f32>,
    @location(2) vs_TEXCOORD2_: vec3<f32>,
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
@group(0) @binding(3) 
var<uniform> _v_buffer3_: v_buffer3_;
var<private> in_POSITION0_1: vec4<f32>;
var<private> in_TEXCOORD0_1: vec2<f32>;
var<private> in_NORMAL0_1: vec3<f32>;
var<private> vs_TEXCOORD0_: vec2<f32>;
var<private> vs_TEXCOORD1_: vec2<f32>;
var<private> vs_TEXCOORD2_: vec3<f32>;
var<private> vs_TEXCOORDindex3_: vec4<f32>;
var<private> vs_NORMAL0_: vec3<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat6_: f32 = 0f;

    let _e31 = in_POSITION0_1;
    let _e36 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e31.yyyy * _e36);
    let _e41 = _v_buffer1_.v_cb1_[0];
    let _e42 = in_POSITION0_1;
    let _e45 = u_xlat0_;
    u_xlat0_ = ((_e41 * _e42.xxxx) + _e45);
    let _e50 = _v_buffer1_.v_cb1_[2];
    let _e51 = in_POSITION0_1;
    let _e54 = u_xlat0_;
    u_xlat0_ = ((_e50 * _e51.zzzz) + _e54);
    let _e56 = u_xlat0_;
    let _e60 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e56 + _e60);
    let _e62 = u_xlat0_;
    let _e67 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e62.yyyy * _e67);
    let _e72 = _v_buffer0_.v_cb0_[79];
    let _e73 = u_xlat0_;
    let _e76 = u_xlat1_;
    u_xlat1_ = ((_e72 * _e73.xxxx) + _e76);
    let _e81 = _v_buffer0_.v_cb0_[81];
    let _e82 = u_xlat0_;
    let _e85 = u_xlat1_;
    u_xlat1_ = ((_e81 * _e82.zzzz) + _e85);
    let _e91 = _v_buffer0_.v_cb0_[82];
    let _e92 = u_xlat0_;
    let _e95 = u_xlat1_;
    gl_Position = ((_e91 * _e92.wwww) + _e95);
    let _e97 = vs_TEXCOORD0_;
    let _e99 = in_TEXCOORD0_1;
    let _e104 = _v_buffer3_.v_cb3_[0];
    let _e110 = _v_buffer3_.v_cb3_[0];
    let _e112 = ((_e99.xy * _e104.xy) + _e110.zw);
    vs_TEXCOORD0_.x = _e112.x;
    vs_TEXCOORD0_.y = _e112.y;
    let _e117 = vs_TEXCOORD1_;
    let _e119 = in_TEXCOORD0_1;
    let _e124 = _v_buffer3_.v_cb3_[1];
    let _e130 = _v_buffer3_.v_cb3_[1];
    let _e132 = ((_e119.xy * _e124.xy) + _e130.zw);
    vs_TEXCOORD1_.x = _e132.x;
    vs_TEXCOORD1_.y = _e132.y;
    let _e137 = vs_TEXCOORD2_;
    let _e139 = u_xlat0_;
    let _e140 = _e139.xyz;
    vs_TEXCOORD2_.x = _e140.x;
    vs_TEXCOORD2_.y = _e140.y;
    vs_TEXCOORD2_.z = _e140.z;
    let _e147 = u_xlat1_;
    let _e149 = u_xlat0_;
    let _e154 = _v_buffer2_.v_cb2_[1];
    let _e156 = (_e149.yyy * _e154.xyz);
    u_xlat1_.x = _e156.x;
    u_xlat1_.y = _e156.y;
    u_xlat1_.z = _e156.z;
    let _e163 = u_xlat0_;
    let _e168 = _v_buffer2_.v_cb2_[0];
    let _e170 = u_xlat0_;
    let _e173 = u_xlat1_;
    let _e175 = ((_e168.xyz * _e170.xxx) + _e173.xyz);
    u_xlat0_.x = _e175.x;
    u_xlat0_.y = _e175.y;
    u_xlat0_.w = _e175.z;
    let _e182 = u_xlat0_;
    let _e187 = _v_buffer2_.v_cb2_[2];
    let _e189 = u_xlat0_;
    let _e192 = u_xlat0_;
    let _e194 = ((_e187.xyz * _e189.zzz) + _e192.xyw);
    u_xlat0_.x = _e194.x;
    u_xlat0_.y = _e194.y;
    u_xlat0_.z = _e194.z;
    let _e201 = vs_TEXCOORDindex3_;
    let _e203 = u_xlat0_;
    let _e208 = _v_buffer2_.v_cb2_[3];
    let _e210 = (_e203.xyz + _e208.xyz);
    vs_TEXCOORDindex3_.x = _e210.x;
    vs_TEXCOORDindex3_.y = _e210.y;
    vs_TEXCOORDindex3_.z = _e210.z;
    vs_TEXCOORDindex3_.w = 0f;
    let _e220 = in_NORMAL0_1;
    let _e225 = _v_buffer1_.v_cb1_[4];
    u_xlat0_.x = dot(_e220.xyz, _e225.xyz);
    let _e229 = in_NORMAL0_1;
    let _e234 = _v_buffer1_.v_cb1_[5];
    u_xlat0_.y = dot(_e229.xyz, _e234.xyz);
    let _e238 = in_NORMAL0_1;
    let _e243 = _v_buffer1_.v_cb1_[6];
    u_xlat0_.z = dot(_e238.xyz, _e243.xyz);
    let _e246 = u_xlat0_;
    let _e248 = u_xlat0_;
    u_xlat6_ = dot(_e246.xyz, _e248.xyz);
    let _e251 = u_xlat6_;
    u_xlat6_ = max(_e251, 0.000000000000000000000000000000000000011754944f);
    let _e254 = u_xlat6_;
    u_xlat6_ = inverseSqrt(_e254);
    let _e256 = vs_NORMAL0_;
    let _e258 = u_xlat6_;
    let _e260 = u_xlat0_;
    let _e262 = (vec3(_e258) * _e260.xyz);
    vs_NORMAL0_.x = _e262.x;
    vs_NORMAL0_.y = _e262.y;
    vs_NORMAL0_.z = _e262.z;
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(1) in_NORMAL0_: vec3<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_NORMAL0_1 = in_NORMAL0_;
    main_1();
    let _e35 = vs_TEXCOORD0_;
    let _e37 = vs_TEXCOORD1_;
    let _e39 = vs_TEXCOORD2_;
    let _e41 = vs_TEXCOORDindex3_;
    let _e43 = vs_NORMAL0_;
    let _e45 = gl_Position;
    return VertexOutput(_e35, _e37, _e39, _e41, _e43, _e45);
}
