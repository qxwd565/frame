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
    @location(0) vs_TEXCOORD0_: vec2<f32>,
    @location(1) vs_TEXCOORD1_: vec2<f32>,
    @location(2) vs_TEXCOORD2_: vec3<f32>,
    @location(3) vs_TEXCOORDindex3_: vec4<f32>,
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
var<private> in_NORMAL0_1: vec3<f32>;
var<private> vs_TEXCOORD0_: vec2<f32>;
var<private> vs_TEXCOORD1_: vec2<f32>;
var<private> vs_TEXCOORD2_: vec3<f32>;
var<private> vs_TEXCOORDindex3_: vec4<f32>;
var<private> vs_NORMAL0_: vec3<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
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
    let _e98 = u_xlat1_;
    let _e100 = in_TEXCOORD0_1;
    let _e105 = _v_buffer3_.v_cb3_[3];
    let _e107 = (_e100.xy + _e105.xy);
    u_xlat1_.x = _e107.x;
    u_xlat1_.y = _e107.y;
    let _e112 = vs_TEXCOORD0_;
    let _e114 = u_xlat1_;
    let _e119 = _v_buffer3_.v_cb3_[0];
    let _e125 = _v_buffer3_.v_cb3_[0];
    let _e127 = ((_e114.xy * _e119.xy) + _e125.zw);
    vs_TEXCOORD0_.x = _e127.x;
    vs_TEXCOORD0_.y = _e127.y;
    let _e132 = u_xlat1_;
    let _e134 = in_TEXCOORD1_1;
    let _e139 = _v_buffer3_.v_cb3_[3];
    let _e141 = (_e134.xy + _e139.zw);
    u_xlat1_.x = _e141.x;
    u_xlat1_.y = _e141.y;
    let _e146 = vs_TEXCOORD1_;
    let _e148 = u_xlat1_;
    let _e153 = _v_buffer3_.v_cb3_[1];
    let _e159 = _v_buffer3_.v_cb3_[1];
    let _e161 = ((_e148.xy * _e153.xy) + _e159.zw);
    vs_TEXCOORD1_.x = _e161.x;
    vs_TEXCOORD1_.y = _e161.y;
    let _e166 = vs_TEXCOORD2_;
    let _e168 = u_xlat0_;
    let _e169 = _e168.xyz;
    vs_TEXCOORD2_.x = _e169.x;
    vs_TEXCOORD2_.y = _e169.y;
    vs_TEXCOORD2_.z = _e169.z;
    let _e176 = u_xlat1_;
    let _e178 = u_xlat0_;
    let _e183 = _v_buffer2_.v_cb2_[1];
    let _e185 = (_e178.yyy * _e183.xyz);
    u_xlat1_.x = _e185.x;
    u_xlat1_.y = _e185.y;
    u_xlat1_.z = _e185.z;
    let _e192 = u_xlat0_;
    let _e197 = _v_buffer2_.v_cb2_[0];
    let _e199 = u_xlat0_;
    let _e202 = u_xlat1_;
    let _e204 = ((_e197.xyz * _e199.xxx) + _e202.xyz);
    u_xlat0_.x = _e204.x;
    u_xlat0_.y = _e204.y;
    u_xlat0_.w = _e204.z;
    let _e211 = u_xlat0_;
    let _e216 = _v_buffer2_.v_cb2_[2];
    let _e218 = u_xlat0_;
    let _e221 = u_xlat0_;
    let _e223 = ((_e216.xyz * _e218.zzz) + _e221.xyw);
    u_xlat0_.x = _e223.x;
    u_xlat0_.y = _e223.y;
    u_xlat0_.z = _e223.z;
    let _e230 = vs_TEXCOORDindex3_;
    let _e232 = u_xlat0_;
    let _e237 = _v_buffer2_.v_cb2_[3];
    let _e239 = (_e232.xyz + _e237.xyz);
    vs_TEXCOORDindex3_.x = _e239.x;
    vs_TEXCOORDindex3_.y = _e239.y;
    vs_TEXCOORDindex3_.z = _e239.z;
    vs_TEXCOORDindex3_.w = 0f;
    let _e249 = in_NORMAL0_1;
    let _e254 = _v_buffer1_.v_cb1_[4];
    u_xlat0_.x = dot(_e249.xyz, _e254.xyz);
    let _e258 = in_NORMAL0_1;
    let _e263 = _v_buffer1_.v_cb1_[5];
    u_xlat0_.y = dot(_e258.xyz, _e263.xyz);
    let _e267 = in_NORMAL0_1;
    let _e272 = _v_buffer1_.v_cb1_[6];
    u_xlat0_.z = dot(_e267.xyz, _e272.xyz);
    let _e275 = u_xlat0_;
    let _e277 = u_xlat0_;
    u_xlat6_ = dot(_e275.xyz, _e277.xyz);
    let _e280 = u_xlat6_;
    u_xlat6_ = max(_e280, 0.000000000000000000000000000000000000011754944f);
    let _e283 = u_xlat6_;
    u_xlat6_ = inverseSqrt(_e283);
    let _e285 = vs_NORMAL0_;
    let _e287 = u_xlat6_;
    let _e289 = u_xlat0_;
    let _e291 = (vec3(_e287) * _e289.xyz);
    vs_NORMAL0_.x = _e291.x;
    vs_NORMAL0_.y = _e291.y;
    vs_NORMAL0_.z = _e291.z;
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(5) in_TEXCOORD1_: vec2<f32>, @location(1) in_NORMAL0_: vec3<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_TEXCOORD1_1 = in_TEXCOORD1_;
    in_NORMAL0_1 = in_NORMAL0_;
    main_1();
    let _e39 = vs_TEXCOORD0_;
    let _e41 = vs_TEXCOORD1_;
    let _e43 = vs_TEXCOORD2_;
    let _e45 = vs_TEXCOORDindex3_;
    let _e47 = vs_NORMAL0_;
    let _e49 = gl_Position;
    return VertexOutput(_e39, _e41, _e43, _e45, _e47, _e49);
}
