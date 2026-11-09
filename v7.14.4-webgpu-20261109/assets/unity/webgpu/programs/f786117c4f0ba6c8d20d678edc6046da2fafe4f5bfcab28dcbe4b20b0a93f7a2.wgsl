struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 4>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 14>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec4<f32>,
    @location(11) vs_COLOR1_: vec4<f32>,
    @location(10) vs_COLOR0_: vec4<f32>,
    @location(1) vs_TEXCOORD1_: f32,
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
var<private> vs_COLOR1_: vec4<f32>;
var<private> vs_COLOR0_: vec4<f32>;
var<private> vs_TEXCOORD1_: f32;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: f32 = 0f;
    var u_xlat4_: vec2<f32> = vec2(0f);

    let _e31 = in_POSITION0_1;
    let _e36 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e31.yyyy * _e36);
    let _e41 = _v_buffer1_.v_cb1_[0];
    let _e42 = in_POSITION0_1;
    let _e45 = u_xlat0_;
    u_xlat0_ = ((_e41 * _e42.xxxx) + _e45);
    let _e50 = _v_buffer1_.v_cb1_[2];
    let _e51 = in_POSITION0_1;
    let _e54 = u_xlat0_;
    u_xlat0_ = ((_e50 * _e51.zzzz) + _e54);
    let _e56 = u_xlat0_;
    let _e60 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e56 + _e60);
    let _e62 = u_xlat0_;
    let _e67 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e62.yyyy * _e67);
    let _e72 = _v_buffer0_.v_cb0_[79];
    let _e73 = u_xlat0_;
    let _e76 = u_xlat1_;
    u_xlat1_ = ((_e72 * _e73.xxxx) + _e76);
    let _e81 = _v_buffer0_.v_cb0_[81];
    let _e82 = u_xlat0_;
    let _e85 = u_xlat1_;
    u_xlat1_ = ((_e81 * _e82.zzzz) + _e85);
    let _e91 = _v_buffer0_.v_cb0_[82];
    let _e92 = u_xlat0_;
    let _e95 = u_xlat1_;
    gl_Position = ((_e91 * _e92.wwww) + _e95);
    let _e97 = u_xlat0_;
    let _e99 = in_TEXCOORD0_1;
    let _e104 = _v_buffer2_.v_cb2_[4];
    let _e110 = _v_buffer2_.v_cb2_[4];
    let _e112 = ((_e99.xy * _e104.xy) + _e110.zw);
    u_xlat0_.x = _e112.x;
    u_xlat0_.y = _e112.y;
    let _e117 = u_xlat4_;
    let _e119 = u_xlat0_;
    let _e122 = u_xlat0_;
    let _e124 = (-(_e119.xy) + _e122.yx);
    u_xlat4_.x = _e124.x;
    u_xlat4_.y = _e124.y;
    let _e129 = u_xlat0_;
    let _e134 = _v_buffer2_.v_cb2_[6];
    let _e136 = u_xlat4_;
    let _e139 = u_xlat0_;
    let _e141 = ((_e134.yy * _e136.xy) + _e139.xy);
    u_xlat0_.x = _e141.x;
    u_xlat0_.y = _e141.y;
    let _e146 = u_xlat4_;
    let _e151 = _v_buffer0_.v_cb0_[15];
    let _e156 = _v_buffer2_.v_cb2_[5];
    let _e158 = (_e151.zz * _e156.xy);
    u_xlat4_.x = _e158.x;
    u_xlat4_.y = _e158.y;
    let _e163 = u_xlat4_;
    let _e165 = u_xlat4_;
    let _e167 = fract(_e165.xy);
    u_xlat4_.x = _e167.x;
    u_xlat4_.y = _e167.y;
    let _e172 = vs_TEXCOORD0_;
    let _e174 = u_xlat4_;
    let _e176 = u_xlat0_;
    let _e178 = (_e174.xy + _e176.xy);
    vs_TEXCOORD0_.z = _e178.x;
    vs_TEXCOORD0_.w = _e178.y;
    let _e183 = u_xlat0_;
    let _e185 = in_TEXCOORD0_1;
    let _e190 = _v_buffer2_.v_cb2_[1];
    let _e196 = _v_buffer2_.v_cb2_[1];
    let _e198 = ((_e185.xy * _e190.xy) + _e196.zw);
    u_xlat0_.x = _e198.x;
    u_xlat0_.y = _e198.y;
    let _e203 = u_xlat4_;
    let _e205 = u_xlat0_;
    let _e208 = u_xlat0_;
    let _e210 = (-(_e205.xy) + _e208.yx);
    u_xlat4_.x = _e210.x;
    u_xlat4_.y = _e210.y;
    let _e215 = vs_TEXCOORD0_;
    let _e220 = _v_buffer2_.v_cb2_[2];
    let _e222 = u_xlat4_;
    let _e225 = u_xlat0_;
    let _e227 = ((_e220.zz * _e222.xy) + _e225.xy);
    vs_TEXCOORD0_.x = _e227.x;
    vs_TEXCOORD0_.y = _e227.y;
    let _e233 = in_COLOR0_1;
    let _e238 = _v_buffer2_.v_cb2_[13];
    vs_COLOR1_.w = max(_e233.w, _e238.x);
    let _e241 = vs_COLOR1_;
    vs_COLOR1_.x = 0f;
    vs_COLOR1_.y = 0f;
    vs_COLOR1_.z = 0f;
    let _e250 = u_xlat0_;
    let _e252 = in_COLOR0_1;
    let _e253 = _e252.xyz;
    u_xlat0_.x = _e253.x;
    u_xlat0_.y = _e253.y;
    u_xlat0_.z = _e253.z;
    u_xlat0_.w = 1f;
    let _e262 = u_xlat0_;
    let _e266 = _v_buffer2_.v_cb2_[0];
    u_xlat0_ = (_e262 * _e266);
    let _e269 = u_xlat0_;
    let _e271 = u_xlat0_;
    u_xlat1_.x = max(_e269.y, _e271.x);
    let _e275 = u_xlat0_;
    let _e277 = u_xlat1_;
    u_xlat1_.x = max(_e275.z, _e277.x);
    let _e281 = u_xlat1_;
    u_xlat1_.x = ((_e281.x * 2f) + -1f);
    let _e289 = u_xlat1_;
    u_xlat1_.x = clamp(_e289.x, 0f, 1f);
    let _e295 = u_xlat1_;
    u_xlat1_.w = (-(_e295.x) + 1f);
    let _e300 = u_xlat1_;
    let _e302 = u_xlat0_;
    let _e304 = u_xlat0_;
    let _e306 = (_e302.xyz + _e304.xyz);
    u_xlat1_.x = _e306.x;
    u_xlat1_.y = _e306.y;
    u_xlat1_.z = _e306.z;
    let _e314 = u_xlat0_;
    let _e319 = _v_buffer2_.v_cb2_[2];
    u_xlat0_.x = (_e314.w * _e319.w);
    let _e322 = u_xlat0_;
    let _e324 = u_xlat1_;
    vs_COLOR0_ = (_e322.xxxx * _e324);
    let _e327 = in_COLOR0_1;
    u_xlat0_.x = (-(_e327.w) + 1f);
    let _e333 = u_xlat0_;
    let _e338 = _v_buffer2_.v_cb2_[12];
    u_xlat0_.x = (_e333.x + -(_e338.w));
    let _e345 = _v_buffer2_.v_cb2_[12];
    u_xlat2_ = (_e345.y * 1.01f);
    let _e350 = u_xlat2_;
    let _e351 = u_xlat0_;
    u_xlat0_.x = max(_e350, _e351.x);
    let _e357 = _v_buffer2_.v_cb2_[12];
    u_xlat2_ = ((_e357.z * 2f) + 1f);
    let _e363 = u_xlat0_;
    let _e365 = u_xlat2_;
    let _e370 = _v_buffer2_.v_cb2_[12];
    vs_TEXCOORD1_ = ((_e363.x * _e365) + -(_e370.z));
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(3) in_COLOR0_: vec4<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_COLOR0_1 = in_COLOR0_;
    main_1();
    let _e30 = vs_TEXCOORD0_;
    let _e32 = vs_COLOR1_;
    let _e34 = vs_COLOR0_;
    let _e36 = vs_TEXCOORD1_;
    let _e38 = gl_Position;
    return VertexOutput(_e30, _e32, _e34, _e36, _e38);
}
