struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 7>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 4>,
}

struct v_buffer3_ {
    v_cb3_: array<vec4<f32>, 4>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec4<f32>,
    @location(1) vs_TEXCOORD1_: vec2<f32>,
    @location(2) vs_TEXCOORD2_: vec3<f32>,
    @location(3) vs_TEXCOORDindex3_: vec4<f32>,
    @location(10) vs_COLOR0_: vec4<f32>,
    @location(12) vs_NORMAL0_: vec3<f32>,
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
var<private> in_COLOR0_1: vec4<f32>;
var<private> in_NORMAL0_1: vec3<f32>;
var<private> vs_TEXCOORD0_: vec4<f32>;
var<private> vs_TEXCOORD1_: vec2<f32>;
var<private> vs_TEXCOORD2_: vec3<f32>;
var<private> vs_TEXCOORDindex3_: vec4<f32>;
var<private> vs_COLOR0_: vec4<f32>;
var<private> vs_NORMAL0_: vec3<f32>;
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
    let _e100 = u_xlat1_;
    let _e105 = _v_buffer0_.v_cb0_[15];
    let _e110 = _v_buffer3_.v_cb3_[2];
    let _e113 = in_TEXCOORD0_1;
    let _e115 = ((_e105.xx * _e110.yz) + _e113.xy);
    u_xlat1_.x = _e115.x;
    u_xlat1_.y = _e115.y;
    let _e120 = vs_TEXCOORD0_;
    let _e122 = u_xlat1_;
    let _e127 = _v_buffer3_.v_cb3_[2];
    let _e129 = (_e122.xy * _e127.xx);
    vs_TEXCOORD0_.x = _e129.x;
    vs_TEXCOORD0_.y = _e129.y;
    let _e134 = u_xlat1_;
    let _e139 = _v_buffer0_.v_cb0_[15];
    let _e144 = _v_buffer3_.v_cb3_[3];
    let _e147 = in_TEXCOORD0_1;
    let _e149 = ((_e139.xx * _e144.xy) + _e147.xy);
    u_xlat1_.x = _e149.x;
    u_xlat1_.y = _e149.y;
    let _e154 = vs_TEXCOORD0_;
    let _e156 = u_xlat1_;
    let _e161 = _v_buffer3_.v_cb3_[2];
    let _e163 = (_e156.xy * _e161.ww);
    vs_TEXCOORD0_.z = _e163.x;
    vs_TEXCOORD0_.w = _e163.y;
    let _e168 = vs_TEXCOORD1_;
    let _e170 = in_TEXCOORD1_1;
    let _e175 = _v_buffer3_.v_cb3_[0];
    let _e181 = _v_buffer3_.v_cb3_[0];
    let _e183 = ((_e170.xy * _e175.xy) + _e181.zw);
    vs_TEXCOORD1_.x = _e183.x;
    vs_TEXCOORD1_.y = _e183.y;
    let _e188 = vs_TEXCOORD2_;
    let _e190 = u_xlat0_;
    let _e191 = _e190.xyz;
    vs_TEXCOORD2_.x = _e191.x;
    vs_TEXCOORD2_.y = _e191.y;
    vs_TEXCOORD2_.z = _e191.z;
    let _e198 = u_xlat1_;
    let _e200 = u_xlat0_;
    let _e205 = _v_buffer2_.v_cb2_[1];
    let _e207 = (_e200.yyy * _e205.xyz);
    u_xlat1_.x = _e207.x;
    u_xlat1_.y = _e207.y;
    u_xlat1_.z = _e207.z;
    let _e214 = u_xlat0_;
    let _e219 = _v_buffer2_.v_cb2_[0];
    let _e221 = u_xlat0_;
    let _e224 = u_xlat1_;
    let _e226 = ((_e219.xyz * _e221.xxx) + _e224.xyz);
    u_xlat0_.x = _e226.x;
    u_xlat0_.y = _e226.y;
    u_xlat0_.w = _e226.z;
    let _e233 = u_xlat0_;
    let _e238 = _v_buffer2_.v_cb2_[2];
    let _e240 = u_xlat0_;
    let _e243 = u_xlat0_;
    let _e245 = ((_e238.xyz * _e240.zzz) + _e243.xyw);
    u_xlat0_.x = _e245.x;
    u_xlat0_.y = _e245.y;
    u_xlat0_.z = _e245.z;
    let _e252 = vs_TEXCOORDindex3_;
    let _e254 = u_xlat0_;
    let _e259 = _v_buffer2_.v_cb2_[3];
    let _e261 = (_e254.xyz + _e259.xyz);
    vs_TEXCOORDindex3_.x = _e261.x;
    vs_TEXCOORDindex3_.y = _e261.y;
    vs_TEXCOORDindex3_.z = _e261.z;
    vs_TEXCOORDindex3_.w = 0f;
    let _e270 = in_COLOR0_1;
    let _e274 = _v_buffer3_.v_cb3_[1];
    vs_COLOR0_ = (_e270 * _e274.wwww);
    let _e278 = in_NORMAL0_1;
    let _e283 = _v_buffer1_.v_cb1_[4];
    u_xlat0_.x = dot(_e278.xyz, _e283.xyz);
    let _e287 = in_NORMAL0_1;
    let _e292 = _v_buffer1_.v_cb1_[5];
    u_xlat0_.y = dot(_e287.xyz, _e292.xyz);
    let _e296 = in_NORMAL0_1;
    let _e301 = _v_buffer1_.v_cb1_[6];
    u_xlat0_.z = dot(_e296.xyz, _e301.xyz);
    let _e304 = u_xlat0_;
    let _e306 = u_xlat0_;
    u_xlat6_ = dot(_e304.xyz, _e306.xyz);
    let _e309 = u_xlat6_;
    u_xlat6_ = max(_e309, 0.000000000000000000000000000000000000011754944f);
    let _e312 = u_xlat6_;
    u_xlat6_ = inverseSqrt(_e312);
    let _e314 = vs_NORMAL0_;
    let _e316 = u_xlat6_;
    let _e318 = u_xlat0_;
    let _e320 = (vec3(_e316) * _e318.xyz);
    vs_NORMAL0_.x = _e320.x;
    vs_NORMAL0_.y = _e320.y;
    vs_NORMAL0_.z = _e320.z;
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(5) in_TEXCOORD1_: vec2<f32>, @location(3) in_COLOR0_: vec4<f32>, @location(1) in_NORMAL0_: vec3<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_TEXCOORD1_1 = in_TEXCOORD1_;
    in_COLOR0_1 = in_COLOR0_;
    in_NORMAL0_1 = in_NORMAL0_;
    main_1();
    let _e45 = vs_TEXCOORD0_;
    let _e47 = vs_TEXCOORD1_;
    let _e49 = vs_TEXCOORD2_;
    let _e51 = vs_TEXCOORDindex3_;
    let _e53 = vs_COLOR0_;
    let _e55 = vs_NORMAL0_;
    let _e57 = gl_Position;
    return VertexOutput(_e45, _e47, _e49, _e51, _e53, _e55, _e57);
}
