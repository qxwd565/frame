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
    @location(5) vs_TEXCOORD5_: vec2<f32>,
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
var<private> in_POSITION0_1: vec4<f32>;
var<private> in_TEXCOORD0_1: vec2<f32>;
var<private> in_NORMAL0_1: vec3<f32>;
var<private> in_COLOR0_1: vec4<f32>;
var<private> vs_TEXCOORD0_: vec2<f32>;
var<private> vs_TEXCOORD5_: vec2<f32>;
var<private> vs_NORMAL0_: vec3<f32>;
var<private> vs_COLOR0_: vec4<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec3<f32> = vec3(0f);
    var u_xlat6_: f32 = 0f;

    let _e32 = in_POSITION0_1;
    let _e37 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e32.yyyy * _e37);
    let _e42 = _v_buffer1_.v_cb1_[0];
    let _e43 = in_POSITION0_1;
    let _e46 = u_xlat0_;
    u_xlat0_ = ((_e42 * _e43.xxxx) + _e46);
    let _e51 = _v_buffer1_.v_cb1_[2];
    let _e52 = in_POSITION0_1;
    let _e55 = u_xlat0_;
    u_xlat0_ = ((_e51 * _e52.zzzz) + _e55);
    let _e57 = u_xlat0_;
    let _e61 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e57 + _e61);
    let _e63 = u_xlat0_;
    let _e68 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e63.yyyy * _e68);
    let _e73 = _v_buffer0_.v_cb0_[79];
    let _e74 = u_xlat0_;
    let _e77 = u_xlat1_;
    u_xlat1_ = ((_e73 * _e74.xxxx) + _e77);
    let _e82 = _v_buffer0_.v_cb0_[81];
    let _e83 = u_xlat0_;
    let _e86 = u_xlat1_;
    u_xlat1_ = ((_e82 * _e83.zzzz) + _e86);
    let _e92 = _v_buffer0_.v_cb0_[82];
    let _e93 = u_xlat0_;
    let _e96 = u_xlat1_;
    gl_Position = ((_e92 * _e93.wwww) + _e96);
    let _e99 = in_NORMAL0_1;
    let _e104 = _v_buffer1_.v_cb1_[4];
    u_xlat0_.x = dot(_e99.xyz, _e104.xyz);
    let _e108 = in_NORMAL0_1;
    let _e113 = _v_buffer1_.v_cb1_[5];
    u_xlat0_.y = dot(_e108.xyz, _e113.xyz);
    let _e117 = in_NORMAL0_1;
    let _e122 = _v_buffer1_.v_cb1_[6];
    u_xlat0_.z = dot(_e117.xyz, _e122.xyz);
    let _e125 = u_xlat0_;
    let _e127 = u_xlat0_;
    u_xlat6_ = dot(_e125.xyz, _e127.xyz);
    let _e131 = u_xlat6_;
    u_xlat1_.x = inverseSqrt(_e131);
    let _e133 = u_xlat6_;
    u_xlat6_ = max(_e133, 0.000000000000000000000000000000000000011754944f);
    let _e136 = u_xlat6_;
    u_xlat6_ = inverseSqrt(_e136);
    let _e138 = vs_NORMAL0_;
    let _e140 = u_xlat6_;
    let _e142 = u_xlat0_;
    let _e144 = (vec3(_e140) * _e142.xyz);
    vs_NORMAL0_.x = _e144.x;
    vs_NORMAL0_.y = _e144.y;
    vs_NORMAL0_.z = _e144.z;
    let _e151 = u_xlat0_;
    let _e153 = u_xlat0_;
    let _e155 = u_xlat1_;
    let _e157 = (_e153.xyz * _e155.xxx);
    u_xlat0_.x = _e157.x;
    u_xlat0_.y = _e157.y;
    u_xlat0_.z = _e157.z;
    let _e164 = u_xlat2_;
    let _e166 = u_xlat0_;
    let _e171 = _v_buffer0_.v_cb0_[68];
    let _e173 = (_e166.yy * _e171.xy);
    u_xlat2_.x = _e173.x;
    u_xlat2_.z = _e173.y;
    let _e178 = u_xlat0_;
    let _e183 = _v_buffer0_.v_cb0_[67];
    let _e185 = u_xlat0_;
    let _e188 = u_xlat2_;
    let _e190 = ((_e183.xy * _e185.xx) + _e188.xz);
    u_xlat0_.x = _e190.x;
    u_xlat0_.y = _e190.y;
    let _e195 = u_xlat0_;
    let _e200 = _v_buffer0_.v_cb0_[69];
    let _e202 = u_xlat0_;
    let _e205 = u_xlat0_;
    let _e207 = ((_e200.xy * _e202.zz) + _e205.xy);
    u_xlat0_.x = _e207.x;
    u_xlat0_.y = _e207.y;
    let _e212 = vs_TEXCOORD5_;
    let _e214 = u_xlat0_;
    let _e223 = ((_e214.xy * vec2<f32>(0.499f, 0.499f)) + vec2<f32>(0.5f, 0.5f));
    vs_TEXCOORD5_.x = _e223.x;
    vs_TEXCOORD5_.y = _e223.y;
    let _e228 = vs_TEXCOORD0_;
    let _e230 = in_TEXCOORD0_1;
    let _e235 = _v_buffer2_.v_cb2_[0];
    let _e241 = _v_buffer2_.v_cb2_[0];
    let _e243 = ((_e230.xy * _e235.xy) + _e241.zw);
    vs_TEXCOORD0_.x = _e243.x;
    vs_TEXCOORD0_.y = _e243.y;
    let _e252 = _v_buffer1_.v_cb1_[27];
    u_xlat0_.x = abs(_e252.w);
    let _e259 = _v_buffer1_.v_cb1_[28];
    u_xlat0_.y = abs(_e259.w);
    let _e266 = _v_buffer1_.v_cb1_[29];
    u_xlat0_.z = abs(_e266.w);
    let _e269 = u_xlat0_;
    let _e271 = u_xlat0_;
    let _e273 = log2(_e271.xyz);
    u_xlat0_.x = _e273.x;
    u_xlat0_.y = _e273.y;
    u_xlat0_.z = _e273.z;
    let _e280 = u_xlat0_;
    let _e282 = u_xlat0_;
    let _e288 = (_e282.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat0_.x = _e288.x;
    u_xlat0_.y = _e288.y;
    u_xlat0_.z = _e288.z;
    let _e295 = u_xlat0_;
    let _e297 = u_xlat0_;
    let _e299 = exp2(_e297.xyz);
    u_xlat0_.x = _e299.x;
    u_xlat0_.y = _e299.y;
    u_xlat0_.z = _e299.z;
    let _e306 = u_xlat0_;
    let _e308 = u_xlat0_;
    let _e322 = ((_e308.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat0_.x = _e322.x;
    u_xlat0_.y = _e322.y;
    u_xlat0_.z = _e322.z;
    let _e329 = u_xlat0_;
    let _e331 = u_xlat0_;
    let _e337 = clamp(_e331.xyz, vec3(0f), vec3(1f));
    u_xlat0_.x = _e337.x;
    u_xlat0_.y = _e337.y;
    u_xlat0_.z = _e337.z;
    let _e344 = u_xlat0_;
    let _e346 = u_xlat0_;
    let _e351 = _v_buffer0_.v_cb0_[6];
    let _e353 = (_e346.xyz + _e351.xyz);
    u_xlat0_.x = _e353.x;
    u_xlat0_.y = _e353.y;
    u_xlat0_.z = _e353.z;
    u_xlat0_.w = 1f;
    let _e362 = u_xlat0_;
    let _e363 = in_COLOR0_1;
    u_xlat0_ = (_e362 + -(_e363));
    let _e369 = _v_buffer2_.v_cb2_[3];
    let _e371 = u_xlat0_;
    let _e373 = in_COLOR0_1;
    vs_COLOR0_ = ((_e369.zzzz * _e371) + _e373);
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(1) in_NORMAL0_: vec3<f32>, @location(3) in_COLOR0_: vec4<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_NORMAL0_1 = in_NORMAL0_;
    in_COLOR0_1 = in_COLOR0_;
    main_1();
    let _e34 = vs_TEXCOORD0_;
    let _e36 = vs_TEXCOORD5_;
    let _e38 = vs_NORMAL0_;
    let _e40 = vs_COLOR0_;
    let _e42 = gl_Position;
    return VertexOutput(_e34, _e36, _e38, _e40, _e42);
}
