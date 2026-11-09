struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 4>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 9>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec4<f32>,
    @location(11) vs_COLOR1_: vec4<f32>,
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
var<private> vs_COLOR1_: vec4<f32>;
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
    let _e115 = u_xlat0_;
    let _e118 = u_xlat0_;
    let _e120 = (-(_e115.xy) + _e118.yx);
    u_xlat4_.x = _e120.x;
    u_xlat4_.y = _e120.y;
    let _e125 = u_xlat0_;
    let _e130 = _v_buffer2_.v_cb2_[6];
    let _e132 = u_xlat4_;
    let _e135 = u_xlat0_;
    let _e137 = ((_e130.yy * _e132.xy) + _e135.xy);
    u_xlat0_.x = _e137.x;
    u_xlat0_.y = _e137.y;
    let _e142 = u_xlat4_;
    let _e147 = _v_buffer0_.v_cb0_[15];
    let _e152 = _v_buffer2_.v_cb2_[5];
    let _e154 = (_e147.zz * _e152.xy);
    u_xlat4_.x = _e154.x;
    u_xlat4_.y = _e154.y;
    let _e159 = u_xlat4_;
    let _e161 = u_xlat4_;
    let _e163 = fract(_e161.xy);
    u_xlat4_.x = _e163.x;
    u_xlat4_.y = _e163.y;
    let _e168 = vs_TEXCOORD0_;
    let _e170 = u_xlat4_;
    let _e172 = u_xlat0_;
    let _e174 = (_e170.xy + _e172.xy);
    vs_TEXCOORD0_.z = _e174.x;
    vs_TEXCOORD0_.w = _e174.y;
    let _e179 = u_xlat0_;
    let _e181 = in_TEXCOORD0_1;
    let _e186 = _v_buffer2_.v_cb2_[1];
    let _e192 = _v_buffer2_.v_cb2_[1];
    let _e194 = ((_e181.xy * _e186.xy) + _e192.zw);
    u_xlat0_.x = _e194.x;
    u_xlat0_.y = _e194.y;
    let _e199 = u_xlat4_;
    let _e201 = u_xlat0_;
    let _e204 = u_xlat0_;
    let _e206 = (-(_e201.xy) + _e204.yx);
    u_xlat4_.x = _e206.x;
    u_xlat4_.y = _e206.y;
    let _e211 = vs_TEXCOORD0_;
    let _e216 = _v_buffer2_.v_cb2_[2];
    let _e218 = u_xlat4_;
    let _e221 = u_xlat0_;
    let _e223 = ((_e216.zz * _e218.xy) + _e221.xy);
    vs_TEXCOORD0_.x = _e223.x;
    vs_TEXCOORD0_.y = _e223.y;
    let _e228 = in_COLOR0_1;
    let _e232 = _v_buffer2_.v_cb2_[7];
    u_xlat0_ = (_e228 * _e232);
    let _e235 = u_xlat0_;
    let _e237 = u_xlat0_;
    u_xlat1_.x = max(_e235.y, _e237.x);
    let _e241 = u_xlat0_;
    let _e243 = u_xlat1_;
    u_xlat1_.x = max(_e241.z, _e243.x);
    let _e247 = u_xlat1_;
    u_xlat1_.x = ((_e247.x * 2f) + -1f);
    let _e255 = u_xlat1_;
    u_xlat1_.x = clamp(_e255.x, 0f, 1f);
    let _e261 = u_xlat1_;
    u_xlat1_.w = (-(_e261.x) + 1f);
    let _e266 = u_xlat0_;
    let _e268 = u_xlat0_;
    let _e270 = u_xlat0_;
    let _e272 = (_e268.xyz + _e270.xyz);
    u_xlat0_.x = _e272.x;
    u_xlat0_.y = _e272.y;
    u_xlat0_.z = _e272.z;
    let _e279 = u_xlat1_;
    let _e281 = u_xlat0_;
    let _e286 = _v_buffer2_.v_cb2_[8];
    let _e288 = (_e281.xyz * _e286.xxx);
    u_xlat1_.x = _e288.x;
    u_xlat1_.y = _e288.y;
    u_xlat1_.z = _e288.z;
    let _e295 = u_xlat0_;
    let _e297 = u_xlat1_;
    vs_COLOR1_ = (_e295.wwww * _e297);
    let _e299 = in_COLOR0_1;
    let _e303 = _v_buffer2_.v_cb2_[0];
    u_xlat0_ = (_e299 * _e303);
    let _e306 = u_xlat0_;
    let _e308 = u_xlat0_;
    u_xlat1_.x = max(_e306.y, _e308.x);
    let _e312 = u_xlat0_;
    let _e314 = u_xlat1_;
    u_xlat1_.x = max(_e312.z, _e314.x);
    let _e318 = u_xlat1_;
    u_xlat1_.x = ((_e318.x * 2f) + -1f);
    let _e326 = u_xlat1_;
    u_xlat1_.x = clamp(_e326.x, 0f, 1f);
    let _e332 = u_xlat1_;
    u_xlat1_.w = (-(_e332.x) + 1f);
    let _e337 = u_xlat1_;
    let _e339 = u_xlat0_;
    let _e341 = u_xlat0_;
    let _e343 = (_e339.xyz + _e341.xyz);
    u_xlat1_.x = _e343.x;
    u_xlat1_.y = _e343.y;
    u_xlat1_.z = _e343.z;
    let _e351 = u_xlat0_;
    let _e356 = _v_buffer2_.v_cb2_[2];
    u_xlat0_.x = (_e351.w * _e356.w);
    let _e359 = u_xlat0_;
    let _e361 = u_xlat1_;
    vs_COLOR0_ = (_e359.xxxx * _e361);
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(3) in_COLOR0_: vec4<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_COLOR0_1 = in_COLOR0_;
    main_1();
    let _e28 = vs_TEXCOORD0_;
    let _e30 = vs_COLOR1_;
    let _e32 = vs_COLOR0_;
    let _e34 = gl_Position;
    return VertexOutput(_e28, _e30, _e32, _e34);
}
