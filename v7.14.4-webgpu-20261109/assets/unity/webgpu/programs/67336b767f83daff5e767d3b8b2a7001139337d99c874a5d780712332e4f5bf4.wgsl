struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 4>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 20>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec2<f32>,
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
var<private> vs_COLOR0_: vec4<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec2<f32> = vec2(0f);
    var u_xlat4_: vec2<f32> = vec2(0f);

    let _e30 = in_POSITION0_1;
    let _e35 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e30.yyyy * _e35);
    let _e40 = _v_buffer1_.v_cb1_[0];
    let _e41 = in_POSITION0_1;
    let _e44 = u_xlat0_;
    u_xlat0_ = ((_e40 * _e41.xxxx) + _e44);
    let _e49 = _v_buffer1_.v_cb1_[2];
    let _e50 = in_POSITION0_1;
    let _e53 = u_xlat0_;
    u_xlat0_ = ((_e49 * _e50.zzzz) + _e53);
    let _e55 = u_xlat0_;
    let _e59 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e55 + _e59);
    let _e61 = u_xlat0_;
    let _e66 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e61.yyyy * _e66);
    let _e71 = _v_buffer0_.v_cb0_[79];
    let _e72 = u_xlat0_;
    let _e75 = u_xlat1_;
    u_xlat1_ = ((_e71 * _e72.xxxx) + _e75);
    let _e80 = _v_buffer0_.v_cb0_[81];
    let _e81 = u_xlat0_;
    let _e84 = u_xlat1_;
    u_xlat1_ = ((_e80 * _e81.zzzz) + _e84);
    let _e90 = _v_buffer0_.v_cb0_[82];
    let _e91 = u_xlat0_;
    let _e94 = u_xlat1_;
    gl_Position = ((_e90 * _e91.wwww) + _e94);
    let _e96 = u_xlat0_;
    let _e98 = in_TEXCOORD0_1;
    let _e103 = _v_buffer2_.v_cb2_[1];
    let _e109 = _v_buffer2_.v_cb2_[1];
    let _e111 = ((_e98.xy * _e103.xy) + _e109.zw);
    u_xlat0_.x = _e111.x;
    u_xlat0_.y = _e111.y;
    let _e116 = u_xlat4_;
    let _e118 = u_xlat0_;
    let _e121 = u_xlat0_;
    let _e123 = (-(_e118.xy) + _e121.yx);
    u_xlat4_.x = _e123.x;
    u_xlat4_.y = _e123.y;
    let _e128 = vs_TEXCOORD0_;
    let _e133 = _v_buffer2_.v_cb2_[2];
    let _e135 = u_xlat4_;
    let _e138 = u_xlat0_;
    let _e140 = ((_e133.zz * _e135.xy) + _e138.xy);
    vs_TEXCOORD0_.x = _e140.x;
    vs_TEXCOORD0_.y = _e140.y;
    let _e145 = u_xlat0_;
    let _e150 = _v_buffer2_.v_cb2_[19];
    let _e156 = _v_buffer2_.v_cb2_[19];
    let _e158 = (-(_e150.xz) + _e156.yw);
    u_xlat0_.x = _e158.x;
    u_xlat0_.y = _e158.y;
    let _e163 = u_xlat4_;
    let _e165 = in_TEXCOORD0_1;
    let _e170 = _v_buffer2_.v_cb2_[18];
    let _e176 = _v_buffer2_.v_cb2_[18];
    let _e178 = ((_e165.xy * _e170.xy) + _e176.zw);
    u_xlat4_.x = _e178.x;
    u_xlat4_.y = _e178.y;
    let _e183 = u_xlat0_;
    let _e185 = u_xlat4_;
    let _e187 = u_xlat0_;
    let _e193 = _v_buffer2_.v_cb2_[19];
    let _e195 = ((_e185.xx * _e187.xy) + _e193.xz);
    u_xlat0_.x = _e195.x;
    u_xlat0_.y = _e195.y;
    let _e201 = u_xlat0_;
    let _e204 = u_xlat0_;
    u_xlat2_.x = (-(_e201.x) + _e204.y);
    let _e208 = u_xlat4_;
    let _e210 = u_xlat2_;
    let _e213 = u_xlat0_;
    u_xlat0_.x = ((_e208.y * _e210.x) + _e213.x);
    let _e216 = u_xlat2_;
    let _e218 = u_xlat4_;
    let _e229 = ((_e218.xy * vec2<f32>(2f, 2f)) + vec2<f32>(-1f, -1f));
    u_xlat2_.x = _e229.x;
    u_xlat2_.y = _e229.y;
    let _e235 = u_xlat2_;
    let _e237 = u_xlat2_;
    u_xlat2_.x = dot(_e235.xy, _e237.xy);
    let _e241 = u_xlat2_;
    u_xlat2_.x = (-(_e241.x) + 1f);
    let _e247 = u_xlat2_;
    let _e252 = _v_buffer2_.v_cb2_[17];
    u_xlat2_.x = (_e247.x * _e252.x);
    let _e256 = u_xlat2_;
    u_xlat2_.x = clamp(_e256.x, 0f, 1f);
    let _e262 = u_xlat0_;
    let _e264 = u_xlat2_;
    u_xlat0_.x = (_e262.x * _e264.x);
    let _e268 = u_xlat0_;
    u_xlat0_.x = clamp(_e268.x, 0f, 1f);
    let _e274 = u_xlat0_;
    let _e276 = in_COLOR0_1;
    u_xlat0_.w = (_e274.x * _e276.w);
    let _e279 = u_xlat0_;
    let _e281 = in_COLOR0_1;
    let _e282 = _e281.xyz;
    u_xlat0_.x = _e282.x;
    u_xlat0_.y = _e282.y;
    u_xlat0_.z = _e282.z;
    let _e289 = u_xlat0_;
    let _e293 = _v_buffer2_.v_cb2_[0];
    u_xlat0_ = (_e289 * _e293);
    let _e296 = u_xlat0_;
    let _e298 = u_xlat0_;
    u_xlat1_.x = max(_e296.y, _e298.x);
    let _e302 = u_xlat0_;
    let _e304 = u_xlat1_;
    u_xlat1_.x = max(_e302.z, _e304.x);
    let _e308 = u_xlat1_;
    u_xlat1_.x = ((_e308.x * 2f) + -1f);
    let _e316 = u_xlat1_;
    u_xlat1_.x = clamp(_e316.x, 0f, 1f);
    let _e322 = u_xlat1_;
    u_xlat1_.w = (-(_e322.x) + 1f);
    let _e327 = u_xlat1_;
    let _e329 = u_xlat0_;
    let _e331 = u_xlat0_;
    let _e333 = (_e329.xyz + _e331.xyz);
    u_xlat1_.x = _e333.x;
    u_xlat1_.y = _e333.y;
    u_xlat1_.z = _e333.z;
    let _e341 = u_xlat0_;
    let _e346 = _v_buffer2_.v_cb2_[2];
    u_xlat0_.x = (_e341.w * _e346.w);
    let _e349 = u_xlat0_;
    let _e351 = u_xlat1_;
    vs_COLOR0_ = (_e349.xxxx * _e351);
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(3) in_COLOR0_: vec4<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_COLOR0_1 = in_COLOR0_;
    main_1();
    let _e26 = vs_TEXCOORD0_;
    let _e28 = vs_COLOR0_;
    let _e30 = gl_Position;
    return VertexOutput(_e26, _e28, _e30);
}
