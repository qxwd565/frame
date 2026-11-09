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

    let _e46 = u_xlat0_;
    let _e51 = _f_buffer1_.f_cb1_[8];
    let _e56 = _f_buffer1_.f_cb1_[9];
    let _e59 = (_e51.yzw + -(_e56.xyz));
    u_xlat0_.x = _e59.x;
    u_xlat0_.y = _e59.y;
    u_xlat0_.z = _e59.z;
    let _e69 = _f_buffer1_.f_cb1_[10];
    u_xlat12_ = (-(_e69.w) + 1f);
    let _e74 = vs_TEXCOORD0_1;
    u_xlat1_ = _e74.zwxy;
    let _e76 = u_xlat1_;
    u_xlat1_ = clamp(_e76, vec4(0f), vec4(1f));
    let _e82 = u_xlat1_;
    let _e83 = vs_TEXCOORD0_1;
    u_xlat1_ = (_e82 + -(_e83.zwxy));
    let _e87 = u_xlat9_;
    let _e92 = _f_buffer1_.f_cb1_[3];
    let _e94 = u_xlat1_;
    let _e97 = vs_TEXCOORD0_1;
    let _e99 = ((_e92.zz * _e94.zw) + _e97.xy);
    u_xlat9_.x = _e99.x;
    u_xlat9_.y = _e99.y;
    let _e104 = u_xlat1_;
    let _e109 = _f_buffer1_.f_cb1_[6];
    let _e111 = u_xlat1_;
    let _e114 = vs_TEXCOORD0_1;
    let _e116 = ((_e109.xx * _e111.xy) + _e114.zw);
    u_xlat1_.x = _e116.x;
    u_xlat1_.y = _e116.y;
    let _e121 = u_xlat1_;
    let _e126 = _f_buffer0_.f_cb0_[4];
    let _e131 = hscard_bias.values[1];
    let _e134 = textureSampleBias(f_t1_, samplerf_s1_, _e121.xy, (_e126.x + _e131.x));
    u_xlat2_ = _e134;
    let _e136 = u_xlat2_;
    u_xlat1_.x = dot(_e136.xyz, vec3<f32>(0.299f, 0.587f, 0.114f));
    let _e144 = u_xlat1_;
    u_xlat1_.x = (_e144.x + -1f);
    let _e153 = _f_buffer1_.f_cb1_[7];
    let _e155 = u_xlat1_;
    u_xlat1_.x = ((_e153.w * _e155.x) + 1f);
    let _e160 = u_xlat9_;
    let _e165 = _f_buffer0_.f_cb0_[4];
    let _e170 = hscard_bias.values[0];
    let _e173 = textureSampleBias(f_t0_, samplerf_s0_, _e160.xy, (_e165.x + _e170.x));
    u_xlat2_ = _e173;
    let _e174 = u_xlat5_;
    let _e176 = u_xlat2_;
    let _e181 = _f_buffer1_.f_cb1_[2];
    let _e183 = (_e176.xyz + _e181.yyy);
    u_xlat5_.x = _e183.x;
    u_xlat5_.y = _e183.y;
    u_xlat5_.z = _e183.z;
    let _e190 = u_xlat2_;
    let _e195 = _f_buffer1_.f_cb1_[3];
    u_xlat3_ = max(_e190.w, _e195.y);
    let _e199 = u_xlat5_;
    let _e201 = u_xlat3_;
    let _e206 = _f_buffer1_.f_cb1_[10];
    u_xlat7_.x = ((_e199.y * _e201) + -(_e206.w));
    let _e210 = u_xlat5_;
    let _e212 = u_xlat5_;
    let _e214 = u_xlat3_;
    let _e216 = (_e212.xyz * vec3(_e214));
    u_xlat5_.x = _e216.x;
    u_xlat5_.y = _e216.y;
    u_xlat5_.z = _e216.z;
    let _e223 = u_xlat7_;
    let _e225 = u_xlat12_;
    u_xlat12_ = (_e223.x / _e225);
    let _e227 = u_xlat7_;
    u_xlat3_ = (_e227.x * 5f);
    let _e231 = u_xlat3_;
    u_xlat3_ = clamp(_e231, 0f, 1f);
    let _e235 = u_xlat0_;
    let _e237 = u_xlat12_;
    let _e239 = u_xlat0_;
    let _e245 = _f_buffer1_.f_cb1_[9];
    let _e247 = ((vec3(_e237) * _e239.xyz) + _e245.xyz);
    u_xlat0_.x = _e247.x;
    u_xlat0_.y = _e247.y;
    u_xlat0_.z = _e247.z;
    let _e259 = _f_buffer1_.f_cb1_[10];
    u_xlat12_ = (1f / _e259.w);
    let _e262 = u_xlat12_;
    let _e263 = u_xlat5_;
    u_xlat12_ = (_e262 * _e263.y);
    let _e266 = u_xlat7_;
    let _e271 = _f_buffer1_.f_cb1_[9];
    let _e276 = _f_buffer1_.f_cb1_[10];
    let _e279 = (_e271.xyz + -(_e276.xyz));
    u_xlat7_.x = _e279.x;
    u_xlat7_.y = _e279.y;
    u_xlat7_.z = _e279.z;
    let _e286 = u_xlat7_;
    let _e288 = u_xlat12_;
    let _e290 = u_xlat7_;
    let _e296 = _f_buffer1_.f_cb1_[10];
    let _e298 = ((vec3(_e288) * _e290.xyz) + _e296.xyz);
    u_xlat7_.x = _e298.x;
    u_xlat7_.y = _e298.y;
    u_xlat7_.z = _e298.z;
    let _e305 = u_xlat0_;
    let _e307 = u_xlat0_;
    let _e309 = u_xlat7_;
    let _e312 = (_e307.xyz + -(_e309.xyz));
    u_xlat0_.x = _e312.x;
    u_xlat0_.y = _e312.y;
    u_xlat0_.z = _e312.z;
    let _e319 = u_xlat0_;
    let _e321 = u_xlat3_;
    let _e323 = u_xlat0_;
    let _e326 = u_xlat7_;
    let _e328 = ((vec3(_e321) * _e323.xyz) + _e326.xyz);
    u_xlat0_.x = _e328.x;
    u_xlat0_.y = _e328.y;
    u_xlat0_.z = _e328.z;
    let _e335 = u_xlat0_;
    let _e337 = u_xlat0_;
    let _e339 = u_xlat5_;
    let _e341 = (_e337.xyz * _e339.xyz);
    u_xlat0_.x = _e341.x;
    u_xlat0_.y = _e341.y;
    u_xlat0_.z = _e341.z;
    let _e348 = u_xlat2_;
    let _e350 = u_xlat0_;
    let _e355 = _f_buffer1_.f_cb1_[2];
    let _e357 = (_e350.xyz * _e355.xxx);
    u_xlat2_.x = _e357.x;
    u_xlat2_.y = _e357.y;
    u_xlat2_.z = _e357.z;
    let _e364 = u_xlat1_;
    let _e366 = u_xlat2_;
    u_xlat0_ = (_e364.xxxx * _e366);
    let _e368 = u_xlat0_;
    let _e369 = vs_COLOR0_1;
    SV_Target0_ = (_e368 * _e369);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e28 = SV_Target0_;
    return FragmentOutput(_e28);
}
