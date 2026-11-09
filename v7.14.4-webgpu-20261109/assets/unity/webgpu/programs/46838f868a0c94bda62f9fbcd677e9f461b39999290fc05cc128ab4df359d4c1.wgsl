struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 30>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 2>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec2<f32>,
    @location(1) vs_TEXCOORD1_: vec2<f32>,
    @location(10) vs_COLOR0_: vec4<f32>,
    @builtin(position) gl_Position: vec4<f32>,
}

@group(0) @binding(0) 
var<uniform> _v_buffer0_: v_buffer0_;
@group(0) @binding(1) 
var<uniform> _v_buffer1_: v_buffer1_;
@group(0) @binding(2) 
var<uniform> _v_buffer2_: v_buffer2_;
var<private> in_POSITION0_1: vec4<f32>;
var<private> in_NORMAL0_1: vec3<f32>;
var<private> in_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD0_: vec2<f32>;
var<private> vs_TEXCOORD1_: vec2<f32>;
var<private> vs_COLOR0_: vec4<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat6_: vec2<f32> = vec2(0f);

    let _e31 = in_POSITION0_1;
    let _e36 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e31.yyyy * _e36);
    let _e41 = _v_buffer1_.v_cb1_[0];
    let _e42 = in_POSITION0_1;
    let _e45 = u_xlat0_;
    u_xlat0_ = ((_e41 * _e42.xxxx) + _e45);
    let _e50 = _v_buffer1_.v_cb1_[2];
    let _e51 = in_POSITION0_1;
    let _e54 = u_xlat0_;
    u_xlat0_ = ((_e50 * _e51.zzzz) + _e54);
    let _e56 = u_xlat0_;
    let _e60 = _v_buffer1_.v_cb1_[3];
    u_xlat1_ = (_e56 + _e60);
    let _e62 = u_xlat0_;
    let _e67 = _v_buffer1_.v_cb1_[3];
    let _e69 = in_POSITION0_1;
    let _e72 = u_xlat0_;
    let _e74 = ((_e67.xz * _e69.ww) + _e72.xz);
    u_xlat0_.x = _e74.x;
    u_xlat0_.y = _e74.y;
    let _e79 = u_xlat1_;
    let _e84 = _v_buffer0_.v_cb0_[80];
    u_xlat2_ = (_e79.yyyy * _e84);
    let _e89 = _v_buffer0_.v_cb0_[79];
    let _e90 = u_xlat1_;
    let _e93 = u_xlat2_;
    u_xlat2_ = ((_e89 * _e90.xxxx) + _e93);
    let _e98 = _v_buffer0_.v_cb0_[81];
    let _e99 = u_xlat1_;
    let _e102 = u_xlat2_;
    u_xlat2_ = ((_e98 * _e99.zzzz) + _e102);
    let _e108 = _v_buffer0_.v_cb0_[82];
    let _e109 = u_xlat1_;
    let _e112 = u_xlat2_;
    gl_Position = ((_e108 * _e109.wwww) + _e112);
    let _e114 = u_xlat6_;
    let _e116 = in_NORMAL0_1;
    let _e121 = _v_buffer1_.v_cb1_[1];
    let _e123 = (_e116.yy * _e121.xz);
    u_xlat6_.x = _e123.x;
    u_xlat6_.y = _e123.y;
    let _e128 = u_xlat6_;
    let _e133 = _v_buffer1_.v_cb1_[0];
    let _e135 = in_NORMAL0_1;
    let _e138 = u_xlat6_;
    let _e140 = ((_e133.xz * _e135.xx) + _e138.xy);
    u_xlat6_.x = _e140.x;
    u_xlat6_.y = _e140.y;
    let _e145 = u_xlat6_;
    let _e150 = _v_buffer1_.v_cb1_[2];
    let _e152 = in_NORMAL0_1;
    let _e155 = u_xlat6_;
    let _e157 = ((_e150.xz * _e152.zz) + _e155.xy);
    u_xlat6_.x = _e157.x;
    u_xlat6_.y = _e157.y;
    let _e162 = u_xlat6_;
    let _e164 = u_xlat6_;
    let _e169 = (_e164.xy * vec2<f32>(0.3f, 0.3f));
    u_xlat6_.x = _e169.x;
    u_xlat6_.y = _e169.y;
    let _e174 = u_xlat1_;
    let _e176 = in_TEXCOORD0_1;
    let _e181 = _v_buffer2_.v_cb2_[0];
    let _e187 = _v_buffer2_.v_cb2_[0];
    let _e189 = ((_e176.xy * _e181.xy) + _e187.zw);
    u_xlat1_.x = _e189.x;
    u_xlat1_.y = _e189.y;
    let _e194 = u_xlat0_;
    let _e196 = u_xlat1_;
    let _e199 = u_xlat6_;
    let _e202 = u_xlat0_;
    let _e204 = ((-(_e196.xx) * _e199.xy) + _e202.xy);
    u_xlat0_.x = _e204.x;
    u_xlat0_.y = _e204.y;
    let _e209 = vs_TEXCOORD0_;
    let _e211 = u_xlat1_;
    let _e212 = _e211.xy;
    vs_TEXCOORD0_.x = _e212.x;
    vs_TEXCOORD0_.y = _e212.y;
    let _e221 = _v_buffer0_.v_cb0_[15];
    let _e226 = _v_buffer2_.v_cb2_[1];
    u_xlat6_.x = dot(_e221.xx, _e226.yy);
    let _e229 = u_xlat0_;
    let _e231 = u_xlat0_;
    let _e237 = u_xlat6_;
    let _e239 = ((_e231.xy * vec2<f32>(0.07f, 0.07f)) + _e237.xx);
    u_xlat0_.x = _e239.x;
    u_xlat0_.y = _e239.y;
    let _e244 = vs_TEXCOORD1_;
    let _e246 = u_xlat0_;
    let _e248 = u_xlat0_;
    let _e250 = (_e246.xy + _e248.xy);
    vs_TEXCOORD1_.x = _e250.x;
    vs_TEXCOORD1_.y = _e250.y;
    let _e259 = _v_buffer1_.v_cb1_[27];
    u_xlat0_.x = abs(_e259.w);
    let _e266 = _v_buffer1_.v_cb1_[28];
    u_xlat0_.y = abs(_e266.w);
    let _e273 = _v_buffer1_.v_cb1_[29];
    u_xlat0_.z = abs(_e273.w);
    let _e276 = u_xlat0_;
    let _e278 = u_xlat0_;
    let _e280 = log2(_e278.xyz);
    u_xlat0_.x = _e280.x;
    u_xlat0_.y = _e280.y;
    u_xlat0_.z = _e280.z;
    let _e287 = u_xlat0_;
    let _e289 = u_xlat0_;
    let _e295 = (_e289.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat0_.x = _e295.x;
    u_xlat0_.y = _e295.y;
    u_xlat0_.z = _e295.z;
    let _e302 = u_xlat0_;
    let _e304 = u_xlat0_;
    let _e306 = exp2(_e304.xyz);
    u_xlat0_.x = _e306.x;
    u_xlat0_.y = _e306.y;
    u_xlat0_.z = _e306.z;
    let _e313 = u_xlat0_;
    let _e315 = u_xlat0_;
    let _e329 = ((_e315.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat0_.x = _e329.x;
    u_xlat0_.y = _e329.y;
    u_xlat0_.z = _e329.z;
    let _e336 = u_xlat0_;
    let _e338 = u_xlat0_;
    let _e344 = clamp(_e338.xyz, vec3(0f), vec3(1f));
    u_xlat0_.x = _e344.x;
    u_xlat0_.y = _e344.y;
    u_xlat0_.z = _e344.z;
    let _e351 = u_xlat0_;
    let _e353 = u_xlat0_;
    let _e358 = _v_buffer0_.v_cb0_[6];
    let _e360 = (_e353.xyz + _e358.xyz);
    u_xlat0_.x = _e360.x;
    u_xlat0_.y = _e360.y;
    u_xlat0_.z = _e360.z;
    let _e367 = u_xlat0_;
    let _e369 = u_xlat0_;
    let _e378 = (_e369.xyz + vec3<f32>(-1f, -1f, -1f));
    u_xlat0_.x = _e378.x;
    u_xlat0_.y = _e378.y;
    u_xlat0_.z = _e378.z;
    u_xlat0_.w = 0f;
    let _e390 = _v_buffer2_.v_cb2_[1];
    let _e392 = u_xlat0_;
    vs_COLOR0_ = ((_e390.wwww * _e392) + vec4<f32>(1f, 1f, 1f, 1f));
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(1) in_NORMAL0_: vec3<f32>, @location(4) in_TEXCOORD0_: vec2<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_NORMAL0_1 = in_NORMAL0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    main_1();
    let _e28 = vs_TEXCOORD0_;
    let _e30 = vs_TEXCOORD1_;
    let _e32 = vs_COLOR0_;
    let _e34 = gl_Position;
    return VertexOutput(_e28, _e30, _e32, _e34);
}
