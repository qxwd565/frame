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
    var u_xlat1_: vec3<f32> = vec3(0f);
    var u_xlat2_: vec3<f32> = vec3(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat5_: vec3<f32> = vec3(0f);
    var u_xlat8_: vec2<f32> = vec2(0f);
    var u_xlat9_: f32 = 0f;

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
    let _e208 = u_xlat0_;
    let _e213 = _f_buffer1_.f_cb1_[2];
    u_xlat1_.x = (_e208.w + _e213.y);
    let _e217 = u_xlat0_;
    let _e222 = _f_buffer1_.f_cb1_[3];
    u_xlat5_.x = max(_e217.w, _e222.y);
    let _e225 = u_xlat1_;
    let _e227 = u_xlat5_;
    let _e233 = _f_buffer1_.f_cb1_[10];
    u_xlat9_ = ((_e225.x * _e227.x) + -(_e233.w));
    let _e238 = u_xlat5_;
    let _e240 = u_xlat1_;
    u_xlat1_.x = (_e238.x * _e240.x);
    let _e247 = _f_buffer1_.f_cb1_[10];
    u_xlat5_.x = (-(_e247.w) + 1f);
    let _e253 = u_xlat9_;
    let _e254 = u_xlat5_;
    u_xlat5_.x = (_e253 / _e254.x);
    let _e257 = u_xlat9_;
    u_xlat9_ = (_e257 * 5f);
    let _e260 = u_xlat9_;
    u_xlat9_ = clamp(_e260, 0f, 1f);
    let _e264 = u_xlat2_;
    let _e269 = _f_buffer1_.f_cb1_[8];
    let _e274 = _f_buffer1_.f_cb1_[9];
    let _e277 = (_e269.yzw + -(_e274.xyz));
    u_xlat2_.x = _e277.x;
    u_xlat2_.y = _e277.y;
    u_xlat2_.z = _e277.z;
    let _e284 = u_xlat2_;
    let _e286 = u_xlat5_;
    let _e288 = u_xlat2_;
    let _e294 = _f_buffer1_.f_cb1_[9];
    let _e296 = ((_e286.xxx * _e288.xyz) + _e294.xyz);
    u_xlat2_.x = _e296.x;
    u_xlat2_.y = _e296.y;
    u_xlat2_.z = _e296.z;
    let _e309 = _f_buffer1_.f_cb1_[10];
    u_xlat5_.x = (1f / _e309.w);
    let _e313 = u_xlat5_;
    let _e315 = u_xlat1_;
    u_xlat5_.x = (_e313.x * _e315.x);
    let _e318 = u_xlat3_;
    let _e323 = _f_buffer1_.f_cb1_[9];
    let _e328 = _f_buffer1_.f_cb1_[10];
    let _e331 = (_e323.xyz + -(_e328.xyz));
    u_xlat3_.x = _e331.x;
    u_xlat3_.y = _e331.y;
    u_xlat3_.z = _e331.z;
    let _e338 = u_xlat3_;
    let _e340 = u_xlat5_;
    let _e342 = u_xlat3_;
    let _e348 = _f_buffer1_.f_cb1_[10];
    let _e350 = ((_e340.xxx * _e342.xyz) + _e348.xyz);
    u_xlat3_.x = _e350.x;
    u_xlat3_.y = _e350.y;
    u_xlat3_.z = _e350.z;
    let _e357 = u_xlat2_;
    let _e359 = u_xlat2_;
    let _e361 = u_xlat3_;
    let _e364 = (_e359.xyz + -(_e361.xyz));
    u_xlat2_.x = _e364.x;
    u_xlat2_.y = _e364.y;
    u_xlat2_.z = _e364.z;
    let _e371 = u_xlat5_;
    let _e373 = u_xlat9_;
    let _e375 = u_xlat2_;
    let _e378 = u_xlat3_;
    let _e380 = ((vec3(_e373) * _e375.xyz) + _e378.xyz);
    u_xlat5_.x = _e380.x;
    u_xlat5_.y = _e380.y;
    u_xlat5_.z = _e380.z;
    let _e387 = u_xlat1_;
    let _e389 = u_xlat5_;
    let _e391 = u_xlat1_;
    let _e393 = (_e389.xyz * _e391.xxx);
    u_xlat1_.x = _e393.x;
    u_xlat1_.y = _e393.y;
    u_xlat1_.z = _e393.z;
    let _e400 = u_xlat0_;
    let _e402 = u_xlat1_;
    let _e407 = _f_buffer1_.f_cb1_[2];
    let _e409 = (_e402.xyz * _e407.xxx);
    u_xlat0_.x = _e409.x;
    u_xlat0_.y = _e409.y;
    u_xlat0_.z = _e409.z;
    let _e417 = vs_TEXCOORD1_1;
    let _e421 = _f_buffer1_.f_cb1_[12];
    u_xlat1_.x = (_e417 + -(_e421.z));
    let _e426 = u_xlat1_;
    u_xlat1_.x = clamp(_e426.x, 0f, 1f);
    let _e432 = u_xlat1_;
    u_xlat1_.x = (_e432.x + -0.00001f);
    let _e438 = u_xlat0_;
    let _e440 = u_xlat1_;
    u_xlat5_.x = (_e438.w + -(_e440.x));
    let _e444 = vs_TEXCOORD1_1;
    let _e448 = _f_buffer1_.f_cb1_[12];
    u_xlat9_ = (_e444 + _e448.z);
    let _e451 = u_xlat9_;
    u_xlat9_ = clamp(_e451, 0f, 1f);
    let _e456 = u_xlat1_;
    let _e459 = u_xlat9_;
    u_xlat1_.x = (-(_e456.x) + _e459);
    let _e464 = u_xlat1_;
    u_xlat1_.x = (1f / _e464.x);
    let _e468 = u_xlat1_;
    let _e470 = u_xlat5_;
    u_xlat1_.x = (_e468.x * _e470.x);
    let _e474 = u_xlat1_;
    u_xlat1_.x = clamp(_e474.x, 0f, 1f);
    let _e480 = u_xlat1_;
    u_xlat5_.x = ((_e480.x * -2f) + 3f);
    let _e488 = u_xlat1_;
    let _e490 = u_xlat1_;
    u_xlat1_.x = (_e488.x * _e490.x);
    let _e494 = u_xlat1_;
    let _e496 = u_xlat5_;
    u_xlat1_.x = (_e494.x * _e496.x);
    let _e499 = u_xlat0_;
    let _e500 = u_xlat1_;
    u_xlat0_ = (_e499 * _e500.xxxx);
    let _e503 = u_xlat0_;
    let _e504 = vs_COLOR0_1;
    SV_Target0_ = (_e503 * _e504);
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
