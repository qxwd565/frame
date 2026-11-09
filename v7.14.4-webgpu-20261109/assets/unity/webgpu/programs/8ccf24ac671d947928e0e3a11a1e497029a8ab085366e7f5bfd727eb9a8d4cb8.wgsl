struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 7>,
}

struct v_buffer2_ {
    v_cb2_: vec4<f32>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec2<f32>,
    @location(5) vs_TEXCOORD5_: vec2<f32>,
    @location(1) vs_TEXCOORD1_: vec3<f32>,
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
var<private> in_NORMAL0_1: vec3<f32>;
var<private> vs_TEXCOORD0_: vec2<f32>;
var<private> vs_TEXCOORD5_: vec2<f32>;
var<private> vs_TEXCOORD1_: vec3<f32>;
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
    let _e97 = vs_TEXCOORD1_;
    let _e99 = u_xlat0_;
    let _e100 = _e99.xyz;
    vs_TEXCOORD1_.x = _e100.x;
    vs_TEXCOORD1_.y = _e100.y;
    vs_TEXCOORD1_.z = _e100.z;
    let _e108 = in_NORMAL0_1;
    let _e113 = _v_buffer1_.v_cb1_[4];
    u_xlat0_.x = dot(_e108.xyz, _e113.xyz);
    let _e117 = in_NORMAL0_1;
    let _e122 = _v_buffer1_.v_cb1_[5];
    u_xlat0_.y = dot(_e117.xyz, _e122.xyz);
    let _e126 = in_NORMAL0_1;
    let _e131 = _v_buffer1_.v_cb1_[6];
    u_xlat0_.z = dot(_e126.xyz, _e131.xyz);
    let _e134 = u_xlat0_;
    let _e136 = u_xlat0_;
    u_xlat6_ = dot(_e134.xyz, _e136.xyz);
    let _e140 = u_xlat6_;
    u_xlat1_.x = inverseSqrt(_e140);
    let _e142 = u_xlat6_;
    u_xlat6_ = max(_e142, 0.000000000000000000000000000000000000011754944f);
    let _e145 = u_xlat6_;
    u_xlat6_ = inverseSqrt(_e145);
    let _e147 = vs_NORMAL0_;
    let _e149 = u_xlat6_;
    let _e151 = u_xlat0_;
    let _e153 = (vec3(_e149) * _e151.xyz);
    vs_NORMAL0_.x = _e153.x;
    vs_NORMAL0_.y = _e153.y;
    vs_NORMAL0_.z = _e153.z;
    let _e160 = u_xlat0_;
    let _e162 = u_xlat0_;
    let _e164 = u_xlat1_;
    let _e166 = (_e162.xyz * _e164.xxx);
    u_xlat0_.x = _e166.x;
    u_xlat0_.y = _e166.y;
    u_xlat0_.z = _e166.z;
    let _e173 = u_xlat2_;
    let _e175 = u_xlat0_;
    let _e180 = _v_buffer0_.v_cb0_[68];
    let _e182 = (_e175.yy * _e180.xy);
    u_xlat2_.x = _e182.x;
    u_xlat2_.z = _e182.y;
    let _e187 = u_xlat0_;
    let _e192 = _v_buffer0_.v_cb0_[67];
    let _e194 = u_xlat0_;
    let _e197 = u_xlat2_;
    let _e199 = ((_e192.xy * _e194.xx) + _e197.xz);
    u_xlat0_.x = _e199.x;
    u_xlat0_.y = _e199.y;
    let _e204 = u_xlat0_;
    let _e209 = _v_buffer0_.v_cb0_[69];
    let _e211 = u_xlat0_;
    let _e214 = u_xlat0_;
    let _e216 = ((_e209.xy * _e211.zz) + _e214.xy);
    u_xlat0_.x = _e216.x;
    u_xlat0_.y = _e216.y;
    let _e221 = vs_TEXCOORD5_;
    let _e223 = u_xlat0_;
    let _e232 = ((_e223.xy * vec2<f32>(0.499f, 0.499f)) + vec2<f32>(0.5f, 0.5f));
    vs_TEXCOORD5_.x = _e232.x;
    vs_TEXCOORD5_.y = _e232.y;
    let _e237 = vs_TEXCOORD0_;
    let _e239 = in_TEXCOORD0_1;
    let _e241 = _v_buffer2_;
    let _e245 = _v_buffer2_;
    let _e248 = ((_e239.xy * _e241.v_cb2_.xy) + _e245.v_cb2_.zw);
    vs_TEXCOORD0_.x = _e248.x;
    vs_TEXCOORD0_.y = _e248.y;
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(1) in_NORMAL0_: vec3<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_NORMAL0_1 = in_NORMAL0_;
    main_1();
    let _e30 = vs_TEXCOORD0_;
    let _e32 = vs_TEXCOORD5_;
    let _e34 = vs_TEXCOORD1_;
    let _e36 = vs_NORMAL0_;
    let _e38 = gl_Position;
    return VertexOutput(_e30, _e32, _e34, _e36, _e38);
}
