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
    u_xlat0_.w = dot(_e208.xyz, vec3<f32>(0.299f, 0.587f, 0.114f));
    let _e216 = u_xlat0_;
    let _e221 = _f_buffer1_.f_cb1_[2];
    u_xlat1_.x = (_e216.w + _e221.y);
    let _e225 = u_xlat0_;
    let _e230 = _f_buffer1_.f_cb1_[3];
    u_xlat5_.x = max(_e225.w, _e230.y);
    let _e233 = u_xlat1_;
    let _e235 = u_xlat5_;
    let _e241 = _f_buffer1_.f_cb1_[10];
    u_xlat9_ = ((_e233.x * _e235.x) + -(_e241.w));
    let _e246 = u_xlat5_;
    let _e248 = u_xlat1_;
    u_xlat1_.x = (_e246.x * _e248.x);
    let _e255 = _f_buffer1_.f_cb1_[10];
    u_xlat5_.x = (-(_e255.w) + 1f);
    let _e261 = u_xlat9_;
    let _e262 = u_xlat5_;
    u_xlat5_.x = (_e261 / _e262.x);
    let _e265 = u_xlat9_;
    u_xlat9_ = (_e265 * 5f);
    let _e268 = u_xlat9_;
    u_xlat9_ = clamp(_e268, 0f, 1f);
    let _e272 = u_xlat2_;
    let _e277 = _f_buffer1_.f_cb1_[8];
    let _e282 = _f_buffer1_.f_cb1_[9];
    let _e285 = (_e277.yzw + -(_e282.xyz));
    u_xlat2_.x = _e285.x;
    u_xlat2_.y = _e285.y;
    u_xlat2_.z = _e285.z;
    let _e292 = u_xlat2_;
    let _e294 = u_xlat5_;
    let _e296 = u_xlat2_;
    let _e302 = _f_buffer1_.f_cb1_[9];
    let _e304 = ((_e294.xxx * _e296.xyz) + _e302.xyz);
    u_xlat2_.x = _e304.x;
    u_xlat2_.y = _e304.y;
    u_xlat2_.z = _e304.z;
    let _e317 = _f_buffer1_.f_cb1_[10];
    u_xlat5_.x = (1f / _e317.w);
    let _e321 = u_xlat5_;
    let _e323 = u_xlat1_;
    u_xlat5_.x = (_e321.x * _e323.x);
    let _e326 = u_xlat3_;
    let _e331 = _f_buffer1_.f_cb1_[9];
    let _e336 = _f_buffer1_.f_cb1_[10];
    let _e339 = (_e331.xyz + -(_e336.xyz));
    u_xlat3_.x = _e339.x;
    u_xlat3_.y = _e339.y;
    u_xlat3_.z = _e339.z;
    let _e346 = u_xlat3_;
    let _e348 = u_xlat5_;
    let _e350 = u_xlat3_;
    let _e356 = _f_buffer1_.f_cb1_[10];
    let _e358 = ((_e348.xxx * _e350.xyz) + _e356.xyz);
    u_xlat3_.x = _e358.x;
    u_xlat3_.y = _e358.y;
    u_xlat3_.z = _e358.z;
    let _e365 = u_xlat2_;
    let _e367 = u_xlat2_;
    let _e369 = u_xlat3_;
    let _e372 = (_e367.xyz + -(_e369.xyz));
    u_xlat2_.x = _e372.x;
    u_xlat2_.y = _e372.y;
    u_xlat2_.z = _e372.z;
    let _e379 = u_xlat5_;
    let _e381 = u_xlat9_;
    let _e383 = u_xlat2_;
    let _e386 = u_xlat3_;
    let _e388 = ((vec3(_e381) * _e383.xyz) + _e386.xyz);
    u_xlat5_.x = _e388.x;
    u_xlat5_.y = _e388.y;
    u_xlat5_.z = _e388.z;
    let _e395 = u_xlat1_;
    let _e397 = u_xlat5_;
    let _e399 = u_xlat1_;
    let _e401 = (_e397.xyz * _e399.xxx);
    u_xlat1_.x = _e401.x;
    u_xlat1_.y = _e401.y;
    u_xlat1_.z = _e401.z;
    let _e408 = u_xlat0_;
    let _e410 = u_xlat1_;
    let _e415 = _f_buffer1_.f_cb1_[2];
    let _e417 = (_e410.xyz * _e415.xxx);
    u_xlat0_.x = _e417.x;
    u_xlat0_.y = _e417.y;
    u_xlat0_.z = _e417.z;
    let _e425 = vs_TEXCOORD1_1;
    let _e429 = _f_buffer1_.f_cb1_[12];
    u_xlat1_.x = (_e425 + -(_e429.z));
    let _e434 = u_xlat1_;
    u_xlat1_.x = clamp(_e434.x, 0f, 1f);
    let _e440 = u_xlat1_;
    u_xlat1_.x = (_e440.x + -0.00001f);
    let _e446 = u_xlat0_;
    let _e448 = u_xlat1_;
    u_xlat5_.x = (_e446.w + -(_e448.x));
    let _e452 = vs_TEXCOORD1_1;
    let _e456 = _f_buffer1_.f_cb1_[12];
    u_xlat9_ = (_e452 + _e456.z);
    let _e459 = u_xlat9_;
    u_xlat9_ = clamp(_e459, 0f, 1f);
    let _e464 = u_xlat1_;
    let _e467 = u_xlat9_;
    u_xlat1_.x = (-(_e464.x) + _e467);
    let _e472 = u_xlat1_;
    u_xlat1_.x = (1f / _e472.x);
    let _e476 = u_xlat1_;
    let _e478 = u_xlat5_;
    u_xlat1_.x = (_e476.x * _e478.x);
    let _e482 = u_xlat1_;
    u_xlat1_.x = clamp(_e482.x, 0f, 1f);
    let _e488 = u_xlat1_;
    u_xlat5_.x = ((_e488.x * -2f) + 3f);
    let _e496 = u_xlat1_;
    let _e498 = u_xlat1_;
    u_xlat1_.x = (_e496.x * _e498.x);
    let _e502 = u_xlat1_;
    let _e504 = u_xlat5_;
    u_xlat1_.x = (_e502.x * _e504.x);
    let _e507 = u_xlat0_;
    let _e508 = u_xlat1_;
    u_xlat0_ = (_e507 * _e508.xxxx);
    let _e511 = u_xlat0_;
    let _e512 = vs_COLOR0_1;
    SV_Target0_ = (_e511 * _e512);
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
