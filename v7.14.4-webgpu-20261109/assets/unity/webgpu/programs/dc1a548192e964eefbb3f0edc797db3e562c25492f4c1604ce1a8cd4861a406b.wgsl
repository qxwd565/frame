struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 3>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 4>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 21>,
}

struct v_buffer3_ {
    v_cb3_: array<vec4<f32>, 10>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec2<f32>,
    @location(1) vs_TEXCOORD1_: vec2<f32>,
    @location(2) vs_TEXCOORD2_: vec4<f32>,
    @location(3) vs_TEXCOORD3_: vec4<f32>,
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
var<private> in_COLOR0_1: vec4<f32>;
var<private> vs_TEXCOORD0_: vec2<f32>;
var<private> vs_TEXCOORD1_: vec2<f32>;
var<private> vs_TEXCOORD2_: vec4<f32>;
var<private> vs_TEXCOORD3_: vec4<f32>;
var<private> vs_COLOR0_: vec4<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);

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
    let _e64 = _v_buffer2_.v_cb2_[18];
    u_xlat1_ = (_e59.yyyy * _e64);
    let _e69 = _v_buffer2_.v_cb2_[17];
    let _e70 = u_xlat0_;
    let _e73 = u_xlat1_;
    u_xlat1_ = ((_e69 * _e70.xxxx) + _e73);
    let _e78 = _v_buffer2_.v_cb2_[19];
    let _e79 = u_xlat0_;
    let _e82 = u_xlat1_;
    u_xlat1_ = ((_e78 * _e79.zzzz) + _e82);
    let _e88 = _v_buffer2_.v_cb2_[20];
    let _e89 = u_xlat0_;
    let _e92 = u_xlat1_;
    gl_Position = ((_e88 * _e89.wwww) + _e92);
    let _e94 = vs_TEXCOORD1_;
    let _e96 = in_POSITION0_1;
    let _e101 = _v_buffer3_.v_cb3_[2];
    let _e103 = (_e96.xz * _e101.xx);
    vs_TEXCOORD1_.x = _e103.x;
    vs_TEXCOORD1_.y = _e103.y;
    let _e108 = u_xlat0_;
    let _e110 = in_TEXCOORD0_1;
    let _e115 = _v_buffer3_.v_cb3_[0];
    let _e121 = _v_buffer3_.v_cb3_[0];
    let _e123 = ((_e110.xy * _e115.xy) + _e121.zw);
    u_xlat0_.x = _e123.x;
    u_xlat0_.y = _e123.y;
    let _e128 = vs_TEXCOORD0_;
    let _e130 = u_xlat0_;
    let _e131 = _e130.xy;
    vs_TEXCOORD0_.x = _e131.x;
    vs_TEXCOORD0_.y = _e131.y;
    let _e136 = u_xlat1_;
    let _e141 = _v_buffer3_.v_cb3_[1];
    let _e146 = _v_buffer3_.v_cb3_[7];
    let _e149 = u_xlat0_;
    let _e151 = ((_e141.xy * _e146.xx) + _e149.xy);
    u_xlat1_.x = _e151.x;
    u_xlat1_.w = _e151.y;
    let _e156 = u_xlat1_;
    let _e161 = _v_buffer3_.v_cb3_[1];
    let _e167 = _v_buffer3_.v_cb3_[7];
    let _e170 = u_xlat0_;
    let _e172 = ((-(_e161.yx) * _e167.xx) + _e170.yx);
    u_xlat1_.y = _e172.x;
    u_xlat1_.z = _e172.y;
    let _e177 = u_xlat1_;
    vs_TEXCOORD2_ = _e177.xwzy;
    let _e179 = u_xlat1_;
    vs_TEXCOORD3_ = _e179;
    let _e183 = _v_buffer2_.v_cb2_[0];
    let _e193 = _v_buffer0_.v_cb0_[2];
    u_xlat0_ = ((_e183 * vec4<f32>(2f, 2f, 2f, 2f)) + _e193);
    let _e195 = u_xlat0_;
    let _e196 = in_COLOR0_1;
    u_xlat0_ = (_e195 + -(_e196));
    let _e202 = _v_buffer3_.v_cb3_[9];
    let _e204 = u_xlat0_;
    let _e206 = in_COLOR0_1;
    vs_COLOR0_ = ((_e202.xxxx * _e204) + _e206);
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(3) in_COLOR0_: vec4<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_COLOR0_1 = in_COLOR0_;
    main_1();
    let _e35 = vs_TEXCOORD0_;
    let _e37 = vs_TEXCOORD1_;
    let _e39 = vs_TEXCOORD2_;
    let _e41 = vs_TEXCOORD3_;
    let _e43 = vs_COLOR0_;
    let _e45 = gl_Position;
    return VertexOutput(_e35, _e37, _e39, _e41, _e43, _e45);
}
