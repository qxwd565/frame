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
    u_xlat0_ = _e206.yzwx;
    let _e208 = u_xlat1_;
    let _e210 = u_xlat0_;
    let _e215 = _f_buffer1_.f_cb1_[2];
    let _e217 = (_e210.wxy + _e215.yyy);
    u_xlat1_.x = _e217.x;
    u_xlat1_.y = _e217.y;
    u_xlat1_.z = _e217.z;
    let _e224 = u_xlat0_;
    let _e229 = _f_buffer1_.f_cb1_[3];
    u_xlat13_ = max(_e224.w, _e229.y);
    let _e233 = u_xlat1_;
    let _e235 = u_xlat13_;
    let _e240 = _f_buffer1_.f_cb1_[10];
    u_xlat2_.x = ((_e233.y * _e235) + -(_e240.w));
    let _e244 = u_xlat1_;
    let _e246 = u_xlat13_;
    let _e248 = u_xlat1_;
    let _e250 = (vec3(_e246) * _e248.xyz);
    u_xlat1_.x = _e250.x;
    u_xlat1_.y = _e250.y;
    u_xlat1_.z = _e250.z;
    let _e260 = _f_buffer1_.f_cb1_[10];
    u_xlat13_ = (-(_e260.w) + 1f);
    let _e265 = u_xlat2_;
    let _e267 = u_xlat13_;
    u_xlat13_ = (_e265.x / _e267);
    let _e270 = u_xlat2_;
    u_xlat2_.x = (_e270.x * 5f);
    let _e275 = u_xlat2_;
    u_xlat2_.x = clamp(_e275.x, 0f, 1f);
    let _e280 = u_xlat6_;
    let _e285 = _f_buffer1_.f_cb1_[8];
    let _e290 = _f_buffer1_.f_cb1_[9];
    let _e293 = (_e285.yzw + -(_e290.xyz));
    u_xlat6_.x = _e293.x;
    u_xlat6_.y = _e293.y;
    u_xlat6_.z = _e293.z;
    let _e300 = u_xlat6_;
    let _e302 = u_xlat13_;
    let _e304 = u_xlat6_;
    let _e310 = _f_buffer1_.f_cb1_[9];
    let _e312 = ((vec3(_e302) * _e304.xyz) + _e310.xyz);
    u_xlat6_.x = _e312.x;
    u_xlat6_.y = _e312.y;
    u_xlat6_.z = _e312.z;
    let _e324 = _f_buffer1_.f_cb1_[10];
    u_xlat13_ = (1f / _e324.w);
    let _e327 = u_xlat13_;
    let _e328 = u_xlat1_;
    u_xlat13_ = (_e327 * _e328.y);
    let _e331 = u_xlat3_;
    let _e336 = _f_buffer1_.f_cb1_[9];
    let _e341 = _f_buffer1_.f_cb1_[10];
    let _e344 = (_e336.xyz + -(_e341.xyz));
    u_xlat3_.x = _e344.x;
    u_xlat3_.y = _e344.y;
    u_xlat3_.z = _e344.z;
    let _e351 = u_xlat3_;
    let _e353 = u_xlat13_;
    let _e355 = u_xlat3_;
    let _e361 = _f_buffer1_.f_cb1_[10];
    let _e363 = ((vec3(_e353) * _e355.xyz) + _e361.xyz);
    u_xlat3_.x = _e363.x;
    u_xlat3_.y = _e363.y;
    u_xlat3_.z = _e363.z;
    let _e370 = u_xlat6_;
    let _e372 = u_xlat6_;
    let _e374 = u_xlat3_;
    let _e377 = (_e372.xyz + -(_e374.xyz));
    u_xlat6_.x = _e377.x;
    u_xlat6_.y = _e377.y;
    u_xlat6_.z = _e377.z;
    let _e384 = u_xlat2_;
    let _e386 = u_xlat2_;
    let _e388 = u_xlat6_;
    let _e391 = u_xlat3_;
    let _e393 = ((_e386.xxx * _e388.xyz) + _e391.xyz);
    u_xlat2_.x = _e393.x;
    u_xlat2_.y = _e393.y;
    u_xlat2_.z = _e393.z;
    let _e400 = u_xlat1_;
    let _e402 = u_xlat1_;
    let _e404 = u_xlat2_;
    let _e406 = (_e402.xyz * _e404.xyz);
    u_xlat1_.x = _e406.x;
    u_xlat1_.y = _e406.y;
    u_xlat1_.z = _e406.z;
    let _e413 = u_xlat0_;
    let _e415 = u_xlat1_;
    let _e420 = _f_buffer1_.f_cb1_[2];
    let _e422 = (_e415.xyz * _e420.xxx);
    u_xlat0_.x = _e422.x;
    u_xlat0_.y = _e422.y;
    u_xlat0_.z = _e422.z;
    let _e430 = vs_TEXCOORD1_1;
    u_xlat1_.x = _e430;
    let _e432 = u_xlat1_;
    u_xlat1_.x = clamp(_e432.x, 0f, 1f);
    let _e437 = u_xlat1_;
    let _e439 = vs_COLOR0_1;
    u_xlat1_ = (_e437.xxxx * _e439);
    let _e441 = u_xlat0_;
    let _e442 = u_xlat1_;
    SV_Target0_ = (_e441 * _e442);
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
