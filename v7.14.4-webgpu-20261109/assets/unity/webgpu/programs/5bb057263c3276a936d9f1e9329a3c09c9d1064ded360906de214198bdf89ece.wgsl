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
    @location(2) vs_TEXCOORD2_: vec2<f32>,
    @location(3) vs_TEXCOORD3_: f32,
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
var<private> vs_TEXCOORD0_: vec2<f32>;
var<private> vs_TEXCOORD1_: vec2<f32>;
var<private> vs_TEXCOORD2_: vec2<f32>;
var<private> vs_TEXCOORD3_: f32;
var<private> vs_COLOR0_: vec4<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);

    let _e24 = vs_TEXCOORD0_;
    let _e26 = in_TEXCOORD0_1;
    let _e31 = _v_buffer2_.v_cb2_[0];
    let _e37 = _v_buffer2_.v_cb2_[0];
    let _e39 = ((_e26.xy * _e31.xy) + _e37.zw);
    vs_TEXCOORD0_.x = _e39.x;
    vs_TEXCOORD0_.y = _e39.y;
    let _e44 = vs_TEXCOORD1_;
    let _e46 = in_TEXCOORD0_1;
    let _e51 = _v_buffer2_.v_cb2_[2];
    let _e57 = _v_buffer2_.v_cb2_[2];
    let _e59 = ((_e46.xy * _e51.xy) + _e57.zw);
    vs_TEXCOORD1_.x = _e59.x;
    vs_TEXCOORD1_.y = _e59.y;
    let _e64 = vs_TEXCOORD2_;
    let _e66 = in_TEXCOORD0_1;
    let _e71 = _v_buffer2_.v_cb2_[5];
    let _e77 = _v_buffer2_.v_cb2_[5];
    let _e79 = ((_e66.xy * _e71.xy) + _e77.zw);
    vs_TEXCOORD2_.x = _e79.x;
    vs_TEXCOORD2_.y = _e79.y;
    vs_TEXCOORD3_ = 0f;
    let _e85 = in_POSITION0_1;
    let _e90 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e85.yyyy * _e90);
    let _e95 = _v_buffer1_.v_cb1_[0];
    let _e96 = in_POSITION0_1;
    let _e99 = u_xlat0_;
    u_xlat0_ = ((_e95 * _e96.xxxx) + _e99);
    let _e104 = _v_buffer1_.v_cb1_[2];
    let _e105 = in_POSITION0_1;
    let _e108 = u_xlat0_;
    u_xlat0_ = ((_e104 * _e105.zzzz) + _e108);
    let _e110 = u_xlat0_;
    let _e114 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e110 + _e114);
    let _e116 = u_xlat0_;
    let _e121 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e116.yyyy * _e121);
    let _e126 = _v_buffer0_.v_cb0_[79];
    let _e127 = u_xlat0_;
    let _e130 = u_xlat1_;
    u_xlat1_ = ((_e126 * _e127.xxxx) + _e130);
    let _e135 = _v_buffer0_.v_cb0_[81];
    let _e136 = u_xlat0_;
    let _e139 = u_xlat1_;
    u_xlat1_ = ((_e135 * _e136.zzzz) + _e139);
    let _e145 = _v_buffer0_.v_cb0_[82];
    let _e146 = u_xlat0_;
    let _e149 = u_xlat1_;
    gl_Position = ((_e145 * _e146.wwww) + _e149);
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
    let _e247 = vs_COLOR0_;
    let _e249 = u_xlat0_;
    let _e254 = _v_buffer0_.v_cb0_[6];
    let _e256 = (_e249.xyz + _e254.xyz);
    vs_COLOR0_.x = _e256.x;
    vs_COLOR0_.y = _e256.y;
    vs_COLOR0_.z = _e256.z;
    vs_COLOR0_.w = 1f;
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    main_1();
    let _e28 = vs_TEXCOORD0_;
    let _e30 = vs_TEXCOORD1_;
    let _e32 = vs_TEXCOORD2_;
    let _e34 = vs_TEXCOORD3_;
    let _e36 = vs_COLOR0_;
    let _e38 = gl_Position;
    return VertexOutput(_e28, _e30, _e32, _e34, _e36, _e38);
}
