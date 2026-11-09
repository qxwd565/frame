struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 8>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 7>,
}

struct VertexOutput {
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
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);

    let _e20 = in_POSITION0_1;
    let _e25 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e20.yyyy * _e25);
    let _e30 = _v_buffer1_.v_cb1_[0];
    let _e31 = in_POSITION0_1;
    let _e34 = u_xlat0_;
    u_xlat0_ = ((_e30 * _e31.xxxx) + _e34);
    let _e39 = _v_buffer1_.v_cb1_[2];
    let _e40 = in_POSITION0_1;
    let _e43 = u_xlat0_;
    u_xlat0_ = ((_e39 * _e40.zzzz) + _e43);
    let _e48 = _v_buffer1_.v_cb1_[3];
    let _e49 = in_POSITION0_1;
    let _e52 = u_xlat0_;
    u_xlat0_ = ((_e48 * _e49.wwww) + _e52);
    let _e54 = u_xlat1_;
    let _e56 = u_xlat0_;
    let _e61 = _v_buffer2_.v_cb2_[0];
    let _e67 = _v_buffer2_.v_cb2_[0];
    let _e69 = ((_e56.xy * _e61.xy) + _e67.zw);
    u_xlat1_.x = _e69.x;
    u_xlat1_.y = _e69.y;
    let _e74 = u_xlat1_;
    let _e79 = _v_buffer0_.v_cb0_[15];
    let _e84 = _v_buffer2_.v_cb2_[1];
    let _e87 = u_xlat1_;
    let _e89 = ((_e79.xx * _e84.xx) + _e87.xy);
    u_xlat1_.x = _e89.x;
    u_xlat1_.y = _e89.y;
    let _e94 = u_xlat1_;
    let _e97 = textureSampleLevel(v_t0_, samplerv_s0_, _e94.xy, 0f);
    u_xlat1_ = _e97;
    let _e98 = u_xlat1_;
    u_xlat1_ = (_e98 + vec4<f32>(-0.5f, -0.5f, -0.5f, -0.5f));
    let _e109 = u_xlat1_;
    u_xlat1_ = (_e109 * vec4<f32>(0.5f, 0.5f, 0.5f, 0.5f));
    let _e116 = u_xlat1_;
    let _e120 = _v_buffer2_.v_cb2_[1];
    let _e123 = u_xlat0_;
    u_xlat0_ = ((_e116 * _e120.yyyy) + _e123);
    let _e125 = u_xlat0_;
    let _e129 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e125 + -(_e129));
    let _e132 = u_xlat0_;
    let _e136 = _v_buffer2_.v_cb2_[2];
    u_xlat0_ = (_e132 * _e136);
    let _e138 = u_xlat0_;
    let _e143 = _v_buffer2_.v_cb2_[4];
    u_xlat1_ = (_e138.yyyy * _e143);
    let _e148 = _v_buffer2_.v_cb2_[3];
    let _e149 = u_xlat0_;
    let _e152 = u_xlat1_;
    u_xlat1_ = ((_e148 * _e149.xxxx) + _e152);
    let _e157 = _v_buffer2_.v_cb2_[5];
    let _e158 = u_xlat0_;
    let _e161 = u_xlat1_;
    u_xlat1_ = ((_e157 * _e158.zzzz) + _e161);
    let _e166 = _v_buffer2_.v_cb2_[6];
    let _e167 = u_xlat0_;
    let _e170 = u_xlat1_;
    u_xlat0_ = ((_e166 * _e167.wwww) + _e170);
    let _e172 = u_xlat1_;
    let _e174 = u_xlat0_;
    let _e179 = _v_buffer1_.v_cb1_[5];
    let _e181 = (_e174.yyy * _e179.xyz);
    u_xlat1_.x = _e181.x;
    u_xlat1_.y = _e181.y;
    u_xlat1_.z = _e181.z;
    let _e188 = u_xlat1_;
    let _e193 = _v_buffer1_.v_cb1_[4];
    let _e195 = u_xlat0_;
    let _e198 = u_xlat1_;
    let _e200 = ((_e193.xyz * _e195.xxx) + _e198.xyz);
    u_xlat1_.x = _e200.x;
    u_xlat1_.y = _e200.y;
    u_xlat1_.z = _e200.z;
    let _e207 = u_xlat0_;
    let _e212 = _v_buffer1_.v_cb1_[6];
    let _e214 = u_xlat0_;
    let _e217 = u_xlat1_;
    let _e219 = ((_e212.xyz * _e214.zzz) + _e217.xyz);
    u_xlat0_.x = _e219.x;
    u_xlat0_.y = _e219.y;
    u_xlat0_.z = _e219.z;
    let _e226 = u_xlat0_;
    let _e231 = _v_buffer1_.v_cb1_[7];
    let _e233 = u_xlat0_;
    let _e236 = u_xlat0_;
    let _e238 = ((_e231.xyz * _e233.www) + _e236.xyz);
    u_xlat0_.x = _e238.x;
    u_xlat0_.y = _e238.y;
    u_xlat0_.z = _e238.z;
    let _e245 = u_xlat0_;
    let _e250 = _v_buffer1_.v_cb1_[1];
    u_xlat1_ = (_e245.yyyy * _e250);
    let _e255 = _v_buffer1_.v_cb1_[0];
    let _e256 = u_xlat0_;
    let _e259 = u_xlat1_;
    u_xlat1_ = ((_e255 * _e256.xxxx) + _e259);
    let _e264 = _v_buffer1_.v_cb1_[2];
    let _e265 = u_xlat0_;
    let _e268 = u_xlat1_;
    u_xlat0_ = ((_e264 * _e265.zzzz) + _e268);
    let _e270 = u_xlat0_;
    let _e274 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e270 + _e274);
    let _e276 = u_xlat0_;
    let _e281 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e276.yyyy * _e281);
    let _e286 = _v_buffer0_.v_cb0_[79];
    let _e287 = u_xlat0_;
    let _e290 = u_xlat1_;
    u_xlat1_ = ((_e286 * _e287.xxxx) + _e290);
    let _e295 = _v_buffer0_.v_cb0_[81];
    let _e296 = u_xlat0_;
    let _e299 = u_xlat1_;
    u_xlat1_ = ((_e295 * _e296.zzzz) + _e299);
    let _e305 = _v_buffer0_.v_cb0_[82];
    let _e306 = u_xlat0_;
    let _e309 = u_xlat1_;
    gl_Position = ((_e305 * _e306.wwww) + _e309);
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    main_1();
    let _e18 = gl_Position;
    return VertexOutput(_e18);
}
