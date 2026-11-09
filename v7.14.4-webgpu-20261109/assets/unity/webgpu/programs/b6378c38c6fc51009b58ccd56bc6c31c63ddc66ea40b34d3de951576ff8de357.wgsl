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
    v_cb3_: array<vec4<f32>, 17>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec4<f32>,
    @location(4) vs_TEXCOORD4_: vec3<f32>,
    @location(5) vs_TEXCOORD5_: vec3<f32>,
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
var<private> vs_TEXCOORD5_: vec3<f32>;
var<private> vs_NORMAL0_: vec3<f32>;
var<private> vs_TEXCOORD1_: vec3<f32>;
var<private> vs_TEXCOORDindex3_: vec4<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: vec2<f32> = vec2(0f);
    var u_xlat6_: vec2<f32> = vec2(0f);
    var u_xlat7_: vec2<f32> = vec2(0f);
    var u_xlat11_: vec2<f32> = vec2(0f);
    var u_xlat15_: f32 = 0f;

    let _e58 = u_xlat0_;
    let _e60 = in_POSITION0_1;
    let _e65 = _v_buffer1_.v_cb1_[1];
    let _e67 = (_e60.yyy * _e65.xyz);
    u_xlat0_.x = _e67.x;
    u_xlat0_.y = _e67.y;
    u_xlat0_.z = _e67.z;
    let _e74 = u_xlat0_;
    let _e79 = _v_buffer1_.v_cb1_[0];
    let _e81 = in_POSITION0_1;
    let _e84 = u_xlat0_;
    let _e86 = ((_e79.xyz * _e81.xxx) + _e84.xyz);
    u_xlat0_.x = _e86.x;
    u_xlat0_.y = _e86.y;
    u_xlat0_.z = _e86.z;
    let _e93 = u_xlat0_;
    let _e98 = _v_buffer1_.v_cb1_[2];
    let _e100 = in_POSITION0_1;
    let _e103 = u_xlat0_;
    let _e105 = ((_e98.xyz * _e100.zzz) + _e103.xyz);
    u_xlat0_.x = _e105.x;
    u_xlat0_.y = _e105.y;
    u_xlat0_.z = _e105.z;
    let _e112 = u_xlat0_;
    let _e117 = _v_buffer1_.v_cb1_[3];
    let _e119 = in_POSITION0_1;
    let _e122 = u_xlat0_;
    let _e124 = ((_e117.xyz * _e119.www) + _e122.xyz);
    u_xlat0_.x = _e124.x;
    u_xlat0_.y = _e124.y;
    u_xlat0_.z = _e124.z;
    let _e131 = u_xlat1_;
    let _e133 = u_xlat0_;
    let _e138 = _v_buffer3_.v_cb3_[1];
    let _e144 = _v_buffer3_.v_cb3_[1];
    let _e146 = ((_e133.xy * _e138.xy) + _e144.zw);
    u_xlat1_.x = _e146.x;
    u_xlat1_.y = _e146.y;
    let _e151 = u_xlat1_;
    let _e156 = _v_buffer0_.v_cb0_[15];
    let _e161 = _v_buffer3_.v_cb3_[16];
    let _e164 = u_xlat1_;
    let _e166 = ((_e156.xx * _e161.xx) + _e164.xy);
    u_xlat1_.x = _e166.x;
    u_xlat1_.y = _e166.y;
    let _e171 = u_xlat1_;
    let _e174 = textureSampleLevel(v_t0_, samplerv_s0_, _e171.xy, 0f);
    u_xlat1_ = _e174;
    let _e175 = u_xlat1_;
    let _e177 = u_xlat1_;
    let _e186 = (_e177.xyz + vec3<f32>(-0.5f, -0.5f, -0.5f));
    u_xlat1_.x = _e186.x;
    u_xlat1_.y = _e186.y;
    u_xlat1_.z = _e186.z;
    let _e193 = u_xlat1_;
    let _e195 = u_xlat1_;
    let _e201 = (_e195.xyz * vec3<f32>(0.5f, 0.5f, 0.5f));
    u_xlat1_.x = _e201.x;
    u_xlat1_.y = _e201.y;
    u_xlat1_.z = _e201.z;
    let _e208 = u_xlat1_;
    let _e210 = u_xlat1_;
    let _e215 = _v_buffer3_.v_cb3_[16];
    let _e218 = in_POSITION0_1;
    let _e220 = ((_e210.xyz * _e215.yyy) + _e218.xyz);
    u_xlat1_.x = _e220.x;
    u_xlat1_.y = _e220.y;
    u_xlat1_.z = _e220.z;
    let _e227 = u_xlat1_;
    let _e232 = _v_buffer1_.v_cb1_[1];
    u_xlat2_ = (_e227.yyyy * _e232);
    let _e237 = _v_buffer1_.v_cb1_[0];
    let _e238 = u_xlat1_;
    let _e241 = u_xlat2_;
    u_xlat2_ = ((_e237 * _e238.xxxx) + _e241);
    let _e246 = _v_buffer1_.v_cb1_[2];
    let _e247 = u_xlat1_;
    let _e250 = u_xlat2_;
    u_xlat1_ = ((_e246 * _e247.zzzz) + _e250);
    let _e252 = u_xlat1_;
    let _e256 = _v_buffer1_.v_cb1_[3];
    u_xlat1_ = (_e252 + _e256);
    let _e258 = u_xlat1_;
    let _e263 = _v_buffer0_.v_cb0_[80];
    u_xlat2_ = (_e258.yyyy * _e263);
    let _e268 = _v_buffer0_.v_cb0_[79];
    let _e269 = u_xlat1_;
    let _e272 = u_xlat2_;
    u_xlat2_ = ((_e268 * _e269.xxxx) + _e272);
    let _e277 = _v_buffer0_.v_cb0_[81];
    let _e278 = u_xlat1_;
    let _e281 = u_xlat2_;
    u_xlat2_ = ((_e277 * _e278.zzzz) + _e281);
    let _e287 = _v_buffer0_.v_cb0_[82];
    let _e288 = u_xlat1_;
    let _e291 = u_xlat2_;
    gl_Position = ((_e287 * _e288.wwww) + _e291);
    let _e296 = _v_buffer0_.v_cb0_[15];
    let _e301 = _v_buffer3_.v_cb3_[14];
    let _e307 = _v_buffer3_.v_cb3_[14];
    u_xlat15_ = ((_e296.x * _e301.y) + _e307.x);
    let _e311 = u_xlat15_;
    u_xlat1_.x = sin(_e311);
    let _e314 = u_xlat15_;
    u_xlat2_.x = cos(_e314);
    let _e317 = u_xlat1_;
    u_xlat3_.z = _e317.x;
    let _e319 = u_xlat6_;
    let _e321 = in_TEXCOORD0_1;
    let _e326 = _v_buffer3_.v_cb3_[0];
    let _e332 = _v_buffer3_.v_cb3_[0];
    let _e334 = ((_e321.xy * _e326.xy) + _e332.zw);
    u_xlat6_.x = _e334.x;
    u_xlat6_.y = _e334.y;
    let _e339 = u_xlat7_;
    let _e344 = _v_buffer3_.v_cb3_[13];
    let _e350 = _v_buffer3_.v_cb3_[14];
    let _e352 = (-(_e344.xy) + _e350.zw);
    u_xlat7_.x = _e352.x;
    u_xlat7_.y = _e352.y;
    let _e357 = u_xlat4_;
    let _e359 = u_xlat6_;
    let _e361 = u_xlat7_;
    let _e364 = (_e359.xy + -(_e361.xy));
    u_xlat4_.x = _e364.x;
    u_xlat4_.y = _e364.y;
    let _e369 = vs_TEXCOORD0_;
    let _e371 = u_xlat6_;
    let _e372 = _e371.xy;
    vs_TEXCOORD0_.x = _e372.x;
    vs_TEXCOORD0_.y = _e372.y;
    let _e378 = u_xlat2_;
    u_xlat3_.y = _e378.x;
    let _e381 = u_xlat1_;
    u_xlat3_.x = -(_e381.x);
    let _e385 = u_xlat4_;
    let _e387 = u_xlat3_;
    u_xlat11_.y = dot(_e385.xy, _e387.xy);
    let _e391 = u_xlat4_;
    let _e393 = u_xlat3_;
    u_xlat11_.x = dot(_e391.xy, _e393.yz);
    let _e396 = u_xlat1_;
    let _e398 = u_xlat7_;
    let _e400 = u_xlat11_;
    let _e402 = (_e398.xy + _e400.xy);
    u_xlat1_.x = _e402.x;
    u_xlat1_.y = _e402.y;
    let _e407 = u_xlat11_;
    let _e412 = _v_buffer3_.v_cb3_[13];
    let _e418 = _v_buffer3_.v_cb3_[15];
    let _e420 = (-(_e412.xy) + _e418.zw);
    u_xlat11_.x = _e420.x;
    u_xlat11_.y = _e420.y;
    let _e425 = u_xlat1_;
    let _e427 = u_xlat11_;
    let _e430 = u_xlat1_;
    let _e432 = (-(_e427.xy) + _e430.xy);
    u_xlat1_.x = _e432.x;
    u_xlat1_.y = _e432.y;
    let _e437 = u_xlat1_;
    let _e439 = u_xlat1_;
    let _e444 = _v_buffer3_.v_cb3_[15];
    let _e447 = u_xlat11_;
    let _e449 = ((_e439.xy * _e444.xy) + _e447.xy);
    u_xlat1_.x = _e449.x;
    u_xlat1_.y = _e449.y;
    let _e454 = u_xlat11_;
    let _e459 = _v_buffer3_.v_cb3_[13];
    let _e464 = _v_buffer0_.v_cb0_[15];
    let _e470 = _v_buffer3_.v_cb3_[13];
    let _e472 = ((_e459.zw * _e464.xx) + _e470.xy);
    u_xlat11_.x = _e472.x;
    u_xlat11_.y = _e472.y;
    let _e477 = vs_TEXCOORD0_;
    let _e479 = u_xlat11_;
    let _e481 = u_xlat1_;
    let _e483 = (_e479.xy + _e481.xy);
    vs_TEXCOORD0_.z = _e483.x;
    vs_TEXCOORD0_.w = _e483.y;
    let _e488 = u_xlat1_;
    let _e493 = _v_buffer0_.v_cb0_[21];
    let _e498 = _v_buffer1_.v_cb1_[5];
    let _e500 = (_e493.yyy * _e498.xyz);
    u_xlat1_.x = _e500.x;
    u_xlat1_.y = _e500.y;
    u_xlat1_.z = _e500.z;
    let _e507 = u_xlat1_;
    let _e512 = _v_buffer1_.v_cb1_[4];
    let _e517 = _v_buffer0_.v_cb0_[21];
    let _e520 = u_xlat1_;
    let _e522 = ((_e512.xyz * _e517.xxx) + _e520.xyz);
    u_xlat1_.x = _e522.x;
    u_xlat1_.y = _e522.y;
    u_xlat1_.z = _e522.z;
    let _e529 = u_xlat1_;
    let _e534 = _v_buffer1_.v_cb1_[6];
    let _e539 = _v_buffer0_.v_cb0_[21];
    let _e542 = u_xlat1_;
    let _e544 = ((_e534.xyz * _e539.zzz) + _e542.xyz);
    u_xlat1_.x = _e544.x;
    u_xlat1_.y = _e544.y;
    u_xlat1_.z = _e544.z;
    let _e551 = u_xlat1_;
    let _e553 = u_xlat1_;
    let _e558 = _v_buffer1_.v_cb1_[7];
    let _e560 = (_e553.xyz + _e558.xyz);
    u_xlat1_.x = _e560.x;
    u_xlat1_.y = _e560.y;
    u_xlat1_.z = _e560.z;
    let _e567 = u_xlat1_;
    let _e569 = u_xlat1_;
    let _e571 = in_POSITION0_1;
    let _e574 = (_e569.xyz + -(_e571.xyz));
    u_xlat1_.x = _e574.x;
    u_xlat1_.y = _e574.y;
    u_xlat1_.z = _e574.z;
    let _e581 = u_xlat1_;
    let _e583 = u_xlat1_;
    u_xlat15_ = dot(_e581.xyz, _e583.xyz);
    let _e586 = u_xlat15_;
    u_xlat15_ = inverseSqrt(_e586);
    let _e588 = vs_TEXCOORD4_;
    let _e590 = u_xlat15_;
    let _e592 = u_xlat1_;
    let _e594 = (vec3(_e590) * _e592.xyz);
    vs_TEXCOORD4_.x = _e594.x;
    vs_TEXCOORD4_.y = _e594.y;
    vs_TEXCOORD4_.z = _e594.z;
    let _e601 = in_NORMAL0_1;
    let _e603 = in_NORMAL0_1;
    u_xlat15_ = dot(_e601.xyz, _e603.xyz);
    let _e606 = u_xlat15_;
    u_xlat15_ = inverseSqrt(_e606);
    let _e608 = vs_TEXCOORD5_;
    let _e610 = u_xlat15_;
    let _e612 = in_NORMAL0_1;
    let _e614 = (vec3(_e610) * _e612.xyz);
    vs_TEXCOORD5_.x = _e614.x;
    vs_TEXCOORD5_.y = _e614.y;
    vs_TEXCOORD5_.z = _e614.z;
    let _e622 = in_NORMAL0_1;
    let _e627 = _v_buffer1_.v_cb1_[4];
    u_xlat1_.x = dot(_e622.xyz, _e627.xyz);
    let _e631 = in_NORMAL0_1;
    let _e636 = _v_buffer1_.v_cb1_[5];
    u_xlat1_.y = dot(_e631.xyz, _e636.xyz);
    let _e640 = in_NORMAL0_1;
    let _e645 = _v_buffer1_.v_cb1_[6];
    u_xlat1_.z = dot(_e640.xyz, _e645.xyz);
    let _e648 = u_xlat1_;
    let _e650 = u_xlat1_;
    u_xlat15_ = dot(_e648.xyz, _e650.xyz);
    let _e653 = u_xlat15_;
    u_xlat15_ = max(_e653, 0.000000000000000000000000000000000000011754944f);
    let _e656 = u_xlat15_;
    u_xlat15_ = inverseSqrt(_e656);
    let _e658 = vs_NORMAL0_;
    let _e660 = u_xlat15_;
    let _e662 = u_xlat1_;
    let _e664 = (vec3(_e660) * _e662.xyz);
    vs_NORMAL0_.x = _e664.x;
    vs_NORMAL0_.y = _e664.y;
    vs_NORMAL0_.z = _e664.z;
    let _e671 = u_xlat1_;
    let _e673 = u_xlat0_;
    let _e678 = _v_buffer1_.v_cb1_[1];
    let _e680 = (_e673.yyy * _e678.xyz);
    u_xlat1_.x = _e680.x;
    u_xlat1_.y = _e680.y;
    u_xlat1_.z = _e680.z;
    let _e687 = u_xlat0_;
    let _e692 = _v_buffer1_.v_cb1_[0];
    let _e694 = u_xlat0_;
    let _e697 = u_xlat1_;
    let _e699 = ((_e692.xyz * _e694.xxx) + _e697.xyz);
    u_xlat0_.x = _e699.x;
    u_xlat0_.y = _e699.y;
    u_xlat0_.w = _e699.z;
    let _e706 = u_xlat0_;
    let _e711 = _v_buffer1_.v_cb1_[2];
    let _e713 = u_xlat0_;
    let _e716 = u_xlat0_;
    let _e718 = ((_e711.xyz * _e713.zzz) + _e716.xyw);
    u_xlat0_.x = _e718.x;
    u_xlat0_.y = _e718.y;
    u_xlat0_.z = _e718.z;
    let _e725 = u_xlat0_;
    let _e727 = u_xlat0_;
    let _e732 = _v_buffer1_.v_cb1_[3];
    let _e734 = (_e727.xyz + _e732.xyz);
    u_xlat0_.x = _e734.x;
    u_xlat0_.y = _e734.y;
    u_xlat0_.z = _e734.z;
    let _e741 = vs_TEXCOORD1_;
    let _e743 = u_xlat0_;
    let _e744 = _e743.xyz;
    vs_TEXCOORD1_.x = _e744.x;
    vs_TEXCOORD1_.y = _e744.y;
    vs_TEXCOORD1_.z = _e744.z;
    let _e751 = u_xlat1_;
    let _e753 = u_xlat0_;
    let _e758 = _v_buffer2_.v_cb2_[1];
    let _e760 = (_e753.yyy * _e758.xyz);
    u_xlat1_.x = _e760.x;
    u_xlat1_.y = _e760.y;
    u_xlat1_.z = _e760.z;
    let _e767 = u_xlat0_;
    let _e772 = _v_buffer2_.v_cb2_[0];
    let _e774 = u_xlat0_;
    let _e777 = u_xlat1_;
    let _e779 = ((_e772.xyz * _e774.xxx) + _e777.xyz);
    u_xlat0_.x = _e779.x;
    u_xlat0_.y = _e779.y;
    u_xlat0_.w = _e779.z;
    let _e786 = u_xlat0_;
    let _e791 = _v_buffer2_.v_cb2_[2];
    let _e793 = u_xlat0_;
    let _e796 = u_xlat0_;
    let _e798 = ((_e791.xyz * _e793.zzz) + _e796.xyw);
    u_xlat0_.x = _e798.x;
    u_xlat0_.y = _e798.y;
    u_xlat0_.z = _e798.z;
    let _e805 = vs_TEXCOORDindex3_;
    let _e807 = u_xlat0_;
    let _e812 = _v_buffer2_.v_cb2_[3];
    let _e814 = (_e807.xyz + _e812.xyz);
    vs_TEXCOORDindex3_.x = _e814.x;
    vs_TEXCOORDindex3_.y = _e814.y;
    vs_TEXCOORDindex3_.z = _e814.z;
    vs_TEXCOORDindex3_.w = 0f;
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec4<f32>, @location(1) in_NORMAL0_: vec3<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_NORMAL0_1 = in_NORMAL0_;
    main_1();
    let _e41 = vs_TEXCOORD0_;
    let _e43 = vs_TEXCOORD4_;
    let _e45 = vs_TEXCOORD5_;
    let _e47 = vs_NORMAL0_;
    let _e49 = vs_TEXCOORD1_;
    let _e51 = vs_TEXCOORDindex3_;
    let _e53 = gl_Position;
    return VertexOutput(_e41, _e43, _e45, _e47, _e49, _e51, _e53);
}
