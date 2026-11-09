struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 7>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 4>,
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
    var u_xlat6_: f32 = 0f;

    let _e27 = in_POSITION0_1;
    let _e32 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e27.yyyy * _e32);
    let _e37 = _v_buffer1_.v_cb1_[0];
    let _e38 = in_POSITION0_1;
    let _e41 = u_xlat0_;
    u_xlat0_ = ((_e37 * _e38.xxxx) + _e41);
    let _e46 = _v_buffer1_.v_cb1_[2];
    let _e47 = in_POSITION0_1;
    let _e50 = u_xlat0_;
    u_xlat0_ = ((_e46 * _e47.zzzz) + _e50);
    let _e52 = u_xlat0_;
    let _e56 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e52 + _e56);
    let _e58 = u_xlat0_;
    let _e63 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e58.yyyy * _e63);
    let _e68 = _v_buffer0_.v_cb0_[79];
    let _e69 = u_xlat0_;
    let _e72 = u_xlat1_;
    u_xlat1_ = ((_e68 * _e69.xxxx) + _e72);
    let _e77 = _v_buffer0_.v_cb0_[81];
    let _e78 = u_xlat0_;
    let _e81 = u_xlat1_;
    u_xlat1_ = ((_e77 * _e78.zzzz) + _e81);
    let _e87 = _v_buffer0_.v_cb0_[82];
    let _e88 = u_xlat0_;
    let _e91 = u_xlat1_;
    gl_Position = ((_e87 * _e88.wwww) + _e91);
    let _e93 = vs_TEXCOORD1_;
    let _e95 = u_xlat0_;
    let _e96 = _e95.xyz;
    vs_TEXCOORD1_.x = _e96.x;
    vs_TEXCOORD1_.y = _e96.y;
    vs_TEXCOORD1_.z = _e96.z;
    let _e103 = u_xlat0_;
    let _e105 = in_TEXCOORD0_1;
    let _e112 = (_e105.xy + vec2<f32>(-0.5f, -0.5f));
    u_xlat0_.x = _e112.x;
    u_xlat0_.y = _e112.y;
    let _e117 = u_xlat0_;
    let _e119 = u_xlat0_;
    let _e124 = _v_buffer2_.v_cb2_[3];
    let _e130 = ((_e119.xy * _e124.yy) + vec2<f32>(0.5f, 0.5f));
    u_xlat0_.x = _e130.x;
    u_xlat0_.y = _e130.y;
    let _e135 = vs_TEXCOORD0_;
    let _e137 = u_xlat0_;
    let _e142 = _v_buffer2_.v_cb2_[0];
    let _e148 = _v_buffer2_.v_cb2_[0];
    let _e150 = ((_e137.xy * _e142.xy) + _e148.zw);
    vs_TEXCOORD0_.x = _e150.x;
    vs_TEXCOORD0_.y = _e150.y;
    let _e155 = vs_TEXCOORD5_;
    let _e157 = u_xlat0_;
    let _e162 = _v_buffer2_.v_cb2_[2];
    let _e168 = _v_buffer2_.v_cb2_[2];
    let _e170 = ((_e157.xy * _e162.xy) + _e168.zw);
    vs_TEXCOORD5_.x = _e170.x;
    vs_TEXCOORD5_.y = _e170.y;
    let _e176 = in_NORMAL0_1;
    let _e181 = _v_buffer1_.v_cb1_[4];
    u_xlat0_.x = dot(_e176.xyz, _e181.xyz);
    let _e185 = in_NORMAL0_1;
    let _e190 = _v_buffer1_.v_cb1_[5];
    u_xlat0_.y = dot(_e185.xyz, _e190.xyz);
    let _e194 = in_NORMAL0_1;
    let _e199 = _v_buffer1_.v_cb1_[6];
    u_xlat0_.z = dot(_e194.xyz, _e199.xyz);
    let _e202 = u_xlat0_;
    let _e204 = u_xlat0_;
    u_xlat6_ = dot(_e202.xyz, _e204.xyz);
    let _e207 = u_xlat6_;
    u_xlat6_ = max(_e207, 0.000000000000000000000000000000000000011754944f);
    let _e210 = u_xlat6_;
    u_xlat6_ = inverseSqrt(_e210);
    let _e212 = vs_NORMAL0_;
    let _e214 = u_xlat6_;
    let _e216 = u_xlat0_;
    let _e218 = (vec3(_e214) * _e216.xyz);
    vs_NORMAL0_.x = _e218.x;
    vs_NORMAL0_.y = _e218.y;
    vs_NORMAL0_.z = _e218.z;
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
