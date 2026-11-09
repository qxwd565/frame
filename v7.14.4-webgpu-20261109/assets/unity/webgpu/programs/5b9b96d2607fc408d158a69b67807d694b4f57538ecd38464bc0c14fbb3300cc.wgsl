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
    let _e109 = _v_buffer2_.v_cb2_[1];
    let _e115 = _v_buffer2_.v_cb2_[1];
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
    let _e139 = _v_buffer2_.v_cb2_[2];
    let _e141 = u_xlat6_;
    let _e144 = u_xlat0_;
    let _e146 = ((_e139.zz * _e141.xy) + _e144.xy);
    u_xlat0_.x = _e146.x;
    u_xlat0_.y = _e146.y;
    let _e151 = u_xlat6_;
    let _e156 = _v_buffer0_.v_cb0_[15];
    let _e161 = _v_buffer2_.v_cb2_[11];
    let _e163 = (_e156.zz * _e161.yz);
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
    vs_TEXCOORD0_.x = _e183.x;
    vs_TEXCOORD0_.y = _e183.y;
    let _e188 = u_xlat0_;
    let _e190 = in_TEXCOORD0_1;
    let _e195 = _v_buffer2_.v_cb2_[4];
    let _e201 = _v_buffer2_.v_cb2_[4];
    let _e203 = ((_e190.xy * _e195.xy) + _e201.zw);
    u_xlat0_.x = _e203.x;
    u_xlat0_.y = _e203.y;
    let _e208 = u_xlat6_;
    let _e210 = u_xlat0_;
    let _e213 = u_xlat0_;
    let _e215 = (-(_e210.xy) + _e213.yx);
    u_xlat6_.x = _e215.x;
    u_xlat6_.y = _e215.y;
    let _e220 = u_xlat0_;
    let _e225 = _v_buffer2_.v_cb2_[6];
    let _e227 = u_xlat6_;
    let _e230 = u_xlat0_;
    let _e232 = ((_e225.yy * _e227.xy) + _e230.xy);
    u_xlat0_.x = _e232.x;
    u_xlat0_.y = _e232.y;
    let _e237 = u_xlat6_;
    let _e242 = _v_buffer0_.v_cb0_[15];
    let _e247 = _v_buffer2_.v_cb2_[5];
    let _e249 = (_e242.zz * _e247.xy);
    u_xlat6_.x = _e249.x;
    u_xlat6_.y = _e249.y;
    let _e254 = u_xlat6_;
    let _e256 = u_xlat6_;
    let _e258 = fract(_e256.xy);
    u_xlat6_.x = _e258.x;
    u_xlat6_.y = _e258.y;
    let _e263 = vs_TEXCOORD0_;
    let _e265 = u_xlat6_;
    let _e267 = u_xlat0_;
    let _e269 = (_e265.xy + _e267.xy);
    vs_TEXCOORD0_.z = _e269.x;
    vs_TEXCOORD0_.w = _e269.y;
    vs_COLOR1_ = vec4<f32>(0f, 0f, 0f, 0f);
    let _e279 = u_xlat0_;
    let _e284 = _v_buffer2_.v_cb2_[19];
    let _e290 = _v_buffer2_.v_cb2_[19];
    let _e292 = (-(_e284.xz) + _e290.yw);
    u_xlat0_.x = _e292.x;
    u_xlat0_.y = _e292.y;
    let _e297 = u_xlat6_;
    let _e299 = in_TEXCOORD0_1;
    let _e304 = _v_buffer2_.v_cb2_[18];
    let _e310 = _v_buffer2_.v_cb2_[18];
    let _e312 = ((_e299.xy * _e304.xy) + _e310.zw);
    u_xlat6_.x = _e312.x;
    u_xlat6_.y = _e312.y;
    let _e317 = u_xlat0_;
    let _e319 = u_xlat6_;
    let _e321 = u_xlat0_;
    let _e327 = _v_buffer2_.v_cb2_[19];
    let _e329 = ((_e319.xx * _e321.xy) + _e327.xz);
    u_xlat0_.x = _e329.x;
    u_xlat0_.y = _e329.y;
    let _e335 = u_xlat0_;
    let _e338 = u_xlat0_;
    u_xlat3_.x = (-(_e335.x) + _e338.y);
    let _e342 = u_xlat6_;
    let _e344 = u_xlat3_;
    let _e347 = u_xlat0_;
    u_xlat0_.x = ((_e342.y * _e344.x) + _e347.x);
    let _e350 = u_xlat3_;
    let _e352 = u_xlat6_;
    let _e363 = ((_e352.xy * vec2<f32>(2f, 2f)) + vec2<f32>(-1f, -1f));
    u_xlat3_.x = _e363.x;
    u_xlat3_.y = _e363.y;
    let _e369 = u_xlat3_;
    let _e371 = u_xlat3_;
    u_xlat3_.x = dot(_e369.xy, _e371.xy);
    let _e375 = u_xlat3_;
    u_xlat3_.x = (-(_e375.x) + 1f);
    let _e381 = u_xlat3_;
    let _e386 = _v_buffer2_.v_cb2_[17];
    u_xlat3_.x = (_e381.x * _e386.x);
    let _e390 = u_xlat3_;
    u_xlat3_.x = clamp(_e390.x, 0f, 1f);
    let _e396 = u_xlat0_;
    let _e398 = u_xlat3_;
    u_xlat0_.x = (_e396.x * _e398.x);
    let _e402 = u_xlat0_;
    u_xlat0_.x = clamp(_e402.x, 0f, 1f);
    let _e408 = u_xlat0_;
    let _e410 = in_COLOR0_1;
    u_xlat3_.x = (_e408.x * _e410.w);
    let _e414 = in_COLOR0_1;
    let _e417 = u_xlat0_;
    u_xlat0_.x = ((-(_e414.w) * _e417.x) + 1f);
    let _e423 = u_xlat0_;
    let _e428 = _v_buffer2_.v_cb2_[12];
    u_xlat0_.x = (_e423.x + -(_e428.w));
    let _e433 = u_xlat3_;
    let _e438 = _v_buffer2_.v_cb2_[13];
    u_xlat1_.w = max(_e433.x, _e438.x);
    let _e441 = u_xlat1_;
    let _e443 = in_COLOR0_1;
    let _e444 = _e443.xyz;
    u_xlat1_.x = _e444.x;
    u_xlat1_.y = _e444.y;
    u_xlat1_.z = _e444.z;
    let _e451 = u_xlat1_;
    let _e455 = _v_buffer2_.v_cb2_[0];
    u_xlat1_ = (_e451 * _e455);
    let _e458 = u_xlat1_;
    let _e460 = u_xlat1_;
    u_xlat3_.x = max(_e458.y, _e460.x);
    let _e464 = u_xlat1_;
    let _e466 = u_xlat3_;
    u_xlat3_.x = max(_e464.z, _e466.x);
    let _e470 = u_xlat3_;
    u_xlat3_.x = ((_e470.x * 2f) + -1f);
    let _e478 = u_xlat3_;
    u_xlat3_.x = clamp(_e478.x, 0f, 1f);
    let _e484 = u_xlat3_;
    u_xlat2_.w = (-(_e484.x) + 1f);
    let _e489 = u_xlat2_;
    let _e491 = u_xlat1_;
    let _e493 = u_xlat1_;
    let _e495 = (_e491.xyz + _e493.xyz);
    u_xlat2_.x = _e495.x;
    u_xlat2_.y = _e495.y;
    u_xlat2_.z = _e495.z;
    let _e503 = u_xlat1_;
    let _e508 = _v_buffer2_.v_cb2_[2];
    u_xlat3_.x = (_e503.w * _e508.w);
    let _e511 = u_xlat3_;
    let _e513 = u_xlat2_;
    vs_COLOR0_ = (_e511.xxxx * _e513);
    let _e519 = _v_buffer2_.v_cb2_[12];
    u_xlat3_.x = (_e519.y * 1.01f);
    let _e524 = u_xlat3_;
    let _e526 = u_xlat0_;
    u_xlat0_.x = max(_e524.x, _e526.x);
    let _e533 = _v_buffer2_.v_cb2_[12];
    u_xlat3_.x = ((_e533.z * 2f) + 1f);
    let _e539 = u_xlat0_;
    let _e541 = u_xlat3_;
    let _e547 = _v_buffer2_.v_cb2_[12];
    vs_TEXCOORD1_ = ((_e539.x * _e541.x) + -(_e547.z));
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
