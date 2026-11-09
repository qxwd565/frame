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
    v_cb3_: array<vec4<f32>, 6>,
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
@group(0) @binding(3) 
var<uniform> _v_buffer3_: v_buffer3_;
var<private> in_POSITION0_1: vec4<f32>;
var<private> in_TEXCOORD0_1: vec2<f32>;
var<private> in_COLOR0_1: vec4<f32>;
var<private> vs_TEXCOORD0_: vec2<f32>;
var<private> vs_TEXCOORD1_: vec2<f32>;
var<private> vs_COLOR0_: vec4<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);

    let _e26 = in_POSITION0_1;
    let _e31 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e26.yyyy * _e31);
    let _e36 = _v_buffer1_.v_cb1_[0];
    let _e37 = in_POSITION0_1;
    let _e40 = u_xlat0_;
    u_xlat0_ = ((_e36 * _e37.xxxx) + _e40);
    let _e45 = _v_buffer1_.v_cb1_[2];
    let _e46 = in_POSITION0_1;
    let _e49 = u_xlat0_;
    u_xlat0_ = ((_e45 * _e46.zzzz) + _e49);
    let _e51 = u_xlat0_;
    let _e55 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e51 + _e55);
    let _e57 = u_xlat0_;
    let _e62 = _v_buffer2_.v_cb2_[18];
    u_xlat1_ = (_e57.yyyy * _e62);
    let _e67 = _v_buffer2_.v_cb2_[17];
    let _e68 = u_xlat0_;
    let _e71 = u_xlat1_;
    u_xlat1_ = ((_e67 * _e68.xxxx) + _e71);
    let _e76 = _v_buffer2_.v_cb2_[19];
    let _e77 = u_xlat0_;
    let _e80 = u_xlat1_;
    u_xlat1_ = ((_e76 * _e77.zzzz) + _e80);
    let _e86 = _v_buffer2_.v_cb2_[20];
    let _e87 = u_xlat0_;
    let _e90 = u_xlat1_;
    gl_Position = ((_e86 * _e87.wwww) + _e90);
    let _e92 = vs_TEXCOORD0_;
    let _e94 = in_TEXCOORD0_1;
    let _e99 = _v_buffer3_.v_cb3_[0];
    let _e105 = _v_buffer3_.v_cb3_[0];
    let _e107 = ((_e94.xy * _e99.xy) + _e105.zw);
    vs_TEXCOORD0_.x = _e107.x;
    vs_TEXCOORD0_.y = _e107.y;
    let _e112 = vs_TEXCOORD1_;
    let _e114 = in_POSITION0_1;
    let _e119 = _v_buffer3_.v_cb3_[1];
    let _e121 = (_e114.xz * _e119.xx);
    vs_TEXCOORD1_.x = _e121.x;
    vs_TEXCOORD1_.y = _e121.y;
    let _e129 = _v_buffer2_.v_cb2_[0];
    let _e139 = _v_buffer0_.v_cb0_[2];
    u_xlat0_ = ((_e129 * vec4<f32>(2f, 2f, 2f, 2f)) + _e139);
    let _e141 = u_xlat0_;
    let _e142 = in_COLOR0_1;
    u_xlat0_ = (_e141 + -(_e142));
    let _e148 = _v_buffer3_.v_cb3_[5];
    let _e150 = u_xlat0_;
    let _e152 = in_COLOR0_1;
    vs_COLOR0_ = ((_e148.xxxx * _e150) + _e152);
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(3) in_COLOR0_: vec4<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_COLOR0_1 = in_COLOR0_;
    main_1();
    let _e31 = vs_TEXCOORD0_;
    let _e33 = vs_TEXCOORD1_;
    let _e35 = vs_COLOR0_;
    let _e37 = gl_Position;
    return VertexOutput(_e31, _e33, _e35, _e37);
}
