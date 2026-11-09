struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 11>,
}

struct v_buffer1_ {
    v_cb1_: vec4<f32>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 4>,
}

struct v_buffer3_ {
    v_cb3_: array<vec4<f32>, 21>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec2<f32>,
    @location(1) vs_TEXCOORD1_: vec2<f32>,
    @location(2) vs_TEXCOORD2_: vec2<f32>,
    @location(3) vs_TEXCOORD3_: vec2<f32>,
    @location(10) vs_COLOR0_: vec4<f32>,
    @builtin(position) gl_Position: vec4<f32>,
}

@group(0) @binding(0) 
var<uniform> _v_buffer0_: v_buffer0_;
@group(0) @binding(1) 
var<uniform> _v_buffer1_: v_buffer1_;
@group(0) @binding(2) 
var<uniform> _v_buffer2_: v_buffer2_;
@group(0) @binding(3) 
var<uniform> _v_buffer3_: v_buffer3_;
var<private> in_POSITION0_1: vec4<f32>;
var<private> in_TEXCOORD0_1: vec2<f32>;
var<private> in_TEXCOORD1_1: vec2<f32>;
var<private> in_COLOR0_1: vec4<f32>;
var<private> vs_TEXCOORD0_: vec2<f32>;
var<private> vs_TEXCOORD1_: vec2<f32>;
var<private> vs_TEXCOORD2_: vec2<f32>;
var<private> vs_TEXCOORD3_: vec2<f32>;
var<private> vs_COLOR0_: vec4<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);

    let _e29 = in_POSITION0_1;
    let _e34 = _v_buffer2_.v_cb2_[1];
    u_xlat0_ = (_e29.yyyy * _e34);
    let _e39 = _v_buffer2_.v_cb2_[0];
    let _e40 = in_POSITION0_1;
    let _e43 = u_xlat0_;
    u_xlat0_ = ((_e39 * _e40.xxxx) + _e43);
    let _e48 = _v_buffer2_.v_cb2_[2];
    let _e49 = in_POSITION0_1;
    let _e52 = u_xlat0_;
    u_xlat0_ = ((_e48 * _e49.zzzz) + _e52);
    let _e54 = u_xlat0_;
    let _e58 = _v_buffer2_.v_cb2_[3];
    u_xlat0_ = (_e54 + _e58);
    let _e60 = u_xlat0_;
    let _e65 = _v_buffer3_.v_cb3_[18];
    u_xlat1_ = (_e60.yyyy * _e65);
    let _e70 = _v_buffer3_.v_cb3_[17];
    let _e71 = u_xlat0_;
    let _e74 = u_xlat1_;
    u_xlat1_ = ((_e70 * _e71.xxxx) + _e74);
    let _e79 = _v_buffer3_.v_cb3_[19];
    let _e80 = u_xlat0_;
    let _e83 = u_xlat1_;
    u_xlat1_ = ((_e79 * _e80.zzzz) + _e83);
    let _e89 = _v_buffer3_.v_cb3_[20];
    let _e90 = u_xlat0_;
    let _e93 = u_xlat1_;
    gl_Position = ((_e89 * _e90.wwww) + _e93);
    let _e95 = u_xlat0_;
    let _e100 = _v_buffer0_.v_cb0_[4];
    let _e102 = _v_buffer1_;
    let _e106 = in_TEXCOORD0_1;
    let _e108 = ((_e100.xy * _e102.v_cb1_.xx) + _e106.xy);
    u_xlat0_.x = _e108.x;
    u_xlat0_.y = _e108.y;
    let _e113 = vs_TEXCOORD1_;
    let _e115 = u_xlat0_;
    let _e120 = _v_buffer0_.v_cb0_[4];
    let _e122 = (_e115.xy * _e120.zz);
    vs_TEXCOORD1_.x = _e122.x;
    vs_TEXCOORD1_.y = _e122.y;
    let _e127 = vs_TEXCOORD0_;
    let _e129 = in_TEXCOORD0_1;
    let _e134 = _v_buffer0_.v_cb0_[10];
    let _e140 = _v_buffer0_.v_cb0_[10];
    let _e142 = ((_e129.xy * _e134.xy) + _e140.zw);
    vs_TEXCOORD0_.x = _e142.x;
    vs_TEXCOORD0_.y = _e142.y;
    let _e147 = u_xlat0_;
    let _e152 = _v_buffer0_.v_cb0_[6];
    let _e154 = _v_buffer1_;
    let _e158 = in_TEXCOORD0_1;
    let _e160 = ((_e152.zw * _e154.v_cb1_.xx) + _e158.xy);
    u_xlat0_.x = _e160.x;
    u_xlat0_.y = _e160.y;
    let _e165 = vs_TEXCOORD2_;
    let _e167 = u_xlat0_;
    let _e172 = _v_buffer0_.v_cb0_[7];
    let _e174 = (_e167.xy * _e172.xx);
    vs_TEXCOORD2_.x = _e174.x;
    vs_TEXCOORD2_.y = _e174.y;
    let _e179 = vs_TEXCOORD3_;
    let _e181 = in_TEXCOORD1_1;
    let _e186 = _v_buffer0_.v_cb0_[10];
    let _e192 = _v_buffer0_.v_cb0_[10];
    let _e194 = ((_e181.xy * _e186.xy) + _e192.zw);
    vs_TEXCOORD3_.x = _e194.x;
    vs_TEXCOORD3_.y = _e194.y;
    let _e202 = _v_buffer3_.v_cb3_[0];
    let _e212 = _v_buffer0_.v_cb0_[2];
    u_xlat0_ = ((_e202 * vec4<f32>(2f, 2f, 2f, 2f)) + _e212);
    let _e214 = u_xlat0_;
    let _e215 = in_COLOR0_1;
    u_xlat0_ = (_e214 + -(_e215));
    let _e221 = _v_buffer0_.v_cb0_[9];
    let _e223 = u_xlat0_;
    let _e225 = in_COLOR0_1;
    vs_COLOR0_ = ((_e221.yyyy * _e223) + _e225);
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(5) in_TEXCOORD1_: vec2<f32>, @location(3) in_COLOR0_: vec4<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_TEXCOORD1_1 = in_TEXCOORD1_;
    in_COLOR0_1 = in_COLOR0_;
    main_1();
    let _e39 = vs_TEXCOORD0_;
    let _e41 = vs_TEXCOORD1_;
    let _e43 = vs_TEXCOORD2_;
    let _e45 = vs_TEXCOORD3_;
    let _e47 = vs_COLOR0_;
    let _e49 = gl_Position;
    return VertexOutput(_e39, _e41, _e43, _e45, _e47, _e49);
}
