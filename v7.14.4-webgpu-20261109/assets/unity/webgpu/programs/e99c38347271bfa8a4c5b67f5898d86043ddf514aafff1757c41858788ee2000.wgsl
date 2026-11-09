struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 30>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 5>,
}

struct VertexOutput {
    @location(12) vs_NORMAL0_: vec3<f32>,
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
var<private> in_NORMAL0_1: vec3<f32>;
var<private> in_TEXCOORD0_1: vec2<f32>;
var<private> in_TEXCOORD1_1: vec4<f32>;
var<private> vs_NORMAL0_: vec3<f32>;
var<private> vs_TEXCOORD0_: vec2<f32>;
var<private> vs_TEXCOORD1_: vec4<f32>;
var<private> vs_COLOR0_: vec4<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat6_: f32 = 0f;

    let _e28 = in_POSITION0_1;
    let _e33 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e28.yyyy * _e33);
    let _e38 = _v_buffer1_.v_cb1_[0];
    let _e39 = in_POSITION0_1;
    let _e42 = u_xlat0_;
    u_xlat0_ = ((_e38 * _e39.xxxx) + _e42);
    let _e47 = _v_buffer1_.v_cb1_[2];
    let _e48 = in_POSITION0_1;
    let _e51 = u_xlat0_;
    u_xlat0_ = ((_e47 * _e48.zzzz) + _e51);
    let _e53 = u_xlat0_;
    let _e57 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e53 + _e57);
    let _e59 = u_xlat0_;
    let _e64 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e59.yyyy * _e64);
    let _e69 = _v_buffer0_.v_cb0_[79];
    let _e70 = u_xlat0_;
    let _e73 = u_xlat1_;
    u_xlat1_ = ((_e69 * _e70.xxxx) + _e73);
    let _e78 = _v_buffer0_.v_cb0_[81];
    let _e79 = u_xlat0_;
    let _e82 = u_xlat1_;
    u_xlat1_ = ((_e78 * _e79.zzzz) + _e82);
    let _e88 = _v_buffer0_.v_cb0_[82];
    let _e89 = u_xlat0_;
    let _e92 = u_xlat1_;
    gl_Position = ((_e88 * _e89.wwww) + _e92);
    let _e95 = in_NORMAL0_1;
    let _e100 = _v_buffer1_.v_cb1_[4];
    u_xlat0_.x = dot(_e95.xyz, _e100.xyz);
    let _e104 = in_NORMAL0_1;
    let _e109 = _v_buffer1_.v_cb1_[5];
    u_xlat0_.y = dot(_e104.xyz, _e109.xyz);
    let _e113 = in_NORMAL0_1;
    let _e118 = _v_buffer1_.v_cb1_[6];
    u_xlat0_.z = dot(_e113.xyz, _e118.xyz);
    let _e121 = u_xlat0_;
    let _e123 = u_xlat0_;
    u_xlat6_ = dot(_e121.xyz, _e123.xyz);
    let _e126 = u_xlat6_;
    u_xlat6_ = max(_e126, 0.000000000000000000000000000000000000011754944f);
    let _e129 = u_xlat6_;
    u_xlat6_ = inverseSqrt(_e129);
    let _e131 = vs_NORMAL0_;
    let _e133 = u_xlat6_;
    let _e135 = u_xlat0_;
    let _e137 = (vec3(_e133) * _e135.xyz);
    vs_NORMAL0_.x = _e137.x;
    vs_NORMAL0_.y = _e137.y;
    vs_NORMAL0_.z = _e137.z;
    let _e144 = vs_TEXCOORD0_;
    let _e146 = in_TEXCOORD0_1;
    let _e151 = _v_buffer2_.v_cb2_[2];
    let _e157 = _v_buffer2_.v_cb2_[2];
    let _e159 = ((_e146.xy * _e151.xy) + _e157.zw);
    vs_TEXCOORD0_.x = _e159.x;
    vs_TEXCOORD0_.y = _e159.y;
    let _e164 = u_xlat0_;
    let _e166 = in_TEXCOORD1_1;
    let _e171 = _v_buffer2_.v_cb2_[3];
    let _e177 = _v_buffer2_.v_cb2_[3];
    let _e179 = ((_e166.yxy * _e171.yxy) + _e177.wzw);
    u_xlat0_.x = _e179.x;
    u_xlat0_.y = _e179.y;
    u_xlat0_.z = _e179.z;
    let _e187 = u_xlat0_;
    let _e192 = _v_buffer2_.v_cb2_[1];
    vs_TEXCOORD1_.x = (_e187.y + _e192.y);
    let _e195 = vs_TEXCOORD1_;
    let _e197 = u_xlat0_;
    let _e198 = _e197.xyz;
    vs_TEXCOORD1_.y = _e198.x;
    vs_TEXCOORD1_.z = _e198.y;
    vs_TEXCOORD1_.w = _e198.z;
    let _e209 = _v_buffer1_.v_cb1_[27];
    u_xlat0_.x = abs(_e209.w);
    let _e216 = _v_buffer1_.v_cb1_[28];
    u_xlat0_.y = abs(_e216.w);
    let _e223 = _v_buffer1_.v_cb1_[29];
    u_xlat0_.z = abs(_e223.w);
    let _e226 = u_xlat0_;
    let _e228 = u_xlat0_;
    let _e230 = log2(_e228.xyz);
    u_xlat0_.x = _e230.x;
    u_xlat0_.y = _e230.y;
    u_xlat0_.z = _e230.z;
    let _e237 = u_xlat0_;
    let _e239 = u_xlat0_;
    let _e245 = (_e239.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat0_.x = _e245.x;
    u_xlat0_.y = _e245.y;
    u_xlat0_.z = _e245.z;
    let _e252 = u_xlat0_;
    let _e254 = u_xlat0_;
    let _e256 = exp2(_e254.xyz);
    u_xlat0_.x = _e256.x;
    u_xlat0_.y = _e256.y;
    u_xlat0_.z = _e256.z;
    let _e263 = u_xlat0_;
    let _e265 = u_xlat0_;
    let _e279 = ((_e265.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat0_.x = _e279.x;
    u_xlat0_.y = _e279.y;
    u_xlat0_.z = _e279.z;
    let _e286 = u_xlat0_;
    let _e288 = u_xlat0_;
    let _e294 = clamp(_e288.xyz, vec3(0f), vec3(1f));
    u_xlat0_.x = _e294.x;
    u_xlat0_.y = _e294.y;
    u_xlat0_.z = _e294.z;
    let _e301 = u_xlat0_;
    let _e303 = u_xlat0_;
    let _e308 = _v_buffer0_.v_cb0_[6];
    let _e310 = (_e303.xyz + _e308.xyz);
    u_xlat0_.x = _e310.x;
    u_xlat0_.y = _e310.y;
    u_xlat0_.z = _e310.z;
    let _e317 = u_xlat0_;
    let _e319 = u_xlat0_;
    let _e328 = (_e319.xyz + vec3<f32>(-1f, -1f, -1f));
    u_xlat0_.x = _e328.x;
    u_xlat0_.y = _e328.y;
    u_xlat0_.z = _e328.z;
    u_xlat0_.w = 0f;
    let _e340 = _v_buffer2_.v_cb2_[4];
    let _e342 = u_xlat0_;
    vs_COLOR0_ = ((_e340.xxxx * _e342) + vec4<f32>(1f, 1f, 1f, 1f));
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(1) in_NORMAL0_: vec3<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(5) in_TEXCOORD1_: vec4<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_NORMAL0_1 = in_NORMAL0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_TEXCOORD1_1 = in_TEXCOORD1_;
    main_1();
    let _e34 = vs_NORMAL0_;
    let _e36 = vs_TEXCOORD0_;
    let _e38 = vs_TEXCOORD1_;
    let _e40 = vs_COLOR0_;
    let _e42 = gl_Position;
    return VertexOutput(_e34, _e36, _e38, _e40, _e42);
}
