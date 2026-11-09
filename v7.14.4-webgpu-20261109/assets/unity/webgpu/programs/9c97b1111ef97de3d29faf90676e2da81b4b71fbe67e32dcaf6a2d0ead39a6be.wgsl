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
    v_cb3_: vec4<f32>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec2<f32>,
    @location(1) vs_TEXCOORD1_: vec3<f32>,
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
var<private> in_NORMAL0_1: vec3<f32>;
var<private> vs_TEXCOORD0_: vec2<f32>;
var<private> vs_TEXCOORD1_: vec3<f32>;
var<private> vs_TEXCOORDindex3_: vec4<f32>;
var<private> vs_NORMAL0_: vec3<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat6_: f32 = 0f;

    let _e30 = u_xlat0_;
    let _e32 = in_POSITION0_1;
    let _e37 = _v_buffer1_.v_cb1_[1];
    let _e39 = (_e32.yyy * _e37.xyz);
    u_xlat0_.x = _e39.x;
    u_xlat0_.y = _e39.y;
    u_xlat0_.z = _e39.z;
    let _e46 = u_xlat0_;
    let _e51 = _v_buffer1_.v_cb1_[0];
    let _e53 = in_POSITION0_1;
    let _e56 = u_xlat0_;
    let _e58 = ((_e51.xyz * _e53.xxx) + _e56.xyz);
    u_xlat0_.x = _e58.x;
    u_xlat0_.y = _e58.y;
    u_xlat0_.z = _e58.z;
    let _e65 = u_xlat0_;
    let _e70 = _v_buffer1_.v_cb1_[2];
    let _e72 = in_POSITION0_1;
    let _e75 = u_xlat0_;
    let _e77 = ((_e70.xyz * _e72.zzz) + _e75.xyz);
    u_xlat0_.x = _e77.x;
    u_xlat0_.y = _e77.y;
    u_xlat0_.z = _e77.z;
    let _e84 = u_xlat0_;
    let _e86 = u_xlat0_;
    let _e91 = _v_buffer1_.v_cb1_[3];
    let _e93 = (_e86.xyz + _e91.xyz);
    u_xlat0_.x = _e93.x;
    u_xlat0_.y = _e93.y;
    u_xlat0_.z = _e93.z;
    let _e100 = u_xlat0_;
    let _e105 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e100.yyyy * _e105);
    let _e110 = _v_buffer0_.v_cb0_[79];
    let _e111 = u_xlat0_;
    let _e114 = u_xlat1_;
    u_xlat1_ = ((_e110 * _e111.xxxx) + _e114);
    let _e119 = _v_buffer0_.v_cb0_[81];
    let _e120 = u_xlat0_;
    let _e123 = u_xlat1_;
    u_xlat1_ = ((_e119 * _e120.zzzz) + _e123);
    let _e126 = u_xlat1_;
    let _e130 = _v_buffer0_.v_cb0_[82];
    gl_Position = (_e126 + _e130);
    let _e132 = vs_TEXCOORD0_;
    let _e134 = in_TEXCOORD0_1;
    let _e136 = _v_buffer3_;
    let _e140 = _v_buffer3_;
    let _e143 = ((_e134.xy * _e136.v_cb3_.xy) + _e140.v_cb3_.zw);
    vs_TEXCOORD0_.x = _e143.x;
    vs_TEXCOORD0_.y = _e143.y;
    let _e148 = vs_TEXCOORD1_;
    let _e150 = u_xlat0_;
    let _e151 = _e150.xyz;
    vs_TEXCOORD1_.x = _e151.x;
    vs_TEXCOORD1_.y = _e151.y;
    vs_TEXCOORD1_.z = _e151.z;
    let _e158 = u_xlat1_;
    let _e160 = u_xlat0_;
    let _e165 = _v_buffer2_.v_cb2_[1];
    let _e167 = (_e160.yyy * _e165.xyz);
    u_xlat1_.x = _e167.x;
    u_xlat1_.y = _e167.y;
    u_xlat1_.z = _e167.z;
    let _e174 = u_xlat0_;
    let _e179 = _v_buffer2_.v_cb2_[0];
    let _e181 = u_xlat0_;
    let _e184 = u_xlat1_;
    let _e186 = ((_e179.xyz * _e181.xxx) + _e184.xyz);
    u_xlat0_.x = _e186.x;
    u_xlat0_.y = _e186.y;
    u_xlat0_.w = _e186.z;
    let _e193 = u_xlat0_;
    let _e198 = _v_buffer2_.v_cb2_[2];
    let _e200 = u_xlat0_;
    let _e203 = u_xlat0_;
    let _e205 = ((_e198.xyz * _e200.zzz) + _e203.xyw);
    u_xlat0_.x = _e205.x;
    u_xlat0_.y = _e205.y;
    u_xlat0_.z = _e205.z;
    let _e212 = vs_TEXCOORDindex3_;
    let _e214 = u_xlat0_;
    let _e219 = _v_buffer2_.v_cb2_[3];
    let _e221 = (_e214.xyz + _e219.xyz);
    vs_TEXCOORDindex3_.x = _e221.x;
    vs_TEXCOORDindex3_.y = _e221.y;
    vs_TEXCOORDindex3_.z = _e221.z;
    vs_TEXCOORDindex3_.w = 0f;
    let _e231 = in_NORMAL0_1;
    let _e236 = _v_buffer1_.v_cb1_[4];
    u_xlat0_.x = dot(_e231.xyz, _e236.xyz);
    let _e240 = in_NORMAL0_1;
    let _e245 = _v_buffer1_.v_cb1_[5];
    u_xlat0_.y = dot(_e240.xyz, _e245.xyz);
    let _e249 = in_NORMAL0_1;
    let _e254 = _v_buffer1_.v_cb1_[6];
    u_xlat0_.z = dot(_e249.xyz, _e254.xyz);
    let _e257 = u_xlat0_;
    let _e259 = u_xlat0_;
    u_xlat6_ = dot(_e257.xyz, _e259.xyz);
    let _e262 = u_xlat6_;
    u_xlat6_ = max(_e262, 0.000000000000000000000000000000000000011754944f);
    let _e265 = u_xlat6_;
    u_xlat6_ = inverseSqrt(_e265);
    let _e267 = vs_NORMAL0_;
    let _e269 = u_xlat6_;
    let _e271 = u_xlat0_;
    let _e273 = (vec3(_e269) * _e271.xyz);
    vs_NORMAL0_.x = _e273.x;
    vs_NORMAL0_.y = _e273.y;
    vs_NORMAL0_.z = _e273.z;
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(1) in_NORMAL0_: vec3<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_NORMAL0_1 = in_NORMAL0_;
    main_1();
    let _e33 = vs_TEXCOORD0_;
    let _e35 = vs_TEXCOORD1_;
    let _e37 = vs_TEXCOORDindex3_;
    let _e39 = vs_NORMAL0_;
    let _e41 = gl_Position;
    return VertexOutput(_e33, _e35, _e37, _e39, _e41);
}
