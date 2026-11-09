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
    u_xlat1_.x = (_e136.w + -1f);
    let _e145 = _f_buffer1_.f_cb1_[7];
    let _e147 = u_xlat1_;
    u_xlat1_.x = ((_e145.w * _e147.x) + 1f);
    let _e152 = u_xlat9_;
    let _e157 = _f_buffer0_.f_cb0_[4];
    let _e162 = hscard_bias.values[0];
    let _e165 = textureSampleBias(f_t0_, samplerf_s0_, _e152.xy, (_e157.x + _e162.x));
    u_xlat2_ = _e165;
    let _e166 = u_xlat5_;
    let _e168 = u_xlat2_;
    let _e173 = _f_buffer1_.f_cb1_[2];
    let _e175 = (_e168.xyz + _e173.yyy);
    u_xlat5_.x = _e175.x;
    u_xlat5_.y = _e175.y;
    u_xlat5_.z = _e175.z;
    let _e182 = u_xlat2_;
    let _e187 = _f_buffer1_.f_cb1_[3];
    u_xlat3_ = max(_e182.w, _e187.y);
    let _e191 = u_xlat5_;
    let _e193 = u_xlat3_;
    let _e198 = _f_buffer1_.f_cb1_[10];
    u_xlat7_.x = ((_e191.y * _e193) + -(_e198.w));
    let _e202 = u_xlat5_;
    let _e204 = u_xlat5_;
    let _e206 = u_xlat3_;
    let _e208 = (_e204.xyz * vec3(_e206));
    u_xlat5_.x = _e208.x;
    u_xlat5_.y = _e208.y;
    u_xlat5_.z = _e208.z;
    let _e215 = u_xlat7_;
    let _e217 = u_xlat12_;
    u_xlat12_ = (_e215.x / _e217);
    let _e219 = u_xlat7_;
    u_xlat3_ = (_e219.x * 5f);
    let _e223 = u_xlat3_;
    u_xlat3_ = clamp(_e223, 0f, 1f);
    let _e227 = u_xlat0_;
    let _e229 = u_xlat12_;
    let _e231 = u_xlat0_;
    let _e237 = _f_buffer1_.f_cb1_[9];
    let _e239 = ((vec3(_e229) * _e231.xyz) + _e237.xyz);
    u_xlat0_.x = _e239.x;
    u_xlat0_.y = _e239.y;
    u_xlat0_.z = _e239.z;
    let _e251 = _f_buffer1_.f_cb1_[10];
    u_xlat12_ = (1f / _e251.w);
    let _e254 = u_xlat12_;
    let _e255 = u_xlat5_;
    u_xlat12_ = (_e254 * _e255.y);
    let _e258 = u_xlat7_;
    let _e263 = _f_buffer1_.f_cb1_[9];
    let _e268 = _f_buffer1_.f_cb1_[10];
    let _e271 = (_e263.xyz + -(_e268.xyz));
    u_xlat7_.x = _e271.x;
    u_xlat7_.y = _e271.y;
    u_xlat7_.z = _e271.z;
    let _e278 = u_xlat7_;
    let _e280 = u_xlat12_;
    let _e282 = u_xlat7_;
    let _e288 = _f_buffer1_.f_cb1_[10];
    let _e290 = ((vec3(_e280) * _e282.xyz) + _e288.xyz);
    u_xlat7_.x = _e290.x;
    u_xlat7_.y = _e290.y;
    u_xlat7_.z = _e290.z;
    let _e297 = u_xlat0_;
    let _e299 = u_xlat0_;
    let _e301 = u_xlat7_;
    let _e304 = (_e299.xyz + -(_e301.xyz));
    u_xlat0_.x = _e304.x;
    u_xlat0_.y = _e304.y;
    u_xlat0_.z = _e304.z;
    let _e311 = u_xlat0_;
    let _e313 = u_xlat3_;
    let _e315 = u_xlat0_;
    let _e318 = u_xlat7_;
    let _e320 = ((vec3(_e313) * _e315.xyz) + _e318.xyz);
    u_xlat0_.x = _e320.x;
    u_xlat0_.y = _e320.y;
    u_xlat0_.z = _e320.z;
    let _e327 = u_xlat0_;
    let _e329 = u_xlat0_;
    let _e331 = u_xlat5_;
    let _e333 = (_e329.xyz * _e331.xyz);
    u_xlat0_.x = _e333.x;
    u_xlat0_.y = _e333.y;
    u_xlat0_.z = _e333.z;
    let _e340 = u_xlat2_;
    let _e342 = u_xlat0_;
    let _e347 = _f_buffer1_.f_cb1_[2];
    let _e349 = (_e342.xyz * _e347.xxx);
    u_xlat2_.x = _e349.x;
    u_xlat2_.y = _e349.y;
    u_xlat2_.z = _e349.z;
    let _e356 = u_xlat1_;
    let _e358 = u_xlat2_;
    u_xlat0_ = (_e356.xxxx * _e358);
    let _e360 = u_xlat0_;
    let _e361 = vs_COLOR0_1;
    SV_Target0_ = (_e360 * _e361);
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
