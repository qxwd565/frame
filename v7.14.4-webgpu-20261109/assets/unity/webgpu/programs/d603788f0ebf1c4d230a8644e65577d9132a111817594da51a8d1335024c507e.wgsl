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
    v_cb3_: array<vec4<f32>, 2>,
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
var<private> in_TEXCOORD1_1: vec2<f32>;
var<private> in_TEXCOORD2_1: vec2<f32>;
var<private> in_NORMAL0_1: vec3<f32>;
var<private> vs_TEXCOORD0_: vec2<f32>;
var<private> vs_TEXCOORD1_: vec3<f32>;
var<private> vs_TEXCOORD2_: vec3<f32>;
var<private> vs_NORMAL0_: vec3<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec3<f32> = vec3(0f);
    var u_xlat2_: vec3<f32> = vec3(0f);
    var u_xlat3_: vec4<f32> = vec4(0f);
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlat5_: vec3<f32> = vec3(0f);
    var u_xlat6_: vec3<f32> = vec3(0f);
    var u_xlat7_: vec2<f32> = vec2(0f);
    var u_xlat14_: f32 = 0f;
    var u_xlatu14_: u32 = 0u;
    var u_xlatu21_: u32 = 0u;
    var u_xlat22_: f32 = 0f;
    var u_xlati22_: i32 = 0i;
    var u_xlatu22_: u32 = 0u;
    var u_xlatb22_: bool = false;
    var u_xlat23_: f32 = 0f;
    var u_xlati23_: i32 = 0i;
    var u_xlat24_: f32 = 0f;
    var u_xlatu_loop_1_: u32 = 0u;
    var local: array<vec4<u32>, 4> = ImmCB_0_;

    let _e84 = u_xlat0_;
    let _e89 = _v_buffer0_.v_cb0_[15];
    let _e94 = _v_buffer3_.v_cb3_[1];
    let _e96 = (_e89.yy * _e94.yz);
    u_xlat0_.x = _e96.x;
    u_xlat0_.y = _e96.y;
    let _e101 = u_xlat0_;
    let _e103 = u_xlat0_;
    let _e105 = sin(_e103.xy);
    u_xlat0_.x = _e105.x;
    u_xlat0_.y = _e105.y;
    let _e110 = u_xlat0_;
    let _e112 = u_xlat0_;
    let _e117 = _v_buffer3_.v_cb3_[1];
    let _e119 = (_e112.xy * _e117.xx);
    u_xlat0_.x = _e119.x;
    u_xlat0_.y = _e119.y;
    let _e124 = u_xlat7_;
    let _e126 = u_xlat0_;
    let _e128 = in_TEXCOORD2_1;
    let _e130 = (_e126.yy * _e128.xy);
    u_xlat7_.x = _e130.x;
    u_xlat7_.y = _e130.y;
    let _e135 = u_xlat0_;
    let _e137 = in_TEXCOORD1_1;
    let _e139 = u_xlat0_;
    let _e142 = u_xlat7_;
    let _e144 = ((_e137.xy * _e139.xx) + _e142.xy);
    u_xlat0_.x = _e144.x;
    u_xlat0_.y = _e144.y;
    let _e149 = u_xlat0_;
    let _e151 = u_xlat0_;
    let _e153 = in_POSITION0_1;
    let _e155 = (_e151.xy + _e153.xy);
    u_xlat0_.x = _e155.x;
    u_xlat0_.y = _e155.y;
    let _e160 = vs_TEXCOORD0_;
    let _e162 = in_TEXCOORD0_1;
    let _e167 = _v_buffer3_.v_cb3_[0];
    let _e173 = _v_buffer3_.v_cb3_[0];
    let _e175 = ((_e162.xy * _e167.xy) + _e173.zw);
    vs_TEXCOORD0_.x = _e175.x;
    vs_TEXCOORD0_.y = _e175.y;
    let _e181 = in_NORMAL0_1;
    let _e186 = _v_buffer2_.v_cb2_[4];
    u_xlat1_.x = dot(_e181.xyz, _e186.xyz);
    let _e190 = in_NORMAL0_1;
    let _e195 = _v_buffer2_.v_cb2_[5];
    u_xlat1_.y = dot(_e190.xyz, _e195.xyz);
    let _e199 = in_NORMAL0_1;
    let _e204 = _v_buffer2_.v_cb2_[6];
    u_xlat1_.z = dot(_e199.xyz, _e204.xyz);
    let _e207 = u_xlat1_;
    let _e209 = u_xlat1_;
    u_xlat14_ = dot(_e207.xyz, _e209.xyz);
    let _e212 = u_xlat14_;
    u_xlat14_ = max(_e212, 0.000000000000000000000000000000000000011754944f);
    let _e215 = u_xlat14_;
    u_xlat14_ = inverseSqrt(_e215);
    let _e217 = u_xlat1_;
    let _e219 = u_xlat14_;
    let _e221 = u_xlat1_;
    let _e223 = (vec3(_e219) * _e221.xyz);
    u_xlat1_.x = _e223.x;
    u_xlat1_.y = _e223.y;
    u_xlat1_.z = _e223.z;
    let _e230 = u_xlat2_;
    let _e232 = u_xlat0_;
    let _e237 = _v_buffer2_.v_cb2_[1];
    let _e239 = (_e232.yyy * _e237.xyz);
    u_xlat2_.x = _e239.x;
    u_xlat2_.y = _e239.y;
    u_xlat2_.z = _e239.z;
    let _e246 = u_xlat2_;
    let _e251 = _v_buffer2_.v_cb2_[0];
    let _e253 = u_xlat0_;
    let _e256 = u_xlat2_;
    let _e258 = ((_e251.xyz * _e253.xxx) + _e256.xyz);
    u_xlat2_.x = _e258.x;
    u_xlat2_.y = _e258.y;
    u_xlat2_.z = _e258.z;
    let _e265 = u_xlat2_;
    let _e270 = _v_buffer2_.v_cb2_[2];
    let _e272 = in_POSITION0_1;
    let _e275 = u_xlat2_;
    let _e277 = ((_e270.xyz * _e272.zzz) + _e275.xyz);
    u_xlat2_.x = _e277.x;
    u_xlat2_.y = _e277.y;
    u_xlat2_.z = _e277.z;
    let _e284 = u_xlat2_;
    let _e286 = u_xlat2_;
    let _e291 = _v_buffer2_.v_cb2_[3];
    let _e293 = (_e286.xyz + _e291.xyz);
    u_xlat2_.x = _e293.x;
    u_xlat2_.y = _e293.y;
    u_xlat2_.z = _e293.z;
    let _e304 = _v_buffer2_.v_cb2_[27];
    u_xlat3_.x = abs(_e304.w);
    let _e311 = _v_buffer2_.v_cb2_[28];
    u_xlat3_.y = abs(_e311.w);
    let _e318 = _v_buffer2_.v_cb2_[29];
    u_xlat3_.z = abs(_e318.w);
    let _e321 = u_xlat3_;
    let _e323 = u_xlat3_;
    let _e325 = log2(_e323.xyz);
    u_xlat3_.x = _e325.x;
    u_xlat3_.y = _e325.y;
    u_xlat3_.z = _e325.z;
    let _e332 = u_xlat3_;
    let _e334 = u_xlat3_;
    let _e340 = (_e334.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat3_.x = _e340.x;
    u_xlat3_.y = _e340.y;
    u_xlat3_.z = _e340.z;
    let _e347 = u_xlat3_;
    let _e349 = u_xlat3_;
    let _e351 = exp2(_e349.xyz);
    u_xlat3_.x = _e351.x;
    u_xlat3_.y = _e351.y;
    u_xlat3_.z = _e351.z;
    let _e358 = u_xlat3_;
    let _e360 = u_xlat3_;
    let _e374 = ((_e360.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat3_.x = _e374.x;
    u_xlat3_.y = _e374.y;
    u_xlat3_.z = _e374.z;
    let _e381 = u_xlat3_;
    let _e383 = u_xlat3_;
    let _e389 = clamp(_e383.xyz, vec3(0f), vec3(1f));
    u_xlat3_.x = _e389.x;
    u_xlat3_.y = _e389.y;
    u_xlat3_.z = _e389.z;
    let _e399 = _v_buffer0_.v_cb0_[10];
    let _e404 = _v_buffer2_.v_cb2_[11];
    u_xlat14_ = min(_e399.x, _e404.y);
    let _e407 = u_xlat14_;
    u_xlatu14_ = u32(i32(_e407));
    u_xlat4_.x = 0f;
    u_xlat4_.y = 0f;
    u_xlat4_.z = 0f;
    loop {
        let _e421 = u_xlatu_loop_1_;
        let _e422 = u_xlatu14_;
        if !((_e421 < _e422)) {
            break;
        }
        {
            let _e428 = u_xlatu_loop_1_;
            u_xlatu22_ = (_e428 >> 2u);
            let _e431 = u_xlatu_loop_1_;
            u_xlati23_ = i32((_e431 & 3u));
            let _e435 = u_xlatu22_;
            let _e441 = _v_buffer2_.v_cb2_[(i32(_e435) + 12i)];
            let _e442 = u_xlati23_;
            let _e446 = local[_e442];
            u_xlat22_ = dot(_e441, bitcast<vec4<f32>>(_e446));
            let _e449 = u_xlat22_;
            u_xlati22_ = i32(_e449);
            let _e451 = u_xlat5_;
            let _e453 = u_xlat2_;
            let _e456 = u_xlati22_;
            let _e459 = _v_buffer1_.v_cb1_[_e456];
            let _e462 = u_xlati22_;
            let _e465 = _v_buffer1_.v_cb1_[_e462];
            let _e467 = ((-(_e453.xyz) * _e459.www) + _e465.xyz);
            u_xlat5_.x = _e467.x;
            u_xlat5_.y = _e467.y;
            u_xlat5_.z = _e467.z;
            let _e474 = u_xlat5_;
            let _e476 = u_xlat5_;
            u_xlat23_ = dot(_e474.xyz, _e476.xyz);
            let _e479 = u_xlat23_;
            u_xlat23_ = max(_e479, 0.000061035156f);
            let _e482 = u_xlat23_;
            u_xlat24_ = inverseSqrt(_e482);
            let _e484 = u_xlat5_;
            let _e486 = u_xlat24_;
            let _e488 = u_xlat5_;
            let _e490 = (vec3(_e486) * _e488.xyz);
            u_xlat5_.x = _e490.x;
            u_xlat5_.y = _e490.y;
            u_xlat5_.z = _e490.z;
            let _e499 = u_xlati22_;
            let _e504 = _v_buffer1_.v_cb1_[(_e499 + 512i)];
            u_xlat24_ = (1f / _e504.x);
            let _e507 = u_xlat23_;
            u_xlat23_ = (_e507 * 25f);
            let _e510 = u_xlat23_;
            let _e511 = u_xlat24_;
            u_xlat23_ = (_e510 / _e511);
            let _e513 = u_xlat23_;
            u_xlat23_ = (_e513 + 1f);
            let _e518 = u_xlat23_;
            u_xlat23_ = (1f / _e518);
            let _e520 = u_xlati22_;
            let _e525 = _v_buffer1_.v_cb1_[(_e520 + 768i)];
            let _e527 = u_xlat5_;
            u_xlat24_ = dot(_e525.xyz, _e527.xyz);
            let _e530 = u_xlat24_;
            let _e531 = u_xlati22_;
            let _e536 = _v_buffer1_.v_cb1_[(_e531 + 512i)];
            let _e539 = u_xlati22_;
            let _e544 = _v_buffer1_.v_cb1_[(_e539 + 512i)];
            u_xlat24_ = ((_e530 * _e536.z) + _e544.w);
            let _e547 = u_xlat24_;
            u_xlat24_ = clamp(_e547, 0f, 1f);
            let _e551 = u_xlat24_;
            let _e552 = u_xlat24_;
            u_xlat24_ = (_e551 * _e552);
            let _e554 = u_xlat23_;
            let _e555 = u_xlat24_;
            u_xlat23_ = (_e554 * _e555);
            let _e557 = u_xlat6_;
            let _e559 = u_xlat23_;
            let _e561 = u_xlati22_;
            let _e566 = _v_buffer1_.v_cb1_[(_e561 + 256i)];
            let _e568 = (vec3(_e559) * _e566.xyz);
            u_xlat6_.x = _e568.x;
            u_xlat6_.y = _e568.y;
            u_xlat6_.z = _e568.z;
            let _e575 = u_xlat1_;
            let _e577 = u_xlat5_;
            u_xlat22_ = dot(_e575.xyz, _e577.xyz);
            let _e580 = u_xlat22_;
            u_xlat22_ = clamp(_e580, 0f, 1f);
            let _e584 = u_xlat4_;
            let _e586 = u_xlat6_;
            let _e588 = u_xlat22_;
            let _e591 = u_xlat4_;
            let _e593 = ((_e586.xyz * vec3(_e588)) + _e591.xyz);
            u_xlat4_.x = _e593.x;
            u_xlat4_.y = _e593.y;
            u_xlat4_.z = _e593.z;
        }
        continuing {
            let _e425 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e425 + 1u);
        }
    }
    let _e600 = vs_TEXCOORD2_;
    let _e602 = u_xlat3_;
    let _e604 = u_xlat4_;
    let _e606 = (_e602.xyz + _e604.xyz);
    vs_TEXCOORD2_.x = _e606.x;
    vs_TEXCOORD2_.y = _e606.y;
    vs_TEXCOORD2_.z = _e606.z;
    let _e613 = u_xlat0_;
    let _e618 = _v_buffer2_.v_cb2_[1];
    u_xlat3_ = (_e613.yyyy * _e618);
    let _e623 = _v_buffer2_.v_cb2_[0];
    let _e624 = u_xlat0_;
    let _e627 = u_xlat3_;
    u_xlat0_ = ((_e623 * _e624.xxxx) + _e627);
    let _e632 = _v_buffer2_.v_cb2_[2];
    let _e633 = in_POSITION0_1;
    let _e636 = u_xlat0_;
    u_xlat0_ = ((_e632 * _e633.zzzz) + _e636);
    let _e638 = u_xlat0_;
    let _e642 = _v_buffer2_.v_cb2_[3];
    u_xlat0_ = (_e638 + _e642);
    let _e644 = u_xlat0_;
    let _e649 = _v_buffer0_.v_cb0_[80];
    u_xlat3_ = (_e644.yyyy * _e649);
    let _e654 = _v_buffer0_.v_cb0_[79];
    let _e655 = u_xlat0_;
    let _e658 = u_xlat3_;
    u_xlat3_ = ((_e654 * _e655.xxxx) + _e658);
    let _e663 = _v_buffer0_.v_cb0_[81];
    let _e664 = u_xlat0_;
    let _e667 = u_xlat3_;
    u_xlat3_ = ((_e663 * _e664.zzzz) + _e667);
    let _e673 = _v_buffer0_.v_cb0_[82];
    let _e674 = u_xlat0_;
    let _e677 = u_xlat3_;
    gl_Position = ((_e673 * _e674.wwww) + _e677);
    let _e679 = vs_TEXCOORD1_;
    let _e681 = u_xlat2_;
    let _e682 = _e681.xyz;
    vs_TEXCOORD1_.x = _e682.x;
    vs_TEXCOORD1_.y = _e682.y;
    vs_TEXCOORD1_.z = _e682.z;
    let _e689 = vs_NORMAL0_;
    let _e691 = u_xlat1_;
    let _e692 = _e691.xyz;
    vs_NORMAL0_.x = _e692.x;
    vs_NORMAL0_.y = _e692.y;
    vs_NORMAL0_.z = _e692.z;
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(5) in_TEXCOORD1_: vec2<f32>, @location(6) in_TEXCOORD2_: vec2<f32>, @location(1) in_NORMAL0_: vec3<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_TEXCOORD1_1 = in_TEXCOORD1_;
    in_TEXCOORD2_1 = in_TEXCOORD2_;
    in_NORMAL0_1 = in_NORMAL0_;
    main_1();
    let _e43 = vs_TEXCOORD0_;
    let _e45 = vs_TEXCOORD1_;
    let _e47 = vs_TEXCOORD2_;
    let _e49 = vs_NORMAL0_;
    let _e51 = gl_Position;
    return VertexOutput(_e43, _e45, _e47, _e49, _e51);
}
