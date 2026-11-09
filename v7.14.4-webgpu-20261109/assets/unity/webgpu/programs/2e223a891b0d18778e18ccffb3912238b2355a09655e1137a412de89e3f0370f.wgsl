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
var<private> vs_COLOR0_1: vec4<f32>;
var<private> vs_TEXCOORD1_1: f32;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: f32 = 0f;
    var u_xlat4_: vec2<f32> = vec2(0f);

    let _e32 = vs_TEXCOORD0_1;
    u_xlat0_ = _e32.zwxy;
    let _e34 = u_xlat0_;
    u_xlat0_ = clamp(_e34, vec4(0f), vec4(1f));
    let _e40 = u_xlat0_;
    let _e41 = vs_TEXCOORD0_1;
    u_xlat0_ = (_e40 + -(_e41.zwxy));
    let _e45 = u_xlat0_;
    let _e50 = _f_buffer1_.f_cb1_[6];
    let _e52 = u_xlat0_;
    let _e55 = vs_TEXCOORD0_1;
    let _e57 = ((_e50.xx * _e52.xy) + _e55.zw);
    u_xlat0_.x = _e57.x;
    u_xlat0_.y = _e57.y;
    let _e62 = u_xlat4_;
    let _e67 = _f_buffer1_.f_cb1_[3];
    let _e69 = u_xlat0_;
    let _e72 = vs_TEXCOORD0_1;
    let _e74 = ((_e67.zz * _e69.zw) + _e72.xy);
    u_xlat4_.x = _e74.x;
    u_xlat4_.y = _e74.y;
    let _e79 = u_xlat4_;
    let _e84 = _f_buffer0_.f_cb0_[4];
    let _e89 = hscard_bias.values[0];
    let _e92 = textureSampleBias(f_t0_, samplerf_s0_, _e79.xy, (_e84.x + _e89.x));
    u_xlat1_ = _e92;
    let _e93 = u_xlat0_;
    let _e98 = _f_buffer0_.f_cb0_[4];
    let _e103 = hscard_bias.values[1];
    let _e106 = textureSampleBias(f_t1_, samplerf_s1_, _e93.xy, (_e98.x + _e103.x));
    u_xlat0_ = _e106;
    let _e108 = u_xlat0_;
    u_xlat0_.x = (_e108.w + -1f);
    let _e117 = _f_buffer1_.f_cb1_[7];
    let _e119 = u_xlat0_;
    u_xlat0_.x = ((_e117.w * _e119.x) + 1f);
    let _e124 = vs_TEXCOORD1_1;
    let _e128 = _f_buffer1_.f_cb1_[12];
    u_xlat2_ = (_e124 + _e128.z);
    let _e131 = u_xlat2_;
    u_xlat2_ = clamp(_e131, 0f, 1f);
    let _e136 = vs_TEXCOORD1_1;
    let _e140 = _f_buffer1_.f_cb1_[12];
    u_xlat4_.x = (_e136 + -(_e140.z));
    let _e145 = u_xlat4_;
    u_xlat4_.x = clamp(_e145.x, 0f, 1f);
    let _e151 = u_xlat4_;
    u_xlat4_.x = (_e151.x + -0.00001f);
    let _e156 = u_xlat4_;
    let _e159 = u_xlat2_;
    u_xlat2_ = (-(_e156.x) + _e159);
    let _e162 = u_xlat4_;
    let _e165 = u_xlat1_;
    u_xlat4_.x = (-(_e162.x) + _e165.w);
    let _e170 = u_xlat2_;
    u_xlat2_ = (1f / _e170);
    let _e172 = u_xlat2_;
    let _e173 = u_xlat4_;
    u_xlat2_ = (_e172 * _e173.x);
    let _e176 = u_xlat2_;
    u_xlat2_ = clamp(_e176, 0f, 1f);
    let _e181 = u_xlat2_;
    u_xlat4_.x = ((_e181 * -2f) + 3f);
    let _e187 = u_xlat2_;
    let _e188 = u_xlat2_;
    u_xlat2_ = (_e187 * _e188);
    let _e190 = u_xlat2_;
    let _e191 = u_xlat4_;
    u_xlat2_ = (_e190 * _e191.x);
    let _e195 = u_xlat0_;
    let _e197 = u_xlat2_;
    u_xlat0_.x = (_e195.x * _e197);
    let _e199 = u_xlat1_;
    let _e204 = _f_buffer1_.f_cb1_[2];
    u_xlat2_ = (_e199.w + _e204.y);
    let _e208 = u_xlat1_;
    let _e213 = _f_buffer1_.f_cb1_[3];
    u_xlat4_.x = max(_e208.w, _e213.y);
    let _e216 = u_xlat4_;
    let _e218 = u_xlat2_;
    u_xlat2_ = (_e216.x * _e218);
    let _e220 = u_xlat1_;
    let _e222 = u_xlat2_;
    let _e227 = _f_buffer1_.f_cb1_[2];
    let _e229 = (vec3(_e222) * _e227.xxx);
    u_xlat1_.x = _e229.x;
    u_xlat1_.y = _e229.y;
    u_xlat1_.z = _e229.z;
    let _e236 = u_xlat0_;
    let _e238 = u_xlat1_;
    u_xlat0_ = (_e236.xxxx * _e238);
    let _e240 = u_xlat0_;
    let _e241 = vs_COLOR0_1;
    SV_Target0_ = (_e240 * _e241);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(10) vs_COLOR0_: vec4<f32>, @location(1) vs_TEXCOORD1_: f32) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_COLOR0_1 = vs_COLOR0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    main_1();
    let _e32 = SV_Target0_;
    return FragmentOutput(_e32);
}
