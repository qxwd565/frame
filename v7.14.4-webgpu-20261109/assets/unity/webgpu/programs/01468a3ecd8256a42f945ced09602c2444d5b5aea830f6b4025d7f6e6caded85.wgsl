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
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlat5_: f32 = 0f;
    var u_xlat10_: f32 = 0f;
    var u_xlat11_: vec2<f32> = vec2(0f);
    var u_xlat15_: f32 = 0f;
    var u_xlat18_: f32 = 0f;

    let _e54 = u_xlat0_;
    let _e59 = _f_buffer1_.f_cb1_[8];
    let _e64 = _f_buffer1_.f_cb1_[9];
    let _e67 = (_e59.yzw + -(_e64.xyz));
    u_xlat0_.x = _e67.x;
    u_xlat0_.y = _e67.y;
    u_xlat0_.z = _e67.z;
    let _e77 = _f_buffer1_.f_cb1_[10];
    u_xlat15_ = (-(_e77.w) + 1f);
    let _e82 = vs_TEXCOORD0_1;
    u_xlat1_ = _e82.zwxy;
    let _e84 = u_xlat1_;
    u_xlat1_ = clamp(_e84, vec4(0f), vec4(1f));
    let _e90 = u_xlat1_;
    let _e91 = vs_TEXCOORD0_1;
    u_xlat1_ = (_e90 + -(_e91.zwxy));
    let _e95 = u_xlat11_;
    let _e100 = _f_buffer1_.f_cb1_[3];
    let _e102 = u_xlat1_;
    let _e105 = vs_TEXCOORD0_1;
    let _e107 = ((_e100.zz * _e102.zw) + _e105.xy);
    u_xlat11_.x = _e107.x;
    u_xlat11_.y = _e107.y;
    let _e112 = u_xlat1_;
    let _e117 = _f_buffer1_.f_cb1_[6];
    let _e119 = u_xlat1_;
    let _e122 = vs_TEXCOORD0_1;
    let _e124 = ((_e117.xx * _e119.xy) + _e122.zw);
    u_xlat1_.x = _e124.x;
    u_xlat1_.y = _e124.y;
    let _e129 = u_xlat1_;
    let _e134 = _f_buffer0_.f_cb0_[4];
    let _e139 = hscard_bias.values[1];
    let _e142 = textureSampleBias(f_t1_, samplerf_s1_, _e129.xy, (_e134.x + _e139.x));
    u_xlat2_ = _e142;
    let _e144 = u_xlat2_;
    u_xlat1_.x = dot(_e144.xyz, vec3<f32>(0.299f, 0.587f, 0.114f));
    let _e151 = u_xlat1_;
    let _e153 = vs_COLOR1_1;
    u_xlat2_ = (_e151.xxxx * _e153);
    let _e155 = u_xlat11_;
    let _e160 = _f_buffer0_.f_cb0_[4];
    let _e165 = hscard_bias.values[0];
    let _e168 = textureSampleBias(f_t0_, samplerf_s0_, _e155.xy, (_e160.x + _e165.x));
    u_xlat1_ = _e168.yzwx;
    let _e170 = u_xlat3_;
    let _e172 = u_xlat1_;
    let _e177 = _f_buffer1_.f_cb1_[2];
    let _e179 = (_e172.wxy + _e177.yyy);
    u_xlat3_.x = _e179.x;
    u_xlat3_.y = _e179.y;
    u_xlat3_.z = _e179.z;
    let _e186 = u_xlat1_;
    let _e191 = _f_buffer1_.f_cb1_[3];
    u_xlat18_ = max(_e186.w, _e191.y);
    let _e195 = u_xlat3_;
    let _e197 = u_xlat18_;
    let _e202 = _f_buffer1_.f_cb1_[10];
    u_xlat4_.x = ((_e195.y * _e197) + -(_e202.w));
    let _e206 = u_xlat3_;
    let _e208 = u_xlat18_;
    let _e210 = u_xlat3_;
    let _e212 = (vec3(_e208) * _e210.xyz);
    u_xlat3_.x = _e212.x;
    u_xlat3_.y = _e212.y;
    u_xlat3_.z = _e212.z;
    let _e219 = u_xlat4_;
    let _e221 = u_xlat15_;
    u_xlat15_ = (_e219.x / _e221);
    let _e223 = u_xlat4_;
    u_xlat18_ = (_e223.x * 5f);
    let _e227 = u_xlat18_;
    u_xlat18_ = clamp(_e227, 0f, 1f);
    let _e231 = u_xlat0_;
    let _e233 = u_xlat15_;
    let _e235 = u_xlat0_;
    let _e241 = _f_buffer1_.f_cb1_[9];
    let _e243 = ((vec3(_e233) * _e235.xyz) + _e241.xyz);
    u_xlat0_.x = _e243.x;
    u_xlat0_.y = _e243.y;
    u_xlat0_.z = _e243.z;
    let _e255 = _f_buffer1_.f_cb1_[10];
    u_xlat15_ = (1f / _e255.w);
    let _e258 = u_xlat15_;
    let _e259 = u_xlat3_;
    u_xlat15_ = (_e258 * _e259.y);
    let _e262 = u_xlat4_;
    let _e267 = _f_buffer1_.f_cb1_[9];
    let _e272 = _f_buffer1_.f_cb1_[10];
    let _e275 = (_e267.xyz + -(_e272.xyz));
    u_xlat4_.x = _e275.x;
    u_xlat4_.y = _e275.y;
    u_xlat4_.z = _e275.z;
    let _e282 = u_xlat4_;
    let _e284 = u_xlat15_;
    let _e286 = u_xlat4_;
    let _e292 = _f_buffer1_.f_cb1_[10];
    let _e294 = ((vec3(_e284) * _e286.xyz) + _e292.xyz);
    u_xlat4_.x = _e294.x;
    u_xlat4_.y = _e294.y;
    u_xlat4_.z = _e294.z;
    let _e301 = u_xlat0_;
    let _e303 = u_xlat0_;
    let _e305 = u_xlat4_;
    let _e308 = (_e303.xyz + -(_e305.xyz));
    u_xlat0_.x = _e308.x;
    u_xlat0_.y = _e308.y;
    u_xlat0_.z = _e308.z;
    let _e315 = u_xlat0_;
    let _e317 = u_xlat18_;
    let _e319 = u_xlat0_;
    let _e322 = u_xlat4_;
    let _e324 = ((vec3(_e317) * _e319.xyz) + _e322.xyz);
    u_xlat0_.x = _e324.x;
    u_xlat0_.y = _e324.y;
    u_xlat0_.z = _e324.z;
    let _e331 = u_xlat0_;
    let _e333 = u_xlat0_;
    let _e335 = u_xlat3_;
    let _e337 = (_e333.xyz * _e335.xyz);
    u_xlat0_.x = _e337.x;
    u_xlat0_.y = _e337.y;
    u_xlat0_.z = _e337.z;
    let _e344 = u_xlat1_;
    let _e346 = u_xlat0_;
    let _e351 = _f_buffer1_.f_cb1_[2];
    let _e353 = (_e346.xyz * _e351.xxx);
    u_xlat1_.x = _e353.x;
    u_xlat1_.y = _e353.y;
    u_xlat1_.z = _e353.z;
    let _e361 = vs_TEXCOORD1_1;
    let _e365 = _f_buffer1_.f_cb1_[12];
    u_xlat0_.x = (_e361 + -(_e365.z));
    let _e370 = u_xlat0_;
    u_xlat0_.x = clamp(_e370.x, 0f, 1f);
    let _e376 = u_xlat0_;
    u_xlat0_.x = (_e376.x + -0.00001f);
    let _e381 = u_xlat0_;
    let _e384 = u_xlat1_;
    u_xlat5_ = (-(_e381.x) + _e384.w);
    let _e387 = vs_TEXCOORD1_1;
    let _e391 = _f_buffer1_.f_cb1_[12];
    u_xlat10_ = (_e387 + _e391.z);
    let _e394 = u_xlat10_;
    u_xlat10_ = clamp(_e394, 0f, 1f);
    let _e399 = u_xlat0_;
    let _e402 = u_xlat10_;
    u_xlat0_.x = (-(_e399.x) + _e402);
    let _e407 = u_xlat0_;
    u_xlat0_.x = (1f / _e407.x);
    let _e411 = u_xlat0_;
    let _e413 = u_xlat5_;
    u_xlat0_.x = (_e411.x * _e413);
    let _e416 = u_xlat0_;
    u_xlat0_.x = clamp(_e416.x, 0f, 1f);
    let _e421 = u_xlat0_;
    u_xlat5_ = ((_e421.x * -2f) + 3f);
    let _e429 = u_xlat0_;
    let _e431 = u_xlat0_;
    u_xlat0_.x = (_e429.x * _e431.x);
    let _e435 = u_xlat0_;
    let _e437 = u_xlat5_;
    u_xlat0_.x = (_e435.x * _e437);
    let _e439 = u_xlat1_;
    let _e440 = u_xlat0_;
    let _e443 = u_xlat2_;
    u_xlat0_ = ((_e439 * _e440.xxxx) + _e443);
    let _e445 = u_xlat0_;
    let _e446 = vs_COLOR0_1;
    SV_Target0_ = (_e445 * _e446);
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
