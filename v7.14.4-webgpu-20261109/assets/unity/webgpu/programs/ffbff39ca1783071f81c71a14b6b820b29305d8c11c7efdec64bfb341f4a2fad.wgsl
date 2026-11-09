struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 7>,
}

struct v_buffer2_ {
    v_cb2_: vec4<f32>,
}

struct v_buffer3_ {
    v_cb3_: array<vec4<f32>, 4>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec2<f32>,
    @location(5) vs_TEXCOORD5_: f32,
    @location(1) vs_TEXCOORD1_: vec3<f32>,
    @location(2) vs_TEXCOORD2_: vec3<f32>,
    @location(6) vs_TEXCOORD6_: vec4<f32>,
    @location(7) vs_TEXCOORD7_: vec3<f32>,
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
var<private> in_NORMAL0_1: vec3<f32>;
var<private> in_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD0_: vec2<f32>;
var<private> vs_TEXCOORD5_: f32;
var<private> vs_TEXCOORD1_: vec3<f32>;
var<private> vs_TEXCOORD2_: vec3<f32>;
var<private> vs_TEXCOORD6_: vec4<f32>;
var<private> vs_TEXCOORD7_: vec3<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat6_: f32 = 0f;

    let _e32 = vs_TEXCOORD0_;
    let _e34 = in_TEXCOORD0_1;
    let _e36 = _v_buffer2_;
    let _e40 = _v_buffer2_;
    let _e43 = ((_e34.xy * _e36.v_cb2_.xy) + _e40.v_cb2_.zw);
    vs_TEXCOORD0_.x = _e43.x;
    vs_TEXCOORD0_.y = _e43.y;
    vs_TEXCOORD5_ = 0f;
    let _e49 = u_xlat0_;
    let _e51 = in_POSITION0_1;
    let _e56 = _v_buffer1_.v_cb1_[1];
    let _e58 = (_e51.yyy * _e56.xyz);
    u_xlat0_.x = _e58.x;
    u_xlat0_.y = _e58.y;
    u_xlat0_.z = _e58.z;
    let _e65 = u_xlat0_;
    let _e70 = _v_buffer1_.v_cb1_[0];
    let _e72 = in_POSITION0_1;
    let _e75 = u_xlat0_;
    let _e77 = ((_e70.xyz * _e72.xxx) + _e75.xyz);
    u_xlat0_.x = _e77.x;
    u_xlat0_.y = _e77.y;
    u_xlat0_.z = _e77.z;
    let _e84 = u_xlat0_;
    let _e89 = _v_buffer1_.v_cb1_[2];
    let _e91 = in_POSITION0_1;
    let _e94 = u_xlat0_;
    let _e96 = ((_e89.xyz * _e91.zzz) + _e94.xyz);
    u_xlat0_.x = _e96.x;
    u_xlat0_.y = _e96.y;
    u_xlat0_.z = _e96.z;
    let _e103 = u_xlat0_;
    let _e105 = u_xlat0_;
    let _e110 = _v_buffer1_.v_cb1_[3];
    let _e112 = (_e105.xyz + _e110.xyz);
    u_xlat0_.x = _e112.x;
    u_xlat0_.y = _e112.y;
    u_xlat0_.z = _e112.z;
    let _e119 = vs_TEXCOORD1_;
    let _e121 = u_xlat0_;
    let _e122 = _e121.xyz;
    vs_TEXCOORD1_.x = _e122.x;
    vs_TEXCOORD1_.y = _e122.y;
    vs_TEXCOORD1_.z = _e122.z;
    let _e130 = in_NORMAL0_1;
    let _e135 = _v_buffer1_.v_cb1_[4];
    u_xlat1_.x = dot(_e130.xyz, _e135.xyz);
    let _e139 = in_NORMAL0_1;
    let _e144 = _v_buffer1_.v_cb1_[5];
    u_xlat1_.y = dot(_e139.xyz, _e144.xyz);
    let _e148 = in_NORMAL0_1;
    let _e153 = _v_buffer1_.v_cb1_[6];
    u_xlat1_.z = dot(_e148.xyz, _e153.xyz);
    let _e156 = u_xlat1_;
    let _e158 = u_xlat1_;
    u_xlat6_ = dot(_e156.xyz, _e158.xyz);
    let _e161 = u_xlat6_;
    u_xlat6_ = max(_e161, 0.000000000000000000000000000000000000011754944f);
    let _e164 = u_xlat6_;
    u_xlat6_ = inverseSqrt(_e164);
    let _e166 = u_xlat1_;
    let _e168 = u_xlat6_;
    let _e170 = u_xlat1_;
    let _e172 = (vec3(_e168) * _e170.xyz);
    u_xlat1_.x = _e172.x;
    u_xlat1_.y = _e172.y;
    u_xlat1_.z = _e172.z;
    let _e179 = u_xlat1_;
    let _e181 = u_xlat1_;
    u_xlat6_ = dot(_e179.xyz, _e181.xyz);
    let _e184 = u_xlat6_;
    u_xlat6_ = inverseSqrt(_e184);
    let _e186 = vs_TEXCOORD2_;
    let _e188 = u_xlat6_;
    let _e190 = u_xlat1_;
    let _e192 = (vec3(_e188) * _e190.xyz);
    vs_TEXCOORD2_.x = _e192.x;
    vs_TEXCOORD2_.y = _e192.y;
    vs_TEXCOORD2_.z = _e192.z;
    let _e199 = u_xlat1_;
    let _e201 = u_xlat0_;
    let _e206 = _v_buffer3_.v_cb3_[1];
    let _e208 = (_e201.yyy * _e206.xyz);
    u_xlat1_.x = _e208.x;
    u_xlat1_.y = _e208.y;
    u_xlat1_.z = _e208.z;
    let _e215 = u_xlat1_;
    let _e220 = _v_buffer3_.v_cb3_[0];
    let _e222 = u_xlat0_;
    let _e225 = u_xlat1_;
    let _e227 = ((_e220.xyz * _e222.xxx) + _e225.xyz);
    u_xlat1_.x = _e227.x;
    u_xlat1_.y = _e227.y;
    u_xlat1_.z = _e227.z;
    let _e234 = u_xlat1_;
    let _e239 = _v_buffer3_.v_cb3_[2];
    let _e241 = u_xlat0_;
    let _e244 = u_xlat1_;
    let _e246 = ((_e239.xyz * _e241.zzz) + _e244.xyz);
    u_xlat1_.x = _e246.x;
    u_xlat1_.y = _e246.y;
    u_xlat1_.z = _e246.z;
    let _e253 = vs_TEXCOORD6_;
    let _e255 = u_xlat1_;
    let _e260 = _v_buffer3_.v_cb3_[3];
    let _e262 = (_e255.xyz + _e260.xyz);
    vs_TEXCOORD6_.x = _e262.x;
    vs_TEXCOORD6_.y = _e262.y;
    vs_TEXCOORD6_.z = _e262.z;
    vs_TEXCOORD6_.w = 0f;
    let _e271 = vs_TEXCOORD7_;
    vs_TEXCOORD7_.x = 0f;
    vs_TEXCOORD7_.y = 0f;
    vs_TEXCOORD7_.z = 0f;
    let _e280 = u_xlat0_;
    let _e285 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e280.yyyy * _e285);
    let _e290 = _v_buffer0_.v_cb0_[79];
    let _e291 = u_xlat0_;
    let _e294 = u_xlat1_;
    u_xlat1_ = ((_e290 * _e291.xxxx) + _e294);
    let _e299 = _v_buffer0_.v_cb0_[81];
    let _e300 = u_xlat0_;
    let _e303 = u_xlat1_;
    u_xlat0_ = ((_e299 * _e300.zzzz) + _e303);
    let _e306 = u_xlat0_;
    let _e310 = _v_buffer0_.v_cb0_[82];
    gl_Position = (_e306 + _e310);
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(1) in_NORMAL0_: vec3<f32>, @location(4) in_TEXCOORD0_: vec2<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_NORMAL0_1 = in_NORMAL0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    main_1();
    let _e37 = vs_TEXCOORD0_;
    let _e39 = vs_TEXCOORD5_;
    let _e41 = vs_TEXCOORD1_;
    let _e43 = vs_TEXCOORD2_;
    let _e45 = vs_TEXCOORD6_;
    let _e47 = vs_TEXCOORD7_;
    let _e49 = gl_Position;
    return VertexOutput(_e37, _e39, _e41, _e43, _e45, _e47, _e49);
}
