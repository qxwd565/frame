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
    @location(0) vs_TEXCOORD0_: vec4<f32>,
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
var<private> vs_TEXCOORD0_: vec4<f32>;
var<private> vs_COLOR0_: vec4<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);

    let _e22 = in_POSITION0_1;
    let _e27 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e22.yyyy * _e27);
    let _e32 = _v_buffer1_.v_cb1_[0];
    let _e33 = in_POSITION0_1;
    let _e36 = u_xlat0_;
    u_xlat0_ = ((_e32 * _e33.xxxx) + _e36);
    let _e41 = _v_buffer1_.v_cb1_[2];
    let _e42 = in_POSITION0_1;
    let _e45 = u_xlat0_;
    u_xlat0_ = ((_e41 * _e42.zzzz) + _e45);
    let _e47 = u_xlat0_;
    let _e51 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e47 + _e51);
    let _e53 = u_xlat0_;
    let _e58 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e53.yyyy * _e58);
    let _e63 = _v_buffer0_.v_cb0_[79];
    let _e64 = u_xlat0_;
    let _e67 = u_xlat1_;
    u_xlat1_ = ((_e63 * _e64.xxxx) + _e67);
    let _e72 = _v_buffer0_.v_cb0_[81];
    let _e73 = u_xlat0_;
    let _e76 = u_xlat1_;
    u_xlat1_ = ((_e72 * _e73.zzzz) + _e76);
    let _e82 = _v_buffer0_.v_cb0_[82];
    let _e83 = u_xlat0_;
    let _e86 = u_xlat1_;
    gl_Position = ((_e82 * _e83.wwww) + _e86);
    let _e88 = u_xlat0_;
    let _e90 = in_TEXCOORD0_1;
    let _e95 = _v_buffer2_.v_cb2_[0];
    let _e97 = (_e90.xy + _e95.zw);
    u_xlat0_.x = _e97.x;
    u_xlat0_.y = _e97.y;
    let _e102 = vs_TEXCOORD0_;
    let _e104 = u_xlat0_;
    let _e109 = _v_buffer2_.v_cb2_[0];
    let _e111 = (_e104.xy * _e109.xy);
    vs_TEXCOORD0_.x = _e111.x;
    vs_TEXCOORD0_.y = _e111.y;
    let _e116 = u_xlat0_;
    let _e118 = in_TEXCOORD0_1;
    let _e123 = _v_buffer2_.v_cb2_[1];
    let _e125 = (_e118.xy + _e123.zw);
    u_xlat0_.x = _e125.x;
    u_xlat0_.y = _e125.y;
    let _e130 = vs_TEXCOORD0_;
    let _e132 = u_xlat0_;
    let _e137 = _v_buffer2_.v_cb2_[1];
    let _e139 = (_e132.xy * _e137.xy);
    vs_TEXCOORD0_.z = _e139.x;
    vs_TEXCOORD0_.w = _e139.y;
    let _e148 = _v_buffer1_.v_cb1_[27];
    u_xlat0_.x = abs(_e148.w);
    let _e155 = _v_buffer1_.v_cb1_[28];
    u_xlat0_.y = abs(_e155.w);
    let _e162 = _v_buffer1_.v_cb1_[29];
    u_xlat0_.z = abs(_e162.w);
    let _e165 = u_xlat0_;
    let _e167 = u_xlat0_;
    let _e169 = log2(_e167.xyz);
    u_xlat0_.x = _e169.x;
    u_xlat0_.y = _e169.y;
    u_xlat0_.z = _e169.z;
    let _e176 = u_xlat0_;
    let _e178 = u_xlat0_;
    let _e184 = (_e178.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat0_.x = _e184.x;
    u_xlat0_.y = _e184.y;
    u_xlat0_.z = _e184.z;
    let _e191 = u_xlat0_;
    let _e193 = u_xlat0_;
    let _e195 = exp2(_e193.xyz);
    u_xlat0_.x = _e195.x;
    u_xlat0_.y = _e195.y;
    u_xlat0_.z = _e195.z;
    let _e202 = u_xlat0_;
    let _e204 = u_xlat0_;
    let _e218 = ((_e204.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat0_.x = _e218.x;
    u_xlat0_.y = _e218.y;
    u_xlat0_.z = _e218.z;
    let _e225 = u_xlat0_;
    let _e227 = u_xlat0_;
    let _e233 = clamp(_e227.xyz, vec3(0f), vec3(1f));
    u_xlat0_.x = _e233.x;
    u_xlat0_.y = _e233.y;
    u_xlat0_.z = _e233.z;
    let _e240 = u_xlat0_;
    let _e242 = u_xlat0_;
    let _e247 = _v_buffer0_.v_cb0_[6];
    let _e249 = (_e242.xyz + _e247.xyz);
    u_xlat0_.x = _e249.x;
    u_xlat0_.y = _e249.y;
    u_xlat0_.z = _e249.z;
    let _e256 = u_xlat0_;
    let _e258 = u_xlat0_;
    let _e267 = (_e258.xyz + vec3<f32>(-1f, -1f, -1f));
    u_xlat0_.x = _e267.x;
    u_xlat0_.y = _e267.y;
    u_xlat0_.z = _e267.z;
    u_xlat0_.w = 0f;
    let _e279 = _v_buffer2_.v_cb2_[3];
    let _e281 = u_xlat0_;
    u_xlat0_ = ((_e279.zzzz * _e281) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e289 = u_xlat0_;
    let _e290 = in_COLOR0_1;
    vs_COLOR0_ = (_e289 * _e290);
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(3) in_COLOR0_: vec4<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_COLOR0_1 = in_COLOR0_;
    main_1();
    let _e26 = vs_TEXCOORD0_;
    let _e28 = vs_COLOR0_;
    let _e30 = gl_Position;
    return VertexOutput(_e26, _e28, _e30);
}
