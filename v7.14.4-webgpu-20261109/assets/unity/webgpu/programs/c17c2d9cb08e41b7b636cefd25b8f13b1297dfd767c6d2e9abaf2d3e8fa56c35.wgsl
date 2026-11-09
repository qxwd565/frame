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
    var u_xlat0_: vec3<f32> = vec3(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat9_: f32 = 0f;

    let _e36 = u_xlat0_;
    let _e41 = _v_buffer0_.v_cb0_[15];
    let _e46 = _v_buffer2_.v_cb2_[1];
    let _e48 = (_e41.yy * _e46.yz);
    u_xlat0_.x = _e48.x;
    u_xlat0_.y = _e48.y;
    let _e53 = u_xlat0_;
    let _e55 = u_xlat0_;
    let _e57 = sin(_e55.xy);
    u_xlat0_.x = _e57.x;
    u_xlat0_.y = _e57.y;
    let _e62 = u_xlat0_;
    let _e64 = u_xlat0_;
    let _e69 = _v_buffer2_.v_cb2_[1];
    let _e71 = (_e64.xy * _e69.xx);
    u_xlat0_.x = _e71.x;
    u_xlat0_.y = _e71.y;
    let _e76 = u_xlat3_;
    let _e78 = u_xlat0_;
    let _e80 = in_TEXCOORD2_1;
    let _e82 = (_e78.yy * _e80.xy);
    u_xlat3_.x = _e82.x;
    u_xlat3_.y = _e82.y;
    let _e87 = u_xlat0_;
    let _e89 = in_TEXCOORD1_1;
    let _e91 = u_xlat0_;
    let _e94 = u_xlat3_;
    let _e96 = ((_e89.xy * _e91.xx) + _e94.xy);
    u_xlat0_.x = _e96.x;
    u_xlat0_.y = _e96.y;
    let _e101 = u_xlat0_;
    let _e103 = u_xlat0_;
    let _e105 = in_POSITION0_1;
    let _e107 = (_e103.xy + _e105.xy);
    u_xlat0_.x = _e107.x;
    u_xlat0_.y = _e107.y;
    let _e112 = u_xlat0_;
    let _e117 = _v_buffer1_.v_cb1_[1];
    u_xlat1_ = (_e112.yyyy * _e117);
    let _e122 = _v_buffer1_.v_cb1_[0];
    let _e123 = u_xlat0_;
    let _e126 = u_xlat1_;
    u_xlat1_ = ((_e122 * _e123.xxxx) + _e126);
    let _e131 = _v_buffer1_.v_cb1_[2];
    let _e132 = in_POSITION0_1;
    let _e135 = u_xlat1_;
    u_xlat1_ = ((_e131 * _e132.zzzz) + _e135);
    let _e137 = u_xlat1_;
    let _e141 = _v_buffer1_.v_cb1_[3];
    u_xlat1_ = (_e137 + _e141);
    let _e143 = u_xlat1_;
    let _e148 = _v_buffer0_.v_cb0_[80];
    u_xlat2_ = (_e143.yyyy * _e148);
    let _e153 = _v_buffer0_.v_cb0_[79];
    let _e154 = u_xlat1_;
    let _e157 = u_xlat2_;
    u_xlat2_ = ((_e153 * _e154.xxxx) + _e157);
    let _e162 = _v_buffer0_.v_cb0_[81];
    let _e163 = u_xlat1_;
    let _e166 = u_xlat2_;
    u_xlat2_ = ((_e162 * _e163.zzzz) + _e166);
    let _e172 = _v_buffer0_.v_cb0_[82];
    let _e173 = u_xlat1_;
    let _e176 = u_xlat2_;
    gl_Position = ((_e172 * _e173.wwww) + _e176);
    let _e178 = vs_TEXCOORD0_;
    let _e180 = in_TEXCOORD0_1;
    let _e185 = _v_buffer2_.v_cb2_[0];
    let _e191 = _v_buffer2_.v_cb2_[0];
    let _e193 = ((_e180.xy * _e185.xy) + _e191.zw);
    vs_TEXCOORD0_.x = _e193.x;
    vs_TEXCOORD0_.y = _e193.y;
    let _e198 = u_xlat3_;
    let _e200 = u_xlat0_;
    let _e205 = _v_buffer1_.v_cb1_[1];
    let _e207 = (_e200.yyy * _e205.xyz);
    u_xlat3_.x = _e207.x;
    u_xlat3_.y = _e207.y;
    u_xlat3_.z = _e207.z;
    let _e214 = u_xlat0_;
    let _e219 = _v_buffer1_.v_cb1_[0];
    let _e221 = u_xlat0_;
    let _e224 = u_xlat3_;
    let _e226 = ((_e219.xyz * _e221.xxx) + _e224.xyz);
    u_xlat0_.x = _e226.x;
    u_xlat0_.y = _e226.y;
    u_xlat0_.z = _e226.z;
    let _e233 = u_xlat0_;
    let _e238 = _v_buffer1_.v_cb1_[2];
    let _e240 = in_POSITION0_1;
    let _e243 = u_xlat0_;
    let _e245 = ((_e238.xyz * _e240.zzz) + _e243.xyz);
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
