struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 30>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 2>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec2<f32>,
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
var<private> in_POSITION0_1: vec4<f32>;
var<private> in_TEXCOORD0_1: vec2<f32>;
var<private> in_NORMAL0_1: vec3<f32>;
var<private> in_COLOR0_1: vec4<f32>;
var<private> vs_TEXCOORD0_: vec2<f32>;
var<private> vs_NORMAL0_: vec3<f32>;
var<private> vs_COLOR0_: vec4<f32>;
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
    let _e93 = vs_TEXCOORD0_;
    let _e95 = in_TEXCOORD0_1;
    let _e100 = _v_buffer2_.v_cb2_[0];
    let _e106 = _v_buffer2_.v_cb2_[0];
    let _e108 = ((_e95.xy * _e100.xy) + _e106.zw);
    vs_TEXCOORD0_.x = _e108.x;
    vs_TEXCOORD0_.y = _e108.y;
    let _e114 = in_NORMAL0_1;
    let _e119 = _v_buffer1_.v_cb1_[4];
    u_xlat0_.x = dot(_e114.xyz, _e119.xyz);
    let _e123 = in_NORMAL0_1;
    let _e128 = _v_buffer1_.v_cb1_[5];
    u_xlat0_.y = dot(_e123.xyz, _e128.xyz);
    let _e132 = in_NORMAL0_1;
    let _e137 = _v_buffer1_.v_cb1_[6];
    u_xlat0_.z = dot(_e132.xyz, _e137.xyz);
    let _e140 = u_xlat0_;
    let _e142 = u_xlat0_;
    u_xlat6_ = dot(_e140.xyz, _e142.xyz);
    let _e145 = u_xlat6_;
    u_xlat6_ = max(_e145, 0.000000000000000000000000000000000000011754944f);
    let _e148 = u_xlat6_;
    u_xlat6_ = inverseSqrt(_e148);
    let _e150 = vs_NORMAL0_;
    let _e152 = u_xlat6_;
    let _e154 = u_xlat0_;
    let _e156 = (vec3(_e152) * _e154.xyz);
    vs_NORMAL0_.x = _e156.x;
    vs_NORMAL0_.y = _e156.y;
    vs_NORMAL0_.z = _e156.z;
    let _e167 = _v_buffer1_.v_cb1_[27];
    u_xlat0_.x = abs(_e167.w);
    let _e174 = _v_buffer1_.v_cb1_[28];
    u_xlat0_.y = abs(_e174.w);
    let _e181 = _v_buffer1_.v_cb1_[29];
    u_xlat0_.z = abs(_e181.w);
    let _e184 = u_xlat0_;
    let _e186 = u_xlat0_;
    let _e188 = log2(_e186.xyz);
    u_xlat0_.x = _e188.x;
    u_xlat0_.y = _e188.y;
    u_xlat0_.z = _e188.z;
    let _e195 = u_xlat0_;
    let _e197 = u_xlat0_;
    let _e203 = (_e197.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat0_.x = _e203.x;
    u_xlat0_.y = _e203.y;
    u_xlat0_.z = _e203.z;
    let _e210 = u_xlat0_;
    let _e212 = u_xlat0_;
    let _e214 = exp2(_e212.xyz);
    u_xlat0_.x = _e214.x;
    u_xlat0_.y = _e214.y;
    u_xlat0_.z = _e214.z;
    let _e221 = u_xlat0_;
    let _e223 = u_xlat0_;
    let _e237 = ((_e223.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat0_.x = _e237.x;
    u_xlat0_.y = _e237.y;
    u_xlat0_.z = _e237.z;
    let _e244 = u_xlat0_;
    let _e246 = u_xlat0_;
    let _e252 = clamp(_e246.xyz, vec3(0f), vec3(1f));
    u_xlat0_.x = _e252.x;
    u_xlat0_.y = _e252.y;
    u_xlat0_.z = _e252.z;
    let _e259 = u_xlat0_;
    let _e261 = u_xlat0_;
    let _e266 = _v_buffer0_.v_cb0_[6];
    let _e268 = (_e261.xyz + _e266.xyz);
    u_xlat0_.x = _e268.x;
    u_xlat0_.y = _e268.y;
    u_xlat0_.z = _e268.z;
    u_xlat0_.w = 1f;
    let _e277 = u_xlat0_;
    let _e278 = in_COLOR0_1;
    u_xlat0_ = (_e277 + -(_e278));
    let _e284 = _v_buffer2_.v_cb2_[1];
    let _e286 = u_xlat0_;
    let _e288 = in_COLOR0_1;
    vs_COLOR0_ = ((_e284.wwww * _e286) + _e288);
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(1) in_NORMAL0_: vec3<f32>, @location(3) in_COLOR0_: vec4<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_NORMAL0_1 = in_NORMAL0_;
    in_COLOR0_1 = in_COLOR0_;
    main_1();
    let _e32 = vs_TEXCOORD0_;
    let _e34 = vs_NORMAL0_;
    let _e36 = vs_COLOR0_;
    let _e38 = gl_Position;
    return VertexOutput(_e32, _e34, _e36, _e38);
}
