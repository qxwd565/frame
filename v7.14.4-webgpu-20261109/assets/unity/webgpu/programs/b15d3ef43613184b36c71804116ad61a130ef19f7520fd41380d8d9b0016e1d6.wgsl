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
    let _e112 = vs_TEXCOORD1_;
    let _e114 = u_xlat0_;
    let _e115 = _e114.xyz;
    vs_TEXCOORD1_.x = _e115.x;
    vs_TEXCOORD1_.y = _e115.y;
    vs_TEXCOORD1_.z = _e115.z;
    let _e122 = u_xlat1_;
    let _e124 = u_xlat0_;
    let _e129 = _v_buffer2_.v_cb2_[1];
    let _e131 = (_e124.yyy * _e129.xyz);
    u_xlat1_.x = _e131.x;
    u_xlat1_.y = _e131.y;
    u_xlat1_.z = _e131.z;
    let _e138 = u_xlat0_;
    let _e143 = _v_buffer2_.v_cb2_[0];
    let _e145 = u_xlat0_;
    let _e148 = u_xlat1_;
    let _e150 = ((_e143.xyz * _e145.xxx) + _e148.xyz);
    u_xlat0_.x = _e150.x;
    u_xlat0_.y = _e150.y;
    u_xlat0_.w = _e150.z;
    let _e157 = u_xlat0_;
    let _e162 = _v_buffer2_.v_cb2_[2];
    let _e164 = u_xlat0_;
    let _e167 = u_xlat0_;
    let _e169 = ((_e162.xyz * _e164.zzz) + _e167.xyw);
    u_xlat0_.x = _e169.x;
    u_xlat0_.y = _e169.y;
    u_xlat0_.z = _e169.z;
    let _e176 = vs_TEXCOORDindex3_;
    let _e178 = u_xlat0_;
    let _e183 = _v_buffer2_.v_cb2_[3];
    let _e185 = (_e178.xyz + _e183.xyz);
    vs_TEXCOORDindex3_.x = _e185.x;
    vs_TEXCOORDindex3_.y = _e185.y;
    vs_TEXCOORDindex3_.z = _e185.z;
    vs_TEXCOORDindex3_.w = 0f;
    let _e195 = in_NORMAL0_1;
    let _e200 = _v_buffer1_.v_cb1_[4];
    u_xlat0_.x = dot(_e195.xyz, _e200.xyz);
    let _e204 = in_NORMAL0_1;
    let _e209 = _v_buffer1_.v_cb1_[5];
    u_xlat0_.y = dot(_e204.xyz, _e209.xyz);
    let _e213 = in_NORMAL0_1;
    let _e218 = _v_buffer1_.v_cb1_[6];
    u_xlat0_.z = dot(_e213.xyz, _e218.xyz);
    let _e221 = u_xlat0_;
    let _e223 = u_xlat0_;
    u_xlat6_ = dot(_e221.xyz, _e223.xyz);
    let _e226 = u_xlat6_;
    u_xlat6_ = max(_e226, 0.000000000000000000000000000000000000011754944f);
    let _e229 = u_xlat6_;
    u_xlat6_ = inverseSqrt(_e229);
    let _e231 = vs_NORMAL0_;
    let _e233 = u_xlat6_;
    let _e235 = u_xlat0_;
    let _e237 = (vec3(_e233) * _e235.xyz);
    vs_NORMAL0_.x = _e237.x;
    vs_NORMAL0_.y = _e237.y;
    vs_NORMAL0_.z = _e237.z;
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
