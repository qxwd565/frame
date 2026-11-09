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
var<private> vs_COLOR0_: vec4<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat4_: vec2<f32> = vec2(0f);

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
    let _e92 = u_xlat0_;
    let _e94 = in_TEXCOORD0_1;
    let _e99 = _v_buffer2_.v_cb2_[1];
    let _e105 = _v_buffer2_.v_cb2_[1];
    let _e107 = ((_e94.xy * _e99.xy) + _e105.zw);
    u_xlat0_.x = _e107.x;
    u_xlat0_.y = _e107.y;
    let _e112 = u_xlat4_;
    let _e114 = u_xlat0_;
    let _e117 = u_xlat0_;
    let _e119 = (-(_e114.xy) + _e117.yx);
    u_xlat4_.x = _e119.x;
    u_xlat4_.y = _e119.y;
    let _e124 = vs_TEXCOORD0_;
    let _e129 = _v_buffer2_.v_cb2_[2];
    let _e131 = u_xlat4_;
    let _e134 = u_xlat0_;
    let _e136 = ((_e129.zz * _e131.xy) + _e134.xy);
    vs_TEXCOORD0_.x = _e136.x;
    vs_TEXCOORD0_.y = _e136.y;
    let _e141 = in_COLOR0_1;
    let _e145 = _v_buffer2_.v_cb2_[0];
    u_xlat0_ = (_e141 * _e145);
    let _e148 = u_xlat0_;
    let _e150 = u_xlat0_;
    u_xlat1_.x = max(_e148.y, _e150.x);
    let _e154 = u_xlat0_;
    let _e156 = u_xlat1_;
    u_xlat1_.x = max(_e154.z, _e156.x);
    let _e160 = u_xlat1_;
    u_xlat1_.x = ((_e160.x * 2f) + -1f);
    let _e168 = u_xlat1_;
    u_xlat1_.x = clamp(_e168.x, 0f, 1f);
    let _e174 = u_xlat1_;
    u_xlat1_.w = (-(_e174.x) + 1f);
    let _e179 = u_xlat1_;
    let _e181 = u_xlat0_;
    let _e183 = u_xlat0_;
    let _e185 = (_e181.xyz + _e183.xyz);
    u_xlat1_.x = _e185.x;
    u_xlat1_.y = _e185.y;
    u_xlat1_.z = _e185.z;
    let _e193 = u_xlat0_;
    let _e198 = _v_buffer2_.v_cb2_[2];
    u_xlat0_.x = (_e193.w * _e198.w);
    let _e201 = u_xlat0_;
    let _e203 = u_xlat1_;
    vs_COLOR0_ = (_e201.xxxx * _e203);
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
