struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 30>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 7>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec2<f32>,
    @location(10) vs_COLOR0_: vec4<f32>,
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
var<private> in_COLOR0_1: vec4<f32>;
var<private> vs_TEXCOORD0_: vec2<f32>;
var<private> vs_COLOR0_: vec4<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlatb0_: bool = false;
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec3<f32> = vec3(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlat5_: vec2<f32> = vec2(0f);
    var u_xlat6_: vec2<f32> = vec2(0f);
    var u_xlat10_: f32 = 0f;
    var u_xlat15_: f32 = 0f;
    var local: f32;

    let _e57 = _v_buffer2_.v_cb2_[6];
    u_xlatb0_ = (0f < _e57.y);
    let _e64 = _v_buffer2_.v_cb2_[6];
    let _e69 = _v_buffer2_.v_cb2_[6];
    u_xlat5_.x = (_e64.y + _e69.x);
    let _e75 = _v_buffer0_.v_cb0_[15];
    let _e80 = _v_buffer2_.v_cb2_[6];
    u_xlat10_ = (_e75.x + _e80.x);
    let _e84 = u_xlatb0_;
    if _e84 {
        let _e85 = u_xlat5_;
        local = _e85.x;
    } else {
        let _e87 = u_xlat10_;
        local = _e87;
    }
    let _e89 = local;
    u_xlat0_.x = _e89;
    let _e91 = u_xlat0_;
    u_xlat0_.x = (_e91.x + -0.0025f);
    let _e97 = u_xlat0_;
    let _e102 = _v_buffer2_.v_cb2_[4];
    u_xlat0_.x = (_e97.x * _e102.z);
    u_xlat0_.y = 0f;
    let _e107 = u_xlat0_;
    let _e110 = textureSampleLevel(v_t0_, samplerv_s0_, _e107.xy, 0f);
    u_xlat0_ = _e110;
    let _e112 = u_xlat0_;
    let _e117 = _v_buffer2_.v_cb2_[4];
    u_xlat5_.x = (_e112.x * _e117.y);
    let _e121 = u_xlat0_;
    let _e126 = _v_buffer2_.v_cb2_[4];
    u_xlat0_.x = (_e121.x * -(_e126.y));
    let _e131 = u_xlat0_;
    u_xlat1_.x = cos(_e131.x);
    let _e135 = u_xlat0_;
    u_xlat0_.x = sin(_e135.x);
    let _e139 = u_xlat5_;
    u_xlat2_.x = sin(_e139.x);
    let _e143 = u_xlat5_;
    u_xlat3_.x = cos(_e143.x);
    let _e147 = u_xlat2_;
    u_xlat4_.z = _e147.x;
    let _e150 = u_xlat3_;
    u_xlat4_.y = _e150.x;
    let _e153 = u_xlat2_;
    u_xlat4_.x = -(_e153.x);
    let _e156 = u_xlat5_;
    let _e158 = in_POSITION0_1;
    let _e163 = _v_buffer2_.v_cb2_[5];
    let _e166 = (_e158.xz + -(_e163.xy));
    u_xlat5_.x = _e166.x;
    u_xlat5_.y = _e166.y;
    let _e172 = u_xlat5_;
    let _e174 = u_xlat4_;
    u_xlat2_.x = dot(_e172.xy, _e174.yz);
    let _e178 = u_xlat5_;
    let _e180 = u_xlat4_;
    u_xlat2_.y = dot(_e178.xy, _e180.xy);
    let _e183 = u_xlat6_;
    let _e185 = u_xlat2_;
    let _e190 = _v_buffer2_.v_cb2_[5];
    let _e192 = (_e185.xy + _e190.xy);
    u_xlat6_.x = _e192.x;
    u_xlat6_.y = _e192.y;
    let _e201 = _v_buffer2_.v_cb2_[4];
    u_xlat2_.x = sin(_e201.x);
    let _e208 = _v_buffer2_.v_cb2_[4];
    u_xlat3_.x = cos(_e208.x);
    let _e212 = u_xlat2_;
    u_xlat4_.z = _e212.x;
    let _e215 = u_xlat3_;
    u_xlat4_.y = _e215.x;
    let _e218 = u_xlat2_;
    u_xlat4_.x = -(_e218.x);
    let _e222 = u_xlat5_;
    let _e224 = u_xlat4_;
    u_xlat2_.y = dot(_e222.xy, _e224.xy);
    let _e228 = u_xlat5_;
    let _e230 = u_xlat4_;
    u_xlat2_.x = dot(_e228.xy, _e230.yz);
    let _e233 = u_xlat5_;
    let _e235 = u_xlat2_;
    let _e240 = _v_buffer2_.v_cb2_[5];
    let _e242 = (_e235.xy + _e240.xy);
    u_xlat5_.x = _e242.x;
    u_xlat5_.y = _e242.y;
    let _e247 = u_xlat6_;
    let _e249 = u_xlat5_;
    let _e252 = u_xlat6_;
    let _e254 = (-(_e249.xy) + _e252.xy);
    u_xlat6_.x = _e254.x;
    u_xlat6_.y = _e254.y;
    let _e259 = in_COLOR0_1;
    let _e263 = _v_buffer2_.v_cb2_[2];
    u_xlat15_ = dot(_e259, _e263);
    let _e265 = u_xlat5_;
    let _e267 = u_xlat15_;
    let _e269 = u_xlat6_;
    let _e272 = u_xlat5_;
    let _e274 = ((vec2(_e267) * _e269.xy) + _e272.xy);
    u_xlat5_.x = _e274.x;
    u_xlat5_.y = _e274.y;
    let _e279 = u_xlat5_;
    let _e281 = u_xlat5_;
    let _e286 = _v_buffer2_.v_cb2_[5];
    let _e289 = (_e281.xy + -(_e286.xy));
    u_xlat5_.x = _e289.x;
    u_xlat5_.y = _e289.y;
    let _e295 = u_xlat0_;
    u_xlat2_.z = _e295.x;
    let _e298 = u_xlat1_;
    u_xlat2_.y = _e298.x;
    let _e301 = u_xlat0_;
    u_xlat2_.x = -(_e301.x);
    let _e305 = u_xlat5_;
    let _e307 = u_xlat2_;
    u_xlat1_.y = dot(_e305.xy, _e307.xy);
    let _e311 = u_xlat5_;
    let _e313 = u_xlat2_;
    u_xlat1_.x = dot(_e311.xy, _e313.yz);
    let _e316 = u_xlat0_;
    let _e318 = u_xlat1_;
    let _e323 = _v_buffer2_.v_cb2_[5];
    let _e325 = (_e318.xy + _e323.xy);
    u_xlat0_.x = _e325.x;
    u_xlat0_.w = _e325.y;
    let _e334 = _v_buffer2_.v_cb2_[4];
    u_xlat1_.x = sin(-(_e334.x));
    let _e342 = _v_buffer2_.v_cb2_[4];
    u_xlat2_.x = cos(-(_e342.x));
    let _e347 = u_xlat1_;
    u_xlat3_.z = _e347.x;
    let _e350 = u_xlat2_;
    u_xlat3_.y = _e350.x;
    let _e353 = u_xlat1_;
    u_xlat3_.x = -(_e353.x);
    let _e357 = u_xlat5_;
    let _e359 = u_xlat3_;
    u_xlat1_.y = dot(_e357.xy, _e359.xy);
    let _e363 = u_xlat5_;
    let _e365 = u_xlat3_;
    u_xlat1_.x = dot(_e363.xy, _e365.yz);
    let _e368 = u_xlat5_;
    let _e370 = u_xlat1_;
    let _e375 = _v_buffer2_.v_cb2_[5];
    let _e377 = (_e370.xy + _e375.xy);
    u_xlat5_.x = _e377.x;
    u_xlat5_.y = _e377.y;
    let _e382 = u_xlat0_;
    let _e384 = u_xlat5_;
    let _e387 = u_xlat0_;
    let _e389 = (-(_e384.xy) + _e387.xw);
    u_xlat0_.x = _e389.x;
    u_xlat0_.w = _e389.y;
    let _e395 = in_COLOR0_1;
    let _e399 = _v_buffer2_.v_cb2_[3];
    u_xlat1_.x = dot(_e395, _e399);
    let _e401 = u_xlat0_;
    let _e403 = u_xlat1_;
    let _e405 = u_xlat0_;
    let _e408 = u_xlat5_;
    let _e410 = ((_e403.xx * _e405.xw) + _e408.xy);
    u_xlat0_.x = _e410.x;
    u_xlat0_.y = _e410.y;
    let _e415 = in_POSITION0_1;
    let _e420 = _v_buffer1_.v_cb1_[1];
    u_xlat1_ = (_e415.yyyy * _e420);
    let _e425 = _v_buffer1_.v_cb1_[0];
    let _e426 = u_xlat0_;
    let _e429 = u_xlat1_;
    u_xlat1_ = ((_e425 * _e426.xxxx) + _e429);
    let _e434 = _v_buffer1_.v_cb1_[2];
    let _e435 = u_xlat0_;
    let _e438 = u_xlat1_;
    u_xlat0_ = ((_e434 * _e435.yyyy) + _e438);
    let _e440 = u_xlat0_;
    let _e444 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e440 + _e444);
    let _e446 = u_xlat0_;
    let _e451 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e446.yyyy * _e451);
    let _e456 = _v_buffer0_.v_cb0_[79];
    let _e457 = u_xlat0_;
    let _e460 = u_xlat1_;
    u_xlat1_ = ((_e456 * _e457.xxxx) + _e460);
    let _e465 = _v_buffer0_.v_cb0_[81];
    let _e466 = u_xlat0_;
    let _e469 = u_xlat1_;
    u_xlat1_ = ((_e465 * _e466.zzzz) + _e469);
    let _e475 = _v_buffer0_.v_cb0_[82];
    let _e476 = u_xlat0_;
    let _e479 = u_xlat1_;
    gl_Position = ((_e475 * _e476.wwww) + _e479);
    let _e481 = vs_TEXCOORD0_;
    let _e483 = in_TEXCOORD0_1;
    let _e488 = _v_buffer2_.v_cb2_[0];
    let _e494 = _v_buffer2_.v_cb2_[0];
    let _e496 = ((_e483.xy * _e488.xy) + _e494.zw);
    vs_TEXCOORD0_.x = _e496.x;
    vs_TEXCOORD0_.y = _e496.y;
    let _e505 = _v_buffer1_.v_cb1_[27];
    u_xlat0_.x = abs(_e505.w);
    let _e512 = _v_buffer1_.v_cb1_[28];
    u_xlat0_.y = abs(_e512.w);
    let _e519 = _v_buffer1_.v_cb1_[29];
    u_xlat0_.z = abs(_e519.w);
    let _e522 = u_xlat0_;
    let _e524 = u_xlat0_;
    let _e526 = log2(_e524.xyz);
    u_xlat0_.x = _e526.x;
    u_xlat0_.y = _e526.y;
    u_xlat0_.z = _e526.z;
    let _e533 = u_xlat0_;
    let _e535 = u_xlat0_;
    let _e541 = (_e535.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat0_.x = _e541.x;
    u_xlat0_.y = _e541.y;
    u_xlat0_.z = _e541.z;
    let _e548 = u_xlat0_;
    let _e550 = u_xlat0_;
    let _e552 = exp2(_e550.xyz);
    u_xlat0_.x = _e552.x;
    u_xlat0_.y = _e552.y;
    u_xlat0_.z = _e552.z;
    let _e559 = u_xlat0_;
    let _e561 = u_xlat0_;
    let _e575 = ((_e561.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat0_.x = _e575.x;
    u_xlat0_.y = _e575.y;
    u_xlat0_.z = _e575.z;
    let _e582 = u_xlat0_;
    let _e584 = u_xlat0_;
    let _e590 = clamp(_e584.xyz, vec3(0f), vec3(1f));
    u_xlat0_.x = _e590.x;
    u_xlat0_.y = _e590.y;
    u_xlat0_.z = _e590.z;
    let _e597 = u_xlat0_;
    let _e599 = u_xlat0_;
    let _e604 = _v_buffer0_.v_cb0_[6];
    let _e606 = (_e599.xyz + _e604.xyz);
    u_xlat0_.x = _e606.x;
    u_xlat0_.y = _e606.y;
    u_xlat0_.z = _e606.z;
    let _e613 = u_xlat0_;
    let _e615 = u_xlat0_;
    let _e624 = (_e615.xyz + vec3<f32>(-1f, -1f, -1f));
    u_xlat0_.x = _e624.x;
    u_xlat0_.y = _e624.y;
    u_xlat0_.z = _e624.z;
    u_xlat0_.w = 0f;
    let _e636 = _v_buffer2_.v_cb2_[1];
    let _e638 = u_xlat0_;
    vs_COLOR0_ = ((_e636.xxxx * _e638) + vec4<f32>(1f, 1f, 1f, 1f));
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(3) in_COLOR0_: vec4<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_COLOR0_1 = in_COLOR0_;
    main_1();
    let _e30 = vs_TEXCOORD0_;
    let _e32 = vs_COLOR0_;
    let _e34 = gl_Position;
    return VertexOutput(_e30, _e32, _e34);
}
