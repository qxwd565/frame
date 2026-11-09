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
var<private> vs_COLOR0_1: vec4<f32>;
var<private> vs_TEXCOORD1_1: f32;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: f32 = 0f;
    var u_xlat5_: vec3<f32> = vec3(0f);
    var u_xlat7_: vec3<f32> = vec3(0f);
    var u_xlat9_: vec2<f32> = vec2(0f);
    var u_xlat12_: f32 = 0f;

    let _e47 = u_xlat0_;
    let _e52 = _f_buffer1_.f_cb1_[8];
    let _e57 = _f_buffer1_.f_cb1_[9];
    let _e60 = (_e52.yzw + -(_e57.xyz));
    u_xlat0_.x = _e60.x;
    u_xlat0_.y = _e60.y;
    u_xlat0_.z = _e60.z;
    let _e70 = _f_buffer1_.f_cb1_[10];
    u_xlat12_ = (-(_e70.w) + 1f);
    let _e75 = vs_TEXCOORD0_1;
    u_xlat1_ = _e75.zwxy;
    let _e77 = u_xlat1_;
    u_xlat1_ = clamp(_e77, vec4(0f), vec4(1f));
    let _e83 = u_xlat1_;
    let _e84 = vs_TEXCOORD0_1;
    u_xlat1_ = (_e83 + -(_e84.zwxy));
    let _e88 = u_xlat9_;
    let _e93 = _f_buffer1_.f_cb1_[3];
    let _e95 = u_xlat1_;
    let _e98 = vs_TEXCOORD0_1;
    let _e100 = ((_e93.zz * _e95.zw) + _e98.xy);
    u_xlat9_.x = _e100.x;
    u_xlat9_.y = _e100.y;
    let _e105 = u_xlat1_;
    let _e110 = _f_buffer1_.f_cb1_[6];
    let _e112 = u_xlat1_;
    let _e115 = vs_TEXCOORD0_1;
    let _e117 = ((_e110.xx * _e112.xy) + _e115.zw);
    u_xlat1_.x = _e117.x;
    u_xlat1_.y = _e117.y;
    let _e122 = u_xlat1_;
    let _e127 = _f_buffer0_.f_cb0_[4];
    let _e132 = hscard_bias.values[1];
    let _e135 = textureSampleBias(f_t1_, samplerf_s1_, _e122.xy, (_e127.x + _e132.x));
    u_xlat2_ = _e135;
    let _e137 = u_xlat2_;
    u_xlat1_.x = (_e137.w + -1f);
    let _e146 = _f_buffer1_.f_cb1_[7];
    let _e148 = u_xlat1_;
    u_xlat1_.x = ((_e146.w * _e148.x) + 1f);
    let _e153 = u_xlat9_;
    let _e158 = _f_buffer0_.f_cb0_[4];
    let _e163 = hscard_bias.values[0];
    let _e166 = textureSampleBias(f_t0_, samplerf_s0_, _e153.xy, (_e158.x + _e163.x));
    u_xlat2_ = _e166.yzwx;
    let _e168 = u_xlat5_;
    let _e170 = u_xlat2_;
    let _e175 = _f_buffer1_.f_cb1_[2];
    let _e177 = (_e170.wxy + _e175.yyy);
    u_xlat5_.x = _e177.x;
    u_xlat5_.y = _e177.y;
    u_xlat5_.z = _e177.z;
    let _e184 = u_xlat2_;
    let _e189 = _f_buffer1_.f_cb1_[3];
    u_xlat3_ = max(_e184.w, _e189.y);
    let _e193 = u_xlat5_;
    let _e195 = u_xlat3_;
    let _e200 = _f_buffer1_.f_cb1_[10];
    u_xlat7_.x = ((_e193.y * _e195) + -(_e200.w));
    let _e204 = u_xlat5_;
    let _e206 = u_xlat5_;
    let _e208 = u_xlat3_;
    let _e210 = (_e206.xyz * vec3(_e208));
    u_xlat5_.x = _e210.x;
    u_xlat5_.y = _e210.y;
    u_xlat5_.z = _e210.z;
    let _e217 = u_xlat7_;
    let _e219 = u_xlat12_;
    u_xlat12_ = (_e217.x / _e219);
    let _e221 = u_xlat7_;
    u_xlat3_ = (_e221.x * 5f);
    let _e225 = u_xlat3_;
    u_xlat3_ = clamp(_e225, 0f, 1f);
    let _e229 = u_xlat0_;
    let _e231 = u_xlat12_;
    let _e233 = u_xlat0_;
    let _e239 = _f_buffer1_.f_cb1_[9];
    let _e241 = ((vec3(_e231) * _e233.xyz) + _e239.xyz);
    u_xlat0_.x = _e241.x;
    u_xlat0_.y = _e241.y;
    u_xlat0_.z = _e241.z;
    let _e253 = _f_buffer1_.f_cb1_[10];
    u_xlat12_ = (1f / _e253.w);
    let _e256 = u_xlat12_;
    let _e257 = u_xlat5_;
    u_xlat12_ = (_e256 * _e257.y);
    let _e260 = u_xlat7_;
    let _e265 = _f_buffer1_.f_cb1_[9];
    let _e270 = _f_buffer1_.f_cb1_[10];
    let _e273 = (_e265.xyz + -(_e270.xyz));
    u_xlat7_.x = _e273.x;
    u_xlat7_.y = _e273.y;
    u_xlat7_.z = _e273.z;
    let _e280 = u_xlat7_;
    let _e282 = u_xlat12_;
    let _e284 = u_xlat7_;
    let _e290 = _f_buffer1_.f_cb1_[10];
    let _e292 = ((vec3(_e282) * _e284.xyz) + _e290.xyz);
    u_xlat7_.x = _e292.x;
    u_xlat7_.y = _e292.y;
    u_xlat7_.z = _e292.z;
    let _e299 = u_xlat0_;
    let _e301 = u_xlat0_;
    let _e303 = u_xlat7_;
    let _e306 = (_e301.xyz + -(_e303.xyz));
    u_xlat0_.x = _e306.x;
    u_xlat0_.y = _e306.y;
    u_xlat0_.z = _e306.z;
    let _e313 = u_xlat0_;
    let _e315 = u_xlat3_;
    let _e317 = u_xlat0_;
    let _e320 = u_xlat7_;
    let _e322 = ((vec3(_e315) * _e317.xyz) + _e320.xyz);
    u_xlat0_.x = _e322.x;
    u_xlat0_.y = _e322.y;
    u_xlat0_.z = _e322.z;
    let _e329 = u_xlat0_;
    let _e331 = u_xlat0_;
    let _e333 = u_xlat5_;
    let _e335 = (_e331.xyz * _e333.xyz);
    u_xlat0_.x = _e335.x;
    u_xlat0_.y = _e335.y;
    u_xlat0_.z = _e335.z;
    let _e342 = u_xlat2_;
    let _e344 = u_xlat0_;
    let _e349 = _f_buffer1_.f_cb1_[2];
    let _e351 = (_e344.xyz * _e349.xxx);
    u_xlat2_.x = _e351.x;
    u_xlat2_.y = _e351.y;
    u_xlat2_.z = _e351.z;
    let _e358 = u_xlat1_;
    let _e360 = u_xlat2_;
    u_xlat0_ = (_e358.xxxx * _e360);
    let _e363 = vs_TEXCOORD1_1;
    u_xlat1_.x = _e363;
    let _e365 = u_xlat1_;
    u_xlat1_.x = clamp(_e365.x, 0f, 1f);
    let _e370 = u_xlat1_;
    let _e372 = vs_COLOR0_1;
    u_xlat1_ = (_e370.xxxx * _e372);
    let _e374 = u_xlat0_;
    let _e375 = u_xlat1_;
    SV_Target0_ = (_e374 * _e375);
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
