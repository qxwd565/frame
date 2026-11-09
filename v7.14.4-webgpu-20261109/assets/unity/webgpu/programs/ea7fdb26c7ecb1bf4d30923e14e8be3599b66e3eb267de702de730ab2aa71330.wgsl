struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 7>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 30>,
}

struct f_buffer2_ {
    f_cb2_: array<vec4<f32>, 5>,
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
@group(1) @binding(2) 
var<uniform> _f_buffer2_: f_buffer2_;
@group(3) @binding(1) 
var samplerf_s0_: sampler;
@group(3) @binding(3) 
var samplerf_s1_: sampler;
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_NORMAL0_1: vec3<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlatb0_: bool = false;
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec3<f32> = vec3(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlatb3_: bool = false;
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlat6_: f32 = 0f;
    var local: f32;

    let _e48 = vs_TEXCOORD0_1;
    let _e53 = _f_buffer0_.f_cb0_[4];
    let _e58 = hscard_bias.values[1];
    let _e61 = textureSampleBias(f_t1_, samplerf_s1_, _e48.xy, (_e53.x + _e58.x));
    u_xlat0_ = _e61;
    let _e63 = u_xlat0_;
    let _e68 = _f_buffer2_.f_cb2_[4];
    u_xlat3_.x = (_e63.x + -(_e68.w));
    let _e72 = u_xlat3_;
    u_xlatb3_ = (_e72.x < 0f);
    let _e76 = u_xlatb3_;
    if ((select(0i, 1i, _e76) * -1i) != 0i) {
        {
            discard;
        }
    }
    let _e89 = _f_buffer2_.f_cb2_[4];
    let _e94 = _f_buffer2_.f_cb2_[4];
    u_xlat3_.x = (_e89.w * _e94.z);
    let _e98 = u_xlat3_;
    let _e105 = _f_buffer2_.f_cb2_[4];
    u_xlat3_.x = ((_e98.x * 5f) + _e105.w);
    let _e108 = u_xlat3_;
    let _e113 = _f_buffer2_.f_cb2_[4];
    u_xlat6_ = (_e108.x * _e113.x);
    let _e116 = u_xlat3_;
    let _e121 = _f_buffer2_.f_cb2_[4];
    let _e124 = u_xlat6_;
    u_xlat6_ = ((_e116.x * _e121.y) + -(_e124));
    let _e128 = u_xlat3_;
    let _e134 = _f_buffer2_.f_cb2_[4];
    let _e137 = u_xlat0_;
    u_xlat3_.x = ((-(_e128.x) * _e134.x) + _e137.x);
    let _e140 = u_xlat0_;
    let _e145 = _f_buffer2_.f_cb2_[4];
    u_xlatb0_ = (_e140.x >= _e145.w);
    let _e149 = u_xlatb0_;
    if _e149 {
        local = 1f;
    } else {
        local = 0f;
    }
    let _e154 = local;
    u_xlat0_.x = _e154;
    let _e157 = u_xlat6_;
    u_xlat6_ = (1f / _e157);
    let _e160 = u_xlat6_;
    let _e161 = u_xlat3_;
    u_xlat3_.x = (_e160 * _e161.x);
    let _e165 = u_xlat3_;
    u_xlat3_.x = clamp(_e165.x, 0f, 1f);
    let _e170 = u_xlat3_;
    u_xlat6_ = ((_e170.x * -2f) + 3f);
    let _e178 = u_xlat3_;
    let _e180 = u_xlat3_;
    u_xlat3_.x = (_e178.x * _e180.x);
    let _e184 = u_xlat6_;
    let _e186 = u_xlat3_;
    let _e189 = u_xlat0_;
    u_xlat0_.x = ((-(_e184) * _e186.x) + _e189.x);
    let _e196 = _f_buffer1_.f_cb1_[27];
    u_xlat1_.x = abs(_e196.w);
    let _e203 = _f_buffer1_.f_cb1_[28];
    u_xlat1_.y = abs(_e203.w);
    let _e210 = _f_buffer1_.f_cb1_[29];
    u_xlat1_.z = abs(_e210.w);
    let _e213 = u_xlat3_;
    let _e215 = u_xlat1_;
    let _e217 = log2(_e215.xyz);
    u_xlat3_.x = _e217.x;
    u_xlat3_.y = _e217.y;
    u_xlat3_.z = _e217.z;
    let _e224 = u_xlat3_;
    let _e226 = u_xlat3_;
    let _e232 = (_e226.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat3_.x = _e232.x;
    u_xlat3_.y = _e232.y;
    u_xlat3_.z = _e232.z;
    let _e239 = u_xlat3_;
    let _e241 = u_xlat3_;
    let _e243 = exp2(_e241.xyz);
    u_xlat3_.x = _e243.x;
    u_xlat3_.y = _e243.y;
    u_xlat3_.z = _e243.z;
    let _e250 = u_xlat3_;
    let _e252 = u_xlat3_;
    let _e266 = ((_e252.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat3_.x = _e266.x;
    u_xlat3_.y = _e266.y;
    u_xlat3_.z = _e266.z;
    let _e273 = u_xlat3_;
    let _e275 = u_xlat3_;
    let _e281 = clamp(_e275.xyz, vec3(0f), vec3(1f));
    u_xlat3_.x = _e281.x;
    u_xlat3_.y = _e281.y;
    u_xlat3_.z = _e281.z;
    let _e289 = vs_NORMAL0_1;
    let _e291 = vs_NORMAL0_1;
    u_xlat1_.x = dot(_e289.xyz, _e291.xyz);
    let _e295 = u_xlat1_;
    u_xlat1_.x = inverseSqrt(_e295.x);
    let _e298 = u_xlat1_;
    let _e300 = u_xlat1_;
    let _e302 = vs_NORMAL0_1;
    let _e304 = (_e300.xxx * _e302.xyz);
    u_xlat1_.x = _e304.x;
    u_xlat1_.y = _e304.y;
    u_xlat1_.z = _e304.z;
    let _e312 = u_xlat1_;
    let _e317 = _f_buffer0_.f_cb0_[5];
    u_xlat1_.x = dot(_e312.xyz, _e317.xyz);
    let _e321 = u_xlat1_;
    u_xlat1_.x = clamp(_e321.x, 0f, 1f);
    let _e326 = u_xlat4_;
    let _e331 = _f_buffer0_.f_cb0_[6];
    let _e336 = _f_buffer1_.f_cb1_[11];
    let _e338 = (_e331.xyz * _e336.zzz);
    u_xlat4_.x = _e338.x;
    u_xlat4_.y = _e338.y;
    u_xlat4_.z = _e338.z;
    let _e345 = u_xlat3_;
    let _e347 = u_xlat4_;
    let _e349 = u_xlat1_;
    let _e352 = u_xlat3_;
    let _e354 = ((_e347.xyz * _e349.xxx) + _e352.xyz);
    u_xlat3_.x = _e354.x;
    u_xlat3_.y = _e354.y;
    u_xlat3_.z = _e354.z;
    let _e361 = vs_TEXCOORD0_1;
    let _e366 = _f_buffer0_.f_cb0_[4];
    let _e371 = hscard_bias.values[0];
    let _e374 = textureSampleBias(f_t0_, samplerf_s0_, _e361.xy, (_e366.x + _e371.x));
    u_xlat1_ = _e374;
    let _e375 = u_xlat1_;
    let _e379 = _f_buffer2_.f_cb2_[0];
    u_xlat1_ = (_e375 * _e379);
    let _e381 = u_xlat2_;
    let _e383 = u_xlat3_;
    let _e385 = u_xlat1_;
    let _e387 = (_e383.xyz * _e385.xyz);
    u_xlat2_.x = _e387.x;
    u_xlat2_.y = _e387.y;
    u_xlat2_.z = _e387.z;
    let _e394 = u_xlat3_;
    let _e396 = u_xlat1_;
    let _e399 = u_xlat3_;
    let _e405 = _f_buffer2_.f_cb2_[1];
    let _e407 = ((-(_e396.xyz) * _e399.xyz) + _e405.xyz);
    u_xlat3_.x = _e407.x;
    u_xlat3_.y = _e407.y;
    u_xlat3_.z = _e407.z;
    let _e415 = u_xlat1_;
    SV_Target0_.w = _e415.w;
    let _e417 = SV_Target0_;
    let _e419 = u_xlat0_;
    let _e421 = u_xlat3_;
    let _e424 = u_xlat2_;
    let _e426 = ((_e419.xxx * _e421.xyz) + _e424.xyz);
    SV_Target0_.x = _e426.x;
    SV_Target0_.y = _e426.y;
    SV_Target0_.z = _e426.z;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(12) vs_NORMAL0_: vec3<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_NORMAL0_1 = vs_NORMAL0_;
    main_1();
    let _e31 = SV_Target0_;
    return FragmentOutput(_e31);
}
