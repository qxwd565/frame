struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 30>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 6>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec3<f32>,
    @location(10) vs_COLOR0_: vec4<f32>,
    @location(11) vs_COLOR1_: vec4<f32>,
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
var<private> in_COLOR0_1: vec4<f32>;
var<private> in_NORMAL0_1: vec3<f32>;
var<private> vs_TEXCOORD0_: vec3<f32>;
var<private> vs_COLOR0_: vec4<f32>;
var<private> vs_COLOR1_: vec4<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: f32 = 0f;
    var u_xlat6_: f32 = 0f;

    let _e30 = in_POSITION0_1;
    let _e35 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e30.yyyy * _e35);
    let _e40 = _v_buffer1_.v_cb1_[0];
    let _e41 = in_POSITION0_1;
    let _e44 = u_xlat0_;
    u_xlat0_ = ((_e40 * _e41.xxxx) + _e44);
    let _e49 = _v_buffer1_.v_cb1_[2];
    let _e50 = in_POSITION0_1;
    let _e53 = u_xlat0_;
    u_xlat0_ = ((_e49 * _e50.zzzz) + _e53);
    let _e55 = u_xlat0_;
    let _e59 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e55 + _e59);
    let _e61 = u_xlat0_;
    let _e66 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e61.yyyy * _e66);
    let _e71 = _v_buffer0_.v_cb0_[79];
    let _e72 = u_xlat0_;
    let _e75 = u_xlat1_;
    u_xlat1_ = ((_e71 * _e72.xxxx) + _e75);
    let _e80 = _v_buffer0_.v_cb0_[81];
    let _e81 = u_xlat0_;
    let _e84 = u_xlat1_;
    u_xlat1_ = ((_e80 * _e81.zzzz) + _e84);
    let _e90 = _v_buffer0_.v_cb0_[82];
    let _e91 = u_xlat0_;
    let _e94 = u_xlat1_;
    gl_Position = ((_e90 * _e91.wwww) + _e94);
    let _e96 = u_xlat0_;
    let _e101 = _v_buffer0_.v_cb0_[21];
    let _e106 = _v_buffer1_.v_cb1_[5];
    let _e108 = (_e101.yyy * _e106.xyz);
    u_xlat0_.x = _e108.x;
    u_xlat0_.y = _e108.y;
    u_xlat0_.z = _e108.z;
    let _e115 = u_xlat0_;
    let _e120 = _v_buffer1_.v_cb1_[4];
    let _e125 = _v_buffer0_.v_cb0_[21];
    let _e128 = u_xlat0_;
    let _e130 = ((_e120.xyz * _e125.xxx) + _e128.xyz);
    u_xlat0_.x = _e130.x;
    u_xlat0_.y = _e130.y;
    u_xlat0_.z = _e130.z;
    let _e137 = u_xlat0_;
    let _e142 = _v_buffer1_.v_cb1_[6];
    let _e147 = _v_buffer0_.v_cb0_[21];
    let _e150 = u_xlat0_;
    let _e152 = ((_e142.xyz * _e147.zzz) + _e150.xyz);
    u_xlat0_.x = _e152.x;
    u_xlat0_.y = _e152.y;
    u_xlat0_.z = _e152.z;
    let _e159 = u_xlat0_;
    let _e161 = u_xlat0_;
    let _e166 = _v_buffer1_.v_cb1_[7];
    let _e168 = (_e161.xyz + _e166.xyz);
    u_xlat0_.x = _e168.x;
    u_xlat0_.y = _e168.y;
    u_xlat0_.z = _e168.z;
    let _e175 = u_xlat0_;
    let _e177 = u_xlat0_;
    let _e179 = in_POSITION0_1;
    let _e182 = (_e177.xyz + -(_e179.xyz));
    u_xlat0_.x = _e182.x;
    u_xlat0_.y = _e182.y;
    u_xlat0_.z = _e182.z;
    let _e189 = u_xlat0_;
    let _e191 = u_xlat0_;
    u_xlat6_ = dot(_e189.xyz, _e191.xyz);
    let _e194 = u_xlat6_;
    u_xlat6_ = inverseSqrt(_e194);
    let _e196 = u_xlat0_;
    let _e198 = u_xlat6_;
    let _e200 = u_xlat0_;
    let _e202 = (vec3(_e198) * _e200.xyz);
    u_xlat0_.x = _e202.x;
    u_xlat0_.y = _e202.y;
    u_xlat0_.z = _e202.z;
    let _e210 = in_NORMAL0_1;
    let _e212 = u_xlat0_;
    u_xlat0_.x = dot(_e210.xyz, _e212.xyz);
    let _e216 = u_xlat0_;
    u_xlat0_.x = clamp(_e216.x, 0f, 1f);
    let _e222 = u_xlat0_;
    u_xlat0_.x = (-(_e222.x) + 1f);
    let _e230 = _v_buffer2_.v_cb2_[2];
    u_xlat2_ = (-(_e230.x) + 1f);
    let _e236 = u_xlat2_;
    let _e238 = u_xlat0_;
    u_xlat0_.x = (-(_e236) + _e238.x);
    let _e241 = u_xlat2_;
    u_xlat2_ = (-(_e241) + 1f);
    let _e247 = u_xlat2_;
    u_xlat2_ = (1f / _e247);
    let _e250 = u_xlat2_;
    let _e251 = u_xlat0_;
    u_xlat0_.x = (_e250 * _e251.x);
    let _e255 = u_xlat0_;
    u_xlat0_.x = clamp(_e255.x, 0f, 1f);
    let _e260 = u_xlat0_;
    u_xlat2_ = ((_e260.x * -2f) + 3f);
    let _e268 = u_xlat0_;
    let _e270 = u_xlat0_;
    u_xlat0_.x = (_e268.x * _e270.x);
    let _e274 = u_xlat0_;
    let _e276 = u_xlat2_;
    u_xlat0_.x = (_e274.x * _e276);
    let _e279 = u_xlat0_;
    let _e284 = _v_buffer2_.v_cb2_[4];
    u_xlat0_.x = (_e279.x * _e284.y);
    let _e288 = u_xlat0_;
    u_xlat0_.x = (_e288.x * 0.5f);
    let _e293 = u_xlat0_;
    vs_TEXCOORD0_.z = _e293.x;
    let _e295 = u_xlat0_;
    let _e300 = _v_buffer2_.v_cb2_[3];
    u_xlat0_ = (_e295.xxxx * _e300);
    let _e302 = u_xlat0_;
    let _e306 = _v_buffer2_.v_cb2_[4];
    vs_COLOR1_ = (_e302 * _e306.xxxx);
    let _e309 = u_xlat0_;
    let _e311 = in_TEXCOORD0_1;
    let _e316 = _v_buffer2_.v_cb2_[5];
    let _e318 = (_e311.xy + _e316.xy);
    u_xlat0_.x = _e318.x;
    u_xlat0_.y = _e318.y;
    let _e323 = vs_TEXCOORD0_;
    let _e325 = u_xlat0_;
    let _e330 = _v_buffer2_.v_cb2_[0];
    let _e336 = _v_buffer2_.v_cb2_[0];
    let _e338 = ((_e325.xy * _e330.xy) + _e336.zw);
    vs_TEXCOORD0_.x = _e338.x;
    vs_TEXCOORD0_.y = _e338.y;
    let _e347 = _v_buffer1_.v_cb1_[27];
    u_xlat0_.x = abs(_e347.w);
    let _e354 = _v_buffer1_.v_cb1_[28];
    u_xlat0_.y = abs(_e354.w);
    let _e361 = _v_buffer1_.v_cb1_[29];
    u_xlat0_.z = abs(_e361.w);
    let _e364 = u_xlat0_;
    let _e366 = u_xlat0_;
    let _e368 = log2(_e366.xyz);
    u_xlat0_.x = _e368.x;
    u_xlat0_.y = _e368.y;
    u_xlat0_.z = _e368.z;
    let _e375 = u_xlat0_;
    let _e377 = u_xlat0_;
    let _e383 = (_e377.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat0_.x = _e383.x;
    u_xlat0_.y = _e383.y;
    u_xlat0_.z = _e383.z;
    let _e390 = u_xlat0_;
    let _e392 = u_xlat0_;
    let _e394 = exp2(_e392.xyz);
    u_xlat0_.x = _e394.x;
    u_xlat0_.y = _e394.y;
    u_xlat0_.z = _e394.z;
    let _e401 = u_xlat0_;
    let _e403 = u_xlat0_;
    let _e417 = ((_e403.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat0_.x = _e417.x;
    u_xlat0_.y = _e417.y;
    u_xlat0_.z = _e417.z;
    let _e424 = u_xlat0_;
    let _e426 = u_xlat0_;
    let _e432 = clamp(_e426.xyz, vec3(0f), vec3(1f));
    u_xlat0_.x = _e432.x;
    u_xlat0_.y = _e432.y;
    u_xlat0_.z = _e432.z;
    let _e439 = u_xlat0_;
    let _e441 = u_xlat0_;
    let _e446 = _v_buffer0_.v_cb0_[6];
    let _e448 = (_e441.xyz + _e446.xyz);
    u_xlat0_.x = _e448.x;
    u_xlat0_.y = _e448.y;
    u_xlat0_.z = _e448.z;
    let _e455 = u_xlat0_;
    let _e457 = u_xlat0_;
    let _e466 = (_e457.xyz + vec3<f32>(-1f, -1f, -1f));
    u_xlat0_.x = _e466.x;
    u_xlat0_.y = _e466.y;
    u_xlat0_.z = _e466.z;
    u_xlat0_.w = 0f;
    let _e478 = _v_buffer2_.v_cb2_[4];
    let _e480 = u_xlat0_;
    u_xlat0_ = ((_e478.wwww * _e480) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e488 = in_COLOR0_1;
    let _e492 = _v_buffer2_.v_cb2_[1];
    u_xlat1_ = (_e488 * _e492);
    let _e494 = u_xlat1_;
    let _e498 = _v_buffer2_.v_cb2_[4];
    u_xlat1_ = (_e494 * _e498.zzzz);
    let _e501 = u_xlat0_;
    let _e502 = u_xlat1_;
    vs_COLOR0_ = (_e501 * _e502);
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(3) in_COLOR0_: vec4<f32>, @location(1) in_NORMAL0_: vec3<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_COLOR0_1 = in_COLOR0_;
    in_NORMAL0_1 = in_NORMAL0_;
    main_1();
    let _e32 = vs_TEXCOORD0_;
    let _e34 = vs_COLOR0_;
    let _e36 = vs_COLOR1_;
    let _e38 = gl_Position;
    return VertexOutput(_e32, _e34, _e36, _e38);
}
