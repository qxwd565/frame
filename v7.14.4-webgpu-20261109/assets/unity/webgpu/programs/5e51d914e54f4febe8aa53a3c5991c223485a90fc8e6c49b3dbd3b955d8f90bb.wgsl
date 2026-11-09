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
    @location(0) vs_TEXCOORD0_: vec2<f32>,
    @location(1) vs_TEXCOORD1_: vec3<f32>,
    @location(2) vs_TEXCOORD2_: vec3<f32>,
    @location(4) vs_TEXCOORD4_: vec4<f32>,
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
var<private> vs_TEXCOORD4_: vec4<f32>;
var<private> vs_NORMAL0_: vec3<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec3<f32> = vec3(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec3<f32> = vec3(0f);
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

    let _e75 = u_xlat0_;
    let _e77 = in_POSITION0_1;
    let _e82 = _v_buffer2_.v_cb2_[1];
    let _e84 = (_e77.yyy * _e82.xyz);
    u_xlat0_.x = _e84.x;
    u_xlat0_.y = _e84.y;
    u_xlat0_.z = _e84.z;
    let _e91 = u_xlat0_;
    let _e96 = _v_buffer2_.v_cb2_[0];
    let _e98 = in_POSITION0_1;
    let _e101 = u_xlat0_;
    let _e103 = ((_e96.xyz * _e98.xxx) + _e101.xyz);
    u_xlat0_.x = _e103.x;
    u_xlat0_.y = _e103.y;
    u_xlat0_.z = _e103.z;
    let _e110 = u_xlat0_;
    let _e115 = _v_buffer2_.v_cb2_[2];
    let _e117 = in_POSITION0_1;
    let _e120 = u_xlat0_;
    let _e122 = ((_e115.xyz * _e117.zzz) + _e120.xyz);
    u_xlat0_.x = _e122.x;
    u_xlat0_.y = _e122.y;
    u_xlat0_.z = _e122.z;
    let _e129 = u_xlat0_;
    let _e131 = u_xlat0_;
    let _e136 = _v_buffer2_.v_cb2_[3];
    let _e138 = (_e131.xyz + _e136.xyz);
    u_xlat0_.x = _e138.x;
    u_xlat0_.y = _e138.y;
    u_xlat0_.z = _e138.z;
    let _e145 = u_xlat0_;
    let _e150 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e145.yyyy * _e150);
    let _e155 = _v_buffer0_.v_cb0_[79];
    let _e156 = u_xlat0_;
    let _e159 = u_xlat1_;
    u_xlat1_ = ((_e155 * _e156.xxxx) + _e159);
    let _e164 = _v_buffer0_.v_cb0_[81];
    let _e165 = u_xlat0_;
    let _e168 = u_xlat1_;
    u_xlat1_ = ((_e164 * _e165.zzzz) + _e168);
    let _e171 = u_xlat1_;
    let _e175 = _v_buffer0_.v_cb0_[82];
    gl_Position = (_e171 + _e175);
    let _e177 = vs_TEXCOORD0_;
    let _e179 = in_TEXCOORD0_1;
    let _e181 = _v_buffer3_;
    let _e185 = _v_buffer3_;
    let _e188 = ((_e179.xy * _e181.v_cb3_.xy) + _e185.v_cb3_.zw);
    vs_TEXCOORD0_.x = _e188.x;
    vs_TEXCOORD0_.y = _e188.y;
    let _e194 = in_NORMAL0_1;
    let _e199 = _v_buffer2_.v_cb2_[4];
    u_xlat1_.x = dot(_e194.xyz, _e199.xyz);
    let _e203 = in_NORMAL0_1;
    let _e208 = _v_buffer2_.v_cb2_[5];
    u_xlat1_.y = dot(_e203.xyz, _e208.xyz);
    let _e212 = in_NORMAL0_1;
    let _e217 = _v_buffer2_.v_cb2_[6];
    u_xlat1_.z = dot(_e212.xyz, _e217.xyz);
    let _e220 = u_xlat1_;
    let _e222 = u_xlat1_;
    u_xlat18_ = dot(_e220.xyz, _e222.xyz);
    let _e225 = u_xlat18_;
    u_xlat18_ = max(_e225, 0.000000000000000000000000000000000000011754944f);
    let _e228 = u_xlat18_;
    u_xlat18_ = inverseSqrt(_e228);
    let _e230 = u_xlat1_;
    let _e232 = u_xlat18_;
    let _e234 = u_xlat1_;
    let _e236 = (vec3(_e232) * _e234.xyz);
    u_xlat1_.x = _e236.x;
    u_xlat1_.y = _e236.y;
    u_xlat1_.z = _e236.z;
    let _e247 = _v_buffer2_.v_cb2_[27];
    u_xlat2_.x = abs(_e247.w);
    let _e254 = _v_buffer2_.v_cb2_[28];
    u_xlat2_.y = abs(_e254.w);
    let _e261 = _v_buffer2_.v_cb2_[29];
    u_xlat2_.z = abs(_e261.w);
    let _e264 = u_xlat2_;
    let _e266 = u_xlat2_;
    let _e268 = log2(_e266.xyz);
    u_xlat2_.x = _e268.x;
    u_xlat2_.y = _e268.y;
    u_xlat2_.z = _e268.z;
    let _e275 = u_xlat2_;
    let _e277 = u_xlat2_;
    let _e283 = (_e277.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat2_.x = _e283.x;
    u_xlat2_.y = _e283.y;
    u_xlat2_.z = _e283.z;
    let _e290 = u_xlat2_;
    let _e292 = u_xlat2_;
    let _e294 = exp2(_e292.xyz);
    u_xlat2_.x = _e294.x;
    u_xlat2_.y = _e294.y;
    u_xlat2_.z = _e294.z;
    let _e301 = u_xlat2_;
    let _e303 = u_xlat2_;
    let _e317 = ((_e303.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat2_.x = _e317.x;
    u_xlat2_.y = _e317.y;
    u_xlat2_.z = _e317.z;
    let _e324 = u_xlat2_;
    let _e326 = u_xlat2_;
    let _e332 = clamp(_e326.xyz, vec3(0f), vec3(1f));
    u_xlat2_.x = _e332.x;
    u_xlat2_.y = _e332.y;
    u_xlat2_.z = _e332.z;
    let _e342 = _v_buffer0_.v_cb0_[10];
    let _e347 = _v_buffer2_.v_cb2_[11];
    u_xlat18_ = min(_e342.x, _e347.y);
    let _e350 = u_xlat18_;
    u_xlatu18_ = u32(i32(_e350));
    u_xlat3_.x = 0f;
    u_xlat3_.y = 0f;
    u_xlat3_.z = 0f;
    loop {
        let _e364 = u_xlatu_loop_1_;
        let _e365 = u_xlatu18_;
        if !((_e364 < _e365)) {
            break;
        }
        {
            let _e371 = u_xlatu_loop_1_;
            u_xlatu20_ = (_e371 >> 2u);
            let _e374 = u_xlatu_loop_1_;
            u_xlati21_ = i32((_e374 & 3u));
            let _e378 = u_xlatu20_;
            let _e384 = _v_buffer2_.v_cb2_[(i32(_e378) + 12i)];
            let _e385 = u_xlati21_;
            let _e389 = local[_e385];
            u_xlat20_ = dot(_e384, bitcast<vec4<f32>>(_e389));
            let _e392 = u_xlat20_;
            u_xlati20_ = i32(_e392);
            let _e394 = u_xlat4_;
            let _e396 = u_xlat0_;
            let _e399 = u_xlati20_;
            let _e402 = _v_buffer1_.v_cb1_[_e399];
            let _e405 = u_xlati20_;
            let _e408 = _v_buffer1_.v_cb1_[_e405];
            let _e410 = ((-(_e396.xyz) * _e402.www) + _e408.xyz);
            u_xlat4_.x = _e410.x;
            u_xlat4_.y = _e410.y;
            u_xlat4_.z = _e410.z;
            let _e417 = u_xlat4_;
            let _e419 = u_xlat4_;
            u_xlat21_ = dot(_e417.xyz, _e419.xyz);
            let _e422 = u_xlat21_;
            u_xlat21_ = max(_e422, 0.000061035156f);
            let _e425 = u_xlat21_;
            u_xlat22_ = inverseSqrt(_e425);
            let _e427 = u_xlat4_;
            let _e429 = u_xlat22_;
            let _e431 = u_xlat4_;
            let _e433 = (vec3(_e429) * _e431.xyz);
            u_xlat4_.x = _e433.x;
            u_xlat4_.y = _e433.y;
            u_xlat4_.z = _e433.z;
            let _e442 = u_xlati20_;
            let _e447 = _v_buffer1_.v_cb1_[(_e442 + 512i)];
            u_xlat22_ = (1f / _e447.x);
            let _e450 = u_xlat21_;
            u_xlat21_ = (_e450 * 25f);
            let _e453 = u_xlat21_;
            let _e454 = u_xlat22_;
            u_xlat21_ = (_e453 / _e454);
            let _e456 = u_xlat21_;
            u_xlat21_ = (_e456 + 1f);
            let _e461 = u_xlat21_;
            u_xlat21_ = (1f / _e461);
            let _e463 = u_xlati20_;
            let _e468 = _v_buffer1_.v_cb1_[(_e463 + 768i)];
            let _e470 = u_xlat4_;
            u_xlat22_ = dot(_e468.xyz, _e470.xyz);
            let _e473 = u_xlat22_;
            let _e474 = u_xlati20_;
            let _e479 = _v_buffer1_.v_cb1_[(_e474 + 512i)];
            let _e482 = u_xlati20_;
            let _e487 = _v_buffer1_.v_cb1_[(_e482 + 512i)];
            u_xlat22_ = ((_e473 * _e479.z) + _e487.w);
            let _e490 = u_xlat22_;
            u_xlat22_ = clamp(_e490, 0f, 1f);
            let _e494 = u_xlat22_;
            let _e495 = u_xlat22_;
            u_xlat22_ = (_e494 * _e495);
            let _e497 = u_xlat21_;
            let _e498 = u_xlat22_;
            u_xlat21_ = (_e497 * _e498);
            let _e500 = u_xlat5_;
            let _e502 = u_xlat21_;
            let _e504 = u_xlati20_;
            let _e509 = _v_buffer1_.v_cb1_[(_e504 + 256i)];
            let _e511 = (vec3(_e502) * _e509.xyz);
            u_xlat5_.x = _e511.x;
            u_xlat5_.y = _e511.y;
            u_xlat5_.z = _e511.z;
            let _e518 = u_xlat1_;
            let _e520 = u_xlat4_;
            u_xlat20_ = dot(_e518.xyz, _e520.xyz);
            let _e523 = u_xlat20_;
            u_xlat20_ = clamp(_e523, 0f, 1f);
            let _e527 = u_xlat3_;
            let _e529 = u_xlat5_;
            let _e531 = u_xlat20_;
            let _e534 = u_xlat3_;
            let _e536 = ((_e529.xyz * vec3(_e531)) + _e534.xyz);
            u_xlat3_.x = _e536.x;
            u_xlat3_.y = _e536.y;
            u_xlat3_.z = _e536.z;
        }
        continuing {
            let _e368 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e368 + 1u);
        }
    }
    let _e543 = vs_TEXCOORD2_;
    let _e545 = u_xlat2_;
    let _e547 = u_xlat3_;
    let _e549 = (_e545.xyz + _e547.xyz);
    vs_TEXCOORD2_.x = _e549.x;
    vs_TEXCOORD2_.y = _e549.y;
    vs_TEXCOORD2_.z = _e549.z;
    let _e556 = in_POSITION0_1;
    vs_TEXCOORD4_ = _e556;
    let _e557 = vs_TEXCOORD1_;
    let _e559 = u_xlat0_;
    let _e560 = _e559.xyz;
    vs_TEXCOORD1_.x = _e560.x;
    vs_TEXCOORD1_.y = _e560.y;
    vs_TEXCOORD1_.z = _e560.z;
    let _e567 = vs_NORMAL0_;
    let _e569 = u_xlat1_;
    let _e570 = _e569.xyz;
    vs_NORMAL0_.x = _e570.x;
    vs_NORMAL0_.y = _e570.y;
    vs_NORMAL0_.z = _e570.z;
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(1) in_NORMAL0_: vec3<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_NORMAL0_1 = in_NORMAL0_;
    main_1();
    let _e37 = vs_TEXCOORD0_;
    let _e39 = vs_TEXCOORD1_;
    let _e41 = vs_TEXCOORD2_;
    let _e43 = vs_TEXCOORD4_;
    let _e45 = vs_NORMAL0_;
    let _e47 = gl_Position;
    return VertexOutput(_e37, _e39, _e41, _e43, _e45, _e47);
}
