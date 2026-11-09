struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 11>,
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
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec3<f32> = vec3(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: vec2<f32> = vec2(0f);
    var u_xlat8_: f32 = 0f;
    var u_xlat12_: f32 = 0f;

    let _e47 = _f_buffer1_.f_cb1_[10];
    u_xlat0_.x = (-(_e47.w) + 1f);
    let _e52 = u_xlat4_;
    let _e54 = vs_TEXCOORD0_1;
    let _e55 = _e54.xy;
    u_xlat4_.x = _e55.x;
    u_xlat4_.y = _e55.y;
    let _e60 = u_xlat4_;
    let _e62 = u_xlat4_;
    let _e68 = clamp(_e62.xy, vec2(0f), vec2(1f));
    u_xlat4_.x = _e68.x;
    u_xlat4_.y = _e68.y;
    let _e73 = u_xlat4_;
    let _e75 = u_xlat4_;
    let _e77 = vs_TEXCOORD0_1;
    let _e80 = (_e75.xy + -(_e77.xy));
    u_xlat4_.x = _e80.x;
    u_xlat4_.y = _e80.y;
    let _e85 = u_xlat4_;
    let _e90 = _f_buffer1_.f_cb1_[3];
    let _e92 = u_xlat4_;
    let _e95 = vs_TEXCOORD0_1;
    let _e97 = ((_e90.zz * _e92.xy) + _e95.xy);
    u_xlat4_.x = _e97.x;
    u_xlat4_.y = _e97.y;
    let _e102 = u_xlat4_;
    let _e107 = _f_buffer0_.f_cb0_[4];
    let _e112 = hscard_bias.values[0];
    let _e115 = textureSampleBias(f_t0_, samplerf_s0_, _e102.xy, (_e107.x + _e112.x));
    u_xlat1_ = _e115;
    let _e117 = u_xlat1_;
    u_xlat1_.w = dot(_e117.xyz, vec3<f32>(0.299f, 0.587f, 0.114f));
    let _e125 = u_xlat1_;
    let _e130 = _f_buffer1_.f_cb1_[2];
    u_xlat4_.x = (_e125.w + _e130.y);
    let _e133 = u_xlat1_;
    let _e138 = _f_buffer1_.f_cb1_[3];
    u_xlat8_ = max(_e133.w, _e138.y);
    let _e141 = u_xlat4_;
    let _e143 = u_xlat8_;
    let _e148 = _f_buffer1_.f_cb1_[10];
    u_xlat12_ = ((_e141.x * _e143) + -(_e148.w));
    let _e153 = u_xlat8_;
    let _e154 = u_xlat4_;
    u_xlat4_.x = (_e153 * _e154.x);
    let _e158 = u_xlat12_;
    let _e159 = u_xlat0_;
    u_xlat0_.x = (_e158 / _e159.x);
    let _e162 = u_xlat12_;
    u_xlat8_ = (_e162 * 5f);
    let _e165 = u_xlat8_;
    u_xlat8_ = clamp(_e165, 0f, 1f);
    let _e169 = u_xlat2_;
    let _e174 = _f_buffer1_.f_cb1_[8];
    let _e179 = _f_buffer1_.f_cb1_[9];
    let _e182 = (_e174.yzw + -(_e179.xyz));
    u_xlat2_.x = _e182.x;
    u_xlat2_.y = _e182.y;
    u_xlat2_.z = _e182.z;
    let _e189 = u_xlat2_;
    let _e191 = u_xlat0_;
    let _e193 = u_xlat2_;
    let _e199 = _f_buffer1_.f_cb1_[9];
    let _e201 = ((_e191.xxx * _e193.xyz) + _e199.xyz);
    u_xlat2_.x = _e201.x;
    u_xlat2_.y = _e201.y;
    u_xlat2_.z = _e201.z;
    let _e214 = _f_buffer1_.f_cb1_[10];
    u_xlat0_.x = (1f / _e214.w);
    let _e218 = u_xlat0_;
    let _e220 = u_xlat4_;
    u_xlat0_.x = (_e218.x * _e220.x);
    let _e223 = u_xlat3_;
    let _e228 = _f_buffer1_.f_cb1_[9];
    let _e233 = _f_buffer1_.f_cb1_[10];
    let _e236 = (_e228.xyz + -(_e233.xyz));
    u_xlat3_.x = _e236.x;
    u_xlat3_.y = _e236.y;
    u_xlat3_.z = _e236.z;
    let _e243 = u_xlat3_;
    let _e245 = u_xlat0_;
    let _e247 = u_xlat3_;
    let _e253 = _f_buffer1_.f_cb1_[10];
    let _e255 = ((_e245.xxx * _e247.xyz) + _e253.xyz);
    u_xlat3_.x = _e255.x;
    u_xlat3_.y = _e255.y;
    u_xlat3_.z = _e255.z;
    let _e262 = u_xlat2_;
    let _e264 = u_xlat2_;
    let _e266 = u_xlat3_;
    let _e269 = (_e264.xyz + -(_e266.xyz));
    u_xlat2_.x = _e269.x;
    u_xlat2_.y = _e269.y;
    u_xlat2_.z = _e269.z;
    let _e276 = u_xlat0_;
    let _e278 = u_xlat8_;
    let _e280 = u_xlat2_;
    let _e283 = u_xlat3_;
    let _e285 = ((vec3(_e278) * _e280.xyz) + _e283.xyz);
    u_xlat0_.x = _e285.x;
    u_xlat0_.z = _e285.y;
    u_xlat0_.w = _e285.z;
    let _e292 = u_xlat0_;
    let _e294 = u_xlat0_;
    let _e296 = u_xlat4_;
    let _e298 = (_e294.xzw * _e296.xxx);
    u_xlat0_.x = _e298.x;
    u_xlat0_.y = _e298.y;
    u_xlat0_.z = _e298.z;
    let _e305 = u_xlat1_;
    let _e307 = u_xlat0_;
    let _e312 = _f_buffer1_.f_cb1_[2];
    let _e314 = (_e307.xyz * _e312.xxx);
    u_xlat1_.x = _e314.x;
    u_xlat1_.y = _e314.y;
    u_xlat1_.z = _e314.z;
    let _e321 = vs_TEXCOORD0_1;
    let _e326 = _f_buffer0_.f_cb0_[4];
    let _e331 = hscard_bias.values[1];
    let _e334 = textureSampleBias(f_t1_, samplerf_s1_, _e321.zw, (_e326.x + _e331.x));
    u_xlat0_ = _e334;
    let _e335 = u_xlat0_;
    let _e337 = vs_COLOR1_1;
    let _e339 = u_xlat1_;
    u_xlat0_ = ((_e335.xyzx * _e337) + _e339);
    let _e341 = u_xlat0_;
    let _e342 = vs_COLOR0_1;
    SV_Target0_ = (_e341 * _e342);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(11) vs_COLOR1_: vec4<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_COLOR1_1 = vs_COLOR1_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e32 = SV_Target0_;
    return FragmentOutput(_e32);
}
