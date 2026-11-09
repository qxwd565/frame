struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 8>,
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
var<private> in_NORMAL0_1: vec3<f32>;
var<private> vs_TEXCOORD0_: vec4<f32>;
var<private> vs_COLOR1_: vec4<f32>;
var<private> vs_COLOR0_: vec4<f32>;
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
    let _e94 = u_xlat0_;
    let _e99 = _v_buffer0_.v_cb0_[73];
    let _e104 = _v_buffer1_.v_cb1_[5];
    let _e106 = (_e99.yyy * _e104.xyz);
    u_xlat0_.x = _e106.x;
    u_xlat0_.y = _e106.y;
    u_xlat0_.z = _e106.z;
    let _e113 = u_xlat0_;
    let _e118 = _v_buffer1_.v_cb1_[4];
    let _e123 = _v_buffer0_.v_cb0_[73];
    let _e126 = u_xlat0_;
    let _e128 = ((_e118.xyz * _e123.xxx) + _e126.xyz);
    u_xlat0_.x = _e128.x;
    u_xlat0_.y = _e128.y;
    u_xlat0_.z = _e128.z;
    let _e135 = u_xlat0_;
    let _e140 = _v_buffer1_.v_cb1_[6];
    let _e145 = _v_buffer0_.v_cb0_[73];
    let _e148 = u_xlat0_;
    let _e150 = ((_e140.xyz * _e145.zzz) + _e148.xyz);
    u_xlat0_.x = _e150.x;
    u_xlat0_.y = _e150.y;
    u_xlat0_.z = _e150.z;
    let _e157 = u_xlat0_;
    let _e162 = _v_buffer1_.v_cb1_[7];
    let _e167 = _v_buffer0_.v_cb0_[73];
    let _e170 = u_xlat0_;
    let _e172 = ((_e162.xyz * _e167.www) + _e170.xyz);
    u_xlat0_.x = _e172.x;
    u_xlat0_.y = _e172.y;
    u_xlat0_.z = _e172.z;
    let _e180 = u_xlat0_;
    let _e182 = in_NORMAL0_1;
    u_xlat0_.z = dot(_e180.xyz, _e182.xyz);
    let _e185 = u_xlat1_;
    let _e190 = _v_buffer0_.v_cb0_[71];
    let _e195 = _v_buffer1_.v_cb1_[5];
    let _e197 = (_e190.yyy * _e195.xyz);
    u_xlat1_.x = _e197.x;
    u_xlat1_.y = _e197.y;
    u_xlat1_.z = _e197.z;
    let _e204 = u_xlat1_;
    let _e209 = _v_buffer1_.v_cb1_[4];
    let _e214 = _v_buffer0_.v_cb0_[71];
    let _e217 = u_xlat1_;
    let _e219 = ((_e209.xyz * _e214.xxx) + _e217.xyz);
    u_xlat1_.x = _e219.x;
    u_xlat1_.y = _e219.y;
    u_xlat1_.z = _e219.z;
    let _e226 = u_xlat1_;
    let _e231 = _v_buffer1_.v_cb1_[6];
    let _e236 = _v_buffer0_.v_cb0_[71];
    let _e239 = u_xlat1_;
    let _e241 = ((_e231.xyz * _e236.zzz) + _e239.xyz);
    u_xlat1_.x = _e241.x;
    u_xlat1_.y = _e241.y;
    u_xlat1_.z = _e241.z;
    let _e248 = u_xlat1_;
    let _e253 = _v_buffer1_.v_cb1_[7];
    let _e258 = _v_buffer0_.v_cb0_[71];
    let _e261 = u_xlat1_;
    let _e263 = ((_e253.xyz * _e258.www) + _e261.xyz);
    u_xlat1_.x = _e263.x;
    u_xlat1_.y = _e263.y;
    u_xlat1_.z = _e263.z;
    let _e271 = u_xlat1_;
    let _e273 = in_NORMAL0_1;
    u_xlat0_.x = dot(_e271.xyz, _e273.xyz);
    let _e276 = u_xlat1_;
    let _e281 = _v_buffer0_.v_cb0_[72];
    let _e286 = _v_buffer1_.v_cb1_[5];
    let _e288 = (_e281.yyy * _e286.xyz);
    u_xlat1_.x = _e288.x;
    u_xlat1_.y = _e288.y;
    u_xlat1_.z = _e288.z;
    let _e295 = u_xlat1_;
    let _e300 = _v_buffer1_.v_cb1_[4];
    let _e305 = _v_buffer0_.v_cb0_[72];
    let _e308 = u_xlat1_;
    let _e310 = ((_e300.xyz * _e305.xxx) + _e308.xyz);
    u_xlat1_.x = _e310.x;
    u_xlat1_.y = _e310.y;
    u_xlat1_.z = _e310.z;
    let _e317 = u_xlat1_;
    let _e322 = _v_buffer1_.v_cb1_[6];
    let _e327 = _v_buffer0_.v_cb0_[72];
    let _e330 = u_xlat1_;
    let _e332 = ((_e322.xyz * _e327.zzz) + _e330.xyz);
    u_xlat1_.x = _e332.x;
    u_xlat1_.y = _e332.y;
    u_xlat1_.z = _e332.z;
    let _e339 = u_xlat1_;
    let _e344 = _v_buffer1_.v_cb1_[7];
    let _e349 = _v_buffer0_.v_cb0_[72];
    let _e352 = u_xlat1_;
    let _e354 = ((_e344.xyz * _e349.www) + _e352.xyz);
    u_xlat1_.x = _e354.x;
    u_xlat1_.y = _e354.y;
    u_xlat1_.z = _e354.z;
    let _e362 = u_xlat1_;
    let _e364 = in_NORMAL0_1;
    u_xlat0_.y = dot(_e362.xyz, _e364.xyz);
    let _e368 = u_xlat0_;
    let _e370 = u_xlat0_;
    u_xlat4_.x = dot(_e368.xyz, _e370.xyz);
    let _e374 = u_xlat4_;
    u_xlat4_.x = inverseSqrt(_e374.x);
    let _e377 = u_xlat0_;
    let _e379 = u_xlat4_;
    let _e381 = u_xlat0_;
    let _e383 = (_e379.xx * _e381.xy);
    u_xlat0_.x = _e383.x;
    u_xlat0_.y = _e383.y;
    let _e388 = vs_TEXCOORD0_;
    let _e390 = u_xlat0_;
    let _e399 = ((_e390.xy * vec2<f32>(0.5f, 0.5f)) + vec2<f32>(0.5f, 0.5f));
    vs_TEXCOORD0_.z = _e399.x;
    vs_TEXCOORD0_.w = _e399.y;
    let _e404 = u_xlat0_;
    let _e406 = in_TEXCOORD0_1;
    let _e411 = _v_buffer2_.v_cb2_[1];
    let _e417 = _v_buffer2_.v_cb2_[1];
    let _e419 = ((_e406.xy * _e411.xy) + _e417.zw);
    u_xlat0_.x = _e419.x;
    u_xlat0_.y = _e419.y;
    let _e424 = u_xlat4_;
    let _e426 = u_xlat0_;
    let _e429 = u_xlat0_;
    let _e431 = (-(_e426.xy) + _e429.yx);
    u_xlat4_.x = _e431.x;
    u_xlat4_.y = _e431.y;
    let _e436 = vs_TEXCOORD0_;
    let _e441 = _v_buffer2_.v_cb2_[2];
    let _e443 = u_xlat4_;
    let _e446 = u_xlat0_;
    let _e448 = ((_e441.zz * _e443.xy) + _e446.xy);
    vs_TEXCOORD0_.x = _e448.x;
    vs_TEXCOORD0_.y = _e448.y;
    let _e453 = in_COLOR0_1;
    let _e457 = _v_buffer2_.v_cb2_[7];
    u_xlat0_ = (_e453 * _e457);
    let _e460 = u_xlat0_;
    let _e462 = u_xlat0_;
    u_xlat1_.x = max(_e460.y, _e462.x);
    let _e466 = u_xlat0_;
    let _e468 = u_xlat1_;
    u_xlat1_.x = max(_e466.z, _e468.x);
    let _e472 = u_xlat1_;
    u_xlat1_.x = ((_e472.x * 2f) + -1f);
    let _e480 = u_xlat1_;
    u_xlat1_.x = clamp(_e480.x, 0f, 1f);
    let _e486 = u_xlat1_;
    u_xlat1_.w = (-(_e486.x) + 1f);
    let _e491 = u_xlat0_;
    let _e493 = u_xlat0_;
    let _e495 = u_xlat0_;
    let _e497 = (_e493.xyz + _e495.xyz);
    u_xlat0_.x = _e497.x;
    u_xlat0_.y = _e497.y;
    u_xlat0_.z = _e497.z;
    let _e504 = u_xlat1_;
    let _e506 = u_xlat0_;
    let _e511 = _v_buffer2_.v_cb2_[8];
    let _e513 = (_e506.xyz * _e511.xxx);
    u_xlat1_.x = _e513.x;
    u_xlat1_.y = _e513.y;
    u_xlat1_.z = _e513.z;
    let _e520 = u_xlat0_;
    let _e522 = u_xlat1_;
    vs_COLOR1_ = (_e520.wwww * _e522);
    let _e524 = in_COLOR0_1;
    let _e528 = _v_buffer2_.v_cb2_[0];
    u_xlat0_ = (_e524 * _e528);
    let _e531 = u_xlat0_;
    let _e533 = u_xlat0_;
    u_xlat1_.x = max(_e531.y, _e533.x);
    let _e537 = u_xlat0_;
    let _e539 = u_xlat1_;
    u_xlat1_.x = max(_e537.z, _e539.x);
    let _e543 = u_xlat1_;
    u_xlat1_.x = ((_e543.x * 2f) + -1f);
    let _e551 = u_xlat1_;
    u_xlat1_.x = clamp(_e551.x, 0f, 1f);
    let _e557 = u_xlat1_;
    u_xlat1_.w = (-(_e557.x) + 1f);
    let _e562 = u_xlat1_;
    let _e564 = u_xlat0_;
    let _e566 = u_xlat0_;
    let _e568 = (_e564.xyz + _e566.xyz);
    u_xlat1_.x = _e568.x;
    u_xlat1_.y = _e568.y;
    u_xlat1_.z = _e568.z;
    let _e576 = u_xlat0_;
    let _e581 = _v_buffer2_.v_cb2_[2];
    u_xlat0_.x = (_e576.w * _e581.w);
    let _e584 = u_xlat0_;
    let _e586 = u_xlat1_;
    vs_COLOR0_ = (_e584.xxxx * _e586);
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(3) in_COLOR0_: vec4<f32>, @location(1) in_NORMAL0_: vec3<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_COLOR0_1 = in_COLOR0_;
    in_NORMAL0_1 = in_NORMAL0_;
    main_1();
    let _e32 = vs_TEXCOORD0_;
    let _e34 = vs_COLOR1_;
    let _e36 = vs_COLOR0_;
    let _e38 = gl_Position;
    return VertexOutput(_e32, _e34, _e36, _e38);
}
