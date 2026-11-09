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
    var u_xlat6_: f32 = 0f;

    let _e31 = in_POSITION0_1;
    let _e36 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e31.yyyy * _e36);
    let _e41 = _v_buffer1_.v_cb1_[0];
    let _e42 = in_POSITION0_1;
    let _e45 = u_xlat0_;
    u_xlat0_ = ((_e41 * _e42.xxxx) + _e45);
    let _e50 = _v_buffer1_.v_cb1_[2];
    let _e51 = in_POSITION0_1;
    let _e54 = u_xlat0_;
    u_xlat0_ = ((_e50 * _e51.zzzz) + _e54);
    let _e56 = u_xlat0_;
    let _e60 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e56 + _e60);
    let _e62 = u_xlat0_;
    let _e67 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e62.yyyy * _e67);
    let _e72 = _v_buffer0_.v_cb0_[79];
    let _e73 = u_xlat0_;
    let _e76 = u_xlat1_;
    u_xlat1_ = ((_e72 * _e73.xxxx) + _e76);
    let _e81 = _v_buffer0_.v_cb0_[81];
    let _e82 = u_xlat0_;
    let _e85 = u_xlat1_;
    u_xlat1_ = ((_e81 * _e82.zzzz) + _e85);
    let _e91 = _v_buffer0_.v_cb0_[82];
    let _e92 = u_xlat0_;
    let _e95 = u_xlat1_;
    gl_Position = ((_e91 * _e92.wwww) + _e95);
    let _e97 = u_xlat1_;
    let _e99 = in_TEXCOORD0_1;
    let _e106 = (_e99.xy + vec2<f32>(-0.5f, -0.5f));
    u_xlat1_.x = _e106.x;
    u_xlat1_.y = _e106.y;
    let _e111 = u_xlat1_;
    let _e113 = u_xlat1_;
    let _e118 = _v_buffer3_.v_cb3_[3];
    let _e124 = ((_e113.xy * _e118.yy) + vec2<f32>(0.5f, 0.5f));
    u_xlat1_.x = _e124.x;
    u_xlat1_.y = _e124.y;
    let _e129 = vs_TEXCOORD0_;
    let _e131 = u_xlat1_;
    let _e136 = _v_buffer3_.v_cb3_[0];
    let _e142 = _v_buffer3_.v_cb3_[0];
    let _e144 = ((_e131.xy * _e136.xy) + _e142.zw);
    vs_TEXCOORD0_.x = _e144.x;
    vs_TEXCOORD0_.y = _e144.y;
    let _e149 = vs_TEXCOORD5_;
    let _e151 = u_xlat1_;
    let _e156 = _v_buffer3_.v_cb3_[2];
    let _e162 = _v_buffer3_.v_cb3_[2];
    let _e164 = ((_e151.xy * _e156.xy) + _e162.zw);
    vs_TEXCOORD5_.x = _e164.x;
    vs_TEXCOORD5_.y = _e164.y;
    let _e169 = vs_TEXCOORD1_;
    let _e171 = u_xlat0_;
    let _e172 = _e171.xyz;
    vs_TEXCOORD1_.x = _e172.x;
    vs_TEXCOORD1_.y = _e172.y;
    vs_TEXCOORD1_.z = _e172.z;
    let _e179 = u_xlat1_;
    let _e181 = u_xlat0_;
    let _e186 = _v_buffer2_.v_cb2_[1];
    let _e188 = (_e181.yyy * _e186.xyz);
    u_xlat1_.x = _e188.x;
    u_xlat1_.y = _e188.y;
    u_xlat1_.z = _e188.z;
    let _e195 = u_xlat0_;
    let _e200 = _v_buffer2_.v_cb2_[0];
    let _e202 = u_xlat0_;
    let _e205 = u_xlat1_;
    let _e207 = ((_e200.xyz * _e202.xxx) + _e205.xyz);
    u_xlat0_.x = _e207.x;
    u_xlat0_.y = _e207.y;
    u_xlat0_.w = _e207.z;
    let _e214 = u_xlat0_;
    let _e219 = _v_buffer2_.v_cb2_[2];
    let _e221 = u_xlat0_;
    let _e224 = u_xlat0_;
    let _e226 = ((_e219.xyz * _e221.zzz) + _e224.xyw);
    u_xlat0_.x = _e226.x;
    u_xlat0_.y = _e226.y;
    u_xlat0_.z = _e226.z;
    let _e233 = vs_TEXCOORDindex3_;
    let _e235 = u_xlat0_;
    let _e240 = _v_buffer2_.v_cb2_[3];
    let _e242 = (_e235.xyz + _e240.xyz);
    vs_TEXCOORDindex3_.x = _e242.x;
    vs_TEXCOORDindex3_.y = _e242.y;
    vs_TEXCOORDindex3_.z = _e242.z;
    vs_TEXCOORDindex3_.w = 0f;
    let _e252 = in_NORMAL0_1;
    let _e257 = _v_buffer1_.v_cb1_[4];
    u_xlat0_.x = dot(_e252.xyz, _e257.xyz);
    let _e261 = in_NORMAL0_1;
    let _e266 = _v_buffer1_.v_cb1_[5];
    u_xlat0_.y = dot(_e261.xyz, _e266.xyz);
    let _e270 = in_NORMAL0_1;
    let _e275 = _v_buffer1_.v_cb1_[6];
    u_xlat0_.z = dot(_e270.xyz, _e275.xyz);
    let _e278 = u_xlat0_;
    let _e280 = u_xlat0_;
    u_xlat6_ = dot(_e278.xyz, _e280.xyz);
    let _e283 = u_xlat6_;
    u_xlat6_ = max(_e283, 0.000000000000000000000000000000000000011754944f);
    let _e286 = u_xlat6_;
    u_xlat6_ = inverseSqrt(_e286);
    let _e288 = vs_NORMAL0_;
    let _e290 = u_xlat6_;
    let _e292 = u_xlat0_;
    let _e294 = (vec3(_e290) * _e292.xyz);
    vs_NORMAL0_.x = _e294.x;
    vs_NORMAL0_.y = _e294.y;
    vs_NORMAL0_.z = _e294.z;
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
