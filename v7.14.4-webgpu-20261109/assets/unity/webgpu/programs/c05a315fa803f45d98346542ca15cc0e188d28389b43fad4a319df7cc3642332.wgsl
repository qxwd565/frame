struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 30>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 10>,
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
    let _e98 = _v_buffer0_.v_cb0_[15];
    let _e103 = _v_buffer2_.v_cb2_[1];
    let _e105 = (_e98.xx * _e103.xy);
    u_xlat0_.x = _e105.x;
    u_xlat0_.y = _e105.y;
    let _e110 = u_xlat4_;
    let _e112 = in_TEXCOORD0_1;
    let _e119 = (_e112.xy + vec2<f32>(-0.5f, -0.5f));
    u_xlat4_.x = _e119.x;
    u_xlat4_.y = _e119.y;
    let _e124 = u_xlat0_;
    let _e126 = u_xlat4_;
    let _e131 = _v_buffer2_.v_cb2_[1];
    let _e134 = u_xlat0_;
    let _e136 = ((_e126.xy * _e131.zw) + _e134.xy);
    u_xlat0_.x = _e136.x;
    u_xlat0_.y = _e136.y;
    let _e141 = vs_TEXCOORD0_;
    let _e143 = u_xlat0_;
    let _e148 = (_e143.xy + vec2<f32>(0.5f, 0.5f));
    vs_TEXCOORD0_.x = _e148.x;
    vs_TEXCOORD0_.y = _e148.y;
    let _e153 = u_xlat0_;
    let _e158 = _v_buffer0_.v_cb0_[15];
    let _e163 = _v_buffer2_.v_cb2_[2];
    let _e165 = (_e158.xx * _e163.yz);
    u_xlat0_.x = _e165.x;
    u_xlat0_.y = _e165.y;
    let _e171 = u_xlat4_;
    let _e176 = _v_buffer2_.v_cb2_[2];
    let _e179 = u_xlat0_;
    u_xlat1_.x = ((_e171.x * _e176.w) + _e179.x);
    let _e183 = u_xlat4_;
    let _e188 = _v_buffer2_.v_cb2_[3];
    let _e191 = u_xlat0_;
    u_xlat1_.y = ((_e183.y * _e188.x) + _e191.y);
    let _e194 = vs_TEXCOORD1_;
    let _e196 = u_xlat1_;
    let _e201 = (_e196.xy + vec2<f32>(0.5f, 0.5f));
    vs_TEXCOORD1_.x = _e201.x;
    vs_TEXCOORD1_.y = _e201.y;
    let _e206 = u_xlat0_;
    let _e211 = _v_buffer0_.v_cb0_[15];
    let _e216 = _v_buffer2_.v_cb2_[6];
    let _e218 = (_e211.xx * _e216.xy);
    u_xlat0_.x = _e218.x;
    u_xlat0_.y = _e218.y;
    let _e223 = u_xlat0_;
    let _e225 = u_xlat4_;
    let _e230 = _v_buffer2_.v_cb2_[6];
    let _e233 = u_xlat0_;
    let _e235 = ((_e225.xy * _e230.zw) + _e233.xy);
    u_xlat0_.x = _e235.x;
    u_xlat0_.y = _e235.y;
    let _e240 = vs_TEXCOORD1_;
    let _e242 = u_xlat0_;
    let _e247 = (_e242.xy + vec2<f32>(0.5f, 0.5f));
    vs_TEXCOORD1_.z = _e247.x;
    vs_TEXCOORD1_.w = _e247.y;
    let _e256 = _v_buffer1_.v_cb1_[27];
    u_xlat0_.x = abs(_e256.w);
    let _e263 = _v_buffer1_.v_cb1_[28];
    u_xlat0_.y = abs(_e263.w);
    let _e270 = _v_buffer1_.v_cb1_[29];
    u_xlat0_.z = abs(_e270.w);
    let _e273 = u_xlat0_;
    let _e275 = u_xlat0_;
    let _e277 = log2(_e275.xyz);
    u_xlat0_.x = _e277.x;
    u_xlat0_.y = _e277.y;
    u_xlat0_.z = _e277.z;
    let _e284 = u_xlat0_;
    let _e286 = u_xlat0_;
    let _e292 = (_e286.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat0_.x = _e292.x;
    u_xlat0_.y = _e292.y;
    u_xlat0_.z = _e292.z;
    let _e299 = u_xlat0_;
    let _e301 = u_xlat0_;
    let _e303 = exp2(_e301.xyz);
    u_xlat0_.x = _e303.x;
    u_xlat0_.y = _e303.y;
    u_xlat0_.z = _e303.z;
    let _e310 = u_xlat0_;
    let _e312 = u_xlat0_;
    let _e326 = ((_e312.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat0_.x = _e326.x;
    u_xlat0_.y = _e326.y;
    u_xlat0_.z = _e326.z;
    let _e333 = u_xlat0_;
    let _e335 = u_xlat0_;
    let _e341 = clamp(_e335.xyz, vec3(0f), vec3(1f));
    u_xlat0_.x = _e341.x;
    u_xlat0_.y = _e341.y;
    u_xlat0_.z = _e341.z;
    let _e348 = u_xlat0_;
    let _e350 = u_xlat0_;
    let _e355 = _v_buffer0_.v_cb0_[6];
    let _e357 = (_e350.xyz + _e355.xyz);
    u_xlat0_.x = _e357.x;
    u_xlat0_.y = _e357.y;
    u_xlat0_.z = _e357.z;
    let _e364 = u_xlat0_;
    let _e366 = u_xlat0_;
    let _e375 = (_e366.xyz + vec3<f32>(-1f, -1f, -1f));
    u_xlat0_.x = _e375.x;
    u_xlat0_.y = _e375.y;
    u_xlat0_.z = _e375.z;
    u_xlat0_.w = 0f;
    let _e387 = _v_buffer2_.v_cb2_[9];
    let _e389 = u_xlat0_;
    u_xlat0_ = ((_e387.zzzz * _e389) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e397 = u_xlat0_;
    let _e398 = in_COLOR0_1;
    vs_COLOR0_ = (_e397 * _e398);
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
