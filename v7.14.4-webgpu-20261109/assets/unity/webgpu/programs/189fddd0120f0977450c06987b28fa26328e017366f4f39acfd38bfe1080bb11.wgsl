struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 4>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 3>,
}

struct VertexOutput {
    @location(10) vs_COLOR0_: vec4<f32>,
    @location(0) vs_TEXCOORD0_: vec4<f32>,
    @location(1) vs_TEXCOORD1_: vec4<f32>,
    @location(2) vs_TEXCOORD2_: vec4<f32>,
    @location(3) vs_TEXCOORD3_: vec4<f32>,
    @builtin(position) gl_Position: vec4<f32>,
}

@group(0) @binding(0) 
var<uniform> _v_buffer0_: v_buffer0_;
@group(0) @binding(1) 
var<uniform> _v_buffer1_: v_buffer1_;
@group(0) @binding(2) 
var<uniform> _v_buffer2_: v_buffer2_;
var<private> in_POSITION0_1: vec4<f32>;
var<private> in_COLOR0_1: vec4<f32>;
var<private> in_TEXCOORD0_1: vec2<f32>;
var<private> vs_COLOR0_: vec4<f32>;
var<private> vs_TEXCOORD0_: vec4<f32>;
var<private> vs_TEXCOORD1_: vec4<f32>;
var<private> vs_TEXCOORD2_: vec4<f32>;
var<private> vs_TEXCOORD3_: vec4<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);

    let _e25 = in_POSITION0_1;
    let _e30 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e25.yyyy * _e30);
    let _e35 = _v_buffer1_.v_cb1_[0];
    let _e36 = in_POSITION0_1;
    let _e39 = u_xlat0_;
    u_xlat0_ = ((_e35 * _e36.xxxx) + _e39);
    let _e44 = _v_buffer1_.v_cb1_[2];
    let _e45 = in_POSITION0_1;
    let _e48 = u_xlat0_;
    u_xlat0_ = ((_e44 * _e45.zzzz) + _e48);
    let _e50 = u_xlat0_;
    let _e54 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e50 + _e54);
    let _e56 = u_xlat0_;
    let _e61 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e56.yyyy * _e61);
    let _e66 = _v_buffer0_.v_cb0_[79];
    let _e67 = u_xlat0_;
    let _e70 = u_xlat1_;
    u_xlat1_ = ((_e66 * _e67.xxxx) + _e70);
    let _e75 = _v_buffer0_.v_cb0_[81];
    let _e76 = u_xlat0_;
    let _e79 = u_xlat1_;
    u_xlat1_ = ((_e75 * _e76.zzzz) + _e79);
    let _e85 = _v_buffer0_.v_cb0_[82];
    let _e86 = u_xlat0_;
    let _e89 = u_xlat1_;
    gl_Position = ((_e85 * _e86.wwww) + _e89);
    let _e91 = in_COLOR0_1;
    let _e95 = _v_buffer2_.v_cb2_[1];
    vs_COLOR0_ = (_e91 * _e95);
    let _e97 = u_xlat0_;
    let _e102 = _v_buffer2_.v_cb2_[2];
    let _e108 = in_TEXCOORD0_1;
    let _e110 = ((_e102.xy * vec2<f32>(0.6f, 0.6f)) + _e108.xy);
    u_xlat0_.x = _e110.x;
    u_xlat0_.y = _e110.y;
    let _e115 = vs_TEXCOORD0_;
    let _e117 = u_xlat0_;
    let _e122 = _v_buffer2_.v_cb2_[0];
    let _e128 = _v_buffer2_.v_cb2_[0];
    let _e130 = ((_e117.xy * _e122.xy) + _e128.zw);
    vs_TEXCOORD0_.x = _e130.x;
    vs_TEXCOORD0_.y = _e130.y;
    let _e135 = u_xlat0_;
    let _e140 = _v_buffer2_.v_cb2_[2];
    let _e147 = in_TEXCOORD0_1;
    let _e149 = ((-(_e140.xy) * vec2<f32>(0.6f, 0.6f)) + _e147.xy);
    u_xlat0_.z = _e149.x;
    u_xlat0_.w = _e149.y;
    let _e154 = vs_TEXCOORD0_;
    let _e156 = u_xlat0_;
    let _e161 = _v_buffer2_.v_cb2_[0];
    let _e167 = _v_buffer2_.v_cb2_[0];
    let _e169 = ((_e156.zw * _e161.xy) + _e167.zw);
    vs_TEXCOORD0_.z = _e169.x;
    vs_TEXCOORD0_.w = _e169.y;
    let _e174 = vs_TEXCOORD1_;
    let _e176 = u_xlat0_;
    let _e181 = _v_buffer2_.v_cb2_[0];
    let _e187 = _v_buffer2_.v_cb2_[0];
    let _e189 = ((_e176.xw * _e181.xy) + _e187.zw);
    vs_TEXCOORD1_.x = _e189.x;
    vs_TEXCOORD1_.y = _e189.y;
    let _e194 = vs_TEXCOORD1_;
    let _e196 = u_xlat0_;
    let _e201 = _v_buffer2_.v_cb2_[0];
    let _e207 = _v_buffer2_.v_cb2_[0];
    let _e209 = ((_e196.zy * _e201.xy) + _e207.zw);
    vs_TEXCOORD1_.z = _e209.x;
    vs_TEXCOORD1_.w = _e209.y;
    let _e214 = u_xlat0_;
    let _e216 = in_TEXCOORD0_1;
    let _e221 = _v_buffer2_.v_cb2_[2];
    let _e223 = (_e216.yx + _e221.yx);
    u_xlat0_.x = _e223.x;
    u_xlat0_.y = _e223.y;
    let _e228 = u_xlat0_;
    let _e230 = in_TEXCOORD0_1;
    let _e231 = _e230.xy;
    u_xlat0_.z = _e231.x;
    u_xlat0_.w = _e231.y;
    let _e236 = vs_TEXCOORD2_;
    let _e238 = u_xlat0_;
    let _e243 = _v_buffer2_.v_cb2_[0];
    let _e249 = _v_buffer2_.v_cb2_[0];
    let _e251 = ((_e238.zx * _e243.xy) + _e249.zw);
    vs_TEXCOORD2_.x = _e251.x;
    vs_TEXCOORD2_.y = _e251.y;
    let _e256 = vs_TEXCOORD3_;
    let _e258 = u_xlat0_;
    let _e263 = _v_buffer2_.v_cb2_[0];
    let _e269 = _v_buffer2_.v_cb2_[0];
    let _e271 = ((_e258.yw * _e263.xy) + _e269.zw);
    vs_TEXCOORD3_.x = _e271.x;
    vs_TEXCOORD3_.y = _e271.y;
    let _e276 = u_xlat0_;
    let _e278 = in_TEXCOORD0_1;
    let _e283 = _v_buffer2_.v_cb2_[2];
    let _e286 = (_e278.yx + -(_e283.yx));
    u_xlat0_.x = _e286.x;
    u_xlat0_.y = _e286.y;
    let _e291 = u_xlat0_;
    let _e293 = in_TEXCOORD0_1;
    let _e294 = _e293.xy;
    u_xlat0_.z = _e294.x;
    u_xlat0_.w = _e294.y;
    let _e299 = vs_TEXCOORD2_;
    let _e301 = u_xlat0_;
    let _e306 = _v_buffer2_.v_cb2_[0];
    let _e312 = _v_buffer2_.v_cb2_[0];
    let _e314 = ((_e301.zx * _e306.xy) + _e312.zw);
    vs_TEXCOORD2_.z = _e314.x;
    vs_TEXCOORD2_.w = _e314.y;
    let _e319 = vs_TEXCOORD3_;
    let _e321 = u_xlat0_;
    let _e326 = _v_buffer2_.v_cb2_[0];
    let _e332 = _v_buffer2_.v_cb2_[0];
    let _e334 = ((_e321.yw * _e326.xy) + _e332.zw);
    vs_TEXCOORD3_.z = _e334.x;
    vs_TEXCOORD3_.w = _e334.y;
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(3) in_COLOR0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_COLOR0_1 = in_COLOR0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    main_1();
    let _e32 = vs_COLOR0_;
    let _e34 = vs_TEXCOORD0_;
    let _e36 = vs_TEXCOORD1_;
    let _e38 = vs_TEXCOORD2_;
    let _e40 = vs_TEXCOORD3_;
    let _e42 = gl_Position;
    return VertexOutput(_e32, _e34, _e36, _e38, _e40, _e42);
}
