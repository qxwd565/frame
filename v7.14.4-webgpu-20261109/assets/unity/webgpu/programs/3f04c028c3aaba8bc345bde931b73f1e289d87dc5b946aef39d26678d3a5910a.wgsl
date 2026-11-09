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
    u_xlat1_ = _e152;
    let _e153 = u_xlat3_;
    let _e155 = u_xlat1_;
    let _e160 = _f_buffer1_.f_cb1_[2];
    let _e162 = (_e155.xyz + _e160.yyy);
    u_xlat3_.x = _e162.x;
    u_xlat3_.y = _e162.y;
    u_xlat3_.z = _e162.z;
    let _e169 = u_xlat1_;
    let _e174 = _f_buffer1_.f_cb1_[3];
    u_xlat18_ = max(_e169.w, _e174.y);
    let _e178 = u_xlat3_;
    let _e180 = u_xlat18_;
    let _e185 = _f_buffer1_.f_cb1_[10];
    u_xlat4_.x = ((_e178.y * _e180) + -(_e185.w));
    let _e189 = u_xlat3_;
    let _e191 = u_xlat18_;
    let _e193 = u_xlat3_;
    let _e195 = (vec3(_e191) * _e193.xyz);
    u_xlat3_.x = _e195.x;
    u_xlat3_.y = _e195.y;
    u_xlat3_.z = _e195.z;
    let _e202 = u_xlat4_;
    let _e204 = u_xlat15_;
    u_xlat15_ = (_e202.x / _e204);
    let _e206 = u_xlat4_;
    u_xlat18_ = (_e206.x * 5f);
    let _e210 = u_xlat18_;
    u_xlat18_ = clamp(_e210, 0f, 1f);
    let _e214 = u_xlat0_;
    let _e216 = u_xlat15_;
    let _e218 = u_xlat0_;
    let _e224 = _f_buffer1_.f_cb1_[9];
    let _e226 = ((vec3(_e216) * _e218.xyz) + _e224.xyz);
    u_xlat0_.x = _e226.x;
    u_xlat0_.y = _e226.y;
    u_xlat0_.z = _e226.z;
    let _e238 = _f_buffer1_.f_cb1_[10];
    u_xlat15_ = (1f / _e238.w);
    let _e241 = u_xlat15_;
    let _e242 = u_xlat3_;
    u_xlat15_ = (_e241 * _e242.y);
    let _e245 = u_xlat4_;
    let _e250 = _f_buffer1_.f_cb1_[9];
    let _e255 = _f_buffer1_.f_cb1_[10];
    let _e258 = (_e250.xyz + -(_e255.xyz));
    u_xlat4_.x = _e258.x;
    u_xlat4_.y = _e258.y;
    u_xlat4_.z = _e258.z;
    let _e265 = u_xlat4_;
    let _e267 = u_xlat15_;
    let _e269 = u_xlat4_;
    let _e275 = _f_buffer1_.f_cb1_[10];
    let _e277 = ((vec3(_e267) * _e269.xyz) + _e275.xyz);
    u_xlat4_.x = _e277.x;
    u_xlat4_.y = _e277.y;
    u_xlat4_.z = _e277.z;
    let _e284 = u_xlat0_;
    let _e286 = u_xlat0_;
    let _e288 = u_xlat4_;
    let _e291 = (_e286.xyz + -(_e288.xyz));
    u_xlat0_.x = _e291.x;
    u_xlat0_.y = _e291.y;
    u_xlat0_.z = _e291.z;
    let _e298 = u_xlat0_;
    let _e300 = u_xlat18_;
    let _e302 = u_xlat0_;
    let _e305 = u_xlat4_;
    let _e307 = ((vec3(_e300) * _e302.xyz) + _e305.xyz);
    u_xlat0_.x = _e307.x;
    u_xlat0_.y = _e307.y;
    u_xlat0_.z = _e307.z;
    let _e314 = u_xlat0_;
    let _e316 = u_xlat0_;
    let _e318 = u_xlat3_;
    let _e320 = (_e316.xyz * _e318.xyz);
    u_xlat0_.x = _e320.x;
    u_xlat0_.y = _e320.y;
    u_xlat0_.z = _e320.z;
    let _e327 = u_xlat1_;
    let _e329 = u_xlat0_;
    let _e334 = _f_buffer1_.f_cb1_[2];
    let _e336 = (_e329.xyz * _e334.xxx);
    u_xlat1_.x = _e336.x;
    u_xlat1_.y = _e336.y;
    u_xlat1_.z = _e336.z;
    let _e343 = u_xlat2_;
    let _e344 = u_xlat1_;
    SV_Target0_ = (_e343 * _e344);
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
