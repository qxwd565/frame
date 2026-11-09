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
var<private> vs_COLOR1_1: vec4<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> vs_TEXCOORD1_1: f32;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec3<f32> = vec3(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlat6_: f32 = 0f;
    var u_xlat9_: vec2<f32> = vec2(0f);
    var u_xlat10_: f32 = 0f;
    var u_xlat12_: f32 = 0f;
    var u_xlat14_: f32 = 0f;

    let _e54 = u_xlat0_;
    let _e59 = _f_buffer1_.f_cb1_[8];
    let _e64 = _f_buffer1_.f_cb1_[9];
    let _e67 = (_e59.yzw + -(_e64.xyz));
    u_xlat0_.x = _e67.x;
    u_xlat0_.y = _e67.y;
    u_xlat0_.z = _e67.z;
    let _e77 = _f_buffer1_.f_cb1_[10];
    u_xlat12_ = (-(_e77.w) + 1f);
    let _e82 = vs_TEXCOORD0_1;
    u_xlat1_ = _e82.zwxy;
    let _e84 = u_xlat1_;
    u_xlat1_ = clamp(_e84, vec4(0f), vec4(1f));
    let _e90 = u_xlat1_;
    let _e91 = vs_TEXCOORD0_1;
    u_xlat1_ = (_e90 + -(_e91.zwxy));
    let _e95 = u_xlat9_;
    let _e100 = _f_buffer1_.f_cb1_[3];
    let _e102 = u_xlat1_;
    let _e105 = vs_TEXCOORD0_1;
    let _e107 = ((_e100.zz * _e102.zw) + _e105.xy);
    u_xlat9_.x = _e107.x;
    u_xlat9_.y = _e107.y;
    let _e112 = u_xlat1_;
    let _e117 = _f_buffer1_.f_cb1_[6];
    let _e119 = u_xlat1_;
    let _e122 = vs_TEXCOORD0_1;
    let _e124 = ((_e117.xx * _e119.xy) + _e122.zw);
    u_xlat1_.x = _e124.x;
    u_xlat1_.y = _e124.y;
    let _e129 = u_xlat1_;
    let _e134 = _f_buffer0_.f_cb0_[4];
    let _e139 = hscard_bias.values[1];
    let _e142 = textureSampleBias(f_t1_, samplerf_s1_, _e129.xy, (_e134.x + _e139.x));
    u_xlat2_ = _e142;
    let _e143 = u_xlat9_;
    let _e148 = _f_buffer0_.f_cb0_[4];
    let _e153 = hscard_bias.values[0];
    let _e156 = textureSampleBias(f_t0_, samplerf_s0_, _e143.xy, (_e148.x + _e153.x));
    u_xlat1_ = _e156;
    let _e157 = u_xlat1_;
    let _e162 = _f_buffer1_.f_cb1_[2];
    u_xlat6_ = (_e157.w + _e162.y);
    let _e165 = u_xlat1_;
    let _e170 = _f_buffer1_.f_cb1_[3];
    u_xlat10_ = max(_e165.w, _e170.y);
    let _e173 = u_xlat6_;
    let _e174 = u_xlat10_;
    let _e179 = _f_buffer1_.f_cb1_[10];
    u_xlat14_ = ((_e173 * _e174) + -(_e179.w));
    let _e183 = u_xlat10_;
    let _e184 = u_xlat6_;
    u_xlat6_ = (_e183 * _e184);
    let _e186 = u_xlat14_;
    let _e187 = u_xlat12_;
    u_xlat12_ = (_e186 / _e187);
    let _e189 = u_xlat14_;
    u_xlat10_ = (_e189 * 5f);
    let _e192 = u_xlat10_;
    u_xlat10_ = clamp(_e192, 0f, 1f);
    let _e196 = u_xlat0_;
    let _e198 = u_xlat12_;
    let _e200 = u_xlat0_;
    let _e206 = _f_buffer1_.f_cb1_[9];
    let _e208 = ((vec3(_e198) * _e200.xyz) + _e206.xyz);
    u_xlat0_.x = _e208.x;
    u_xlat0_.y = _e208.y;
    u_xlat0_.z = _e208.z;
    let _e220 = _f_buffer1_.f_cb1_[10];
    u_xlat12_ = (1f / _e220.w);
    let _e223 = u_xlat12_;
    let _e224 = u_xlat6_;
    u_xlat12_ = (_e223 * _e224);
    let _e226 = u_xlat3_;
    let _e231 = _f_buffer1_.f_cb1_[9];
    let _e236 = _f_buffer1_.f_cb1_[10];
    let _e239 = (_e231.xyz + -(_e236.xyz));
    u_xlat3_.x = _e239.x;
    u_xlat3_.y = _e239.y;
    u_xlat3_.z = _e239.z;
    let _e246 = u_xlat3_;
    let _e248 = u_xlat12_;
    let _e250 = u_xlat3_;
    let _e256 = _f_buffer1_.f_cb1_[10];
    let _e258 = ((vec3(_e248) * _e250.xyz) + _e256.xyz);
    u_xlat3_.x = _e258.x;
    u_xlat3_.y = _e258.y;
    u_xlat3_.z = _e258.z;
    let _e265 = u_xlat0_;
    let _e267 = u_xlat0_;
    let _e269 = u_xlat3_;
    let _e272 = (_e267.xyz + -(_e269.xyz));
    u_xlat0_.x = _e272.x;
    u_xlat0_.y = _e272.y;
    u_xlat0_.z = _e272.z;
    let _e279 = u_xlat0_;
    let _e281 = u_xlat10_;
    let _e283 = u_xlat0_;
    let _e286 = u_xlat3_;
    let _e288 = ((vec3(_e281) * _e283.xyz) + _e286.xyz);
    u_xlat0_.x = _e288.x;
    u_xlat0_.y = _e288.y;
    u_xlat0_.z = _e288.z;
    let _e295 = u_xlat0_;
    let _e297 = u_xlat0_;
    let _e299 = u_xlat6_;
    let _e301 = (_e297.xyz * vec3(_e299));
    u_xlat0_.x = _e301.x;
    u_xlat0_.y = _e301.y;
    u_xlat0_.z = _e301.z;
    let _e308 = u_xlat1_;
    let _e310 = u_xlat0_;
    let _e315 = _f_buffer1_.f_cb1_[2];
    let _e317 = (_e310.xyz * _e315.xxx);
    u_xlat1_.x = _e317.x;
    u_xlat1_.y = _e317.y;
    u_xlat1_.z = _e317.z;
    let _e325 = vs_TEXCOORD1_1;
    let _e329 = _f_buffer1_.f_cb1_[12];
    u_xlat0_.x = (_e325 + _e329.y);
    let _e333 = u_xlat0_;
    u_xlat0_.x = ((_e333.x * 2f) + -1f);
    let _e341 = u_xlat0_;
    let _e344 = u_xlat2_;
    u_xlat0_.x = (-(_e341.x) + _e344.x);
    let _e348 = u_xlat0_;
    u_xlat0_.x = clamp(_e348.x, 0f, 1f);
    let _e354 = u_xlat0_;
    u_xlat0_.x = log2(_e354.x);
    let _e361 = _f_buffer1_.f_cb1_[12];
    u_xlat4_.x = (_e361.z * 10f);
    let _e366 = u_xlat0_;
    let _e368 = u_xlat4_;
    u_xlat0_.x = (_e366.x * _e368.x);
    let _e372 = u_xlat0_;
    u_xlat0_.x = exp2(_e372.x);
    let _e375 = u_xlat0_;
    let _e377 = u_xlat1_;
    u_xlat2_ = (_e375.xxxx * _e377);
    let _e380 = u_xlat0_;
    u_xlat0_.x = (-(_e380.x) + 1f);
    let _e386 = u_xlat0_;
    u_xlat0_.x = log2(_e386.x);
    let _e390 = u_xlat0_;
    u_xlat0_.x = (_e390.x * 10f);
    let _e395 = u_xlat0_;
    u_xlat0_.x = exp2(_e395.x);
    let _e399 = u_xlat2_;
    u_xlat4_.x = (_e399.w * 1000000f);
    let _e404 = u_xlat4_;
    u_xlat4_.x = clamp(_e404.x, 0f, 1f);
    let _e410 = u_xlat1_;
    let _e412 = u_xlat4_;
    u_xlat4_.x = (_e410.w * _e412.x);
    let _e416 = u_xlat4_;
    let _e418 = u_xlat0_;
    u_xlat0_.x = (_e416.x * _e418.x);
    let _e421 = u_xlat4_;
    let _e426 = _f_buffer1_.f_cb1_[7];
    let _e431 = _f_buffer1_.f_cb1_[8];
    let _e433 = (_e426.xyz * _e431.xxx);
    u_xlat4_.x = _e433.x;
    u_xlat4_.y = _e433.y;
    u_xlat4_.z = _e433.z;
    let _e440 = u_xlat0_;
    let _e442 = u_xlat0_;
    let _e444 = u_xlat4_;
    let _e446 = (_e442.xxx * _e444.xyz);
    u_xlat0_.x = _e446.x;
    u_xlat0_.y = _e446.y;
    u_xlat0_.z = _e446.z;
    let _e453 = u_xlat2_;
    let _e455 = u_xlat0_;
    let _e457 = vs_COLOR1_1;
    let _e460 = u_xlat2_;
    let _e462 = ((_e455.xyz * _e457.www) + _e460.xyz);
    u_xlat2_.x = _e462.x;
    u_xlat2_.y = _e462.y;
    u_xlat2_.z = _e462.z;
    let _e469 = u_xlat2_;
    let _e470 = vs_COLOR0_1;
    SV_Target0_ = (_e469 * _e470);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(11) vs_COLOR1_: vec4<f32>, @location(10) vs_COLOR0_: vec4<f32>, @location(1) vs_TEXCOORD1_: f32) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_COLOR1_1 = vs_COLOR1_;
    vs_COLOR0_1 = vs_COLOR0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    main_1();
    let _e36 = SV_Target0_;
    return FragmentOutput(_e36);
}
