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
    let _e274 = u_xlat0_;
    let _e279 = _v_buffer2_.v_cb2_[19];
    let _e285 = _v_buffer2_.v_cb2_[19];
    let _e287 = (-(_e279.xz) + _e285.yw);
    u_xlat0_.x = _e287.x;
    u_xlat0_.y = _e287.y;
    let _e292 = u_xlat6_;
    let _e294 = in_TEXCOORD0_1;
    let _e299 = _v_buffer2_.v_cb2_[18];
    let _e305 = _v_buffer2_.v_cb2_[18];
    let _e307 = ((_e294.xy * _e299.xy) + _e305.zw);
    u_xlat6_.x = _e307.x;
    u_xlat6_.y = _e307.y;
    let _e312 = u_xlat0_;
    let _e314 = u_xlat6_;
    let _e316 = u_xlat0_;
    let _e322 = _v_buffer2_.v_cb2_[19];
    let _e324 = ((_e314.xx * _e316.xy) + _e322.xz);
    u_xlat0_.x = _e324.x;
    u_xlat0_.y = _e324.y;
    let _e330 = u_xlat0_;
    let _e333 = u_xlat0_;
    u_xlat3_.x = (-(_e330.x) + _e333.y);
    let _e337 = u_xlat6_;
    let _e339 = u_xlat3_;
    let _e342 = u_xlat0_;
    u_xlat0_.x = ((_e337.y * _e339.x) + _e342.x);
    let _e345 = u_xlat3_;
    let _e347 = u_xlat6_;
    let _e358 = ((_e347.xy * vec2<f32>(2f, 2f)) + vec2<f32>(-1f, -1f));
    u_xlat3_.x = _e358.x;
    u_xlat3_.y = _e358.y;
    let _e364 = u_xlat3_;
    let _e366 = u_xlat3_;
    u_xlat3_.x = dot(_e364.xy, _e366.xy);
    let _e370 = u_xlat3_;
    u_xlat3_.x = (-(_e370.x) + 1f);
    let _e376 = u_xlat3_;
    let _e381 = _v_buffer2_.v_cb2_[17];
    u_xlat3_.x = (_e376.x * _e381.x);
    let _e385 = u_xlat3_;
    u_xlat3_.x = clamp(_e385.x, 0f, 1f);
    let _e391 = u_xlat0_;
    let _e393 = u_xlat3_;
    u_xlat0_.x = (_e391.x * _e393.x);
    let _e397 = u_xlat0_;
    u_xlat0_.x = clamp(_e397.x, 0f, 1f);
    let _e403 = u_xlat0_;
    let _e405 = in_COLOR0_1;
    u_xlat3_.x = (_e403.x * _e405.w);
    let _e409 = in_COLOR0_1;
    let _e412 = u_xlat0_;
    u_xlat0_.x = ((-(_e409.w) * _e412.x) + 1f);
    let _e418 = u_xlat0_;
    let _e423 = _v_buffer2_.v_cb2_[12];
    u_xlat0_.x = (_e418.x + -(_e423.w));
    let _e428 = u_xlat3_;
    let _e433 = _v_buffer2_.v_cb2_[13];
    vs_COLOR1_.w = max(_e428.x, _e433.x);
    let _e436 = vs_COLOR1_;
    vs_COLOR1_.x = 0f;
    vs_COLOR1_.y = 0f;
    vs_COLOR1_.z = 0f;
    let _e445 = u_xlat1_;
    let _e447 = in_COLOR0_1;
    let _e448 = _e447.xyz;
    u_xlat1_.x = _e448.x;
    u_xlat1_.y = _e448.y;
    u_xlat1_.z = _e448.z;
    u_xlat1_.w = 1f;
    let _e457 = u_xlat1_;
    let _e461 = _v_buffer2_.v_cb2_[0];
    u_xlat1_ = (_e457 * _e461);
    let _e464 = u_xlat1_;
    let _e466 = u_xlat1_;
    u_xlat3_.x = max(_e464.y, _e466.x);
    let _e470 = u_xlat1_;
    let _e472 = u_xlat3_;
    u_xlat3_.x = max(_e470.z, _e472.x);
    let _e476 = u_xlat3_;
    u_xlat3_.x = ((_e476.x * 2f) + -1f);
    let _e484 = u_xlat3_;
    u_xlat3_.x = clamp(_e484.x, 0f, 1f);
    let _e490 = u_xlat3_;
    u_xlat2_.w = (-(_e490.x) + 1f);
    let _e495 = u_xlat2_;
    let _e497 = u_xlat1_;
    let _e499 = u_xlat1_;
    let _e501 = (_e497.xyz + _e499.xyz);
    u_xlat2_.x = _e501.x;
    u_xlat2_.y = _e501.y;
    u_xlat2_.z = _e501.z;
    let _e509 = u_xlat1_;
    let _e514 = _v_buffer2_.v_cb2_[2];
    u_xlat3_.x = (_e509.w * _e514.w);
    let _e517 = u_xlat3_;
    let _e519 = u_xlat2_;
    vs_COLOR0_ = (_e517.xxxx * _e519);
    let _e525 = _v_buffer2_.v_cb2_[12];
    u_xlat3_.x = (_e525.y * 1.01f);
    let _e530 = u_xlat3_;
    let _e532 = u_xlat0_;
    u_xlat0_.x = max(_e530.x, _e532.x);
    let _e539 = _v_buffer2_.v_cb2_[12];
    u_xlat3_.x = ((_e539.z * 2f) + 1f);
    let _e545 = u_xlat0_;
    let _e547 = u_xlat3_;
    let _e553 = _v_buffer2_.v_cb2_[12];
    vs_TEXCOORD1_ = ((_e545.x * _e547.x) + -(_e553.z));
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
