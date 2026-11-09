struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 4>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 13>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec2<f32>,
    @location(1) vs_TEXCOORD1_: f32,
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
var<private> vs_TEXCOORD1_: f32;
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
    u_xlat1_ = (_e52 + _e56);
    let _e62 = _v_buffer1_.v_cb1_[3];
    let _e64 = in_POSITION0_1;
    let _e67 = u_xlat0_;
    u_xlat0_.x = ((_e62.y * _e64.w) + _e67.y);
    let _e71 = u_xlat0_;
    let _e76 = _v_buffer2_.v_cb2_[12];
    u_xlat0_.x = (_e71.x + -(_e76.x));
    let _e80 = u_xlat0_;
    let _e85 = _v_buffer2_.v_cb2_[11];
    vs_TEXCOORD1_ = (_e80.x / _e85.w);
    let _e88 = u_xlat1_;
    let _e93 = _v_buffer0_.v_cb0_[80];
    u_xlat0_ = (_e88.yyyy * _e93);
    let _e98 = _v_buffer0_.v_cb0_[79];
    let _e99 = u_xlat1_;
    let _e102 = u_xlat0_;
    u_xlat0_ = ((_e98 * _e99.xxxx) + _e102);
    let _e107 = _v_buffer0_.v_cb0_[81];
    let _e108 = u_xlat1_;
    let _e111 = u_xlat0_;
    u_xlat0_ = ((_e107 * _e108.zzzz) + _e111);
    let _e117 = _v_buffer0_.v_cb0_[82];
    let _e118 = u_xlat1_;
    let _e121 = u_xlat0_;
    gl_Position = ((_e117 * _e118.wwww) + _e121);
    let _e123 = u_xlat0_;
    let _e125 = in_TEXCOORD0_1;
    let _e130 = _v_buffer2_.v_cb2_[1];
    let _e136 = _v_buffer2_.v_cb2_[1];
    let _e138 = ((_e125.xy * _e130.xy) + _e136.zw);
    u_xlat0_.x = _e138.x;
    u_xlat0_.y = _e138.y;
    let _e143 = u_xlat4_;
    let _e145 = u_xlat0_;
    let _e148 = u_xlat0_;
    let _e150 = (-(_e145.xy) + _e148.yx);
    u_xlat4_.x = _e150.x;
    u_xlat4_.y = _e150.y;
    let _e155 = vs_TEXCOORD0_;
    let _e160 = _v_buffer2_.v_cb2_[2];
    let _e162 = u_xlat4_;
    let _e165 = u_xlat0_;
    let _e167 = ((_e160.zz * _e162.xy) + _e165.xy);
    vs_TEXCOORD0_.x = _e167.x;
    vs_TEXCOORD0_.y = _e167.y;
    let _e172 = in_COLOR0_1;
    let _e176 = _v_buffer2_.v_cb2_[0];
    u_xlat0_ = (_e172 * _e176);
    let _e179 = u_xlat0_;
    let _e181 = u_xlat0_;
    u_xlat1_.x = max(_e179.y, _e181.x);
    let _e185 = u_xlat0_;
    let _e187 = u_xlat1_;
    u_xlat1_.x = max(_e185.z, _e187.x);
    let _e191 = u_xlat1_;
    u_xlat1_.x = ((_e191.x * 2f) + -1f);
    let _e199 = u_xlat1_;
    u_xlat1_.x = clamp(_e199.x, 0f, 1f);
    let _e205 = u_xlat1_;
    u_xlat1_.w = (-(_e205.x) + 1f);
    let _e210 = u_xlat1_;
    let _e212 = u_xlat0_;
    let _e214 = u_xlat0_;
    let _e216 = (_e212.xyz + _e214.xyz);
    u_xlat1_.x = _e216.x;
    u_xlat1_.y = _e216.y;
    u_xlat1_.z = _e216.z;
    let _e224 = u_xlat0_;
    let _e229 = _v_buffer2_.v_cb2_[2];
    u_xlat0_.x = (_e224.w * _e229.w);
    let _e232 = u_xlat0_;
    let _e234 = u_xlat1_;
    vs_COLOR0_ = (_e232.xxxx * _e234);
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
