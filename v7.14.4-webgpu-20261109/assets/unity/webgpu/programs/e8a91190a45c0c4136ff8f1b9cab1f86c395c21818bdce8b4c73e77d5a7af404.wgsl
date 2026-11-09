struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 30>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 7>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec2<f32>,
    @location(1) vs_TEXCOORD1_: vec4<f32>,
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
var<private> vs_TEXCOORD1_: vec4<f32>;
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
    let _e89 = vs_TEXCOORD0_;
    let _e91 = in_TEXCOORD0_1;
    let _e92 = _e91.xy;
    vs_TEXCOORD0_.x = _e92.x;
    vs_TEXCOORD0_.y = _e92.y;
    let _e97 = u_xlat0_;
    let _e102 = _v_buffer0_.v_cb0_[15];
    let _e107 = _v_buffer2_.v_cb2_[4];
    let _e109 = (_e102.xx * _e107.xy);
    u_xlat0_.x = _e109.x;
    u_xlat0_.y = _e109.y;
    let _e114 = vs_TEXCOORD1_;
    let _e116 = in_TEXCOORD0_1;
    let _e121 = _v_buffer2_.v_cb2_[4];
    let _e124 = u_xlat0_;
    let _e126 = ((_e116.xy * _e121.zw) + _e124.xy);
    vs_TEXCOORD1_.x = _e126.x;
    vs_TEXCOORD1_.y = _e126.y;
    let _e131 = u_xlat0_;
    let _e136 = _v_buffer0_.v_cb0_[15];
    let _e141 = _v_buffer2_.v_cb2_[5];
    let _e143 = (_e136.xx * _e141.yz);
    u_xlat0_.x = _e143.x;
    u_xlat0_.y = _e143.y;
    let _e149 = in_TEXCOORD0_1;
    let _e154 = _v_buffer2_.v_cb2_[5];
    let _e157 = u_xlat0_;
    vs_TEXCOORD1_.z = ((_e149.x * _e154.w) + _e157.x);
    let _e161 = in_TEXCOORD0_1;
    let _e166 = _v_buffer2_.v_cb2_[6];
    let _e169 = u_xlat0_;
    vs_TEXCOORD1_.w = ((_e161.y * _e166.x) + _e169.y);
    let _e176 = _v_buffer1_.v_cb1_[27];
    u_xlat0_.x = abs(_e176.w);
    let _e183 = _v_buffer1_.v_cb1_[28];
    u_xlat0_.y = abs(_e183.w);
    let _e190 = _v_buffer1_.v_cb1_[29];
    u_xlat0_.z = abs(_e190.w);
    let _e193 = u_xlat0_;
    let _e195 = u_xlat0_;
    let _e197 = log2(_e195.xyz);
    u_xlat0_.x = _e197.x;
    u_xlat0_.y = _e197.y;
    u_xlat0_.z = _e197.z;
    let _e204 = u_xlat0_;
    let _e206 = u_xlat0_;
    let _e212 = (_e206.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat0_.x = _e212.x;
    u_xlat0_.y = _e212.y;
    u_xlat0_.z = _e212.z;
    let _e219 = u_xlat0_;
    let _e221 = u_xlat0_;
    let _e223 = exp2(_e221.xyz);
    u_xlat0_.x = _e223.x;
    u_xlat0_.y = _e223.y;
    u_xlat0_.z = _e223.z;
    let _e230 = u_xlat0_;
    let _e232 = u_xlat0_;
    let _e246 = ((_e232.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat0_.x = _e246.x;
    u_xlat0_.y = _e246.y;
    u_xlat0_.z = _e246.z;
    let _e253 = u_xlat0_;
    let _e255 = u_xlat0_;
    let _e261 = clamp(_e255.xyz, vec3(0f), vec3(1f));
    u_xlat0_.x = _e261.x;
    u_xlat0_.y = _e261.y;
    u_xlat0_.z = _e261.z;
    let _e268 = u_xlat0_;
    let _e270 = u_xlat0_;
    let _e275 = _v_buffer0_.v_cb0_[6];
    let _e277 = (_e270.xyz + _e275.xyz);
    u_xlat0_.x = _e277.x;
    u_xlat0_.y = _e277.y;
    u_xlat0_.z = _e277.z;
    let _e284 = u_xlat0_;
    let _e286 = u_xlat0_;
    let _e295 = (_e286.xyz + vec3<f32>(-1f, -1f, -1f));
    u_xlat0_.x = _e295.x;
    u_xlat0_.y = _e295.y;
    u_xlat0_.z = _e295.z;
    u_xlat0_.w = 0f;
    let _e307 = _v_buffer2_.v_cb2_[6];
    let _e309 = u_xlat0_;
    u_xlat0_ = ((_e307.yyyy * _e309) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e317 = in_COLOR0_1;
    let _e318 = in_COLOR0_1;
    u_xlat1_ = (_e317 + _e318);
    let _e320 = u_xlat1_;
    let _e324 = _v_buffer2_.v_cb2_[3];
    u_xlat1_ = (_e320 * _e324.zzzz);
    let _e327 = u_xlat0_;
    let _e328 = u_xlat1_;
    u_xlat0_ = (_e327 * _e328);
    let _e330 = u_xlat0_;
    let _e334 = _v_buffer2_.v_cb2_[3];
    u_xlat0_ = (_e330 * _e334.wwww);
    let _e337 = u_xlat0_;
    let _e341 = _v_buffer2_.v_cb2_[5];
    vs_COLOR0_ = (_e337 * _e341.xxxx);
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
