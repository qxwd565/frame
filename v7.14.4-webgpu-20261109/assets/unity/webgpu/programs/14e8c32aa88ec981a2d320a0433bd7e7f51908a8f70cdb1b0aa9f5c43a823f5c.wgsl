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
    @location(0) vs_TEXCOORD0_: vec4<f32>,
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
var<private> vs_TEXCOORD0_: vec4<f32>;
var<private> vs_COLOR0_: vec4<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: f32 = 0f;
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat8_: vec2<f32> = vec2(0f);
    var u_xlat9_: vec2<f32> = vec2(0f);

    let _e37 = in_POSITION0_1;
    let _e42 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e37.yyyy * _e42);
    let _e47 = _v_buffer1_.v_cb1_[0];
    let _e48 = in_POSITION0_1;
    let _e51 = u_xlat0_;
    u_xlat0_ = ((_e47 * _e48.xxxx) + _e51);
    let _e56 = _v_buffer1_.v_cb1_[2];
    let _e57 = in_POSITION0_1;
    let _e60 = u_xlat0_;
    u_xlat0_ = ((_e56 * _e57.zzzz) + _e60);
    let _e62 = u_xlat0_;
    let _e66 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e62 + _e66);
    let _e68 = u_xlat0_;
    let _e73 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e68.yyyy * _e73);
    let _e78 = _v_buffer0_.v_cb0_[79];
    let _e79 = u_xlat0_;
    let _e82 = u_xlat1_;
    u_xlat1_ = ((_e78 * _e79.xxxx) + _e82);
    let _e87 = _v_buffer0_.v_cb0_[81];
    let _e88 = u_xlat0_;
    let _e91 = u_xlat1_;
    u_xlat1_ = ((_e87 * _e88.zzzz) + _e91);
    let _e97 = _v_buffer0_.v_cb0_[82];
    let _e98 = u_xlat0_;
    let _e101 = u_xlat1_;
    gl_Position = ((_e97 * _e98.wwww) + _e101);
    let _e107 = _v_buffer2_.v_cb2_[1];
    u_xlat0_.x = (_e107.w + 0.5f);
    let _e115 = _v_buffer2_.v_cb2_[2];
    u_xlat0_.y = (_e115.x + 0.5f);
    let _e119 = u_xlat8_;
    let _e121 = in_TEXCOORD0_1;
    let _e126 = _v_buffer2_.v_cb2_[3];
    let _e132 = _v_buffer2_.v_cb2_[3];
    let _e134 = ((_e121.xy * _e126.xy) + _e132.zw);
    u_xlat8_.x = _e134.x;
    u_xlat8_.y = _e134.y;
    let _e139 = u_xlat0_;
    let _e141 = u_xlat0_;
    let _e144 = u_xlat8_;
    let _e146 = (-(_e141.xy) + _e144.xy);
    u_xlat0_.x = _e146.x;
    u_xlat0_.y = _e146.y;
    let _e151 = u_xlat0_;
    let _e153 = u_xlat0_;
    let _e158 = _v_buffer2_.v_cb2_[2];
    let _e160 = (_e153.xy * _e158.yz);
    u_xlat0_.x = _e160.x;
    u_xlat0_.y = _e160.y;
    let _e169 = _v_buffer2_.v_cb2_[1];
    let _e174 = _v_buffer0_.v_cb0_[15];
    let _e180 = _v_buffer2_.v_cb2_[1];
    u_xlat1_.x = ((_e169.y * _e174.x) + _e180.z);
    let _e183 = u_xlat1_;
    u_xlat2_ = cos(_e183.x);
    let _e187 = u_xlat1_;
    u_xlat1_.x = sin(_e187.x);
    let _e191 = u_xlat1_;
    u_xlat3_.z = _e191.x;
    let _e194 = u_xlat2_;
    u_xlat3_.y = _e194;
    let _e196 = u_xlat1_;
    u_xlat3_.x = -(_e196.x);
    let _e200 = u_xlat0_;
    let _e202 = u_xlat3_;
    u_xlat9_.y = dot(_e200.xy, _e202.xy);
    let _e206 = u_xlat0_;
    let _e208 = u_xlat3_;
    u_xlat9_.x = dot(_e206.xy, _e208.yz);
    let _e211 = vs_TEXCOORD0_;
    let _e213 = u_xlat9_;
    let _e218 = (_e213.xy + vec2<f32>(0.5f, 0.5f));
    vs_TEXCOORD0_.z = _e218.x;
    vs_TEXCOORD0_.w = _e218.y;
    let _e224 = u_xlat8_;
    let _e229 = _v_buffer2_.v_cb2_[4];
    u_xlat0_.x = (_e224.x + _e229.w);
    let _e233 = u_xlat8_;
    let _e238 = _v_buffer2_.v_cb2_[5];
    u_xlat0_.y = (_e233.y + _e238.x);
    let _e241 = vs_TEXCOORD0_;
    let _e243 = u_xlat0_;
    let _e248 = _v_buffer2_.v_cb2_[4];
    let _e250 = (_e243.xy * _e248.yz);
    vs_TEXCOORD0_.x = _e250.x;
    vs_TEXCOORD0_.y = _e250.y;
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
    let _e390 = _v_buffer2_.v_cb2_[5];
    let _e392 = u_xlat0_;
    u_xlat0_ = ((_e390.yyyy * _e392) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e400 = u_xlat0_;
    let _e401 = in_COLOR0_1;
    vs_COLOR0_ = (_e400 * _e401);
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(3) in_COLOR0_: vec4<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_COLOR0_1 = in_COLOR0_;
    main_1();
    let _e26 = vs_TEXCOORD0_;
    let _e28 = vs_COLOR0_;
    let _e30 = gl_Position;
    return VertexOutput(_e26, _e28, _e30);
}
