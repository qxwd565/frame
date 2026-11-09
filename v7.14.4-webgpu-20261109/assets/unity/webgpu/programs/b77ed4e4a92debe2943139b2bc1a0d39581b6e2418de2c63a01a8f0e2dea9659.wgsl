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
var<private> in_COLOR0_1: vec4<f32>;
var<private> in_TEXCOORD0_1: vec2<f32>;
var<private> vs_COLOR0_: vec4<f32>;
var<private> vs_TEXCOORD0_: vec2<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlatb2_: bool = false;
    var local: f32;

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
    let _e95 = _v_buffer1_.v_cb1_[27];
    u_xlat0_.x = abs(_e95.w);
    let _e102 = _v_buffer1_.v_cb1_[28];
    u_xlat0_.y = abs(_e102.w);
    let _e109 = _v_buffer1_.v_cb1_[29];
    u_xlat0_.z = abs(_e109.w);
    let _e112 = u_xlat0_;
    let _e114 = u_xlat0_;
    let _e116 = log2(_e114.xyz);
    u_xlat0_.x = _e116.x;
    u_xlat0_.y = _e116.y;
    u_xlat0_.z = _e116.z;
    let _e123 = u_xlat0_;
    let _e125 = u_xlat0_;
    let _e131 = (_e125.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat0_.x = _e131.x;
    u_xlat0_.y = _e131.y;
    u_xlat0_.z = _e131.z;
    let _e138 = u_xlat0_;
    let _e140 = u_xlat0_;
    let _e142 = exp2(_e140.xyz);
    u_xlat0_.x = _e142.x;
    u_xlat0_.y = _e142.y;
    u_xlat0_.z = _e142.z;
    let _e149 = u_xlat0_;
    let _e151 = u_xlat0_;
    let _e165 = ((_e151.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat0_.x = _e165.x;
    u_xlat0_.y = _e165.y;
    u_xlat0_.z = _e165.z;
    let _e172 = u_xlat0_;
    let _e174 = u_xlat0_;
    let _e180 = clamp(_e174.xyz, vec3(0f), vec3(1f));
    u_xlat0_.x = _e180.x;
    u_xlat0_.y = _e180.y;
    u_xlat0_.z = _e180.z;
    let _e187 = u_xlat0_;
    let _e189 = u_xlat0_;
    let _e198 = (_e189.xyz + vec3<f32>(-1f, -1f, -1f));
    u_xlat0_.x = _e198.x;
    u_xlat0_.y = _e198.y;
    u_xlat0_.z = _e198.z;
    let _e205 = u_xlat0_;
    let _e210 = _v_buffer2_.v_cb2_[3];
    let _e212 = u_xlat0_;
    let _e219 = ((_e210.xxx * _e212.xyz) + vec3<f32>(1f, 1f, 1f));
    u_xlat0_.x = _e219.x;
    u_xlat0_.y = _e219.y;
    u_xlat0_.z = _e219.z;
    let _e226 = u_xlat0_;
    let _e228 = u_xlat0_;
    let _e230 = in_COLOR0_1;
    let _e232 = (_e228.xyz * _e230.xyz);
    u_xlat0_.x = _e232.x;
    u_xlat0_.y = _e232.y;
    u_xlat0_.z = _e232.z;
    let _e239 = u_xlat0_;
    let _e241 = u_xlat0_;
    let _e247 = (_e241.xyz * vec3<f32>(2f, 2f, 2f));
    u_xlat0_.x = _e247.x;
    u_xlat0_.y = _e247.y;
    u_xlat0_.z = _e247.z;
    let _e254 = vs_COLOR0_;
    let _e256 = u_xlat0_;
    let _e261 = _v_buffer2_.v_cb2_[0];
    let _e263 = (_e256.xyz * _e261.xyz);
    vs_COLOR0_.x = _e263.x;
    vs_COLOR0_.y = _e263.y;
    vs_COLOR0_.z = _e263.z;
    let _e274 = _v_buffer2_.v_cb2_[1];
    let _e279 = _v_buffer2_.v_cb2_[1];
    u_xlat0_.x = (_e274.x * _e279.x);
    let _e283 = u_xlat0_;
    let _e285 = in_POSITION0_1;
    u_xlat0_.x = (_e283.x * _e285.z);
    let _e289 = u_xlat0_;
    let _e296 = _v_buffer0_.v_cb0_[15];
    u_xlat0_.x = ((_e289.x * 0.1f) + _e296.x);
    let _e300 = u_xlat0_;
    let _e305 = _v_buffer2_.v_cb2_[1];
    u_xlat0_.x = (_e300.x * _e305.y);
    let _e308 = u_xlat0_;
    let _e310 = u_xlat0_;
    u_xlatb2_ = (_e308.x >= -(_e310.x));
    let _e315 = u_xlat0_;
    u_xlat0_.x = fract(abs(_e315.x));
    let _e320 = u_xlatb2_;
    if _e320 {
        let _e321 = u_xlat0_;
        local = _e321.x;
    } else {
        let _e323 = u_xlat0_;
        local = -(_e323.x);
    }
    let _e327 = local;
    u_xlat0_.x = _e327;
    let _e329 = u_xlat0_;
    u_xlat0_.x = (_e329.x * 1.2f);
    let _e334 = u_xlat0_;
    u_xlat0_.x = floor(_e334.x);
    let _e338 = u_xlat0_;
    let _e343 = _v_buffer2_.v_cb2_[0];
    u_xlat0_.x = (_e338.x * _e343.w);
    let _e347 = u_xlat0_;
    vs_COLOR0_.w = (_e347.x * 2f);
    let _e351 = vs_TEXCOORD0_;
    let _e353 = in_TEXCOORD0_1;
    let _e358 = _v_buffer2_.v_cb2_[2];
    let _e364 = _v_buffer2_.v_cb2_[2];
    let _e366 = ((_e353.xy * _e358.xy) + _e364.zw);
    vs_TEXCOORD0_.x = _e366.x;
    vs_TEXCOORD0_.y = _e366.y;
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(3) in_COLOR0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_COLOR0_1 = in_COLOR0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    main_1();
    let _e26 = vs_COLOR0_;
    let _e28 = vs_TEXCOORD0_;
    let _e30 = gl_Position;
    return VertexOutput(_e26, _e28, _e30);
}
