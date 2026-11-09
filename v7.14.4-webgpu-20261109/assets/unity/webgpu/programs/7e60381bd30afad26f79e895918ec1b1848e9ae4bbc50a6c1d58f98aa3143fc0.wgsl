struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 30>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 7>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec2<f32>,
    @location(1) vs_TEXCOORD1_: vec2<f32>,
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
var<private> vs_TEXCOORD1_: vec2<f32>;
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
    let _e103 = _v_buffer2_.v_cb2_[0];
    let _e105 = (_e98.xx * _e103.xy);
    u_xlat0_.x = _e105.x;
    u_xlat0_.y = _e105.y;
    let _e110 = u_xlat4_;
    let _e112 = in_TEXCOORD0_1;
    let _e117 = _v_buffer2_.v_cb2_[3];
    let _e123 = _v_buffer2_.v_cb2_[3];
    let _e125 = ((_e112.xy * _e117.xy) + _e123.zw);
    u_xlat4_.x = _e125.x;
    u_xlat4_.y = _e125.y;
    let _e130 = vs_TEXCOORD0_;
    let _e132 = u_xlat4_;
    let _e137 = _v_buffer2_.v_cb2_[0];
    let _e140 = u_xlat0_;
    let _e142 = ((_e132.xy * _e137.zw) + _e140.xy);
    vs_TEXCOORD0_.x = _e142.x;
    vs_TEXCOORD0_.y = _e142.y;
    let _e147 = u_xlat0_;
    let _e152 = _v_buffer0_.v_cb0_[15];
    let _e157 = _v_buffer2_.v_cb2_[1];
    let _e159 = (_e152.xx * _e157.yz);
    u_xlat0_.x = _e159.x;
    u_xlat0_.y = _e159.y;
    let _e164 = vs_TEXCOORD1_;
    let _e166 = u_xlat4_;
    let _e171 = _v_buffer2_.v_cb2_[1];
    let _e174 = u_xlat0_;
    let _e176 = ((_e166.xy * _e171.ww) + _e174.xy);
    vs_TEXCOORD1_.x = _e176.x;
    vs_TEXCOORD1_.y = _e176.y;
    let _e185 = _v_buffer1_.v_cb1_[27];
    u_xlat0_.x = abs(_e185.w);
    let _e192 = _v_buffer1_.v_cb1_[28];
    u_xlat0_.y = abs(_e192.w);
    let _e199 = _v_buffer1_.v_cb1_[29];
    u_xlat0_.z = abs(_e199.w);
    let _e202 = u_xlat0_;
    let _e204 = u_xlat0_;
    let _e206 = log2(_e204.xyz);
    u_xlat0_.x = _e206.x;
    u_xlat0_.y = _e206.y;
    u_xlat0_.z = _e206.z;
    let _e213 = u_xlat0_;
    let _e215 = u_xlat0_;
    let _e221 = (_e215.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat0_.x = _e221.x;
    u_xlat0_.y = _e221.y;
    u_xlat0_.z = _e221.z;
    let _e228 = u_xlat0_;
    let _e230 = u_xlat0_;
    let _e232 = exp2(_e230.xyz);
    u_xlat0_.x = _e232.x;
    u_xlat0_.y = _e232.y;
    u_xlat0_.z = _e232.z;
    let _e239 = u_xlat0_;
    let _e241 = u_xlat0_;
    let _e255 = ((_e241.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat0_.x = _e255.x;
    u_xlat0_.y = _e255.y;
    u_xlat0_.z = _e255.z;
    let _e262 = u_xlat0_;
    let _e264 = u_xlat0_;
    let _e270 = clamp(_e264.xyz, vec3(0f), vec3(1f));
    u_xlat0_.x = _e270.x;
    u_xlat0_.y = _e270.y;
    u_xlat0_.z = _e270.z;
    let _e277 = u_xlat0_;
    let _e279 = u_xlat0_;
    let _e284 = _v_buffer0_.v_cb0_[6];
    let _e286 = (_e279.xyz + _e284.xyz);
    u_xlat0_.x = _e286.x;
    u_xlat0_.y = _e286.y;
    u_xlat0_.z = _e286.z;
    let _e293 = u_xlat0_;
    let _e295 = u_xlat0_;
    let _e304 = (_e295.xyz + vec3<f32>(-1f, -1f, -1f));
    u_xlat0_.x = _e304.x;
    u_xlat0_.y = _e304.y;
    u_xlat0_.z = _e304.z;
    u_xlat0_.w = 0f;
    let _e316 = _v_buffer2_.v_cb2_[6];
    let _e318 = u_xlat0_;
    u_xlat0_ = ((_e316.xxxx * _e318) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e326 = u_xlat0_;
    let _e327 = in_COLOR0_1;
    u_xlat0_ = (_e326 * _e327);
    let _e329 = u_xlat0_;
    let _e333 = _v_buffer2_.v_cb2_[1];
    u_xlat0_ = (_e329 * _e333.xxxx);
    let _e336 = u_xlat0_;
    let _e337 = u_xlat0_;
    vs_COLOR0_ = (_e336 + _e337);
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
