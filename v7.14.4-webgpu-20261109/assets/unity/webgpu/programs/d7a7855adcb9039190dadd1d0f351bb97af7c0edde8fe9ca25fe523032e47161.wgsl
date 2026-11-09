struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 7>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 14>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec2<f32>,
    @location(5) vs_TEXCOORD5_: vec2<f32>,
    @location(12) vs_NORMAL0_: vec3<f32>,
    @builtin(position) gl_Position: vec4<f32>,
}

@group(0) @binding(0) 
var<uniform> _v_buffer0_: v_buffer0_;
@group(0) @binding(1) 
var<uniform> _v_buffer1_: v_buffer1_;
@group(0) @binding(2) 
var<uniform> _v_buffer2_: v_buffer2_;
var<private> in_POSITION0_1: vec4<f32>;
var<private> in_TEXCOORD0_1: vec2<f32>;
var<private> in_TEXCOORD1_1: vec2<f32>;
var<private> in_NORMAL0_1: vec3<f32>;
var<private> vs_TEXCOORD0_: vec2<f32>;
var<private> vs_TEXCOORD5_: vec2<f32>;
var<private> vs_NORMAL0_: vec3<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec3<f32> = vec3(0f);
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
    let _e97 = u_xlat0_;
    let _e99 = in_TEXCOORD0_1;
    let _e102 = in_TEXCOORD1_1;
    let _e104 = (-(_e99.xy) + _e102.xy);
    u_xlat0_.x = _e104.x;
    u_xlat0_.y = _e104.y;
    let _e109 = vs_TEXCOORD0_;
    let _e114 = _v_buffer2_.v_cb2_[13];
    let _e116 = u_xlat0_;
    let _e119 = in_TEXCOORD0_1;
    let _e121 = ((_e114.xy * _e116.xy) + _e119.xy);
    vs_TEXCOORD0_.x = _e121.x;
    vs_TEXCOORD0_.y = _e121.y;
    let _e127 = in_NORMAL0_1;
    let _e132 = _v_buffer1_.v_cb1_[4];
    u_xlat0_.x = dot(_e127.xyz, _e132.xyz);
    let _e136 = in_NORMAL0_1;
    let _e141 = _v_buffer1_.v_cb1_[5];
    u_xlat0_.y = dot(_e136.xyz, _e141.xyz);
    let _e145 = in_NORMAL0_1;
    let _e150 = _v_buffer1_.v_cb1_[6];
    u_xlat0_.z = dot(_e145.xyz, _e150.xyz);
    let _e153 = u_xlat0_;
    let _e155 = u_xlat0_;
    u_xlat6_ = dot(_e153.xyz, _e155.xyz);
    let _e159 = u_xlat6_;
    u_xlat1_.x = inverseSqrt(_e159);
    let _e161 = u_xlat6_;
    u_xlat6_ = max(_e161, 0.000000000000000000000000000000000000011754944f);
    let _e164 = u_xlat6_;
    u_xlat6_ = inverseSqrt(_e164);
    let _e166 = vs_NORMAL0_;
    let _e168 = u_xlat6_;
    let _e170 = u_xlat0_;
    let _e172 = (vec3(_e168) * _e170.xyz);
    vs_NORMAL0_.x = _e172.x;
    vs_NORMAL0_.y = _e172.y;
    vs_NORMAL0_.z = _e172.z;
    let _e179 = u_xlat0_;
    let _e181 = u_xlat0_;
    let _e183 = u_xlat1_;
    let _e185 = (_e181.xyz * _e183.xxx);
    u_xlat0_.x = _e185.x;
    u_xlat0_.y = _e185.y;
    u_xlat0_.z = _e185.z;
    let _e192 = u_xlat2_;
    let _e194 = u_xlat0_;
    let _e199 = _v_buffer0_.v_cb0_[68];
    let _e201 = (_e194.yy * _e199.xy);
    u_xlat2_.x = _e201.x;
    u_xlat2_.z = _e201.y;
    let _e206 = u_xlat0_;
    let _e211 = _v_buffer0_.v_cb0_[67];
    let _e213 = u_xlat0_;
    let _e216 = u_xlat2_;
    let _e218 = ((_e211.xy * _e213.xx) + _e216.xz);
    u_xlat0_.x = _e218.x;
    u_xlat0_.y = _e218.y;
    let _e223 = u_xlat0_;
    let _e228 = _v_buffer0_.v_cb0_[69];
    let _e230 = u_xlat0_;
    let _e233 = u_xlat0_;
    let _e235 = ((_e228.xy * _e230.zz) + _e233.xy);
    u_xlat0_.x = _e235.x;
    u_xlat0_.y = _e235.y;
    let _e240 = vs_TEXCOORD5_;
    let _e242 = u_xlat0_;
    let _e251 = ((_e242.xy * vec2<f32>(0.499f, 0.499f)) + vec2<f32>(0.5f, 0.5f));
    vs_TEXCOORD5_.x = _e251.x;
    vs_TEXCOORD5_.y = _e251.y;
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(5) in_TEXCOORD1_: vec2<f32>, @location(1) in_NORMAL0_: vec3<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_TEXCOORD1_1 = in_TEXCOORD1_;
    in_NORMAL0_1 = in_NORMAL0_;
    main_1();
    let _e32 = vs_TEXCOORD0_;
    let _e34 = vs_TEXCOORD5_;
    let _e36 = vs_NORMAL0_;
    let _e38 = gl_Position;
    return VertexOutput(_e32, _e34, _e36, _e38);
}
