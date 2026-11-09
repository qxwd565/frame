struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 30>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 9>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec2<f32>,
    @location(1) vs_TEXCOORD1_: vec4<f32>,
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
var<private> in_TEXCOORD0_1: vec2<f32>;
var<private> in_COLOR0_1: vec4<f32>;
var<private> vs_TEXCOORD0_: vec2<f32>;
var<private> vs_TEXCOORD1_: vec4<f32>;
var<private> vs_COLOR0_: vec4<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat4_: vec2<f32> = vec2(0f);

    let _e27 = in_POSITION0_1;
    let _e32 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e27.yyyy * _e32);
    let _e37 = _v_buffer1_.v_cb1_[0];
    let _e38 = in_POSITION0_1;
    let _e41 = u_xlat0_;
    u_xlat0_ = ((_e37 * _e38.xxxx) + _e41);
    let _e46 = _v_buffer1_.v_cb1_[2];
    let _e47 = in_POSITION0_1;
    let _e50 = u_xlat0_;
    u_xlat0_ = ((_e46 * _e47.zzzz) + _e50);
    let _e52 = u_xlat0_;
    let _e56 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e52 + _e56);
    let _e58 = u_xlat0_;
    let _e63 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e58.yyyy * _e63);
    let _e68 = _v_buffer0_.v_cb0_[79];
    let _e69 = u_xlat0_;
    let _e72 = u_xlat1_;
    u_xlat1_ = ((_e68 * _e69.xxxx) + _e72);
    let _e77 = _v_buffer0_.v_cb0_[81];
    let _e78 = u_xlat0_;
    let _e81 = u_xlat1_;
    u_xlat1_ = ((_e77 * _e78.zzzz) + _e81);
    let _e87 = _v_buffer0_.v_cb0_[82];
    let _e88 = u_xlat0_;
    let _e91 = u_xlat1_;
    gl_Position = ((_e87 * _e88.wwww) + _e91);
    let _e93 = u_xlat0_;
    let _e95 = in_TEXCOORD0_1;
    let _e100 = _v_buffer2_.v_cb2_[0];
    let _e106 = _v_buffer2_.v_cb2_[0];
    let _e108 = ((_e95.xy * _e100.xy) + _e106.zw);
    u_xlat0_.x = _e108.x;
    u_xlat0_.y = _e108.y;
    let _e113 = u_xlat4_;
    let _e118 = _v_buffer0_.v_cb0_[15];
    let _e123 = _v_buffer2_.v_cb2_[3];
    let _e125 = (_e118.xx * _e123.xy);
    u_xlat4_.x = _e125.x;
    u_xlat4_.y = _e125.y;
    let _e130 = vs_TEXCOORD0_;
    let _e132 = u_xlat0_;
    let _e137 = _v_buffer2_.v_cb2_[3];
    let _e140 = u_xlat4_;
    let _e142 = ((_e132.xy * _e137.zw) + _e140.xy);
    vs_TEXCOORD0_.x = _e142.x;
    vs_TEXCOORD0_.y = _e142.y;
    let _e147 = u_xlat0_;
    let _e149 = in_TEXCOORD0_1;
    let _e154 = _v_buffer2_.v_cb2_[1];
    let _e160 = _v_buffer2_.v_cb2_[1];
    let _e162 = ((_e149.xy * _e154.xy) + _e160.zw);
    u_xlat0_.x = _e162.x;
    u_xlat0_.y = _e162.y;
    let _e167 = u_xlat4_;
    let _e172 = _v_buffer0_.v_cb0_[15];
    let _e177 = _v_buffer2_.v_cb2_[4];
    let _e179 = (_e172.xx * _e177.xy);
    u_xlat4_.x = _e179.x;
    u_xlat4_.y = _e179.y;
    let _e184 = vs_TEXCOORD1_;
    let _e186 = u_xlat0_;
    let _e191 = _v_buffer2_.v_cb2_[4];
    let _e194 = u_xlat4_;
    let _e196 = ((_e186.xy * _e191.zw) + _e194.xy);
    vs_TEXCOORD1_.x = _e196.x;
    vs_TEXCOORD1_.y = _e196.y;
    let _e201 = u_xlat0_;
    let _e203 = in_TEXCOORD0_1;
    let _e208 = _v_buffer2_.v_cb2_[2];
    let _e214 = _v_buffer2_.v_cb2_[2];
    let _e216 = ((_e203.xy * _e208.xy) + _e214.zw);
    u_xlat0_.x = _e216.x;
    u_xlat0_.y = _e216.y;
    let _e221 = u_xlat4_;
    let _e226 = _v_buffer0_.v_cb0_[15];
    let _e231 = _v_buffer2_.v_cb2_[5];
    let _e233 = (_e226.xx * _e231.xy);
    u_xlat4_.x = _e233.x;
    u_xlat4_.y = _e233.y;
    let _e238 = vs_TEXCOORD1_;
    let _e240 = u_xlat0_;
    let _e245 = _v_buffer2_.v_cb2_[5];
    let _e248 = u_xlat4_;
    let _e250 = ((_e240.xy * _e245.zw) + _e248.xy);
    vs_TEXCOORD1_.z = _e250.x;
    vs_TEXCOORD1_.w = _e250.y;
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
    u_xlat0_.w = 1f;
    let _e369 = u_xlat0_;
    let _e370 = in_COLOR0_1;
    u_xlat0_ = (_e369 + -(_e370));
    let _e376 = _v_buffer2_.v_cb2_[8];
    let _e378 = u_xlat0_;
    let _e380 = in_COLOR0_1;
    u_xlat0_ = ((_e376.zzzz * _e378) + _e380);
    let _e382 = u_xlat0_;
    let _e386 = _v_buffer2_.v_cb2_[6];
    u_xlat0_ = (_e382 * _e386.wwww);
    let _e389 = u_xlat0_;
    let _e393 = _v_buffer2_.v_cb2_[8];
    u_xlat0_ = (_e389 * _e393.yyyy);
    let _e396 = u_xlat0_;
    let _e400 = _v_buffer2_.v_cb2_[8];
    u_xlat0_ = (_e396 * _e400.xxxx);
    let _e403 = u_xlat0_;
    let _e404 = u_xlat0_;
    vs_COLOR0_ = (_e403 + _e404);
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(3) in_COLOR0_: vec4<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_COLOR0_1 = in_COLOR0_;
    main_1();
    let _e28 = vs_TEXCOORD0_;
    let _e30 = vs_TEXCOORD1_;
    let _e32 = vs_COLOR0_;
    let _e34 = gl_Position;
    return VertexOutput(_e28, _e30, _e32, _e34);
}
