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
    @location(5) vs_TEXCOORD5_: vec2<f32>,
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
var<private> vs_TEXCOORD5_: vec2<f32>;
var<private> vs_TEXCOORD1_: vec3<f32>;
var<private> vs_TEXCOORDindex3_: vec4<f32>;
var<private> vs_NORMAL0_: vec3<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat6_: f32 = 0f;
    var u_xlat7_: f32 = 0f;

    let _e38 = in_POSITION0_1;
    let _e43 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e38.yyyy * _e43);
    let _e48 = _v_buffer1_.v_cb1_[0];
    let _e49 = in_POSITION0_1;
    let _e52 = u_xlat0_;
    u_xlat0_ = ((_e48 * _e49.xxxx) + _e52);
    let _e57 = _v_buffer1_.v_cb1_[2];
    let _e58 = in_POSITION0_1;
    let _e61 = u_xlat0_;
    u_xlat0_ = ((_e57 * _e58.zzzz) + _e61);
    let _e63 = u_xlat0_;
    let _e67 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e63 + _e67);
    let _e69 = u_xlat0_;
    let _e74 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e69.yyyy * _e74);
    let _e79 = _v_buffer0_.v_cb0_[79];
    let _e80 = u_xlat0_;
    let _e83 = u_xlat1_;
    u_xlat1_ = ((_e79 * _e80.xxxx) + _e83);
    let _e88 = _v_buffer0_.v_cb0_[81];
    let _e89 = u_xlat0_;
    let _e92 = u_xlat1_;
    u_xlat1_ = ((_e88 * _e89.zzzz) + _e92);
    let _e98 = _v_buffer0_.v_cb0_[82];
    let _e99 = u_xlat0_;
    let _e102 = u_xlat1_;
    gl_Position = ((_e98 * _e99.wwww) + _e102);
    let _e105 = in_NORMAL0_1;
    let _e110 = _v_buffer1_.v_cb1_[4];
    u_xlat1_.x = dot(_e105.xyz, _e110.xyz);
    let _e114 = in_NORMAL0_1;
    let _e119 = _v_buffer1_.v_cb1_[5];
    u_xlat1_.y = dot(_e114.xyz, _e119.xyz);
    let _e123 = in_NORMAL0_1;
    let _e128 = _v_buffer1_.v_cb1_[6];
    u_xlat1_.z = dot(_e123.xyz, _e128.xyz);
    let _e131 = u_xlat1_;
    let _e133 = u_xlat1_;
    u_xlat6_ = dot(_e131.xyz, _e133.xyz);
    let _e136 = u_xlat6_;
    u_xlat7_ = inverseSqrt(_e136);
    let _e138 = u_xlat6_;
    u_xlat6_ = max(_e138, 0.000000000000000000000000000000000000011754944f);
    let _e141 = u_xlat6_;
    u_xlat6_ = inverseSqrt(_e141);
    let _e143 = vs_NORMAL0_;
    let _e145 = u_xlat6_;
    let _e147 = u_xlat1_;
    let _e149 = (vec3(_e145) * _e147.xyz);
    vs_NORMAL0_.x = _e149.x;
    vs_NORMAL0_.y = _e149.y;
    vs_NORMAL0_.z = _e149.z;
    let _e156 = u_xlat1_;
    let _e158 = u_xlat7_;
    let _e160 = u_xlat1_;
    let _e162 = (vec3(_e158) * _e160.xyz);
    u_xlat1_.x = _e162.x;
    u_xlat1_.y = _e162.y;
    u_xlat1_.z = _e162.z;
    let _e169 = u_xlat3_;
    let _e171 = u_xlat1_;
    let _e176 = _v_buffer0_.v_cb0_[68];
    let _e178 = (_e171.yy * _e176.xy);
    u_xlat3_.x = _e178.x;
    u_xlat3_.z = _e178.y;
    let _e183 = u_xlat1_;
    let _e188 = _v_buffer0_.v_cb0_[67];
    let _e190 = u_xlat1_;
    let _e193 = u_xlat3_;
    let _e195 = ((_e188.xy * _e190.xx) + _e193.xz);
    u_xlat1_.x = _e195.x;
    u_xlat1_.y = _e195.y;
    let _e200 = u_xlat1_;
    let _e205 = _v_buffer0_.v_cb0_[69];
    let _e207 = u_xlat1_;
    let _e210 = u_xlat1_;
    let _e212 = ((_e205.xy * _e207.zz) + _e210.xy);
    u_xlat1_.x = _e212.x;
    u_xlat1_.y = _e212.y;
    let _e217 = vs_TEXCOORD5_;
    let _e219 = u_xlat1_;
    let _e228 = ((_e219.xy * vec2<f32>(0.499f, 0.499f)) + vec2<f32>(0.5f, 0.5f));
    vs_TEXCOORD5_.x = _e228.x;
    vs_TEXCOORD5_.y = _e228.y;
    let _e233 = vs_TEXCOORD0_;
    let _e235 = in_TEXCOORD0_1;
    let _e237 = _v_buffer3_;
    let _e241 = _v_buffer3_;
    let _e244 = ((_e235.xy * _e237.v_cb3_.xy) + _e241.v_cb3_.zw);
    vs_TEXCOORD0_.x = _e244.x;
    vs_TEXCOORD0_.y = _e244.y;
    let _e249 = vs_TEXCOORD1_;
    let _e251 = u_xlat0_;
    let _e252 = _e251.xyz;
    vs_TEXCOORD1_.x = _e252.x;
    vs_TEXCOORD1_.y = _e252.y;
    vs_TEXCOORD1_.z = _e252.z;
    let _e259 = u_xlat1_;
    let _e261 = u_xlat0_;
    let _e266 = _v_buffer2_.v_cb2_[1];
    let _e268 = (_e261.yyy * _e266.xyz);
    u_xlat1_.x = _e268.x;
    u_xlat1_.y = _e268.y;
    u_xlat1_.z = _e268.z;
    let _e275 = u_xlat0_;
    let _e280 = _v_buffer2_.v_cb2_[0];
    let _e282 = u_xlat0_;
    let _e285 = u_xlat1_;
    let _e287 = ((_e280.xyz * _e282.xxx) + _e285.xyz);
    u_xlat0_.x = _e287.x;
    u_xlat0_.y = _e287.y;
    u_xlat0_.w = _e287.z;
    let _e294 = u_xlat0_;
    let _e299 = _v_buffer2_.v_cb2_[2];
    let _e301 = u_xlat0_;
    let _e304 = u_xlat0_;
    let _e306 = ((_e299.xyz * _e301.zzz) + _e304.xyw);
    u_xlat0_.x = _e306.x;
    u_xlat0_.y = _e306.y;
    u_xlat0_.z = _e306.z;
    let _e313 = vs_TEXCOORDindex3_;
    let _e315 = u_xlat0_;
    let _e320 = _v_buffer2_.v_cb2_[3];
    let _e322 = (_e315.xyz + _e320.xyz);
    vs_TEXCOORDindex3_.x = _e322.x;
    vs_TEXCOORDindex3_.y = _e322.y;
    vs_TEXCOORDindex3_.z = _e322.z;
    vs_TEXCOORDindex3_.w = 0f;
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(1) in_NORMAL0_: vec3<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_NORMAL0_1 = in_NORMAL0_;
    main_1();
    let _e35 = vs_TEXCOORD0_;
    let _e37 = vs_TEXCOORD5_;
    let _e39 = vs_TEXCOORD1_;
    let _e41 = vs_TEXCOORDindex3_;
    let _e43 = vs_NORMAL0_;
    let _e45 = gl_Position;
    return VertexOutput(_e35, _e37, _e39, _e41, _e43, _e45);
}
