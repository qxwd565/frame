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
    let _e131 = _v_buffer2_.v_cb2_[1];
    let _e137 = _v_buffer2_.v_cb2_[1];
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
    let _e161 = _v_buffer2_.v_cb2_[2];
    let _e163 = u_xlat4_;
    let _e166 = u_xlat0_;
    let _e168 = ((_e161.zz * _e163.xy) + _e166.xy);
    u_xlat0_.x = _e168.x;
    u_xlat0_.y = _e168.y;
    let _e173 = u_xlat4_;
    let _e178 = _v_buffer0_.v_cb0_[15];
    let _e183 = _v_buffer2_.v_cb2_[11];
    let _e185 = (_e178.zz * _e183.yz);
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
    vs_TEXCOORD0_.x = _e205.x;
    vs_TEXCOORD0_.y = _e205.y;
    let _e210 = u_xlat0_;
    let _e212 = in_TEXCOORD0_1;
    let _e217 = _v_buffer2_.v_cb2_[4];
    let _e223 = _v_buffer2_.v_cb2_[4];
    let _e225 = ((_e212.xy * _e217.xy) + _e223.zw);
    u_xlat0_.x = _e225.x;
    u_xlat0_.y = _e225.y;
    let _e230 = u_xlat4_;
    let _e232 = u_xlat0_;
    let _e235 = u_xlat0_;
    let _e237 = (-(_e232.xy) + _e235.yx);
    u_xlat4_.x = _e237.x;
    u_xlat4_.y = _e237.y;
    let _e242 = u_xlat0_;
    let _e247 = _v_buffer2_.v_cb2_[6];
    let _e249 = u_xlat4_;
    let _e252 = u_xlat0_;
    let _e254 = ((_e247.yy * _e249.xy) + _e252.xy);
    u_xlat0_.x = _e254.x;
    u_xlat0_.y = _e254.y;
    let _e259 = u_xlat4_;
    let _e264 = _v_buffer0_.v_cb0_[15];
    let _e269 = _v_buffer2_.v_cb2_[5];
    let _e271 = (_e264.zz * _e269.xy);
    u_xlat4_.x = _e271.x;
    u_xlat4_.y = _e271.y;
    let _e276 = u_xlat4_;
    let _e278 = u_xlat4_;
    let _e280 = fract(_e278.xy);
    u_xlat4_.x = _e280.x;
    u_xlat4_.y = _e280.y;
    let _e285 = vs_TEXCOORD0_;
    let _e287 = u_xlat4_;
    let _e289 = u_xlat0_;
    let _e291 = (_e287.xy + _e289.xy);
    vs_TEXCOORD0_.z = _e291.x;
    vs_TEXCOORD0_.w = _e291.y;
    let _e296 = in_COLOR0_1;
    let _e300 = _v_buffer2_.v_cb2_[7];
    u_xlat0_ = (_e296 * _e300);
    let _e303 = u_xlat0_;
    let _e305 = u_xlat0_;
    u_xlat1_.x = max(_e303.y, _e305.x);
    let _e309 = u_xlat0_;
    let _e311 = u_xlat1_;
    u_xlat1_.x = max(_e309.z, _e311.x);
    let _e315 = u_xlat1_;
    u_xlat1_.x = ((_e315.x * 2f) + -1f);
    let _e323 = u_xlat1_;
    u_xlat1_.x = clamp(_e323.x, 0f, 1f);
    let _e329 = u_xlat1_;
    u_xlat1_.w = (-(_e329.x) + 1f);
    let _e334 = u_xlat0_;
    let _e336 = u_xlat0_;
    let _e338 = u_xlat0_;
    let _e340 = (_e336.xyz + _e338.xyz);
    u_xlat0_.x = _e340.x;
    u_xlat0_.y = _e340.y;
    u_xlat0_.z = _e340.z;
    let _e347 = u_xlat1_;
    let _e349 = u_xlat0_;
    let _e354 = _v_buffer2_.v_cb2_[8];
    let _e356 = (_e349.xyz * _e354.xxx);
    u_xlat1_.x = _e356.x;
    u_xlat1_.y = _e356.y;
    u_xlat1_.z = _e356.z;
    let _e363 = u_xlat0_;
    let _e365 = u_xlat1_;
    vs_COLOR1_ = (_e363.wwww * _e365);
    let _e367 = in_COLOR0_1;
    let _e371 = _v_buffer2_.v_cb2_[0];
    u_xlat0_ = (_e367 * _e371);
    let _e374 = u_xlat0_;
    let _e376 = u_xlat0_;
    u_xlat1_.x = max(_e374.y, _e376.x);
    let _e380 = u_xlat0_;
    let _e382 = u_xlat1_;
    u_xlat1_.x = max(_e380.z, _e382.x);
    let _e386 = u_xlat1_;
    u_xlat1_.x = ((_e386.x * 2f) + -1f);
    let _e394 = u_xlat1_;
    u_xlat1_.x = clamp(_e394.x, 0f, 1f);
    let _e400 = u_xlat1_;
    u_xlat1_.w = (-(_e400.x) + 1f);
    let _e405 = u_xlat1_;
    let _e407 = u_xlat0_;
    let _e409 = u_xlat0_;
    let _e411 = (_e407.xyz + _e409.xyz);
    u_xlat1_.x = _e411.x;
    u_xlat1_.y = _e411.y;
    u_xlat1_.z = _e411.z;
    let _e419 = u_xlat0_;
    let _e424 = _v_buffer2_.v_cb2_[2];
    u_xlat0_.x = (_e419.w * _e424.w);
    let _e427 = u_xlat0_;
    let _e429 = u_xlat1_;
    vs_COLOR0_ = (_e427.xxxx * _e429);
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
