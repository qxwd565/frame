struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 4>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 4>,
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
    var u_xlat4_: vec2<f32> = vec2(0f);

    let _e28 = in_POSITION0_1;
    let _e33 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e28.yyyy * _e33);
    let _e38 = _v_buffer1_.v_cb1_[0];
    let _e39 = in_POSITION0_1;
    let _e42 = u_xlat0_;
    u_xlat0_ = ((_e38 * _e39.xxxx) + _e42);
    let _e47 = _v_buffer1_.v_cb1_[2];
    let _e48 = in_POSITION0_1;
    let _e51 = u_xlat0_;
    u_xlat0_ = ((_e47 * _e48.zzzz) + _e51);
    let _e53 = u_xlat0_;
    let _e57 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e53 + _e57);
    let _e59 = u_xlat0_;
    let _e64 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e59.yyyy * _e64);
    let _e69 = _v_buffer0_.v_cb0_[79];
    let _e70 = u_xlat0_;
    let _e73 = u_xlat1_;
    u_xlat1_ = ((_e69 * _e70.xxxx) + _e73);
    let _e78 = _v_buffer0_.v_cb0_[81];
    let _e79 = u_xlat0_;
    let _e82 = u_xlat1_;
    u_xlat1_ = ((_e78 * _e79.zzzz) + _e82);
    let _e88 = _v_buffer0_.v_cb0_[82];
    let _e89 = u_xlat0_;
    let _e92 = u_xlat1_;
    gl_Position = ((_e88 * _e89.wwww) + _e92);
    let _e98 = _v_buffer2_.v_cb2_[1];
    let _e103 = _v_buffer2_.v_cb2_[2];
    vs_COLOR0_.w = (_e98.w * _e103.w);
    let _e106 = vs_COLOR0_;
    let _e111 = _v_buffer2_.v_cb2_[2];
    let _e112 = _e111.xyz;
    vs_COLOR0_.x = _e112.x;
    vs_COLOR0_.y = _e112.y;
    vs_COLOR0_.z = _e112.z;
    let _e119 = u_xlat0_;
    let _e124 = _v_buffer2_.v_cb2_[3];
    let _e130 = in_TEXCOORD0_1;
    let _e132 = ((_e124.xy * vec2<f32>(0.6f, 0.6f)) + _e130.xy);
    u_xlat0_.x = _e132.x;
    u_xlat0_.y = _e132.y;
    let _e137 = vs_TEXCOORD0_;
    let _e139 = u_xlat0_;
    let _e144 = _v_buffer2_.v_cb2_[0];
    let _e150 = _v_buffer2_.v_cb2_[0];
    let _e152 = ((_e139.xy * _e144.xy) + _e150.zw);
    vs_TEXCOORD0_.x = _e152.x;
    vs_TEXCOORD0_.y = _e152.y;
    let _e157 = u_xlat0_;
    let _e162 = _v_buffer2_.v_cb2_[3];
    let _e169 = in_TEXCOORD0_1;
    let _e171 = ((-(_e162.xy) * vec2<f32>(0.6f, 0.6f)) + _e169.xy);
    u_xlat0_.z = _e171.x;
    u_xlat0_.w = _e171.y;
    let _e176 = vs_TEXCOORD0_;
    let _e178 = u_xlat0_;
    let _e183 = _v_buffer2_.v_cb2_[0];
    let _e189 = _v_buffer2_.v_cb2_[0];
    let _e191 = ((_e178.zw * _e183.xy) + _e189.zw);
    vs_TEXCOORD0_.z = _e191.x;
    vs_TEXCOORD0_.w = _e191.y;
    let _e196 = vs_TEXCOORD1_;
    let _e198 = u_xlat0_;
    let _e203 = _v_buffer2_.v_cb2_[0];
    let _e209 = _v_buffer2_.v_cb2_[0];
    let _e211 = ((_e198.xw * _e203.xy) + _e209.zw);
    vs_TEXCOORD1_.x = _e211.x;
    vs_TEXCOORD1_.y = _e211.y;
    let _e216 = vs_TEXCOORD1_;
    let _e218 = u_xlat0_;
    let _e223 = _v_buffer2_.v_cb2_[0];
    let _e229 = _v_buffer2_.v_cb2_[0];
    let _e231 = ((_e218.zy * _e223.xy) + _e229.zw);
    vs_TEXCOORD1_.z = _e231.x;
    vs_TEXCOORD1_.w = _e231.y;
    let _e237 = in_TEXCOORD0_1;
    let _e242 = _v_buffer2_.v_cb2_[3];
    u_xlat4_.y = (_e237.y + -(_e242.y));
    let _e247 = in_TEXCOORD0_1;
    u_xlat4_.x = _e247.x;
    let _e249 = vs_TEXCOORD2_;
    let _e251 = u_xlat4_;
    let _e256 = _v_buffer2_.v_cb2_[0];
    let _e262 = _v_buffer2_.v_cb2_[0];
    let _e264 = ((_e251.xy * _e256.xy) + _e262.zw);
    vs_TEXCOORD2_.z = _e264.x;
    vs_TEXCOORD2_.w = _e264.y;
    let _e269 = u_xlat0_;
    let _e271 = in_TEXCOORD0_1;
    let _e276 = _v_buffer2_.v_cb2_[3];
    let _e278 = (_e271.yx + _e276.yx);
    u_xlat0_.x = _e278.x;
    u_xlat0_.y = _e278.y;
    let _e283 = u_xlat0_;
    let _e285 = in_TEXCOORD0_1;
    let _e286 = _e285.xy;
    u_xlat0_.z = _e286.x;
    u_xlat0_.w = _e286.y;
    let _e291 = vs_TEXCOORD2_;
    let _e293 = u_xlat0_;
    let _e298 = _v_buffer2_.v_cb2_[0];
    let _e304 = _v_buffer2_.v_cb2_[0];
    let _e306 = ((_e293.zx * _e298.xy) + _e304.zw);
    vs_TEXCOORD2_.x = _e306.x;
    vs_TEXCOORD2_.y = _e306.y;
    let _e311 = vs_TEXCOORD3_;
    let _e313 = u_xlat0_;
    let _e318 = _v_buffer2_.v_cb2_[0];
    let _e324 = _v_buffer2_.v_cb2_[0];
    let _e326 = ((_e313.yw * _e318.xy) + _e324.zw);
    vs_TEXCOORD3_.x = _e326.x;
    vs_TEXCOORD3_.y = _e326.y;
    let _e331 = vs_TEXCOORD3_;
    let _e333 = in_TEXCOORD0_1;
    let _e338 = _v_buffer2_.v_cb2_[0];
    let _e344 = _v_buffer2_.v_cb2_[0];
    let _e346 = ((_e333.xy * _e338.xy) + _e344.zw);
    vs_TEXCOORD3_.z = _e346.x;
    vs_TEXCOORD3_.w = _e346.y;
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    main_1();
    let _e28 = vs_COLOR0_;
    let _e30 = vs_TEXCOORD0_;
    let _e32 = vs_TEXCOORD1_;
    let _e34 = vs_TEXCOORD2_;
    let _e36 = vs_TEXCOORD3_;
    let _e38 = gl_Position;
    return VertexOutput(_e28, _e30, _e32, _e34, _e36, _e38);
}
