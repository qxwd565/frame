struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 1024>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 14>,
}

struct v_buffer3_ {
    v_cb3_: vec4<f32>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec2<f32>,
    @location(1) vs_TEXCOORD1_: vec3<f32>,
    @location(2) vs_TEXCOORD2_: vec3<f32>,
    @location(5) vs_TEXCOORD5_: vec4<f32>,
    @location(7) vs_TEXCOORD7_: vec3<f32>,
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
var<private> vs_TEXCOORD0_: vec2<f32>;
var<private> vs_TEXCOORD1_: vec3<f32>;
var<private> vs_TEXCOORD2_: vec3<f32>;
var<private> vs_TEXCOORD5_: vec4<f32>;
var<private> vs_TEXCOORD7_: vec3<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec3<f32> = vec3(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec3<f32> = vec3(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlati3_: i32 = 0i;
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlat15_: f32 = 0f;
    var u_xlatu15_: u32 = 0u;
    var u_xlatu16_: u32 = 0u;
    var u_xlat17_: f32 = 0f;
    var u_xlati17_: i32 = 0i;
    var u_xlatu17_: u32 = 0u;
    var u_xlatb17_: bool = false;
    var u_xlat18_: f32 = 0f;
    var u_xlatu_loop_1_: u32 = 0u;
    var local: array<vec4<u32>, 4> = ImmCB_0_;

    let _e68 = u_xlat0_;
    let _e70 = in_POSITION0_1;
    let _e75 = _v_buffer2_.v_cb2_[1];
    let _e77 = (_e70.yyy * _e75.xyz);
    u_xlat0_.x = _e77.x;
    u_xlat0_.y = _e77.y;
    u_xlat0_.z = _e77.z;
    let _e84 = u_xlat0_;
    let _e89 = _v_buffer2_.v_cb2_[0];
    let _e91 = in_POSITION0_1;
    let _e94 = u_xlat0_;
    let _e96 = ((_e89.xyz * _e91.xxx) + _e94.xyz);
    u_xlat0_.x = _e96.x;
    u_xlat0_.y = _e96.y;
    u_xlat0_.z = _e96.z;
    let _e103 = u_xlat0_;
    let _e108 = _v_buffer2_.v_cb2_[2];
    let _e110 = in_POSITION0_1;
    let _e113 = u_xlat0_;
    let _e115 = ((_e108.xyz * _e110.zzz) + _e113.xyz);
    u_xlat0_.x = _e115.x;
    u_xlat0_.y = _e115.y;
    u_xlat0_.z = _e115.z;
    let _e122 = u_xlat0_;
    let _e124 = u_xlat0_;
    let _e129 = _v_buffer2_.v_cb2_[3];
    let _e131 = (_e124.xyz + _e129.xyz);
    u_xlat0_.x = _e131.x;
    u_xlat0_.y = _e131.y;
    u_xlat0_.z = _e131.z;
    let _e138 = u_xlat0_;
    let _e143 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e138.yyyy * _e143);
    let _e148 = _v_buffer0_.v_cb0_[79];
    let _e149 = u_xlat0_;
    let _e152 = u_xlat1_;
    u_xlat1_ = ((_e148 * _e149.xxxx) + _e152);
    let _e157 = _v_buffer0_.v_cb0_[81];
    let _e158 = u_xlat0_;
    let _e161 = u_xlat1_;
    u_xlat1_ = ((_e157 * _e158.zzzz) + _e161);
    let _e164 = u_xlat1_;
    let _e168 = _v_buffer0_.v_cb0_[82];
    gl_Position = (_e164 + _e168);
    let _e171 = in_NORMAL0_1;
    let _e176 = _v_buffer2_.v_cb2_[4];
    u_xlat1_.x = dot(_e171.xyz, _e176.xyz);
    let _e180 = in_NORMAL0_1;
    let _e185 = _v_buffer2_.v_cb2_[5];
    u_xlat1_.y = dot(_e180.xyz, _e185.xyz);
    let _e189 = in_NORMAL0_1;
    let _e194 = _v_buffer2_.v_cb2_[6];
    u_xlat1_.z = dot(_e189.xyz, _e194.xyz);
    let _e197 = u_xlat1_;
    let _e199 = u_xlat1_;
    u_xlat15_ = dot(_e197.xyz, _e199.xyz);
    let _e202 = u_xlat15_;
    u_xlat15_ = max(_e202, 0.000000000000000000000000000000000000011754944f);
    let _e205 = u_xlat15_;
    u_xlat15_ = inverseSqrt(_e205);
    let _e207 = u_xlat1_;
    let _e209 = u_xlat15_;
    let _e211 = u_xlat1_;
    let _e213 = (vec3(_e209) * _e211.xyz);
    u_xlat1_.x = _e213.x;
    u_xlat1_.y = _e213.y;
    u_xlat1_.z = _e213.z;
    let _e220 = vs_TEXCOORD0_;
    let _e222 = in_TEXCOORD0_1;
    let _e224 = _v_buffer3_;
    let _e228 = _v_buffer3_;
    let _e231 = ((_e222.xy * _e224.v_cb3_.xy) + _e228.v_cb3_.zw);
    vs_TEXCOORD0_.x = _e231.x;
    vs_TEXCOORD0_.y = _e231.y;
    let _e236 = u_xlat1_;
    let _e238 = u_xlat1_;
    u_xlat15_ = dot(_e236.xyz, _e238.xyz);
    let _e241 = u_xlat15_;
    u_xlat15_ = inverseSqrt(_e241);
    let _e243 = vs_TEXCOORD2_;
    let _e245 = u_xlat15_;
    let _e247 = u_xlat1_;
    let _e249 = (vec3(_e245) * _e247.xyz);
    vs_TEXCOORD2_.x = _e249.x;
    vs_TEXCOORD2_.y = _e249.y;
    vs_TEXCOORD2_.z = _e249.z;
    let _e259 = _v_buffer0_.v_cb0_[10];
    let _e264 = _v_buffer2_.v_cb2_[11];
    u_xlat15_ = min(_e259.x, _e264.y);
    let _e267 = u_xlat15_;
    u_xlatu15_ = u32(i32(_e267));
    u_xlat2_.x = 0f;
    u_xlat2_.y = 0f;
    u_xlat2_.z = 0f;
    loop {
        let _e281 = u_xlatu_loop_1_;
        let _e282 = u_xlatu15_;
        if !((_e281 < _e282)) {
            break;
        }
        {
            let _e288 = u_xlatu_loop_1_;
            u_xlatu17_ = (_e288 >> 2u);
            let _e291 = u_xlatu_loop_1_;
            u_xlati3_ = i32((_e291 & 3u));
            let _e295 = u_xlatu17_;
            let _e301 = _v_buffer2_.v_cb2_[(i32(_e295) + 12i)];
            let _e302 = u_xlati3_;
            let _e306 = local[_e302];
            u_xlat17_ = dot(_e301, bitcast<vec4<f32>>(_e306));
            let _e309 = u_xlat17_;
            u_xlati17_ = i32(_e309);
            let _e311 = u_xlat3_;
            let _e313 = u_xlat0_;
            let _e316 = u_xlati17_;
            let _e319 = _v_buffer1_.v_cb1_[_e316];
            let _e322 = u_xlati17_;
            let _e325 = _v_buffer1_.v_cb1_[_e322];
            let _e327 = ((-(_e313.xyz) * _e319.www) + _e325.xyz);
            u_xlat3_.x = _e327.x;
            u_xlat3_.y = _e327.y;
            u_xlat3_.z = _e327.z;
            let _e334 = u_xlat3_;
            let _e336 = u_xlat3_;
            u_xlat18_ = dot(_e334.xyz, _e336.xyz);
            let _e339 = u_xlat18_;
            u_xlat18_ = max(_e339, 0.000061035156f);
            let _e343 = u_xlat18_;
            u_xlat4_.x = inverseSqrt(_e343);
            let _e345 = u_xlat3_;
            let _e347 = u_xlat3_;
            let _e349 = u_xlat4_;
            let _e351 = (_e347.xyz * _e349.xxx);
            u_xlat3_.x = _e351.x;
            u_xlat3_.y = _e351.y;
            u_xlat3_.z = _e351.z;
            let _e361 = u_xlat18_;
            u_xlat4_.x = (1f / _e361);
            let _e363 = u_xlat18_;
            let _e364 = u_xlati17_;
            let _e369 = _v_buffer1_.v_cb1_[(_e364 + 512i)];
            u_xlat18_ = (_e363 * _e369.x);
            let _e372 = u_xlat18_;
            let _e374 = u_xlat18_;
            u_xlat18_ = ((-(_e372) * _e374) + 1f);
            let _e378 = u_xlat18_;
            u_xlat18_ = max(_e378, 0f);
            let _e381 = u_xlat18_;
            let _e382 = u_xlat18_;
            u_xlat18_ = (_e381 * _e382);
            let _e384 = u_xlat18_;
            let _e385 = u_xlat4_;
            u_xlat18_ = (_e384 * _e385.x);
            let _e389 = u_xlati17_;
            let _e394 = _v_buffer1_.v_cb1_[(_e389 + 768i)];
            let _e396 = u_xlat3_;
            u_xlat4_.x = dot(_e394.xyz, _e396.xyz);
            let _e400 = u_xlat4_;
            let _e402 = u_xlati17_;
            let _e407 = _v_buffer1_.v_cb1_[(_e402 + 512i)];
            let _e410 = u_xlati17_;
            let _e415 = _v_buffer1_.v_cb1_[(_e410 + 512i)];
            u_xlat4_.x = ((_e400.x * _e407.z) + _e415.w);
            let _e419 = u_xlat4_;
            u_xlat4_.x = clamp(_e419.x, 0f, 1f);
            let _e425 = u_xlat4_;
            let _e427 = u_xlat4_;
            u_xlat4_.x = (_e425.x * _e427.x);
            let _e430 = u_xlat18_;
            let _e431 = u_xlat4_;
            u_xlat18_ = (_e430 * _e431.x);
            let _e434 = u_xlat4_;
            let _e436 = u_xlat18_;
            let _e438 = u_xlati17_;
            let _e443 = _v_buffer1_.v_cb1_[(_e438 + 256i)];
            let _e445 = (vec3(_e436) * _e443.xyz);
            u_xlat4_.x = _e445.x;
            u_xlat4_.y = _e445.y;
            u_xlat4_.z = _e445.z;
            let _e452 = u_xlat1_;
            let _e454 = u_xlat3_;
            u_xlat17_ = dot(_e452.xyz, _e454.xyz);
            let _e457 = u_xlat17_;
            u_xlat17_ = clamp(_e457, 0f, 1f);
            let _e461 = u_xlat2_;
            let _e463 = u_xlat4_;
            let _e465 = u_xlat17_;
            let _e468 = u_xlat2_;
            let _e470 = ((_e463.xyz * vec3(_e465)) + _e468.xyz);
            u_xlat2_.x = _e470.x;
            u_xlat2_.y = _e470.y;
            u_xlat2_.z = _e470.z;
        }
        continuing {
            let _e285 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e285 + 1u);
        }
    }
    let _e477 = vs_TEXCOORD5_;
    let _e479 = u_xlat2_;
    let _e480 = _e479.xyz;
    vs_TEXCOORD5_.y = _e480.x;
    vs_TEXCOORD5_.z = _e480.y;
    vs_TEXCOORD5_.w = _e480.z;
    vs_TEXCOORD5_.x = 0f;
    let _e489 = vs_TEXCOORD1_;
    let _e491 = u_xlat0_;
    let _e492 = _e491.xyz;
    vs_TEXCOORD1_.x = _e492.x;
    vs_TEXCOORD1_.y = _e492.y;
    vs_TEXCOORD1_.z = _e492.z;
    let _e499 = vs_TEXCOORD7_;
    vs_TEXCOORD7_.x = 0f;
    vs_TEXCOORD7_.y = 0f;
    vs_TEXCOORD7_.z = 0f;
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(1) in_NORMAL0_: vec3<f32>, @location(4) in_TEXCOORD0_: vec2<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_NORMAL0_1 = in_NORMAL0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    main_1();
    let _e37 = vs_TEXCOORD0_;
    let _e39 = vs_TEXCOORD1_;
    let _e41 = vs_TEXCOORD2_;
    let _e43 = vs_TEXCOORD5_;
    let _e45 = vs_TEXCOORD7_;
    let _e47 = gl_Position;
    return VertexOutput(_e37, _e39, _e41, _e43, _e45, _e47);
}
