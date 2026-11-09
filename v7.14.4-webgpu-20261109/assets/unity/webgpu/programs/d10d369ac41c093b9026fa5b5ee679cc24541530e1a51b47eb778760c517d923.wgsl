struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 4>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 14>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec4<f32>,
    @location(11) vs_COLOR1_: vec4<f32>,
    @location(10) vs_COLOR0_: vec4<f32>,
    @location(1) vs_TEXCOORD1_: f32,
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
var<private> vs_TEXCOORD0_: vec4<f32>;
var<private> vs_COLOR1_: vec4<f32>;
var<private> vs_COLOR0_: vec4<f32>;
var<private> vs_TEXCOORD1_: f32;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: f32 = 0f;
    var u_xlat6_: vec2<f32> = vec2(0f);

    let _e35 = in_POSITION0_1;
    let _e40 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e35.yyyy * _e40);
    let _e45 = _v_buffer1_.v_cb1_[0];
    let _e46 = in_POSITION0_1;
    let _e49 = u_xlat0_;
    u_xlat0_ = ((_e45 * _e46.xxxx) + _e49);
    let _e54 = _v_buffer1_.v_cb1_[2];
    let _e55 = in_POSITION0_1;
    let _e58 = u_xlat0_;
    u_xlat0_ = ((_e54 * _e55.zzzz) + _e58);
    let _e60 = u_xlat0_;
    let _e64 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e60 + _e64);
    let _e66 = u_xlat0_;
    let _e71 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e66.yyyy * _e71);
    let _e76 = _v_buffer0_.v_cb0_[79];
    let _e77 = u_xlat0_;
    let _e80 = u_xlat1_;
    u_xlat1_ = ((_e76 * _e77.xxxx) + _e80);
    let _e85 = _v_buffer0_.v_cb0_[81];
    let _e86 = u_xlat0_;
    let _e89 = u_xlat1_;
    u_xlat1_ = ((_e85 * _e86.zzzz) + _e89);
    let _e95 = _v_buffer0_.v_cb0_[82];
    let _e96 = u_xlat0_;
    let _e99 = u_xlat1_;
    gl_Position = ((_e95 * _e96.wwww) + _e99);
    let _e101 = u_xlat0_;
    let _e103 = in_TEXCOORD0_1;
    let _e108 = _v_buffer2_.v_cb2_[1];
    let _e114 = _v_buffer2_.v_cb2_[1];
    let _e116 = ((_e103.xy * _e108.xy) + _e114.zw);
    u_xlat0_.x = _e116.x;
    u_xlat0_.y = _e116.y;
    let _e121 = u_xlat6_;
    let _e123 = u_xlat0_;
    let _e126 = u_xlat0_;
    let _e128 = (-(_e123.xy) + _e126.yx);
    u_xlat6_.x = _e128.x;
    u_xlat6_.y = _e128.y;
    let _e133 = u_xlat0_;
    let _e138 = _v_buffer2_.v_cb2_[2];
    let _e140 = u_xlat6_;
    let _e143 = u_xlat0_;
    let _e145 = ((_e138.zz * _e140.xy) + _e143.xy);
    u_xlat0_.x = _e145.x;
    u_xlat0_.y = _e145.y;
    let _e150 = u_xlat6_;
    let _e155 = _v_buffer0_.v_cb0_[15];
    let _e160 = _v_buffer2_.v_cb2_[11];
    let _e162 = (_e155.zz * _e160.yz);
    u_xlat6_.x = _e162.x;
    u_xlat6_.y = _e162.y;
    let _e167 = u_xlat6_;
    let _e169 = u_xlat6_;
    let _e171 = fract(_e169.xy);
    u_xlat6_.x = _e171.x;
    u_xlat6_.y = _e171.y;
    let _e176 = vs_TEXCOORD0_;
    let _e178 = u_xlat6_;
    let _e180 = u_xlat0_;
    let _e182 = (_e178.xy + _e180.xy);
    vs_TEXCOORD0_.x = _e182.x;
    vs_TEXCOORD0_.y = _e182.y;
    let _e187 = u_xlat0_;
    let _e189 = in_TEXCOORD0_1;
    let _e194 = _v_buffer2_.v_cb2_[4];
    let _e200 = _v_buffer2_.v_cb2_[4];
    let _e202 = ((_e189.xy * _e194.xy) + _e200.zw);
    u_xlat0_.x = _e202.x;
    u_xlat0_.y = _e202.y;
    let _e207 = u_xlat6_;
    let _e209 = u_xlat0_;
    let _e212 = u_xlat0_;
    let _e214 = (-(_e209.xy) + _e212.yx);
    u_xlat6_.x = _e214.x;
    u_xlat6_.y = _e214.y;
    let _e219 = u_xlat0_;
    let _e224 = _v_buffer2_.v_cb2_[6];
    let _e226 = u_xlat6_;
    let _e229 = u_xlat0_;
    let _e231 = ((_e224.yy * _e226.xy) + _e229.xy);
    u_xlat0_.x = _e231.x;
    u_xlat0_.y = _e231.y;
    let _e236 = u_xlat6_;
    let _e241 = _v_buffer0_.v_cb0_[15];
    let _e246 = _v_buffer2_.v_cb2_[5];
    let _e248 = (_e241.zz * _e246.xy);
    u_xlat6_.x = _e248.x;
    u_xlat6_.y = _e248.y;
    let _e253 = u_xlat6_;
    let _e255 = u_xlat6_;
    let _e257 = fract(_e255.xy);
    u_xlat6_.x = _e257.x;
    u_xlat6_.y = _e257.y;
    let _e262 = vs_TEXCOORD0_;
    let _e264 = u_xlat6_;
    let _e266 = u_xlat0_;
    let _e268 = (_e264.xy + _e266.xy);
    vs_TEXCOORD0_.z = _e268.x;
    vs_TEXCOORD0_.w = _e268.y;
    let _e274 = in_COLOR0_1;
    let _e279 = _v_buffer2_.v_cb2_[13];
    u_xlat0_.w = max(_e274.w, _e279.x);
    let _e282 = u_xlat0_;
    let _e284 = in_COLOR0_1;
    let _e285 = _e284.xyz;
    u_xlat0_.x = _e285.x;
    u_xlat0_.y = _e285.y;
    u_xlat0_.z = _e285.z;
    let _e292 = u_xlat0_;
    let _e296 = _v_buffer2_.v_cb2_[7];
    u_xlat1_ = (_e292 * _e296);
    let _e298 = u_xlat0_;
    let _e302 = _v_buffer2_.v_cb2_[0];
    u_xlat0_ = (_e298 * _e302);
    let _e305 = u_xlat1_;
    let _e307 = u_xlat1_;
    u_xlat2_.x = max(_e305.y, _e307.x);
    let _e311 = u_xlat1_;
    let _e313 = u_xlat2_;
    u_xlat2_.x = max(_e311.z, _e313.x);
    let _e317 = u_xlat2_;
    u_xlat2_.x = ((_e317.x * 2f) + -1f);
    let _e325 = u_xlat2_;
    u_xlat2_.x = clamp(_e325.x, 0f, 1f);
    let _e331 = u_xlat2_;
    u_xlat2_.w = (-(_e331.x) + 1f);
    let _e336 = u_xlat1_;
    let _e338 = u_xlat1_;
    let _e340 = u_xlat1_;
    let _e342 = (_e338.xyz + _e340.xyz);
    u_xlat1_.x = _e342.x;
    u_xlat1_.y = _e342.y;
    u_xlat1_.z = _e342.z;
    let _e349 = u_xlat2_;
    let _e351 = u_xlat1_;
    let _e356 = _v_buffer2_.v_cb2_[8];
    let _e358 = (_e351.xyz * _e356.xxx);
    u_xlat2_.x = _e358.x;
    u_xlat2_.y = _e358.y;
    u_xlat2_.z = _e358.z;
    let _e365 = u_xlat1_;
    let _e367 = u_xlat2_;
    vs_COLOR1_ = (_e365.wwww * _e367);
    let _e370 = u_xlat0_;
    let _e372 = u_xlat0_;
    u_xlat1_.x = max(_e370.y, _e372.x);
    let _e376 = u_xlat0_;
    let _e378 = u_xlat1_;
    u_xlat1_.x = max(_e376.z, _e378.x);
    let _e382 = u_xlat1_;
    u_xlat1_.x = ((_e382.x * 2f) + -1f);
    let _e390 = u_xlat1_;
    u_xlat1_.x = clamp(_e390.x, 0f, 1f);
    let _e396 = u_xlat1_;
    u_xlat1_.w = (-(_e396.x) + 1f);
    let _e401 = u_xlat1_;
    let _e403 = u_xlat0_;
    let _e405 = u_xlat0_;
    let _e407 = (_e403.xyz + _e405.xyz);
    u_xlat1_.x = _e407.x;
    u_xlat1_.y = _e407.y;
    u_xlat1_.z = _e407.z;
    let _e415 = u_xlat0_;
    let _e420 = _v_buffer2_.v_cb2_[2];
    u_xlat0_.x = (_e415.w * _e420.w);
    let _e423 = u_xlat0_;
    let _e425 = u_xlat1_;
    vs_COLOR0_ = (_e423.xxxx * _e425);
    let _e428 = in_COLOR0_1;
    u_xlat0_.x = (-(_e428.w) + 1f);
    let _e434 = u_xlat0_;
    let _e439 = _v_buffer2_.v_cb2_[12];
    u_xlat0_.x = (_e434.x + -(_e439.w));
    let _e446 = _v_buffer2_.v_cb2_[12];
    u_xlat3_ = (_e446.y * 1.01f);
    let _e451 = u_xlat3_;
    let _e452 = u_xlat0_;
    u_xlat0_.x = max(_e451, _e452.x);
    let _e458 = _v_buffer2_.v_cb2_[12];
    u_xlat3_ = ((_e458.z * 2f) + 1f);
    let _e464 = u_xlat0_;
    let _e466 = u_xlat3_;
    let _e471 = _v_buffer2_.v_cb2_[12];
    vs_TEXCOORD1_ = ((_e464.x * _e466) + -(_e471.z));
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(3) in_COLOR0_: vec4<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_COLOR0_1 = in_COLOR0_;
    main_1();
    let _e30 = vs_TEXCOORD0_;
    let _e32 = vs_COLOR1_;
    let _e34 = vs_COLOR0_;
    let _e36 = vs_TEXCOORD1_;
    let _e38 = gl_Position;
    return VertexOutput(_e30, _e32, _e34, _e36, _e38);
}
