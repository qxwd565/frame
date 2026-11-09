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
    vs_COLOR1_ = vec4<f32>(0f, 0f, 0f, 0f);
    let _e242 = u_xlat0_;
    let _e247 = _v_buffer2_.v_cb2_[19];
    let _e253 = _v_buffer2_.v_cb2_[19];
    let _e255 = (-(_e247.xz) + _e253.yw);
    u_xlat0_.x = _e255.x;
    u_xlat0_.y = _e255.y;
    let _e260 = u_xlat6_;
    let _e262 = in_TEXCOORD0_1;
    let _e267 = _v_buffer2_.v_cb2_[18];
    let _e273 = _v_buffer2_.v_cb2_[18];
    let _e275 = ((_e262.xy * _e267.xy) + _e273.zw);
    u_xlat6_.x = _e275.x;
    u_xlat6_.y = _e275.y;
    let _e280 = u_xlat0_;
    let _e282 = u_xlat6_;
    let _e284 = u_xlat0_;
    let _e290 = _v_buffer2_.v_cb2_[19];
    let _e292 = ((_e282.xx * _e284.xy) + _e290.xz);
    u_xlat0_.x = _e292.x;
    u_xlat0_.y = _e292.y;
    let _e298 = u_xlat0_;
    let _e301 = u_xlat0_;
    u_xlat3_.x = (-(_e298.x) + _e301.y);
    let _e305 = u_xlat6_;
    let _e307 = u_xlat3_;
    let _e310 = u_xlat0_;
    u_xlat0_.x = ((_e305.y * _e307.x) + _e310.x);
    let _e313 = u_xlat3_;
    let _e315 = u_xlat6_;
    let _e326 = ((_e315.xy * vec2<f32>(2f, 2f)) + vec2<f32>(-1f, -1f));
    u_xlat3_.x = _e326.x;
    u_xlat3_.y = _e326.y;
    let _e332 = u_xlat3_;
    let _e334 = u_xlat3_;
    u_xlat3_.x = dot(_e332.xy, _e334.xy);
    let _e338 = u_xlat3_;
    u_xlat3_.x = (-(_e338.x) + 1f);
    let _e344 = u_xlat3_;
    let _e349 = _v_buffer2_.v_cb2_[17];
    u_xlat3_.x = (_e344.x * _e349.x);
    let _e353 = u_xlat3_;
    u_xlat3_.x = clamp(_e353.x, 0f, 1f);
    let _e359 = u_xlat0_;
    let _e361 = u_xlat3_;
    u_xlat0_.x = (_e359.x * _e361.x);
    let _e365 = u_xlat0_;
    u_xlat0_.x = clamp(_e365.x, 0f, 1f);
    let _e371 = u_xlat0_;
    let _e373 = in_COLOR0_1;
    u_xlat3_.x = (_e371.x * _e373.w);
    let _e377 = in_COLOR0_1;
    let _e380 = u_xlat0_;
    u_xlat0_.x = ((-(_e377.w) * _e380.x) + 1f);
    let _e386 = u_xlat0_;
    let _e391 = _v_buffer2_.v_cb2_[12];
    u_xlat0_.x = (_e386.x + -(_e391.w));
    let _e396 = u_xlat3_;
    let _e401 = _v_buffer2_.v_cb2_[13];
    u_xlat1_.w = max(_e396.x, _e401.x);
    let _e404 = u_xlat1_;
    let _e406 = in_COLOR0_1;
    let _e407 = _e406.xyz;
    u_xlat1_.x = _e407.x;
    u_xlat1_.y = _e407.y;
    u_xlat1_.z = _e407.z;
    let _e414 = u_xlat1_;
    let _e418 = _v_buffer2_.v_cb2_[0];
    u_xlat1_ = (_e414 * _e418);
    let _e421 = u_xlat1_;
    let _e423 = u_xlat1_;
    u_xlat3_.x = max(_e421.y, _e423.x);
    let _e427 = u_xlat1_;
    let _e429 = u_xlat3_;
    u_xlat3_.x = max(_e427.z, _e429.x);
    let _e433 = u_xlat3_;
    u_xlat3_.x = ((_e433.x * 2f) + -1f);
    let _e441 = u_xlat3_;
    u_xlat3_.x = clamp(_e441.x, 0f, 1f);
    let _e447 = u_xlat3_;
    u_xlat2_.w = (-(_e447.x) + 1f);
    let _e452 = u_xlat2_;
    let _e454 = u_xlat1_;
    let _e456 = u_xlat1_;
    let _e458 = (_e454.xyz + _e456.xyz);
    u_xlat2_.x = _e458.x;
    u_xlat2_.y = _e458.y;
    u_xlat2_.z = _e458.z;
    let _e466 = u_xlat1_;
    let _e471 = _v_buffer2_.v_cb2_[2];
    u_xlat3_.x = (_e466.w * _e471.w);
    let _e474 = u_xlat3_;
    let _e476 = u_xlat2_;
    vs_COLOR0_ = (_e474.xxxx * _e476);
    let _e482 = _v_buffer2_.v_cb2_[12];
    u_xlat3_.x = (_e482.y * 1.01f);
    let _e487 = u_xlat3_;
    let _e489 = u_xlat0_;
    u_xlat0_.x = max(_e487.x, _e489.x);
    let _e496 = _v_buffer2_.v_cb2_[12];
    u_xlat3_.x = ((_e496.z * 2f) + 1f);
    let _e502 = u_xlat0_;
    let _e504 = u_xlat3_;
    let _e510 = _v_buffer2_.v_cb2_[12];
    vs_TEXCOORD1_ = ((_e502.x * _e504.x) + -(_e510.z));
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
