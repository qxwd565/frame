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
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec3<f32> = vec3(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec3<f32> = vec3(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlat6_: vec3<f32> = vec3(0f);

    let _e42 = _f_buffer1_.f_cb1_[10];
    u_xlat0_.x = (-(_e42.w) + 1f);
    let _e47 = u_xlat4_;
    let _e49 = vs_TEXCOORD0_1;
    let _e50 = _e49.xy;
    u_xlat4_.x = _e50.x;
    u_xlat4_.y = _e50.y;
    let _e55 = u_xlat4_;
    let _e57 = u_xlat4_;
    let _e63 = clamp(_e57.xy, vec2(0f), vec2(1f));
    u_xlat4_.x = _e63.x;
    u_xlat4_.y = _e63.y;
    let _e68 = u_xlat4_;
    let _e70 = u_xlat4_;
    let _e72 = vs_TEXCOORD0_1;
    let _e75 = (_e70.xy + -(_e72.xy));
    u_xlat4_.x = _e75.x;
    u_xlat4_.y = _e75.y;
    let _e80 = u_xlat4_;
    let _e85 = _f_buffer1_.f_cb1_[3];
    let _e87 = u_xlat4_;
    let _e90 = vs_TEXCOORD0_1;
    let _e92 = ((_e85.zz * _e87.xy) + _e90.xy);
    u_xlat4_.x = _e92.x;
    u_xlat4_.y = _e92.y;
    let _e97 = u_xlat4_;
    let _e102 = _f_buffer0_.f_cb0_[4];
    let _e107 = hscard_bias.values[0];
    let _e110 = textureSampleBias(f_t0_, samplerf_s0_, _e97.xy, (_e102.x + _e107.x));
    u_xlat1_ = _e110.yzwx;
    let _e112 = u_xlat4_;
    let _e114 = u_xlat1_;
    let _e119 = _f_buffer1_.f_cb1_[2];
    let _e121 = (_e114.wxy + _e119.yyy);
    u_xlat4_.x = _e121.x;
    u_xlat4_.y = _e121.y;
    u_xlat4_.z = _e121.z;
    let _e129 = u_xlat1_;
    let _e134 = _f_buffer1_.f_cb1_[3];
    u_xlat2_.x = max(_e129.w, _e134.y);
    let _e138 = u_xlat4_;
    let _e140 = u_xlat2_;
    let _e146 = _f_buffer1_.f_cb1_[10];
    u_xlat6_.x = ((_e138.y * _e140.x) + -(_e146.w));
    let _e150 = u_xlat4_;
    let _e152 = u_xlat4_;
    let _e154 = u_xlat2_;
    let _e156 = (_e152.xyz * _e154.xxx);
    u_xlat4_.x = _e156.x;
    u_xlat4_.y = _e156.y;
    u_xlat4_.z = _e156.z;
    let _e164 = u_xlat6_;
    let _e166 = u_xlat0_;
    u_xlat0_.x = (_e164.x / _e166.x);
    let _e170 = u_xlat6_;
    u_xlat2_.x = (_e170.x * 5f);
    let _e175 = u_xlat2_;
    u_xlat2_.x = clamp(_e175.x, 0f, 1f);
    let _e180 = u_xlat6_;
    let _e185 = _f_buffer1_.f_cb1_[8];
    let _e190 = _f_buffer1_.f_cb1_[9];
    let _e193 = (_e185.yzw + -(_e190.xyz));
    u_xlat6_.x = _e193.x;
    u_xlat6_.y = _e193.y;
    u_xlat6_.z = _e193.z;
    let _e200 = u_xlat6_;
    let _e202 = u_xlat0_;
    let _e204 = u_xlat6_;
    let _e210 = _f_buffer1_.f_cb1_[9];
    let _e212 = ((_e202.xxx * _e204.xyz) + _e210.xyz);
    u_xlat6_.x = _e212.x;
    u_xlat6_.y = _e212.y;
    u_xlat6_.z = _e212.z;
    let _e225 = _f_buffer1_.f_cb1_[10];
    u_xlat0_.x = (1f / _e225.w);
    let _e229 = u_xlat0_;
    let _e231 = u_xlat4_;
    u_xlat0_.x = (_e229.x * _e231.y);
    let _e234 = u_xlat3_;
    let _e239 = _f_buffer1_.f_cb1_[9];
    let _e244 = _f_buffer1_.f_cb1_[10];
    let _e247 = (_e239.xyz + -(_e244.xyz));
    u_xlat3_.x = _e247.x;
    u_xlat3_.y = _e247.y;
    u_xlat3_.z = _e247.z;
    let _e254 = u_xlat3_;
    let _e256 = u_xlat0_;
    let _e258 = u_xlat3_;
    let _e264 = _f_buffer1_.f_cb1_[10];
    let _e266 = ((_e256.xxx * _e258.xyz) + _e264.xyz);
    u_xlat3_.x = _e266.x;
    u_xlat3_.y = _e266.y;
    u_xlat3_.z = _e266.z;
    let _e273 = u_xlat6_;
    let _e275 = u_xlat6_;
    let _e277 = u_xlat3_;
    let _e280 = (_e275.xyz + -(_e277.xyz));
    u_xlat6_.x = _e280.x;
    u_xlat6_.y = _e280.y;
    u_xlat6_.z = _e280.z;
    let _e287 = u_xlat2_;
    let _e289 = u_xlat2_;
    let _e291 = u_xlat6_;
    let _e294 = u_xlat3_;
    let _e296 = ((_e289.xxx * _e291.xyz) + _e294.xyz);
    u_xlat2_.x = _e296.x;
    u_xlat2_.y = _e296.y;
    u_xlat2_.z = _e296.z;
    let _e303 = u_xlat0_;
    let _e305 = u_xlat4_;
    let _e307 = u_xlat2_;
    let _e309 = (_e305.xyz * _e307.xyz);
    u_xlat0_.x = _e309.x;
    u_xlat0_.y = _e309.y;
    u_xlat0_.z = _e309.z;
    let _e316 = u_xlat1_;
    let _e318 = u_xlat0_;
    let _e323 = _f_buffer1_.f_cb1_[2];
    let _e325 = (_e318.xyz * _e323.xxx);
    u_xlat1_.x = _e325.x;
    u_xlat1_.y = _e325.y;
    u_xlat1_.z = _e325.z;
    let _e332 = u_xlat1_;
    let _e333 = vs_COLOR0_1;
    SV_Target0_ = (_e332 * _e333);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e24 = SV_Target0_;
    return FragmentOutput(_e24);
}
