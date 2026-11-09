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
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD1_1: f32;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec3<f32> = vec3(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: f32 = 0f;
    var u_xlat8_: f32 = 0f;
    var u_xlat12_: f32 = 0f;
    var u_xlat14_: f32 = 0f;

    let _e43 = u_xlat0_;
    let _e48 = _f_buffer1_.f_cb1_[8];
    let _e53 = _f_buffer1_.f_cb1_[9];
    let _e56 = (_e48.yzw + -(_e53.xyz));
    u_xlat0_.x = _e56.x;
    u_xlat0_.y = _e56.y;
    u_xlat0_.z = _e56.z;
    let _e66 = _f_buffer1_.f_cb1_[10];
    u_xlat12_ = (-(_e66.w) + 1f);
    let _e71 = u_xlat1_;
    let _e73 = vs_TEXCOORD0_1;
    let _e74 = _e73.xy;
    u_xlat1_.x = _e74.x;
    u_xlat1_.y = _e74.y;
    let _e79 = u_xlat1_;
    let _e81 = u_xlat1_;
    let _e87 = clamp(_e81.xy, vec2(0f), vec2(1f));
    u_xlat1_.x = _e87.x;
    u_xlat1_.y = _e87.y;
    let _e92 = u_xlat1_;
    let _e94 = u_xlat1_;
    let _e96 = vs_TEXCOORD0_1;
    let _e99 = (_e94.xy + -(_e96.xy));
    u_xlat1_.x = _e99.x;
    u_xlat1_.y = _e99.y;
    let _e104 = u_xlat1_;
    let _e109 = _f_buffer1_.f_cb1_[3];
    let _e111 = u_xlat1_;
    let _e114 = vs_TEXCOORD0_1;
    let _e116 = ((_e109.zz * _e111.xy) + _e114.xy);
    u_xlat1_.x = _e116.x;
    u_xlat1_.y = _e116.y;
    let _e121 = u_xlat1_;
    let _e126 = _f_buffer0_.f_cb0_[4];
    let _e131 = hscard_bias.values[0];
    let _e134 = textureSampleBias(f_t0_, samplerf_s0_, _e121.xy, (_e126.x + _e131.x));
    u_xlat1_ = _e134.yzwx;
    let _e136 = u_xlat2_;
    let _e138 = u_xlat1_;
    let _e143 = _f_buffer1_.f_cb1_[2];
    let _e145 = (_e138.wxy + _e143.yyy);
    u_xlat2_.x = _e145.x;
    u_xlat2_.y = _e145.y;
    u_xlat2_.z = _e145.z;
    let _e152 = u_xlat1_;
    let _e157 = _f_buffer1_.f_cb1_[3];
    u_xlat14_ = max(_e152.w, _e157.y);
    let _e161 = u_xlat2_;
    let _e163 = u_xlat14_;
    let _e168 = _f_buffer1_.f_cb1_[10];
    u_xlat3_.x = ((_e161.y * _e163) + -(_e168.w));
    let _e172 = u_xlat2_;
    let _e174 = u_xlat14_;
    let _e176 = u_xlat2_;
    let _e178 = (vec3(_e174) * _e176.xyz);
    u_xlat2_.x = _e178.x;
    u_xlat2_.y = _e178.y;
    u_xlat2_.z = _e178.z;
    let _e185 = u_xlat3_;
    let _e187 = u_xlat12_;
    u_xlat12_ = (_e185.x / _e187);
    let _e189 = u_xlat3_;
    u_xlat14_ = (_e189.x * 5f);
    let _e193 = u_xlat14_;
    u_xlat14_ = clamp(_e193, 0f, 1f);
    let _e197 = u_xlat0_;
    let _e199 = u_xlat12_;
    let _e201 = u_xlat0_;
    let _e207 = _f_buffer1_.f_cb1_[9];
    let _e209 = ((vec3(_e199) * _e201.xyz) + _e207.xyz);
    u_xlat0_.x = _e209.x;
    u_xlat0_.y = _e209.y;
    u_xlat0_.z = _e209.z;
    let _e221 = _f_buffer1_.f_cb1_[10];
    u_xlat12_ = (1f / _e221.w);
    let _e224 = u_xlat12_;
    let _e225 = u_xlat2_;
    u_xlat12_ = (_e224 * _e225.y);
    let _e228 = u_xlat3_;
    let _e233 = _f_buffer1_.f_cb1_[9];
    let _e238 = _f_buffer1_.f_cb1_[10];
    let _e241 = (_e233.xyz + -(_e238.xyz));
    u_xlat3_.x = _e241.x;
    u_xlat3_.y = _e241.y;
    u_xlat3_.z = _e241.z;
    let _e248 = u_xlat3_;
    let _e250 = u_xlat12_;
    let _e252 = u_xlat3_;
    let _e258 = _f_buffer1_.f_cb1_[10];
    let _e260 = ((vec3(_e250) * _e252.xyz) + _e258.xyz);
    u_xlat3_.x = _e260.x;
    u_xlat3_.y = _e260.y;
    u_xlat3_.z = _e260.z;
    let _e267 = u_xlat0_;
    let _e269 = u_xlat0_;
    let _e271 = u_xlat3_;
    let _e274 = (_e269.xyz + -(_e271.xyz));
    u_xlat0_.x = _e274.x;
    u_xlat0_.y = _e274.y;
    u_xlat0_.z = _e274.z;
    let _e281 = u_xlat0_;
    let _e283 = u_xlat14_;
    let _e285 = u_xlat0_;
    let _e288 = u_xlat3_;
    let _e290 = ((vec3(_e283) * _e285.xyz) + _e288.xyz);
    u_xlat0_.x = _e290.x;
    u_xlat0_.y = _e290.y;
    u_xlat0_.z = _e290.z;
    let _e297 = u_xlat0_;
    let _e299 = u_xlat0_;
    let _e301 = u_xlat2_;
    let _e303 = (_e299.xyz * _e301.xyz);
    u_xlat0_.x = _e303.x;
    u_xlat0_.y = _e303.y;
    u_xlat0_.z = _e303.z;
    let _e310 = u_xlat1_;
    let _e312 = u_xlat0_;
    let _e317 = _f_buffer1_.f_cb1_[2];
    let _e319 = (_e312.xyz * _e317.xxx);
    u_xlat1_.x = _e319.x;
    u_xlat1_.y = _e319.y;
    u_xlat1_.z = _e319.z;
    let _e327 = vs_TEXCOORD1_1;
    let _e331 = _f_buffer1_.f_cb1_[12];
    u_xlat0_.x = (_e327 + -(_e331.z));
    let _e336 = u_xlat0_;
    u_xlat0_.x = clamp(_e336.x, 0f, 1f);
    let _e342 = u_xlat0_;
    u_xlat0_.x = (_e342.x + -0.00001f);
    let _e347 = u_xlat0_;
    let _e350 = u_xlat1_;
    u_xlat4_ = (-(_e347.x) + _e350.w);
    let _e353 = vs_TEXCOORD1_1;
    let _e357 = _f_buffer1_.f_cb1_[12];
    u_xlat8_ = (_e353 + _e357.z);
    let _e360 = u_xlat8_;
    u_xlat8_ = clamp(_e360, 0f, 1f);
    let _e365 = u_xlat0_;
    let _e368 = u_xlat8_;
    u_xlat0_.x = (-(_e365.x) + _e368);
    let _e373 = u_xlat0_;
    u_xlat0_.x = (1f / _e373.x);
    let _e377 = u_xlat0_;
    let _e379 = u_xlat4_;
    u_xlat0_.x = (_e377.x * _e379);
    let _e382 = u_xlat0_;
    u_xlat0_.x = clamp(_e382.x, 0f, 1f);
    let _e387 = u_xlat0_;
    u_xlat4_ = ((_e387.x * -2f) + 3f);
    let _e395 = u_xlat0_;
    let _e397 = u_xlat0_;
    u_xlat0_.x = (_e395.x * _e397.x);
    let _e401 = u_xlat0_;
    let _e403 = u_xlat4_;
    u_xlat0_.x = (_e401.x * _e403);
    let _e405 = u_xlat0_;
    let _e407 = u_xlat1_;
    u_xlat0_ = (_e405.xxxx * _e407);
    let _e409 = u_xlat0_;
    let _e410 = vs_COLOR0_1;
    SV_Target0_ = (_e409 * _e410);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: f32, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e28 = SV_Target0_;
    return FragmentOutput(_e28);
}
