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
    v_cb3_: array<vec4<f32>, 5>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec2<f32>,
    @location(1) vs_TEXCOORD1_: vec2<f32>,
    @location(2) vs_TEXCOORD2_: vec3<f32>,
    @location(3) vs_TEXCOORDindex3_: vec4<f32>,
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
var<private> vs_TEXCOORD0_: vec2<f32>;
var<private> vs_TEXCOORD1_: vec2<f32>;
var<private> vs_TEXCOORD2_: vec3<f32>;
var<private> vs_TEXCOORDindex3_: vec4<f32>;
var<private> vs_NORMAL0_: vec3<f32>;
var<private> vs_COLOR0_: vec4<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat5_: vec2<f32> = vec2(0f);
    var u_xlat6_: f32 = 0f;

    let _e37 = in_POSITION0_1;
    let _e42 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e37.yyyy * _e42);
    let _e47 = _v_buffer1_.v_cb1_[0];
    let _e48 = in_POSITION0_1;
    let _e51 = u_xlat0_;
    u_xlat0_ = ((_e47 * _e48.xxxx) + _e51);
    let _e56 = _v_buffer1_.v_cb1_[2];
    let _e57 = in_POSITION0_1;
    let _e60 = u_xlat0_;
    u_xlat0_ = ((_e56 * _e57.zzzz) + _e60);
    let _e62 = u_xlat0_;
    let _e66 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e62 + _e66);
    let _e68 = u_xlat0_;
    let _e73 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e68.yyyy * _e73);
    let _e78 = _v_buffer0_.v_cb0_[79];
    let _e79 = u_xlat0_;
    let _e82 = u_xlat1_;
    u_xlat1_ = ((_e78 * _e79.xxxx) + _e82);
    let _e87 = _v_buffer0_.v_cb0_[81];
    let _e88 = u_xlat0_;
    let _e91 = u_xlat1_;
    u_xlat1_ = ((_e87 * _e88.zzzz) + _e91);
    let _e97 = _v_buffer0_.v_cb0_[82];
    let _e98 = u_xlat0_;
    let _e101 = u_xlat1_;
    gl_Position = ((_e97 * _e98.wwww) + _e101);
    let _e104 = in_TEXCOORD1_1;
    let _e109 = _v_buffer3_.v_cb3_[1];
    u_xlat5_.x = (_e104.x + _e109.w);
    let _e113 = in_TEXCOORD1_1;
    let _e118 = _v_buffer3_.v_cb3_[2];
    u_xlat5_.y = (_e113.y + _e118.x);
    let _e121 = vs_TEXCOORD1_;
    let _e123 = u_xlat5_;
    let _e128 = _v_buffer3_.v_cb3_[2];
    let _e130 = (_e123.xy * _e128.yy);
    vs_TEXCOORD1_.x = _e130.x;
    vs_TEXCOORD1_.y = _e130.y;
    let _e135 = u_xlat1_;
    let _e137 = in_TEXCOORD0_1;
    let _e142 = _v_buffer3_.v_cb3_[1];
    let _e144 = (_e137.xy + _e142.xy);
    u_xlat1_.x = _e144.x;
    u_xlat1_.y = _e144.y;
    let _e149 = vs_TEXCOORD0_;
    let _e151 = u_xlat1_;
    let _e156 = _v_buffer3_.v_cb3_[1];
    let _e158 = (_e151.xy * _e156.zz);
    vs_TEXCOORD0_.x = _e158.x;
    vs_TEXCOORD0_.y = _e158.y;
    let _e163 = vs_TEXCOORD2_;
    let _e165 = u_xlat0_;
    let _e166 = _e165.xyz;
    vs_TEXCOORD2_.x = _e166.x;
    vs_TEXCOORD2_.y = _e166.y;
    vs_TEXCOORD2_.z = _e166.z;
    let _e173 = u_xlat1_;
    let _e175 = u_xlat0_;
    let _e180 = _v_buffer2_.v_cb2_[1];
    let _e182 = (_e175.yyy * _e180.xyz);
    u_xlat1_.x = _e182.x;
    u_xlat1_.y = _e182.y;
    u_xlat1_.z = _e182.z;
    let _e189 = u_xlat0_;
    let _e194 = _v_buffer2_.v_cb2_[0];
    let _e196 = u_xlat0_;
    let _e199 = u_xlat1_;
    let _e201 = ((_e194.xyz * _e196.xxx) + _e199.xyz);
    u_xlat0_.x = _e201.x;
    u_xlat0_.y = _e201.y;
    u_xlat0_.w = _e201.z;
    let _e208 = u_xlat0_;
    let _e213 = _v_buffer2_.v_cb2_[2];
    let _e215 = u_xlat0_;
    let _e218 = u_xlat0_;
    let _e220 = ((_e213.xyz * _e215.zzz) + _e218.xyw);
    u_xlat0_.x = _e220.x;
    u_xlat0_.y = _e220.y;
    u_xlat0_.z = _e220.z;
    let _e227 = vs_TEXCOORDindex3_;
    let _e229 = u_xlat0_;
    let _e234 = _v_buffer2_.v_cb2_[3];
    let _e236 = (_e229.xyz + _e234.xyz);
    vs_TEXCOORDindex3_.x = _e236.x;
    vs_TEXCOORDindex3_.y = _e236.y;
    vs_TEXCOORDindex3_.z = _e236.z;
    vs_TEXCOORDindex3_.w = 0f;
    let _e246 = in_NORMAL0_1;
    let _e251 = _v_buffer1_.v_cb1_[4];
    u_xlat0_.x = dot(_e246.xyz, _e251.xyz);
    let _e255 = in_NORMAL0_1;
    let _e260 = _v_buffer1_.v_cb1_[5];
    u_xlat0_.y = dot(_e255.xyz, _e260.xyz);
    let _e264 = in_NORMAL0_1;
    let _e269 = _v_buffer1_.v_cb1_[6];
    u_xlat0_.z = dot(_e264.xyz, _e269.xyz);
    let _e272 = u_xlat0_;
    let _e274 = u_xlat0_;
    u_xlat6_ = dot(_e272.xyz, _e274.xyz);
    let _e277 = u_xlat6_;
    u_xlat6_ = max(_e277, 0.000000000000000000000000000000000000011754944f);
    let _e280 = u_xlat6_;
    u_xlat6_ = inverseSqrt(_e280);
    let _e282 = vs_NORMAL0_;
    let _e284 = u_xlat6_;
    let _e286 = u_xlat0_;
    let _e288 = (vec3(_e284) * _e286.xyz);
    vs_NORMAL0_.x = _e288.x;
    vs_NORMAL0_.y = _e288.y;
    vs_NORMAL0_.z = _e288.z;
    let _e299 = _v_buffer3_.v_cb3_[3];
    let _e304 = _v_buffer3_.v_cb3_[3];
    u_xlat0_.x = dot(_e299.xyz, _e304.xyz);
    let _e308 = u_xlat0_;
    u_xlat0_.x = inverseSqrt(_e308.x);
    let _e311 = u_xlat0_;
    let _e313 = u_xlat0_;
    let _e318 = _v_buffer3_.v_cb3_[3];
    let _e320 = (_e313.xxx * _e318.xyz);
    u_xlat0_.x = _e320.x;
    u_xlat0_.y = _e320.y;
    u_xlat0_.z = _e320.z;
    let _e328 = u_xlat0_;
    let _e330 = in_NORMAL0_1;
    u_xlat0_.x = dot(_e328.xyz, _e330.xyz);
    let _e334 = u_xlat0_;
    let _e339 = _v_buffer3_.v_cb3_[4];
    u_xlat0_.x = (_e334.x * _e339.x);
    let _e343 = u_xlat0_;
    u_xlat0_.x = clamp(_e343.x, 0f, 1f);
    let _e349 = u_xlat0_;
    u_xlat0_.x = log2(_e349.x);
    let _e353 = u_xlat0_;
    let _e358 = _v_buffer3_.v_cb3_[3];
    u_xlat0_.x = (_e353.x * _e358.w);
    let _e361 = u_xlat0_;
    vs_COLOR0_ = exp2(_e361.xxxx);
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(5) in_TEXCOORD1_: vec2<f32>, @location(1) in_NORMAL0_: vec3<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_TEXCOORD1_1 = in_TEXCOORD1_;
    in_NORMAL0_1 = in_NORMAL0_;
    main_1();
    let _e41 = vs_TEXCOORD0_;
    let _e43 = vs_TEXCOORD1_;
    let _e45 = vs_TEXCOORD2_;
    let _e47 = vs_TEXCOORDindex3_;
    let _e49 = vs_NORMAL0_;
    let _e51 = vs_COLOR0_;
    let _e53 = gl_Position;
    return VertexOutput(_e41, _e43, _e45, _e47, _e49, _e51, _e53);
}
