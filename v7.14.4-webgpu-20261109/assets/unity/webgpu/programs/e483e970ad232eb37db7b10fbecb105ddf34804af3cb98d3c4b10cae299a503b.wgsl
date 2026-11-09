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
    let _e91 = in_TEXCOORD0_1;
    let _e96 = _v_buffer2_.v_cb2_[1];
    let _e102 = _v_buffer2_.v_cb2_[1];
    let _e104 = ((_e91.xy * _e96.xy) + _e102.zw);
    u_xlat0_.x = _e104.x;
    u_xlat0_.y = _e104.y;
    let _e110 = u_xlat0_;
    let _e115 = _v_buffer2_.v_cb2_[3];
    let _e121 = _v_buffer2_.v_cb2_[2];
    vs_TEXCOORD1_.x = ((_e110.x * _e115.y) + _e121.w);
    let _e125 = u_xlat0_;
    let _e130 = _v_buffer2_.v_cb2_[3];
    let _e136 = _v_buffer2_.v_cb2_[3];
    vs_TEXCOORD1_.y = ((_e125.y * _e130.z) + _e136.x);
    let _e139 = vs_TEXCOORD0_;
    let _e141 = u_xlat0_;
    let _e142 = _e141.xy;
    vs_TEXCOORD0_.x = _e142.x;
    vs_TEXCOORD0_.y = _e142.y;
    let _e151 = _v_buffer1_.v_cb1_[27];
    u_xlat0_.x = abs(_e151.w);
    let _e158 = _v_buffer1_.v_cb1_[28];
    u_xlat0_.y = abs(_e158.w);
    let _e165 = _v_buffer1_.v_cb1_[29];
    u_xlat0_.z = abs(_e165.w);
    let _e168 = u_xlat0_;
    let _e170 = u_xlat0_;
    let _e172 = log2(_e170.xyz);
    u_xlat0_.x = _e172.x;
    u_xlat0_.y = _e172.y;
    u_xlat0_.z = _e172.z;
    let _e179 = u_xlat0_;
    let _e181 = u_xlat0_;
    let _e187 = (_e181.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat0_.x = _e187.x;
    u_xlat0_.y = _e187.y;
    u_xlat0_.z = _e187.z;
    let _e194 = u_xlat0_;
    let _e196 = u_xlat0_;
    let _e198 = exp2(_e196.xyz);
    u_xlat0_.x = _e198.x;
    u_xlat0_.y = _e198.y;
    u_xlat0_.z = _e198.z;
    let _e205 = u_xlat0_;
    let _e207 = u_xlat0_;
    let _e221 = ((_e207.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat0_.x = _e221.x;
    u_xlat0_.y = _e221.y;
    u_xlat0_.z = _e221.z;
    let _e228 = u_xlat0_;
    let _e230 = u_xlat0_;
    let _e236 = clamp(_e230.xyz, vec3(0f), vec3(1f));
    u_xlat0_.x = _e236.x;
    u_xlat0_.y = _e236.y;
    u_xlat0_.z = _e236.z;
    let _e243 = u_xlat0_;
    let _e245 = u_xlat0_;
    let _e250 = _v_buffer0_.v_cb0_[6];
    let _e252 = (_e245.xyz + _e250.xyz);
    u_xlat0_.x = _e252.x;
    u_xlat0_.y = _e252.y;
    u_xlat0_.z = _e252.z;
    let _e259 = u_xlat0_;
    let _e261 = u_xlat0_;
    let _e270 = (_e261.xyz + vec3<f32>(-1f, -1f, -1f));
    u_xlat0_.x = _e270.x;
    u_xlat0_.y = _e270.y;
    u_xlat0_.z = _e270.z;
    u_xlat0_.w = 0f;
    let _e282 = _v_buffer2_.v_cb2_[2];
    let _e284 = u_xlat0_;
    u_xlat0_ = ((_e282.zzzz * _e284) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e292 = in_COLOR0_1;
    let _e296 = _v_buffer2_.v_cb2_[2];
    u_xlat1_ = (_e292 * _e296.xxxx);
    let _e299 = u_xlat1_;
    let _e300 = u_xlat1_;
    u_xlat1_ = (_e299 + _e300);
    let _e302 = u_xlat0_;
    let _e303 = u_xlat1_;
    u_xlat0_ = (_e302 * _e303);
    let _e305 = u_xlat0_;
    let _e309 = _v_buffer2_.v_cb2_[2];
    vs_COLOR0_ = (_e305 * _e309.yyyy);
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
