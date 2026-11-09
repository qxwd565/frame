struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 30>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 2>,
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
    let _e91 = _e90.xy;
    vs_TEXCOORD0_.x = _e91.x;
    vs_TEXCOORD0_.y = _e91.y;
    let _e100 = _v_buffer1_.v_cb1_[27];
    u_xlat0_.x = abs(_e100.w);
    let _e107 = _v_buffer1_.v_cb1_[28];
    u_xlat0_.y = abs(_e107.w);
    let _e114 = _v_buffer1_.v_cb1_[29];
    u_xlat0_.z = abs(_e114.w);
    let _e117 = u_xlat0_;
    let _e119 = u_xlat0_;
    let _e121 = log2(_e119.xyz);
    u_xlat0_.x = _e121.x;
    u_xlat0_.y = _e121.y;
    u_xlat0_.z = _e121.z;
    let _e128 = u_xlat0_;
    let _e130 = u_xlat0_;
    let _e136 = (_e130.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat0_.x = _e136.x;
    u_xlat0_.y = _e136.y;
    u_xlat0_.z = _e136.z;
    let _e143 = u_xlat0_;
    let _e145 = u_xlat0_;
    let _e147 = exp2(_e145.xyz);
    u_xlat0_.x = _e147.x;
    u_xlat0_.y = _e147.y;
    u_xlat0_.z = _e147.z;
    let _e154 = u_xlat0_;
    let _e156 = u_xlat0_;
    let _e170 = ((_e156.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat0_.x = _e170.x;
    u_xlat0_.y = _e170.y;
    u_xlat0_.z = _e170.z;
    let _e177 = u_xlat0_;
    let _e179 = u_xlat0_;
    let _e185 = clamp(_e179.xyz, vec3(0f), vec3(1f));
    u_xlat0_.x = _e185.x;
    u_xlat0_.y = _e185.y;
    u_xlat0_.z = _e185.z;
    let _e192 = u_xlat0_;
    let _e194 = u_xlat0_;
    let _e203 = (_e194.xyz + vec3<f32>(-1f, -1f, -1f));
    u_xlat0_.x = _e203.x;
    u_xlat0_.y = _e203.y;
    u_xlat0_.z = _e203.z;
    u_xlat0_.w = 0f;
    let _e215 = _v_buffer2_.v_cb2_[1];
    let _e217 = u_xlat0_;
    u_xlat0_ = ((_e215.yyyy * _e217) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e229 = _v_buffer2_.v_cb2_[1];
    let _e234 = _v_buffer2_.v_cb2_[1];
    u_xlat1_.x = (_e229.x + _e234.x);
    let _e237 = u_xlat1_;
    let _e239 = in_COLOR0_1;
    u_xlat1_ = (_e237.xxxx * _e239);
    let _e241 = u_xlat0_;
    let _e242 = u_xlat1_;
    vs_COLOR0_ = (_e241 * _e242);
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
