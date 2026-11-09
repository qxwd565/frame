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
@group(3) @binding(15) 
var samplerf_s7_: sampler;
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
@group(3) @binding(14) 
var f_t7_: texture_2d<f32>;
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
    var u_xlat6_: vec3<f32> = vec3(0f);
    var u_xlat12_: f32 = 0f;
    var u_xlatb12_: bool = false;
    var u_xlat13_: f32 = 0f;
    var local: vec3<f32>;
    var local_1: vec2<f32>;

    let _e66 = vs_TEXCOORD2_1;
    let _e71 = _f_buffer0_.f_cb0_[4];
    let _e76 = hscard_bias.values[4];
    let _e79 = textureSampleBias(f_t4_, samplerf_s4_, _e66.xy, (_e71.x + _e76.x));
    u_xlat0_ = _e79;
    let _e84 = _f_buffer1_.f_cb1_[8];
    u_xlatb12_ = (1f < _e84.x);
    let _e87 = u_xlat0_;
    let _e89 = u_xlatb12_;
    if bool(_e89) {
        let _e91 = u_xlat0_;
        local = _e91.xyz;
    } else {
        local = vec3<f32>(1f, 1f, 1f);
    }
    let _e98 = local;
    u_xlat0_.x = _e98.x;
    u_xlat0_.y = _e98.y;
    u_xlat0_.z = _e98.z;
    let _e106 = u_xlat0_;
    let _e111 = _f_buffer1_.f_cb1_[4];
    u_xlat1_.x = (_e106.x * _e111.w);
    let _e115 = u_xlat0_;
    let _e120 = _f_buffer1_.f_cb1_[5];
    u_xlat1_.y = (_e115.y * _e120.x);
    let _e123 = u_xlat0_;
    let _e125 = u_xlat1_;
    let _e127 = vs_TEXCOORD5_1;
    let _e129 = (_e125.xy + _e127.xy);
    u_xlat0_.x = _e129.x;
    u_xlat0_.y = _e129.y;
    let _e134 = u_xlat0_;
    let _e136 = u_xlatb12_;
    if bool(_e136) {
        let _e138 = u_xlat0_;
        local_1 = _e138.xy;
    } else {
        let _e140 = vs_TEXCOORD2_1;
        local_1 = _e140.xy;
    }
    let _e143 = local_1;
    u_xlat0_.x = _e143.x;
    u_xlat0_.y = _e143.y;
    let _e148 = u_xlat0_;
    let _e153 = _f_buffer0_.f_cb0_[4];
    let _e158 = hscard_bias.values[3];
    let _e161 = textureSampleBias(f_t3_, samplerf_s3_, _e148.xy, (_e153.x + _e158.x));
    u_xlat1_ = _e161;
    let _e162 = u_xlat0_;
    let _e164 = u_xlat1_;
    let _e170 = _f_buffer1_.f_cb1_[4];
    let _e172 = (-(_e164.xyz) + _e170.yyy);
    u_xlat0_.x = _e172.x;
    u_xlat0_.y = _e172.y;
    u_xlat0_.w = _e172.z;
    let _e179 = u_xlat4_;
    let _e181 = u_xlat0_;
    let _e183 = u_xlat0_;
    let _e186 = (_e181.zzz * abs(_e183.xyw));
    u_xlat4_.x = _e186.x;
    u_xlat4_.y = _e186.y;
    u_xlat4_.z = _e186.z;
    let _e194 = u_xlat0_;
    u_xlat0_.x = (abs(_e194.x) + -0.5f);
    let _e200 = u_xlat4_;
    let _e202 = u_xlat4_;
    let _e207 = _f_buffer1_.f_cb1_[3];
    let _e209 = (_e202.xyz * _e207.xyz);
    u_xlat4_.x = _e209.x;
    u_xlat4_.y = _e209.y;
    u_xlat4_.z = _e209.z;
    let _e216 = u_xlat4_;
    let _e218 = u_xlat4_;
    let _e223 = _f_buffer1_.f_cb1_[3];
    let _e225 = (_e218.xyz * _e223.www);
    u_xlat4_.x = _e225.x;
    u_xlat4_.y = _e225.y;
    u_xlat4_.z = _e225.z;
    let _e232 = u_xlat0_;
    let _e234 = u_xlat4_;
    let _e239 = _f_buffer1_.f_cb1_[4];
    let _e241 = (_e234.xyz * _e239.xxx);
    u_xlat0_.y = _e241.x;
    u_xlat0_.z = _e241.y;
    u_xlat0_.w = _e241.z;
    let _e248 = vs_TEXCOORD0_1;
    let _e253 = _f_buffer0_.f_cb0_[4];
    let _e258 = hscard_bias.values[2];
    let _e261 = textureSampleBias(f_t2_, samplerf_s2_, _e248.xy, (_e253.x + _e258.x));
    u_xlat1_ = _e261;
    let _e262 = u_xlat0_;
    let _e263 = u_xlat1_;
    u_xlat0_ = (_e262 * _e263.xxxx);
    let _e266 = vs_TEXCOORD4_1;
    let _e271 = _f_buffer0_.f_cb0_[4];
    let _e276 = hscard_bias.values[5];
    let _e279 = textureSampleBias(f_t5_, samplerf_s5_, _e266.xy, (_e271.x + _e276.x));
    u_xlat2_ = _e279;
    let _e280 = u_xlat2_;
    let _e282 = u_xlat2_;
    let _e288 = _f_buffer1_.f_cb1_[13];
    let _e290 = (-(_e282.xyz) + _e288.yyy);
    u_xlat2_.x = _e290.x;
    u_xlat2_.y = _e290.y;
    u_xlat2_.z = _e290.z;
    let _e297 = u_xlat6_;
    let _e299 = u_xlat2_;
    let _e305 = _f_buffer1_.f_cb1_[12];
    let _e307 = (abs(_e299.xyz) * _e305.xyz);
    u_xlat6_.x = _e307.x;
    u_xlat6_.y = _e307.y;
    u_xlat6_.z = _e307.z;
    let _e314 = u_xlat2_;
    u_xlat13_ = (abs(_e314.x) + -0.5f);
    let _e320 = u_xlat1_;
    let _e322 = u_xlat13_;
    u_xlat13_ = (_e320.y * _e322);
    let _e324 = u_xlat13_;
    let _e328 = _f_buffer1_.f_cb1_[13];
    u_xlat13_ = (_e324 * _e328.w);
    let _e331 = u_xlat2_;
    let _e333 = u_xlat6_;
    let _e338 = _f_buffer1_.f_cb1_[12];
    let _e340 = (_e333.xyz * _e338.www);
    u_xlat2_.x = _e340.x;
    u_xlat2_.y = _e340.y;
    u_xlat2_.z = _e340.z;
    let _e347 = u_xlat2_;
    let _e349 = u_xlat2_;
    let _e354 = _f_buffer1_.f_cb1_[13];
    let _e356 = (_e349.xyz * _e354.xxx);
    u_xlat2_.x = _e356.x;
    u_xlat2_.y = _e356.y;
    u_xlat2_.z = _e356.z;
    let _e363 = u_xlat2_;
    let _e365 = u_xlat1_;
    let _e367 = u_xlat2_;
    let _e369 = (_e365.yyy * _e367.xyz);
    u_xlat2_.x = _e369.x;
    u_xlat2_.y = _e369.y;
    u_xlat2_.z = _e369.z;
    let _e376 = u_xlat2_;
    let _e378 = u_xlat2_;
    let _e380 = vs_TEXCOORD3_1;
    let _e382 = (_e378.xyz * _e380.yyy);
    u_xlat2_.x = _e382.x;
    u_xlat2_.y = _e382.y;
    u_xlat2_.z = _e382.z;
    let _e389 = u_xlat3_;
    let _e391 = u_xlat0_;
    let _e393 = vs_TEXCOORD3_1;
    let _e396 = u_xlat2_;
    let _e398 = ((_e391.yzw * _e393.xxx) + _e396.xyz);
    u_xlat3_.x = _e398.x;
    u_xlat3_.y = _e398.y;
    u_xlat3_.z = _e398.z;
    let _e405 = u_xlat4_;
    let _e407 = u_xlat0_;
    let _e409 = vs_TEXCOORD3_1;
    let _e411 = (_e407.yzw * _e409.xxx);
    u_xlat4_.x = _e411.x;
    u_xlat4_.y = _e411.y;
    u_xlat4_.z = _e411.z;
    let _e418 = u_xlat3_;
    let _e420 = u_xlat3_;
    let _e426 = (_e420.xyz * vec3<f32>(0.5f, 0.5f, 0.5f));
    u_xlat3_.x = _e426.x;
    u_xlat3_.y = _e426.y;
    u_xlat3_.z = _e426.z;
    let _e433 = u_xlat4_;
    let _e435 = u_xlat4_;
    let _e437 = u_xlat2_;
    let _e440 = u_xlat3_;
    let _e443 = ((_e435.xyz * _e437.xyz) + -(_e440.xyz));
    u_xlat4_.x = _e443.x;
    u_xlat4_.y = _e443.y;
    u_xlat4_.z = _e443.z;
    let _e450 = u_xlat4_;
    let _e455 = _f_buffer1_.f_cb1_[13];
    let _e457 = u_xlat4_;
    let _e460 = u_xlat3_;
    let _e462 = ((_e455.zzz * _e457.xyz) + _e460.xyz);
    u_xlat4_.x = _e462.x;
    u_xlat4_.y = _e462.y;
    u_xlat4_.z = _e462.z;
    let _e469 = vs_TEXCOORD4_1;
    let _e474 = _f_buffer0_.f_cb0_[4];
    let _e479 = hscard_bias.values[7];
    let _e482 = textureSampleBias(f_t7_, samplerf_s7_, _e469.zw, (_e474.x + _e479.x));
    u_xlat2_ = _e482;
    let _e483 = u_xlat2_;
    let _e485 = u_xlat2_;
    let _e490 = _f_buffer1_.f_cb1_[21];
    let _e493 = vs_TEXCOORD5_1;
    let _e495 = ((_e485.xy * _e490.yz) + _e493.zw);
    u_xlat2_.x = _e495.x;
    u_xlat2_.y = _e495.y;
    let _e500 = u_xlat2_;
    let _e505 = _f_buffer0_.f_cb0_[4];
    let _e510 = hscard_bias.values[6];
    let _e513 = textureSampleBias(f_t6_, samplerf_s6_, _e500.xy, (_e505.x + _e510.x));
    u_xlat3_ = _e513;
    let _e514 = u_xlat2_;
    let _e516 = u_xlat3_;
    let _e522 = _f_buffer1_.f_cb1_[20];
    let _e524 = (-(_e516.xyz) + _e522.zzz);
    u_xlat2_.x = _e524.x;
    u_xlat2_.y = _e524.y;
    u_xlat2_.w = _e524.z;
    let _e531 = u_xlat6_;
    let _e533 = u_xlat2_;
    let _e535 = u_xlat2_;
    let _e538 = (_e533.zzz * abs(_e535.xyw));
    u_xlat6_.x = _e538.x;
    u_xlat6_.y = _e538.y;
    u_xlat6_.z = _e538.z;
    let _e546 = u_xlat2_;
    u_xlat2_.x = (abs(_e546.x) + -0.5f);
    let _e553 = u_xlat1_;
    let _e555 = u_xlat2_;
    u_xlat2_.x = (_e553.z * _e555.x);
    let _e558 = u_xlat2_;
    let _e563 = _f_buffer1_.f_cb1_[21];
    let _e566 = u_xlat13_;
    u_xlat13_ = ((_e558.x * _e563.x) + _e566);
    let _e568 = u_xlat2_;
    let _e570 = u_xlat6_;
    let _e575 = _f_buffer1_.f_cb1_[19];
    let _e577 = (_e570.xyz * _e575.xyz);
    u_xlat2_.x = _e577.x;
    u_xlat2_.y = _e577.y;
    u_xlat2_.z = _e577.z;
    let _e584 = u_xlat2_;
    let _e586 = u_xlat2_;
    let _e591 = _f_buffer1_.f_cb1_[19];
    let _e593 = (_e586.xyz * _e591.www);
    u_xlat2_.x = _e593.x;
    u_xlat2_.y = _e593.y;
    u_xlat2_.z = _e593.z;
    let _e600 = u_xlat2_;
    let _e602 = u_xlat2_;
    let _e607 = _f_buffer1_.f_cb1_[20];
    let _e609 = (_e602.xyz * _e607.xxx);
    u_xlat2_.x = _e609.x;
    u_xlat2_.y = _e609.y;
    u_xlat2_.z = _e609.z;
    let _e616 = u_xlat2_;
    let _e618 = u_xlat1_;
    let _e620 = u_xlat2_;
    let _e622 = (_e618.zzz * _e620.xyz);
    u_xlat2_.x = _e622.x;
    u_xlat2_.y = _e622.y;
    u_xlat2_.z = _e622.z;
    let _e629 = u_xlat3_;
    let _e631 = u_xlat2_;
    let _e633 = vs_TEXCOORD3_1;
    let _e636 = u_xlat4_;
    let _e638 = ((_e631.xyz * _e633.zzz) + _e636.xyz);
    u_xlat3_.x = _e638.x;
    u_xlat3_.y = _e638.y;
    u_xlat3_.z = _e638.z;
    let _e645 = u_xlat2_;
    let _e647 = u_xlat2_;
    let _e649 = vs_TEXCOORD3_1;
    let _e651 = (_e647.xyz * _e649.zzz);
    u_xlat2_.x = _e651.x;
    u_xlat2_.y = _e651.y;
    u_xlat2_.z = _e651.z;
    let _e658 = u_xlat3_;
    let _e660 = u_xlat3_;
    let _e666 = (_e660.xyz * vec3<f32>(0.5f, 0.5f, 0.5f));
    u_xlat3_.x = _e666.x;
    u_xlat3_.y = _e666.y;
    u_xlat3_.z = _e666.z;
    let _e673 = u_xlat4_;
    let _e675 = u_xlat4_;
    let _e677 = u_xlat2_;
    let _e680 = u_xlat3_;
    let _e683 = ((_e675.xyz * _e677.xyz) + -(_e680.xyz));
    u_xlat4_.x = _e683.x;
    u_xlat4_.y = _e683.y;
    u_xlat4_.z = _e683.z;
    let _e690 = u_xlat4_;
    let _e695 = _f_buffer1_.f_cb1_[20];
    let _e697 = u_xlat4_;
    let _e700 = u_xlat3_;
    let _e702 = ((_e695.www * _e697.xyz) + _e700.xyz);
    u_xlat4_.x = _e702.x;
    u_xlat4_.y = _e702.y;
    u_xlat4_.z = _e702.z;
    let _e710 = u_xlat0_;
    let _e715 = _f_buffer1_.f_cb1_[4];
    let _e718 = u_xlat13_;
    u_xlat0_.x = ((_e710.x * _e715.z) + _e718);
    let _e720 = u_xlat2_;
    let _e725 = _f_buffer1_.f_cb1_[34];
    let _e727 = u_xlat0_;
    let _e730 = vs_TEXCOORD0_1;
    let _e732 = ((_e725.zw * _e727.xx) + _e730.xy);
    u_xlat2_.x = _e732.x;
    u_xlat2_.y = _e732.y;
    let _e737 = u_xlat2_;
    let _e742 = _f_buffer0_.f_cb0_[4];
    let _e747 = hscard_bias.values[0];
    let _e750 = textureSampleBias(f_t0_, samplerf_s0_, _e737.xy, (_e742.x + _e747.x));
    u_xlat2_ = _e750;
    let _e751 = u_xlat0_;
    let _e753 = u_xlat4_;
    let _e755 = u_xlat2_;
    let _e757 = (_e753.xyz + _e755.xyz);
    u_xlat0_.x = _e757.x;
    u_xlat0_.y = _e757.y;
    u_xlat0_.z = _e757.z;
    let _e764 = u_xlat0_;
    let _e769 = _f_buffer1_.f_cb1_[33];
    let _e774 = _f_buffer1_.f_cb1_[34];
    let _e777 = u_xlat0_;
    let _e779 = ((_e769.www * _e774.xxx) + _e777.xyz);
    u_xlat0_.x = _e779.x;
    u_xlat0_.y = _e779.y;
    u_xlat0_.z = _e779.z;
    let _e786 = u_xlat0_;
    let _e788 = u_xlat2_;
    let _e791 = u_xlat0_;
    let _e793 = (-(_e788.xyz) + _e791.xyz);
    u_xlat0_.x = _e793.x;
    u_xlat0_.y = _e793.y;
    u_xlat0_.z = _e793.z;
    let _e800 = u_xlat1_;
    let _e802 = u_xlat1_;
    u_xlat12_ = (_e800.y + _e802.x);
    let _e805 = u_xlat1_;
    let _e807 = u_xlat12_;
    u_xlat12_ = (_e805.z + _e807);
    let _e809 = u_xlat12_;
    u_xlat12_ = clamp(_e809, 0f, 1f);
    let _e813 = u_xlat0_;
    let _e815 = u_xlat12_;
    let _e817 = u_xlat0_;
    let _e820 = u_xlat2_;
    let _e822 = ((vec3(_e815) * _e817.xyz) + _e820.xyz);
    u_xlat0_.x = _e822.x;
    u_xlat0_.y = _e822.y;
    u_xlat0_.z = _e822.z;
    let _e829 = u_xlat0_;
    let _e831 = u_xlat0_;
    let _e837 = clamp(_e831.xyz, vec3(0f), vec3(1f));
    u_xlat0_.x = _e837.x;
    u_xlat0_.y = _e837.y;
    u_xlat0_.z = _e837.z;
    let _e844 = u_xlat1_;
    let _e846 = u_xlat0_;
    let _e852 = (_e846.xyz + vec3<f32>(0.15f, 0.15f, 0.15f));
    u_xlat1_.x = _e852.x;
    u_xlat1_.y = _e852.y;
    u_xlat1_.z = _e852.z;
    let _e859 = u_xlat1_;
    let _e861 = u_xlat1_;
    let _e863 = vs_COLOR0_1;
    let _e865 = (_e861.xyz * _e863.xyz);
    u_xlat1_.x = _e865.x;
    u_xlat1_.y = _e865.y;
    u_xlat1_.z = _e865.z;
    let _e872 = u_xlat0_;
    let _e874 = u_xlat0_;
    let _e876 = u_xlat1_;
    let _e878 = min(_e874.xyz, _e876.xyz);
    u_xlat0_.x = _e878.x;
    u_xlat0_.y = _e878.y;
    u_xlat0_.z = _e878.z;
    let _e885 = vs_TEXCOORD1_1;
    let _e890 = _f_buffer0_.f_cb0_[4];
    let _e895 = hscard_bias.values[1];
    let _e898 = textureSampleBias(f_t1_, samplerf_s1_, _e885.xy, (_e890.x + _e895.x));
    u_xlat1_ = _e898;
    let _e899 = SV_Target0_;
    let _e901 = u_xlat0_;
    let _e903 = u_xlat1_;
    let _e905 = (_e901.xyz * _e903.xyz);
    SV_Target0_.x = _e905.x;
    SV_Target0_.y = _e905.y;
    SV_Target0_.z = _e905.z;
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
    let _e72 = SV_Target0_;
    return FragmentOutput(_e72);
}
