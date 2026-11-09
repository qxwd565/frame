struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 1024>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 30>,
}

struct v_buffer3_ {
    v_cb3_: array<vec4<f32>, 6>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec2<f32>,
    @location(1) vs_TEXCOORD1_: vec3<f32>,
    @location(2) vs_TEXCOORD2_: vec3<f32>,
    @location(12) vs_NORMAL0_: vec3<f32>,
    @builtin(position) gl_Position: vec4<f32>,
}

const ImmCB_0_: array<vec4<u32>, 4> = array<vec4<u32>, 4>(vec4<u32>(1065353216u, 0u, 0u, 0u), vec4<u32>(0u, 1065353216u, 0u, 0u), vec4<u32>(0u, 0u, 1065353216u, 0u), vec4<u32>(0u, 0u, 0u, 1065353216u));

@group(0) @binding(0) 
var<uniform> _v_buffer0_: v_buffer0_;
@group(0) @binding(1) 
var<uniform> _v_buffer1_: v_buffer1_;
@group(0) @binding(2) 
var<uniform> _v_buffer2_: v_buffer2_;
@group(0) @binding(3) 
var<uniform> _v_buffer3_: v_buffer3_;
var<private> in_POSITION0_1: vec4<f32>;
var<private> in_TEXCOORD0_1: vec2<f32>;
var<private> in_NORMAL0_1: vec3<f32>;
var<private> vs_TEXCOORD0_: vec2<f32>;
var<private> vs_TEXCOORD1_: vec3<f32>;
var<private> vs_TEXCOORD2_: vec3<f32>;
var<private> vs_NORMAL0_: vec3<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlat5_: vec3<f32> = vec3(0f);
    var u_xlat18_: f32 = 0f;
    var u_xlatu18_: u32 = 0u;
    var u_xlatu19_: u32 = 0u;
    var u_xlat20_: f32 = 0f;
    var u_xlati20_: i32 = 0i;
    var u_xlatu20_: u32 = 0u;
    var u_xlatb20_: bool = false;
    var u_xlat21_: f32 = 0f;
    var u_xlati21_: i32 = 0i;
    var u_xlat22_: f32 = 0f;
    var u_xlatu_loop_1_: u32 = 0u;
    var local: array<vec4<u32>, 4> = ImmCB_0_;

    let _e74 = in_POSITION0_1;
    let _e79 = _v_buffer2_.v_cb2_[1];
    u_xlat0_ = (_e74.yyyy * _e79);
    let _e84 = _v_buffer2_.v_cb2_[0];
    let _e85 = in_POSITION0_1;
    let _e88 = u_xlat0_;
    u_xlat0_ = ((_e84 * _e85.xxxx) + _e88);
    let _e93 = _v_buffer2_.v_cb2_[2];
    let _e94 = in_POSITION0_1;
    let _e97 = u_xlat0_;
    u_xlat0_ = ((_e93 * _e94.zzzz) + _e97);
    let _e102 = _v_buffer2_.v_cb2_[3];
    let _e103 = in_POSITION0_1;
    let _e106 = u_xlat0_;
    u_xlat1_ = ((_e102 * _e103.wwww) + _e106);
    let _e108 = u_xlat1_;
    let _e112 = _v_buffer2_.v_cb2_[3];
    u_xlat1_ = (_e108 + -(_e112));
    let _e115 = u_xlat1_;
    let _e119 = _v_buffer3_.v_cb3_[1];
    u_xlat1_ = (_e115 * _e119);
    let _e121 = u_xlat1_;
    let _e126 = _v_buffer3_.v_cb3_[3];
    u_xlat2_ = (_e121.yyyy * _e126);
    let _e131 = _v_buffer3_.v_cb3_[2];
    let _e132 = u_xlat1_;
    let _e135 = u_xlat2_;
    u_xlat2_ = ((_e131 * _e132.xxxx) + _e135);
    let _e140 = _v_buffer3_.v_cb3_[4];
    let _e141 = u_xlat1_;
    let _e144 = u_xlat2_;
    u_xlat2_ = ((_e140 * _e141.zzzz) + _e144);
    let _e149 = _v_buffer3_.v_cb3_[5];
    let _e150 = u_xlat1_;
    let _e153 = u_xlat2_;
    u_xlat1_ = ((_e149 * _e150.wwww) + _e153);
    let _e155 = u_xlat1_;
    let _e159 = _v_buffer2_.v_cb2_[3];
    u_xlat1_ = (_e155 + _e159);
    let _e161 = u_xlat2_;
    let _e163 = u_xlat1_;
    let _e168 = _v_buffer2_.v_cb2_[5];
    let _e170 = (_e163.yyy * _e168.xyz);
    u_xlat2_.x = _e170.x;
    u_xlat2_.y = _e170.y;
    u_xlat2_.z = _e170.z;
    let _e177 = u_xlat2_;
    let _e182 = _v_buffer2_.v_cb2_[4];
    let _e184 = u_xlat1_;
    let _e187 = u_xlat2_;
    let _e189 = ((_e182.xyz * _e184.xxx) + _e187.xyz);
    u_xlat2_.x = _e189.x;
    u_xlat2_.y = _e189.y;
    u_xlat2_.z = _e189.z;
    let _e196 = u_xlat1_;
    let _e201 = _v_buffer2_.v_cb2_[6];
    let _e203 = u_xlat1_;
    let _e206 = u_xlat2_;
    let _e208 = ((_e201.xyz * _e203.zzz) + _e206.xyz);
    u_xlat1_.x = _e208.x;
    u_xlat1_.y = _e208.y;
    u_xlat1_.z = _e208.z;
    let _e215 = u_xlat1_;
    let _e220 = _v_buffer2_.v_cb2_[7];
    let _e222 = u_xlat1_;
    let _e225 = u_xlat1_;
    let _e227 = ((_e220.xyz * _e222.www) + _e225.xyz);
    u_xlat1_.x = _e227.x;
    u_xlat1_.y = _e227.y;
    u_xlat1_.z = _e227.z;
    let _e234 = u_xlat1_;
    let _e239 = _v_buffer2_.v_cb2_[1];
    u_xlat2_ = (_e234.yyyy * _e239);
    let _e244 = _v_buffer2_.v_cb2_[0];
    let _e245 = u_xlat1_;
    let _e248 = u_xlat2_;
    u_xlat2_ = ((_e244 * _e245.xxxx) + _e248);
    let _e253 = _v_buffer2_.v_cb2_[2];
    let _e254 = u_xlat1_;
    let _e257 = u_xlat2_;
    u_xlat1_ = ((_e253 * _e254.zzzz) + _e257);
    let _e259 = u_xlat1_;
    let _e263 = _v_buffer2_.v_cb2_[3];
    u_xlat1_ = (_e259 + _e263);
    let _e265 = u_xlat1_;
    let _e270 = _v_buffer0_.v_cb0_[80];
    u_xlat2_ = (_e265.yyyy * _e270);
    let _e275 = _v_buffer0_.v_cb0_[79];
    let _e276 = u_xlat1_;
    let _e279 = u_xlat2_;
    u_xlat2_ = ((_e275 * _e276.xxxx) + _e279);
    let _e284 = _v_buffer0_.v_cb0_[81];
    let _e285 = u_xlat1_;
    let _e288 = u_xlat2_;
    u_xlat2_ = ((_e284 * _e285.zzzz) + _e288);
    let _e294 = _v_buffer0_.v_cb0_[82];
    let _e295 = u_xlat1_;
    let _e298 = u_xlat2_;
    gl_Position = ((_e294 * _e295.wwww) + _e298);
    let _e300 = vs_TEXCOORD0_;
    let _e302 = in_TEXCOORD0_1;
    let _e307 = _v_buffer3_.v_cb3_[0];
    let _e313 = _v_buffer3_.v_cb3_[0];
    let _e315 = ((_e302.xy * _e307.xy) + _e313.zw);
    vs_TEXCOORD0_.x = _e315.x;
    vs_TEXCOORD0_.y = _e315.y;
    let _e321 = in_NORMAL0_1;
    let _e326 = _v_buffer2_.v_cb2_[4];
    u_xlat1_.x = dot(_e321.xyz, _e326.xyz);
    let _e330 = in_NORMAL0_1;
    let _e335 = _v_buffer2_.v_cb2_[5];
    u_xlat1_.y = dot(_e330.xyz, _e335.xyz);
    let _e339 = in_NORMAL0_1;
    let _e344 = _v_buffer2_.v_cb2_[6];
    u_xlat1_.z = dot(_e339.xyz, _e344.xyz);
    let _e347 = u_xlat1_;
    let _e349 = u_xlat1_;
    u_xlat18_ = dot(_e347.xyz, _e349.xyz);
    let _e352 = u_xlat18_;
    u_xlat18_ = max(_e352, 0.000000000000000000000000000000000000011754944f);
    let _e355 = u_xlat18_;
    u_xlat18_ = inverseSqrt(_e355);
    let _e357 = u_xlat1_;
    let _e359 = u_xlat18_;
    let _e361 = u_xlat1_;
    let _e363 = (vec3(_e359) * _e361.xyz);
    u_xlat1_.x = _e363.x;
    u_xlat1_.y = _e363.y;
    u_xlat1_.z = _e363.z;
    let _e370 = u_xlat0_;
    let _e372 = u_xlat0_;
    let _e377 = _v_buffer2_.v_cb2_[3];
    let _e379 = (_e372.xyz + _e377.xyz);
    u_xlat0_.x = _e379.x;
    u_xlat0_.y = _e379.y;
    u_xlat0_.z = _e379.z;
    let _e390 = _v_buffer2_.v_cb2_[27];
    u_xlat2_.x = abs(_e390.w);
    let _e397 = _v_buffer2_.v_cb2_[28];
    u_xlat2_.y = abs(_e397.w);
    let _e404 = _v_buffer2_.v_cb2_[29];
    u_xlat2_.z = abs(_e404.w);
    let _e407 = u_xlat2_;
    let _e409 = u_xlat2_;
    let _e411 = log2(_e409.xyz);
    u_xlat2_.x = _e411.x;
    u_xlat2_.y = _e411.y;
    u_xlat2_.z = _e411.z;
    let _e418 = u_xlat2_;
    let _e420 = u_xlat2_;
    let _e426 = (_e420.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat2_.x = _e426.x;
    u_xlat2_.y = _e426.y;
    u_xlat2_.z = _e426.z;
    let _e433 = u_xlat2_;
    let _e435 = u_xlat2_;
    let _e437 = exp2(_e435.xyz);
    u_xlat2_.x = _e437.x;
    u_xlat2_.y = _e437.y;
    u_xlat2_.z = _e437.z;
    let _e444 = u_xlat2_;
    let _e446 = u_xlat2_;
    let _e460 = ((_e446.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat2_.x = _e460.x;
    u_xlat2_.y = _e460.y;
    u_xlat2_.z = _e460.z;
    let _e467 = u_xlat2_;
    let _e469 = u_xlat2_;
    let _e475 = clamp(_e469.xyz, vec3(0f), vec3(1f));
    u_xlat2_.x = _e475.x;
    u_xlat2_.y = _e475.y;
    u_xlat2_.z = _e475.z;
    let _e485 = _v_buffer0_.v_cb0_[10];
    let _e490 = _v_buffer2_.v_cb2_[11];
    u_xlat18_ = min(_e485.x, _e490.y);
    let _e493 = u_xlat18_;
    u_xlatu18_ = u32(i32(_e493));
    u_xlat3_.x = 0f;
    u_xlat3_.y = 0f;
    u_xlat3_.z = 0f;
    loop {
        let _e507 = u_xlatu_loop_1_;
        let _e508 = u_xlatu18_;
        if !((_e507 < _e508)) {
            break;
        }
        {
            let _e514 = u_xlatu_loop_1_;
            u_xlatu20_ = (_e514 >> 2u);
            let _e517 = u_xlatu_loop_1_;
            u_xlati21_ = i32((_e517 & 3u));
            let _e521 = u_xlatu20_;
            let _e527 = _v_buffer2_.v_cb2_[(i32(_e521) + 12i)];
            let _e528 = u_xlati21_;
            let _e532 = local[_e528];
            u_xlat20_ = dot(_e527, bitcast<vec4<f32>>(_e532));
            let _e535 = u_xlat20_;
            u_xlati20_ = i32(_e535);
            let _e537 = u_xlat4_;
            let _e539 = u_xlat0_;
            let _e542 = u_xlati20_;
            let _e545 = _v_buffer1_.v_cb1_[_e542];
            let _e548 = u_xlati20_;
            let _e551 = _v_buffer1_.v_cb1_[_e548];
            let _e553 = ((-(_e539.xyz) * _e545.www) + _e551.xyz);
            u_xlat4_.x = _e553.x;
            u_xlat4_.y = _e553.y;
            u_xlat4_.z = _e553.z;
            let _e560 = u_xlat4_;
            let _e562 = u_xlat4_;
            u_xlat21_ = dot(_e560.xyz, _e562.xyz);
            let _e565 = u_xlat21_;
            u_xlat21_ = max(_e565, 0.000061035156f);
            let _e568 = u_xlat21_;
            u_xlat22_ = inverseSqrt(_e568);
            let _e570 = u_xlat4_;
            let _e572 = u_xlat22_;
            let _e574 = u_xlat4_;
            let _e576 = (vec3(_e572) * _e574.xyz);
            u_xlat4_.x = _e576.x;
            u_xlat4_.y = _e576.y;
            u_xlat4_.z = _e576.z;
            let _e585 = u_xlati20_;
            let _e590 = _v_buffer1_.v_cb1_[(_e585 + 512i)];
            u_xlat22_ = (1f / _e590.x);
            let _e593 = u_xlat21_;
            u_xlat21_ = (_e593 * 25f);
            let _e596 = u_xlat21_;
            let _e597 = u_xlat22_;
            u_xlat21_ = (_e596 / _e597);
            let _e599 = u_xlat21_;
            u_xlat21_ = (_e599 + 1f);
            let _e604 = u_xlat21_;
            u_xlat21_ = (1f / _e604);
            let _e606 = u_xlati20_;
            let _e611 = _v_buffer1_.v_cb1_[(_e606 + 768i)];
            let _e613 = u_xlat4_;
            u_xlat22_ = dot(_e611.xyz, _e613.xyz);
            let _e616 = u_xlat22_;
            let _e617 = u_xlati20_;
            let _e622 = _v_buffer1_.v_cb1_[(_e617 + 512i)];
            let _e625 = u_xlati20_;
            let _e630 = _v_buffer1_.v_cb1_[(_e625 + 512i)];
            u_xlat22_ = ((_e616 * _e622.z) + _e630.w);
            let _e633 = u_xlat22_;
            u_xlat22_ = clamp(_e633, 0f, 1f);
            let _e637 = u_xlat22_;
            let _e638 = u_xlat22_;
            u_xlat22_ = (_e637 * _e638);
            let _e640 = u_xlat21_;
            let _e641 = u_xlat22_;
            u_xlat21_ = (_e640 * _e641);
            let _e643 = u_xlat5_;
            let _e645 = u_xlat21_;
            let _e647 = u_xlati20_;
            let _e652 = _v_buffer1_.v_cb1_[(_e647 + 256i)];
            let _e654 = (vec3(_e645) * _e652.xyz);
            u_xlat5_.x = _e654.x;
            u_xlat5_.y = _e654.y;
            u_xlat5_.z = _e654.z;
            let _e661 = u_xlat1_;
            let _e663 = u_xlat4_;
            u_xlat20_ = dot(_e661.xyz, _e663.xyz);
            let _e666 = u_xlat20_;
            u_xlat20_ = clamp(_e666, 0f, 1f);
            let _e670 = u_xlat3_;
            let _e672 = u_xlat5_;
            let _e674 = u_xlat20_;
            let _e677 = u_xlat3_;
            let _e679 = ((_e672.xyz * vec3(_e674)) + _e677.xyz);
            u_xlat3_.x = _e679.x;
            u_xlat3_.y = _e679.y;
            u_xlat3_.z = _e679.z;
        }
        continuing {
            let _e511 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e511 + 1u);
        }
    }
    let _e686 = vs_TEXCOORD2_;
    let _e688 = u_xlat2_;
    let _e690 = u_xlat3_;
    let _e692 = (_e688.xyz + _e690.xyz);
    vs_TEXCOORD2_.x = _e692.x;
    vs_TEXCOORD2_.y = _e692.y;
    vs_TEXCOORD2_.z = _e692.z;
    let _e699 = vs_TEXCOORD1_;
    let _e701 = u_xlat0_;
    let _e702 = _e701.xyz;
    vs_TEXCOORD1_.x = _e702.x;
    vs_TEXCOORD1_.y = _e702.y;
    vs_TEXCOORD1_.z = _e702.z;
    let _e709 = vs_NORMAL0_;
    let _e711 = u_xlat1_;
    let _e712 = _e711.xyz;
    vs_NORMAL0_.x = _e712.x;
    vs_NORMAL0_.y = _e712.y;
    vs_NORMAL0_.z = _e712.z;
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(1) in_NORMAL0_: vec3<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_NORMAL0_1 = in_NORMAL0_;
    main_1();
    let _e35 = vs_TEXCOORD0_;
    let _e37 = vs_TEXCOORD1_;
    let _e39 = vs_TEXCOORD2_;
    let _e41 = vs_NORMAL0_;
    let _e43 = gl_Position;
    return VertexOutput(_e35, _e37, _e39, _e41, _e43);
}
