struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 8>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 4>,
}

struct v_buffer3_ {
    v_cb3_: array<vec4<f32>, 21>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec4<f32>,
    @location(4) vs_TEXCOORD4_: vec3<f32>,
    @location(12) vs_NORMAL0_: vec3<f32>,
    @location(1) vs_TEXCOORD1_: vec3<f32>,
    @location(3) vs_TEXCOORDindex3_: vec4<f32>,
    @builtin(position) gl_Position: vec4<f32>,
}

@group(0) @binding(0) 
var<uniform> _v_buffer0_: v_buffer0_;
@group(0) @binding(1) 
var<uniform> _v_buffer1_: v_buffer1_;
@group(0) @binding(2) 
var<uniform> _v_buffer2_: v_buffer2_;
@group(0) @binding(3) 
var<uniform> _v_buffer3_: v_buffer3_;
@group(2) @binding(1) 
var samplerv_s0_: sampler;
@group(2) @binding(0) 
var v_t0_: texture_2d<f32>;
var<private> in_POSITION0_1: vec4<f32>;
var<private> in_TEXCOORD0_1: vec4<f32>;
var<private> in_NORMAL0_1: vec3<f32>;
var<private> vs_TEXCOORD0_: vec4<f32>;
var<private> vs_TEXCOORD4_: vec3<f32>;
var<private> vs_NORMAL0_: vec3<f32>;
var<private> vs_TEXCOORD1_: vec3<f32>;
var<private> vs_TEXCOORDindex3_: vec4<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec3<f32> = vec3(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: vec2<f32> = vec2(0f);
    var u_xlat6_: vec2<f32> = vec2(0f);
    var u_xlat7_: vec2<f32> = vec2(0f);
    var u_xlat11_: vec2<f32> = vec2(0f);
    var u_xlat15_: f32 = 0f;

    let _e57 = in_POSITION0_1;
    let _e62 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e57.yyyy * _e62);
    let _e67 = _v_buffer1_.v_cb1_[0];
    let _e68 = in_POSITION0_1;
    let _e71 = u_xlat0_;
    u_xlat0_ = ((_e67 * _e68.xxxx) + _e71);
    let _e76 = _v_buffer1_.v_cb1_[2];
    let _e77 = in_POSITION0_1;
    let _e80 = u_xlat0_;
    u_xlat0_ = ((_e76 * _e77.zzzz) + _e80);
    let _e85 = _v_buffer1_.v_cb1_[3];
    let _e86 = in_POSITION0_1;
    let _e89 = u_xlat0_;
    u_xlat0_ = ((_e85 * _e86.wwww) + _e89);
    let _e91 = u_xlat1_;
    let _e93 = u_xlat0_;
    let _e98 = _v_buffer3_.v_cb3_[1];
    let _e104 = _v_buffer3_.v_cb3_[1];
    let _e106 = ((_e93.xy * _e98.xy) + _e104.zw);
    u_xlat1_.x = _e106.x;
    u_xlat1_.y = _e106.y;
    let _e111 = u_xlat1_;
    let _e116 = _v_buffer0_.v_cb0_[15];
    let _e121 = _v_buffer3_.v_cb3_[15];
    let _e124 = u_xlat1_;
    let _e126 = ((_e116.xx * _e121.xx) + _e124.xy);
    u_xlat1_.x = _e126.x;
    u_xlat1_.y = _e126.y;
    let _e131 = u_xlat1_;
    let _e134 = textureSampleLevel(v_t0_, samplerv_s0_, _e131.xy, 0f);
    u_xlat1_ = _e134;
    let _e135 = u_xlat1_;
    u_xlat1_ = (_e135 + vec4<f32>(-0.5f, -0.5f, -0.5f, -0.5f));
    let _e146 = u_xlat1_;
    u_xlat1_ = (_e146 * vec4<f32>(0.5f, 0.5f, 0.5f, 0.5f));
    let _e153 = u_xlat1_;
    let _e157 = _v_buffer3_.v_cb3_[15];
    let _e160 = u_xlat0_;
    u_xlat0_ = ((_e153 * _e157.yyyy) + _e160);
    let _e162 = u_xlat0_;
    let _e166 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e162 + -(_e166));
    let _e169 = u_xlat0_;
    let _e173 = _v_buffer3_.v_cb3_[16];
    u_xlat0_ = (_e169 * _e173);
    let _e175 = u_xlat0_;
    let _e180 = _v_buffer3_.v_cb3_[18];
    u_xlat1_ = (_e175.yyyy * _e180);
    let _e185 = _v_buffer3_.v_cb3_[17];
    let _e186 = u_xlat0_;
    let _e189 = u_xlat1_;
    u_xlat1_ = ((_e185 * _e186.xxxx) + _e189);
    let _e194 = _v_buffer3_.v_cb3_[19];
    let _e195 = u_xlat0_;
    let _e198 = u_xlat1_;
    u_xlat1_ = ((_e194 * _e195.zzzz) + _e198);
    let _e203 = _v_buffer3_.v_cb3_[20];
    let _e204 = u_xlat0_;
    let _e207 = u_xlat1_;
    u_xlat0_ = ((_e203 * _e204.wwww) + _e207);
    let _e209 = u_xlat1_;
    let _e211 = u_xlat0_;
    let _e216 = _v_buffer1_.v_cb1_[5];
    let _e218 = (_e211.yyy * _e216.xyz);
    u_xlat1_.x = _e218.x;
    u_xlat1_.y = _e218.y;
    u_xlat1_.z = _e218.z;
    let _e225 = u_xlat1_;
    let _e230 = _v_buffer1_.v_cb1_[4];
    let _e232 = u_xlat0_;
    let _e235 = u_xlat1_;
    let _e237 = ((_e230.xyz * _e232.xxx) + _e235.xyz);
    u_xlat1_.x = _e237.x;
    u_xlat1_.y = _e237.y;
    u_xlat1_.z = _e237.z;
    let _e244 = u_xlat0_;
    let _e249 = _v_buffer1_.v_cb1_[6];
    let _e251 = u_xlat0_;
    let _e254 = u_xlat1_;
    let _e256 = ((_e249.xyz * _e251.zzz) + _e254.xyz);
    u_xlat0_.x = _e256.x;
    u_xlat0_.y = _e256.y;
    u_xlat0_.z = _e256.z;
    let _e263 = u_xlat0_;
    let _e268 = _v_buffer1_.v_cb1_[7];
    let _e270 = u_xlat0_;
    let _e273 = u_xlat0_;
    let _e275 = ((_e268.xyz * _e270.www) + _e273.xyz);
    u_xlat0_.x = _e275.x;
    u_xlat0_.y = _e275.y;
    u_xlat0_.z = _e275.z;
    let _e282 = u_xlat0_;
    let _e287 = _v_buffer1_.v_cb1_[1];
    u_xlat1_ = (_e282.yyyy * _e287);
    let _e292 = _v_buffer1_.v_cb1_[0];
    let _e293 = u_xlat0_;
    let _e296 = u_xlat1_;
    u_xlat1_ = ((_e292 * _e293.xxxx) + _e296);
    let _e301 = _v_buffer1_.v_cb1_[2];
    let _e302 = u_xlat0_;
    let _e305 = u_xlat1_;
    u_xlat0_ = ((_e301 * _e302.zzzz) + _e305);
    let _e307 = u_xlat0_;
    let _e311 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e307 + _e311);
    let _e313 = u_xlat0_;
    let _e318 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e313.yyyy * _e318);
    let _e323 = _v_buffer0_.v_cb0_[79];
    let _e324 = u_xlat0_;
    let _e327 = u_xlat1_;
    u_xlat1_ = ((_e323 * _e324.xxxx) + _e327);
    let _e332 = _v_buffer0_.v_cb0_[81];
    let _e333 = u_xlat0_;
    let _e336 = u_xlat1_;
    u_xlat1_ = ((_e332 * _e333.zzzz) + _e336);
    let _e342 = _v_buffer0_.v_cb0_[82];
    let _e343 = u_xlat0_;
    let _e346 = u_xlat1_;
    gl_Position = ((_e342 * _e343.wwww) + _e346);
    let _e351 = _v_buffer0_.v_cb0_[15];
    let _e356 = _v_buffer3_.v_cb3_[13];
    let _e362 = _v_buffer3_.v_cb3_[13];
    u_xlat15_ = ((_e351.x * _e356.y) + _e362.x);
    let _e366 = u_xlat15_;
    u_xlat1_.x = sin(_e366);
    let _e369 = u_xlat15_;
    u_xlat2_.x = cos(_e369);
    let _e372 = u_xlat1_;
    u_xlat3_.z = _e372.x;
    let _e374 = u_xlat6_;
    let _e376 = in_TEXCOORD0_1;
    let _e381 = _v_buffer3_.v_cb3_[0];
    let _e387 = _v_buffer3_.v_cb3_[0];
    let _e389 = ((_e376.xy * _e381.xy) + _e387.zw);
    u_xlat6_.x = _e389.x;
    u_xlat6_.y = _e389.y;
    let _e394 = u_xlat7_;
    let _e399 = _v_buffer3_.v_cb3_[12];
    let _e405 = _v_buffer3_.v_cb3_[13];
    let _e407 = (-(_e399.xy) + _e405.zw);
    u_xlat7_.x = _e407.x;
    u_xlat7_.y = _e407.y;
    let _e412 = u_xlat4_;
    let _e414 = u_xlat6_;
    let _e416 = u_xlat7_;
    let _e419 = (_e414.xy + -(_e416.xy));
    u_xlat4_.x = _e419.x;
    u_xlat4_.y = _e419.y;
    let _e424 = vs_TEXCOORD0_;
    let _e426 = u_xlat6_;
    let _e427 = _e426.xy;
    vs_TEXCOORD0_.x = _e427.x;
    vs_TEXCOORD0_.y = _e427.y;
    let _e433 = u_xlat2_;
    u_xlat3_.y = _e433.x;
    let _e436 = u_xlat1_;
    u_xlat3_.x = -(_e436.x);
    let _e440 = u_xlat4_;
    let _e442 = u_xlat3_;
    u_xlat11_.y = dot(_e440.xy, _e442.xy);
    let _e446 = u_xlat4_;
    let _e448 = u_xlat3_;
    u_xlat11_.x = dot(_e446.xy, _e448.yz);
    let _e451 = u_xlat1_;
    let _e453 = u_xlat7_;
    let _e455 = u_xlat11_;
    let _e457 = (_e453.xy + _e455.xy);
    u_xlat1_.x = _e457.x;
    u_xlat1_.y = _e457.y;
    let _e462 = u_xlat11_;
    let _e467 = _v_buffer3_.v_cb3_[12];
    let _e473 = _v_buffer3_.v_cb3_[14];
    let _e475 = (-(_e467.xy) + _e473.zw);
    u_xlat11_.x = _e475.x;
    u_xlat11_.y = _e475.y;
    let _e480 = u_xlat1_;
    let _e482 = u_xlat11_;
    let _e485 = u_xlat1_;
    let _e487 = (-(_e482.xy) + _e485.xy);
    u_xlat1_.x = _e487.x;
    u_xlat1_.y = _e487.y;
    let _e492 = u_xlat1_;
    let _e494 = u_xlat1_;
    let _e499 = _v_buffer3_.v_cb3_[14];
    let _e502 = u_xlat11_;
    let _e504 = ((_e494.xy * _e499.xy) + _e502.xy);
    u_xlat1_.x = _e504.x;
    u_xlat1_.y = _e504.y;
    let _e509 = u_xlat11_;
    let _e514 = _v_buffer3_.v_cb3_[12];
    let _e519 = _v_buffer0_.v_cb0_[15];
    let _e525 = _v_buffer3_.v_cb3_[12];
    let _e527 = ((_e514.zw * _e519.xx) + _e525.xy);
    u_xlat11_.x = _e527.x;
    u_xlat11_.y = _e527.y;
    let _e532 = vs_TEXCOORD0_;
    let _e534 = u_xlat11_;
    let _e536 = u_xlat1_;
    let _e538 = (_e534.xy + _e536.xy);
    vs_TEXCOORD0_.z = _e538.x;
    vs_TEXCOORD0_.w = _e538.y;
    let _e544 = in_NORMAL0_1;
    let _e549 = _v_buffer1_.v_cb1_[4];
    u_xlat1_.x = dot(_e544.xyz, _e549.xyz);
    let _e553 = in_NORMAL0_1;
    let _e558 = _v_buffer1_.v_cb1_[5];
    u_xlat1_.y = dot(_e553.xyz, _e558.xyz);
    let _e562 = in_NORMAL0_1;
    let _e567 = _v_buffer1_.v_cb1_[6];
    u_xlat1_.z = dot(_e562.xyz, _e567.xyz);
    let _e570 = u_xlat1_;
    let _e572 = u_xlat1_;
    u_xlat15_ = dot(_e570.xyz, _e572.xyz);
    let _e575 = u_xlat15_;
    u_xlat15_ = max(_e575, 0.000000000000000000000000000000000000011754944f);
    let _e578 = u_xlat15_;
    u_xlat15_ = inverseSqrt(_e578);
    let _e580 = u_xlat1_;
    let _e582 = u_xlat15_;
    let _e584 = u_xlat1_;
    let _e586 = (vec3(_e582) * _e584.xyz);
    u_xlat1_.x = _e586.x;
    u_xlat1_.y = _e586.y;
    u_xlat1_.z = _e586.z;
    let _e593 = u_xlat2_;
    let _e595 = u_xlat1_;
    let _e600 = _v_buffer0_.v_cb0_[68];
    let _e602 = (_e595.yyy * _e600.xyz);
    u_xlat2_.x = _e602.x;
    u_xlat2_.y = _e602.y;
    u_xlat2_.z = _e602.z;
    let _e609 = u_xlat2_;
    let _e614 = _v_buffer0_.v_cb0_[67];
    let _e616 = u_xlat1_;
    let _e619 = u_xlat2_;
    let _e621 = ((_e614.xyz * _e616.xxx) + _e619.xyz);
    u_xlat2_.x = _e621.x;
    u_xlat2_.y = _e621.y;
    u_xlat2_.z = _e621.z;
    let _e628 = u_xlat2_;
    let _e633 = _v_buffer0_.v_cb0_[69];
    let _e635 = u_xlat1_;
    let _e638 = u_xlat2_;
    let _e640 = ((_e633.xyz * _e635.zzz) + _e638.xyz);
    u_xlat2_.x = _e640.x;
    u_xlat2_.y = _e640.y;
    u_xlat2_.z = _e640.z;
    let _e647 = vs_NORMAL0_;
    let _e649 = u_xlat1_;
    let _e650 = _e649.xyz;
    vs_NORMAL0_.x = _e650.x;
    vs_NORMAL0_.y = _e650.y;
    vs_NORMAL0_.z = _e650.z;
    let _e657 = vs_TEXCOORD4_;
    let _e659 = u_xlat2_;
    let _e670 = ((_e659.xyz * vec3<f32>(0.5f, 0.5f, 0.5f)) + vec3<f32>(0.5f, 0.5f, 0.5f));
    vs_TEXCOORD4_.x = _e670.x;
    vs_TEXCOORD4_.y = _e670.y;
    vs_TEXCOORD4_.z = _e670.z;
    let _e677 = vs_TEXCOORD1_;
    let _e679 = u_xlat0_;
    let _e680 = _e679.xyz;
    vs_TEXCOORD1_.x = _e680.x;
    vs_TEXCOORD1_.y = _e680.y;
    vs_TEXCOORD1_.z = _e680.z;
    let _e687 = u_xlat1_;
    let _e689 = u_xlat0_;
    let _e694 = _v_buffer2_.v_cb2_[1];
    let _e696 = (_e689.yyy * _e694.xyz);
    u_xlat1_.x = _e696.x;
    u_xlat1_.y = _e696.y;
    u_xlat1_.z = _e696.z;
    let _e703 = u_xlat0_;
    let _e708 = _v_buffer2_.v_cb2_[0];
    let _e710 = u_xlat0_;
    let _e713 = u_xlat1_;
    let _e715 = ((_e708.xyz * _e710.xxx) + _e713.xyz);
    u_xlat0_.x = _e715.x;
    u_xlat0_.y = _e715.y;
    u_xlat0_.w = _e715.z;
    let _e722 = u_xlat0_;
    let _e727 = _v_buffer2_.v_cb2_[2];
    let _e729 = u_xlat0_;
    let _e732 = u_xlat0_;
    let _e734 = ((_e727.xyz * _e729.zzz) + _e732.xyw);
    u_xlat0_.x = _e734.x;
    u_xlat0_.y = _e734.y;
    u_xlat0_.z = _e734.z;
    let _e741 = vs_TEXCOORDindex3_;
    let _e743 = u_xlat0_;
    let _e748 = _v_buffer2_.v_cb2_[3];
    let _e750 = (_e743.xyz + _e748.xyz);
    vs_TEXCOORDindex3_.x = _e750.x;
    vs_TEXCOORDindex3_.y = _e750.y;
    vs_TEXCOORDindex3_.z = _e750.z;
    vs_TEXCOORDindex3_.w = 0f;
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec4<f32>, @location(1) in_NORMAL0_: vec3<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_NORMAL0_1 = in_NORMAL0_;
    main_1();
    let _e39 = vs_TEXCOORD0_;
    let _e41 = vs_TEXCOORD4_;
    let _e43 = vs_NORMAL0_;
    let _e45 = vs_TEXCOORD1_;
    let _e47 = vs_TEXCOORDindex3_;
    let _e49 = gl_Position;
    return VertexOutput(_e39, _e41, _e43, _e45, _e47, _e49);
}
