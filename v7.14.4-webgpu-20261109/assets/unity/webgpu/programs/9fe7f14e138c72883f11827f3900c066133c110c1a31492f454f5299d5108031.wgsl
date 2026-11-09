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
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat8_: vec2<f32> = vec2(0f);

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
    let _e138 = u_xlat8_;
    let _e140 = u_xlat0_;
    let _e143 = u_xlat0_;
    let _e145 = (-(_e140.xy) + _e143.yx);
    u_xlat8_.x = _e145.x;
    u_xlat8_.y = _e145.y;
    let _e150 = u_xlat0_;
    let _e155 = _v_buffer2_.v_cb2_[6];
    let _e157 = u_xlat8_;
    let _e160 = u_xlat0_;
    let _e162 = ((_e155.yy * _e157.xy) + _e160.xy);
    u_xlat0_.x = _e162.x;
    u_xlat0_.y = _e162.y;
    let _e167 = u_xlat8_;
    let _e172 = _v_buffer0_.v_cb0_[15];
    let _e177 = _v_buffer2_.v_cb2_[5];
    let _e179 = (_e172.zz * _e177.xy);
    u_xlat8_.x = _e179.x;
    u_xlat8_.y = _e179.y;
    let _e184 = u_xlat8_;
    let _e186 = u_xlat8_;
    let _e188 = fract(_e186.xy);
    u_xlat8_.x = _e188.x;
    u_xlat8_.y = _e188.y;
    let _e193 = u_xlat0_;
    let _e195 = u_xlat8_;
    let _e197 = u_xlat0_;
    let _e199 = (_e195.xy + _e197.xy);
    u_xlat0_.x = _e199.x;
    u_xlat0_.y = _e199.y;
    let _e204 = u_xlat0_;
    let _e209 = _v_buffer2_.v_cb2_[4];
    let _e216 = u_xlat0_;
    let _e218 = ((-(_e209.xy) * vec2<f32>(0.5f, 0.5f)) + _e216.xy);
    u_xlat0_.x = _e218.x;
    u_xlat0_.y = _e218.y;
    let _e227 = _v_buffer2_.v_cb2_[6];
    u_xlat8_.x = (_e227.w * 0.017453289f);
    let _e235 = _v_buffer2_.v_cb2_[6];
    let _e240 = _v_buffer0_.v_cb0_[15];
    let _e243 = u_xlat8_;
    u_xlat8_.x = ((_e235.z * _e240.z) + -(_e243.x));
    let _e248 = u_xlat8_;
    u_xlat1_.x = sin(_e248.x);
    let _e252 = u_xlat8_;
    u_xlat2_.x = cos(_e252.x);
    let _e256 = u_xlat1_;
    u_xlat3_.z = _e256.x;
    let _e259 = u_xlat2_;
    u_xlat3_.y = _e259.x;
    let _e262 = u_xlat1_;
    u_xlat3_.x = -(_e262.x);
    let _e266 = u_xlat0_;
    let _e268 = u_xlat3_;
    u_xlat8_.y = dot(_e266.xy, _e268.xy);
    let _e272 = u_xlat0_;
    let _e274 = u_xlat3_;
    u_xlat8_.x = dot(_e272.xy, _e274.yz);
    let _e277 = vs_TEXCOORD0_;
    let _e282 = _v_buffer2_.v_cb2_[4];
    let _e288 = u_xlat8_;
    let _e290 = ((_e282.xy * vec2<f32>(0.5f, 0.5f)) + _e288.xy);
    vs_TEXCOORD0_.z = _e290.x;
    vs_TEXCOORD0_.w = _e290.y;
    let _e295 = u_xlat0_;
    let _e297 = in_TEXCOORD0_1;
    let _e302 = _v_buffer2_.v_cb2_[1];
    let _e308 = _v_buffer2_.v_cb2_[1];
    let _e310 = ((_e297.xy * _e302.xy) + _e308.zw);
    u_xlat0_.x = _e310.x;
    u_xlat0_.y = _e310.y;
    let _e315 = u_xlat8_;
    let _e317 = u_xlat0_;
    let _e320 = u_xlat0_;
    let _e322 = (-(_e317.xy) + _e320.yx);
    u_xlat8_.x = _e322.x;
    u_xlat8_.y = _e322.y;
    let _e327 = vs_TEXCOORD0_;
    let _e332 = _v_buffer2_.v_cb2_[2];
    let _e334 = u_xlat8_;
    let _e337 = u_xlat0_;
    let _e339 = ((_e332.zz * _e334.xy) + _e337.xy);
    vs_TEXCOORD0_.x = _e339.x;
    vs_TEXCOORD0_.y = _e339.y;
    let _e344 = in_COLOR0_1;
    let _e348 = _v_buffer2_.v_cb2_[7];
    u_xlat0_ = (_e344 * _e348);
    let _e351 = u_xlat0_;
    let _e353 = u_xlat0_;
    u_xlat1_.x = max(_e351.y, _e353.x);
    let _e357 = u_xlat0_;
    let _e359 = u_xlat1_;
    u_xlat1_.x = max(_e357.z, _e359.x);
    let _e363 = u_xlat1_;
    u_xlat1_.x = ((_e363.x * 2f) + -1f);
    let _e371 = u_xlat1_;
    u_xlat1_.x = clamp(_e371.x, 0f, 1f);
    let _e377 = u_xlat1_;
    u_xlat1_.w = (-(_e377.x) + 1f);
    let _e382 = u_xlat0_;
    let _e384 = u_xlat0_;
    let _e386 = u_xlat0_;
    let _e388 = (_e384.xyz + _e386.xyz);
    u_xlat0_.x = _e388.x;
    u_xlat0_.y = _e388.y;
    u_xlat0_.z = _e388.z;
    let _e395 = u_xlat1_;
    let _e397 = u_xlat0_;
    let _e402 = _v_buffer2_.v_cb2_[8];
    let _e404 = (_e397.xyz * _e402.xxx);
    u_xlat1_.x = _e404.x;
    u_xlat1_.y = _e404.y;
    u_xlat1_.z = _e404.z;
    let _e411 = u_xlat0_;
    let _e413 = u_xlat1_;
    vs_COLOR1_ = (_e411.wwww * _e413);
    let _e415 = in_COLOR0_1;
    let _e419 = _v_buffer2_.v_cb2_[0];
    u_xlat0_ = (_e415 * _e419);
    let _e422 = u_xlat0_;
    let _e424 = u_xlat0_;
    u_xlat1_.x = max(_e422.y, _e424.x);
    let _e428 = u_xlat0_;
    let _e430 = u_xlat1_;
    u_xlat1_.x = max(_e428.z, _e430.x);
    let _e434 = u_xlat1_;
    u_xlat1_.x = ((_e434.x * 2f) + -1f);
    let _e442 = u_xlat1_;
    u_xlat1_.x = clamp(_e442.x, 0f, 1f);
    let _e448 = u_xlat1_;
    u_xlat1_.w = (-(_e448.x) + 1f);
    let _e453 = u_xlat1_;
    let _e455 = u_xlat0_;
    let _e457 = u_xlat0_;
    let _e459 = (_e455.xyz + _e457.xyz);
    u_xlat1_.x = _e459.x;
    u_xlat1_.y = _e459.y;
    u_xlat1_.z = _e459.z;
    let _e467 = u_xlat0_;
    let _e472 = _v_buffer2_.v_cb2_[2];
    u_xlat0_.x = (_e467.w * _e472.w);
    let _e475 = u_xlat0_;
    let _e477 = u_xlat1_;
    vs_COLOR0_ = (_e475.xxxx * _e477);
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
