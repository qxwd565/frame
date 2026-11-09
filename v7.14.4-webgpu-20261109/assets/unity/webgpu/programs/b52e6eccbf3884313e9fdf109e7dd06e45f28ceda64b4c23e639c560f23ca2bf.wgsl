struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 4>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 3>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec2<f32>,
    @location(1) vs_TEXCOORD1_: vec2<f32>,
    @location(2) vs_TEXCOORD2_: vec2<f32>,
    @location(3) vs_TEXCOORD3_: vec2<f32>,
    @location(4) vs_TEXCOORD4_: vec2<f32>,
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
var<private> vs_TEXCOORD1_: vec2<f32>;
var<private> vs_TEXCOORD2_: vec2<f32>;
var<private> vs_TEXCOORD3_: vec2<f32>;
var<private> vs_TEXCOORD4_: vec2<f32>;
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
    let _e62 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e57.yyyy * _e62);
    let _e67 = _v_buffer0_.v_cb0_[79];
    let _e68 = u_xlat0_;
    let _e71 = u_xlat1_;
    u_xlat1_ = ((_e67 * _e68.xxxx) + _e71);
    let _e76 = _v_buffer0_.v_cb0_[81];
    let _e77 = u_xlat0_;
    let _e80 = u_xlat1_;
    u_xlat1_ = ((_e76 * _e77.zzzz) + _e80);
    let _e86 = _v_buffer0_.v_cb0_[82];
    let _e87 = u_xlat0_;
    let _e90 = u_xlat1_;
    gl_Position = ((_e86 * _e87.wwww) + _e90);
    let _e92 = vs_TEXCOORD0_;
    let _e94 = in_TEXCOORD0_1;
    let _e99 = _v_buffer2_.v_cb2_[0];
    let _e105 = _v_buffer2_.v_cb2_[0];
    let _e107 = ((_e94.xy * _e99.xy) + _e105.zw);
    vs_TEXCOORD0_.x = _e107.x;
    vs_TEXCOORD0_.y = _e107.y;
    let _e112 = u_xlat0_;
    let _e114 = in_TEXCOORD0_1;
    let _e119 = _v_buffer2_.v_cb2_[2];
    let _e121 = (_e114.xy + _e119.xy);
    u_xlat0_.x = _e121.x;
    u_xlat0_.y = _e121.y;
    let _e126 = vs_TEXCOORD1_;
    let _e128 = u_xlat0_;
    let _e133 = _v_buffer2_.v_cb2_[0];
    let _e139 = _v_buffer2_.v_cb2_[0];
    let _e141 = ((_e128.xy * _e133.xy) + _e139.zw);
    vs_TEXCOORD1_.x = _e141.x;
    vs_TEXCOORD1_.y = _e141.y;
    let _e146 = u_xlat0_;
    let _e148 = in_TEXCOORD0_1;
    let _e153 = _v_buffer2_.v_cb2_[2];
    let _e156 = (_e148.xy + -(_e153.xy));
    u_xlat0_.z = _e156.x;
    u_xlat0_.w = _e156.y;
    let _e161 = vs_TEXCOORD2_;
    let _e163 = u_xlat0_;
    let _e168 = _v_buffer2_.v_cb2_[0];
    let _e174 = _v_buffer2_.v_cb2_[0];
    let _e176 = ((_e163.zw * _e168.xy) + _e174.zw);
    vs_TEXCOORD2_.x = _e176.x;
    vs_TEXCOORD2_.y = _e176.y;
    let _e181 = vs_TEXCOORD3_;
    let _e183 = u_xlat0_;
    let _e188 = _v_buffer2_.v_cb2_[0];
    let _e194 = _v_buffer2_.v_cb2_[0];
    let _e196 = ((_e183.xw * _e188.xy) + _e194.zw);
    vs_TEXCOORD3_.x = _e196.x;
    vs_TEXCOORD3_.y = _e196.y;
    let _e201 = vs_TEXCOORD4_;
    let _e203 = u_xlat0_;
    let _e208 = _v_buffer2_.v_cb2_[0];
    let _e214 = _v_buffer2_.v_cb2_[0];
    let _e216 = ((_e203.zy * _e208.xy) + _e214.zw);
    vs_TEXCOORD4_.x = _e216.x;
    vs_TEXCOORD4_.y = _e216.y;
    let _e221 = in_COLOR0_1;
    let _e225 = _v_buffer2_.v_cb2_[1];
    vs_COLOR0_ = (_e221 * _e225);
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(3) in_COLOR0_: vec4<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_COLOR0_1 = in_COLOR0_;
    main_1();
    let _e34 = vs_TEXCOORD0_;
    let _e36 = vs_TEXCOORD1_;
    let _e38 = vs_TEXCOORD2_;
    let _e40 = vs_TEXCOORD3_;
    let _e42 = vs_TEXCOORD4_;
    let _e44 = vs_COLOR0_;
    let _e46 = gl_Position;
    return VertexOutput(_e34, _e36, _e38, _e40, _e42, _e44, _e46);
}
