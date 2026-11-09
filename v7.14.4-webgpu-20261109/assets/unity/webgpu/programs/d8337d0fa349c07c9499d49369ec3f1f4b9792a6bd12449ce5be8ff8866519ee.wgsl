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
    @location(5) vs_TEXCOORD5_: vec2<f32>,
    @location(6) vs_TEXCOORD6_: vec2<f32>,
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
var<private> in_TEXCOORD1_1: vec2<f32>;
var<private> in_COLOR0_1: vec4<f32>;
var<private> vs_TEXCOORD0_: vec2<f32>;
var<private> vs_TEXCOORD5_: vec2<f32>;
var<private> vs_TEXCOORD6_: vec2<f32>;
var<private> vs_COLOR0_: vec4<f32>;
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
    let _e111 = vs_TEXCOORD5_;
    let _e113 = in_TEXCOORD0_1;
    let _e118 = _v_buffer2_.v_cb2_[1];
    let _e124 = _v_buffer2_.v_cb2_[1];
    let _e126 = ((_e113.xy * _e118.xy) + _e124.zw);
    vs_TEXCOORD5_.x = _e126.x;
    vs_TEXCOORD5_.y = _e126.y;
    let _e131 = vs_TEXCOORD6_;
    let _e133 = in_TEXCOORD1_1;
    let _e138 = _v_buffer2_.v_cb2_[2];
    let _e144 = _v_buffer2_.v_cb2_[2];
    let _e146 = ((_e133.xy * _e138.xy) + _e144.zw);
    vs_TEXCOORD6_.x = _e146.x;
    vs_TEXCOORD6_.y = _e146.y;
    let _e155 = _v_buffer1_.v_cb1_[27];
    u_xlat0_.x = abs(_e155.w);
    let _e162 = _v_buffer1_.v_cb1_[28];
    u_xlat0_.y = abs(_e162.w);
    let _e169 = _v_buffer1_.v_cb1_[29];
    u_xlat0_.z = abs(_e169.w);
    let _e172 = u_xlat0_;
    let _e174 = u_xlat0_;
    let _e176 = log2(_e174.xyz);
    u_xlat0_.x = _e176.x;
    u_xlat0_.y = _e176.y;
    u_xlat0_.z = _e176.z;
    let _e183 = u_xlat0_;
    let _e185 = u_xlat0_;
    let _e191 = (_e185.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat0_.x = _e191.x;
    u_xlat0_.y = _e191.y;
    u_xlat0_.z = _e191.z;
    let _e198 = u_xlat0_;
    let _e200 = u_xlat0_;
    let _e202 = exp2(_e200.xyz);
    u_xlat0_.x = _e202.x;
    u_xlat0_.y = _e202.y;
    u_xlat0_.z = _e202.z;
    let _e209 = u_xlat0_;
    let _e211 = u_xlat0_;
    let _e225 = ((_e211.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat0_.x = _e225.x;
    u_xlat0_.y = _e225.y;
    u_xlat0_.z = _e225.z;
    let _e232 = u_xlat0_;
    let _e234 = u_xlat0_;
    let _e240 = clamp(_e234.xyz, vec3(0f), vec3(1f));
    u_xlat0_.x = _e240.x;
    u_xlat0_.y = _e240.y;
    u_xlat0_.z = _e240.z;
    let _e247 = u_xlat0_;
    let _e252 = _v_buffer0_.v_cb0_[6];
    let _e257 = _v_buffer1_.v_cb1_[11];
    let _e260 = u_xlat0_;
    let _e262 = ((_e252.xyz * _e257.zzz) + _e260.xyz);
    u_xlat0_.x = _e262.x;
    u_xlat0_.y = _e262.y;
    u_xlat0_.z = _e262.z;
    u_xlat0_.w = 1f;
    let _e271 = u_xlat0_;
    let _e272 = in_COLOR0_1;
    u_xlat0_ = (_e271 + -(_e272));
    let _e278 = _v_buffer2_.v_cb2_[3];
    let _e280 = u_xlat0_;
    let _e282 = in_COLOR0_1;
    vs_COLOR0_ = ((_e278.yyyy * _e280) + _e282);
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(5) in_TEXCOORD1_: vec2<f32>, @location(3) in_COLOR0_: vec4<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_TEXCOORD1_1 = in_TEXCOORD1_;
    in_COLOR0_1 = in_COLOR0_;
    main_1();
    let _e34 = vs_TEXCOORD0_;
    let _e36 = vs_TEXCOORD5_;
    let _e38 = vs_TEXCOORD6_;
    let _e40 = vs_COLOR0_;
    let _e42 = gl_Position;
    return VertexOutput(_e34, _e36, _e38, _e40, _e42);
}
