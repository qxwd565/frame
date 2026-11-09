struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 133>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 4>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 2>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec2<f32>,
    @builtin(position) gl_Position: vec4<f32>,
}

@group(0) @binding(0) 
var<uniform> _v_buffer0_: v_buffer0_;
@group(0) @binding(1) 
var<uniform> _v_buffer1_: v_buffer1_;
@group(0) @binding(2) 
var<uniform> _v_buffer2_: v_buffer2_;
@group(2) @binding(1) 
var samplerv_s0_: sampler;
@group(2) @binding(0) 
var v_t0_: texture_2d<f32>;
var<private> in_POSITION0_1: vec4<f32>;
var<private> in_TEXCOORD0_1: vec2<f32>;
var<private> in_TEXCOORD2_1: vec2<f32>;
var<private> vs_TEXCOORD0_: vec2<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlatb0_: bool = false;
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec4<f32> = vec4(0f);
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlatb4_: bool = false;
    var u_xlat8_: f32 = 0f;
    var u_xlatb8_: bool = false;
    var u_xlat9_: f32 = 0f;
    var u_xlat12_: f32 = 0f;
    var u_xlatb12_: bool = false;
    var u_xlat13_: f32 = 0f;
    var u_xlatb13_: bool = false;
    var local: f32;
    var local_1: f32;
    var local_2: f32;
    var local_3: f32;

    let _e65 = _v_buffer2_.v_cb2_[1];
    u_xlatb0_ = (_e65.z != 0f);
    let _e69 = u_xlatb0_;
    if _e69 {
        {
            let _e74 = _v_buffer0_.v_cb0_[15];
            let _e79 = _v_buffer2_.v_cb2_[1];
            u_xlat0_.x = (_e74.y + -(_e79.w));
            let _e84 = u_xlat0_;
            let _e89 = _v_buffer2_.v_cb2_[1];
            u_xlat4_.x = (_e84.x * _e89.x);
            let _e92 = u_xlat4_;
            let _e94 = u_xlat4_;
            u_xlatb4_ = (_e92.x >= -(_e94.x));
            let _e99 = u_xlatb4_;
            if _e99 {
                let _e103 = _v_buffer2_.v_cb2_[1];
                local = _e103.x;
            } else {
                let _e108 = _v_buffer2_.v_cb2_[1];
                local = -(_e108.x);
            }
            let _e112 = local;
            u_xlat4_.x = _e112;
            let _e115 = u_xlat4_;
            u_xlat8_ = (1f / _e115.x);
            let _e119 = u_xlat8_;
            let _e120 = u_xlat0_;
            u_xlat0_.x = (_e119 * _e120.x);
            let _e124 = u_xlat0_;
            u_xlat0_.x = fract(_e124.x);
            let _e128 = u_xlat0_;
            let _e130 = u_xlat4_;
            u_xlat0_.x = (_e128.x * _e130.x);
            let _e134 = u_xlat0_;
            let _e139 = _v_buffer2_.v_cb2_[1];
            u_xlat0_.x = (_e134.x / _e139.x);
            let _e146 = _v_buffer2_.v_cb2_[1];
            u_xlat4_.x = (_e146.z + -1f);
            let _e152 = u_xlat4_;
            let _e154 = u_xlat0_;
            u_xlat0_.x = (_e152.x * _e154.x);
            let _e158 = u_xlat0_;
            u_xlat4_.x = floor(_e158.x);
            let _e161 = u_xlat4_;
            u_xlat8_ = (_e161.x + 1f);
            let _e165 = u_xlat0_;
            let _e167 = u_xlat0_;
            u_xlatb12_ = (_e165.x >= -(_e167.x));
            let _e171 = u_xlatb12_;
            if _e171 {
                local_1 = 1f;
            } else {
                local_1 = -1f;
            }
            let _e176 = local_1;
            u_xlat12_ = _e176;
            let _e178 = u_xlat12_;
            let _e179 = u_xlat0_;
            u_xlat0_.x = (_e178 * _e179.x);
            let _e183 = u_xlat0_;
            u_xlat0_.x = fract(_e183.x);
            let _e187 = u_xlat0_;
            let _e189 = u_xlat12_;
            u_xlat0_.x = (_e187.x * _e189);
            let _e191 = in_TEXCOORD2_1;
            u_xlat12_ = (_e191.x + -0.0000001f);
            let _e196 = u_xlat12_;
            u_xlat12_ = clamp(_e196, 0f, 1f);
            let _e200 = u_xlat12_;
            let _e204 = _v_buffer2_.v_cb2_[1];
            u_xlat12_ = (_e200 * _e204.y);
            let _e207 = u_xlat12_;
            u_xlat12_ = floor(_e207);
            let _e210 = u_xlat4_;
            let _e215 = _v_buffer2_.v_cb2_[1];
            let _e218 = u_xlat12_;
            u_xlat4_.x = ((_e210.x * _e215.y) + _e218);
            let _e221 = u_xlat4_;
            u_xlat4_.x = floor(_e221.x);
            let _e224 = u_xlat1_;
            let _e229 = _v_buffer0_.v_cb0_[131];
            let _e234 = (_e229.xy * vec2<f32>(0.5f, 0.5f));
            u_xlat1_.x = _e234.x;
            u_xlat1_.y = _e234.y;
            let _e242 = _v_buffer2_.v_cb2_[1];
            let _e247 = _v_buffer2_.v_cb2_[1];
            u_xlat9_ = (_e242.z * _e247.y);
            let _e250 = u_xlat9_;
            let _e254 = _v_buffer0_.v_cb0_[131];
            u_xlat9_ = (_e250 / _e254.z);
            let _e257 = u_xlat9_;
            u_xlat9_ = ceil(_e257);
            let _e259 = u_xlat4_;
            let _e264 = _v_buffer0_.v_cb0_[131];
            u_xlat13_ = (_e259.x * _e264.z);
            let _e267 = u_xlat13_;
            let _e268 = u_xlat13_;
            u_xlatb13_ = (_e267 >= -(_e268));
            let _e271 = u_xlatb13_;
            if _e271 {
                let _e275 = _v_buffer0_.v_cb0_[131];
                local_2 = _e275.z;
            } else {
                let _e280 = _v_buffer0_.v_cb0_[131];
                local_2 = -(_e280.z);
            }
            let _e284 = local_2;
            u_xlat13_ = _e284;
            let _e288 = u_xlat13_;
            u_xlat2_.x = (1f / _e288);
            let _e291 = u_xlat4_;
            let _e293 = u_xlat2_;
            u_xlat2_.x = (_e291.x * _e293.x);
            let _e297 = u_xlat2_;
            u_xlat2_.x = fract(_e297.x);
            let _e300 = u_xlat13_;
            let _e301 = u_xlat2_;
            u_xlat13_ = (_e300 * _e301.x);
            let _e305 = u_xlat13_;
            let _e309 = _v_buffer0_.v_cb0_[131];
            let _e312 = u_xlat1_;
            u_xlat2_.x = ((_e305 * _e309.x) + _e312.x);
            let _e316 = u_xlat4_;
            let _e321 = _v_buffer0_.v_cb0_[131];
            u_xlat4_.x = (_e316.x / _e321.z);
            let _e325 = u_xlat4_;
            u_xlat4_.x = floor(_e325.x);
            let _e328 = u_xlat4_;
            let _e333 = _v_buffer0_.v_cb0_[131];
            let _e336 = u_xlat1_;
            u_xlat13_ = ((_e328.x * _e333.y) + _e336.y);
            let _e340 = u_xlat13_;
            u_xlat2_.y = (-(_e340) + 1f);
            let _e345 = u_xlat9_;
            let _e346 = u_xlat4_;
            u_xlat4_.x = (_e345 + _e346.x);
            let _e350 = u_xlat4_;
            u_xlat4_.x = (_e350.x + 1f);
            let _e355 = u_xlat4_;
            let _e360 = _v_buffer0_.v_cb0_[131];
            let _e363 = u_xlat1_;
            u_xlat4_.x = ((_e355.x * _e360.y) + _e363.y);
            let _e367 = u_xlat4_;
            u_xlat2_.z = (-(_e367.x) + 1f);
            let _e373 = u_xlat8_;
            let _e377 = _v_buffer2_.v_cb2_[1];
            let _e380 = u_xlat12_;
            u_xlat4_.x = ((_e373 * _e377.y) + _e380);
            let _e383 = u_xlat4_;
            u_xlat4_.x = floor(_e383.x);
            let _e386 = u_xlat4_;
            let _e391 = _v_buffer0_.v_cb0_[131];
            u_xlat8_ = (_e386.x * _e391.z);
            let _e394 = u_xlat8_;
            let _e395 = u_xlat8_;
            u_xlatb8_ = (_e394 >= -(_e395));
            let _e398 = u_xlatb8_;
            if _e398 {
                let _e402 = _v_buffer0_.v_cb0_[131];
                local_3 = _e402.z;
            } else {
                let _e407 = _v_buffer0_.v_cb0_[131];
                local_3 = -(_e407.z);
            }
            let _e411 = local_3;
            u_xlat8_ = _e411;
            let _e414 = u_xlat8_;
            u_xlat12_ = (1f / _e414);
            let _e416 = u_xlat12_;
            let _e417 = u_xlat4_;
            u_xlat12_ = (_e416 * _e417.x);
            let _e420 = u_xlat12_;
            u_xlat12_ = fract(_e420);
            let _e422 = u_xlat12_;
            let _e423 = u_xlat8_;
            u_xlat8_ = (_e422 * _e423);
            let _e426 = u_xlat8_;
            let _e430 = _v_buffer0_.v_cb0_[131];
            let _e433 = u_xlat1_;
            u_xlat3_.x = ((_e426 * _e430.x) + _e433.x);
            let _e437 = u_xlat4_;
            let _e442 = _v_buffer0_.v_cb0_[131];
            u_xlat4_.x = (_e437.x / _e442.z);
            let _e446 = u_xlat4_;
            u_xlat4_.x = floor(_e446.x);
            let _e450 = u_xlat4_;
            let _e455 = _v_buffer0_.v_cb0_[131];
            let _e458 = u_xlat1_;
            u_xlat4_.y = ((_e450.x * _e455.y) + _e458.y);
            let _e462 = u_xlat9_;
            let _e463 = u_xlat4_;
            u_xlat4_.x = (_e462 + _e463.x);
            let _e467 = u_xlat4_;
            u_xlat4_.x = (_e467.x + 1f);
            let _e472 = u_xlat4_;
            let _e477 = _v_buffer0_.v_cb0_[131];
            let _e480 = u_xlat1_;
            u_xlat4_.x = ((_e472.x * _e477.y) + _e480.y);
            let _e483 = u_xlat3_;
            let _e485 = u_xlat4_;
            let _e491 = (-(_e485.yx) + vec2<f32>(1f, 1f));
            u_xlat3_.y = _e491.x;
            u_xlat3_.z = _e491.y;
            let _e496 = u_xlat2_;
            let _e499 = textureSampleLevel(v_t0_, samplerv_s0_, _e496.xy, 0f);
            u_xlat1_ = _e499;
            let _e500 = u_xlat2_;
            let _e503 = textureSampleLevel(v_t0_, samplerv_s0_, _e500.xz, 0f);
            u_xlat2_ = _e503;
            let _e504 = u_xlat4_;
            let _e506 = u_xlat2_;
            let _e511 = (_e506.zz * vec2<f32>(255f, 510f));
            u_xlat4_.x = _e511.x;
            u_xlat4_.y = _e511.y;
            let _e516 = u_xlat1_;
            let _e518 = u_xlat1_;
            let _e524 = u_xlat1_;
            let _e526 = ((_e518.yw * vec2<f32>(0.003921569f, 0.003921569f)) + _e524.xz);
            u_xlat1_.x = _e526.x;
            u_xlat1_.y = _e526.y;
            let _e531 = u_xlat1_;
            let _e533 = u_xlat1_;
            let _e535 = u_xlat4_;
            let _e538 = u_xlat4_;
            let _e541 = ((_e533.xy * _e535.yy) + -(_e538.xx));
            u_xlat1_.x = _e541.x;
            u_xlat1_.y = _e541.y;
            let _e546 = u_xlat2_;
            let _e550 = u_xlat2_;
            u_xlat12_ = ((_e546.y * 0.003921569f) + _e550.x);
            let _e554 = u_xlat12_;
            let _e555 = u_xlat4_;
            let _e558 = u_xlat4_;
            u_xlat1_.z = ((_e554 * _e555.y) + -(_e558.x));
            let _e562 = u_xlat3_;
            let _e565 = textureSampleLevel(v_t0_, samplerv_s0_, _e562.xy, 0f);
            u_xlat2_ = _e565;
            let _e566 = u_xlat3_;
            let _e569 = textureSampleLevel(v_t0_, samplerv_s0_, _e566.xz, 0f);
            u_xlat3_ = _e569;
            let _e570 = u_xlat4_;
            let _e572 = u_xlat3_;
            let _e577 = (_e572.zz * vec2<f32>(255f, 510f));
            u_xlat4_.x = _e577.x;
            u_xlat4_.y = _e577.y;
            let _e582 = u_xlat2_;
            let _e584 = u_xlat2_;
            let _e590 = u_xlat2_;
            let _e592 = ((_e584.yw * vec2<f32>(0.003921569f, 0.003921569f)) + _e590.xz);
            u_xlat2_.x = _e592.x;
            u_xlat2_.y = _e592.y;
            let _e597 = u_xlat2_;
            let _e599 = u_xlat2_;
            let _e601 = u_xlat4_;
            let _e604 = u_xlat4_;
            let _e607 = ((_e599.xy * _e601.yy) + -(_e604.xx));
            u_xlat2_.x = _e607.x;
            u_xlat2_.y = _e607.y;
            let _e612 = u_xlat3_;
            let _e616 = u_xlat3_;
            u_xlat12_ = ((_e612.y * 0.003921569f) + _e616.x);
            let _e620 = u_xlat12_;
            let _e621 = u_xlat4_;
            let _e624 = u_xlat4_;
            u_xlat2_.z = ((_e620 * _e621.y) + -(_e624.x));
            let _e628 = u_xlat4_;
            let _e630 = u_xlat1_;
            let _e633 = u_xlat2_;
            let _e635 = (-(_e630.xyz) + _e633.xyz);
            u_xlat4_.x = _e635.x;
            u_xlat4_.y = _e635.y;
            u_xlat4_.z = _e635.z;
            let _e642 = u_xlat0_;
            let _e644 = u_xlat0_;
            let _e646 = u_xlat4_;
            let _e649 = u_xlat1_;
            let _e651 = ((_e644.xxx * _e646.xyz) + _e649.xyz);
            u_xlat0_.x = _e651.x;
            u_xlat0_.y = _e651.y;
            u_xlat0_.z = _e651.z;
            let _e658 = u_xlat0_;
            let _e660 = u_xlat0_;
            let _e666 = (_e660.xyz * vec3<f32>(0.01f, 0.01f, 0.01f));
            u_xlat0_.x = _e666.x;
            u_xlat0_.y = _e666.y;
            u_xlat0_.z = _e666.z;
            let _e674 = u_xlat0_;
            u_xlat0_.w = -(_e674.x);
            let _e677 = u_xlat0_;
            let _e679 = u_xlat0_;
            let _e681 = in_POSITION0_1;
            let _e683 = (_e679.wzy + _e681.xyz);
            u_xlat0_.x = _e683.x;
            u_xlat0_.y = _e683.y;
            u_xlat0_.z = _e683.z;
        }
    } else {
        {
            let _e690 = u_xlat0_;
            let _e692 = in_POSITION0_1;
            let _e693 = _e692.xyz;
            u_xlat0_.x = _e693.x;
            u_xlat0_.y = _e693.y;
            u_xlat0_.z = _e693.z;
        }
    }
    let _e700 = u_xlat0_;
    let _e705 = _v_buffer1_.v_cb1_[1];
    u_xlat1_ = (_e700.yyyy * _e705);
    let _e710 = _v_buffer1_.v_cb1_[0];
    let _e711 = u_xlat0_;
    let _e714 = u_xlat1_;
    u_xlat1_ = ((_e710 * _e711.xxxx) + _e714);
    let _e719 = _v_buffer1_.v_cb1_[2];
    let _e720 = u_xlat0_;
    let _e723 = u_xlat1_;
    u_xlat0_ = ((_e719 * _e720.zzzz) + _e723);
    let _e725 = u_xlat0_;
    let _e729 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e725 + _e729);
    let _e731 = u_xlat0_;
    let _e736 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e731.yyyy * _e736);
    let _e741 = _v_buffer0_.v_cb0_[79];
    let _e742 = u_xlat0_;
    let _e745 = u_xlat1_;
    u_xlat1_ = ((_e741 * _e742.xxxx) + _e745);
    let _e750 = _v_buffer0_.v_cb0_[81];
    let _e751 = u_xlat0_;
    let _e754 = u_xlat1_;
    u_xlat1_ = ((_e750 * _e751.zzzz) + _e754);
    let _e760 = _v_buffer0_.v_cb0_[82];
    let _e761 = u_xlat0_;
    let _e764 = u_xlat1_;
    gl_Position = ((_e760 * _e761.wwww) + _e764);
    let _e766 = vs_TEXCOORD0_;
    let _e768 = in_TEXCOORD0_1;
    let _e773 = _v_buffer0_.v_cb0_[132];
    let _e779 = _v_buffer0_.v_cb0_[132];
    let _e781 = ((_e768.xy * _e773.xy) + _e779.zw);
    vs_TEXCOORD0_.x = _e781.x;
    vs_TEXCOORD0_.y = _e781.y;
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(6) in_TEXCOORD2_: vec2<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_TEXCOORD2_1 = in_TEXCOORD2_;
    main_1();
    let _e28 = vs_TEXCOORD0_;
    let _e30 = gl_Position;
    return VertexOutput(_e28, _e30);
}
