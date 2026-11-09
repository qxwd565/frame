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
    @location(5) vs_TEXCOORD5_: f32,
    @location(1) vs_TEXCOORD1_: vec3<f32>,
    @location(2) vs_TEXCOORD2_: vec3<f32>,
    @location(7) vs_TEXCOORD7_: vec3<f32>,
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
var<private> vs_TEXCOORD0_: vec2<f32>;
var<private> vs_TEXCOORD5_: f32;
var<private> vs_TEXCOORD1_: vec3<f32>;
var<private> vs_TEXCOORD2_: vec3<f32>;
var<private> vs_TEXCOORD7_: vec3<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat6_: f32 = 0f;

    let _e28 = vs_TEXCOORD0_;
    let _e30 = in_TEXCOORD0_1;
    let _e32 = _v_buffer2_;
    let _e36 = _v_buffer2_;
    let _e39 = ((_e30.xy * _e32.v_cb2_.xy) + _e36.v_cb2_.zw);
    vs_TEXCOORD0_.x = _e39.x;
    vs_TEXCOORD0_.y = _e39.y;
    vs_TEXCOORD5_ = 0f;
    let _e45 = u_xlat0_;
    let _e47 = in_POSITION0_1;
    let _e52 = _v_buffer1_.v_cb1_[1];
    let _e54 = (_e47.yyy * _e52.xyz);
    u_xlat0_.x = _e54.x;
    u_xlat0_.y = _e54.y;
    u_xlat0_.z = _e54.z;
    let _e61 = u_xlat0_;
    let _e66 = _v_buffer1_.v_cb1_[0];
    let _e68 = in_POSITION0_1;
    let _e71 = u_xlat0_;
    let _e73 = ((_e66.xyz * _e68.xxx) + _e71.xyz);
    u_xlat0_.x = _e73.x;
    u_xlat0_.y = _e73.y;
    u_xlat0_.z = _e73.z;
    let _e80 = u_xlat0_;
    let _e85 = _v_buffer1_.v_cb1_[2];
    let _e87 = in_POSITION0_1;
    let _e90 = u_xlat0_;
    let _e92 = ((_e85.xyz * _e87.zzz) + _e90.xyz);
    u_xlat0_.x = _e92.x;
    u_xlat0_.y = _e92.y;
    u_xlat0_.z = _e92.z;
    let _e99 = u_xlat0_;
    let _e101 = u_xlat0_;
    let _e106 = _v_buffer1_.v_cb1_[3];
    let _e108 = (_e101.xyz + _e106.xyz);
    u_xlat0_.x = _e108.x;
    u_xlat0_.y = _e108.y;
    u_xlat0_.z = _e108.z;
    let _e115 = vs_TEXCOORD1_;
    let _e117 = u_xlat0_;
    let _e118 = _e117.xyz;
    vs_TEXCOORD1_.x = _e118.x;
    vs_TEXCOORD1_.y = _e118.y;
    vs_TEXCOORD1_.z = _e118.z;
    let _e126 = in_NORMAL0_1;
    let _e131 = _v_buffer1_.v_cb1_[4];
    u_xlat1_.x = dot(_e126.xyz, _e131.xyz);
    let _e135 = in_NORMAL0_1;
    let _e140 = _v_buffer1_.v_cb1_[5];
    u_xlat1_.y = dot(_e135.xyz, _e140.xyz);
    let _e144 = in_NORMAL0_1;
    let _e149 = _v_buffer1_.v_cb1_[6];
    u_xlat1_.z = dot(_e144.xyz, _e149.xyz);
    let _e152 = u_xlat1_;
    let _e154 = u_xlat1_;
    u_xlat6_ = dot(_e152.xyz, _e154.xyz);
    let _e157 = u_xlat6_;
    u_xlat6_ = max(_e157, 0.000000000000000000000000000000000000011754944f);
    let _e160 = u_xlat6_;
    u_xlat6_ = inverseSqrt(_e160);
    let _e162 = u_xlat1_;
    let _e164 = u_xlat6_;
    let _e166 = u_xlat1_;
    let _e168 = (vec3(_e164) * _e166.xyz);
    u_xlat1_.x = _e168.x;
    u_xlat1_.y = _e168.y;
    u_xlat1_.z = _e168.z;
    let _e175 = u_xlat1_;
    let _e177 = u_xlat1_;
    u_xlat6_ = dot(_e175.xyz, _e177.xyz);
    let _e180 = u_xlat6_;
    u_xlat6_ = inverseSqrt(_e180);
    let _e182 = vs_TEXCOORD2_;
    let _e184 = u_xlat6_;
    let _e186 = u_xlat1_;
    let _e188 = (vec3(_e184) * _e186.xyz);
    vs_TEXCOORD2_.x = _e188.x;
    vs_TEXCOORD2_.y = _e188.y;
    vs_TEXCOORD2_.z = _e188.z;
    let _e195 = vs_TEXCOORD7_;
    vs_TEXCOORD7_.x = 0f;
    vs_TEXCOORD7_.y = 0f;
    vs_TEXCOORD7_.z = 0f;
    let _e204 = u_xlat0_;
    let _e209 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e204.yyyy * _e209);
    let _e214 = _v_buffer0_.v_cb0_[79];
    let _e215 = u_xlat0_;
    let _e218 = u_xlat1_;
    u_xlat1_ = ((_e214 * _e215.xxxx) + _e218);
    let _e223 = _v_buffer0_.v_cb0_[81];
    let _e224 = u_xlat0_;
    let _e227 = u_xlat1_;
    u_xlat0_ = ((_e223 * _e224.zzzz) + _e227);
    let _e230 = u_xlat0_;
    let _e234 = _v_buffer0_.v_cb0_[82];
    gl_Position = (_e230 + _e234);
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(1) in_NORMAL0_: vec3<f32>, @location(4) in_TEXCOORD0_: vec2<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_NORMAL0_1 = in_NORMAL0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    main_1();
    let _e32 = vs_TEXCOORD0_;
    let _e34 = vs_TEXCOORD5_;
    let _e36 = vs_TEXCOORD1_;
    let _e38 = vs_TEXCOORD2_;
    let _e40 = vs_TEXCOORD7_;
    let _e42 = gl_Position;
    return VertexOutput(_e32, _e34, _e36, _e38, _e40, _e42);
}
