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
    v_cb3_: array<vec4<f32>, 22>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec4<f32>,
    @location(4) vs_TEXCOORD4_: vec4<f32>,
    @location(5) vs_TEXCOORD5_: vec3<f32>,
    @location(12) vs_NORMAL0_: vec3<f32>,
    @location(10) vs_COLOR0_: vec3<f32>,
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
var<private> in_POSITION0_1: vec4<f32>;
var<private> in_TEXCOORD0_1: vec4<f32>;
var<private> in_NORMAL0_1: vec3<f32>;
var<private> vs_TEXCOORD0_: vec4<f32>;
var<private> vs_TEXCOORD4_: vec4<f32>;
var<private> vs_TEXCOORD5_: vec3<f32>;
var<private> vs_NORMAL0_: vec3<f32>;
var<private> vs_COLOR0_: vec3<f32>;
var<private> vs_TEXCOORD1_: vec3<f32>;
var<private> vs_TEXCOORDindex3_: vec4<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec2<f32> = vec2(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlat6_: vec2<f32> = vec2(0f);
    var u_xlat11_: vec2<f32> = vec2(0f);
    var u_xlat12_: vec2<f32> = vec2(0f);
    var u_xlat15_: f32 = 0f;
    var u_xlatb15_: bool = false;
    var local: f32;

    let _e60 = in_POSITION0_1;
    let _e65 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e60.yyyy * _e65);
    let _e70 = _v_buffer1_.v_cb1_[0];
    let _e71 = in_POSITION0_1;
    let _e74 = u_xlat0_;
    u_xlat0_ = ((_e70 * _e71.xxxx) + _e74);
    let _e79 = _v_buffer1_.v_cb1_[2];
    let _e80 = in_POSITION0_1;
    let _e83 = u_xlat0_;
    u_xlat0_ = ((_e79 * _e80.zzzz) + _e83);
    let _e85 = u_xlat0_;
    let _e89 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e85 + _e89);
    let _e91 = u_xlat0_;
    let _e96 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e91.yyyy * _e96);
    let _e101 = _v_buffer0_.v_cb0_[79];
    let _e102 = u_xlat0_;
    let _e105 = u_xlat1_;
    u_xlat1_ = ((_e101 * _e102.xxxx) + _e105);
    let _e110 = _v_buffer0_.v_cb0_[81];
    let _e111 = u_xlat0_;
    let _e114 = u_xlat1_;
    u_xlat1_ = ((_e110 * _e111.zzzz) + _e114);
    let _e120 = _v_buffer0_.v_cb0_[82];
    let _e121 = u_xlat0_;
    let _e124 = u_xlat1_;
    gl_Position = ((_e120 * _e121.wwww) + _e124);
    let _e130 = _v_buffer3_.v_cb3_[21];
    u_xlatb15_ = (0f < _e130.w);
    let _e137 = _v_buffer3_.v_cb3_[21];
    let _e142 = _v_buffer3_.v_cb3_[21];
    u_xlat1_.x = (_e137.w + _e142.z);
    let _e149 = _v_buffer0_.v_cb0_[15];
    let _e154 = _v_buffer3_.v_cb3_[21];
    u_xlat6_.x = (_e149.x + _e154.z);
    let _e157 = u_xlatb15_;
    if _e157 {
        let _e158 = u_xlat1_;
        local = _e158.x;
    } else {
        let _e160 = u_xlat6_;
        local = _e160.x;
    }
    let _e163 = local;
    u_xlat15_ = _e163;
    let _e165 = u_xlat15_;
    let _e169 = _v_buffer3_.v_cb3_[13];
    let _e175 = _v_buffer3_.v_cb3_[13];
    u_xlat1_.x = ((_e165 * _e169.y) + _e175.x);
    let _e179 = u_xlat1_;
    u_xlat2_.x = cos(_e179.x);
    let _e183 = u_xlat1_;
    u_xlat1_.x = sin(_e183.x);
    let _e187 = u_xlat1_;
    u_xlat3_.z = _e187.x;
    let _e190 = u_xlat2_;
    u_xlat3_.y = _e190.x;
    let _e193 = u_xlat1_;
    u_xlat3_.x = -(_e193.x);
    let _e196 = u_xlat1_;
    let _e201 = _v_buffer3_.v_cb3_[12];
    let _e207 = _v_buffer3_.v_cb3_[13];
    let _e209 = (-(_e201.xy) + _e207.zw);
    u_xlat1_.x = _e209.x;
    u_xlat1_.y = _e209.y;
    let _e214 = u_xlat11_;
    let _e216 = in_TEXCOORD0_1;
    let _e221 = _v_buffer3_.v_cb3_[0];
    let _e227 = _v_buffer3_.v_cb3_[0];
    let _e229 = ((_e216.xy * _e221.xy) + _e227.zw);
    u_xlat11_.x = _e229.x;
    u_xlat11_.y = _e229.y;
    let _e234 = u_xlat2_;
    let _e236 = u_xlat1_;
    let _e239 = u_xlat11_;
    let _e241 = (-(_e236.xy) + _e239.xy);
    u_xlat2_.x = _e241.x;
    u_xlat2_.y = _e241.y;
    let _e247 = u_xlat2_;
    let _e249 = u_xlat3_;
    u_xlat12_.x = dot(_e247.xy, _e249.yz);
    let _e253 = u_xlat2_;
    let _e255 = u_xlat3_;
    u_xlat12_.y = dot(_e253.xy, _e255.xy);
    let _e258 = u_xlat1_;
    let _e260 = u_xlat1_;
    let _e262 = u_xlat12_;
    let _e264 = (_e260.xy + _e262.xy);
    u_xlat1_.x = _e264.x;
    u_xlat1_.y = _e264.y;
    let _e269 = u_xlat2_;
    let _e274 = _v_buffer3_.v_cb3_[12];
    let _e280 = _v_buffer3_.v_cb3_[14];
    let _e282 = (-(_e274.xy) + _e280.zw);
    u_xlat2_.x = _e282.x;
    u_xlat2_.y = _e282.y;
    let _e287 = u_xlat1_;
    let _e289 = u_xlat1_;
    let _e291 = u_xlat2_;
    let _e294 = (_e289.xy + -(_e291.xy));
    u_xlat1_.x = _e294.x;
    u_xlat1_.y = _e294.y;
    let _e299 = u_xlat1_;
    let _e301 = u_xlat1_;
    let _e306 = _v_buffer3_.v_cb3_[14];
    let _e309 = u_xlat2_;
    let _e311 = ((_e301.xy * _e306.xy) + _e309.xy);
    u_xlat1_.x = _e311.x;
    u_xlat1_.y = _e311.y;
    let _e316 = u_xlat2_;
    let _e321 = _v_buffer3_.v_cb3_[12];
    let _e323 = u_xlat15_;
    let _e329 = _v_buffer3_.v_cb3_[12];
    let _e331 = ((_e321.zw * vec2(_e323)) + _e329.xy);
    u_xlat2_.x = _e331.x;
    u_xlat2_.y = _e331.y;
    let _e336 = vs_TEXCOORD0_;
    let _e338 = u_xlat1_;
    let _e340 = u_xlat2_;
    let _e342 = (_e338.xy + _e340.xy);
    vs_TEXCOORD0_.z = _e342.x;
    vs_TEXCOORD0_.w = _e342.y;
    let _e347 = vs_TEXCOORD0_;
    let _e349 = u_xlat11_;
    let _e350 = _e349.xy;
    vs_TEXCOORD0_.x = _e350.x;
    vs_TEXCOORD0_.y = _e350.y;
    let _e356 = u_xlat15_;
    let _e360 = _v_buffer3_.v_cb3_[19];
    let _e366 = _v_buffer3_.v_cb3_[19];
    u_xlat1_.x = ((_e356 * _e360.y) + _e366.x);
    let _e369 = u_xlat2_;
    let _e374 = _v_buffer3_.v_cb3_[18];
    let _e376 = u_xlat15_;
    let _e382 = _v_buffer3_.v_cb3_[18];
    let _e384 = ((_e374.zw * vec2(_e376)) + _e382.xy);
    u_xlat2_.x = _e384.x;
    u_xlat2_.y = _e384.y;
    let _e390 = u_xlat1_;
    u_xlat3_.x = cos(_e390.x);
    let _e394 = u_xlat1_;
    u_xlat1_.x = sin(_e394.x);
    let _e398 = u_xlat1_;
    u_xlat4_.z = _e398.x;
    let _e400 = u_xlat12_;
    let _e405 = _v_buffer3_.v_cb3_[18];
    let _e411 = _v_buffer3_.v_cb3_[19];
    let _e413 = (-(_e405.xy) + _e411.zw);
    u_xlat12_.x = _e413.x;
    u_xlat12_.y = _e413.y;
    let _e418 = u_xlat6_;
    let _e420 = u_xlat11_;
    let _e422 = u_xlat12_;
    let _e425 = (_e420.xy + -(_e422.xy));
    u_xlat6_.x = _e425.x;
    u_xlat6_.y = _e425.y;
    let _e431 = u_xlat3_;
    u_xlat4_.y = _e431.x;
    let _e434 = u_xlat1_;
    u_xlat4_.x = -(_e434.x);
    let _e438 = u_xlat6_;
    let _e440 = u_xlat4_;
    u_xlat3_.y = dot(_e438.xy, _e440.xy);
    let _e444 = u_xlat6_;
    let _e446 = u_xlat4_;
    u_xlat3_.x = dot(_e444.xy, _e446.yz);
    let _e449 = u_xlat1_;
    let _e451 = u_xlat12_;
    let _e453 = u_xlat3_;
    let _e455 = (_e451.xy + _e453.xy);
    u_xlat1_.x = _e455.x;
    u_xlat1_.y = _e455.y;
    let _e460 = u_xlat11_;
    let _e465 = _v_buffer3_.v_cb3_[18];
    let _e471 = _v_buffer3_.v_cb3_[20];
    let _e473 = (-(_e465.xy) + _e471.zw);
    u_xlat11_.x = _e473.x;
    u_xlat11_.y = _e473.y;
    let _e478 = u_xlat1_;
    let _e480 = u_xlat11_;
    let _e483 = u_xlat1_;
    let _e485 = (-(_e480.xy) + _e483.xy);
    u_xlat1_.x = _e485.x;
    u_xlat1_.y = _e485.y;
    let _e490 = u_xlat1_;
    let _e492 = u_xlat1_;
    let _e497 = _v_buffer3_.v_cb3_[20];
    let _e500 = u_xlat11_;
    let _e502 = ((_e492.xy * _e497.xy) + _e500.xy);
    u_xlat1_.x = _e502.x;
    u_xlat1_.y = _e502.y;
    let _e507 = vs_TEXCOORD4_;
    let _e509 = u_xlat2_;
    let _e511 = u_xlat1_;
    let _e513 = (_e509.xy + _e511.xy);
    vs_TEXCOORD4_.x = _e513.x;
    vs_TEXCOORD4_.y = _e513.y;
    let _e518 = u_xlat1_;
    let _e523 = _v_buffer0_.v_cb0_[21];
    let _e528 = _v_buffer1_.v_cb1_[5];
    let _e530 = (_e523.yyy * _e528.xyz);
    u_xlat1_.x = _e530.x;
    u_xlat1_.y = _e530.y;
    u_xlat1_.z = _e530.z;
    let _e537 = u_xlat1_;
    let _e542 = _v_buffer1_.v_cb1_[4];
    let _e547 = _v_buffer0_.v_cb0_[21];
    let _e550 = u_xlat1_;
    let _e552 = ((_e542.xyz * _e547.xxx) + _e550.xyz);
    u_xlat1_.x = _e552.x;
    u_xlat1_.y = _e552.y;
    u_xlat1_.z = _e552.z;
    let _e559 = u_xlat1_;
    let _e564 = _v_buffer1_.v_cb1_[6];
    let _e569 = _v_buffer0_.v_cb0_[21];
    let _e572 = u_xlat1_;
    let _e574 = ((_e564.xyz * _e569.zzz) + _e572.xyz);
    u_xlat1_.x = _e574.x;
    u_xlat1_.y = _e574.y;
    u_xlat1_.z = _e574.z;
    let _e581 = u_xlat1_;
    let _e583 = u_xlat1_;
    let _e588 = _v_buffer1_.v_cb1_[7];
    let _e590 = (_e583.xyz + _e588.xyz);
    u_xlat1_.x = _e590.x;
    u_xlat1_.y = _e590.y;
    u_xlat1_.z = _e590.z;
    let _e597 = u_xlat1_;
    let _e599 = u_xlat1_;
    let _e601 = in_POSITION0_1;
    let _e604 = (_e599.xyz + -(_e601.xyz));
    u_xlat1_.x = _e604.x;
    u_xlat1_.y = _e604.y;
    u_xlat1_.z = _e604.z;
    let _e611 = u_xlat1_;
    let _e613 = u_xlat1_;
    u_xlat15_ = dot(_e611.xyz, _e613.xyz);
    let _e616 = u_xlat15_;
    u_xlat15_ = inverseSqrt(_e616);
    let _e618 = vs_TEXCOORD5_;
    let _e620 = u_xlat15_;
    let _e622 = u_xlat1_;
    let _e624 = (vec3(_e620) * _e622.xyz);
    vs_TEXCOORD5_.x = _e624.x;
    vs_TEXCOORD5_.y = _e624.y;
    vs_TEXCOORD5_.z = _e624.z;
    let _e632 = in_NORMAL0_1;
    let _e637 = _v_buffer1_.v_cb1_[4];
    u_xlat1_.x = dot(_e632.xyz, _e637.xyz);
    let _e641 = in_NORMAL0_1;
    let _e646 = _v_buffer1_.v_cb1_[5];
    u_xlat1_.y = dot(_e641.xyz, _e646.xyz);
    let _e650 = in_NORMAL0_1;
    let _e655 = _v_buffer1_.v_cb1_[6];
    u_xlat1_.z = dot(_e650.xyz, _e655.xyz);
    let _e658 = u_xlat1_;
    let _e660 = u_xlat1_;
    u_xlat15_ = dot(_e658.xyz, _e660.xyz);
    let _e663 = u_xlat15_;
    u_xlat15_ = max(_e663, 0.000000000000000000000000000000000000011754944f);
    let _e666 = u_xlat15_;
    u_xlat15_ = inverseSqrt(_e666);
    let _e668 = vs_NORMAL0_;
    let _e670 = u_xlat15_;
    let _e672 = u_xlat1_;
    let _e674 = (vec3(_e670) * _e672.xyz);
    vs_NORMAL0_.x = _e674.x;
    vs_NORMAL0_.y = _e674.y;
    vs_NORMAL0_.z = _e674.z;
    let _e681 = vs_COLOR0_;
    let _e683 = in_NORMAL0_1;
    let _e684 = _e683.xyz;
    vs_COLOR0_.x = _e684.x;
    vs_COLOR0_.y = _e684.y;
    vs_COLOR0_.z = _e684.z;
    let _e691 = vs_TEXCOORD1_;
    let _e693 = u_xlat0_;
    let _e694 = _e693.xyz;
    vs_TEXCOORD1_.x = _e694.x;
    vs_TEXCOORD1_.y = _e694.y;
    vs_TEXCOORD1_.z = _e694.z;
    let _e701 = u_xlat1_;
    let _e703 = u_xlat0_;
    let _e708 = _v_buffer2_.v_cb2_[1];
    let _e710 = (_e703.yyy * _e708.xyz);
    u_xlat1_.x = _e710.x;
    u_xlat1_.y = _e710.y;
    u_xlat1_.z = _e710.z;
    let _e717 = u_xlat0_;
    let _e722 = _v_buffer2_.v_cb2_[0];
    let _e724 = u_xlat0_;
    let _e727 = u_xlat1_;
    let _e729 = ((_e722.xyz * _e724.xxx) + _e727.xyz);
    u_xlat0_.x = _e729.x;
    u_xlat0_.y = _e729.y;
    u_xlat0_.w = _e729.z;
    let _e736 = u_xlat0_;
    let _e741 = _v_buffer2_.v_cb2_[2];
    let _e743 = u_xlat0_;
    let _e746 = u_xlat0_;
    let _e748 = ((_e741.xyz * _e743.zzz) + _e746.xyw);
    u_xlat0_.x = _e748.x;
    u_xlat0_.y = _e748.y;
    u_xlat0_.z = _e748.z;
    let _e755 = vs_TEXCOORDindex3_;
    let _e757 = u_xlat0_;
    let _e762 = _v_buffer2_.v_cb2_[3];
    let _e764 = (_e757.xyz + _e762.xyz);
    vs_TEXCOORDindex3_.x = _e764.x;
    vs_TEXCOORDindex3_.y = _e764.y;
    vs_TEXCOORDindex3_.z = _e764.z;
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
    let _e43 = vs_TEXCOORD5_;
    let _e45 = vs_NORMAL0_;
    let _e47 = vs_COLOR0_;
    let _e49 = vs_TEXCOORD1_;
    let _e51 = vs_TEXCOORDindex3_;
    let _e53 = gl_Position;
    return VertexOutput(_e39, _e41, _e43, _e45, _e47, _e49, _e51, _e53);
}
