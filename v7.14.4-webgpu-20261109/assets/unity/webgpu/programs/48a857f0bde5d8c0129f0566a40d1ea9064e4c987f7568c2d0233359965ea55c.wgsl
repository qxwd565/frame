struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 7>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 2>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec2<f32>,
    @location(1) vs_TEXCOORD1_: vec3<f32>,
    @location(12) vs_NORMAL0_: vec3<f32>,
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
var<private> in_TEXCOORD1_1: vec2<f32>;
var<private> in_TEXCOORD2_1: vec2<f32>;
var<private> in_NORMAL0_1: vec3<f32>;
var<private> vs_TEXCOORD0_: vec2<f32>;
var<private> vs_TEXCOORD1_: vec3<f32>;
var<private> vs_NORMAL0_: vec3<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec2<f32> = vec2(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat4_: vec2<f32> = vec2(0f);
    var u_xlat9_: f32 = 0f;

    let _e36 = in_POSITION0_1;
    let _e41 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e36.yyyy * _e41);
    let _e43 = u_xlat1_;
    let _e48 = _v_buffer0_.v_cb0_[15];
    let _e53 = _v_buffer2_.v_cb2_[1];
    let _e55 = (_e48.yy * _e53.yz);
    u_xlat1_.x = _e55.x;
    u_xlat1_.y = _e55.y;
    let _e60 = u_xlat1_;
    let _e62 = u_xlat1_;
    let _e64 = sin(_e62.xy);
    u_xlat1_.x = _e64.x;
    u_xlat1_.y = _e64.y;
    let _e69 = u_xlat1_;
    let _e71 = u_xlat1_;
    let _e76 = _v_buffer2_.v_cb2_[1];
    let _e78 = (_e71.xy * _e76.xx);
    u_xlat1_.x = _e78.x;
    u_xlat1_.y = _e78.y;
    let _e83 = u_xlat4_;
    let _e85 = u_xlat1_;
    let _e87 = in_TEXCOORD2_1;
    let _e89 = (_e85.yy * _e87.xy);
    u_xlat4_.x = _e89.x;
    u_xlat4_.y = _e89.y;
    let _e94 = u_xlat1_;
    let _e96 = in_TEXCOORD1_1;
    let _e98 = u_xlat1_;
    let _e101 = u_xlat4_;
    let _e103 = ((_e96.xy * _e98.xx) + _e101.xy);
    u_xlat1_.x = _e103.x;
    u_xlat1_.y = _e103.y;
    let _e108 = u_xlat1_;
    let _e110 = u_xlat1_;
    let _e112 = in_POSITION0_1;
    let _e114 = (_e110.xy + _e112.xz);
    u_xlat1_.x = _e114.x;
    u_xlat1_.y = _e114.y;
    let _e122 = _v_buffer1_.v_cb1_[0];
    let _e123 = u_xlat1_;
    let _e126 = u_xlat0_;
    u_xlat0_ = ((_e122 * _e123.xxxx) + _e126);
    let _e131 = _v_buffer1_.v_cb1_[2];
    let _e132 = u_xlat1_;
    let _e135 = u_xlat0_;
    u_xlat0_ = ((_e131 * _e132.yyyy) + _e135);
    let _e137 = u_xlat0_;
    let _e141 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e137 + _e141);
    let _e143 = u_xlat0_;
    let _e148 = _v_buffer0_.v_cb0_[80];
    u_xlat2_ = (_e143.yyyy * _e148);
    let _e153 = _v_buffer0_.v_cb0_[79];
    let _e154 = u_xlat0_;
    let _e157 = u_xlat2_;
    u_xlat2_ = ((_e153 * _e154.xxxx) + _e157);
    let _e162 = _v_buffer0_.v_cb0_[81];
    let _e163 = u_xlat0_;
    let _e166 = u_xlat2_;
    u_xlat2_ = ((_e162 * _e163.zzzz) + _e166);
    let _e172 = _v_buffer0_.v_cb0_[82];
    let _e173 = u_xlat0_;
    let _e176 = u_xlat2_;
    gl_Position = ((_e172 * _e173.wwww) + _e176);
    let _e178 = vs_TEXCOORD0_;
    let _e180 = in_TEXCOORD0_1;
    let _e185 = _v_buffer2_.v_cb2_[0];
    let _e191 = _v_buffer2_.v_cb2_[0];
    let _e193 = ((_e180.xy * _e185.xy) + _e191.zw);
    vs_TEXCOORD0_.x = _e193.x;
    vs_TEXCOORD0_.y = _e193.y;
    let _e198 = u_xlat0_;
    let _e200 = in_POSITION0_1;
    let _e205 = _v_buffer1_.v_cb1_[1];
    let _e207 = (_e200.yyy * _e205.xyz);
    u_xlat0_.x = _e207.x;
    u_xlat0_.y = _e207.y;
    u_xlat0_.z = _e207.z;
    let _e214 = u_xlat0_;
    let _e219 = _v_buffer1_.v_cb1_[0];
    let _e221 = u_xlat1_;
    let _e224 = u_xlat0_;
    let _e226 = ((_e219.xyz * _e221.xxx) + _e224.xyz);
    u_xlat0_.x = _e226.x;
    u_xlat0_.y = _e226.y;
    u_xlat0_.z = _e226.z;
    let _e233 = u_xlat0_;
    let _e238 = _v_buffer1_.v_cb1_[2];
    let _e240 = u_xlat1_;
    let _e243 = u_xlat0_;
    let _e245 = ((_e238.xyz * _e240.yyy) + _e243.xyz);
    u_xlat0_.x = _e245.x;
    u_xlat0_.y = _e245.y;
    u_xlat0_.z = _e245.z;
    let _e252 = vs_TEXCOORD1_;
    let _e254 = u_xlat0_;
    let _e259 = _v_buffer1_.v_cb1_[3];
    let _e261 = (_e254.xyz + _e259.xyz);
    vs_TEXCOORD1_.x = _e261.x;
    vs_TEXCOORD1_.y = _e261.y;
    vs_TEXCOORD1_.z = _e261.z;
    let _e269 = in_NORMAL0_1;
    let _e274 = _v_buffer1_.v_cb1_[4];
    u_xlat0_.x = dot(_e269.xyz, _e274.xyz);
    let _e278 = in_NORMAL0_1;
    let _e283 = _v_buffer1_.v_cb1_[5];
    u_xlat0_.y = dot(_e278.xyz, _e283.xyz);
    let _e287 = in_NORMAL0_1;
    let _e292 = _v_buffer1_.v_cb1_[6];
    u_xlat0_.z = dot(_e287.xyz, _e292.xyz);
    let _e295 = u_xlat0_;
    let _e297 = u_xlat0_;
    u_xlat9_ = dot(_e295.xyz, _e297.xyz);
    let _e300 = u_xlat9_;
    u_xlat9_ = max(_e300, 0.000000000000000000000000000000000000011754944f);
    let _e303 = u_xlat9_;
    u_xlat9_ = inverseSqrt(_e303);
    let _e305 = vs_NORMAL0_;
    let _e307 = u_xlat9_;
    let _e309 = u_xlat0_;
    let _e311 = (vec3(_e307) * _e309.xyz);
    vs_NORMAL0_.x = _e311.x;
    vs_NORMAL0_.y = _e311.y;
    vs_NORMAL0_.z = _e311.z;
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(5) in_TEXCOORD1_: vec2<f32>, @location(6) in_TEXCOORD2_: vec2<f32>, @location(1) in_NORMAL0_: vec3<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_TEXCOORD1_1 = in_TEXCOORD1_;
    in_TEXCOORD2_1 = in_TEXCOORD2_;
    in_NORMAL0_1 = in_NORMAL0_;
    main_1();
    let _e36 = vs_TEXCOORD0_;
    let _e38 = vs_TEXCOORD1_;
    let _e40 = vs_NORMAL0_;
    let _e42 = gl_Position;
    return VertexOutput(_e36, _e38, _e40, _e42);
}
