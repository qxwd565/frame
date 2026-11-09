struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 30>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 4>,
}

struct v_buffer3_ {
    v_cb3_: array<vec4<f32>, 5>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec4<f32>,
    @location(2) vs_TEXCOORD2_: vec3<f32>,
    @location(3) vs_TEXCOORD3_: vec3<f32>,
    @location(4) vs_TEXCOORD4_: vec4<f32>,
    @location(5) vs_TEXCOORD5_: vec3<f32>,
    @location(12) vs_NORMAL0_: vec3<f32>,
    @location(10) vs_COLOR0_: vec4<f32>,
    @builtin(position) gl_Position: vec4<f32>,
}

@group(0) @binding(0) 
var<uniform> _v_buffer0_: v_buffer0_;
@group(0) @binding(1) 
var<uniform> _v_buffer1_: v_buffer1_;
@group(0) @binding(2) 
var<uniform> _v_buffer2_: v_buffer2_;
@group(0) @binding(3) 
var<uniform> _v_buffer3_: v_buffer3_;
var<private> in_POSITION0_1: vec4<f32>;
var<private> in_TEXCOORD0_1: vec2<f32>;
var<private> in_TEXCOORD1_1: vec2<f32>;
var<private> in_NORMAL0_1: vec3<f32>;
var<private> vs_TEXCOORD0_: vec4<f32>;
var<private> vs_TEXCOORD2_: vec3<f32>;
var<private> vs_TEXCOORD3_: vec3<f32>;
var<private> vs_TEXCOORD4_: vec4<f32>;
var<private> vs_TEXCOORD5_: vec3<f32>;
var<private> vs_NORMAL0_: vec3<f32>;
var<private> vs_COLOR0_: vec4<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat6_: f32 = 0f;

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
    let _e100 = vs_TEXCOORD0_;
    let _e102 = in_TEXCOORD0_1;
    let _e103 = _e102.xy;
    vs_TEXCOORD0_.x = _e103.x;
    vs_TEXCOORD0_.y = _e103.y;
    let _e108 = vs_TEXCOORD0_;
    let _e110 = in_TEXCOORD1_1;
    let _e111 = _e110.xy;
    vs_TEXCOORD0_.z = _e111.x;
    vs_TEXCOORD0_.w = _e111.y;
    let _e116 = vs_TEXCOORD2_;
    let _e118 = u_xlat0_;
    let _e124 = _v_buffer0_.v_cb0_[21];
    let _e126 = (-(_e118.xyz) + _e124.xyz);
    vs_TEXCOORD2_.x = _e126.x;
    vs_TEXCOORD2_.y = _e126.y;
    vs_TEXCOORD2_.z = _e126.z;
    let _e133 = vs_TEXCOORD3_;
    let _e135 = u_xlat0_;
    let _e141 = _v_buffer0_.v_cb0_[5];
    let _e143 = (-(_e135.xyz) + _e141.xyz);
    vs_TEXCOORD3_.x = _e143.x;
    vs_TEXCOORD3_.y = _e143.y;
    vs_TEXCOORD3_.z = _e143.z;
    let _e150 = u_xlat1_;
    let _e152 = u_xlat0_;
    let _e157 = _v_buffer2_.v_cb2_[1];
    let _e159 = (_e152.yyy * _e157.xyz);
    u_xlat1_.x = _e159.x;
    u_xlat1_.y = _e159.y;
    u_xlat1_.z = _e159.z;
    let _e166 = u_xlat1_;
    let _e171 = _v_buffer2_.v_cb2_[0];
    let _e173 = u_xlat0_;
    let _e176 = u_xlat1_;
    let _e178 = ((_e171.xyz * _e173.xxx) + _e176.xyz);
    u_xlat1_.x = _e178.x;
    u_xlat1_.y = _e178.y;
    u_xlat1_.z = _e178.z;
    let _e185 = u_xlat1_;
    let _e190 = _v_buffer2_.v_cb2_[2];
    let _e192 = u_xlat0_;
    let _e195 = u_xlat1_;
    let _e197 = ((_e190.xyz * _e192.zzz) + _e195.xyz);
    u_xlat1_.x = _e197.x;
    u_xlat1_.y = _e197.y;
    u_xlat1_.z = _e197.z;
    let _e204 = vs_TEXCOORD5_;
    let _e206 = u_xlat0_;
    let _e207 = _e206.xyz;
    vs_TEXCOORD5_.x = _e207.x;
    vs_TEXCOORD5_.y = _e207.y;
    vs_TEXCOORD5_.z = _e207.z;
    let _e214 = vs_TEXCOORD4_;
    let _e216 = u_xlat1_;
    let _e221 = _v_buffer2_.v_cb2_[3];
    let _e223 = (_e216.xyz + _e221.xyz);
    vs_TEXCOORD4_.x = _e223.x;
    vs_TEXCOORD4_.y = _e223.y;
    vs_TEXCOORD4_.z = _e223.z;
    vs_TEXCOORD4_.w = 0f;
    let _e233 = in_NORMAL0_1;
    let _e238 = _v_buffer1_.v_cb1_[4];
    u_xlat0_.x = dot(_e233.xyz, _e238.xyz);
    let _e242 = in_NORMAL0_1;
    let _e247 = _v_buffer1_.v_cb1_[5];
    u_xlat0_.y = dot(_e242.xyz, _e247.xyz);
    let _e251 = in_NORMAL0_1;
    let _e256 = _v_buffer1_.v_cb1_[6];
    u_xlat0_.z = dot(_e251.xyz, _e256.xyz);
    let _e259 = u_xlat0_;
    let _e261 = u_xlat0_;
    u_xlat6_ = dot(_e259.xyz, _e261.xyz);
    let _e264 = u_xlat6_;
    u_xlat6_ = max(_e264, 0.000000000000000000000000000000000000011754944f);
    let _e267 = u_xlat6_;
    u_xlat6_ = inverseSqrt(_e267);
    let _e269 = vs_NORMAL0_;
    let _e271 = u_xlat6_;
    let _e273 = u_xlat0_;
    let _e275 = (vec3(_e271) * _e273.xyz);
    vs_NORMAL0_.x = _e275.x;
    vs_NORMAL0_.y = _e275.y;
    vs_NORMAL0_.z = _e275.z;
    let _e286 = _v_buffer1_.v_cb1_[27];
    u_xlat0_.x = abs(_e286.w);
    let _e293 = _v_buffer1_.v_cb1_[28];
    u_xlat0_.y = abs(_e293.w);
    let _e300 = _v_buffer1_.v_cb1_[29];
    u_xlat0_.z = abs(_e300.w);
    let _e303 = u_xlat0_;
    let _e305 = u_xlat0_;
    let _e307 = log2(_e305.xyz);
    u_xlat0_.x = _e307.x;
    u_xlat0_.y = _e307.y;
    u_xlat0_.z = _e307.z;
    let _e314 = u_xlat0_;
    let _e316 = u_xlat0_;
    let _e322 = (_e316.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat0_.x = _e322.x;
    u_xlat0_.y = _e322.y;
    u_xlat0_.z = _e322.z;
    let _e329 = u_xlat0_;
    let _e331 = u_xlat0_;
    let _e333 = exp2(_e331.xyz);
    u_xlat0_.x = _e333.x;
    u_xlat0_.y = _e333.y;
    u_xlat0_.z = _e333.z;
    let _e340 = u_xlat0_;
    let _e342 = u_xlat0_;
    let _e356 = ((_e342.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat0_.x = _e356.x;
    u_xlat0_.y = _e356.y;
    u_xlat0_.z = _e356.z;
    let _e363 = u_xlat0_;
    let _e365 = u_xlat0_;
    let _e371 = clamp(_e365.xyz, vec3(0f), vec3(1f));
    u_xlat0_.x = _e371.x;
    u_xlat0_.y = _e371.y;
    u_xlat0_.z = _e371.z;
    let _e378 = u_xlat0_;
    let _e380 = u_xlat0_;
    let _e385 = _v_buffer0_.v_cb0_[6];
    let _e387 = (_e380.xyz + _e385.xyz);
    u_xlat0_.x = _e387.x;
    u_xlat0_.y = _e387.y;
    u_xlat0_.z = _e387.z;
    let _e394 = u_xlat0_;
    let _e396 = u_xlat0_;
    let _e405 = (_e396.xyz + vec3<f32>(-1f, -1f, -1f));
    u_xlat0_.x = _e405.x;
    u_xlat0_.y = _e405.y;
    u_xlat0_.z = _e405.z;
    u_xlat0_.w = 0f;
    let _e417 = _v_buffer3_.v_cb3_[4];
    let _e419 = u_xlat0_;
    u_xlat0_ = ((_e417.zzzz * _e419) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e427 = u_xlat0_;
    let _e431 = _v_buffer3_.v_cb3_[1];
    vs_COLOR0_ = (_e427 * _e431);
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(5) in_TEXCOORD1_: vec2<f32>, @location(1) in_NORMAL0_: vec3<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_TEXCOORD1_1 = in_TEXCOORD1_;
    in_NORMAL0_1 = in_NORMAL0_;
    main_1();
    let _e43 = vs_TEXCOORD0_;
    let _e45 = vs_TEXCOORD2_;
    let _e47 = vs_TEXCOORD3_;
    let _e49 = vs_TEXCOORD4_;
    let _e51 = vs_TEXCOORD5_;
    let _e53 = vs_NORMAL0_;
    let _e55 = vs_COLOR0_;
    let _e57 = gl_Position;
    return VertexOutput(_e43, _e45, _e47, _e49, _e51, _e53, _e55, _e57);
}
