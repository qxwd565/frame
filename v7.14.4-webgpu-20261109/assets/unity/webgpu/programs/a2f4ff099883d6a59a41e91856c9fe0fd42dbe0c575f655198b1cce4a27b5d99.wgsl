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
    @location(4) vs_TEXCOORD4_: vec4<f32>,
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
var<private> vs_TEXCOORD4_: vec4<f32>;
var<private> vs_NORMAL0_: vec3<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat6_: f32 = 0f;

    let _e31 = u_xlat0_;
    let _e33 = in_POSITION0_1;
    let _e38 = _v_buffer1_.v_cb1_[1];
    let _e40 = (_e33.yyy * _e38.xyz);
    u_xlat0_.x = _e40.x;
    u_xlat0_.y = _e40.y;
    u_xlat0_.z = _e40.z;
    let _e47 = u_xlat0_;
    let _e52 = _v_buffer1_.v_cb1_[0];
    let _e54 = in_POSITION0_1;
    let _e57 = u_xlat0_;
    let _e59 = ((_e52.xyz * _e54.xxx) + _e57.xyz);
    u_xlat0_.x = _e59.x;
    u_xlat0_.y = _e59.y;
    u_xlat0_.z = _e59.z;
    let _e66 = u_xlat0_;
    let _e71 = _v_buffer1_.v_cb1_[2];
    let _e73 = in_POSITION0_1;
    let _e76 = u_xlat0_;
    let _e78 = ((_e71.xyz * _e73.zzz) + _e76.xyz);
    u_xlat0_.x = _e78.x;
    u_xlat0_.y = _e78.y;
    u_xlat0_.z = _e78.z;
    let _e85 = u_xlat0_;
    let _e87 = u_xlat0_;
    let _e92 = _v_buffer1_.v_cb1_[3];
    let _e94 = (_e87.xyz + _e92.xyz);
    u_xlat0_.x = _e94.x;
    u_xlat0_.y = _e94.y;
    u_xlat0_.z = _e94.z;
    let _e101 = u_xlat0_;
    let _e106 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e101.yyyy * _e106);
    let _e111 = _v_buffer0_.v_cb0_[79];
    let _e112 = u_xlat0_;
    let _e115 = u_xlat1_;
    u_xlat1_ = ((_e111 * _e112.xxxx) + _e115);
    let _e120 = _v_buffer0_.v_cb0_[81];
    let _e121 = u_xlat0_;
    let _e124 = u_xlat1_;
    u_xlat1_ = ((_e120 * _e121.zzzz) + _e124);
    let _e127 = u_xlat1_;
    let _e131 = _v_buffer0_.v_cb0_[82];
    gl_Position = (_e127 + _e131);
    let _e133 = vs_TEXCOORD0_;
    let _e135 = in_TEXCOORD0_1;
    let _e137 = _v_buffer3_;
    let _e141 = _v_buffer3_;
    let _e144 = ((_e135.xy * _e137.v_cb3_.xy) + _e141.v_cb3_.zw);
    vs_TEXCOORD0_.x = _e144.x;
    vs_TEXCOORD0_.y = _e144.y;
    let _e149 = vs_TEXCOORD1_;
    let _e151 = u_xlat0_;
    let _e152 = _e151.xyz;
    vs_TEXCOORD1_.x = _e152.x;
    vs_TEXCOORD1_.y = _e152.y;
    vs_TEXCOORD1_.z = _e152.z;
    let _e159 = u_xlat1_;
    let _e161 = u_xlat0_;
    let _e166 = _v_buffer2_.v_cb2_[1];
    let _e168 = (_e161.yyy * _e166.xyz);
    u_xlat1_.x = _e168.x;
    u_xlat1_.y = _e168.y;
    u_xlat1_.z = _e168.z;
    let _e175 = u_xlat0_;
    let _e180 = _v_buffer2_.v_cb2_[0];
    let _e182 = u_xlat0_;
    let _e185 = u_xlat1_;
    let _e187 = ((_e180.xyz * _e182.xxx) + _e185.xyz);
    u_xlat0_.x = _e187.x;
    u_xlat0_.y = _e187.y;
    u_xlat0_.w = _e187.z;
    let _e194 = u_xlat0_;
    let _e199 = _v_buffer2_.v_cb2_[2];
    let _e201 = u_xlat0_;
    let _e204 = u_xlat0_;
    let _e206 = ((_e199.xyz * _e201.zzz) + _e204.xyw);
    u_xlat0_.x = _e206.x;
    u_xlat0_.y = _e206.y;
    u_xlat0_.z = _e206.z;
    let _e213 = vs_TEXCOORDindex3_;
    let _e215 = u_xlat0_;
    let _e220 = _v_buffer2_.v_cb2_[3];
    let _e222 = (_e215.xyz + _e220.xyz);
    vs_TEXCOORDindex3_.x = _e222.x;
    vs_TEXCOORDindex3_.y = _e222.y;
    vs_TEXCOORDindex3_.z = _e222.z;
    vs_TEXCOORDindex3_.w = 0f;
    let _e231 = in_POSITION0_1;
    vs_TEXCOORD4_ = _e231;
    let _e233 = in_NORMAL0_1;
    let _e238 = _v_buffer1_.v_cb1_[4];
    u_xlat0_.x = dot(_e233.xyz, _e238.xyz);
    let _e242 = in_NORMAL0_1;
    let _e247 = _v_buffer1_.v_cb1_[5];
    u_xlat0_.y = dot(_e242.xyz, _e247.xyz);
    let _e251 = in_NORMAL0_1;
    let _e256 = _v_buffer1_.v_cb1_[6];
    u_xlat0_.z = dot(_e251.xyz, _e256.xyz);
    let _e259 = u_xlat0_;
    let _e261 = u_xlat0_;
    u_xlat6_ = dot(_e259.xyz, _e261.xyz);
    let _e264 = u_xlat6_;
    u_xlat6_ = max(_e264, 0.000000000000000000000000000000000000011754944f);
    let _e267 = u_xlat6_;
    u_xlat6_ = inverseSqrt(_e267);
    let _e269 = vs_NORMAL0_;
    let _e271 = u_xlat6_;
    let _e273 = u_xlat0_;
    let _e275 = (vec3(_e271) * _e273.xyz);
    vs_NORMAL0_.x = _e275.x;
    vs_NORMAL0_.y = _e275.y;
    vs_NORMAL0_.z = _e275.z;
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(1) in_NORMAL0_: vec3<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_NORMAL0_1 = in_NORMAL0_;
    main_1();
    let _e35 = vs_TEXCOORD0_;
    let _e37 = vs_TEXCOORD1_;
    let _e39 = vs_TEXCOORDindex3_;
    let _e41 = vs_TEXCOORD4_;
    let _e43 = vs_NORMAL0_;
    let _e45 = gl_Position;
    return VertexOutput(_e35, _e37, _e39, _e41, _e43, _e45);
}
