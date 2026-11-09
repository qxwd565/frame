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
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD1_1: f32;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: f32 = 0f;
    var u_xlat6_: vec2<f32> = vec2(0f);

    let _e37 = vs_TEXCOORD1_1;
    let _e41 = _f_buffer1_.f_cb1_[12];
    u_xlat0_.x = (_e37 + _e41.z);
    let _e45 = u_xlat0_;
    u_xlat0_.x = clamp(_e45.x, 0f, 1f);
    let _e50 = vs_TEXCOORD1_1;
    let _e54 = _f_buffer1_.f_cb1_[12];
    u_xlat3_ = (_e50 + -(_e54.z));
    let _e58 = u_xlat3_;
    u_xlat3_ = clamp(_e58, 0f, 1f);
    let _e62 = u_xlat3_;
    u_xlat3_ = (_e62 + -0.00001f);
    let _e67 = u_xlat3_;
    let _e69 = u_xlat0_;
    u_xlat0_.x = (-(_e67) + _e69.x);
    let _e75 = u_xlat0_;
    u_xlat0_.x = (1f / _e75.x);
    let _e78 = u_xlat6_;
    let _e80 = vs_TEXCOORD0_1;
    let _e81 = _e80.xy;
    u_xlat6_.x = _e81.x;
    u_xlat6_.y = _e81.y;
    let _e86 = u_xlat6_;
    let _e88 = u_xlat6_;
    let _e94 = clamp(_e88.xy, vec2(0f), vec2(1f));
    u_xlat6_.x = _e94.x;
    u_xlat6_.y = _e94.y;
    let _e99 = u_xlat6_;
    let _e101 = u_xlat6_;
    let _e103 = vs_TEXCOORD0_1;
    let _e106 = (_e101.xy + -(_e103.xy));
    u_xlat6_.x = _e106.x;
    u_xlat6_.y = _e106.y;
    let _e111 = u_xlat6_;
    let _e116 = _f_buffer1_.f_cb1_[3];
    let _e118 = u_xlat6_;
    let _e121 = vs_TEXCOORD0_1;
    let _e123 = ((_e116.zz * _e118.xy) + _e121.xy);
    u_xlat6_.x = _e123.x;
    u_xlat6_.y = _e123.y;
    let _e128 = u_xlat6_;
    let _e133 = _f_buffer0_.f_cb0_[4];
    let _e138 = hscard_bias.values[0];
    let _e141 = textureSampleBias(f_t0_, samplerf_s0_, _e128.xy, (_e133.x + _e138.x));
    u_xlat1_ = _e141.yzwx;
    let _e143 = u_xlat3_;
    let _e145 = u_xlat1_;
    u_xlat3_ = (-(_e143) + _e145.w);
    let _e149 = u_xlat0_;
    let _e151 = u_xlat3_;
    u_xlat0_.x = (_e149.x * _e151);
    let _e154 = u_xlat0_;
    u_xlat0_.x = clamp(_e154.x, 0f, 1f);
    let _e159 = u_xlat0_;
    u_xlat3_ = ((_e159.x * -2f) + 3f);
    let _e167 = u_xlat0_;
    let _e169 = u_xlat0_;
    u_xlat0_.x = (_e167.x * _e169.x);
    let _e173 = u_xlat0_;
    let _e175 = u_xlat3_;
    u_xlat0_.x = (_e173.x * _e175);
    let _e177 = u_xlat1_;
    let _e182 = _f_buffer1_.f_cb1_[2];
    u_xlat3_ = (_e177.w + _e182.y);
    let _e186 = u_xlat1_;
    let _e191 = _f_buffer1_.f_cb1_[3];
    u_xlat6_.x = max(_e186.w, _e191.y);
    let _e195 = u_xlat6_;
    let _e197 = u_xlat3_;
    u_xlat2_.x = (_e195.x * _e197);
    let _e203 = _f_buffer1_.f_cb1_[11];
    u_xlat2_.y = ((_e203.x * 0.03125f) + 0.015625f);
    let _e209 = u_xlat2_;
    let _e214 = _f_buffer0_.f_cb0_[4];
    let _e219 = hscard_bias.values[1];
    let _e222 = textureSampleBias(f_t1_, samplerf_s1_, _e209.xy, (_e214.x + _e219.x));
    u_xlat2_ = _e222;
    let _e223 = u_xlat1_;
    let _e225 = u_xlat2_;
    let _e230 = _f_buffer1_.f_cb1_[2];
    let _e232 = (_e225.xyz * _e230.xxx);
    u_xlat1_.x = _e232.x;
    u_xlat1_.y = _e232.y;
    u_xlat1_.z = _e232.z;
    let _e239 = u_xlat0_;
    let _e241 = u_xlat1_;
    u_xlat0_ = (_e239.xxxx * _e241);
    let _e243 = u_xlat0_;
    let _e244 = vs_COLOR0_1;
    SV_Target0_ = (_e243 * _e244);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: f32, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e32 = SV_Target0_;
    return FragmentOutput(_e32);
}
