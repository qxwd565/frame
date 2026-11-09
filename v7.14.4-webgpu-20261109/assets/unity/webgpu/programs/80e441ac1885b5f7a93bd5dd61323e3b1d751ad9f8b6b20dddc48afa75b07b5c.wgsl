struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 30>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 4>,
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
    let _e109 = vs_TEXCOORD1_;
    let _e111 = u_xlat0_;
    let _e116 = _v_buffer2_.v_cb2_[3];
    let _e122 = _v_buffer2_.v_cb2_[2];
    let _e124 = ((_e111.xy * _e116.xy) + _e122.zw);
    vs_TEXCOORD1_.x = _e124.x;
    vs_TEXCOORD1_.y = _e124.y;
    let _e129 = vs_TEXCOORD0_;
    let _e131 = u_xlat0_;
    let _e132 = _e131.xy;
    vs_TEXCOORD0_.x = _e132.x;
    vs_TEXCOORD0_.y = _e132.y;
    let _e141 = _v_buffer1_.v_cb1_[27];
    u_xlat0_.x = abs(_e141.w);
    let _e148 = _v_buffer1_.v_cb1_[28];
    u_xlat0_.y = abs(_e148.w);
    let _e155 = _v_buffer1_.v_cb1_[29];
    u_xlat0_.z = abs(_e155.w);
    let _e158 = u_xlat0_;
    let _e160 = u_xlat0_;
    let _e162 = log2(_e160.xyz);
    u_xlat0_.x = _e162.x;
    u_xlat0_.y = _e162.y;
    u_xlat0_.z = _e162.z;
    let _e169 = u_xlat0_;
    let _e171 = u_xlat0_;
    let _e177 = (_e171.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat0_.x = _e177.x;
    u_xlat0_.y = _e177.y;
    u_xlat0_.z = _e177.z;
    let _e184 = u_xlat0_;
    let _e186 = u_xlat0_;
    let _e188 = exp2(_e186.xyz);
    u_xlat0_.x = _e188.x;
    u_xlat0_.y = _e188.y;
    u_xlat0_.z = _e188.z;
    let _e195 = u_xlat0_;
    let _e197 = u_xlat0_;
    let _e211 = ((_e197.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat0_.x = _e211.x;
    u_xlat0_.y = _e211.y;
    u_xlat0_.z = _e211.z;
    let _e218 = u_xlat0_;
    let _e220 = u_xlat0_;
    let _e226 = clamp(_e220.xyz, vec3(0f), vec3(1f));
    u_xlat0_.x = _e226.x;
    u_xlat0_.y = _e226.y;
    u_xlat0_.z = _e226.z;
    let _e233 = u_xlat0_;
    let _e235 = u_xlat0_;
    let _e240 = _v_buffer0_.v_cb0_[6];
    let _e242 = (_e235.xyz + _e240.xyz);
    u_xlat0_.x = _e242.x;
    u_xlat0_.y = _e242.y;
    u_xlat0_.z = _e242.z;
    let _e249 = u_xlat0_;
    let _e251 = u_xlat0_;
    let _e260 = (_e251.xyz + vec3<f32>(-1f, -1f, -1f));
    u_xlat0_.x = _e260.x;
    u_xlat0_.y = _e260.y;
    u_xlat0_.z = _e260.z;
    u_xlat0_.w = 0f;
    let _e272 = _v_buffer2_.v_cb2_[3];
    let _e274 = u_xlat0_;
    u_xlat0_ = ((_e272.zzzz * _e274) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e282 = u_xlat0_;
    let _e283 = in_COLOR0_1;
    u_xlat0_ = (_e282 * _e283);
    let _e285 = u_xlat0_;
    let _e289 = _v_buffer2_.v_cb2_[2];
    u_xlat0_ = (_e285 * _e289.xxxx);
    let _e292 = u_xlat0_;
    let _e293 = u_xlat0_;
    vs_COLOR0_ = (_e292 + _e293);
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
