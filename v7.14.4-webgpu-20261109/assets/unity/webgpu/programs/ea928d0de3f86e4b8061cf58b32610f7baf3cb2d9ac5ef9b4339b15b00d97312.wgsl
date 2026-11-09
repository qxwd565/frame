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
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: f32 = 0f;
    var u_xlat6_: vec2<f32> = vec2(0f);

    let _e35 = in_POSITION0_1;
    let _e40 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e35.yyyy * _e40);
    let _e45 = _v_buffer1_.v_cb1_[0];
    let _e46 = in_POSITION0_1;
    let _e49 = u_xlat0_;
    u_xlat0_ = ((_e45 * _e46.xxxx) + _e49);
    let _e54 = _v_buffer1_.v_cb1_[2];
    let _e55 = in_POSITION0_1;
    let _e58 = u_xlat0_;
    u_xlat0_ = ((_e54 * _e55.zzzz) + _e58);
    let _e60 = u_xlat0_;
    let _e64 = _v_buffer1_.v_cb1_[3];
    u_xlat1_ = (_e60 + _e64);
    let _e66 = u_xlat0_;
    let _e71 = _v_buffer1_.v_cb1_[3];
    let _e73 = in_POSITION0_1;
    let _e76 = u_xlat0_;
    let _e78 = ((_e71.xz * _e73.ww) + _e76.xz);
    u_xlat0_.x = _e78.x;
    u_xlat0_.y = _e78.y;
    let _e83 = u_xlat0_;
    let _e85 = u_xlat0_;
    let _e90 = _v_buffer2_.v_cb2_[4];
    let _e96 = _v_buffer2_.v_cb2_[4];
    let _e98 = ((_e85.xy * _e90.xy) + _e96.zw);
    u_xlat0_.x = _e98.x;
    u_xlat0_.y = _e98.y;
    let _e103 = u_xlat1_;
    let _e108 = _v_buffer0_.v_cb0_[80];
    u_xlat2_ = (_e103.yyyy * _e108);
    let _e113 = _v_buffer0_.v_cb0_[79];
    let _e114 = u_xlat1_;
    let _e117 = u_xlat2_;
    u_xlat2_ = ((_e113 * _e114.xxxx) + _e117);
    let _e122 = _v_buffer0_.v_cb0_[81];
    let _e123 = u_xlat1_;
    let _e126 = u_xlat2_;
    u_xlat2_ = ((_e122 * _e123.zzzz) + _e126);
    let _e132 = _v_buffer0_.v_cb0_[82];
    let _e133 = u_xlat1_;
    let _e136 = u_xlat2_;
    gl_Position = ((_e132 * _e133.wwww) + _e136);
    let _e138 = u_xlat6_;
    let _e140 = u_xlat0_;
    let _e143 = u_xlat0_;
    let _e145 = (-(_e140.xy) + _e143.yx);
    u_xlat6_.x = _e145.x;
    u_xlat6_.y = _e145.y;
    let _e150 = u_xlat0_;
    let _e155 = _v_buffer2_.v_cb2_[6];
    let _e157 = u_xlat6_;
    let _e160 = u_xlat0_;
    let _e162 = ((_e155.yy * _e157.xy) + _e160.xy);
    u_xlat0_.x = _e162.x;
    u_xlat0_.y = _e162.y;
    let _e167 = u_xlat6_;
    let _e172 = _v_buffer0_.v_cb0_[15];
    let _e177 = _v_buffer2_.v_cb2_[5];
    let _e179 = (_e172.zz * _e177.xy);
    u_xlat6_.x = _e179.x;
    u_xlat6_.y = _e179.y;
    let _e184 = u_xlat6_;
    let _e186 = u_xlat6_;
    let _e188 = fract(_e186.xy);
    u_xlat6_.x = _e188.x;
    u_xlat6_.y = _e188.y;
    let _e193 = vs_TEXCOORD0_;
    let _e195 = u_xlat6_;
    let _e197 = u_xlat0_;
    let _e199 = (_e195.xy + _e197.xy);
    vs_TEXCOORD0_.z = _e199.x;
    vs_TEXCOORD0_.w = _e199.y;
    let _e204 = u_xlat0_;
    let _e206 = in_TEXCOORD0_1;
    let _e211 = _v_buffer2_.v_cb2_[1];
    let _e217 = _v_buffer2_.v_cb2_[1];
    let _e219 = ((_e206.xy * _e211.xy) + _e217.zw);
    u_xlat0_.x = _e219.x;
    u_xlat0_.y = _e219.y;
    let _e224 = u_xlat6_;
    let _e226 = u_xlat0_;
    let _e229 = u_xlat0_;
    let _e231 = (-(_e226.xy) + _e229.yx);
    u_xlat6_.x = _e231.x;
    u_xlat6_.y = _e231.y;
    let _e236 = u_xlat0_;
    let _e241 = _v_buffer2_.v_cb2_[2];
    let _e243 = u_xlat6_;
    let _e246 = u_xlat0_;
    let _e248 = ((_e241.zz * _e243.xy) + _e246.xy);
    u_xlat0_.x = _e248.x;
    u_xlat0_.y = _e248.y;
    let _e253 = u_xlat6_;
    let _e258 = _v_buffer0_.v_cb0_[15];
    let _e263 = _v_buffer2_.v_cb2_[11];
    let _e265 = (_e258.zz * _e263.yz);
    u_xlat6_.x = _e265.x;
    u_xlat6_.y = _e265.y;
    let _e270 = u_xlat6_;
    let _e272 = u_xlat6_;
    let _e274 = fract(_e272.xy);
    u_xlat6_.x = _e274.x;
    u_xlat6_.y = _e274.y;
    let _e279 = vs_TEXCOORD0_;
    let _e281 = u_xlat6_;
    let _e283 = u_xlat0_;
    let _e285 = (_e281.xy + _e283.xy);
    vs_TEXCOORD0_.x = _e285.x;
    vs_TEXCOORD0_.y = _e285.y;
    let _e291 = in_COLOR0_1;
    let _e296 = _v_buffer2_.v_cb2_[13];
    u_xlat0_.w = max(_e291.w, _e296.x);
    let _e299 = u_xlat0_;
    let _e301 = in_COLOR0_1;
    let _e302 = _e301.xyz;
    u_xlat0_.x = _e302.x;
    u_xlat0_.y = _e302.y;
    u_xlat0_.z = _e302.z;
    let _e309 = u_xlat0_;
    let _e313 = _v_buffer2_.v_cb2_[7];
    u_xlat1_ = (_e309 * _e313);
    let _e315 = u_xlat0_;
    let _e319 = _v_buffer2_.v_cb2_[0];
    u_xlat0_ = (_e315 * _e319);
    let _e322 = u_xlat1_;
    let _e324 = u_xlat1_;
    u_xlat2_.x = max(_e322.y, _e324.x);
    let _e328 = u_xlat1_;
    let _e330 = u_xlat2_;
    u_xlat2_.x = max(_e328.z, _e330.x);
    let _e334 = u_xlat2_;
    u_xlat2_.x = ((_e334.x * 2f) + -1f);
    let _e342 = u_xlat2_;
    u_xlat2_.x = clamp(_e342.x, 0f, 1f);
    let _e348 = u_xlat2_;
    u_xlat2_.w = (-(_e348.x) + 1f);
    let _e353 = u_xlat1_;
    let _e355 = u_xlat1_;
    let _e357 = u_xlat1_;
    let _e359 = (_e355.xyz + _e357.xyz);
    u_xlat1_.x = _e359.x;
    u_xlat1_.y = _e359.y;
    u_xlat1_.z = _e359.z;
    let _e366 = u_xlat2_;
    let _e368 = u_xlat1_;
    let _e373 = _v_buffer2_.v_cb2_[8];
    let _e375 = (_e368.xyz * _e373.xxx);
    u_xlat2_.x = _e375.x;
    u_xlat2_.y = _e375.y;
    u_xlat2_.z = _e375.z;
    let _e382 = u_xlat1_;
    let _e384 = u_xlat2_;
    vs_COLOR1_ = (_e382.wwww * _e384);
    let _e387 = u_xlat0_;
    let _e389 = u_xlat0_;
    u_xlat1_.x = max(_e387.y, _e389.x);
    let _e393 = u_xlat0_;
    let _e395 = u_xlat1_;
    u_xlat1_.x = max(_e393.z, _e395.x);
    let _e399 = u_xlat1_;
    u_xlat1_.x = ((_e399.x * 2f) + -1f);
    let _e407 = u_xlat1_;
    u_xlat1_.x = clamp(_e407.x, 0f, 1f);
    let _e413 = u_xlat1_;
    u_xlat1_.w = (-(_e413.x) + 1f);
    let _e418 = u_xlat1_;
    let _e420 = u_xlat0_;
    let _e422 = u_xlat0_;
    let _e424 = (_e420.xyz + _e422.xyz);
    u_xlat1_.x = _e424.x;
    u_xlat1_.y = _e424.y;
    u_xlat1_.z = _e424.z;
    let _e432 = u_xlat0_;
    let _e437 = _v_buffer2_.v_cb2_[2];
    u_xlat0_.x = (_e432.w * _e437.w);
    let _e440 = u_xlat0_;
    let _e442 = u_xlat1_;
    vs_COLOR0_ = (_e440.xxxx * _e442);
    let _e445 = in_COLOR0_1;
    u_xlat0_.x = (-(_e445.w) + 1f);
    let _e451 = u_xlat0_;
    let _e456 = _v_buffer2_.v_cb2_[12];
    u_xlat0_.x = (_e451.x + -(_e456.w));
    let _e463 = _v_buffer2_.v_cb2_[12];
    u_xlat3_ = (_e463.y * 1.01f);
    let _e468 = u_xlat3_;
    let _e469 = u_xlat0_;
    u_xlat0_.x = max(_e468, _e469.x);
    let _e475 = _v_buffer2_.v_cb2_[12];
    u_xlat3_ = ((_e475.z * 2f) + 1f);
    let _e481 = u_xlat0_;
    let _e483 = u_xlat3_;
    let _e488 = _v_buffer2_.v_cb2_[12];
    vs_TEXCOORD1_ = ((_e481.x * _e483) + -(_e488.z));
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
