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
var<private> in_COLOR0_1: vec4<f32>;
var<private> vs_TEXCOORD0_: vec2<f32>;
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
    let _e88 = vs_TEXCOORD0_;
    let _e90 = in_TEXCOORD0_1;
    let _e95 = _v_buffer2_.v_cb2_[0];
    let _e101 = _v_buffer2_.v_cb2_[0];
    let _e103 = ((_e90.xy * _e95.xy) + _e101.zw);
    vs_TEXCOORD0_.x = _e103.x;
    vs_TEXCOORD0_.y = _e103.y;
    let _e112 = _v_buffer1_.v_cb1_[27];
    u_xlat0_.x = abs(_e112.w);
    let _e119 = _v_buffer1_.v_cb1_[28];
    u_xlat0_.y = abs(_e119.w);
    let _e126 = _v_buffer1_.v_cb1_[29];
    u_xlat0_.z = abs(_e126.w);
    let _e129 = u_xlat0_;
    let _e131 = u_xlat0_;
    let _e133 = log2(_e131.xyz);
    u_xlat0_.x = _e133.x;
    u_xlat0_.y = _e133.y;
    u_xlat0_.z = _e133.z;
    let _e140 = u_xlat0_;
    let _e142 = u_xlat0_;
    let _e148 = (_e142.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat0_.x = _e148.x;
    u_xlat0_.y = _e148.y;
    u_xlat0_.z = _e148.z;
    let _e155 = u_xlat0_;
    let _e157 = u_xlat0_;
    let _e159 = exp2(_e157.xyz);
    u_xlat0_.x = _e159.x;
    u_xlat0_.y = _e159.y;
    u_xlat0_.z = _e159.z;
    let _e166 = u_xlat0_;
    let _e168 = u_xlat0_;
    let _e182 = ((_e168.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat0_.x = _e182.x;
    u_xlat0_.y = _e182.y;
    u_xlat0_.z = _e182.z;
    let _e189 = u_xlat0_;
    let _e191 = u_xlat0_;
    let _e197 = clamp(_e191.xyz, vec3(0f), vec3(1f));
    u_xlat0_.x = _e197.x;
    u_xlat0_.y = _e197.y;
    u_xlat0_.z = _e197.z;
    let _e204 = u_xlat0_;
    let _e206 = u_xlat0_;
    let _e211 = _v_buffer0_.v_cb0_[6];
    let _e213 = (_e206.xyz + _e211.xyz);
    u_xlat0_.x = _e213.x;
    u_xlat0_.y = _e213.y;
    u_xlat0_.z = _e213.z;
    let _e220 = u_xlat0_;
    let _e222 = u_xlat0_;
    let _e231 = (_e222.xyz + vec3<f32>(-1f, -1f, -1f));
    u_xlat0_.x = _e231.x;
    u_xlat0_.y = _e231.y;
    u_xlat0_.z = _e231.z;
    u_xlat0_.w = 0f;
    let _e243 = _v_buffer2_.v_cb2_[3];
    let _e245 = u_xlat0_;
    u_xlat0_ = ((_e243.xxxx * _e245) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e253 = in_COLOR0_1;
    let _e257 = _v_buffer2_.v_cb2_[1];
    u_xlat1_ = (_e253 * _e257);
    let _e259 = u_xlat1_;
    let _e263 = _v_buffer2_.v_cb2_[2];
    u_xlat1_ = (_e259 * _e263.zzzz);
    let _e266 = u_xlat0_;
    let _e267 = u_xlat1_;
    vs_COLOR0_ = (_e266 * _e267);
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
