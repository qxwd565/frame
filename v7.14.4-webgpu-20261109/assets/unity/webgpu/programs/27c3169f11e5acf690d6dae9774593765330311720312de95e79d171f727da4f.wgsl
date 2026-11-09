struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 4>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 20>,
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
    var u_xlat3_: vec2<f32> = vec2(0f);
    var u_xlat6_: vec2<f32> = vec2(0f);

    let _e36 = in_POSITION0_1;
    let _e41 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e36.yyyy * _e41);
    let _e46 = _v_buffer1_.v_cb1_[0];
    let _e47 = in_POSITION0_1;
    let _e50 = u_xlat0_;
    u_xlat0_ = ((_e46 * _e47.xxxx) + _e50);
    let _e55 = _v_buffer1_.v_cb1_[2];
    let _e56 = in_POSITION0_1;
    let _e59 = u_xlat0_;
    u_xlat0_ = ((_e55 * _e56.zzzz) + _e59);
    let _e61 = u_xlat0_;
    let _e65 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e61 + _e65);
    let _e67 = u_xlat0_;
    let _e72 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e67.yyyy * _e72);
    let _e77 = _v_buffer0_.v_cb0_[79];
    let _e78 = u_xlat0_;
    let _e81 = u_xlat1_;
    u_xlat1_ = ((_e77 * _e78.xxxx) + _e81);
    let _e86 = _v_buffer0_.v_cb0_[81];
    let _e87 = u_xlat0_;
    let _e90 = u_xlat1_;
    u_xlat1_ = ((_e86 * _e87.zzzz) + _e90);
    let _e96 = _v_buffer0_.v_cb0_[82];
    let _e97 = u_xlat0_;
    let _e100 = u_xlat1_;
    gl_Position = ((_e96 * _e97.wwww) + _e100);
    let _e102 = u_xlat0_;
    let _e104 = in_TEXCOORD0_1;
    let _e109 = _v_buffer2_.v_cb2_[4];
    let _e115 = _v_buffer2_.v_cb2_[4];
    let _e117 = ((_e104.xy * _e109.xy) + _e115.zw);
    u_xlat0_.x = _e117.x;
    u_xlat0_.y = _e117.y;
    let _e122 = u_xlat6_;
    let _e124 = u_xlat0_;
    let _e127 = u_xlat0_;
    let _e129 = (-(_e124.xy) + _e127.yx);
    u_xlat6_.x = _e129.x;
    u_xlat6_.y = _e129.y;
    let _e134 = u_xlat0_;
    let _e139 = _v_buffer2_.v_cb2_[6];
    let _e141 = u_xlat6_;
    let _e144 = u_xlat0_;
    let _e146 = ((_e139.yy * _e141.xy) + _e144.xy);
    u_xlat0_.x = _e146.x;
    u_xlat0_.y = _e146.y;
    let _e151 = u_xlat6_;
    let _e156 = _v_buffer0_.v_cb0_[15];
    let _e161 = _v_buffer2_.v_cb2_[5];
    let _e163 = (_e156.zz * _e161.xy);
    u_xlat6_.x = _e163.x;
    u_xlat6_.y = _e163.y;
    let _e168 = u_xlat6_;
    let _e170 = u_xlat6_;
    let _e172 = fract(_e170.xy);
    u_xlat6_.x = _e172.x;
    u_xlat6_.y = _e172.y;
    let _e177 = vs_TEXCOORD0_;
    let _e179 = u_xlat6_;
    let _e181 = u_xlat0_;
    let _e183 = (_e179.xy + _e181.xy);
    vs_TEXCOORD0_.z = _e183.x;
    vs_TEXCOORD0_.w = _e183.y;
    let _e188 = u_xlat0_;
    let _e190 = in_TEXCOORD0_1;
    let _e195 = _v_buffer2_.v_cb2_[1];
    let _e201 = _v_buffer2_.v_cb2_[1];
    let _e203 = ((_e190.xy * _e195.xy) + _e201.zw);
    u_xlat0_.x = _e203.x;
    u_xlat0_.y = _e203.y;
    let _e208 = u_xlat6_;
    let _e210 = u_xlat0_;
    let _e213 = u_xlat0_;
    let _e215 = (-(_e210.xy) + _e213.yx);
    u_xlat6_.x = _e215.x;
    u_xlat6_.y = _e215.y;
    let _e220 = vs_TEXCOORD0_;
    let _e225 = _v_buffer2_.v_cb2_[2];
    let _e227 = u_xlat6_;
    let _e230 = u_xlat0_;
    let _e232 = ((_e225.zz * _e227.xy) + _e230.xy);
    vs_TEXCOORD0_.x = _e232.x;
    vs_TEXCOORD0_.y = _e232.y;
    let _e237 = u_xlat0_;
    let _e242 = _v_buffer2_.v_cb2_[19];
    let _e248 = _v_buffer2_.v_cb2_[19];
    let _e250 = (-(_e242.xz) + _e248.yw);
    u_xlat0_.x = _e250.x;
    u_xlat0_.y = _e250.y;
    let _e255 = u_xlat6_;
    let _e257 = in_TEXCOORD0_1;
    let _e262 = _v_buffer2_.v_cb2_[18];
    let _e268 = _v_buffer2_.v_cb2_[18];
    let _e270 = ((_e257.xy * _e262.xy) + _e268.zw);
    u_xlat6_.x = _e270.x;
    u_xlat6_.y = _e270.y;
    let _e275 = u_xlat0_;
    let _e277 = u_xlat6_;
    let _e279 = u_xlat0_;
    let _e285 = _v_buffer2_.v_cb2_[19];
    let _e287 = ((_e277.xx * _e279.xy) + _e285.xz);
    u_xlat0_.x = _e287.x;
    u_xlat0_.y = _e287.y;
    let _e293 = u_xlat0_;
    let _e296 = u_xlat0_;
    u_xlat3_.x = (-(_e293.x) + _e296.y);
    let _e300 = u_xlat6_;
    let _e302 = u_xlat3_;
    let _e305 = u_xlat0_;
    u_xlat0_.x = ((_e300.y * _e302.x) + _e305.x);
    let _e308 = u_xlat3_;
    let _e310 = u_xlat6_;
    let _e321 = ((_e310.xy * vec2<f32>(2f, 2f)) + vec2<f32>(-1f, -1f));
    u_xlat3_.x = _e321.x;
    u_xlat3_.y = _e321.y;
    let _e327 = u_xlat3_;
    let _e329 = u_xlat3_;
    u_xlat3_.x = dot(_e327.xy, _e329.xy);
    let _e333 = u_xlat3_;
    u_xlat3_.x = (-(_e333.x) + 1f);
    let _e339 = u_xlat3_;
    let _e344 = _v_buffer2_.v_cb2_[17];
    u_xlat3_.x = (_e339.x * _e344.x);
    let _e348 = u_xlat3_;
    u_xlat3_.x = clamp(_e348.x, 0f, 1f);
    let _e354 = u_xlat0_;
    let _e356 = u_xlat3_;
    u_xlat0_.x = (_e354.x * _e356.x);
    let _e360 = u_xlat0_;
    u_xlat0_.x = clamp(_e360.x, 0f, 1f);
    let _e366 = u_xlat0_;
    let _e368 = in_COLOR0_1;
    u_xlat3_.x = (_e366.x * _e368.w);
    let _e372 = in_COLOR0_1;
    let _e375 = u_xlat0_;
    u_xlat0_.x = ((-(_e372.w) * _e375.x) + 1f);
    let _e381 = u_xlat0_;
    let _e386 = _v_buffer2_.v_cb2_[12];
    u_xlat0_.x = (_e381.x + -(_e386.w));
    let _e391 = u_xlat3_;
    let _e396 = _v_buffer2_.v_cb2_[13];
    vs_COLOR1_.w = max(_e391.x, _e396.x);
    let _e399 = vs_COLOR1_;
    vs_COLOR1_.x = 0f;
    vs_COLOR1_.y = 0f;
    vs_COLOR1_.z = 0f;
    let _e408 = u_xlat1_;
    let _e410 = in_COLOR0_1;
    let _e411 = _e410.xyz;
    u_xlat1_.x = _e411.x;
    u_xlat1_.y = _e411.y;
    u_xlat1_.z = _e411.z;
    u_xlat1_.w = 1f;
    let _e420 = u_xlat1_;
    let _e424 = _v_buffer2_.v_cb2_[0];
    u_xlat1_ = (_e420 * _e424);
    let _e427 = u_xlat1_;
    let _e429 = u_xlat1_;
    u_xlat3_.x = max(_e427.y, _e429.x);
    let _e433 = u_xlat1_;
    let _e435 = u_xlat3_;
    u_xlat3_.x = max(_e433.z, _e435.x);
    let _e439 = u_xlat3_;
    u_xlat3_.x = ((_e439.x * 2f) + -1f);
    let _e447 = u_xlat3_;
    u_xlat3_.x = clamp(_e447.x, 0f, 1f);
    let _e453 = u_xlat3_;
    u_xlat2_.w = (-(_e453.x) + 1f);
    let _e458 = u_xlat2_;
    let _e460 = u_xlat1_;
    let _e462 = u_xlat1_;
    let _e464 = (_e460.xyz + _e462.xyz);
    u_xlat2_.x = _e464.x;
    u_xlat2_.y = _e464.y;
    u_xlat2_.z = _e464.z;
    let _e472 = u_xlat1_;
    let _e477 = _v_buffer2_.v_cb2_[2];
    u_xlat3_.x = (_e472.w * _e477.w);
    let _e480 = u_xlat3_;
    let _e482 = u_xlat2_;
    vs_COLOR0_ = (_e480.xxxx * _e482);
    let _e488 = _v_buffer2_.v_cb2_[12];
    u_xlat3_.x = (_e488.y * 1.01f);
    let _e493 = u_xlat3_;
    let _e495 = u_xlat0_;
    u_xlat0_.x = max(_e493.x, _e495.x);
    let _e502 = _v_buffer2_.v_cb2_[12];
    u_xlat3_.x = ((_e502.z * 2f) + 1f);
    let _e508 = u_xlat0_;
    let _e510 = u_xlat3_;
    let _e516 = _v_buffer2_.v_cb2_[12];
    vs_TEXCOORD1_ = ((_e508.x * _e510.x) + -(_e516.z));
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
