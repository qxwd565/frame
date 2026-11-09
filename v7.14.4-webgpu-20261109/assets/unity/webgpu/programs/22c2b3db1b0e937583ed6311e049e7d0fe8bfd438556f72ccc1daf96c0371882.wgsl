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
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> phase0_Input0_1_: vec4<f32>;
var<private> vs_TEXCOORD1_1: f32;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec3<f32> = vec3(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlat6_: vec2<f32> = vec2(0f);
    var u_xlat15_: f32 = 0f;
    var u_xlat18_: f32 = 0f;

    let _e46 = vs_TEXCOORD0_1;
    let _e47 = vs_TEXCOORD1_1;
    phase0_Input0_1_ = vec4<f32>(_e46.x, _e46.y, _e47, 0f);
    let _e53 = u_xlat0_;
    let _e58 = _f_buffer1_.f_cb1_[8];
    let _e63 = _f_buffer1_.f_cb1_[9];
    let _e66 = (_e58.yzw + -(_e63.xyz));
    u_xlat0_.x = _e66.x;
    u_xlat0_.y = _e66.y;
    u_xlat0_.z = _e66.z;
    let _e76 = _f_buffer1_.f_cb1_[10];
    u_xlat15_ = (-(_e76.w) + 1f);
    let _e81 = u_xlat1_;
    let _e83 = phase0_Input0_1_;
    let _e84 = _e83.zxy;
    u_xlat1_.x = _e84.x;
    u_xlat1_.y = _e84.y;
    u_xlat1_.z = _e84.z;
    let _e91 = u_xlat1_;
    let _e93 = u_xlat1_;
    let _e99 = clamp(_e93.xyz, vec3(0f), vec3(1f));
    u_xlat1_.x = _e99.x;
    u_xlat1_.y = _e99.y;
    u_xlat1_.z = _e99.z;
    let _e106 = u_xlat6_;
    let _e108 = u_xlat1_;
    let _e110 = phase0_Input0_1_;
    let _e113 = (_e108.yz + -(_e110.xy));
    u_xlat6_.x = _e113.x;
    u_xlat6_.y = _e113.y;
    let _e118 = u_xlat1_;
    let _e120 = vs_COLOR0_1;
    u_xlat2_ = (_e118.xxxx * _e120);
    let _e122 = u_xlat1_;
    let _e127 = _f_buffer1_.f_cb1_[3];
    let _e129 = u_xlat6_;
    let _e132 = phase0_Input0_1_;
    let _e134 = ((_e127.zz * _e129.xy) + _e132.xy);
    u_xlat1_.x = _e134.x;
    u_xlat1_.y = _e134.y;
    let _e139 = u_xlat1_;
    let _e144 = _f_buffer0_.f_cb0_[4];
    let _e149 = hscard_bias.values[0];
    let _e152 = textureSampleBias(f_t0_, samplerf_s0_, _e139.xy, (_e144.x + _e149.x));
    u_xlat1_ = _e152.yzwx;
    let _e154 = u_xlat3_;
    let _e156 = u_xlat1_;
    let _e161 = _f_buffer1_.f_cb1_[2];
    let _e163 = (_e156.wxy + _e161.yyy);
    u_xlat3_.x = _e163.x;
    u_xlat3_.y = _e163.y;
    u_xlat3_.z = _e163.z;
    let _e170 = u_xlat1_;
    let _e175 = _f_buffer1_.f_cb1_[3];
    u_xlat18_ = max(_e170.w, _e175.y);
    let _e179 = u_xlat3_;
    let _e181 = u_xlat18_;
    let _e186 = _f_buffer1_.f_cb1_[10];
    u_xlat4_.x = ((_e179.y * _e181) + -(_e186.w));
    let _e190 = u_xlat3_;
    let _e192 = u_xlat18_;
    let _e194 = u_xlat3_;
    let _e196 = (vec3(_e192) * _e194.xyz);
    u_xlat3_.x = _e196.x;
    u_xlat3_.y = _e196.y;
    u_xlat3_.z = _e196.z;
    let _e203 = u_xlat4_;
    let _e205 = u_xlat15_;
    u_xlat15_ = (_e203.x / _e205);
    let _e207 = u_xlat4_;
    u_xlat18_ = (_e207.x * 5f);
    let _e211 = u_xlat18_;
    u_xlat18_ = clamp(_e211, 0f, 1f);
    let _e215 = u_xlat0_;
    let _e217 = u_xlat15_;
    let _e219 = u_xlat0_;
    let _e225 = _f_buffer1_.f_cb1_[9];
    let _e227 = ((vec3(_e217) * _e219.xyz) + _e225.xyz);
    u_xlat0_.x = _e227.x;
    u_xlat0_.y = _e227.y;
    u_xlat0_.z = _e227.z;
    let _e239 = _f_buffer1_.f_cb1_[10];
    u_xlat15_ = (1f / _e239.w);
    let _e242 = u_xlat15_;
    let _e243 = u_xlat3_;
    u_xlat15_ = (_e242 * _e243.y);
    let _e246 = u_xlat4_;
    let _e251 = _f_buffer1_.f_cb1_[9];
    let _e256 = _f_buffer1_.f_cb1_[10];
    let _e259 = (_e251.xyz + -(_e256.xyz));
    u_xlat4_.x = _e259.x;
    u_xlat4_.y = _e259.y;
    u_xlat4_.z = _e259.z;
    let _e266 = u_xlat4_;
    let _e268 = u_xlat15_;
    let _e270 = u_xlat4_;
    let _e276 = _f_buffer1_.f_cb1_[10];
    let _e278 = ((vec3(_e268) * _e270.xyz) + _e276.xyz);
    u_xlat4_.x = _e278.x;
    u_xlat4_.y = _e278.y;
    u_xlat4_.z = _e278.z;
    let _e285 = u_xlat0_;
    let _e287 = u_xlat0_;
    let _e289 = u_xlat4_;
    let _e292 = (_e287.xyz + -(_e289.xyz));
    u_xlat0_.x = _e292.x;
    u_xlat0_.y = _e292.y;
    u_xlat0_.z = _e292.z;
    let _e299 = u_xlat0_;
    let _e301 = u_xlat18_;
    let _e303 = u_xlat0_;
    let _e306 = u_xlat4_;
    let _e308 = ((vec3(_e301) * _e303.xyz) + _e306.xyz);
    u_xlat0_.x = _e308.x;
    u_xlat0_.y = _e308.y;
    u_xlat0_.z = _e308.z;
    let _e315 = u_xlat0_;
    let _e317 = u_xlat0_;
    let _e319 = u_xlat3_;
    let _e321 = (_e317.xyz * _e319.xyz);
    u_xlat0_.x = _e321.x;
    u_xlat0_.y = _e321.y;
    u_xlat0_.z = _e321.z;
    let _e328 = u_xlat1_;
    let _e330 = u_xlat0_;
    let _e335 = _f_buffer1_.f_cb1_[2];
    let _e337 = (_e330.xyz * _e335.xxx);
    u_xlat1_.x = _e337.x;
    u_xlat1_.y = _e337.y;
    u_xlat1_.z = _e337.z;
    let _e344 = u_xlat2_;
    let _e345 = u_xlat1_;
    SV_Target0_ = (_e344 * _e345);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: f32, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e30 = SV_Target0_;
    return FragmentOutput(_e30);
}
