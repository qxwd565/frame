struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 12>,
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
@group(3) @binding(5) 
var samplerf_s2_: sampler;
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
@group(3) @binding(4) 
var f_t2_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec4<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: f32 = 0f;
    var u_xlat6_: vec2<f32> = vec2(0f);

    let _e37 = vs_TEXCOORD0_1;
    u_xlat0_ = _e37.zwxy;
    let _e39 = u_xlat0_;
    u_xlat0_ = clamp(_e39, vec4(0f), vec4(1f));
    let _e45 = u_xlat0_;
    let _e46 = vs_TEXCOORD0_1;
    u_xlat0_ = (_e45 + -(_e46.zwxy));
    let _e50 = u_xlat6_;
    let _e55 = _f_buffer1_.f_cb1_[3];
    let _e57 = u_xlat0_;
    let _e60 = vs_TEXCOORD0_1;
    let _e62 = ((_e55.zz * _e57.zw) + _e60.xy);
    u_xlat6_.x = _e62.x;
    u_xlat6_.y = _e62.y;
    let _e67 = u_xlat0_;
    let _e72 = _f_buffer1_.f_cb1_[6];
    let _e74 = u_xlat0_;
    let _e77 = vs_TEXCOORD0_1;
    let _e79 = ((_e72.xx * _e74.xy) + _e77.zw);
    u_xlat0_.x = _e79.x;
    u_xlat0_.y = _e79.y;
    let _e84 = u_xlat0_;
    let _e89 = _f_buffer0_.f_cb0_[4];
    let _e94 = hscard_bias.values[1];
    let _e97 = textureSampleBias(f_t1_, samplerf_s1_, _e84.xy, (_e89.x + _e94.x));
    u_xlat1_ = _e97;
    let _e99 = u_xlat1_;
    u_xlat0_.x = (_e99.x + -1f);
    let _e108 = _f_buffer1_.f_cb1_[7];
    let _e110 = u_xlat0_;
    u_xlat0_.x = ((_e108.w * _e110.x) + 1f);
    let _e115 = u_xlat6_;
    let _e120 = _f_buffer0_.f_cb0_[4];
    let _e125 = hscard_bias.values[0];
    let _e128 = textureSampleBias(f_t0_, samplerf_s0_, _e115.xy, (_e120.x + _e125.x));
    u_xlat1_ = _e128.yzwx;
    let _e130 = u_xlat1_;
    let _e135 = _f_buffer1_.f_cb1_[2];
    u_xlat3_ = (_e130.w + _e135.y);
    let _e139 = u_xlat1_;
    let _e144 = _f_buffer1_.f_cb1_[3];
    u_xlat6_.x = max(_e139.w, _e144.y);
    let _e148 = u_xlat6_;
    let _e150 = u_xlat3_;
    u_xlat2_.x = (_e148.x * _e150);
    let _e156 = _f_buffer1_.f_cb1_[11];
    u_xlat2_.y = ((_e156.x * 0.03125f) + 0.015625f);
    let _e162 = u_xlat2_;
    let _e167 = _f_buffer0_.f_cb0_[4];
    let _e172 = hscard_bias.values[2];
    let _e175 = textureSampleBias(f_t2_, samplerf_s2_, _e162.xy, (_e167.x + _e172.x));
    u_xlat2_ = _e175;
    let _e176 = u_xlat1_;
    let _e178 = u_xlat2_;
    let _e183 = _f_buffer1_.f_cb1_[2];
    let _e185 = (_e178.xyz * _e183.xxx);
    u_xlat1_.x = _e185.x;
    u_xlat1_.y = _e185.y;
    u_xlat1_.z = _e185.z;
    let _e192 = u_xlat0_;
    let _e194 = u_xlat1_;
    u_xlat0_ = (_e192.xxxx * _e194);
    let _e196 = u_xlat0_;
    let _e197 = vs_COLOR0_1;
    SV_Target0_ = (_e196 * _e197);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e32 = SV_Target0_;
    return FragmentOutput(_e32);
}
