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
    @location(5) vs_TEXCOORD5_: vec2<f32>,
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
var<private> vs_TEXCOORD5_: vec2<f32>;
var<private> vs_TEXCOORD1_: vec3<f32>;
var<private> vs_TEXCOORD2_: vec3<f32>;
var<private> vs_NORMAL0_: vec3<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec3<f32> = vec3(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlat5_: vec3<f32> = vec3(0f);
    var u_xlat8_: vec3<f32> = vec3(0f);
    var u_xlat18_: f32 = 0f;
    var u_xlatu18_: u32 = 0u;
    var u_xlat19_: f32 = 0f;
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

    let _e82 = in_POSITION0_1;
    let _e87 = _v_buffer2_.v_cb2_[1];
    u_xlat0_ = (_e82.yyyy * _e87);
    let _e92 = _v_buffer2_.v_cb2_[0];
    let _e93 = in_POSITION0_1;
    let _e96 = u_xlat0_;
    u_xlat0_ = ((_e92 * _e93.xxxx) + _e96);
    let _e101 = _v_buffer2_.v_cb2_[2];
    let _e102 = in_POSITION0_1;
    let _e105 = u_xlat0_;
    u_xlat0_ = ((_e101 * _e102.zzzz) + _e105);
    let _e107 = u_xlat0_;
    let _e111 = _v_buffer2_.v_cb2_[3];
    u_xlat0_ = (_e107 + _e111);
    let _e113 = u_xlat0_;
    let _e118 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e113.yyyy * _e118);
    let _e123 = _v_buffer0_.v_cb0_[79];
    let _e124 = u_xlat0_;
    let _e127 = u_xlat1_;
    u_xlat1_ = ((_e123 * _e124.xxxx) + _e127);
    let _e132 = _v_buffer0_.v_cb0_[81];
    let _e133 = u_xlat0_;
    let _e136 = u_xlat1_;
    u_xlat1_ = ((_e132 * _e133.zzzz) + _e136);
    let _e142 = _v_buffer0_.v_cb0_[82];
    let _e143 = u_xlat0_;
    let _e146 = u_xlat1_;
    gl_Position = ((_e142 * _e143.wwww) + _e146);
    let _e149 = in_NORMAL0_1;
    let _e154 = _v_buffer2_.v_cb2_[4];
    u_xlat1_.x = dot(_e149.xyz, _e154.xyz);
    let _e158 = in_NORMAL0_1;
    let _e163 = _v_buffer2_.v_cb2_[5];
    u_xlat1_.y = dot(_e158.xyz, _e163.xyz);
    let _e167 = in_NORMAL0_1;
    let _e172 = _v_buffer2_.v_cb2_[6];
    u_xlat1_.z = dot(_e167.xyz, _e172.xyz);
    let _e175 = u_xlat1_;
    let _e177 = u_xlat1_;
    u_xlat18_ = dot(_e175.xyz, _e177.xyz);
    let _e180 = u_xlat18_;
    u_xlat19_ = inverseSqrt(_e180);
    let _e182 = u_xlat2_;
    let _e184 = u_xlat19_;
    let _e186 = u_xlat1_;
    let _e188 = (vec3(_e184) * _e186.xyz);
    u_xlat2_.x = _e188.x;
    u_xlat2_.y = _e188.y;
    u_xlat2_.z = _e188.z;
    let _e195 = u_xlat8_;
    let _e197 = u_xlat2_;
    let _e202 = _v_buffer0_.v_cb0_[68];
    let _e204 = (_e197.yy * _e202.xy);
    u_xlat8_.x = _e204.x;
    u_xlat8_.z = _e204.y;
    let _e209 = u_xlat2_;
    let _e214 = _v_buffer0_.v_cb0_[67];
    let _e216 = u_xlat2_;
    let _e219 = u_xlat8_;
    let _e221 = ((_e214.xy * _e216.xx) + _e219.xz);
    u_xlat2_.x = _e221.x;
    u_xlat2_.y = _e221.y;
    let _e226 = u_xlat2_;
    let _e231 = _v_buffer0_.v_cb0_[69];
    let _e233 = u_xlat2_;
    let _e236 = u_xlat2_;
    let _e238 = ((_e231.xy * _e233.zz) + _e236.xy);
    u_xlat2_.x = _e238.x;
    u_xlat2_.y = _e238.y;
    let _e243 = vs_TEXCOORD5_;
    let _e245 = u_xlat2_;
    let _e254 = ((_e245.xy * vec2<f32>(0.499f, 0.499f)) + vec2<f32>(0.5f, 0.5f));
    vs_TEXCOORD5_.x = _e254.x;
    vs_TEXCOORD5_.y = _e254.y;
    let _e259 = vs_TEXCOORD0_;
    let _e261 = in_TEXCOORD0_1;
    let _e263 = _v_buffer3_;
    let _e267 = _v_buffer3_;
    let _e270 = ((_e261.xy * _e263.v_cb3_.xy) + _e267.v_cb3_.zw);
    vs_TEXCOORD0_.x = _e270.x;
    vs_TEXCOORD0_.y = _e270.y;
    let _e275 = u_xlat18_;
    u_xlat18_ = max(_e275, 0.000000000000000000000000000000000000011754944f);
    let _e278 = u_xlat18_;
    u_xlat18_ = inverseSqrt(_e278);
    let _e280 = u_xlat1_;
    let _e282 = u_xlat18_;
    let _e284 = u_xlat1_;
    let _e286 = (vec3(_e282) * _e284.xyz);
    u_xlat1_.x = _e286.x;
    u_xlat1_.y = _e286.y;
    u_xlat1_.z = _e286.z;
    let _e297 = _v_buffer2_.v_cb2_[27];
    u_xlat2_.x = abs(_e297.w);
    let _e304 = _v_buffer2_.v_cb2_[28];
    u_xlat2_.y = abs(_e304.w);
    let _e311 = _v_buffer2_.v_cb2_[29];
    u_xlat2_.z = abs(_e311.w);
    let _e314 = u_xlat2_;
    let _e316 = u_xlat2_;
    let _e318 = log2(_e316.xyz);
    u_xlat2_.x = _e318.x;
    u_xlat2_.y = _e318.y;
    u_xlat2_.z = _e318.z;
    let _e325 = u_xlat2_;
    let _e327 = u_xlat2_;
    let _e333 = (_e327.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat2_.x = _e333.x;
    u_xlat2_.y = _e333.y;
    u_xlat2_.z = _e333.z;
    let _e340 = u_xlat2_;
    let _e342 = u_xlat2_;
    let _e344 = exp2(_e342.xyz);
    u_xlat2_.x = _e344.x;
    u_xlat2_.y = _e344.y;
    u_xlat2_.z = _e344.z;
    let _e351 = u_xlat2_;
    let _e353 = u_xlat2_;
    let _e367 = ((_e353.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat2_.x = _e367.x;
    u_xlat2_.y = _e367.y;
    u_xlat2_.z = _e367.z;
    let _e374 = u_xlat2_;
    let _e376 = u_xlat2_;
    let _e382 = clamp(_e376.xyz, vec3(0f), vec3(1f));
    u_xlat2_.x = _e382.x;
    u_xlat2_.y = _e382.y;
    u_xlat2_.z = _e382.z;
    let _e392 = _v_buffer0_.v_cb0_[10];
    let _e397 = _v_buffer2_.v_cb2_[11];
    u_xlat18_ = min(_e392.x, _e397.y);
    let _e400 = u_xlat18_;
    u_xlatu18_ = u32(i32(_e400));
    u_xlat3_.x = 0f;
    u_xlat3_.y = 0f;
    u_xlat3_.z = 0f;
    loop {
        let _e414 = u_xlatu_loop_1_;
        let _e415 = u_xlatu18_;
        if !((_e414 < _e415)) {
            break;
        }
        {
            let _e421 = u_xlatu_loop_1_;
            u_xlatu20_ = (_e421 >> 2u);
            let _e424 = u_xlatu_loop_1_;
            u_xlati21_ = i32((_e424 & 3u));
            let _e428 = u_xlatu20_;
            let _e434 = _v_buffer2_.v_cb2_[(i32(_e428) + 12i)];
            let _e435 = u_xlati21_;
            let _e439 = local[_e435];
            u_xlat20_ = dot(_e434, bitcast<vec4<f32>>(_e439));
            let _e442 = u_xlat20_;
            u_xlati20_ = i32(_e442);
            let _e444 = u_xlat4_;
            let _e446 = u_xlat0_;
            let _e449 = u_xlati20_;
            let _e452 = _v_buffer1_.v_cb1_[_e449];
            let _e455 = u_xlati20_;
            let _e458 = _v_buffer1_.v_cb1_[_e455];
            let _e460 = ((-(_e446.xyz) * _e452.www) + _e458.xyz);
            u_xlat4_.x = _e460.x;
            u_xlat4_.y = _e460.y;
            u_xlat4_.z = _e460.z;
            let _e467 = u_xlat4_;
            let _e469 = u_xlat4_;
            u_xlat21_ = dot(_e467.xyz, _e469.xyz);
            let _e472 = u_xlat21_;
            u_xlat21_ = max(_e472, 0.000061035156f);
            let _e475 = u_xlat21_;
            u_xlat22_ = inverseSqrt(_e475);
            let _e477 = u_xlat4_;
            let _e479 = u_xlat22_;
            let _e481 = u_xlat4_;
            let _e483 = (vec3(_e479) * _e481.xyz);
            u_xlat4_.x = _e483.x;
            u_xlat4_.y = _e483.y;
            u_xlat4_.z = _e483.z;
            let _e492 = u_xlati20_;
            let _e497 = _v_buffer1_.v_cb1_[(_e492 + 512i)];
            u_xlat22_ = (1f / _e497.x);
            let _e500 = u_xlat21_;
            u_xlat21_ = (_e500 * 25f);
            let _e503 = u_xlat21_;
            let _e504 = u_xlat22_;
            u_xlat21_ = (_e503 / _e504);
            let _e506 = u_xlat21_;
            u_xlat21_ = (_e506 + 1f);
            let _e511 = u_xlat21_;
            u_xlat21_ = (1f / _e511);
            let _e513 = u_xlati20_;
            let _e518 = _v_buffer1_.v_cb1_[(_e513 + 768i)];
            let _e520 = u_xlat4_;
            u_xlat22_ = dot(_e518.xyz, _e520.xyz);
            let _e523 = u_xlat22_;
            let _e524 = u_xlati20_;
            let _e529 = _v_buffer1_.v_cb1_[(_e524 + 512i)];
            let _e532 = u_xlati20_;
            let _e537 = _v_buffer1_.v_cb1_[(_e532 + 512i)];
            u_xlat22_ = ((_e523 * _e529.z) + _e537.w);
            let _e540 = u_xlat22_;
            u_xlat22_ = clamp(_e540, 0f, 1f);
            let _e544 = u_xlat22_;
            let _e545 = u_xlat22_;
            u_xlat22_ = (_e544 * _e545);
            let _e547 = u_xlat21_;
            let _e548 = u_xlat22_;
            u_xlat21_ = (_e547 * _e548);
            let _e550 = u_xlat5_;
            let _e552 = u_xlat21_;
            let _e554 = u_xlati20_;
            let _e559 = _v_buffer1_.v_cb1_[(_e554 + 256i)];
            let _e561 = (vec3(_e552) * _e559.xyz);
            u_xlat5_.x = _e561.x;
            u_xlat5_.y = _e561.y;
            u_xlat5_.z = _e561.z;
            let _e568 = u_xlat1_;
            let _e570 = u_xlat4_;
            u_xlat20_ = dot(_e568.xyz, _e570.xyz);
            let _e573 = u_xlat20_;
            u_xlat20_ = clamp(_e573, 0f, 1f);
            let _e577 = u_xlat3_;
            let _e579 = u_xlat5_;
            let _e581 = u_xlat20_;
            let _e584 = u_xlat3_;
            let _e586 = ((_e579.xyz * vec3(_e581)) + _e584.xyz);
            u_xlat3_.x = _e586.x;
            u_xlat3_.y = _e586.y;
            u_xlat3_.z = _e586.z;
        }
        continuing {
            let _e418 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e418 + 1u);
        }
    }
    let _e593 = vs_TEXCOORD2_;
    let _e595 = u_xlat2_;
    let _e597 = u_xlat3_;
    let _e599 = (_e595.xyz + _e597.xyz);
    vs_TEXCOORD2_.x = _e599.x;
    vs_TEXCOORD2_.y = _e599.y;
    vs_TEXCOORD2_.z = _e599.z;
    let _e606 = vs_TEXCOORD1_;
    let _e608 = u_xlat0_;
    let _e609 = _e608.xyz;
    vs_TEXCOORD1_.x = _e609.x;
    vs_TEXCOORD1_.y = _e609.y;
    vs_TEXCOORD1_.z = _e609.z;
    let _e616 = vs_NORMAL0_;
    let _e618 = u_xlat1_;
    let _e619 = _e618.xyz;
    vs_NORMAL0_.x = _e619.x;
    vs_NORMAL0_.y = _e619.y;
    vs_NORMAL0_.z = _e619.z;
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(1) in_NORMAL0_: vec3<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_NORMAL0_1 = in_NORMAL0_;
    main_1();
    let _e37 = vs_TEXCOORD0_;
    let _e39 = vs_TEXCOORD5_;
    let _e41 = vs_TEXCOORD1_;
    let _e43 = vs_TEXCOORD2_;
    let _e45 = vs_NORMAL0_;
    let _e47 = gl_Position;
    return VertexOutput(_e37, _e39, _e41, _e43, _e45, _e47);
}
