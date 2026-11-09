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
    var u_xlat5_: f32 = 0f;
    var u_xlat6_: vec3<f32> = vec3(0f);
    var u_xlat8_: vec2<f32> = vec2(0f);
    var u_xlat9_: f32 = 0f;
    var u_xlat13_: f32 = 0f;

    let _e50 = u_xlat0_;
    let _e52 = vs_TEXCOORD0_1;
    let _e53 = _e52.zw;
    u_xlat0_.x = _e53.x;
    u_xlat0_.y = _e53.y;
    let _e58 = u_xlat0_;
    let _e60 = u_xlat0_;
    let _e66 = clamp(_e60.xy, vec2(0f), vec2(1f));
    u_xlat0_.x = _e66.x;
    u_xlat0_.y = _e66.y;
    let _e71 = u_xlat0_;
    let _e73 = u_xlat0_;
    let _e75 = vs_TEXCOORD0_1;
    let _e78 = (_e73.xy + -(_e75.zw));
    u_xlat0_.x = _e78.x;
    u_xlat0_.y = _e78.y;
    let _e83 = u_xlat0_;
    let _e88 = _f_buffer1_.f_cb1_[6];
    let _e90 = u_xlat0_;
    let _e93 = vs_TEXCOORD0_1;
    let _e95 = ((_e88.xx * _e90.xy) + _e93.zw);
    u_xlat0_.x = _e95.x;
    u_xlat0_.y = _e95.y;
    let _e100 = u_xlat0_;
    let _e105 = _f_buffer0_.f_cb0_[4];
    let _e110 = hscard_bias.values[1];
    let _e113 = textureSampleBias(f_t1_, samplerf_s1_, _e100.xy, (_e105.x + _e110.x));
    u_xlat0_ = _e113;
    let _e114 = u_xlat0_;
    let _e116 = u_xlat0_;
    let _e127 = ((_e116.xy * vec2<f32>(2f, 2f)) + vec2<f32>(-1f, -1f));
    u_xlat0_.x = _e127.x;
    u_xlat0_.y = _e127.y;
    let _e132 = u_xlat0_;
    let _e134 = u_xlat0_;
    let _e139 = _f_buffer1_.f_cb1_[5];
    let _e142 = vs_TEXCOORD0_1;
    let _e144 = ((_e134.xy * _e139.zw) + _e142.xy);
    u_xlat0_.x = _e144.x;
    u_xlat0_.y = _e144.y;
    let _e149 = u_xlat8_;
    let _e151 = u_xlat0_;
    let _e152 = _e151.xy;
    u_xlat8_.x = _e152.x;
    u_xlat8_.y = _e152.y;
    let _e157 = u_xlat8_;
    let _e159 = u_xlat8_;
    let _e165 = clamp(_e159.xy, vec2(0f), vec2(1f));
    u_xlat8_.x = _e165.x;
    u_xlat8_.y = _e165.y;
    let _e170 = u_xlat8_;
    let _e172 = u_xlat0_;
    let _e175 = u_xlat8_;
    let _e177 = (-(_e172.xy) + _e175.xy);
    u_xlat8_.x = _e177.x;
    u_xlat8_.y = _e177.y;
    let _e182 = u_xlat0_;
    let _e187 = _f_buffer1_.f_cb1_[3];
    let _e189 = u_xlat8_;
    let _e192 = u_xlat0_;
    let _e194 = ((_e187.zz * _e189.xy) + _e192.xy);
    u_xlat0_.x = _e194.x;
    u_xlat0_.y = _e194.y;
    let _e199 = u_xlat0_;
    let _e204 = _f_buffer0_.f_cb0_[4];
    let _e209 = hscard_bias.values[0];
    let _e212 = textureSampleBias(f_t0_, samplerf_s0_, _e199.xy, (_e204.x + _e209.x));
    u_xlat0_ = _e212;
    let _e213 = u_xlat1_;
    let _e215 = u_xlat0_;
    let _e220 = _f_buffer1_.f_cb1_[2];
    let _e222 = (_e215.xyz + _e220.yyy);
    u_xlat1_.x = _e222.x;
    u_xlat1_.y = _e222.y;
    u_xlat1_.z = _e222.z;
    let _e229 = u_xlat0_;
    let _e234 = _f_buffer1_.f_cb1_[3];
    u_xlat13_ = max(_e229.w, _e234.y);
    let _e238 = u_xlat1_;
    let _e240 = u_xlat13_;
    let _e245 = _f_buffer1_.f_cb1_[10];
    u_xlat2_.x = ((_e238.y * _e240) + -(_e245.w));
    let _e249 = u_xlat1_;
    let _e251 = u_xlat13_;
    let _e253 = u_xlat1_;
    let _e255 = (vec3(_e251) * _e253.xyz);
    u_xlat1_.x = _e255.x;
    u_xlat1_.y = _e255.y;
    u_xlat1_.z = _e255.z;
    let _e265 = _f_buffer1_.f_cb1_[10];
    u_xlat13_ = (-(_e265.w) + 1f);
    let _e270 = u_xlat2_;
    let _e272 = u_xlat13_;
    u_xlat13_ = (_e270.x / _e272);
    let _e275 = u_xlat2_;
    u_xlat2_.x = (_e275.x * 5f);
    let _e280 = u_xlat2_;
    u_xlat2_.x = clamp(_e280.x, 0f, 1f);
    let _e285 = u_xlat6_;
    let _e290 = _f_buffer1_.f_cb1_[8];
    let _e295 = _f_buffer1_.f_cb1_[9];
    let _e298 = (_e290.yzw + -(_e295.xyz));
    u_xlat6_.x = _e298.x;
    u_xlat6_.y = _e298.y;
    u_xlat6_.z = _e298.z;
    let _e305 = u_xlat6_;
    let _e307 = u_xlat13_;
    let _e309 = u_xlat6_;
    let _e315 = _f_buffer1_.f_cb1_[9];
    let _e317 = ((vec3(_e307) * _e309.xyz) + _e315.xyz);
    u_xlat6_.x = _e317.x;
    u_xlat6_.y = _e317.y;
    u_xlat6_.z = _e317.z;
    let _e329 = _f_buffer1_.f_cb1_[10];
    u_xlat13_ = (1f / _e329.w);
    let _e332 = u_xlat13_;
    let _e333 = u_xlat1_;
    u_xlat13_ = (_e332 * _e333.y);
    let _e336 = u_xlat3_;
    let _e341 = _f_buffer1_.f_cb1_[9];
    let _e346 = _f_buffer1_.f_cb1_[10];
    let _e349 = (_e341.xyz + -(_e346.xyz));
    u_xlat3_.x = _e349.x;
    u_xlat3_.y = _e349.y;
    u_xlat3_.z = _e349.z;
    let _e356 = u_xlat3_;
    let _e358 = u_xlat13_;
    let _e360 = u_xlat3_;
    let _e366 = _f_buffer1_.f_cb1_[10];
    let _e368 = ((vec3(_e358) * _e360.xyz) + _e366.xyz);
    u_xlat3_.x = _e368.x;
    u_xlat3_.y = _e368.y;
    u_xlat3_.z = _e368.z;
    let _e375 = u_xlat6_;
    let _e377 = u_xlat6_;
    let _e379 = u_xlat3_;
    let _e382 = (_e377.xyz + -(_e379.xyz));
    u_xlat6_.x = _e382.x;
    u_xlat6_.y = _e382.y;
    u_xlat6_.z = _e382.z;
    let _e389 = u_xlat2_;
    let _e391 = u_xlat2_;
    let _e393 = u_xlat6_;
    let _e396 = u_xlat3_;
    let _e398 = ((_e391.xxx * _e393.xyz) + _e396.xyz);
    u_xlat2_.x = _e398.x;
    u_xlat2_.y = _e398.y;
    u_xlat2_.z = _e398.z;
    let _e405 = u_xlat1_;
    let _e407 = u_xlat1_;
    let _e409 = u_xlat2_;
    let _e411 = (_e407.xyz * _e409.xyz);
    u_xlat1_.x = _e411.x;
    u_xlat1_.y = _e411.y;
    u_xlat1_.z = _e411.z;
    let _e418 = u_xlat0_;
    let _e420 = u_xlat1_;
    let _e425 = _f_buffer1_.f_cb1_[2];
    let _e427 = (_e420.xyz * _e425.xxx);
    u_xlat0_.x = _e427.x;
    u_xlat0_.y = _e427.y;
    u_xlat0_.z = _e427.z;
    let _e435 = vs_TEXCOORD1_1;
    let _e439 = _f_buffer1_.f_cb1_[12];
    u_xlat1_.x = (_e435 + -(_e439.z));
    let _e444 = u_xlat1_;
    u_xlat1_.x = clamp(_e444.x, 0f, 1f);
    let _e450 = u_xlat1_;
    u_xlat1_.x = (_e450.x + -0.00001f);
    let _e455 = u_xlat0_;
    let _e457 = u_xlat1_;
    u_xlat5_ = (_e455.w + -(_e457.x));
    let _e461 = vs_TEXCOORD1_1;
    let _e465 = _f_buffer1_.f_cb1_[12];
    u_xlat9_ = (_e461 + _e465.z);
    let _e468 = u_xlat9_;
    u_xlat9_ = clamp(_e468, 0f, 1f);
    let _e473 = u_xlat1_;
    let _e476 = u_xlat9_;
    u_xlat1_.x = (-(_e473.x) + _e476);
    let _e481 = u_xlat1_;
    u_xlat1_.x = (1f / _e481.x);
    let _e485 = u_xlat1_;
    let _e487 = u_xlat5_;
    u_xlat1_.x = (_e485.x * _e487);
    let _e490 = u_xlat1_;
    u_xlat1_.x = clamp(_e490.x, 0f, 1f);
    let _e495 = u_xlat1_;
    u_xlat5_ = ((_e495.x * -2f) + 3f);
    let _e503 = u_xlat1_;
    let _e505 = u_xlat1_;
    u_xlat1_.x = (_e503.x * _e505.x);
    let _e509 = u_xlat1_;
    let _e511 = u_xlat5_;
    u_xlat1_.x = (_e509.x * _e511);
    let _e513 = u_xlat0_;
    let _e514 = u_xlat1_;
    u_xlat0_ = (_e513 * _e514.xxxx);
    let _e517 = u_xlat0_;
    let _e518 = vs_COLOR0_1;
    SV_Target0_ = (_e517 * _e518);
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
