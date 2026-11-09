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
var<private> vs_COLOR0_: vec4<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);

    let _e21 = in_POSITION0_1;
    let _e26 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e21.yyyy * _e26);
    let _e31 = _v_buffer1_.v_cb1_[0];
    let _e32 = in_POSITION0_1;
    let _e35 = u_xlat0_;
    u_xlat0_ = ((_e31 * _e32.xxxx) + _e35);
    let _e40 = _v_buffer1_.v_cb1_[2];
    let _e41 = in_POSITION0_1;
    let _e44 = u_xlat0_;
    u_xlat0_ = ((_e40 * _e41.zzzz) + _e44);
    let _e46 = u_xlat0_;
    let _e50 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e46 + _e50);
    let _e52 = u_xlat0_;
    let _e57 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e52.yyyy * _e57);
    let _e62 = _v_buffer0_.v_cb0_[79];
    let _e63 = u_xlat0_;
    let _e66 = u_xlat1_;
    u_xlat1_ = ((_e62 * _e63.xxxx) + _e66);
    let _e71 = _v_buffer0_.v_cb0_[81];
    let _e72 = u_xlat0_;
    let _e75 = u_xlat1_;
    u_xlat1_ = ((_e71 * _e72.zzzz) + _e75);
    let _e81 = _v_buffer0_.v_cb0_[82];
    let _e82 = u_xlat0_;
    let _e85 = u_xlat1_;
    gl_Position = ((_e81 * _e82.wwww) + _e85);
    let _e87 = vs_TEXCOORD0_;
    let _e89 = in_TEXCOORD0_1;
    let _e94 = _v_buffer2_.v_cb2_[0];
    let _e100 = _v_buffer2_.v_cb2_[0];
    let _e102 = ((_e89.xy * _e94.xy) + _e100.zw);
    vs_TEXCOORD0_.x = _e102.x;
    vs_TEXCOORD0_.y = _e102.y;
    let _e111 = _v_buffer1_.v_cb1_[27];
    u_xlat0_.x = abs(_e111.w);
    let _e118 = _v_buffer1_.v_cb1_[28];
    u_xlat0_.y = abs(_e118.w);
    let _e125 = _v_buffer1_.v_cb1_[29];
    u_xlat0_.z = abs(_e125.w);
    let _e128 = u_xlat0_;
    let _e130 = u_xlat0_;
    let _e132 = log2(_e130.xyz);
    u_xlat0_.x = _e132.x;
    u_xlat0_.y = _e132.y;
    u_xlat0_.z = _e132.z;
    let _e139 = u_xlat0_;
    let _e141 = u_xlat0_;
    let _e147 = (_e141.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat0_.x = _e147.x;
    u_xlat0_.y = _e147.y;
    u_xlat0_.z = _e147.z;
    let _e154 = u_xlat0_;
    let _e156 = u_xlat0_;
    let _e158 = exp2(_e156.xyz);
    u_xlat0_.x = _e158.x;
    u_xlat0_.y = _e158.y;
    u_xlat0_.z = _e158.z;
    let _e165 = u_xlat0_;
    let _e167 = u_xlat0_;
    let _e181 = ((_e167.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat0_.x = _e181.x;
    u_xlat0_.y = _e181.y;
    u_xlat0_.z = _e181.z;
    let _e188 = u_xlat0_;
    let _e190 = u_xlat0_;
    let _e196 = clamp(_e190.xyz, vec3(0f), vec3(1f));
    u_xlat0_.x = _e196.x;
    u_xlat0_.y = _e196.y;
    u_xlat0_.z = _e196.z;
    let _e203 = u_xlat0_;
    let _e205 = u_xlat0_;
    let _e210 = _v_buffer0_.v_cb0_[6];
    let _e212 = (_e205.xyz + _e210.xyz);
    u_xlat0_.x = _e212.x;
    u_xlat0_.y = _e212.y;
    u_xlat0_.z = _e212.z;
    u_xlat0_.w = 1f;
    let _e221 = u_xlat0_;
    let _e225 = _v_buffer2_.v_cb2_[3];
    vs_COLOR0_ = (_e221 * _e225.yyyy);
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    main_1();
    let _e22 = vs_TEXCOORD0_;
    let _e24 = vs_COLOR0_;
    let _e26 = gl_Position;
    return VertexOutput(_e22, _e24, _e26);
}
