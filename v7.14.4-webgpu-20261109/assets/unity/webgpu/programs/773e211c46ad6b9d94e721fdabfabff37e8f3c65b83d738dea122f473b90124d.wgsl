struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 30>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 4>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec2<f32>,
    @location(5) vs_TEXCOORD5_: vec2<f32>,
    @location(10) vs_COLOR0_: vec4<f32>,
    @location(12) vs_NORMAL0_: vec3<f32>,
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
var<private> in_NORMAL0_1: vec3<f32>;
var<private> in_COLOR0_1: vec4<f32>;
var<private> vs_TEXCOORD0_: vec2<f32>;
var<private> vs_TEXCOORD5_: vec2<f32>;
var<private> vs_COLOR0_: vec4<f32>;
var<private> vs_NORMAL0_: vec3<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat6_: f32 = 0f;

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
    let _e94 = u_xlat0_;
    let _e96 = in_TEXCOORD0_1;
    let _e103 = (_e96.xy + vec2<f32>(-0.5f, -0.5f));
    u_xlat0_.x = _e103.x;
    u_xlat0_.y = _e103.y;
    let _e108 = u_xlat0_;
    let _e110 = u_xlat0_;
    let _e115 = _v_buffer2_.v_cb2_[3];
    let _e121 = ((_e110.xy * _e115.yy) + vec2<f32>(0.5f, 0.5f));
    u_xlat0_.x = _e121.x;
    u_xlat0_.y = _e121.y;
    let _e126 = vs_TEXCOORD0_;
    let _e128 = u_xlat0_;
    let _e133 = _v_buffer2_.v_cb2_[0];
    let _e139 = _v_buffer2_.v_cb2_[0];
    let _e141 = ((_e128.xy * _e133.xy) + _e139.zw);
    vs_TEXCOORD0_.x = _e141.x;
    vs_TEXCOORD0_.y = _e141.y;
    let _e146 = vs_TEXCOORD5_;
    let _e148 = u_xlat0_;
    let _e153 = _v_buffer2_.v_cb2_[2];
    let _e159 = _v_buffer2_.v_cb2_[2];
    let _e161 = ((_e148.xy * _e153.xy) + _e159.zw);
    vs_TEXCOORD5_.x = _e161.x;
    vs_TEXCOORD5_.y = _e161.y;
    let _e170 = _v_buffer1_.v_cb1_[27];
    u_xlat0_.x = abs(_e170.w);
    let _e177 = _v_buffer1_.v_cb1_[28];
    u_xlat0_.y = abs(_e177.w);
    let _e184 = _v_buffer1_.v_cb1_[29];
    u_xlat0_.z = abs(_e184.w);
    let _e187 = u_xlat0_;
    let _e189 = u_xlat0_;
    let _e191 = log2(_e189.xyz);
    u_xlat0_.x = _e191.x;
    u_xlat0_.y = _e191.y;
    u_xlat0_.z = _e191.z;
    let _e198 = u_xlat0_;
    let _e200 = u_xlat0_;
    let _e206 = (_e200.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat0_.x = _e206.x;
    u_xlat0_.y = _e206.y;
    u_xlat0_.z = _e206.z;
    let _e213 = u_xlat0_;
    let _e215 = u_xlat0_;
    let _e217 = exp2(_e215.xyz);
    u_xlat0_.x = _e217.x;
    u_xlat0_.y = _e217.y;
    u_xlat0_.z = _e217.z;
    let _e224 = u_xlat0_;
    let _e226 = u_xlat0_;
    let _e240 = ((_e226.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat0_.x = _e240.x;
    u_xlat0_.y = _e240.y;
    u_xlat0_.z = _e240.z;
    let _e247 = u_xlat0_;
    let _e249 = u_xlat0_;
    let _e255 = clamp(_e249.xyz, vec3(0f), vec3(1f));
    u_xlat0_.x = _e255.x;
    u_xlat0_.y = _e255.y;
    u_xlat0_.z = _e255.z;
    let _e262 = u_xlat0_;
    let _e264 = u_xlat0_;
    let _e269 = _v_buffer0_.v_cb0_[6];
    let _e271 = (_e264.xyz + _e269.xyz);
    u_xlat0_.x = _e271.x;
    u_xlat0_.y = _e271.y;
    u_xlat0_.z = _e271.z;
    u_xlat0_.w = 1f;
    let _e280 = u_xlat0_;
    let _e281 = in_COLOR0_1;
    u_xlat0_ = (_e280 + -(_e281));
    let _e287 = _v_buffer2_.v_cb2_[3];
    let _e289 = u_xlat0_;
    let _e291 = in_COLOR0_1;
    vs_COLOR0_ = ((_e287.zzzz * _e289) + _e291);
    let _e294 = in_NORMAL0_1;
    let _e299 = _v_buffer1_.v_cb1_[4];
    u_xlat0_.x = dot(_e294.xyz, _e299.xyz);
    let _e303 = in_NORMAL0_1;
    let _e308 = _v_buffer1_.v_cb1_[5];
    u_xlat0_.y = dot(_e303.xyz, _e308.xyz);
    let _e312 = in_NORMAL0_1;
    let _e317 = _v_buffer1_.v_cb1_[6];
    u_xlat0_.z = dot(_e312.xyz, _e317.xyz);
    let _e320 = u_xlat0_;
    let _e322 = u_xlat0_;
    u_xlat6_ = dot(_e320.xyz, _e322.xyz);
    let _e325 = u_xlat6_;
    u_xlat6_ = max(_e325, 0.000000000000000000000000000000000000011754944f);
    let _e328 = u_xlat6_;
    u_xlat6_ = inverseSqrt(_e328);
    let _e330 = vs_NORMAL0_;
    let _e332 = u_xlat6_;
    let _e334 = u_xlat0_;
    let _e336 = (vec3(_e332) * _e334.xyz);
    vs_NORMAL0_.x = _e336.x;
    vs_NORMAL0_.y = _e336.y;
    vs_NORMAL0_.z = _e336.z;
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(1) in_NORMAL0_: vec3<f32>, @location(3) in_COLOR0_: vec4<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_NORMAL0_1 = in_NORMAL0_;
    in_COLOR0_1 = in_COLOR0_;
    main_1();
    let _e34 = vs_TEXCOORD0_;
    let _e36 = vs_TEXCOORD5_;
    let _e38 = vs_COLOR0_;
    let _e40 = vs_NORMAL0_;
    let _e42 = gl_Position;
    return VertexOutput(_e34, _e36, _e38, _e40, _e42);
}
