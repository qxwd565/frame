struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 30>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 8>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec2<f32>,
    @location(1) vs_TEXCOORD1_: vec2<f32>,
    @location(10) vs_COLOR0_: vec4<f32>,
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
var<private> vs_TEXCOORD1_: vec2<f32>;
var<private> vs_COLOR0_: vec4<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);

    let _e23 = in_POSITION0_1;
    let _e28 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e23.yyyy * _e28);
    let _e33 = _v_buffer1_.v_cb1_[0];
    let _e34 = in_POSITION0_1;
    let _e37 = u_xlat0_;
    u_xlat0_ = ((_e33 * _e34.xxxx) + _e37);
    let _e42 = _v_buffer1_.v_cb1_[2];
    let _e43 = in_POSITION0_1;
    let _e46 = u_xlat0_;
    u_xlat0_ = ((_e42 * _e43.zzzz) + _e46);
    let _e48 = u_xlat0_;
    let _e52 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e48 + _e52);
    let _e54 = u_xlat0_;
    let _e59 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e54.yyyy * _e59);
    let _e64 = _v_buffer0_.v_cb0_[79];
    let _e65 = u_xlat0_;
    let _e68 = u_xlat1_;
    u_xlat1_ = ((_e64 * _e65.xxxx) + _e68);
    let _e73 = _v_buffer0_.v_cb0_[81];
    let _e74 = u_xlat0_;
    let _e77 = u_xlat1_;
    u_xlat1_ = ((_e73 * _e74.zzzz) + _e77);
    let _e83 = _v_buffer0_.v_cb0_[82];
    let _e84 = u_xlat0_;
    let _e87 = u_xlat1_;
    gl_Position = ((_e83 * _e84.wwww) + _e87);
    let _e89 = u_xlat0_;
    let _e91 = in_TEXCOORD0_1;
    let _e96 = _v_buffer2_.v_cb2_[0];
    let _e102 = _v_buffer2_.v_cb2_[0];
    let _e104 = ((_e91.xy * _e96.xy) + _e102.zw);
    u_xlat0_.x = _e104.x;
    u_xlat0_.y = _e104.y;
    let _e109 = vs_TEXCOORD0_;
    let _e114 = _v_buffer0_.v_cb0_[15];
    let _e119 = _v_buffer2_.v_cb2_[2];
    let _e122 = u_xlat0_;
    let _e124 = ((_e114.xx * _e119.xy) + _e122.xy);
    vs_TEXCOORD0_.x = _e124.x;
    vs_TEXCOORD0_.y = _e124.y;
    let _e129 = u_xlat0_;
    let _e131 = in_TEXCOORD0_1;
    let _e136 = _v_buffer2_.v_cb2_[1];
    let _e142 = _v_buffer2_.v_cb2_[1];
    let _e144 = ((_e131.xy * _e136.xy) + _e142.zw);
    u_xlat0_.x = _e144.x;
    u_xlat0_.y = _e144.y;
    let _e149 = vs_TEXCOORD1_;
    let _e154 = _v_buffer0_.v_cb0_[15];
    let _e159 = _v_buffer2_.v_cb2_[4];
    let _e162 = u_xlat0_;
    let _e164 = ((_e154.xx * _e159.yz) + _e162.xy);
    vs_TEXCOORD1_.x = _e164.x;
    vs_TEXCOORD1_.y = _e164.y;
    let _e173 = _v_buffer1_.v_cb1_[27];
    u_xlat0_.x = abs(_e173.w);
    let _e180 = _v_buffer1_.v_cb1_[28];
    u_xlat0_.y = abs(_e180.w);
    let _e187 = _v_buffer1_.v_cb1_[29];
    u_xlat0_.z = abs(_e187.w);
    let _e190 = u_xlat0_;
    let _e192 = u_xlat0_;
    let _e194 = log2(_e192.xyz);
    u_xlat0_.x = _e194.x;
    u_xlat0_.y = _e194.y;
    u_xlat0_.z = _e194.z;
    let _e201 = u_xlat0_;
    let _e203 = u_xlat0_;
    let _e209 = (_e203.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat0_.x = _e209.x;
    u_xlat0_.y = _e209.y;
    u_xlat0_.z = _e209.z;
    let _e216 = u_xlat0_;
    let _e218 = u_xlat0_;
    let _e220 = exp2(_e218.xyz);
    u_xlat0_.x = _e220.x;
    u_xlat0_.y = _e220.y;
    u_xlat0_.z = _e220.z;
    let _e227 = u_xlat0_;
    let _e229 = u_xlat0_;
    let _e243 = ((_e229.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat0_.x = _e243.x;
    u_xlat0_.y = _e243.y;
    u_xlat0_.z = _e243.z;
    let _e250 = u_xlat0_;
    let _e252 = u_xlat0_;
    let _e258 = clamp(_e252.xyz, vec3(0f), vec3(1f));
    u_xlat0_.x = _e258.x;
    u_xlat0_.y = _e258.y;
    u_xlat0_.z = _e258.z;
    let _e265 = u_xlat0_;
    let _e267 = u_xlat0_;
    let _e272 = _v_buffer0_.v_cb0_[6];
    let _e274 = (_e267.xyz + _e272.xyz);
    u_xlat0_.x = _e274.x;
    u_xlat0_.y = _e274.y;
    u_xlat0_.z = _e274.z;
    let _e281 = u_xlat0_;
    let _e283 = u_xlat0_;
    let _e292 = (_e283.xyz + vec3<f32>(-1f, -1f, -1f));
    u_xlat0_.x = _e292.x;
    u_xlat0_.y = _e292.y;
    u_xlat0_.z = _e292.z;
    u_xlat0_.w = 0f;
    let _e304 = _v_buffer2_.v_cb2_[7];
    let _e306 = u_xlat0_;
    u_xlat0_ = ((_e304.zzzz * _e306) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e314 = in_COLOR0_1;
    let _e318 = _v_buffer2_.v_cb2_[5];
    u_xlat1_ = (_e314 * _e318);
    let _e320 = u_xlat1_;
    let _e324 = _v_buffer2_.v_cb2_[2];
    u_xlat1_ = (_e320 * _e324.zzzz);
    let _e327 = u_xlat0_;
    let _e328 = u_xlat1_;
    vs_COLOR0_ = (_e327 * _e328);
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(3) in_COLOR0_: vec4<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_COLOR0_1 = in_COLOR0_;
    main_1();
    let _e28 = vs_TEXCOORD0_;
    let _e30 = vs_TEXCOORD1_;
    let _e32 = vs_COLOR0_;
    let _e34 = gl_Position;
    return VertexOutput(_e28, _e30, _e32, _e34);
}
