struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 30>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 6>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec2<f32>,
    @location(1) vs_TEXCOORD1_: vec2<f32>,
    @location(10) vs_COLOR0_: vec4<f32>,
    @location(11) vs_COLOR1_: vec4<f32>,
    @location(12) vs_COLOR2_: vec4<f32>,
    @builtin(position) gl_Position: vec4<f32>,
}

@group(0) @binding(0) 
var<uniform> _v_buffer0_: v_buffer0_;
@group(0) @binding(1) 
var<uniform> _v_buffer1_: v_buffer1_;
@group(0) @binding(2) 
var<uniform> _v_buffer2_: v_buffer2_;
var<private> in_POSITION0_1: vec4<f32>;
var<private> in_COLOR0_1: vec4<f32>;
var<private> in_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD0_: vec2<f32>;
var<private> vs_TEXCOORD1_: vec2<f32>;
var<private> vs_COLOR0_: vec4<f32>;
var<private> vs_COLOR1_: vec4<f32>;
var<private> vs_COLOR2_: vec4<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);

    let _e25 = in_POSITION0_1;
    let _e30 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e25.yyyy * _e30);
    let _e35 = _v_buffer1_.v_cb1_[0];
    let _e36 = in_POSITION0_1;
    let _e39 = u_xlat0_;
    u_xlat0_ = ((_e35 * _e36.xxxx) + _e39);
    let _e44 = _v_buffer1_.v_cb1_[2];
    let _e45 = in_POSITION0_1;
    let _e48 = u_xlat0_;
    u_xlat0_ = ((_e44 * _e45.zzzz) + _e48);
    let _e50 = u_xlat0_;
    let _e54 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e50 + _e54);
    let _e56 = u_xlat0_;
    let _e61 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e56.yyyy * _e61);
    let _e66 = _v_buffer0_.v_cb0_[79];
    let _e67 = u_xlat0_;
    let _e70 = u_xlat1_;
    u_xlat1_ = ((_e66 * _e67.xxxx) + _e70);
    let _e75 = _v_buffer0_.v_cb0_[81];
    let _e76 = u_xlat0_;
    let _e79 = u_xlat1_;
    u_xlat1_ = ((_e75 * _e76.zzzz) + _e79);
    let _e85 = _v_buffer0_.v_cb0_[82];
    let _e86 = u_xlat0_;
    let _e89 = u_xlat1_;
    gl_Position = ((_e85 * _e86.wwww) + _e89);
    let _e91 = vs_TEXCOORD0_;
    let _e93 = in_TEXCOORD0_1;
    let _e98 = _v_buffer2_.v_cb2_[0];
    let _e104 = _v_buffer2_.v_cb2_[0];
    let _e106 = ((_e93.xy * _e98.xy) + _e104.zw);
    vs_TEXCOORD0_.x = _e106.x;
    vs_TEXCOORD0_.y = _e106.y;
    let _e111 = vs_TEXCOORD1_;
    let _e113 = in_TEXCOORD0_1;
    let _e118 = _v_buffer2_.v_cb2_[1];
    let _e124 = _v_buffer2_.v_cb2_[1];
    let _e126 = ((_e113.xy * _e118.xy) + _e124.zw);
    vs_TEXCOORD1_.x = _e126.x;
    vs_TEXCOORD1_.y = _e126.y;
    let _e135 = _v_buffer2_.v_cb2_[3];
    u_xlat0_.x = _e135.x;
    let _e141 = _v_buffer2_.v_cb2_[2];
    u_xlat0_.w = _e141.w;
    let _e143 = u_xlat0_;
    let _e148 = _v_buffer2_.v_cb2_[2];
    u_xlat1_ = (_e143.xxxw * _e148);
    let _e150 = u_xlat0_;
    let _e152 = u_xlat1_;
    vs_COLOR0_ = (_e150.wwwx * _e152);
    let _e158 = _v_buffer2_.v_cb2_[5];
    u_xlat0_.x = _e158.x;
    let _e164 = _v_buffer2_.v_cb2_[4];
    u_xlat0_.w = _e164.w;
    let _e166 = u_xlat0_;
    let _e171 = _v_buffer2_.v_cb2_[4];
    u_xlat1_ = (_e166.xxxw * _e171);
    let _e173 = u_xlat0_;
    let _e175 = u_xlat1_;
    vs_COLOR1_ = (_e173.wwwx * _e175);
    let _e181 = _v_buffer1_.v_cb1_[27];
    u_xlat0_.x = abs(_e181.w);
    let _e188 = _v_buffer1_.v_cb1_[28];
    u_xlat0_.y = abs(_e188.w);
    let _e195 = _v_buffer1_.v_cb1_[29];
    u_xlat0_.z = abs(_e195.w);
    let _e198 = u_xlat0_;
    let _e200 = u_xlat0_;
    let _e202 = log2(_e200.xyz);
    u_xlat0_.x = _e202.x;
    u_xlat0_.y = _e202.y;
    u_xlat0_.z = _e202.z;
    let _e209 = u_xlat0_;
    let _e211 = u_xlat0_;
    let _e217 = (_e211.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat0_.x = _e217.x;
    u_xlat0_.y = _e217.y;
    u_xlat0_.z = _e217.z;
    let _e224 = u_xlat0_;
    let _e226 = u_xlat0_;
    let _e228 = exp2(_e226.xyz);
    u_xlat0_.x = _e228.x;
    u_xlat0_.y = _e228.y;
    u_xlat0_.z = _e228.z;
    let _e235 = u_xlat0_;
    let _e237 = u_xlat0_;
    let _e251 = ((_e237.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat0_.x = _e251.x;
    u_xlat0_.y = _e251.y;
    u_xlat0_.z = _e251.z;
    let _e258 = u_xlat0_;
    let _e260 = u_xlat0_;
    let _e266 = clamp(_e260.xyz, vec3(0f), vec3(1f));
    u_xlat0_.x = _e266.x;
    u_xlat0_.y = _e266.y;
    u_xlat0_.z = _e266.z;
    let _e273 = u_xlat0_;
    let _e275 = u_xlat0_;
    let _e284 = (_e275.xyz + vec3<f32>(-1f, -1f, -1f));
    u_xlat0_.x = _e284.x;
    u_xlat0_.y = _e284.y;
    u_xlat0_.z = _e284.z;
    u_xlat0_.w = 0f;
    let _e296 = _v_buffer2_.v_cb2_[5];
    let _e298 = u_xlat0_;
    u_xlat0_ = ((_e296.zzzz * _e298) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e306 = u_xlat0_;
    let _e307 = in_COLOR0_1;
    vs_COLOR2_ = (_e306 * _e307);
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(3) in_COLOR0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_COLOR0_1 = in_COLOR0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    main_1();
    let _e32 = vs_TEXCOORD0_;
    let _e34 = vs_TEXCOORD1_;
    let _e36 = vs_COLOR0_;
    let _e38 = vs_COLOR1_;
    let _e40 = vs_COLOR2_;
    let _e42 = gl_Position;
    return VertexOutput(_e32, _e34, _e36, _e38, _e40, _e42);
}
