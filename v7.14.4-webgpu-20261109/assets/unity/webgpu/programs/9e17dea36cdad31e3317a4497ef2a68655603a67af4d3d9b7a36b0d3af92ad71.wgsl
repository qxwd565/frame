struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 30>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 3>,
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
    var u_xlat2_: f32 = 0f;
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat8_: vec2<f32> = vec2(0f);

    let _e34 = in_POSITION0_1;
    let _e39 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e34.yyyy * _e39);
    let _e44 = _v_buffer1_.v_cb1_[0];
    let _e45 = in_POSITION0_1;
    let _e48 = u_xlat0_;
    u_xlat0_ = ((_e44 * _e45.xxxx) + _e48);
    let _e53 = _v_buffer1_.v_cb1_[2];
    let _e54 = in_POSITION0_1;
    let _e57 = u_xlat0_;
    u_xlat0_ = ((_e53 * _e54.zzzz) + _e57);
    let _e59 = u_xlat0_;
    let _e63 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e59 + _e63);
    let _e65 = u_xlat0_;
    let _e70 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e65.yyyy * _e70);
    let _e75 = _v_buffer0_.v_cb0_[79];
    let _e76 = u_xlat0_;
    let _e79 = u_xlat1_;
    u_xlat1_ = ((_e75 * _e76.xxxx) + _e79);
    let _e84 = _v_buffer0_.v_cb0_[81];
    let _e85 = u_xlat0_;
    let _e88 = u_xlat1_;
    u_xlat1_ = ((_e84 * _e85.zzzz) + _e88);
    let _e94 = _v_buffer0_.v_cb0_[82];
    let _e95 = u_xlat0_;
    let _e98 = u_xlat1_;
    gl_Position = ((_e94 * _e95.wwww) + _e98);
    let _e104 = _v_buffer2_.v_cb2_[1];
    u_xlat0_.x = (_e104.w + 0.5f);
    let _e112 = _v_buffer2_.v_cb2_[2];
    u_xlat0_.y = (_e112.x + 0.5f);
    let _e116 = u_xlat0_;
    let _e118 = u_xlat0_;
    let _e121 = in_TEXCOORD0_1;
    let _e123 = (-(_e118.xy) + _e121.xy);
    u_xlat0_.x = _e123.x;
    u_xlat0_.y = _e123.y;
    let _e128 = u_xlat0_;
    let _e130 = u_xlat0_;
    let _e135 = _v_buffer2_.v_cb2_[2];
    let _e137 = (_e130.xy * _e135.yz);
    u_xlat0_.x = _e137.x;
    u_xlat0_.y = _e137.y;
    let _e146 = _v_buffer0_.v_cb0_[15];
    let _e151 = _v_buffer2_.v_cb2_[1];
    u_xlat8_.x = (_e146.x * _e151.z);
    let _e155 = u_xlat8_;
    u_xlat1_.x = sin(_e155.x);
    let _e158 = u_xlat8_;
    u_xlat2_ = cos(_e158.x);
    let _e162 = u_xlat1_;
    u_xlat3_.z = _e162.x;
    let _e165 = u_xlat2_;
    u_xlat3_.y = _e165;
    let _e167 = u_xlat1_;
    u_xlat3_.x = -(_e167.x);
    let _e171 = u_xlat0_;
    let _e173 = u_xlat3_;
    u_xlat8_.y = dot(_e171.xy, _e173.xy);
    let _e177 = u_xlat0_;
    let _e179 = u_xlat3_;
    u_xlat8_.x = dot(_e177.xy, _e179.yz);
    let _e182 = vs_TEXCOORD1_;
    let _e184 = u_xlat8_;
    let _e189 = (_e184.xy + vec2<f32>(0.5f, 0.5f));
    vs_TEXCOORD1_.x = _e189.x;
    vs_TEXCOORD1_.y = _e189.y;
    let _e194 = vs_TEXCOORD0_;
    let _e196 = in_TEXCOORD0_1;
    let _e197 = _e196.xy;
    vs_TEXCOORD0_.x = _e197.x;
    vs_TEXCOORD0_.y = _e197.y;
    let _e206 = _v_buffer1_.v_cb1_[27];
    u_xlat0_.x = abs(_e206.w);
    let _e213 = _v_buffer1_.v_cb1_[28];
    u_xlat0_.y = abs(_e213.w);
    let _e220 = _v_buffer1_.v_cb1_[29];
    u_xlat0_.z = abs(_e220.w);
    let _e223 = u_xlat0_;
    let _e225 = u_xlat0_;
    let _e227 = log2(_e225.xyz);
    u_xlat0_.x = _e227.x;
    u_xlat0_.y = _e227.y;
    u_xlat0_.z = _e227.z;
    let _e234 = u_xlat0_;
    let _e236 = u_xlat0_;
    let _e242 = (_e236.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat0_.x = _e242.x;
    u_xlat0_.y = _e242.y;
    u_xlat0_.z = _e242.z;
    let _e249 = u_xlat0_;
    let _e251 = u_xlat0_;
    let _e253 = exp2(_e251.xyz);
    u_xlat0_.x = _e253.x;
    u_xlat0_.y = _e253.y;
    u_xlat0_.z = _e253.z;
    let _e260 = u_xlat0_;
    let _e262 = u_xlat0_;
    let _e276 = ((_e262.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat0_.x = _e276.x;
    u_xlat0_.y = _e276.y;
    u_xlat0_.z = _e276.z;
    let _e283 = u_xlat0_;
    let _e285 = u_xlat0_;
    let _e291 = clamp(_e285.xyz, vec3(0f), vec3(1f));
    u_xlat0_.x = _e291.x;
    u_xlat0_.y = _e291.y;
    u_xlat0_.z = _e291.z;
    let _e298 = u_xlat0_;
    let _e300 = u_xlat0_;
    let _e305 = _v_buffer0_.v_cb0_[6];
    let _e307 = (_e300.xyz + _e305.xyz);
    u_xlat0_.x = _e307.x;
    u_xlat0_.y = _e307.y;
    u_xlat0_.z = _e307.z;
    let _e314 = u_xlat0_;
    let _e316 = u_xlat0_;
    let _e325 = (_e316.xyz + vec3<f32>(-1f, -1f, -1f));
    u_xlat0_.x = _e325.x;
    u_xlat0_.y = _e325.y;
    u_xlat0_.z = _e325.z;
    u_xlat0_.w = 0f;
    let _e337 = _v_buffer2_.v_cb2_[2];
    let _e339 = u_xlat0_;
    u_xlat0_ = ((_e337.wwww * _e339) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e347 = in_COLOR0_1;
    let _e351 = _v_buffer2_.v_cb2_[1];
    u_xlat1_ = (_e347 * _e351.xxxx);
    let _e354 = u_xlat1_;
    let _e355 = u_xlat1_;
    u_xlat1_ = (_e354 + _e355);
    let _e357 = u_xlat0_;
    let _e358 = u_xlat1_;
    u_xlat0_ = (_e357 * _e358);
    let _e360 = u_xlat0_;
    let _e364 = _v_buffer2_.v_cb2_[0];
    u_xlat0_ = (_e360 * _e364.wwww);
    let _e367 = u_xlat0_;
    let _e371 = _v_buffer2_.v_cb2_[1];
    vs_COLOR0_ = (_e367 * _e371.yyyy);
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
