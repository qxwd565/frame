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

    let _e30 = in_POSITION0_1;
    let _e35 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e30.yyyy * _e35);
    let _e40 = _v_buffer1_.v_cb1_[0];
    let _e41 = in_POSITION0_1;
    let _e44 = u_xlat0_;
    u_xlat0_ = ((_e40 * _e41.xxxx) + _e44);
    let _e49 = _v_buffer1_.v_cb1_[2];
    let _e50 = in_POSITION0_1;
    let _e53 = u_xlat0_;
    u_xlat0_ = ((_e49 * _e50.zzzz) + _e53);
    let _e55 = u_xlat0_;
    let _e59 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e55 + _e59);
    let _e61 = u_xlat0_;
    let _e66 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e61.yyyy * _e66);
    let _e71 = _v_buffer0_.v_cb0_[79];
    let _e72 = u_xlat0_;
    let _e75 = u_xlat1_;
    u_xlat1_ = ((_e71 * _e72.xxxx) + _e75);
    let _e80 = _v_buffer0_.v_cb0_[81];
    let _e81 = u_xlat0_;
    let _e84 = u_xlat1_;
    u_xlat1_ = ((_e80 * _e81.zzzz) + _e84);
    let _e90 = _v_buffer0_.v_cb0_[82];
    let _e91 = u_xlat0_;
    let _e94 = u_xlat1_;
    gl_Position = ((_e90 * _e91.wwww) + _e94);
    let _e96 = vs_TEXCOORD0_;
    let _e98 = in_TEXCOORD0_1;
    let _e100 = _v_buffer3_;
    let _e104 = _v_buffer3_;
    let _e107 = ((_e98.xy * _e100.v_cb3_.xy) + _e104.v_cb3_.zw);
    vs_TEXCOORD0_.x = _e107.x;
    vs_TEXCOORD0_.y = _e107.y;
    let _e112 = u_xlat0_;
    let _e114 = in_POSITION0_1;
    let _e119 = _v_buffer1_.v_cb1_[1];
    let _e121 = (_e114.yyy * _e119.xyz);
    u_xlat0_.x = _e121.x;
    u_xlat0_.y = _e121.y;
    u_xlat0_.z = _e121.z;
    let _e128 = u_xlat0_;
    let _e133 = _v_buffer1_.v_cb1_[0];
    let _e135 = in_POSITION0_1;
    let _e138 = u_xlat0_;
    let _e140 = ((_e133.xyz * _e135.xxx) + _e138.xyz);
    u_xlat0_.x = _e140.x;
    u_xlat0_.y = _e140.y;
    u_xlat0_.z = _e140.z;
    let _e147 = u_xlat0_;
    let _e152 = _v_buffer1_.v_cb1_[2];
    let _e154 = in_POSITION0_1;
    let _e157 = u_xlat0_;
    let _e159 = ((_e152.xyz * _e154.zzz) + _e157.xyz);
    u_xlat0_.x = _e159.x;
    u_xlat0_.y = _e159.y;
    u_xlat0_.z = _e159.z;
    let _e166 = u_xlat0_;
    let _e168 = u_xlat0_;
    let _e173 = _v_buffer1_.v_cb1_[3];
    let _e175 = (_e168.xyz + _e173.xyz);
    u_xlat0_.x = _e175.x;
    u_xlat0_.y = _e175.y;
    u_xlat0_.z = _e175.z;
    let _e182 = vs_TEXCOORD1_;
    let _e184 = u_xlat0_;
    let _e185 = _e184.xyz;
    vs_TEXCOORD1_.x = _e185.x;
    vs_TEXCOORD1_.y = _e185.y;
    vs_TEXCOORD1_.z = _e185.z;
    let _e192 = u_xlat1_;
    let _e194 = u_xlat0_;
    let _e199 = _v_buffer2_.v_cb2_[1];
    let _e201 = (_e194.yyy * _e199.xyz);
    u_xlat1_.x = _e201.x;
    u_xlat1_.y = _e201.y;
    u_xlat1_.z = _e201.z;
    let _e208 = u_xlat0_;
    let _e213 = _v_buffer2_.v_cb2_[0];
    let _e215 = u_xlat0_;
    let _e218 = u_xlat1_;
    let _e220 = ((_e213.xyz * _e215.xxx) + _e218.xyz);
    u_xlat0_.x = _e220.x;
    u_xlat0_.y = _e220.y;
    u_xlat0_.w = _e220.z;
    let _e227 = u_xlat0_;
    let _e232 = _v_buffer2_.v_cb2_[2];
    let _e234 = u_xlat0_;
    let _e237 = u_xlat0_;
    let _e239 = ((_e232.xyz * _e234.zzz) + _e237.xyw);
    u_xlat0_.x = _e239.x;
    u_xlat0_.y = _e239.y;
    u_xlat0_.z = _e239.z;
    let _e246 = vs_TEXCOORDindex3_;
    let _e248 = u_xlat0_;
    let _e253 = _v_buffer2_.v_cb2_[3];
    let _e255 = (_e248.xyz + _e253.xyz);
    vs_TEXCOORDindex3_.x = _e255.x;
    vs_TEXCOORDindex3_.y = _e255.y;
    vs_TEXCOORDindex3_.z = _e255.z;
    vs_TEXCOORDindex3_.w = 0f;
    let _e265 = in_NORMAL0_1;
    let _e270 = _v_buffer1_.v_cb1_[4];
    u_xlat0_.x = dot(_e265.xyz, _e270.xyz);
    let _e274 = in_NORMAL0_1;
    let _e279 = _v_buffer1_.v_cb1_[5];
    u_xlat0_.y = dot(_e274.xyz, _e279.xyz);
    let _e283 = in_NORMAL0_1;
    let _e288 = _v_buffer1_.v_cb1_[6];
    u_xlat0_.z = dot(_e283.xyz, _e288.xyz);
    let _e291 = u_xlat0_;
    let _e293 = u_xlat0_;
    u_xlat6_ = dot(_e291.xyz, _e293.xyz);
    let _e296 = u_xlat6_;
    u_xlat6_ = max(_e296, 0.000000000000000000000000000000000000011754944f);
    let _e299 = u_xlat6_;
    u_xlat6_ = inverseSqrt(_e299);
    let _e301 = vs_NORMAL0_;
    let _e303 = u_xlat6_;
    let _e305 = u_xlat0_;
    let _e307 = (vec3(_e303) * _e305.xyz);
    vs_NORMAL0_.x = _e307.x;
    vs_NORMAL0_.y = _e307.y;
    vs_NORMAL0_.z = _e307.z;
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
