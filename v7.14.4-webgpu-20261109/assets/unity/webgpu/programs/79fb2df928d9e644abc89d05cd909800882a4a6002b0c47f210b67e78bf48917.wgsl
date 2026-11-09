struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 13>,
}

struct FragmentOutput {
    @location(0) SV_Target0_: vec4<f32>,
}

@group(1) @binding(31) 
var<uniform> hscard_bias: HScardSamplerBias;
@group(1) @binding(0) 
var<uniform> _f_buffer0_: f_buffer0_;
@group(1) @binding(1) 
var<uniform> _f_buffer1_: f_buffer1_;
@group(3) @binding(1) 
var samplerf_s0_: sampler;
@group(3) @binding(3) 
var samplerf_s1_: sampler;
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec4<f32>;
var<private> vs_COLOR1_1: vec4<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> vs_TEXCOORD1_1: f32;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: f32 = 0f;
    var u_xlat3_: f32 = 0f;
    var u_xlat6_: vec3<f32> = vec3(0f);
    var u_xlat8_: vec2<f32> = vec2(0f);

    let _e40 = vs_TEXCOORD0_1;
    u_xlat0_ = _e40.zwxy;
    let _e42 = u_xlat0_;
    u_xlat0_ = clamp(_e42, vec4(0f), vec4(1f));
    let _e48 = u_xlat0_;
    let _e49 = vs_TEXCOORD0_1;
    u_xlat0_ = (_e48 + -(_e49.zwxy));
    let _e53 = u_xlat0_;
    let _e58 = _f_buffer1_.f_cb1_[6];
    let _e60 = u_xlat0_;
    let _e63 = vs_TEXCOORD0_1;
    let _e65 = ((_e58.xx * _e60.xy) + _e63.zw);
    u_xlat0_.x = _e65.x;
    u_xlat0_.y = _e65.y;
    let _e70 = u_xlat8_;
    let _e75 = _f_buffer1_.f_cb1_[3];
    let _e77 = u_xlat0_;
    let _e80 = vs_TEXCOORD0_1;
    let _e82 = ((_e75.zz * _e77.zw) + _e80.xy);
    u_xlat8_.x = _e82.x;
    u_xlat8_.y = _e82.y;
    let _e87 = u_xlat8_;
    let _e92 = _f_buffer0_.f_cb0_[4];
    let _e97 = hscard_bias.values[0];
    let _e100 = textureSampleBias(f_t0_, samplerf_s0_, _e87.xy, (_e92.x + _e97.x));
    u_xlat1_ = _e100;
    let _e101 = u_xlat0_;
    let _e106 = _f_buffer0_.f_cb0_[4];
    let _e111 = hscard_bias.values[1];
    let _e114 = textureSampleBias(f_t1_, samplerf_s1_, _e101.xy, (_e106.x + _e111.x));
    u_xlat0_ = _e114;
    let _e116 = u_xlat0_;
    u_xlat0_.x = dot(_e116.xyz, vec3<f32>(0.299f, 0.587f, 0.114f));
    let _e123 = u_xlat0_;
    let _e125 = vs_COLOR1_1;
    u_xlat0_ = (_e123.xxxx * _e125);
    let _e127 = vs_TEXCOORD1_1;
    let _e131 = _f_buffer1_.f_cb1_[12];
    u_xlat2_ = (_e127 + _e131.z);
    let _e134 = u_xlat2_;
    u_xlat2_ = clamp(_e134, 0f, 1f);
    let _e139 = vs_TEXCOORD1_1;
    let _e143 = _f_buffer1_.f_cb1_[12];
    u_xlat6_.x = (_e139 + -(_e143.z));
    let _e148 = u_xlat6_;
    u_xlat6_.x = clamp(_e148.x, 0f, 1f);
    let _e154 = u_xlat6_;
    u_xlat6_.x = (_e154.x + -0.00001f);
    let _e159 = u_xlat6_;
    let _e162 = u_xlat2_;
    u_xlat2_ = (-(_e159.x) + _e162);
    let _e165 = u_xlat1_;
    let _e167 = u_xlat6_;
    u_xlat6_.x = (_e165.w + -(_e167.x));
    let _e173 = u_xlat2_;
    u_xlat2_ = (1f / _e173);
    let _e175 = u_xlat2_;
    let _e176 = u_xlat6_;
    u_xlat2_ = (_e175 * _e176.x);
    let _e179 = u_xlat2_;
    u_xlat2_ = clamp(_e179, 0f, 1f);
    let _e184 = u_xlat2_;
    u_xlat6_.x = ((_e184 * -2f) + 3f);
    let _e190 = u_xlat2_;
    let _e191 = u_xlat2_;
    u_xlat2_ = (_e190 * _e191);
    let _e193 = u_xlat2_;
    let _e194 = u_xlat6_;
    u_xlat2_ = (_e193 * _e194.x);
    let _e197 = u_xlat6_;
    let _e199 = u_xlat1_;
    let _e204 = _f_buffer1_.f_cb1_[2];
    let _e206 = (_e199.xyz + _e204.yyy);
    u_xlat6_.x = _e206.x;
    u_xlat6_.y = _e206.y;
    u_xlat6_.z = _e206.z;
    let _e213 = u_xlat1_;
    let _e218 = _f_buffer1_.f_cb1_[3];
    u_xlat3_ = max(_e213.w, _e218.y);
    let _e221 = u_xlat6_;
    let _e223 = u_xlat6_;
    let _e225 = u_xlat3_;
    let _e227 = (_e223.xyz * vec3(_e225));
    u_xlat6_.x = _e227.x;
    u_xlat6_.y = _e227.y;
    u_xlat6_.z = _e227.z;
    let _e234 = u_xlat1_;
    let _e236 = u_xlat6_;
    let _e241 = _f_buffer1_.f_cb1_[2];
    let _e243 = (_e236.xyz * _e241.xxx);
    u_xlat1_.x = _e243.x;
    u_xlat1_.y = _e243.y;
    u_xlat1_.z = _e243.z;
    let _e250 = u_xlat1_;
    let _e251 = u_xlat2_;
    let _e254 = u_xlat0_;
    u_xlat0_ = ((_e250 * vec4(_e251)) + _e254);
    let _e256 = u_xlat0_;
    let _e257 = vs_COLOR0_1;
    SV_Target0_ = (_e256 * _e257);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(11) vs_COLOR1_: vec4<f32>, @location(10) vs_COLOR0_: vec4<f32>, @location(1) vs_TEXCOORD1_: f32) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_COLOR1_1 = vs_COLOR1_;
    vs_COLOR0_1 = vs_COLOR0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    main_1();
    let _e36 = SV_Target0_;
    return FragmentOutput(_e36);
}
