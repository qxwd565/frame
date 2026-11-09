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
var<private> vs_COLOR1_1: vec4<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: f32 = 0f;
    var u_xlat7_: vec3<f32> = vec3(0f);
    var u_xlat9_: vec2<f32> = vec2(0f);
    var u_xlat12_: f32 = 0f;

    let _e43 = u_xlat0_;
    let _e48 = _f_buffer1_.f_cb1_[8];
    let _e53 = _f_buffer1_.f_cb1_[9];
    let _e56 = (_e48.yzw + -(_e53.xyz));
    u_xlat0_.x = _e56.x;
    u_xlat0_.y = _e56.y;
    u_xlat0_.z = _e56.z;
    let _e66 = _f_buffer1_.f_cb1_[10];
    u_xlat12_ = (-(_e66.w) + 1f);
    let _e71 = vs_TEXCOORD0_1;
    u_xlat1_ = _e71.zwxy;
    let _e73 = u_xlat1_;
    u_xlat1_ = clamp(_e73, vec4(0f), vec4(1f));
    let _e79 = u_xlat1_;
    let _e80 = vs_TEXCOORD0_1;
    u_xlat1_ = (_e79 + -(_e80.zwxy));
    let _e84 = u_xlat9_;
    let _e89 = _f_buffer1_.f_cb1_[3];
    let _e91 = u_xlat1_;
    let _e94 = vs_TEXCOORD0_1;
    let _e96 = ((_e89.zz * _e91.zw) + _e94.xy);
    u_xlat9_.x = _e96.x;
    u_xlat9_.y = _e96.y;
    let _e101 = u_xlat1_;
    let _e106 = _f_buffer1_.f_cb1_[6];
    let _e108 = u_xlat1_;
    let _e111 = vs_TEXCOORD0_1;
    let _e113 = ((_e106.xx * _e108.xy) + _e111.zw);
    u_xlat1_.x = _e113.x;
    u_xlat1_.y = _e113.y;
    let _e118 = u_xlat1_;
    let _e123 = _f_buffer0_.f_cb0_[4];
    let _e128 = hscard_bias.values[1];
    let _e131 = textureSampleBias(f_t1_, samplerf_s1_, _e118.xy, (_e123.x + _e128.x));
    u_xlat2_ = _e131;
    let _e132 = u_xlat9_;
    let _e137 = _f_buffer0_.f_cb0_[4];
    let _e142 = hscard_bias.values[0];
    let _e145 = textureSampleBias(f_t0_, samplerf_s0_, _e132.xy, (_e137.x + _e142.x));
    u_xlat1_ = _e145;
    let _e146 = u_xlat2_;
    let _e148 = u_xlat1_;
    let _e153 = _f_buffer1_.f_cb1_[2];
    let _e155 = (_e148.xyz + _e153.yyy);
    u_xlat2_.x = _e155.x;
    u_xlat2_.y = _e155.y;
    u_xlat2_.z = _e155.z;
    let _e162 = u_xlat1_;
    let _e167 = _f_buffer1_.f_cb1_[3];
    u_xlat3_ = max(_e162.w, _e167.y);
    let _e171 = u_xlat2_;
    let _e173 = u_xlat3_;
    let _e178 = _f_buffer1_.f_cb1_[10];
    u_xlat7_.x = ((_e171.y * _e173) + -(_e178.w));
    let _e182 = u_xlat2_;
    let _e184 = u_xlat2_;
    let _e186 = u_xlat3_;
    let _e188 = (_e184.xyz * vec3(_e186));
    u_xlat2_.x = _e188.x;
    u_xlat2_.y = _e188.y;
    u_xlat2_.z = _e188.z;
    let _e195 = u_xlat7_;
    let _e197 = u_xlat12_;
    u_xlat12_ = (_e195.x / _e197);
    let _e199 = u_xlat7_;
    u_xlat3_ = (_e199.x * 5f);
    let _e203 = u_xlat3_;
    u_xlat3_ = clamp(_e203, 0f, 1f);
    let _e207 = u_xlat0_;
    let _e209 = u_xlat12_;
    let _e211 = u_xlat0_;
    let _e217 = _f_buffer1_.f_cb1_[9];
    let _e219 = ((vec3(_e209) * _e211.xyz) + _e217.xyz);
    u_xlat0_.x = _e219.x;
    u_xlat0_.y = _e219.y;
    u_xlat0_.z = _e219.z;
    let _e231 = _f_buffer1_.f_cb1_[10];
    u_xlat12_ = (1f / _e231.w);
    let _e234 = u_xlat12_;
    let _e235 = u_xlat2_;
    u_xlat12_ = (_e234 * _e235.y);
    let _e238 = u_xlat7_;
    let _e243 = _f_buffer1_.f_cb1_[9];
    let _e248 = _f_buffer1_.f_cb1_[10];
    let _e251 = (_e243.xyz + -(_e248.xyz));
    u_xlat7_.x = _e251.x;
    u_xlat7_.y = _e251.y;
    u_xlat7_.z = _e251.z;
    let _e258 = u_xlat7_;
    let _e260 = u_xlat12_;
    let _e262 = u_xlat7_;
    let _e268 = _f_buffer1_.f_cb1_[10];
    let _e270 = ((vec3(_e260) * _e262.xyz) + _e268.xyz);
    u_xlat7_.x = _e270.x;
    u_xlat7_.y = _e270.y;
    u_xlat7_.z = _e270.z;
    let _e277 = u_xlat0_;
    let _e279 = u_xlat0_;
    let _e281 = u_xlat7_;
    let _e284 = (_e279.xyz + -(_e281.xyz));
    u_xlat0_.x = _e284.x;
    u_xlat0_.y = _e284.y;
    u_xlat0_.z = _e284.z;
    let _e291 = u_xlat0_;
    let _e293 = u_xlat3_;
    let _e295 = u_xlat0_;
    let _e298 = u_xlat7_;
    let _e300 = ((vec3(_e293) * _e295.xyz) + _e298.xyz);
    u_xlat0_.x = _e300.x;
    u_xlat0_.y = _e300.y;
    u_xlat0_.z = _e300.z;
    let _e307 = u_xlat0_;
    let _e309 = u_xlat0_;
    let _e311 = u_xlat2_;
    let _e313 = (_e309.xyz * _e311.xyz);
    u_xlat0_.x = _e313.x;
    u_xlat0_.y = _e313.y;
    u_xlat0_.z = _e313.z;
    let _e320 = u_xlat1_;
    let _e322 = u_xlat0_;
    let _e327 = _f_buffer1_.f_cb1_[2];
    let _e329 = (_e322.xyz * _e327.xxx);
    u_xlat1_.x = _e329.x;
    u_xlat1_.y = _e329.y;
    u_xlat1_.z = _e329.z;
    let _e336 = u_xlat2_;
    let _e338 = vs_COLOR1_1;
    let _e340 = u_xlat1_;
    u_xlat0_ = ((_e336.wwww * _e338) + _e340);
    let _e342 = u_xlat0_;
    let _e343 = vs_COLOR0_1;
    SV_Target0_ = (_e342 * _e343);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(11) vs_COLOR1_: vec4<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_COLOR1_1 = vs_COLOR1_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e32 = SV_Target0_;
    return FragmentOutput(_e32);
}
