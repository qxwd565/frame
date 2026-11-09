struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 30>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 9>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec4<f32>,
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
var<private> vs_TEXCOORD0_: vec4<f32>;
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
    let _e99 = _v_buffer2_.v_cb2_[2];
    let _e101 = (_e94.xx * _e99.xy);
    u_xlat0_.x = _e101.x;
    u_xlat0_.y = _e101.y;
    let _e106 = vs_TEXCOORD0_;
    let _e108 = in_TEXCOORD0_1;
    let _e113 = _v_buffer2_.v_cb2_[2];
    let _e116 = u_xlat0_;
    let _e118 = ((_e108.xy * _e113.zw) + _e116.xy);
    vs_TEXCOORD0_.z = _e118.x;
    vs_TEXCOORD0_.w = _e118.y;
    let _e123 = vs_TEXCOORD0_;
    let _e125 = in_TEXCOORD0_1;
    let _e130 = _v_buffer2_.v_cb2_[0];
    let _e136 = _v_buffer2_.v_cb2_[0];
    let _e138 = ((_e125.xy * _e130.xy) + _e136.zw);
    vs_TEXCOORD0_.x = _e138.x;
    vs_TEXCOORD0_.y = _e138.y;
    let _e143 = u_xlat0_;
    let _e148 = _v_buffer0_.v_cb0_[15];
    let _e153 = _v_buffer2_.v_cb2_[3];
    let _e156 = in_TEXCOORD0_1;
    let _e158 = ((_e148.xx * _e153.xy) + _e156.xy);
    u_xlat0_.x = _e158.x;
    u_xlat0_.y = _e158.y;
    let _e163 = vs_TEXCOORD1_;
    let _e165 = u_xlat0_;
    let _e170 = _v_buffer2_.v_cb2_[3];
    let _e172 = (_e165.xy * _e170.zz);
    vs_TEXCOORD1_.x = _e172.x;
    vs_TEXCOORD1_.y = _e172.y;
    let _e181 = _v_buffer1_.v_cb1_[27];
    u_xlat0_.x = abs(_e181.w);
    let _e188 = _v_buffer1_.v_cb1_[28];
    u_xlat0_.y = abs(_e188.w);
    let _e195 = _v_buffer1_.v_cb1_[29];
    u_xlat0_.z = abs(_e195.w);
    let _e198 = u_xlat0_;
    let _e200 = u_xlat0_;
    let _e202 = log2(_e200.xyz);
    u_xlat0_.x = _e202.x;
    u_xlat0_.y = _e202.y;
    u_xlat0_.z = _e202.z;
    let _e209 = u_xlat0_;
    let _e211 = u_xlat0_;
    let _e217 = (_e211.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat0_.x = _e217.x;
    u_xlat0_.y = _e217.y;
    u_xlat0_.z = _e217.z;
    let _e224 = u_xlat0_;
    let _e226 = u_xlat0_;
    let _e228 = exp2(_e226.xyz);
    u_xlat0_.x = _e228.x;
    u_xlat0_.y = _e228.y;
    u_xlat0_.z = _e228.z;
    let _e235 = u_xlat0_;
    let _e237 = u_xlat0_;
    let _e251 = ((_e237.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat0_.x = _e251.x;
    u_xlat0_.y = _e251.y;
    u_xlat0_.z = _e251.z;
    let _e258 = u_xlat0_;
    let _e260 = u_xlat0_;
    let _e266 = clamp(_e260.xyz, vec3(0f), vec3(1f));
    u_xlat0_.x = _e266.x;
    u_xlat0_.y = _e266.y;
    u_xlat0_.z = _e266.z;
    let _e273 = u_xlat0_;
    let _e275 = u_xlat0_;
    let _e280 = _v_buffer0_.v_cb0_[6];
    let _e282 = (_e275.xyz + _e280.xyz);
    u_xlat0_.x = _e282.x;
    u_xlat0_.y = _e282.y;
    u_xlat0_.z = _e282.z;
    let _e289 = u_xlat0_;
    let _e291 = u_xlat0_;
    let _e300 = (_e291.xyz + vec3<f32>(-1f, -1f, -1f));
    u_xlat0_.x = _e300.x;
    u_xlat0_.y = _e300.y;
    u_xlat0_.z = _e300.z;
    u_xlat0_.w = 0f;
    let _e312 = _v_buffer2_.v_cb2_[8];
    let _e314 = u_xlat0_;
    u_xlat0_ = ((_e312.yyyy * _e314) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e322 = u_xlat0_;
    let _e323 = in_COLOR0_1;
    vs_COLOR0_ = (_e322 * _e323);
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
