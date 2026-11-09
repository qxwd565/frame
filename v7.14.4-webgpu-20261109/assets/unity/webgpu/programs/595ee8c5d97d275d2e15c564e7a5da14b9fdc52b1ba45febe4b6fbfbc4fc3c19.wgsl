struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 4>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 12>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec4<f32>,
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
var<private> vs_TEXCOORD0_: vec4<f32>;
var<private> vs_COLOR0_: vec4<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat6_: vec2<f32> = vec2(0f);

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
    u_xlat1_ = (_e55 + _e59);
    let _e61 = u_xlat0_;
    let _e66 = _v_buffer1_.v_cb1_[3];
    let _e68 = in_POSITION0_1;
    let _e71 = u_xlat0_;
    let _e73 = ((_e66.xz * _e68.ww) + _e71.xz);
    u_xlat0_.x = _e73.x;
    u_xlat0_.y = _e73.y;
    let _e78 = u_xlat0_;
    let _e80 = u_xlat0_;
    let _e85 = _v_buffer2_.v_cb2_[4];
    let _e91 = _v_buffer2_.v_cb2_[4];
    let _e93 = ((_e80.xy * _e85.xy) + _e91.zw);
    u_xlat0_.x = _e93.x;
    u_xlat0_.y = _e93.y;
    let _e98 = u_xlat1_;
    let _e103 = _v_buffer0_.v_cb0_[80];
    u_xlat2_ = (_e98.yyyy * _e103);
    let _e108 = _v_buffer0_.v_cb0_[79];
    let _e109 = u_xlat1_;
    let _e112 = u_xlat2_;
    u_xlat2_ = ((_e108 * _e109.xxxx) + _e112);
    let _e117 = _v_buffer0_.v_cb0_[81];
    let _e118 = u_xlat1_;
    let _e121 = u_xlat2_;
    u_xlat2_ = ((_e117 * _e118.zzzz) + _e121);
    let _e127 = _v_buffer0_.v_cb0_[82];
    let _e128 = u_xlat1_;
    let _e131 = u_xlat2_;
    gl_Position = ((_e127 * _e128.wwww) + _e131);
    let _e133 = u_xlat6_;
    let _e135 = u_xlat0_;
    let _e138 = u_xlat0_;
    let _e140 = (-(_e135.xy) + _e138.yx);
    u_xlat6_.x = _e140.x;
    u_xlat6_.y = _e140.y;
    let _e145 = u_xlat0_;
    let _e150 = _v_buffer2_.v_cb2_[6];
    let _e152 = u_xlat6_;
    let _e155 = u_xlat0_;
    let _e157 = ((_e150.yy * _e152.xy) + _e155.xy);
    u_xlat0_.x = _e157.x;
    u_xlat0_.y = _e157.y;
    let _e162 = u_xlat6_;
    let _e167 = _v_buffer0_.v_cb0_[15];
    let _e172 = _v_buffer2_.v_cb2_[5];
    let _e174 = (_e167.zz * _e172.xy);
    u_xlat6_.x = _e174.x;
    u_xlat6_.y = _e174.y;
    let _e179 = u_xlat6_;
    let _e181 = u_xlat6_;
    let _e183 = fract(_e181.xy);
    u_xlat6_.x = _e183.x;
    u_xlat6_.y = _e183.y;
    let _e188 = vs_TEXCOORD0_;
    let _e190 = u_xlat6_;
    let _e192 = u_xlat0_;
    let _e194 = (_e190.xy + _e192.xy);
    vs_TEXCOORD0_.z = _e194.x;
    vs_TEXCOORD0_.w = _e194.y;
    let _e199 = u_xlat0_;
    let _e201 = in_TEXCOORD0_1;
    let _e206 = _v_buffer2_.v_cb2_[1];
    let _e212 = _v_buffer2_.v_cb2_[1];
    let _e214 = ((_e201.xy * _e206.xy) + _e212.zw);
    u_xlat0_.x = _e214.x;
    u_xlat0_.y = _e214.y;
    let _e219 = u_xlat6_;
    let _e221 = u_xlat0_;
    let _e224 = u_xlat0_;
    let _e226 = (-(_e221.xy) + _e224.yx);
    u_xlat6_.x = _e226.x;
    u_xlat6_.y = _e226.y;
    let _e231 = u_xlat0_;
    let _e236 = _v_buffer2_.v_cb2_[2];
    let _e238 = u_xlat6_;
    let _e241 = u_xlat0_;
    let _e243 = ((_e236.zz * _e238.xy) + _e241.xy);
    u_xlat0_.x = _e243.x;
    u_xlat0_.y = _e243.y;
    let _e248 = u_xlat6_;
    let _e253 = _v_buffer0_.v_cb0_[15];
    let _e258 = _v_buffer2_.v_cb2_[11];
    let _e260 = (_e253.zz * _e258.yz);
    u_xlat6_.x = _e260.x;
    u_xlat6_.y = _e260.y;
    let _e265 = u_xlat6_;
    let _e267 = u_xlat6_;
    let _e269 = fract(_e267.xy);
    u_xlat6_.x = _e269.x;
    u_xlat6_.y = _e269.y;
    let _e274 = vs_TEXCOORD0_;
    let _e276 = u_xlat6_;
    let _e278 = u_xlat0_;
    let _e280 = (_e276.xy + _e278.xy);
    vs_TEXCOORD0_.x = _e280.x;
    vs_TEXCOORD0_.y = _e280.y;
    let _e285 = in_COLOR0_1;
    let _e289 = _v_buffer2_.v_cb2_[0];
    u_xlat0_ = (_e285 * _e289);
    let _e292 = u_xlat0_;
    let _e294 = u_xlat0_;
    u_xlat1_.x = max(_e292.y, _e294.x);
    let _e298 = u_xlat0_;
    let _e300 = u_xlat1_;
    u_xlat1_.x = max(_e298.z, _e300.x);
    let _e304 = u_xlat1_;
    u_xlat1_.x = ((_e304.x * 2f) + -1f);
    let _e312 = u_xlat1_;
    u_xlat1_.x = clamp(_e312.x, 0f, 1f);
    let _e318 = u_xlat1_;
    u_xlat1_.w = (-(_e318.x) + 1f);
    let _e323 = u_xlat1_;
    let _e325 = u_xlat0_;
    let _e327 = u_xlat0_;
    let _e329 = (_e325.xyz + _e327.xyz);
    u_xlat1_.x = _e329.x;
    u_xlat1_.y = _e329.y;
    u_xlat1_.z = _e329.z;
    let _e337 = u_xlat0_;
    let _e342 = _v_buffer2_.v_cb2_[2];
    u_xlat0_.x = (_e337.w * _e342.w);
    let _e345 = u_xlat0_;
    let _e347 = u_xlat1_;
    vs_COLOR0_ = (_e345.xxxx * _e347);
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
