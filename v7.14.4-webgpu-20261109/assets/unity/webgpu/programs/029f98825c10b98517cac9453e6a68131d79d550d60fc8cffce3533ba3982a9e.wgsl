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
var<private> vs_TEXCOORD1_: vec2<f32>;
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
    let _e89 = u_xlat0_;
    let _e94 = _v_buffer0_.v_cb0_[15];
    let _e99 = _v_buffer2_.v_cb2_[0];
    let _e101 = (_e94.xx * _e99.xy);
    u_xlat0_.x = _e101.x;
    u_xlat0_.y = _e101.y;
    let _e106 = vs_TEXCOORD1_;
    let _e108 = in_TEXCOORD0_1;
    let _e113 = _v_buffer2_.v_cb2_[0];
    let _e116 = u_xlat0_;
    let _e118 = ((_e108.xy * _e113.zw) + _e116.xy);
    vs_TEXCOORD1_.x = _e118.x;
    vs_TEXCOORD1_.y = _e118.y;
    let _e123 = vs_TEXCOORD0_;
    let _e125 = in_TEXCOORD0_1;
    let _e130 = _v_buffer2_.v_cb2_[1];
    let _e136 = _v_buffer2_.v_cb2_[1];
    let _e138 = ((_e125.xy * _e130.xy) + _e136.zw);
    vs_TEXCOORD0_.x = _e138.x;
    vs_TEXCOORD0_.y = _e138.y;
    let _e147 = _v_buffer1_.v_cb1_[27];
    u_xlat0_.x = abs(_e147.w);
    let _e154 = _v_buffer1_.v_cb1_[28];
    u_xlat0_.y = abs(_e154.w);
    let _e161 = _v_buffer1_.v_cb1_[29];
    u_xlat0_.z = abs(_e161.w);
    let _e164 = u_xlat0_;
    let _e166 = u_xlat0_;
    let _e168 = log2(_e166.xyz);
    u_xlat0_.x = _e168.x;
    u_xlat0_.y = _e168.y;
    u_xlat0_.z = _e168.z;
    let _e175 = u_xlat0_;
    let _e177 = u_xlat0_;
    let _e183 = (_e177.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat0_.x = _e183.x;
    u_xlat0_.y = _e183.y;
    u_xlat0_.z = _e183.z;
    let _e190 = u_xlat0_;
    let _e192 = u_xlat0_;
    let _e194 = exp2(_e192.xyz);
    u_xlat0_.x = _e194.x;
    u_xlat0_.y = _e194.y;
    u_xlat0_.z = _e194.z;
    let _e201 = u_xlat0_;
    let _e203 = u_xlat0_;
    let _e217 = ((_e203.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat0_.x = _e217.x;
    u_xlat0_.y = _e217.y;
    u_xlat0_.z = _e217.z;
    let _e224 = u_xlat0_;
    let _e226 = u_xlat0_;
    let _e232 = clamp(_e226.xyz, vec3(0f), vec3(1f));
    u_xlat0_.x = _e232.x;
    u_xlat0_.y = _e232.y;
    u_xlat0_.z = _e232.z;
    let _e239 = u_xlat0_;
    let _e241 = u_xlat0_;
    let _e246 = _v_buffer0_.v_cb0_[6];
    let _e248 = (_e241.xyz + _e246.xyz);
    u_xlat0_.x = _e248.x;
    u_xlat0_.y = _e248.y;
    u_xlat0_.z = _e248.z;
    let _e255 = u_xlat0_;
    let _e257 = u_xlat0_;
    let _e266 = (_e257.xyz + vec3<f32>(-1f, -1f, -1f));
    u_xlat0_.x = _e266.x;
    u_xlat0_.y = _e266.y;
    u_xlat0_.z = _e266.z;
    u_xlat0_.w = 0f;
    let _e278 = _v_buffer2_.v_cb2_[5];
    let _e280 = u_xlat0_;
    u_xlat0_ = ((_e278.xxxx * _e280) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e288 = in_COLOR0_1;
    let _e289 = in_COLOR0_1;
    u_xlat1_ = (_e288 + _e289);
    let _e291 = u_xlat1_;
    let _e295 = _v_buffer2_.v_cb2_[2];
    u_xlat1_ = (_e291 * _e295.xxxx);
    let _e298 = u_xlat0_;
    let _e299 = u_xlat1_;
    u_xlat0_ = (_e298 * _e299);
    let _e301 = u_xlat0_;
    let _e305 = _v_buffer2_.v_cb2_[3];
    u_xlat0_ = (_e301 * _e305.wwww);
    let _e308 = u_xlat0_;
    let _e312 = _v_buffer2_.v_cb2_[2];
    vs_COLOR0_ = (_e308 * _e312.yyyy);
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
