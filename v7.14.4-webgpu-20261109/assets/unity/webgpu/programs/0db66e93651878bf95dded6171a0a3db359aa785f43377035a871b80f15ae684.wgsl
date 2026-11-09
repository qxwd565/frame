struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 35>,
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
@group(3) @binding(5) 
var samplerf_s2_: sampler;
@group(3) @binding(7) 
var samplerf_s3_: sampler;
@group(3) @binding(9) 
var samplerf_s4_: sampler;
@group(3) @binding(11) 
var samplerf_s5_: sampler;
@group(3) @binding(13) 
var samplerf_s6_: sampler;
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
@group(3) @binding(4) 
var f_t2_: texture_2d<f32>;
@group(3) @binding(6) 
var f_t3_: texture_2d<f32>;
@group(3) @binding(8) 
var f_t4_: texture_2d<f32>;
@group(3) @binding(10) 
var f_t5_: texture_2d<f32>;
@group(3) @binding(12) 
var f_t6_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD1_1: vec2<f32>;
var<private> vs_TEXCOORD2_1: vec4<f32>;
var<private> vs_TEXCOORD3_1: vec4<f32>;
var<private> vs_TEXCOORD4_1: vec4<f32>;
var<private> vs_TEXCOORD5_1: vec4<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec4<f32> = vec4(0f);
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlat5_: vec3<f32> = vec3(0f);
    var u_xlat6_: vec3<f32> = vec3(0f);
    var u_xlat12_: f32 = 0f;
    var u_xlatb12_: bool = false;
    var u_xlat13_: f32 = 0f;
    var local: vec3<f32>;
    var local_1: vec2<f32>;

    let _e68 = vs_TEXCOORD2_1;
    let _e73 = _f_buffer0_.f_cb0_[4];
    let _e78 = hscard_bias.values[4];
    let _e81 = textureSampleBias(f_t4_, samplerf_s4_, _e68.xy, (_e73.x + _e78.x));
    u_xlat0_ = _e81;
    let _e86 = _f_buffer1_.f_cb1_[8];
    u_xlatb12_ = (1f < _e86.x);
    let _e89 = u_xlat0_;
    let _e91 = u_xlatb12_;
    if bool(_e91) {
        let _e93 = u_xlat0_;
        local = _e93.xyz;
    } else {
        local = vec3<f32>(1f, 1f, 1f);
    }
    let _e100 = local;
    u_xlat0_.x = _e100.x;
    u_xlat0_.y = _e100.y;
    u_xlat0_.z = _e100.z;
    let _e108 = u_xlat0_;
    let _e113 = _f_buffer1_.f_cb1_[4];
    u_xlat1_.x = (_e108.x * _e113.w);
    let _e117 = u_xlat0_;
    let _e122 = _f_buffer1_.f_cb1_[5];
    u_xlat1_.y = (_e117.y * _e122.x);
    let _e125 = u_xlat0_;
    let _e127 = u_xlat1_;
    let _e129 = vs_TEXCOORD5_1;
    let _e131 = (_e127.xy + _e129.xy);
    u_xlat0_.x = _e131.x;
    u_xlat0_.y = _e131.y;
    let _e136 = u_xlat0_;
    let _e138 = u_xlatb12_;
    if bool(_e138) {
        let _e140 = u_xlat0_;
        local_1 = _e140.xy;
    } else {
        let _e142 = vs_TEXCOORD2_1;
        local_1 = _e142.xy;
    }
    let _e145 = local_1;
    u_xlat0_.x = _e145.x;
    u_xlat0_.y = _e145.y;
    let _e150 = u_xlat0_;
    let _e155 = _f_buffer0_.f_cb0_[4];
    let _e160 = hscard_bias.values[3];
    let _e163 = textureSampleBias(f_t3_, samplerf_s3_, _e150.xy, (_e155.x + _e160.x));
    u_xlat1_ = _e163;
    let _e164 = u_xlat0_;
    let _e166 = u_xlat1_;
    let _e172 = _f_buffer1_.f_cb1_[4];
    let _e174 = (-(_e166.xyz) + _e172.yyy);
    u_xlat0_.x = _e174.x;
    u_xlat0_.y = _e174.y;
    u_xlat0_.w = _e174.z;
    let _e181 = u_xlat4_;
    let _e183 = u_xlat0_;
    let _e185 = u_xlat0_;
    let _e188 = (_e183.zzz * abs(_e185.xyw));
    u_xlat4_.x = _e188.x;
    u_xlat4_.y = _e188.y;
    u_xlat4_.z = _e188.z;
    let _e196 = u_xlat0_;
    u_xlat0_.x = (abs(_e196.x) + -0.5f);
    let _e202 = u_xlat4_;
    let _e204 = u_xlat4_;
    let _e209 = _f_buffer1_.f_cb1_[3];
    let _e211 = (_e204.xyz * _e209.xyz);
    u_xlat4_.x = _e211.x;
    u_xlat4_.y = _e211.y;
    u_xlat4_.z = _e211.z;
    let _e218 = u_xlat4_;
    let _e220 = u_xlat4_;
    let _e225 = _f_buffer1_.f_cb1_[3];
    let _e227 = (_e220.xyz * _e225.www);
    u_xlat4_.x = _e227.x;
    u_xlat4_.y = _e227.y;
    u_xlat4_.z = _e227.z;
    let _e234 = u_xlat0_;
    let _e236 = u_xlat4_;
    let _e241 = _f_buffer1_.f_cb1_[4];
    let _e243 = (_e236.xyz * _e241.xxx);
    u_xlat0_.y = _e243.x;
    u_xlat0_.z = _e243.y;
    u_xlat0_.w = _e243.z;
    let _e250 = vs_TEXCOORD0_1;
    let _e255 = _f_buffer0_.f_cb0_[4];
    let _e260 = hscard_bias.values[2];
    let _e263 = textureSampleBias(f_t2_, samplerf_s2_, _e250.xy, (_e255.x + _e260.x));
    u_xlat1_ = _e263;
    let _e264 = u_xlat0_;
    let _e265 = u_xlat1_;
    u_xlat0_ = (_e264 * _e265.xxxx);
    let _e268 = vs_TEXCOORD4_1;
    let _e273 = _f_buffer0_.f_cb0_[4];
    let _e278 = hscard_bias.values[5];
    let _e281 = textureSampleBias(f_t5_, samplerf_s5_, _e268.xy, (_e273.x + _e278.x));
    u_xlat2_ = _e281;
    let _e282 = u_xlat2_;
    let _e284 = u_xlat2_;
    let _e290 = _f_buffer1_.f_cb1_[13];
    let _e292 = (-(_e284.xyz) + _e290.yyy);
    u_xlat2_.x = _e292.x;
    u_xlat2_.y = _e292.y;
    u_xlat2_.z = _e292.z;
    let _e299 = u_xlat6_;
    let _e301 = u_xlat2_;
    let _e307 = _f_buffer1_.f_cb1_[12];
    let _e309 = (abs(_e301.xyz) * _e307.xyz);
    u_xlat6_.x = _e309.x;
    u_xlat6_.y = _e309.y;
    u_xlat6_.z = _e309.z;
    let _e316 = u_xlat2_;
    u_xlat13_ = (abs(_e316.x) + -0.5f);
    let _e322 = u_xlat1_;
    let _e324 = u_xlat13_;
    u_xlat13_ = (_e322.y * _e324);
    let _e326 = u_xlat13_;
    let _e330 = _f_buffer1_.f_cb1_[13];
    u_xlat13_ = (_e326 * _e330.w);
    let _e333 = u_xlat2_;
    let _e335 = u_xlat6_;
    let _e340 = _f_buffer1_.f_cb1_[12];
    let _e342 = (_e335.xyz * _e340.www);
    u_xlat2_.x = _e342.x;
    u_xlat2_.y = _e342.y;
    u_xlat2_.z = _e342.z;
    let _e349 = u_xlat2_;
    let _e351 = u_xlat2_;
    let _e356 = _f_buffer1_.f_cb1_[13];
    let _e358 = (_e351.xyz * _e356.xxx);
    u_xlat2_.x = _e358.x;
    u_xlat2_.y = _e358.y;
    u_xlat2_.z = _e358.z;
    let _e365 = u_xlat2_;
    let _e367 = u_xlat1_;
    let _e369 = u_xlat2_;
    let _e371 = (_e367.yyy * _e369.xyz);
    u_xlat2_.x = _e371.x;
    u_xlat2_.y = _e371.y;
    u_xlat2_.z = _e371.z;
    let _e378 = u_xlat2_;
    let _e380 = u_xlat2_;
    let _e382 = vs_TEXCOORD3_1;
    let _e384 = (_e380.xyz * _e382.yyy);
    u_xlat2_.x = _e384.x;
    u_xlat2_.y = _e384.y;
    u_xlat2_.z = _e384.z;
    let _e391 = u_xlat3_;
    let _e393 = u_xlat0_;
    let _e395 = vs_TEXCOORD3_1;
    let _e398 = u_xlat2_;
    let _e400 = ((_e393.yzw * _e395.xxx) + _e398.xyz);
    u_xlat3_.x = _e400.x;
    u_xlat3_.y = _e400.y;
    u_xlat3_.z = _e400.z;
    let _e407 = u_xlat4_;
    let _e409 = u_xlat0_;
    let _e411 = vs_TEXCOORD3_1;
    let _e413 = (_e409.yzw * _e411.xxx);
    u_xlat4_.x = _e413.x;
    u_xlat4_.y = _e413.y;
    u_xlat4_.z = _e413.z;
    let _e420 = u_xlat3_;
    let _e422 = u_xlat3_;
    let _e428 = (_e422.xyz * vec3<f32>(0.5f, 0.5f, 0.5f));
    u_xlat3_.x = _e428.x;
    u_xlat3_.y = _e428.y;
    u_xlat3_.z = _e428.z;
    let _e435 = u_xlat4_;
    let _e437 = u_xlat4_;
    let _e439 = u_xlat2_;
    let _e442 = u_xlat3_;
    let _e445 = ((_e437.xyz * _e439.xyz) + -(_e442.xyz));
    u_xlat4_.x = _e445.x;
    u_xlat4_.y = _e445.y;
    u_xlat4_.z = _e445.z;
    let _e452 = u_xlat4_;
    let _e457 = _f_buffer1_.f_cb1_[13];
    let _e459 = u_xlat4_;
    let _e462 = u_xlat3_;
    let _e464 = ((_e457.zzz * _e459.xyz) + _e462.xyz);
    u_xlat4_.x = _e464.x;
    u_xlat4_.y = _e464.y;
    u_xlat4_.z = _e464.z;
    let _e471 = vs_TEXCOORD4_1;
    let _e476 = _f_buffer0_.f_cb0_[4];
    let _e481 = hscard_bias.values[6];
    let _e484 = textureSampleBias(f_t6_, samplerf_s6_, _e471.zw, (_e476.x + _e481.x));
    u_xlat2_ = _e484;
    let _e485 = u_xlat2_;
    let _e490 = _f_buffer1_.f_cb1_[20];
    u_xlat2_ = (-(_e485) + _e490.zzzz);
    let _e494 = u_xlat2_;
    u_xlat3_.x = (abs(_e494.x) + -0.5f);
    let _e500 = u_xlat2_;
    let _e505 = _f_buffer1_.f_cb1_[19];
    u_xlat2_ = (abs(_e500) * _e505);
    let _e508 = u_xlat1_;
    let _e510 = u_xlat3_;
    u_xlat3_.x = (_e508.z * _e510.x);
    let _e513 = u_xlat3_;
    let _e518 = _f_buffer1_.f_cb1_[21];
    let _e521 = u_xlat13_;
    u_xlat13_ = ((_e513.x * _e518.x) + _e521);
    let _e524 = u_xlat0_;
    let _e529 = _f_buffer1_.f_cb1_[4];
    let _e532 = u_xlat13_;
    u_xlat0_.x = ((_e524.x * _e529.z) + _e532);
    let _e534 = u_xlat3_;
    let _e539 = _f_buffer1_.f_cb1_[34];
    let _e541 = u_xlat0_;
    let _e544 = vs_TEXCOORD0_1;
    let _e546 = ((_e539.zw * _e541.xx) + _e544.xy);
    u_xlat3_.x = _e546.x;
    u_xlat3_.y = _e546.y;
    let _e551 = u_xlat3_;
    let _e556 = _f_buffer0_.f_cb0_[4];
    let _e561 = hscard_bias.values[0];
    let _e564 = textureSampleBias(f_t0_, samplerf_s0_, _e551.xy, (_e556.x + _e561.x));
    u_xlat3_ = _e564;
    let _e565 = u_xlat0_;
    let _e567 = u_xlat4_;
    let _e569 = u_xlat3_;
    let _e571 = (_e567.xyz + _e569.xyz);
    u_xlat0_.x = _e571.x;
    u_xlat0_.y = _e571.y;
    u_xlat0_.z = _e571.z;
    let _e578 = u_xlat0_;
    let _e583 = _f_buffer1_.f_cb1_[33];
    let _e588 = _f_buffer1_.f_cb1_[34];
    let _e591 = u_xlat0_;
    let _e593 = ((_e583.www * _e588.xxx) + _e591.xyz);
    u_xlat0_.x = _e593.x;
    u_xlat0_.y = _e593.y;
    u_xlat0_.z = _e593.z;
    let _e600 = u_xlat0_;
    let _e602 = u_xlat3_;
    let _e605 = u_xlat0_;
    let _e607 = (-(_e602.xyz) + _e605.xyz);
    u_xlat0_.x = _e607.x;
    u_xlat0_.y = _e607.y;
    u_xlat0_.z = _e607.z;
    let _e614 = u_xlat1_;
    let _e616 = u_xlat1_;
    u_xlat12_ = (_e614.y + _e616.x);
    let _e619 = u_xlat12_;
    u_xlat12_ = clamp(_e619, 0f, 1f);
    let _e624 = u_xlat1_;
    let _e626 = u_xlat2_;
    u_xlat1_.x = (_e624.z * _e626.w);
    let _e630 = u_xlat1_;
    let _e632 = vs_TEXCOORD3_1;
    u_xlat1_.x = (_e630.x * _e632.z);
    let _e636 = u_xlat1_;
    let _e641 = _f_buffer1_.f_cb1_[20];
    u_xlat1_.x = (_e636.x * _e641.x);
    let _e644 = u_xlat0_;
    let _e646 = u_xlat12_;
    let _e648 = u_xlat0_;
    let _e651 = u_xlat3_;
    let _e653 = ((vec3(_e646) * _e648.xyz) + _e651.xyz);
    u_xlat0_.x = _e653.x;
    u_xlat0_.y = _e653.y;
    u_xlat0_.z = _e653.z;
    let _e660 = u_xlat5_;
    let _e662 = u_xlat2_;
    let _e667 = _f_buffer1_.f_cb1_[20];
    let _e670 = u_xlat0_;
    let _e673 = ((_e662.xyz * _e667.yyy) + -(_e670.xyz));
    u_xlat5_.x = _e673.x;
    u_xlat5_.y = _e673.y;
    u_xlat5_.z = _e673.z;
    let _e680 = u_xlat0_;
    let _e682 = u_xlat1_;
    let _e684 = u_xlat5_;
    let _e687 = u_xlat0_;
    let _e689 = ((_e682.xxx * _e684.xyz) + _e687.xyz);
    u_xlat0_.x = _e689.x;
    u_xlat0_.y = _e689.y;
    u_xlat0_.z = _e689.z;
    let _e696 = u_xlat0_;
    let _e698 = u_xlat0_;
    let _e704 = clamp(_e698.xyz, vec3(0f), vec3(1f));
    u_xlat0_.x = _e704.x;
    u_xlat0_.y = _e704.y;
    u_xlat0_.z = _e704.z;
    let _e711 = u_xlat1_;
    let _e713 = u_xlat0_;
    let _e719 = (_e713.xyz + vec3<f32>(0.15f, 0.15f, 0.15f));
    u_xlat1_.x = _e719.x;
    u_xlat1_.y = _e719.y;
    u_xlat1_.z = _e719.z;
    let _e726 = u_xlat1_;
    let _e728 = u_xlat1_;
    let _e730 = vs_COLOR0_1;
    let _e732 = (_e728.xyz * _e730.xyz);
    u_xlat1_.x = _e732.x;
    u_xlat1_.y = _e732.y;
    u_xlat1_.z = _e732.z;
    let _e739 = u_xlat0_;
    let _e741 = u_xlat0_;
    let _e743 = u_xlat1_;
    let _e745 = min(_e741.xyz, _e743.xyz);
    u_xlat0_.x = _e745.x;
    u_xlat0_.y = _e745.y;
    u_xlat0_.z = _e745.z;
    let _e752 = vs_TEXCOORD1_1;
    let _e757 = _f_buffer0_.f_cb0_[4];
    let _e762 = hscard_bias.values[1];
    let _e765 = textureSampleBias(f_t1_, samplerf_s1_, _e752.xy, (_e757.x + _e762.x));
    u_xlat1_ = _e765;
    let _e766 = SV_Target0_;
    let _e768 = u_xlat0_;
    let _e770 = u_xlat1_;
    let _e772 = (_e768.xyz * _e770.xyz);
    SV_Target0_.x = _e772.x;
    SV_Target0_.y = _e772.y;
    SV_Target0_.z = _e772.z;
    SV_Target0_.w = 1f;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec2<f32>, @location(2) vs_TEXCOORD2_: vec4<f32>, @location(3) vs_TEXCOORD3_: vec4<f32>, @location(4) vs_TEXCOORD4_: vec4<f32>, @location(5) vs_TEXCOORD5_: vec4<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_TEXCOORD2_1 = vs_TEXCOORD2_;
    vs_TEXCOORD3_1 = vs_TEXCOORD3_;
    vs_TEXCOORD4_1 = vs_TEXCOORD4_;
    vs_TEXCOORD5_1 = vs_TEXCOORD5_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e68 = SV_Target0_;
    return FragmentOutput(_e68);
}
