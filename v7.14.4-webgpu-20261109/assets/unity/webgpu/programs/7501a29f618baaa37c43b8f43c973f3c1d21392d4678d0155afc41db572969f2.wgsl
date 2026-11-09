struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 8>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 17>,
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
var<private> in_NORMAL0_1: vec3<f32>;
var<private> vs_TEXCOORD0_: vec4<f32>;
var<private> vs_COLOR1_: vec4<f32>;
var<private> vs_COLOR0_: vec4<f32>;
var<private> vs_TEXCOORD1_: f32;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec4<f32> = vec4(0f);
    var u_xlat4_: vec4<f32> = vec4(0f);
    var u_xlat5_: f32 = 0f;
    var u_xlat10_: vec2<f32> = vec2(0f);
    var u_xlat15_: f32 = 0f;

    let _e47 = in_POSITION0_1;
    let _e52 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e47.yyyy * _e52);
    let _e57 = _v_buffer1_.v_cb1_[0];
    let _e58 = in_POSITION0_1;
    let _e61 = u_xlat0_;
    u_xlat0_ = ((_e57 * _e58.xxxx) + _e61);
    let _e66 = _v_buffer1_.v_cb1_[2];
    let _e67 = in_POSITION0_1;
    let _e70 = u_xlat0_;
    u_xlat0_ = ((_e66 * _e67.zzzz) + _e70);
    let _e72 = u_xlat0_;
    let _e76 = _v_buffer1_.v_cb1_[3];
    u_xlat1_ = (_e72 + _e76);
    let _e78 = u_xlat0_;
    let _e83 = _v_buffer1_.v_cb1_[3];
    let _e85 = in_POSITION0_1;
    let _e88 = u_xlat0_;
    let _e90 = ((_e83.xz * _e85.ww) + _e88.xz);
    u_xlat0_.x = _e90.x;
    u_xlat0_.y = _e90.y;
    let _e95 = u_xlat0_;
    let _e97 = u_xlat0_;
    let _e102 = _v_buffer2_.v_cb2_[4];
    let _e108 = _v_buffer2_.v_cb2_[4];
    let _e110 = ((_e97.xy * _e102.xy) + _e108.zw);
    u_xlat0_.x = _e110.x;
    u_xlat0_.y = _e110.y;
    let _e115 = u_xlat1_;
    let _e120 = _v_buffer0_.v_cb0_[80];
    u_xlat2_ = (_e115.yyyy * _e120);
    let _e125 = _v_buffer0_.v_cb0_[79];
    let _e126 = u_xlat1_;
    let _e129 = u_xlat2_;
    u_xlat2_ = ((_e125 * _e126.xxxx) + _e129);
    let _e134 = _v_buffer0_.v_cb0_[81];
    let _e135 = u_xlat1_;
    let _e138 = u_xlat2_;
    u_xlat2_ = ((_e134 * _e135.zzzz) + _e138);
    let _e144 = _v_buffer0_.v_cb0_[82];
    let _e145 = u_xlat1_;
    let _e148 = u_xlat2_;
    gl_Position = ((_e144 * _e145.wwww) + _e148);
    let _e150 = u_xlat10_;
    let _e152 = u_xlat0_;
    let _e155 = u_xlat0_;
    let _e157 = (-(_e152.xy) + _e155.yx);
    u_xlat10_.x = _e157.x;
    u_xlat10_.y = _e157.y;
    let _e162 = u_xlat0_;
    let _e167 = _v_buffer2_.v_cb2_[6];
    let _e169 = u_xlat10_;
    let _e172 = u_xlat0_;
    let _e174 = ((_e167.yy * _e169.xy) + _e172.xy);
    u_xlat0_.x = _e174.x;
    u_xlat0_.y = _e174.y;
    let _e179 = u_xlat10_;
    let _e184 = _v_buffer0_.v_cb0_[15];
    let _e189 = _v_buffer2_.v_cb2_[5];
    let _e191 = (_e184.zz * _e189.xy);
    u_xlat10_.x = _e191.x;
    u_xlat10_.y = _e191.y;
    let _e196 = u_xlat10_;
    let _e198 = u_xlat10_;
    let _e200 = fract(_e198.xy);
    u_xlat10_.x = _e200.x;
    u_xlat10_.y = _e200.y;
    let _e205 = vs_TEXCOORD0_;
    let _e207 = u_xlat10_;
    let _e209 = u_xlat0_;
    let _e211 = (_e207.xy + _e209.xy);
    vs_TEXCOORD0_.z = _e211.x;
    vs_TEXCOORD0_.w = _e211.y;
    let _e216 = u_xlat0_;
    let _e218 = in_TEXCOORD0_1;
    let _e223 = _v_buffer2_.v_cb2_[1];
    let _e229 = _v_buffer2_.v_cb2_[1];
    let _e231 = ((_e218.xy * _e223.xy) + _e229.zw);
    u_xlat0_.x = _e231.x;
    u_xlat0_.y = _e231.y;
    let _e236 = u_xlat10_;
    let _e238 = u_xlat0_;
    let _e241 = u_xlat0_;
    let _e243 = (-(_e238.xy) + _e241.yx);
    u_xlat10_.x = _e243.x;
    u_xlat10_.y = _e243.y;
    let _e248 = vs_TEXCOORD0_;
    let _e253 = _v_buffer2_.v_cb2_[2];
    let _e255 = u_xlat10_;
    let _e258 = u_xlat0_;
    let _e260 = ((_e253.zz * _e255.xy) + _e258.xy);
    vs_TEXCOORD0_.x = _e260.x;
    vs_TEXCOORD0_.y = _e260.y;
    vs_COLOR1_ = vec4<f32>(0f, 0f, 0f, 0f);
    let _e270 = u_xlat0_;
    let _e275 = _v_buffer0_.v_cb0_[21];
    let _e280 = _v_buffer1_.v_cb1_[5];
    let _e282 = (_e275.yyy * _e280.xyz);
    u_xlat0_.x = _e282.x;
    u_xlat0_.y = _e282.y;
    u_xlat0_.z = _e282.z;
    let _e289 = u_xlat0_;
    let _e294 = _v_buffer1_.v_cb1_[4];
    let _e299 = _v_buffer0_.v_cb0_[21];
    let _e302 = u_xlat0_;
    let _e304 = ((_e294.xyz * _e299.xxx) + _e302.xyz);
    u_xlat0_.x = _e304.x;
    u_xlat0_.y = _e304.y;
    u_xlat0_.z = _e304.z;
    let _e311 = u_xlat0_;
    let _e316 = _v_buffer1_.v_cb1_[6];
    let _e321 = _v_buffer0_.v_cb0_[21];
    let _e324 = u_xlat0_;
    let _e326 = ((_e316.xyz * _e321.zzz) + _e324.xyz);
    u_xlat0_.x = _e326.x;
    u_xlat0_.y = _e326.y;
    u_xlat0_.z = _e326.z;
    let _e333 = u_xlat0_;
    let _e335 = u_xlat0_;
    let _e340 = _v_buffer1_.v_cb1_[7];
    let _e342 = (_e335.xyz + _e340.xyz);
    u_xlat0_.x = _e342.x;
    u_xlat0_.y = _e342.y;
    u_xlat0_.z = _e342.z;
    let _e349 = u_xlat0_;
    let _e351 = u_xlat0_;
    let _e353 = in_POSITION0_1;
    let _e356 = (_e351.xyz + -(_e353.xyz));
    u_xlat0_.x = _e356.x;
    u_xlat0_.y = _e356.y;
    u_xlat0_.z = _e356.z;
    let _e363 = u_xlat0_;
    let _e365 = u_xlat0_;
    u_xlat15_ = dot(_e363.xyz, _e365.xyz);
    let _e368 = u_xlat15_;
    u_xlat15_ = inverseSqrt(_e368);
    let _e370 = u_xlat0_;
    let _e372 = u_xlat15_;
    let _e374 = u_xlat0_;
    let _e376 = (vec3(_e372) * _e374.xyz);
    u_xlat0_.x = _e376.x;
    u_xlat0_.y = _e376.y;
    u_xlat0_.z = _e376.z;
    let _e384 = in_NORMAL0_1;
    let _e386 = u_xlat0_;
    u_xlat0_.x = dot(_e384.xyz, _e386.xyz);
    let _e390 = u_xlat0_;
    u_xlat0_.x = (-(abs(_e390.x)) + 1f);
    let _e397 = u_xlat0_;
    u_xlat0_.x = log2(abs(_e397.x));
    let _e402 = u_xlat0_;
    let _e407 = _v_buffer2_.v_cb2_[16];
    u_xlat0_.x = (_e402.x * _e407.x);
    let _e411 = u_xlat0_;
    u_xlat0_.x = exp2(_e411.x);
    let _e414 = u_xlat1_;
    let _e419 = _v_buffer2_.v_cb2_[14];
    let _e424 = _v_buffer2_.v_cb2_[16];
    let _e426 = (_e419.xyz * _e424.yyy);
    u_xlat1_.x = _e426.x;
    u_xlat1_.y = _e426.y;
    u_xlat1_.z = _e426.z;
    let _e433 = u_xlat2_;
    let _e438 = _v_buffer2_.v_cb2_[15];
    let _e443 = _v_buffer2_.v_cb2_[16];
    let _e446 = u_xlat1_;
    let _e449 = ((_e438.xyz * _e443.zzz) + -(_e446.xyz));
    u_xlat2_.x = _e449.x;
    u_xlat2_.y = _e449.y;
    u_xlat2_.z = _e449.z;
    let _e460 = _v_buffer2_.v_cb2_[14];
    u_xlat1_.w = _e460.w;
    let _e463 = u_xlat1_;
    let _e469 = _v_buffer2_.v_cb2_[15];
    u_xlat2_.w = (-(_e463.w) + _e469.w);
    let _e472 = u_xlat0_;
    let _e474 = u_xlat2_;
    let _e476 = u_xlat1_;
    u_xlat0_ = ((_e472.xxxx * _e474) + _e476);
    let _e479 = in_COLOR0_1;
    let _e484 = _v_buffer2_.v_cb2_[13];
    u_xlat1_.w = max(_e479.w, _e484.x);
    let _e487 = u_xlat1_;
    let _e489 = in_COLOR0_1;
    let _e490 = _e489.xyz;
    u_xlat1_.x = _e490.x;
    u_xlat1_.y = _e490.y;
    u_xlat1_.z = _e490.z;
    let _e497 = u_xlat1_;
    let _e501 = _v_buffer2_.v_cb2_[0];
    u_xlat1_ = (_e497 * _e501);
    let _e504 = u_xlat1_;
    let _e506 = u_xlat1_;
    u_xlat2_.x = max(_e504.y, _e506.x);
    let _e510 = u_xlat1_;
    let _e512 = u_xlat2_;
    u_xlat2_.x = max(_e510.z, _e512.x);
    let _e516 = u_xlat2_;
    u_xlat2_.x = ((_e516.x * 2f) + -1f);
    let _e524 = u_xlat2_;
    u_xlat2_.x = clamp(_e524.x, 0f, 1f);
    let _e530 = u_xlat2_;
    u_xlat2_.w = (-(_e530.x) + 1f);
    let _e535 = u_xlat2_;
    let _e537 = u_xlat1_;
    let _e539 = u_xlat1_;
    let _e541 = (_e537.xyz + _e539.xyz);
    u_xlat2_.x = _e541.x;
    u_xlat2_.y = _e541.y;
    u_xlat2_.z = _e541.z;
    let _e549 = u_xlat1_;
    let _e554 = _v_buffer2_.v_cb2_[2];
    u_xlat1_.x = (_e549.w * _e554.w);
    let _e557 = u_xlat1_;
    let _e559 = u_xlat2_;
    u_xlat3_ = (_e557.xxxx * _e559);
    let _e561 = u_xlat4_;
    let _e563 = u_xlat0_;
    let _e565 = u_xlat3_;
    let _e567 = (_e563.xyz * _e565.www);
    u_xlat4_.x = _e567.x;
    u_xlat4_.y = _e567.y;
    u_xlat4_.z = _e567.z;
    let _e574 = u_xlat0_;
    let _e575 = u_xlat3_;
    u_xlat3_ = (_e574 * _e575);
    u_xlat4_.w = 0f;
    let _e579 = u_xlat2_;
    let _e580 = u_xlat1_;
    let _e583 = u_xlat4_;
    u_xlat1_ = ((_e579 * _e580.xxxx) + _e583);
    let _e585 = u_xlat1_;
    let _e586 = u_xlat0_;
    let _e589 = u_xlat3_;
    u_xlat0_ = ((_e585 * _e586.wwww) + -(_e589));
    let _e595 = _v_buffer2_.v_cb2_[16];
    let _e597 = u_xlat0_;
    let _e599 = u_xlat3_;
    vs_COLOR0_ = ((_e595.wwww * _e597) + _e599);
    let _e602 = in_COLOR0_1;
    u_xlat0_.x = (-(_e602.w) + 1f);
    let _e608 = u_xlat0_;
    let _e613 = _v_buffer2_.v_cb2_[12];
    u_xlat0_.x = (_e608.x + -(_e613.w));
    let _e620 = _v_buffer2_.v_cb2_[12];
    u_xlat5_ = (_e620.y * 1.01f);
    let _e625 = u_xlat5_;
    let _e626 = u_xlat0_;
    u_xlat0_.x = max(_e625, _e626.x);
    let _e632 = _v_buffer2_.v_cb2_[12];
    u_xlat5_ = ((_e632.z * 2f) + 1f);
    let _e638 = u_xlat0_;
    let _e640 = u_xlat5_;
    let _e645 = _v_buffer2_.v_cb2_[12];
    vs_TEXCOORD1_ = ((_e638.x * _e640) + -(_e645.z));
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(3) in_COLOR0_: vec4<f32>, @location(1) in_NORMAL0_: vec3<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_COLOR0_1 = in_COLOR0_;
    in_NORMAL0_1 = in_NORMAL0_;
    main_1();
    let _e34 = vs_TEXCOORD0_;
    let _e36 = vs_COLOR1_;
    let _e38 = vs_COLOR0_;
    let _e40 = vs_TEXCOORD1_;
    let _e42 = gl_Position;
    return VertexOutput(_e34, _e36, _e38, _e40, _e42);
}
