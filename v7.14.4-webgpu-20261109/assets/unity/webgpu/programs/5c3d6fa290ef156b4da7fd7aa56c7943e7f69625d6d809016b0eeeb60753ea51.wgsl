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
    @location(10) vs_COLOR0_: vec4<f32>,
    @location(0) vs_TEXCOORD0_: vec2<f32>,
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
var<private> vs_COLOR0_: vec4<f32>;
var<private> vs_TEXCOORD0_: vec2<f32>;
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
    let _e91 = _v_buffer1_.v_cb1_[27];
    u_xlat0_.x = abs(_e91.w);
    let _e98 = _v_buffer1_.v_cb1_[28];
    u_xlat0_.y = abs(_e98.w);
    let _e105 = _v_buffer1_.v_cb1_[29];
    u_xlat0_.z = abs(_e105.w);
    let _e108 = u_xlat0_;
    let _e110 = u_xlat0_;
    let _e112 = log2(_e110.xyz);
    u_xlat0_.x = _e112.x;
    u_xlat0_.y = _e112.y;
    u_xlat0_.z = _e112.z;
    let _e119 = u_xlat0_;
    let _e121 = u_xlat0_;
    let _e127 = (_e121.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat0_.x = _e127.x;
    u_xlat0_.y = _e127.y;
    u_xlat0_.z = _e127.z;
    let _e134 = u_xlat0_;
    let _e136 = u_xlat0_;
    let _e138 = exp2(_e136.xyz);
    u_xlat0_.x = _e138.x;
    u_xlat0_.y = _e138.y;
    u_xlat0_.z = _e138.z;
    let _e145 = u_xlat0_;
    let _e147 = u_xlat0_;
    let _e161 = ((_e147.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat0_.x = _e161.x;
    u_xlat0_.y = _e161.y;
    u_xlat0_.z = _e161.z;
    let _e168 = u_xlat0_;
    let _e170 = u_xlat0_;
    let _e176 = clamp(_e170.xyz, vec3(0f), vec3(1f));
    u_xlat0_.x = _e176.x;
    u_xlat0_.y = _e176.y;
    u_xlat0_.z = _e176.z;
    let _e183 = u_xlat0_;
    let _e185 = u_xlat0_;
    let _e190 = _v_buffer0_.v_cb0_[6];
    let _e192 = (_e185.xyz + _e190.xyz);
    u_xlat0_.x = _e192.x;
    u_xlat0_.y = _e192.y;
    u_xlat0_.z = _e192.z;
    let _e199 = u_xlat0_;
    let _e201 = u_xlat0_;
    let _e210 = (_e201.xyz + vec3<f32>(-1f, -1f, -1f));
    u_xlat0_.x = _e210.x;
    u_xlat0_.y = _e210.y;
    u_xlat0_.z = _e210.z;
    u_xlat0_.w = 0f;
    let _e222 = _v_buffer2_.v_cb2_[3];
    let _e224 = u_xlat0_;
    u_xlat0_ = ((_e222.xxxx * _e224) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e232 = u_xlat0_;
    let _e236 = _v_buffer2_.v_cb2_[1];
    vs_COLOR0_ = (_e232 * _e236);
    let _e238 = vs_TEXCOORD0_;
    let _e240 = in_TEXCOORD0_1;
    let _e245 = _v_buffer2_.v_cb2_[0];
    let _e251 = _v_buffer2_.v_cb2_[0];
    let _e253 = ((_e240.xy * _e245.xy) + _e251.zw);
    vs_TEXCOORD0_.x = _e253.x;
    vs_TEXCOORD0_.y = _e253.y;
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    main_1();
    let _e22 = vs_COLOR0_;
    let _e24 = vs_TEXCOORD0_;
    let _e26 = gl_Position;
    return VertexOutput(_e22, _e24, _e26);
}
