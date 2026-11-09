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
    let _e237 = vs_TEXCOORD0_;
    let _e242 = _v_buffer2_.v_cb2_[2];
    let _e244 = u_xlat6_;
    let _e247 = u_xlat0_;
    let _e249 = ((_e242.zz * _e244.xy) + _e247.xy);
    vs_TEXCOORD0_.x = _e249.x;
    vs_TEXCOORD0_.y = _e249.y;
    vs_COLOR1_ = vec4<f32>(0f, 0f, 0f, 0f);
    let _e259 = u_xlat0_;
    let _e264 = _v_buffer2_.v_cb2_[19];
    let _e270 = _v_buffer2_.v_cb2_[19];
    let _e272 = (-(_e264.xz) + _e270.yw);
    u_xlat0_.x = _e272.x;
    u_xlat0_.y = _e272.y;
    let _e277 = u_xlat6_;
    let _e279 = in_TEXCOORD0_1;
    let _e284 = _v_buffer2_.v_cb2_[18];
    let _e290 = _v_buffer2_.v_cb2_[18];
    let _e292 = ((_e279.xy * _e284.xy) + _e290.zw);
    u_xlat6_.x = _e292.x;
    u_xlat6_.y = _e292.y;
    let _e297 = u_xlat0_;
    let _e299 = u_xlat6_;
    let _e301 = u_xlat0_;
    let _e307 = _v_buffer2_.v_cb2_[19];
    let _e309 = ((_e299.xx * _e301.xy) + _e307.xz);
    u_xlat0_.x = _e309.x;
    u_xlat0_.y = _e309.y;
    let _e315 = u_xlat0_;
    let _e318 = u_xlat0_;
    u_xlat3_.x = (-(_e315.x) + _e318.y);
    let _e322 = u_xlat6_;
    let _e324 = u_xlat3_;
    let _e327 = u_xlat0_;
    u_xlat0_.x = ((_e322.y * _e324.x) + _e327.x);
    let _e330 = u_xlat3_;
    let _e332 = u_xlat6_;
    let _e343 = ((_e332.xy * vec2<f32>(2f, 2f)) + vec2<f32>(-1f, -1f));
    u_xlat3_.x = _e343.x;
    u_xlat3_.y = _e343.y;
    let _e349 = u_xlat3_;
    let _e351 = u_xlat3_;
    u_xlat3_.x = dot(_e349.xy, _e351.xy);
    let _e355 = u_xlat3_;
    u_xlat3_.x = (-(_e355.x) + 1f);
    let _e361 = u_xlat3_;
    let _e366 = _v_buffer2_.v_cb2_[17];
    u_xlat3_.x = (_e361.x * _e366.x);
    let _e370 = u_xlat3_;
    u_xlat3_.x = clamp(_e370.x, 0f, 1f);
    let _e376 = u_xlat0_;
    let _e378 = u_xlat3_;
    u_xlat0_.x = (_e376.x * _e378.x);
    let _e382 = u_xlat0_;
    u_xlat0_.x = clamp(_e382.x, 0f, 1f);
    let _e388 = u_xlat0_;
    let _e390 = in_COLOR0_1;
    u_xlat3_.x = (_e388.x * _e390.w);
    let _e394 = in_COLOR0_1;
    let _e397 = u_xlat0_;
    u_xlat0_.x = ((-(_e394.w) * _e397.x) + 1f);
    let _e403 = u_xlat0_;
    let _e408 = _v_buffer2_.v_cb2_[12];
    u_xlat0_.x = (_e403.x + -(_e408.w));
    let _e413 = u_xlat3_;
    let _e418 = _v_buffer2_.v_cb2_[13];
    u_xlat1_.w = max(_e413.x, _e418.x);
    let _e421 = u_xlat1_;
    let _e423 = in_COLOR0_1;
    let _e424 = _e423.xyz;
    u_xlat1_.x = _e424.x;
    u_xlat1_.y = _e424.y;
    u_xlat1_.z = _e424.z;
    let _e431 = u_xlat1_;
    let _e435 = _v_buffer2_.v_cb2_[0];
    u_xlat1_ = (_e431 * _e435);
    let _e438 = u_xlat1_;
    let _e440 = u_xlat1_;
    u_xlat3_.x = max(_e438.y, _e440.x);
    let _e444 = u_xlat1_;
    let _e446 = u_xlat3_;
    u_xlat3_.x = max(_e444.z, _e446.x);
    let _e450 = u_xlat3_;
    u_xlat3_.x = ((_e450.x * 2f) + -1f);
    let _e458 = u_xlat3_;
    u_xlat3_.x = clamp(_e458.x, 0f, 1f);
    let _e464 = u_xlat3_;
    u_xlat2_.w = (-(_e464.x) + 1f);
    let _e469 = u_xlat2_;
    let _e471 = u_xlat1_;
    let _e473 = u_xlat1_;
    let _e475 = (_e471.xyz + _e473.xyz);
    u_xlat2_.x = _e475.x;
    u_xlat2_.y = _e475.y;
    u_xlat2_.z = _e475.z;
    let _e483 = u_xlat1_;
    let _e488 = _v_buffer2_.v_cb2_[2];
    u_xlat3_.x = (_e483.w * _e488.w);
    let _e491 = u_xlat3_;
    let _e493 = u_xlat2_;
    vs_COLOR0_ = (_e491.xxxx * _e493);
    let _e499 = _v_buffer2_.v_cb2_[12];
    u_xlat3_.x = (_e499.y * 1.01f);
    let _e504 = u_xlat3_;
    let _e506 = u_xlat0_;
    u_xlat0_.x = max(_e504.x, _e506.x);
    let _e513 = _v_buffer2_.v_cb2_[12];
    u_xlat3_.x = ((_e513.z * 2f) + 1f);
    let _e519 = u_xlat0_;
    let _e521 = u_xlat3_;
    let _e527 = _v_buffer2_.v_cb2_[12];
    vs_TEXCOORD1_ = ((_e519.x * _e521.x) + -(_e527.z));
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
