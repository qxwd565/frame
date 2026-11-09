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
    u_xlat1_ = (_e61 + _e65);
    let _e67 = u_xlat0_;
    let _e72 = _v_buffer1_.v_cb1_[3];
    let _e74 = in_POSITION0_1;
    let _e77 = u_xlat0_;
    let _e79 = ((_e72.xz * _e74.ww) + _e77.xz);
    u_xlat0_.x = _e79.x;
    u_xlat0_.y = _e79.y;
    let _e84 = u_xlat0_;
    let _e86 = u_xlat0_;
    let _e91 = _v_buffer2_.v_cb2_[4];
    let _e97 = _v_buffer2_.v_cb2_[4];
    let _e99 = ((_e86.xy * _e91.xy) + _e97.zw);
    u_xlat0_.x = _e99.x;
    u_xlat0_.y = _e99.y;
    let _e104 = u_xlat1_;
    let _e109 = _v_buffer0_.v_cb0_[80];
    u_xlat2_ = (_e104.yyyy * _e109);
    let _e114 = _v_buffer0_.v_cb0_[79];
    let _e115 = u_xlat1_;
    let _e118 = u_xlat2_;
    u_xlat2_ = ((_e114 * _e115.xxxx) + _e118);
    let _e123 = _v_buffer0_.v_cb0_[81];
    let _e124 = u_xlat1_;
    let _e127 = u_xlat2_;
    u_xlat2_ = ((_e123 * _e124.zzzz) + _e127);
    let _e133 = _v_buffer0_.v_cb0_[82];
    let _e134 = u_xlat1_;
    let _e137 = u_xlat2_;
    gl_Position = ((_e133 * _e134.wwww) + _e137);
    let _e139 = u_xlat6_;
    let _e141 = u_xlat0_;
    let _e144 = u_xlat0_;
    let _e146 = (-(_e141.xy) + _e144.yx);
    u_xlat6_.x = _e146.x;
    u_xlat6_.y = _e146.y;
    let _e151 = u_xlat0_;
    let _e156 = _v_buffer2_.v_cb2_[6];
    let _e158 = u_xlat6_;
    let _e161 = u_xlat0_;
    let _e163 = ((_e156.yy * _e158.xy) + _e161.xy);
    u_xlat0_.x = _e163.x;
    u_xlat0_.y = _e163.y;
    let _e168 = u_xlat6_;
    let _e173 = _v_buffer0_.v_cb0_[15];
    let _e178 = _v_buffer2_.v_cb2_[5];
    let _e180 = (_e173.zz * _e178.xy);
    u_xlat6_.x = _e180.x;
    u_xlat6_.y = _e180.y;
    let _e185 = u_xlat6_;
    let _e187 = u_xlat6_;
    let _e189 = fract(_e187.xy);
    u_xlat6_.x = _e189.x;
    u_xlat6_.y = _e189.y;
    let _e194 = vs_TEXCOORD0_;
    let _e196 = u_xlat6_;
    let _e198 = u_xlat0_;
    let _e200 = (_e196.xy + _e198.xy);
    vs_TEXCOORD0_.z = _e200.x;
    vs_TEXCOORD0_.w = _e200.y;
    let _e205 = u_xlat0_;
    let _e207 = in_TEXCOORD0_1;
    let _e212 = _v_buffer2_.v_cb2_[1];
    let _e218 = _v_buffer2_.v_cb2_[1];
    let _e220 = ((_e207.xy * _e212.xy) + _e218.zw);
    u_xlat0_.x = _e220.x;
    u_xlat0_.y = _e220.y;
    let _e225 = u_xlat6_;
    let _e227 = u_xlat0_;
    let _e230 = u_xlat0_;
    let _e232 = (-(_e227.xy) + _e230.yx);
    u_xlat6_.x = _e232.x;
    u_xlat6_.y = _e232.y;
    let _e237 = u_xlat0_;
    let _e242 = _v_buffer2_.v_cb2_[2];
    let _e244 = u_xlat6_;
    let _e247 = u_xlat0_;
    let _e249 = ((_e242.zz * _e244.xy) + _e247.xy);
    u_xlat0_.x = _e249.x;
    u_xlat0_.y = _e249.y;
    let _e254 = u_xlat6_;
    let _e259 = _v_buffer0_.v_cb0_[15];
    let _e264 = _v_buffer2_.v_cb2_[11];
    let _e266 = (_e259.zz * _e264.yz);
    u_xlat6_.x = _e266.x;
    u_xlat6_.y = _e266.y;
    let _e271 = u_xlat6_;
    let _e273 = u_xlat6_;
    let _e275 = fract(_e273.xy);
    u_xlat6_.x = _e275.x;
    u_xlat6_.y = _e275.y;
    let _e280 = vs_TEXCOORD0_;
    let _e282 = u_xlat6_;
    let _e284 = u_xlat0_;
    let _e286 = (_e282.xy + _e284.xy);
    vs_TEXCOORD0_.x = _e286.x;
    vs_TEXCOORD0_.y = _e286.y;
    let _e291 = u_xlat0_;
    let _e296 = _v_buffer2_.v_cb2_[19];
    let _e302 = _v_buffer2_.v_cb2_[19];
    let _e304 = (-(_e296.xz) + _e302.yw);
    u_xlat0_.x = _e304.x;
    u_xlat0_.y = _e304.y;
    let _e309 = u_xlat6_;
    let _e311 = in_TEXCOORD0_1;
    let _e316 = _v_buffer2_.v_cb2_[18];
    let _e322 = _v_buffer2_.v_cb2_[18];
    let _e324 = ((_e311.xy * _e316.xy) + _e322.zw);
    u_xlat6_.x = _e324.x;
    u_xlat6_.y = _e324.y;
    let _e329 = u_xlat0_;
    let _e331 = u_xlat6_;
    let _e333 = u_xlat0_;
    let _e339 = _v_buffer2_.v_cb2_[19];
    let _e341 = ((_e331.xx * _e333.xy) + _e339.xz);
    u_xlat0_.x = _e341.x;
    u_xlat0_.y = _e341.y;
    let _e347 = u_xlat0_;
    let _e350 = u_xlat0_;
    u_xlat3_.x = (-(_e347.x) + _e350.y);
    let _e354 = u_xlat6_;
    let _e356 = u_xlat3_;
    let _e359 = u_xlat0_;
    u_xlat0_.x = ((_e354.y * _e356.x) + _e359.x);
    let _e362 = u_xlat3_;
    let _e364 = u_xlat6_;
    let _e375 = ((_e364.xy * vec2<f32>(2f, 2f)) + vec2<f32>(-1f, -1f));
    u_xlat3_.x = _e375.x;
    u_xlat3_.y = _e375.y;
    let _e381 = u_xlat3_;
    let _e383 = u_xlat3_;
    u_xlat3_.x = dot(_e381.xy, _e383.xy);
    let _e387 = u_xlat3_;
    u_xlat3_.x = (-(_e387.x) + 1f);
    let _e393 = u_xlat3_;
    let _e398 = _v_buffer2_.v_cb2_[17];
    u_xlat3_.x = (_e393.x * _e398.x);
    let _e402 = u_xlat3_;
    u_xlat3_.x = clamp(_e402.x, 0f, 1f);
    let _e408 = u_xlat0_;
    let _e410 = u_xlat3_;
    u_xlat0_.x = (_e408.x * _e410.x);
    let _e414 = u_xlat0_;
    u_xlat0_.x = clamp(_e414.x, 0f, 1f);
    let _e420 = u_xlat0_;
    let _e422 = in_COLOR0_1;
    u_xlat3_.x = (_e420.x * _e422.w);
    let _e426 = in_COLOR0_1;
    let _e429 = u_xlat0_;
    u_xlat0_.x = ((-(_e426.w) * _e429.x) + 1f);
    let _e435 = u_xlat0_;
    let _e440 = _v_buffer2_.v_cb2_[12];
    u_xlat0_.x = (_e435.x + -(_e440.w));
    let _e445 = u_xlat3_;
    let _e450 = _v_buffer2_.v_cb2_[13];
    vs_COLOR1_.w = max(_e445.x, _e450.x);
    let _e453 = vs_COLOR1_;
    vs_COLOR1_.x = 0f;
    vs_COLOR1_.y = 0f;
    vs_COLOR1_.z = 0f;
    let _e462 = u_xlat1_;
    let _e464 = in_COLOR0_1;
    let _e465 = _e464.xyz;
    u_xlat1_.x = _e465.x;
    u_xlat1_.y = _e465.y;
    u_xlat1_.z = _e465.z;
    u_xlat1_.w = 1f;
    let _e474 = u_xlat1_;
    let _e478 = _v_buffer2_.v_cb2_[0];
    u_xlat1_ = (_e474 * _e478);
    let _e481 = u_xlat1_;
    let _e483 = u_xlat1_;
    u_xlat3_.x = max(_e481.y, _e483.x);
    let _e487 = u_xlat1_;
    let _e489 = u_xlat3_;
    u_xlat3_.x = max(_e487.z, _e489.x);
    let _e493 = u_xlat3_;
    u_xlat3_.x = ((_e493.x * 2f) + -1f);
    let _e501 = u_xlat3_;
    u_xlat3_.x = clamp(_e501.x, 0f, 1f);
    let _e507 = u_xlat3_;
    u_xlat2_.w = (-(_e507.x) + 1f);
    let _e512 = u_xlat2_;
    let _e514 = u_xlat1_;
    let _e516 = u_xlat1_;
    let _e518 = (_e514.xyz + _e516.xyz);
    u_xlat2_.x = _e518.x;
    u_xlat2_.y = _e518.y;
    u_xlat2_.z = _e518.z;
    let _e526 = u_xlat1_;
    let _e531 = _v_buffer2_.v_cb2_[2];
    u_xlat3_.x = (_e526.w * _e531.w);
    let _e534 = u_xlat3_;
    let _e536 = u_xlat2_;
    vs_COLOR0_ = (_e534.xxxx * _e536);
    let _e542 = _v_buffer2_.v_cb2_[12];
    u_xlat3_.x = (_e542.y * 1.01f);
    let _e547 = u_xlat3_;
    let _e549 = u_xlat0_;
    u_xlat0_.x = max(_e547.x, _e549.x);
    let _e556 = _v_buffer2_.v_cb2_[12];
    u_xlat3_.x = ((_e556.z * 2f) + 1f);
    let _e562 = u_xlat0_;
    let _e564 = u_xlat3_;
    let _e570 = _v_buffer2_.v_cb2_[12];
    vs_TEXCOORD1_ = ((_e562.x * _e564.x) + -(_e570.z));
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
