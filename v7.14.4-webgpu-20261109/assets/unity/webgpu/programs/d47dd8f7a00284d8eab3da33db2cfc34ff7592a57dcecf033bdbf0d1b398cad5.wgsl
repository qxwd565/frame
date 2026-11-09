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
    var u_xlat3_: f32 = 0f;
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlat6_: vec2<f32> = vec2(0f);
    var u_xlat8_: f32 = 0f;
    var u_xlat13_: f32 = 0f;
    var u_xlat15_: f32 = 0f;

    let _e48 = vs_TEXCOORD0_1;
    let _e49 = vs_TEXCOORD1_1;
    phase0_Input0_1_ = vec4<f32>(_e48.x, _e48.y, _e49, 0f);
    let _e55 = u_xlat0_;
    let _e60 = _f_buffer1_.f_cb1_[8];
    let _e65 = _f_buffer1_.f_cb1_[9];
    let _e68 = (_e60.yzw + -(_e65.xyz));
    u_xlat0_.x = _e68.x;
    u_xlat0_.y = _e68.y;
    u_xlat0_.z = _e68.z;
    let _e78 = _f_buffer1_.f_cb1_[10];
    u_xlat15_ = (-(_e78.w) + 1f);
    let _e83 = u_xlat1_;
    let _e85 = phase0_Input0_1_;
    let _e86 = _e85.zxy;
    u_xlat1_.x = _e86.x;
    u_xlat1_.y = _e86.y;
    u_xlat1_.z = _e86.z;
    let _e93 = u_xlat1_;
    let _e95 = u_xlat1_;
    let _e101 = clamp(_e95.xyz, vec3(0f), vec3(1f));
    u_xlat1_.x = _e101.x;
    u_xlat1_.y = _e101.y;
    u_xlat1_.z = _e101.z;
    let _e108 = u_xlat6_;
    let _e110 = u_xlat1_;
    let _e112 = phase0_Input0_1_;
    let _e115 = (_e110.yz + -(_e112.xy));
    u_xlat6_.x = _e115.x;
    u_xlat6_.y = _e115.y;
    let _e120 = u_xlat1_;
    let _e122 = vs_COLOR0_1;
    u_xlat2_ = (_e120.xxxx * _e122);
    let _e124 = u_xlat1_;
    let _e129 = _f_buffer1_.f_cb1_[3];
    let _e131 = u_xlat6_;
    let _e134 = phase0_Input0_1_;
    let _e136 = ((_e129.zz * _e131.xy) + _e134.xy);
    u_xlat1_.x = _e136.x;
    u_xlat1_.y = _e136.y;
    let _e141 = u_xlat1_;
    let _e146 = _f_buffer0_.f_cb0_[4];
    let _e151 = hscard_bias.values[0];
    let _e154 = textureSampleBias(f_t0_, samplerf_s0_, _e141.xy, (_e146.x + _e151.x));
    u_xlat1_ = _e154;
    let _e156 = u_xlat1_;
    u_xlat1_.w = dot(_e156.xyz, vec3<f32>(0.299f, 0.587f, 0.114f));
    let _e163 = u_xlat1_;
    let _e168 = _f_buffer1_.f_cb1_[2];
    u_xlat3_ = (_e163.w + _e168.y);
    let _e171 = u_xlat1_;
    let _e176 = _f_buffer1_.f_cb1_[3];
    u_xlat8_ = max(_e171.w, _e176.y);
    let _e179 = u_xlat3_;
    let _e180 = u_xlat8_;
    let _e185 = _f_buffer1_.f_cb1_[10];
    u_xlat13_ = ((_e179 * _e180) + -(_e185.w));
    let _e189 = u_xlat8_;
    let _e190 = u_xlat3_;
    u_xlat3_ = (_e189 * _e190);
    let _e192 = u_xlat13_;
    let _e193 = u_xlat15_;
    u_xlat15_ = (_e192 / _e193);
    let _e195 = u_xlat13_;
    u_xlat8_ = (_e195 * 5f);
    let _e198 = u_xlat8_;
    u_xlat8_ = clamp(_e198, 0f, 1f);
    let _e202 = u_xlat0_;
    let _e204 = u_xlat15_;
    let _e206 = u_xlat0_;
    let _e212 = _f_buffer1_.f_cb1_[9];
    let _e214 = ((vec3(_e204) * _e206.xyz) + _e212.xyz);
    u_xlat0_.x = _e214.x;
    u_xlat0_.y = _e214.y;
    u_xlat0_.z = _e214.z;
    let _e226 = _f_buffer1_.f_cb1_[10];
    u_xlat15_ = (1f / _e226.w);
    let _e229 = u_xlat15_;
    let _e230 = u_xlat3_;
    u_xlat15_ = (_e229 * _e230);
    let _e232 = u_xlat4_;
    let _e237 = _f_buffer1_.f_cb1_[9];
    let _e242 = _f_buffer1_.f_cb1_[10];
    let _e245 = (_e237.xyz + -(_e242.xyz));
    u_xlat4_.x = _e245.x;
    u_xlat4_.y = _e245.y;
    u_xlat4_.z = _e245.z;
    let _e252 = u_xlat4_;
    let _e254 = u_xlat15_;
    let _e256 = u_xlat4_;
    let _e262 = _f_buffer1_.f_cb1_[10];
    let _e264 = ((vec3(_e254) * _e256.xyz) + _e262.xyz);
    u_xlat4_.x = _e264.x;
    u_xlat4_.y = _e264.y;
    u_xlat4_.z = _e264.z;
    let _e271 = u_xlat0_;
    let _e273 = u_xlat0_;
    let _e275 = u_xlat4_;
    let _e278 = (_e273.xyz + -(_e275.xyz));
    u_xlat0_.x = _e278.x;
    u_xlat0_.y = _e278.y;
    u_xlat0_.z = _e278.z;
    let _e285 = u_xlat0_;
    let _e287 = u_xlat8_;
    let _e289 = u_xlat0_;
    let _e292 = u_xlat4_;
    let _e294 = ((vec3(_e287) * _e289.xyz) + _e292.xyz);
    u_xlat0_.x = _e294.x;
    u_xlat0_.y = _e294.y;
    u_xlat0_.z = _e294.z;
    let _e301 = u_xlat0_;
    let _e303 = u_xlat0_;
    let _e305 = u_xlat3_;
    let _e307 = (_e303.xyz * vec3(_e305));
    u_xlat0_.x = _e307.x;
    u_xlat0_.y = _e307.y;
    u_xlat0_.z = _e307.z;
    let _e314 = u_xlat1_;
    let _e316 = u_xlat0_;
    let _e321 = _f_buffer1_.f_cb1_[2];
    let _e323 = (_e316.xyz * _e321.xxx);
    u_xlat1_.x = _e323.x;
    u_xlat1_.y = _e323.y;
    u_xlat1_.z = _e323.z;
    let _e330 = u_xlat2_;
    let _e331 = u_xlat1_;
    SV_Target0_ = (_e330 * _e331);
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
