struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 30>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 11>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec2<f32>,
    @location(1) vs_TEXCOORD1_: vec4<f32>,
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
var<private> in_COLOR0_1: vec4<f32>;
var<private> vs_TEXCOORD0_: vec2<f32>;
var<private> vs_TEXCOORD1_: vec4<f32>;
var<private> vs_COLOR0_: vec4<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat4_: vec2<f32> = vec2(0f);

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
    let _e93 = u_xlat0_;
    let _e95 = in_TEXCOORD0_1;
    let _e100 = _v_buffer2_.v_cb2_[4];
    let _e106 = _v_buffer2_.v_cb2_[4];
    let _e108 = ((_e95.xy * _e100.xy) + _e106.zw);
    u_xlat0_.x = _e108.x;
    u_xlat0_.y = _e108.y;
    let _e113 = u_xlat4_;
    let _e118 = _v_buffer0_.v_cb0_[15];
    let _e123 = _v_buffer2_.v_cb2_[0];
    let _e125 = (_e118.xx * _e123.xy);
    u_xlat4_.x = _e125.x;
    u_xlat4_.y = _e125.y;
    let _e130 = vs_TEXCOORD0_;
    let _e132 = u_xlat0_;
    let _e137 = _v_buffer2_.v_cb2_[0];
    let _e140 = u_xlat4_;
    let _e142 = ((_e132.xy * _e137.zw) + _e140.xy);
    vs_TEXCOORD0_.x = _e142.x;
    vs_TEXCOORD0_.y = _e142.y;
    let _e147 = u_xlat0_;
    let _e149 = in_TEXCOORD0_1;
    let _e154 = _v_buffer2_.v_cb2_[5];
    let _e160 = _v_buffer2_.v_cb2_[5];
    let _e162 = ((_e149.xy * _e154.xy) + _e160.zw);
    u_xlat0_.x = _e162.x;
    u_xlat0_.y = _e162.y;
    let _e167 = u_xlat0_;
    let _e169 = u_xlat0_;
    let _e176 = (_e169.xy + vec2<f32>(-0.5f, -0.5f));
    u_xlat0_.x = _e176.x;
    u_xlat0_.y = _e176.y;
    let _e182 = u_xlat0_;
    let _e187 = _v_buffer2_.v_cb2_[1];
    u_xlat1_.x = (_e182.x * _e187.w);
    let _e191 = u_xlat0_;
    let _e196 = _v_buffer2_.v_cb2_[2];
    u_xlat1_.y = (_e191.y * _e196.x);
    let _e199 = u_xlat0_;
    let _e201 = u_xlat1_;
    let _e206 = (_e201.xy + vec2<f32>(0.5f, 0.5f));
    u_xlat0_.x = _e206.x;
    u_xlat0_.y = _e206.y;
    let _e211 = vs_TEXCOORD1_;
    let _e216 = _v_buffer0_.v_cb0_[15];
    let _e221 = _v_buffer2_.v_cb2_[1];
    let _e224 = u_xlat0_;
    let _e226 = ((_e216.xx * _e221.yz) + _e224.xy);
    vs_TEXCOORD1_.x = _e226.x;
    vs_TEXCOORD1_.y = _e226.y;
    let _e231 = u_xlat0_;
    let _e233 = in_TEXCOORD0_1;
    let _e238 = _v_buffer2_.v_cb2_[6];
    let _e244 = _v_buffer2_.v_cb2_[6];
    let _e246 = ((_e233.xy * _e238.xy) + _e244.zw);
    u_xlat0_.x = _e246.x;
    u_xlat0_.y = _e246.y;
    let _e251 = u_xlat0_;
    let _e253 = u_xlat0_;
    let _e260 = (_e253.xy + vec2<f32>(-0.5f, -0.5f));
    u_xlat0_.x = _e260.x;
    u_xlat0_.y = _e260.y;
    let _e265 = u_xlat0_;
    let _e267 = u_xlat0_;
    let _e272 = _v_buffer2_.v_cb2_[3];
    let _e278 = ((_e267.xy * _e272.xy) + vec2<f32>(0.5f, 0.5f));
    u_xlat0_.x = _e278.x;
    u_xlat0_.y = _e278.y;
    let _e283 = vs_TEXCOORD1_;
    let _e288 = _v_buffer0_.v_cb0_[15];
    let _e293 = _v_buffer2_.v_cb2_[2];
    let _e296 = u_xlat0_;
    let _e298 = ((_e288.xx * _e293.zw) + _e296.xy);
    vs_TEXCOORD1_.z = _e298.x;
    vs_TEXCOORD1_.w = _e298.y;
    let _e307 = _v_buffer1_.v_cb1_[27];
    u_xlat0_.x = abs(_e307.w);
    let _e314 = _v_buffer1_.v_cb1_[28];
    u_xlat0_.y = abs(_e314.w);
    let _e321 = _v_buffer1_.v_cb1_[29];
    u_xlat0_.z = abs(_e321.w);
    let _e324 = u_xlat0_;
    let _e326 = u_xlat0_;
    let _e328 = log2(_e326.xyz);
    u_xlat0_.x = _e328.x;
    u_xlat0_.y = _e328.y;
    u_xlat0_.z = _e328.z;
    let _e335 = u_xlat0_;
    let _e337 = u_xlat0_;
    let _e343 = (_e337.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat0_.x = _e343.x;
    u_xlat0_.y = _e343.y;
    u_xlat0_.z = _e343.z;
    let _e350 = u_xlat0_;
    let _e352 = u_xlat0_;
    let _e354 = exp2(_e352.xyz);
    u_xlat0_.x = _e354.x;
    u_xlat0_.y = _e354.y;
    u_xlat0_.z = _e354.z;
    let _e361 = u_xlat0_;
    let _e363 = u_xlat0_;
    let _e377 = ((_e363.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat0_.x = _e377.x;
    u_xlat0_.y = _e377.y;
    u_xlat0_.z = _e377.z;
    let _e384 = u_xlat0_;
    let _e386 = u_xlat0_;
    let _e392 = clamp(_e386.xyz, vec3(0f), vec3(1f));
    u_xlat0_.x = _e392.x;
    u_xlat0_.y = _e392.y;
    u_xlat0_.z = _e392.z;
    let _e399 = u_xlat0_;
    let _e401 = u_xlat0_;
    let _e406 = _v_buffer0_.v_cb0_[6];
    let _e408 = (_e401.xyz + _e406.xyz);
    u_xlat0_.x = _e408.x;
    u_xlat0_.y = _e408.y;
    u_xlat0_.z = _e408.z;
    let _e415 = u_xlat0_;
    let _e417 = u_xlat0_;
    let _e426 = (_e417.xyz + vec3<f32>(-1f, -1f, -1f));
    u_xlat0_.x = _e426.x;
    u_xlat0_.y = _e426.y;
    u_xlat0_.z = _e426.z;
    u_xlat0_.w = 0f;
    let _e438 = _v_buffer2_.v_cb2_[10];
    let _e440 = u_xlat0_;
    u_xlat0_ = ((_e438.xxxx * _e440) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e448 = u_xlat0_;
    let _e449 = in_COLOR0_1;
    u_xlat0_ = (_e448 * _e449);
    let _e451 = u_xlat0_;
    let _e455 = _v_buffer2_.v_cb2_[1];
    u_xlat0_ = (_e451 * _e455.xxxx);
    let _e458 = u_xlat0_;
    let _e462 = _v_buffer2_.v_cb2_[8];
    vs_COLOR0_ = (_e458 * _e462.wwww);
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(3) in_COLOR0_: vec4<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_COLOR0_1 = in_COLOR0_;
    main_1();
    let _e28 = vs_TEXCOORD0_;
    let _e30 = vs_TEXCOORD1_;
    let _e32 = vs_COLOR0_;
    let _e34 = gl_Position;
    return VertexOutput(_e28, _e30, _e32, _e34);
}
