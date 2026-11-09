struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 30>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 5>,
}

struct VertexOutput {
    @location(10) vs_COLOR0_: vec4<f32>,
    @location(0) vs_TEXCOORD0_: vec4<f32>,
    @location(1) vs_TEXCOORD1_: vec4<f32>,
    @location(2) vs_TEXCOORD2_: vec4<f32>,
    @location(3) vs_TEXCOORD3_: vec4<f32>,
    @builtin(position) gl_Position: vec4<f32>,
}

@group(0) @binding(0) 
var<uniform> _v_buffer0_: v_buffer0_;
@group(0) @binding(1) 
var<uniform> _v_buffer1_: v_buffer1_;
@group(0) @binding(2) 
var<uniform> _v_buffer2_: v_buffer2_;
var<private> in_POSITION0_1: vec4<f32>;
var<private> in_TEXCOORD0_1: vec2<f32>;
var<private> vs_COLOR0_: vec4<f32>;
var<private> vs_TEXCOORD0_: vec4<f32>;
var<private> vs_TEXCOORD1_: vec4<f32>;
var<private> vs_TEXCOORD2_: vec4<f32>;
var<private> vs_TEXCOORD3_: vec4<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat4_: vec2<f32> = vec2(0f);

    let _e28 = in_POSITION0_1;
    let _e33 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e28.yyyy * _e33);
    let _e38 = _v_buffer1_.v_cb1_[0];
    let _e39 = in_POSITION0_1;
    let _e42 = u_xlat0_;
    u_xlat0_ = ((_e38 * _e39.xxxx) + _e42);
    let _e47 = _v_buffer1_.v_cb1_[2];
    let _e48 = in_POSITION0_1;
    let _e51 = u_xlat0_;
    u_xlat0_ = ((_e47 * _e48.zzzz) + _e51);
    let _e53 = u_xlat0_;
    let _e57 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e53 + _e57);
    let _e59 = u_xlat0_;
    let _e64 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e59.yyyy * _e64);
    let _e69 = _v_buffer0_.v_cb0_[79];
    let _e70 = u_xlat0_;
    let _e73 = u_xlat1_;
    u_xlat1_ = ((_e69 * _e70.xxxx) + _e73);
    let _e78 = _v_buffer0_.v_cb0_[81];
    let _e79 = u_xlat0_;
    let _e82 = u_xlat1_;
    u_xlat1_ = ((_e78 * _e79.zzzz) + _e82);
    let _e88 = _v_buffer0_.v_cb0_[82];
    let _e89 = u_xlat0_;
    let _e92 = u_xlat1_;
    gl_Position = ((_e88 * _e89.wwww) + _e92);
    let _e98 = _v_buffer1_.v_cb1_[27];
    u_xlat0_.x = abs(_e98.w);
    let _e105 = _v_buffer1_.v_cb1_[28];
    u_xlat0_.y = abs(_e105.w);
    let _e112 = _v_buffer1_.v_cb1_[29];
    u_xlat0_.z = abs(_e112.w);
    let _e115 = u_xlat0_;
    let _e117 = u_xlat0_;
    let _e119 = log2(_e117.xyz);
    u_xlat0_.x = _e119.x;
    u_xlat0_.y = _e119.y;
    u_xlat0_.z = _e119.z;
    let _e126 = u_xlat0_;
    let _e128 = u_xlat0_;
    let _e134 = (_e128.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat0_.x = _e134.x;
    u_xlat0_.y = _e134.y;
    u_xlat0_.z = _e134.z;
    let _e141 = u_xlat0_;
    let _e143 = u_xlat0_;
    let _e145 = exp2(_e143.xyz);
    u_xlat0_.x = _e145.x;
    u_xlat0_.y = _e145.y;
    u_xlat0_.z = _e145.z;
    let _e152 = u_xlat0_;
    let _e154 = u_xlat0_;
    let _e168 = ((_e154.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat0_.x = _e168.x;
    u_xlat0_.y = _e168.y;
    u_xlat0_.z = _e168.z;
    let _e175 = u_xlat0_;
    let _e177 = u_xlat0_;
    let _e183 = clamp(_e177.xyz, vec3(0f), vec3(1f));
    u_xlat0_.x = _e183.x;
    u_xlat0_.y = _e183.y;
    u_xlat0_.z = _e183.z;
    let _e190 = u_xlat0_;
    let _e192 = u_xlat0_;
    let _e197 = _v_buffer0_.v_cb0_[6];
    let _e199 = (_e192.xyz + _e197.xyz);
    u_xlat0_.x = _e199.x;
    u_xlat0_.y = _e199.y;
    u_xlat0_.z = _e199.z;
    let _e206 = u_xlat0_;
    let _e208 = u_xlat0_;
    let _e217 = (_e208.xyz + vec3<f32>(-1f, -1f, -1f));
    u_xlat0_.x = _e217.x;
    u_xlat0_.y = _e217.y;
    u_xlat0_.z = _e217.z;
    u_xlat0_.w = 0f;
    let _e229 = _v_buffer2_.v_cb2_[4];
    let _e231 = u_xlat0_;
    u_xlat0_ = ((_e229.xxxx * _e231) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e239 = u_xlat0_;
    let _e243 = _v_buffer2_.v_cb2_[1];
    vs_COLOR0_ = (_e239 * _e243);
    let _e245 = u_xlat0_;
    let _e250 = _v_buffer2_.v_cb2_[3];
    let _e256 = in_TEXCOORD0_1;
    let _e258 = ((_e250.xy * vec2<f32>(0.6f, 0.6f)) + _e256.xy);
    u_xlat0_.x = _e258.x;
    u_xlat0_.y = _e258.y;
    let _e263 = vs_TEXCOORD0_;
    let _e265 = u_xlat0_;
    let _e270 = _v_buffer2_.v_cb2_[0];
    let _e276 = _v_buffer2_.v_cb2_[0];
    let _e278 = ((_e265.xy * _e270.xy) + _e276.zw);
    vs_TEXCOORD0_.x = _e278.x;
    vs_TEXCOORD0_.y = _e278.y;
    let _e283 = u_xlat0_;
    let _e288 = _v_buffer2_.v_cb2_[3];
    let _e295 = in_TEXCOORD0_1;
    let _e297 = ((-(_e288.xy) * vec2<f32>(0.6f, 0.6f)) + _e295.xy);
    u_xlat0_.z = _e297.x;
    u_xlat0_.w = _e297.y;
    let _e302 = vs_TEXCOORD0_;
    let _e304 = u_xlat0_;
    let _e309 = _v_buffer2_.v_cb2_[0];
    let _e315 = _v_buffer2_.v_cb2_[0];
    let _e317 = ((_e304.zw * _e309.xy) + _e315.zw);
    vs_TEXCOORD0_.z = _e317.x;
    vs_TEXCOORD0_.w = _e317.y;
    let _e322 = vs_TEXCOORD1_;
    let _e324 = u_xlat0_;
    let _e329 = _v_buffer2_.v_cb2_[0];
    let _e335 = _v_buffer2_.v_cb2_[0];
    let _e337 = ((_e324.xw * _e329.xy) + _e335.zw);
    vs_TEXCOORD1_.x = _e337.x;
    vs_TEXCOORD1_.y = _e337.y;
    let _e342 = vs_TEXCOORD1_;
    let _e344 = u_xlat0_;
    let _e349 = _v_buffer2_.v_cb2_[0];
    let _e355 = _v_buffer2_.v_cb2_[0];
    let _e357 = ((_e344.zy * _e349.xy) + _e355.zw);
    vs_TEXCOORD1_.z = _e357.x;
    vs_TEXCOORD1_.w = _e357.y;
    let _e363 = in_TEXCOORD0_1;
    let _e368 = _v_buffer2_.v_cb2_[3];
    u_xlat4_.y = (_e363.y + -(_e368.y));
    let _e373 = in_TEXCOORD0_1;
    u_xlat4_.x = _e373.x;
    let _e375 = vs_TEXCOORD2_;
    let _e377 = u_xlat4_;
    let _e382 = _v_buffer2_.v_cb2_[0];
    let _e388 = _v_buffer2_.v_cb2_[0];
    let _e390 = ((_e377.xy * _e382.xy) + _e388.zw);
    vs_TEXCOORD2_.z = _e390.x;
    vs_TEXCOORD2_.w = _e390.y;
    let _e395 = u_xlat0_;
    let _e397 = in_TEXCOORD0_1;
    let _e402 = _v_buffer2_.v_cb2_[3];
    let _e404 = (_e397.yx + _e402.yx);
    u_xlat0_.x = _e404.x;
    u_xlat0_.y = _e404.y;
    let _e409 = u_xlat0_;
    let _e411 = in_TEXCOORD0_1;
    let _e412 = _e411.xy;
    u_xlat0_.z = _e412.x;
    u_xlat0_.w = _e412.y;
    let _e417 = vs_TEXCOORD2_;
    let _e419 = u_xlat0_;
    let _e424 = _v_buffer2_.v_cb2_[0];
    let _e430 = _v_buffer2_.v_cb2_[0];
    let _e432 = ((_e419.zx * _e424.xy) + _e430.zw);
    vs_TEXCOORD2_.x = _e432.x;
    vs_TEXCOORD2_.y = _e432.y;
    let _e437 = vs_TEXCOORD3_;
    let _e439 = u_xlat0_;
    let _e444 = _v_buffer2_.v_cb2_[0];
    let _e450 = _v_buffer2_.v_cb2_[0];
    let _e452 = ((_e439.yw * _e444.xy) + _e450.zw);
    vs_TEXCOORD3_.x = _e452.x;
    vs_TEXCOORD3_.y = _e452.y;
    let _e457 = vs_TEXCOORD3_;
    let _e459 = in_TEXCOORD0_1;
    let _e464 = _v_buffer2_.v_cb2_[0];
    let _e470 = _v_buffer2_.v_cb2_[0];
    let _e472 = ((_e459.xy * _e464.xy) + _e470.zw);
    vs_TEXCOORD3_.z = _e472.x;
    vs_TEXCOORD3_.w = _e472.y;
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    main_1();
    let _e28 = vs_COLOR0_;
    let _e30 = vs_TEXCOORD0_;
    let _e32 = vs_TEXCOORD1_;
    let _e34 = vs_TEXCOORD2_;
    let _e36 = vs_TEXCOORD3_;
    let _e38 = gl_Position;
    return VertexOutput(_e28, _e30, _e32, _e34, _e36, _e38);
}
