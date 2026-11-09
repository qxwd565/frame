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

    let _e33 = vs_TEXCOORD1_1;
    let _e37 = _f_buffer1_.f_cb1_[12];
    u_xlat0_.x = (_e33 + _e37.z);
    let _e41 = u_xlat0_;
    u_xlat0_.x = clamp(_e41.x, 0f, 1f);
    let _e46 = vs_TEXCOORD1_1;
    let _e50 = _f_buffer1_.f_cb1_[12];
    u_xlat2_ = (_e46 + -(_e50.z));
    let _e54 = u_xlat2_;
    u_xlat2_ = clamp(_e54, 0f, 1f);
    let _e58 = u_xlat2_;
    u_xlat2_ = (_e58 + -0.00001f);
    let _e63 = u_xlat2_;
    let _e65 = u_xlat0_;
    u_xlat0_.x = (-(_e63) + _e65.x);
    let _e71 = u_xlat0_;
    u_xlat0_.x = (1f / _e71.x);
    let _e74 = u_xlat4_;
    let _e76 = vs_TEXCOORD0_1;
    let _e77 = _e76.zw;
    u_xlat4_.x = _e77.x;
    u_xlat4_.y = _e77.y;
    let _e82 = u_xlat4_;
    let _e84 = u_xlat4_;
    let _e90 = clamp(_e84.xy, vec2(0f), vec2(1f));
    u_xlat4_.x = _e90.x;
    u_xlat4_.y = _e90.y;
    let _e95 = u_xlat4_;
    let _e97 = u_xlat4_;
    let _e99 = vs_TEXCOORD0_1;
    let _e102 = (_e97.xy + -(_e99.zw));
    u_xlat4_.x = _e102.x;
    u_xlat4_.y = _e102.y;
    let _e107 = u_xlat4_;
    let _e112 = _f_buffer1_.f_cb1_[6];
    let _e114 = u_xlat4_;
    let _e117 = vs_TEXCOORD0_1;
    let _e119 = ((_e112.xx * _e114.xy) + _e117.zw);
    u_xlat4_.x = _e119.x;
    u_xlat4_.y = _e119.y;
    let _e124 = u_xlat4_;
    let _e129 = _f_buffer0_.f_cb0_[4];
    let _e134 = hscard_bias.values[1];
    let _e137 = textureSampleBias(f_t1_, samplerf_s1_, _e124.xy, (_e129.x + _e134.x));
    u_xlat1_ = _e137;
    let _e138 = u_xlat4_;
    let _e140 = u_xlat1_;
    let _e151 = ((_e140.xy * vec2<f32>(2f, 2f)) + vec2<f32>(-1f, -1f));
    u_xlat4_.x = _e151.x;
    u_xlat4_.y = _e151.y;
    let _e156 = u_xlat4_;
    let _e158 = u_xlat4_;
    let _e163 = _f_buffer1_.f_cb1_[5];
    let _e166 = vs_TEXCOORD0_1;
    let _e168 = ((_e158.xy * _e163.zw) + _e166.xy);
    u_xlat4_.x = _e168.x;
    u_xlat4_.y = _e168.y;
    let _e173 = u_xlat1_;
    let _e175 = u_xlat4_;
    let _e176 = _e175.xy;
    u_xlat1_.x = _e176.x;
    u_xlat1_.y = _e176.y;
    let _e181 = u_xlat1_;
    let _e183 = u_xlat1_;
    let _e189 = clamp(_e183.xy, vec2(0f), vec2(1f));
    u_xlat1_.x = _e189.x;
    u_xlat1_.y = _e189.y;
    let _e194 = u_xlat1_;
    let _e196 = u_xlat4_;
    let _e199 = u_xlat1_;
    let _e201 = (-(_e196.xy) + _e199.xy);
    u_xlat1_.x = _e201.x;
    u_xlat1_.y = _e201.y;
    let _e206 = u_xlat4_;
    let _e211 = _f_buffer1_.f_cb1_[3];
    let _e213 = u_xlat1_;
    let _e216 = u_xlat4_;
    let _e218 = ((_e211.zz * _e213.xy) + _e216.xy);
    u_xlat4_.x = _e218.x;
    u_xlat4_.y = _e218.y;
    let _e223 = u_xlat4_;
    let _e228 = _f_buffer0_.f_cb0_[4];
    let _e233 = hscard_bias.values[0];
    let _e236 = textureSampleBias(f_t0_, samplerf_s0_, _e223.xy, (_e228.x + _e233.x));
    u_xlat1_ = _e236;
    let _e237 = u_xlat2_;
    let _e239 = u_xlat1_;
    u_xlat2_ = (-(_e237) + _e239.w);
    let _e243 = u_xlat0_;
    let _e245 = u_xlat2_;
    u_xlat0_.x = (_e243.x * _e245);
    let _e248 = u_xlat0_;
    u_xlat0_.x = clamp(_e248.x, 0f, 1f);
    let _e253 = u_xlat0_;
    u_xlat2_ = ((_e253.x * -2f) + 3f);
    let _e261 = u_xlat0_;
    let _e263 = u_xlat0_;
    u_xlat0_.x = (_e261.x * _e263.x);
    let _e267 = u_xlat0_;
    let _e269 = u_xlat2_;
    u_xlat0_.x = (_e267.x * _e269);
    let _e271 = u_xlat1_;
    let _e276 = _f_buffer1_.f_cb1_[2];
    u_xlat2_ = (_e271.w + _e276.y);
    let _e280 = u_xlat1_;
    let _e285 = _f_buffer1_.f_cb1_[3];
    u_xlat4_.x = max(_e280.w, _e285.y);
    let _e288 = u_xlat4_;
    let _e290 = u_xlat2_;
    u_xlat2_ = (_e288.x * _e290);
    let _e292 = u_xlat1_;
    let _e294 = u_xlat2_;
    let _e299 = _f_buffer1_.f_cb1_[2];
    let _e301 = (vec3(_e294) * _e299.xxx);
    u_xlat1_.x = _e301.x;
    u_xlat1_.y = _e301.y;
    u_xlat1_.z = _e301.z;
    let _e308 = u_xlat0_;
    let _e310 = u_xlat1_;
    u_xlat0_ = (_e308.xxxx * _e310);
    let _e312 = u_xlat0_;
    let _e313 = vs_COLOR0_1;
    SV_Target0_ = (_e312 * _e313);
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
