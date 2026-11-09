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
    v_cb3_: vec4<f32>,
}

struct VertexOutput {
    @location(12) vs_NORMAL0_: vec3<f32>,
    @location(0) vs_TEXCOORD0_: vec2<f32>,
    @location(1) vs_TEXCOORD1_: vec3<f32>,
    @location(2) vs_TEXCOORD2_: vec3<f32>,
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
var<private> in_NORMAL0_1: vec3<f32>;
var<private> in_TEXCOORD0_1: vec2<f32>;
var<private> in_COLOR0_1: vec4<f32>;
var<private> vs_NORMAL0_: vec3<f32>;
var<private> vs_TEXCOORD0_: vec2<f32>;
var<private> vs_TEXCOORD1_: vec3<f32>;
var<private> vs_TEXCOORD2_: vec3<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec3<f32> = vec3(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlat5_: vec3<f32> = vec3(0f);
    var u_xlat6_: f32 = 0f;
    var u_xlat12_: vec2<f32> = vec2(0f);
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

    let _e86 = _v_buffer0_.v_cb0_[15];
    let _e88 = _v_buffer3_;
    u_xlat0_.x = (_e86.x * _e88.v_cb3_.w);
    let _e92 = u_xlat0_;
    let _e94 = _v_buffer3_;
    u_xlat6_ = (_e92.x * _e94.v_cb3_.z);
    let _e98 = u_xlat6_;
    u_xlat6_ = sin(_e98);
    let _e100 = u_xlat6_;
    u_xlat6_ = (_e100 + 2f);
    let _e103 = u_xlat6_;
    let _e104 = _v_buffer3_;
    u_xlat6_ = (_e103 * _e104.v_cb3_.x);
    let _e108 = u_xlat6_;
    u_xlat6_ = (_e108 * 0.2f);
    let _e111 = u_xlat12_;
    let _e113 = in_POSITION0_1;
    let _e115 = _v_buffer3_;
    let _e118 = (_e113.xz * _e115.v_cb3_.yy);
    u_xlat12_.x = _e118.x;
    u_xlat12_.y = _e118.y;
    let _e123 = u_xlat0_;
    let _e125 = u_xlat0_;
    let _e131 = u_xlat12_;
    let _e133 = ((_e125.xx * vec2<f32>(30f, 42f)) + _e131.xy);
    u_xlat0_.x = _e133.x;
    u_xlat0_.z = _e133.y;
    let _e139 = u_xlat0_;
    u_xlat0_.x = sin(_e139.x);
    let _e143 = u_xlat6_;
    let _e144 = u_xlat0_;
    u_xlat0_.x = (_e143 * _e144.x);
    let _e148 = u_xlat0_;
    u_xlat12_.x = cos(_e148.z);
    let _e152 = u_xlat6_;
    let _e153 = u_xlat12_;
    u_xlat0_.y = (_e152 * _e153.x);
    let _e156 = u_xlat0_;
    let _e158 = u_xlat0_;
    let _e163 = (_e158.xy * vec2<f32>(0.01f, 0.02f));
    u_xlat0_.x = _e163.x;
    u_xlat0_.y = _e163.y;
    let _e168 = u_xlat0_;
    let _e170 = u_xlat0_;
    let _e172 = in_COLOR0_1;
    let _e174 = (_e170.xy * _e172.xx);
    u_xlat0_.x = _e174.x;
    u_xlat0_.y = _e174.y;
    let _e179 = u_xlat0_;
    let _e181 = u_xlat0_;
    let _e189 = in_POSITION0_1;
    let _e191 = ((_e181.xxx * vec3<f32>(-0.5f, 0f, 0.25f)) + _e189.xyz);
    u_xlat0_.x = _e191.x;
    u_xlat0_.z = _e191.y;
    u_xlat0_.w = _e191.z;
    let _e198 = u_xlat0_;
    let _e200 = u_xlat0_;
    let _e209 = u_xlat0_;
    let _e211 = ((_e200.yyy * vec3<f32>(-0.3f, 0f, -0.5f)) + _e209.xzw);
    u_xlat0_.x = _e211.x;
    u_xlat0_.y = _e211.y;
    u_xlat0_.z = _e211.z;
    let _e218 = u_xlat0_;
    let _e223 = _v_buffer2_.v_cb2_[1];
    u_xlat1_ = (_e218.yyyy * _e223);
    let _e228 = _v_buffer2_.v_cb2_[0];
    let _e229 = u_xlat0_;
    let _e232 = u_xlat1_;
    u_xlat1_ = ((_e228 * _e229.xxxx) + _e232);
    let _e237 = _v_buffer2_.v_cb2_[2];
    let _e238 = u_xlat0_;
    let _e241 = u_xlat1_;
    u_xlat0_ = ((_e237 * _e238.zzzz) + _e241);
    let _e243 = u_xlat0_;
    let _e247 = _v_buffer2_.v_cb2_[3];
    u_xlat0_ = (_e243 + _e247);
    let _e249 = u_xlat0_;
    let _e254 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e249.yyyy * _e254);
    let _e259 = _v_buffer0_.v_cb0_[79];
    let _e260 = u_xlat0_;
    let _e263 = u_xlat1_;
    u_xlat1_ = ((_e259 * _e260.xxxx) + _e263);
    let _e268 = _v_buffer0_.v_cb0_[81];
    let _e269 = u_xlat0_;
    let _e272 = u_xlat1_;
    u_xlat1_ = ((_e268 * _e269.zzzz) + _e272);
    let _e278 = _v_buffer0_.v_cb0_[82];
    let _e279 = u_xlat0_;
    let _e282 = u_xlat1_;
    gl_Position = ((_e278 * _e279.wwww) + _e282);
    let _e285 = in_NORMAL0_1;
    let _e290 = _v_buffer2_.v_cb2_[4];
    u_xlat0_.x = dot(_e285.xyz, _e290.xyz);
    let _e294 = in_NORMAL0_1;
    let _e299 = _v_buffer2_.v_cb2_[5];
    u_xlat0_.y = dot(_e294.xyz, _e299.xyz);
    let _e303 = in_NORMAL0_1;
    let _e308 = _v_buffer2_.v_cb2_[6];
    u_xlat0_.z = dot(_e303.xyz, _e308.xyz);
    let _e311 = u_xlat0_;
    let _e313 = u_xlat0_;
    u_xlat18_ = dot(_e311.xyz, _e313.xyz);
    let _e316 = u_xlat18_;
    u_xlat18_ = max(_e316, 0.000000000000000000000000000000000000011754944f);
    let _e319 = u_xlat18_;
    u_xlat18_ = inverseSqrt(_e319);
    let _e321 = u_xlat0_;
    let _e323 = u_xlat18_;
    let _e325 = u_xlat0_;
    let _e327 = (vec3(_e323) * _e325.xyz);
    u_xlat0_.x = _e327.x;
    u_xlat0_.y = _e327.y;
    u_xlat0_.z = _e327.z;
    let _e334 = u_xlat1_;
    let _e336 = in_POSITION0_1;
    let _e341 = _v_buffer2_.v_cb2_[1];
    let _e343 = (_e336.yyy * _e341.xyz);
    u_xlat1_.x = _e343.x;
    u_xlat1_.y = _e343.y;
    u_xlat1_.z = _e343.z;
    let _e350 = u_xlat1_;
    let _e355 = _v_buffer2_.v_cb2_[0];
    let _e357 = in_POSITION0_1;
    let _e360 = u_xlat1_;
    let _e362 = ((_e355.xyz * _e357.xxx) + _e360.xyz);
    u_xlat1_.x = _e362.x;
    u_xlat1_.y = _e362.y;
    u_xlat1_.z = _e362.z;
    let _e369 = u_xlat1_;
    let _e374 = _v_buffer2_.v_cb2_[2];
    let _e376 = in_POSITION0_1;
    let _e379 = u_xlat1_;
    let _e381 = ((_e374.xyz * _e376.zzz) + _e379.xyz);
    u_xlat1_.x = _e381.x;
    u_xlat1_.y = _e381.y;
    u_xlat1_.z = _e381.z;
    let _e388 = u_xlat1_;
    let _e390 = u_xlat1_;
    let _e395 = _v_buffer2_.v_cb2_[3];
    let _e397 = (_e390.xyz + _e395.xyz);
    u_xlat1_.x = _e397.x;
    u_xlat1_.y = _e397.y;
    u_xlat1_.z = _e397.z;
    let _e408 = _v_buffer2_.v_cb2_[27];
    u_xlat2_.x = abs(_e408.w);
    let _e415 = _v_buffer2_.v_cb2_[28];
    u_xlat2_.y = abs(_e415.w);
    let _e422 = _v_buffer2_.v_cb2_[29];
    u_xlat2_.z = abs(_e422.w);
    let _e425 = u_xlat2_;
    let _e427 = u_xlat2_;
    let _e429 = log2(_e427.xyz);
    u_xlat2_.x = _e429.x;
    u_xlat2_.y = _e429.y;
    u_xlat2_.z = _e429.z;
    let _e436 = u_xlat2_;
    let _e438 = u_xlat2_;
    let _e444 = (_e438.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat2_.x = _e444.x;
    u_xlat2_.y = _e444.y;
    u_xlat2_.z = _e444.z;
    let _e451 = u_xlat2_;
    let _e453 = u_xlat2_;
    let _e455 = exp2(_e453.xyz);
    u_xlat2_.x = _e455.x;
    u_xlat2_.y = _e455.y;
    u_xlat2_.z = _e455.z;
    let _e462 = u_xlat2_;
    let _e464 = u_xlat2_;
    let _e478 = ((_e464.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat2_.x = _e478.x;
    u_xlat2_.y = _e478.y;
    u_xlat2_.z = _e478.z;
    let _e485 = u_xlat2_;
    let _e487 = u_xlat2_;
    let _e493 = clamp(_e487.xyz, vec3(0f), vec3(1f));
    u_xlat2_.x = _e493.x;
    u_xlat2_.y = _e493.y;
    u_xlat2_.z = _e493.z;
    let _e503 = _v_buffer0_.v_cb0_[10];
    let _e508 = _v_buffer2_.v_cb2_[11];
    u_xlat18_ = min(_e503.x, _e508.y);
    let _e511 = u_xlat18_;
    u_xlatu18_ = u32(i32(_e511));
    u_xlat3_.x = 0f;
    u_xlat3_.y = 0f;
    u_xlat3_.z = 0f;
    loop {
        let _e525 = u_xlatu_loop_1_;
        let _e526 = u_xlatu18_;
        if !((_e525 < _e526)) {
            break;
        }
        {
            let _e532 = u_xlatu_loop_1_;
            u_xlatu20_ = (_e532 >> 2u);
            let _e535 = u_xlatu_loop_1_;
            u_xlati21_ = i32((_e535 & 3u));
            let _e539 = u_xlatu20_;
            let _e545 = _v_buffer2_.v_cb2_[(i32(_e539) + 12i)];
            let _e546 = u_xlati21_;
            let _e550 = local[_e546];
            u_xlat20_ = dot(_e545, bitcast<vec4<f32>>(_e550));
            let _e553 = u_xlat20_;
            u_xlati20_ = i32(_e553);
            let _e555 = u_xlat4_;
            let _e557 = u_xlat1_;
            let _e560 = u_xlati20_;
            let _e563 = _v_buffer1_.v_cb1_[_e560];
            let _e566 = u_xlati20_;
            let _e569 = _v_buffer1_.v_cb1_[_e566];
            let _e571 = ((-(_e557.xyz) * _e563.www) + _e569.xyz);
            u_xlat4_.x = _e571.x;
            u_xlat4_.y = _e571.y;
            u_xlat4_.z = _e571.z;
            let _e578 = u_xlat4_;
            let _e580 = u_xlat4_;
            u_xlat21_ = dot(_e578.xyz, _e580.xyz);
            let _e583 = u_xlat21_;
            u_xlat21_ = max(_e583, 0.000061035156f);
            let _e586 = u_xlat21_;
            u_xlat22_ = inverseSqrt(_e586);
            let _e588 = u_xlat4_;
            let _e590 = u_xlat22_;
            let _e592 = u_xlat4_;
            let _e594 = (vec3(_e590) * _e592.xyz);
            u_xlat4_.x = _e594.x;
            u_xlat4_.y = _e594.y;
            u_xlat4_.z = _e594.z;
            let _e603 = u_xlati20_;
            let _e608 = _v_buffer1_.v_cb1_[(_e603 + 512i)];
            u_xlat22_ = (1f / _e608.x);
            let _e611 = u_xlat21_;
            u_xlat21_ = (_e611 * 25f);
            let _e614 = u_xlat21_;
            let _e615 = u_xlat22_;
            u_xlat21_ = (_e614 / _e615);
            let _e617 = u_xlat21_;
            u_xlat21_ = (_e617 + 1f);
            let _e622 = u_xlat21_;
            u_xlat21_ = (1f / _e622);
            let _e624 = u_xlati20_;
            let _e629 = _v_buffer1_.v_cb1_[(_e624 + 768i)];
            let _e631 = u_xlat4_;
            u_xlat22_ = dot(_e629.xyz, _e631.xyz);
            let _e634 = u_xlat22_;
            let _e635 = u_xlati20_;
            let _e640 = _v_buffer1_.v_cb1_[(_e635 + 512i)];
            let _e643 = u_xlati20_;
            let _e648 = _v_buffer1_.v_cb1_[(_e643 + 512i)];
            u_xlat22_ = ((_e634 * _e640.z) + _e648.w);
            let _e651 = u_xlat22_;
            u_xlat22_ = clamp(_e651, 0f, 1f);
            let _e655 = u_xlat22_;
            let _e656 = u_xlat22_;
            u_xlat22_ = (_e655 * _e656);
            let _e658 = u_xlat21_;
            let _e659 = u_xlat22_;
            u_xlat21_ = (_e658 * _e659);
            let _e661 = u_xlat5_;
            let _e663 = u_xlat21_;
            let _e665 = u_xlati20_;
            let _e670 = _v_buffer1_.v_cb1_[(_e665 + 256i)];
            let _e672 = (vec3(_e663) * _e670.xyz);
            u_xlat5_.x = _e672.x;
            u_xlat5_.y = _e672.y;
            u_xlat5_.z = _e672.z;
            let _e679 = u_xlat0_;
            let _e681 = u_xlat4_;
            u_xlat20_ = dot(_e679.xyz, _e681.xyz);
            let _e684 = u_xlat20_;
            u_xlat20_ = clamp(_e684, 0f, 1f);
            let _e688 = u_xlat3_;
            let _e690 = u_xlat5_;
            let _e692 = u_xlat20_;
            let _e695 = u_xlat3_;
            let _e697 = ((_e690.xyz * vec3(_e692)) + _e695.xyz);
            u_xlat3_.x = _e697.x;
            u_xlat3_.y = _e697.y;
            u_xlat3_.z = _e697.z;
        }
        continuing {
            let _e529 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e529 + 1u);
        }
    }
    let _e704 = vs_TEXCOORD2_;
    let _e706 = u_xlat2_;
    let _e708 = u_xlat3_;
    let _e710 = (_e706.xyz + _e708.xyz);
    vs_TEXCOORD2_.x = _e710.x;
    vs_TEXCOORD2_.y = _e710.y;
    vs_TEXCOORD2_.z = _e710.z;
    let _e717 = vs_NORMAL0_;
    let _e719 = u_xlat0_;
    let _e720 = _e719.xyz;
    vs_NORMAL0_.x = _e720.x;
    vs_NORMAL0_.y = _e720.y;
    vs_NORMAL0_.z = _e720.z;
    let _e727 = vs_TEXCOORD1_;
    let _e729 = u_xlat1_;
    let _e730 = _e729.xyz;
    vs_TEXCOORD1_.x = _e730.x;
    vs_TEXCOORD1_.y = _e730.y;
    vs_TEXCOORD1_.z = _e730.z;
    let _e737 = vs_TEXCOORD0_;
    let _e739 = in_TEXCOORD0_1;
    let _e740 = _e739.xy;
    vs_TEXCOORD0_.x = _e740.x;
    vs_TEXCOORD0_.y = _e740.y;
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(1) in_NORMAL0_: vec3<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(3) in_COLOR0_: vec4<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_NORMAL0_1 = in_NORMAL0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_COLOR0_1 = in_COLOR0_;
    main_1();
    let _e39 = vs_NORMAL0_;
    let _e41 = vs_TEXCOORD0_;
    let _e43 = vs_TEXCOORD1_;
    let _e45 = vs_TEXCOORD2_;
    let _e47 = gl_Position;
    return VertexOutput(_e39, _e41, _e43, _e45, _e47);
}
