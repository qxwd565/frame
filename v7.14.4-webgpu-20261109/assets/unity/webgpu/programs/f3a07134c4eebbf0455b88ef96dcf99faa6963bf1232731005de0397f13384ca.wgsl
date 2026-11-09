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
    var u_xlat2_: vec3<f32> = vec3(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat6_: vec3<f32> = vec3(0f);
    var u_xlat8_: vec2<f32> = vec2(0f);
    var u_xlat13_: f32 = 0f;

    let _e44 = u_xlat0_;
    let _e46 = vs_TEXCOORD0_1;
    let _e47 = _e46.zw;
    u_xlat0_.x = _e47.x;
    u_xlat0_.y = _e47.y;
    let _e52 = u_xlat0_;
    let _e54 = u_xlat0_;
    let _e60 = clamp(_e54.xy, vec2(0f), vec2(1f));
    u_xlat0_.x = _e60.x;
    u_xlat0_.y = _e60.y;
    let _e65 = u_xlat0_;
    let _e67 = u_xlat0_;
    let _e69 = vs_TEXCOORD0_1;
    let _e72 = (_e67.xy + -(_e69.zw));
    u_xlat0_.x = _e72.x;
    u_xlat0_.y = _e72.y;
    let _e77 = u_xlat0_;
    let _e82 = _f_buffer1_.f_cb1_[6];
    let _e84 = u_xlat0_;
    let _e87 = vs_TEXCOORD0_1;
    let _e89 = ((_e82.xx * _e84.xy) + _e87.zw);
    u_xlat0_.x = _e89.x;
    u_xlat0_.y = _e89.y;
    let _e94 = u_xlat0_;
    let _e99 = _f_buffer0_.f_cb0_[4];
    let _e104 = hscard_bias.values[1];
    let _e107 = textureSampleBias(f_t1_, samplerf_s1_, _e94.xy, (_e99.x + _e104.x));
    u_xlat0_ = _e107;
    let _e108 = u_xlat0_;
    let _e110 = u_xlat0_;
    let _e121 = ((_e110.xy * vec2<f32>(2f, 2f)) + vec2<f32>(-1f, -1f));
    u_xlat0_.x = _e121.x;
    u_xlat0_.y = _e121.y;
    let _e126 = u_xlat0_;
    let _e128 = u_xlat0_;
    let _e133 = _f_buffer1_.f_cb1_[5];
    let _e136 = vs_TEXCOORD0_1;
    let _e138 = ((_e128.xy * _e133.zw) + _e136.xy);
    u_xlat0_.x = _e138.x;
    u_xlat0_.y = _e138.y;
    let _e143 = u_xlat8_;
    let _e145 = u_xlat0_;
    let _e146 = _e145.xy;
    u_xlat8_.x = _e146.x;
    u_xlat8_.y = _e146.y;
    let _e151 = u_xlat8_;
    let _e153 = u_xlat8_;
    let _e159 = clamp(_e153.xy, vec2(0f), vec2(1f));
    u_xlat8_.x = _e159.x;
    u_xlat8_.y = _e159.y;
    let _e164 = u_xlat8_;
    let _e166 = u_xlat0_;
    let _e169 = u_xlat8_;
    let _e171 = (-(_e166.xy) + _e169.xy);
    u_xlat8_.x = _e171.x;
    u_xlat8_.y = _e171.y;
    let _e176 = u_xlat0_;
    let _e181 = _f_buffer1_.f_cb1_[3];
    let _e183 = u_xlat8_;
    let _e186 = u_xlat0_;
    let _e188 = ((_e181.zz * _e183.xy) + _e186.xy);
    u_xlat0_.x = _e188.x;
    u_xlat0_.y = _e188.y;
    let _e193 = u_xlat0_;
    let _e198 = _f_buffer0_.f_cb0_[4];
    let _e203 = hscard_bias.values[0];
    let _e206 = textureSampleBias(f_t0_, samplerf_s0_, _e193.xy, (_e198.x + _e203.x));
    u_xlat0_ = _e206;
    let _e207 = u_xlat1_;
    let _e209 = u_xlat0_;
    let _e214 = _f_buffer1_.f_cb1_[2];
    let _e216 = (_e209.xyz + _e214.yyy);
    u_xlat1_.x = _e216.x;
    u_xlat1_.y = _e216.y;
    u_xlat1_.z = _e216.z;
    let _e223 = u_xlat0_;
    let _e228 = _f_buffer1_.f_cb1_[3];
    u_xlat13_ = max(_e223.w, _e228.y);
    let _e232 = u_xlat1_;
    let _e234 = u_xlat13_;
    let _e239 = _f_buffer1_.f_cb1_[10];
    u_xlat2_.x = ((_e232.y * _e234) + -(_e239.w));
    let _e243 = u_xlat1_;
    let _e245 = u_xlat13_;
    let _e247 = u_xlat1_;
    let _e249 = (vec3(_e245) * _e247.xyz);
    u_xlat1_.x = _e249.x;
    u_xlat1_.y = _e249.y;
    u_xlat1_.z = _e249.z;
    let _e259 = _f_buffer1_.f_cb1_[10];
    u_xlat13_ = (-(_e259.w) + 1f);
    let _e264 = u_xlat2_;
    let _e266 = u_xlat13_;
    u_xlat13_ = (_e264.x / _e266);
    let _e269 = u_xlat2_;
    u_xlat2_.x = (_e269.x * 5f);
    let _e274 = u_xlat2_;
    u_xlat2_.x = clamp(_e274.x, 0f, 1f);
    let _e279 = u_xlat6_;
    let _e284 = _f_buffer1_.f_cb1_[8];
    let _e289 = _f_buffer1_.f_cb1_[9];
    let _e292 = (_e284.yzw + -(_e289.xyz));
    u_xlat6_.x = _e292.x;
    u_xlat6_.y = _e292.y;
    u_xlat6_.z = _e292.z;
    let _e299 = u_xlat6_;
    let _e301 = u_xlat13_;
    let _e303 = u_xlat6_;
    let _e309 = _f_buffer1_.f_cb1_[9];
    let _e311 = ((vec3(_e301) * _e303.xyz) + _e309.xyz);
    u_xlat6_.x = _e311.x;
    u_xlat6_.y = _e311.y;
    u_xlat6_.z = _e311.z;
    let _e323 = _f_buffer1_.f_cb1_[10];
    u_xlat13_ = (1f / _e323.w);
    let _e326 = u_xlat13_;
    let _e327 = u_xlat1_;
    u_xlat13_ = (_e326 * _e327.y);
    let _e330 = u_xlat3_;
    let _e335 = _f_buffer1_.f_cb1_[9];
    let _e340 = _f_buffer1_.f_cb1_[10];
    let _e343 = (_e335.xyz + -(_e340.xyz));
    u_xlat3_.x = _e343.x;
    u_xlat3_.y = _e343.y;
    u_xlat3_.z = _e343.z;
    let _e350 = u_xlat3_;
    let _e352 = u_xlat13_;
    let _e354 = u_xlat3_;
    let _e360 = _f_buffer1_.f_cb1_[10];
    let _e362 = ((vec3(_e352) * _e354.xyz) + _e360.xyz);
    u_xlat3_.x = _e362.x;
    u_xlat3_.y = _e362.y;
    u_xlat3_.z = _e362.z;
    let _e369 = u_xlat6_;
    let _e371 = u_xlat6_;
    let _e373 = u_xlat3_;
    let _e376 = (_e371.xyz + -(_e373.xyz));
    u_xlat6_.x = _e376.x;
    u_xlat6_.y = _e376.y;
    u_xlat6_.z = _e376.z;
    let _e383 = u_xlat2_;
    let _e385 = u_xlat2_;
    let _e387 = u_xlat6_;
    let _e390 = u_xlat3_;
    let _e392 = ((_e385.xxx * _e387.xyz) + _e390.xyz);
    u_xlat2_.x = _e392.x;
    u_xlat2_.y = _e392.y;
    u_xlat2_.z = _e392.z;
    let _e399 = u_xlat1_;
    let _e401 = u_xlat1_;
    let _e403 = u_xlat2_;
    let _e405 = (_e401.xyz * _e403.xyz);
    u_xlat1_.x = _e405.x;
    u_xlat1_.y = _e405.y;
    u_xlat1_.z = _e405.z;
    let _e412 = u_xlat0_;
    let _e414 = u_xlat1_;
    let _e419 = _f_buffer1_.f_cb1_[2];
    let _e421 = (_e414.xyz * _e419.xxx);
    u_xlat0_.x = _e421.x;
    u_xlat0_.y = _e421.y;
    u_xlat0_.z = _e421.z;
    let _e429 = vs_TEXCOORD1_1;
    u_xlat1_.x = _e429;
    let _e431 = u_xlat1_;
    u_xlat1_.x = clamp(_e431.x, 0f, 1f);
    let _e436 = u_xlat1_;
    let _e438 = vs_COLOR0_1;
    u_xlat1_ = (_e436.xxxx * _e438);
    let _e440 = u_xlat0_;
    let _e441 = u_xlat1_;
    SV_Target0_ = (_e440 * _e441);
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
