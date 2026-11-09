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
    u_xlat1_ = (_e53 + _e57);
    let _e63 = _v_buffer1_.v_cb1_[3];
    let _e65 = in_POSITION0_1;
    let _e68 = u_xlat0_;
    u_xlat0_.x = ((_e63.y * _e65.w) + _e68.y);
    let _e72 = u_xlat0_;
    let _e77 = _v_buffer2_.v_cb2_[12];
    u_xlat0_.x = (_e72.x + -(_e77.x));
    let _e81 = u_xlat0_;
    let _e86 = _v_buffer2_.v_cb2_[11];
    vs_TEXCOORD1_ = (_e81.x / _e86.w);
    let _e89 = u_xlat1_;
    let _e94 = _v_buffer0_.v_cb0_[80];
    u_xlat0_ = (_e89.yyyy * _e94);
    let _e99 = _v_buffer0_.v_cb0_[79];
    let _e100 = u_xlat1_;
    let _e103 = u_xlat0_;
    u_xlat0_ = ((_e99 * _e100.xxxx) + _e103);
    let _e108 = _v_buffer0_.v_cb0_[81];
    let _e109 = u_xlat1_;
    let _e112 = u_xlat0_;
    u_xlat0_ = ((_e108 * _e109.zzzz) + _e112);
    let _e118 = _v_buffer0_.v_cb0_[82];
    let _e119 = u_xlat1_;
    let _e122 = u_xlat0_;
    gl_Position = ((_e118 * _e119.wwww) + _e122);
    let _e124 = u_xlat0_;
    let _e126 = in_TEXCOORD0_1;
    let _e131 = _v_buffer2_.v_cb2_[4];
    let _e137 = _v_buffer2_.v_cb2_[4];
    let _e139 = ((_e126.xy * _e131.xy) + _e137.zw);
    u_xlat0_.x = _e139.x;
    u_xlat0_.y = _e139.y;
    let _e144 = u_xlat4_;
    let _e146 = u_xlat0_;
    let _e149 = u_xlat0_;
    let _e151 = (-(_e146.xy) + _e149.yx);
    u_xlat4_.x = _e151.x;
    u_xlat4_.y = _e151.y;
    let _e156 = u_xlat0_;
    let _e161 = _v_buffer2_.v_cb2_[6];
    let _e163 = u_xlat4_;
    let _e166 = u_xlat0_;
    let _e168 = ((_e161.yy * _e163.xy) + _e166.xy);
    u_xlat0_.x = _e168.x;
    u_xlat0_.y = _e168.y;
    let _e173 = u_xlat4_;
    let _e178 = _v_buffer0_.v_cb0_[15];
    let _e183 = _v_buffer2_.v_cb2_[5];
    let _e185 = (_e178.zz * _e183.xy);
    u_xlat4_.x = _e185.x;
    u_xlat4_.y = _e185.y;
    let _e190 = u_xlat4_;
    let _e192 = u_xlat4_;
    let _e194 = fract(_e192.xy);
    u_xlat4_.x = _e194.x;
    u_xlat4_.y = _e194.y;
    let _e199 = vs_TEXCOORD0_;
    let _e201 = u_xlat4_;
    let _e203 = u_xlat0_;
    let _e205 = (_e201.xy + _e203.xy);
    vs_TEXCOORD0_.z = _e205.x;
    vs_TEXCOORD0_.w = _e205.y;
    let _e210 = u_xlat0_;
    let _e212 = in_TEXCOORD0_1;
    let _e217 = _v_buffer2_.v_cb2_[1];
    let _e223 = _v_buffer2_.v_cb2_[1];
    let _e225 = ((_e212.xy * _e217.xy) + _e223.zw);
    u_xlat0_.x = _e225.x;
    u_xlat0_.y = _e225.y;
    let _e230 = u_xlat4_;
    let _e232 = u_xlat0_;
    let _e235 = u_xlat0_;
    let _e237 = (-(_e232.xy) + _e235.yx);
    u_xlat4_.x = _e237.x;
    u_xlat4_.y = _e237.y;
    let _e242 = vs_TEXCOORD0_;
    let _e247 = _v_buffer2_.v_cb2_[2];
    let _e249 = u_xlat4_;
    let _e252 = u_xlat0_;
    let _e254 = ((_e247.zz * _e249.xy) + _e252.xy);
    vs_TEXCOORD0_.x = _e254.x;
    vs_TEXCOORD0_.y = _e254.y;
    let _e259 = in_COLOR0_1;
    let _e263 = _v_buffer2_.v_cb2_[7];
    u_xlat0_ = (_e259 * _e263);
    let _e266 = u_xlat0_;
    let _e268 = u_xlat0_;
    u_xlat1_.x = max(_e266.y, _e268.x);
    let _e272 = u_xlat0_;
    let _e274 = u_xlat1_;
    u_xlat1_.x = max(_e272.z, _e274.x);
    let _e278 = u_xlat1_;
    u_xlat1_.x = ((_e278.x * 2f) + -1f);
    let _e286 = u_xlat1_;
    u_xlat1_.x = clamp(_e286.x, 0f, 1f);
    let _e292 = u_xlat1_;
    u_xlat1_.w = (-(_e292.x) + 1f);
    let _e297 = u_xlat0_;
    let _e299 = u_xlat0_;
    let _e301 = u_xlat0_;
    let _e303 = (_e299.xyz + _e301.xyz);
    u_xlat0_.x = _e303.x;
    u_xlat0_.y = _e303.y;
    u_xlat0_.z = _e303.z;
    let _e310 = u_xlat1_;
    let _e312 = u_xlat0_;
    let _e317 = _v_buffer2_.v_cb2_[8];
    let _e319 = (_e312.xyz * _e317.xxx);
    u_xlat1_.x = _e319.x;
    u_xlat1_.y = _e319.y;
    u_xlat1_.z = _e319.z;
    let _e326 = u_xlat0_;
    let _e328 = u_xlat1_;
    vs_COLOR1_ = (_e326.wwww * _e328);
    let _e330 = in_COLOR0_1;
    let _e334 = _v_buffer2_.v_cb2_[0];
    u_xlat0_ = (_e330 * _e334);
    let _e337 = u_xlat0_;
    let _e339 = u_xlat0_;
    u_xlat1_.x = max(_e337.y, _e339.x);
    let _e343 = u_xlat0_;
    let _e345 = u_xlat1_;
    u_xlat1_.x = max(_e343.z, _e345.x);
    let _e349 = u_xlat1_;
    u_xlat1_.x = ((_e349.x * 2f) + -1f);
    let _e357 = u_xlat1_;
    u_xlat1_.x = clamp(_e357.x, 0f, 1f);
    let _e363 = u_xlat1_;
    u_xlat1_.w = (-(_e363.x) + 1f);
    let _e368 = u_xlat1_;
    let _e370 = u_xlat0_;
    let _e372 = u_xlat0_;
    let _e374 = (_e370.xyz + _e372.xyz);
    u_xlat1_.x = _e374.x;
    u_xlat1_.y = _e374.y;
    u_xlat1_.z = _e374.z;
    let _e382 = u_xlat0_;
    let _e387 = _v_buffer2_.v_cb2_[2];
    u_xlat0_.x = (_e382.w * _e387.w);
    let _e390 = u_xlat0_;
    let _e392 = u_xlat1_;
    vs_COLOR0_ = (_e390.xxxx * _e392);
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
