struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 11>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 1024>,
}

struct f_buffer2_ {
    f_cb2_: array<vec4<f32>, 34>,
}

struct f_buffer3_ {
    f_cb3_: array<vec4<f32>, 6>,
}

struct FragmentOutput {
    @location(0) SV_Target0_: vec4<f32>,
}

const ImmCB_0_: array<vec4<u32>, 4> = array<vec4<u32>, 4>(vec4<u32>(1065353216u, 0u, 0u, 0u), vec4<u32>(0u, 1065353216u, 0u, 0u), vec4<u32>(0u, 0u, 1065353216u, 0u), vec4<u32>(0u, 0u, 0u, 1065353216u));

@group(1) @binding(31) 
var<uniform> hscard_bias: HScardSamplerBias;
@group(1) @binding(0) 
var<uniform> _f_buffer0_: f_buffer0_;
@group(1) @binding(1) 
var<uniform> _f_buffer1_: f_buffer1_;
@group(1) @binding(2) 
var<uniform> _f_buffer2_: f_buffer2_;
@group(1) @binding(3) 
var<uniform> _f_buffer3_: f_buffer3_;
@group(3) @binding(1) 
var samplerf_s0_: sampler;
@group(3) @binding(3) 
var samplerf_s1_: sampler;
@group(3) @binding(5) 
var samplerf_s2_: sampler;
@group(3) @binding(7) 
var samplerf_s3_: sampler;
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
@group(3) @binding(4) 
var f_t2_: texture_2d<f32>;
@group(3) @binding(6) 
var f_t3_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD1_1: vec3<f32>;
var<private> vs_TEXCOORD2_1: vec4<f32>;
var<private> vs_TEXCOORD3_1: vec4<f32>;
var<private> vs_TEXCOORD4_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec4<f32> = vec4(0f);
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlat5_: vec3<f32> = vec3(0f);
    var u_xlat6_: vec4<f32> = vec4(0f);
    var u_xlatb6_: vec3<bool> = vec3(false);
    var u_xlat7_: vec3<f32> = vec3(0f);
    var u_xlat8_: vec3<f32> = vec3(0f);
    var u_xlat9_: vec3<f32> = vec3(0f);
    var u_xlat10_: vec3<f32> = vec3(0f);
    var u_xlat11_: vec3<f32> = vec3(0f);
    var u_xlatb11_: bool = false;
    var u_xlat24_: f32 = 0f;
    var u_xlat34_: f32 = 0f;
    var u_xlat35_: f32 = 0f;
    var u_xlatu35_: u32 = 0u;
    var u_xlat36_: f32 = 0f;
    var u_xlatu37_: u32 = 0u;
    var u_xlat38_: f32 = 0f;
    var u_xlati38_: i32 = 0i;
    var u_xlatu38_: u32 = 0u;
    var u_xlatb38_: bool = false;
    var u_xlat39_: f32 = 0f;
    var u_xlati39_: i32 = 0i;
    var u_xlat40_: f32 = 0f;
    var hlslcc_movcTemp: vec3<f32>;
    var local: f32;
    var local_1: f32;
    var local_2: f32;
    var u_xlatu_loop_1_: u32 = 0u;
    var local_3: array<vec4<u32>, 4> = ImmCB_0_;
    var local_4: f32;

    let _e124 = vs_TEXCOORD0_1;
    let _e129 = _f_buffer0_.f_cb0_[4];
    let _e134 = hscard_bias.values[0];
    let _e137 = textureSampleBias(f_t0_, samplerf_s0_, _e124.xy, (_e129.x + _e134.x));
    u_xlat0_ = _e137;
    let _e138 = u_xlat0_;
    let _e143 = _f_buffer3_.f_cb3_[2];
    u_xlat0_ = (_e138.wxyz * _e143.wxyz);
    let _e146 = vs_TEXCOORD0_1;
    let _e151 = _f_buffer0_.f_cb0_[4];
    let _e156 = hscard_bias.values[3];
    let _e159 = textureSampleBias(f_t3_, samplerf_s3_, _e146.xy, (_e151.x + _e156.x));
    u_xlat1_ = _e159;
    let _e160 = u_xlat1_;
    let _e164 = _f_buffer3_.f_cb3_[3];
    u_xlat1_ = (_e160 * _e164);
    let _e166 = vs_TEXCOORD0_1;
    let _e171 = _f_buffer0_.f_cb0_[4];
    let _e176 = hscard_bias.values[1];
    let _e179 = textureSampleBias(f_t1_, samplerf_s1_, _e166.xy, (_e171.x + _e176.x));
    u_xlat2_ = _e179;
    let _e181 = u_xlat2_;
    let _e183 = u_xlat2_;
    u_xlat2_.x = (_e181.x * _e183.w);
    let _e186 = u_xlat2_;
    let _e188 = u_xlat2_;
    let _e199 = ((_e188.xy * vec2<f32>(2f, 2f)) + vec2<f32>(-1f, -1f));
    u_xlat2_.x = _e199.x;
    u_xlat2_.y = _e199.y;
    let _e204 = u_xlat2_;
    let _e206 = u_xlat2_;
    u_xlat24_ = dot(_e204.xy, _e206.xy);
    let _e209 = u_xlat24_;
    u_xlat24_ = min(_e209, 1f);
    let _e212 = u_xlat24_;
    u_xlat24_ = (-(_e212) + 1f);
    let _e216 = u_xlat24_;
    u_xlat24_ = sqrt(_e216);
    let _e218 = u_xlat24_;
    u_xlat24_ = max(_e218, 0.0000000000000001f);
    let _e221 = vs_TEXCOORD0_1;
    let _e226 = _f_buffer0_.f_cb0_[4];
    let _e231 = hscard_bias.values[2];
    let _e234 = textureSampleBias(f_t2_, samplerf_s2_, _e221.xy, (_e226.x + _e231.x));
    u_xlat3_ = _e234;
    let _e235 = u_xlat4_;
    let _e237 = u_xlat2_;
    let _e239 = vs_TEXCOORD4_1;
    let _e241 = (_e237.yyy * _e239.xyz);
    u_xlat4_.x = _e241.x;
    u_xlat4_.y = _e241.y;
    u_xlat4_.z = _e241.z;
    let _e248 = u_xlat2_;
    let _e250 = u_xlat2_;
    let _e252 = vs_TEXCOORD3_1;
    let _e255 = u_xlat4_;
    let _e257 = ((_e250.xxx * _e252.xyz) + _e255.xyz);
    u_xlat2_.x = _e257.x;
    u_xlat2_.y = _e257.y;
    u_xlat2_.w = _e257.z;
    let _e264 = u_xlat2_;
    let _e266 = u_xlat24_;
    let _e268 = vs_TEXCOORD2_1;
    let _e271 = u_xlat2_;
    let _e273 = ((vec3(_e266) * _e268.xyz) + _e271.xyw);
    u_xlat2_.x = _e273.x;
    u_xlat2_.y = _e273.y;
    u_xlat2_.z = _e273.z;
    let _e280 = u_xlat2_;
    let _e282 = u_xlat2_;
    u_xlat35_ = dot(_e280.xyz, _e282.xyz);
    let _e285 = u_xlat35_;
    u_xlat35_ = inverseSqrt(_e285);
    let _e287 = u_xlat2_;
    let _e289 = u_xlat35_;
    let _e291 = u_xlat2_;
    let _e293 = (vec3(_e289) * _e291.xyz);
    u_xlat2_.x = _e293.x;
    u_xlat2_.y = _e293.y;
    u_xlat2_.z = _e293.z;
    let _e301 = vs_TEXCOORD2_1;
    u_xlat4_.x = _e301.w;
    let _e304 = vs_TEXCOORD3_1;
    u_xlat4_.y = _e304.w;
    let _e307 = vs_TEXCOORD4_1;
    u_xlat4_.z = _e307.w;
    let _e309 = u_xlat4_;
    let _e311 = u_xlat4_;
    u_xlat36_ = dot(_e309.xyz, _e311.xyz);
    let _e314 = u_xlat36_;
    u_xlat36_ = max(_e314, 0.000061035156f);
    let _e317 = u_xlat36_;
    u_xlat36_ = inverseSqrt(_e317);
    u_xlat2_.w = 1f;
    let _e325 = _f_buffer2_.f_cb2_[27];
    let _e326 = u_xlat2_;
    u_xlat5_.x = dot(_e325, _e326);
    let _e332 = _f_buffer2_.f_cb2_[28];
    let _e333 = u_xlat2_;
    u_xlat5_.y = dot(_e332, _e333);
    let _e339 = _f_buffer2_.f_cb2_[29];
    let _e340 = u_xlat2_;
    u_xlat5_.z = dot(_e339, _e340);
    let _e342 = u_xlat2_;
    let _e344 = u_xlat2_;
    u_xlat6_ = (_e342.yzzx * _e344.xyzz);
    let _e351 = _f_buffer2_.f_cb2_[30];
    let _e352 = u_xlat6_;
    u_xlat7_.x = dot(_e351, _e352);
    let _e358 = _f_buffer2_.f_cb2_[31];
    let _e359 = u_xlat6_;
    u_xlat7_.y = dot(_e358, _e359);
    let _e365 = _f_buffer2_.f_cb2_[32];
    let _e366 = u_xlat6_;
    u_xlat7_.z = dot(_e365, _e366);
    let _e368 = u_xlat2_;
    let _e370 = u_xlat2_;
    u_xlat35_ = (_e368.y * _e370.y);
    let _e373 = u_xlat2_;
    let _e375 = u_xlat2_;
    let _e378 = u_xlat35_;
    u_xlat35_ = ((_e373.x * _e375.x) + -(_e378));
    let _e381 = u_xlat6_;
    let _e386 = _f_buffer2_.f_cb2_[33];
    let _e388 = u_xlat35_;
    let _e391 = u_xlat7_;
    let _e393 = ((_e386.xyz * vec3(_e388)) + _e391.xyz);
    u_xlat6_.x = _e393.x;
    u_xlat6_.y = _e393.y;
    u_xlat6_.z = _e393.z;
    let _e400 = u_xlat5_;
    let _e402 = u_xlat5_;
    let _e404 = u_xlat6_;
    let _e406 = (_e402.xyz + _e404.xyz);
    u_xlat5_.x = _e406.x;
    u_xlat5_.y = _e406.y;
    u_xlat5_.z = _e406.z;
    let _e413 = u_xlatb6_;
    let _e420 = u_xlat5_;
    let _e423 = (vec4<f32>(0.0031308f, 0.0031308f, 0.0031308f, 0f) >= _e420.xyzx).xyz;
    u_xlatb6_.x = _e423.x;
    u_xlatb6_.y = _e423.y;
    u_xlatb6_.z = _e423.z;
    let _e430 = u_xlat7_;
    let _e432 = u_xlat5_;
    let _e438 = (_e432.xyz * vec3<f32>(12.92321f, 12.92321f, 12.92321f));
    u_xlat7_.x = _e438.x;
    u_xlat7_.y = _e438.y;
    u_xlat7_.z = _e438.z;
    let _e445 = u_xlat5_;
    let _e447 = u_xlat5_;
    let _e450 = log2(abs(_e447.xyz));
    u_xlat5_.x = _e450.x;
    u_xlat5_.y = _e450.y;
    u_xlat5_.z = _e450.z;
    let _e457 = u_xlat5_;
    let _e459 = u_xlat5_;
    let _e465 = (_e459.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat5_.x = _e465.x;
    u_xlat5_.y = _e465.y;
    u_xlat5_.z = _e465.z;
    let _e472 = u_xlat5_;
    let _e474 = u_xlat5_;
    let _e476 = exp2(_e474.xyz);
    u_xlat5_.x = _e476.x;
    u_xlat5_.y = _e476.y;
    u_xlat5_.z = _e476.z;
    let _e483 = u_xlat5_;
    let _e485 = u_xlat5_;
    let _e499 = ((_e485.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat5_.x = _e499.x;
    u_xlat5_.y = _e499.y;
    u_xlat5_.z = _e499.z;
    {
        let _e506 = u_xlat5_;
        hlslcc_movcTemp = _e506;
        let _e509 = u_xlatb6_;
        if _e509.x {
            let _e511 = u_xlat7_;
            local = _e511.x;
        } else {
            let _e513 = u_xlat5_;
            local = _e513.x;
        }
        let _e516 = local;
        hlslcc_movcTemp.x = _e516;
        let _e518 = u_xlatb6_;
        if _e518.y {
            let _e520 = u_xlat7_;
            local_1 = _e520.y;
        } else {
            let _e522 = u_xlat5_;
            local_1 = _e522.y;
        }
        let _e525 = local_1;
        hlslcc_movcTemp.y = _e525;
        let _e527 = u_xlatb6_;
        if _e527.z {
            let _e529 = u_xlat7_;
            local_2 = _e529.z;
        } else {
            let _e531 = u_xlat5_;
            local_2 = _e531.z;
        }
        let _e534 = local_2;
        hlslcc_movcTemp.z = _e534;
        let _e535 = hlslcc_movcTemp;
        u_xlat5_ = _e535;
    }
    let _e536 = u_xlat6_;
    let _e541 = _f_buffer0_.f_cb0_[6];
    let _e546 = _f_buffer2_.f_cb2_[11];
    let _e548 = (_e541.xyz * _e546.zzz);
    u_xlat6_.x = _e548.x;
    u_xlat6_.y = _e548.y;
    u_xlat6_.z = _e548.z;
    let _e555 = u_xlat2_;
    let _e560 = _f_buffer0_.f_cb0_[5];
    u_xlat35_ = dot(_e555.xyz, _e560.xyz);
    let _e563 = u_xlat35_;
    u_xlat35_ = clamp(_e563, 0f, 1f);
    let _e567 = u_xlat7_;
    let _e569 = u_xlat35_;
    let _e571 = u_xlat6_;
    let _e573 = (vec3(_e569) * _e571.xyz);
    u_xlat7_.x = _e573.x;
    u_xlat7_.y = _e573.y;
    u_xlat7_.z = _e573.z;
    let _e580 = u_xlat1_;
    u_xlat34_ = ((_e580.w * 10f) + 1f);
    let _e586 = u_xlat34_;
    u_xlat34_ = exp2(_e586);
    let _e588 = u_xlat8_;
    let _e590 = u_xlat4_;
    let _e592 = u_xlat36_;
    let _e598 = _f_buffer0_.f_cb0_[5];
    let _e600 = ((_e590.xyz * vec3(_e592)) + _e598.xyz);
    u_xlat8_.x = _e600.x;
    u_xlat8_.y = _e600.y;
    u_xlat8_.z = _e600.z;
    let _e607 = u_xlat8_;
    let _e609 = u_xlat8_;
    u_xlat35_ = dot(_e607.xyz, _e609.xyz);
    let _e612 = u_xlat35_;
    u_xlat35_ = max(_e612, 0.000000000000000000000000000000000000011754944f);
    let _e615 = u_xlat35_;
    u_xlat35_ = inverseSqrt(_e615);
    let _e617 = u_xlat8_;
    let _e619 = u_xlat35_;
    let _e621 = u_xlat8_;
    let _e623 = (vec3(_e619) * _e621.xyz);
    u_xlat8_.x = _e623.x;
    u_xlat8_.y = _e623.y;
    u_xlat8_.z = _e623.z;
    let _e630 = u_xlat2_;
    let _e632 = u_xlat8_;
    u_xlat35_ = dot(_e630.xyz, _e632.xyz);
    let _e635 = u_xlat35_;
    u_xlat35_ = clamp(_e635, 0f, 1f);
    let _e639 = u_xlat35_;
    u_xlat35_ = log2(_e639);
    let _e641 = u_xlat34_;
    let _e642 = u_xlat35_;
    u_xlat35_ = (_e641 * _e642);
    let _e644 = u_xlat35_;
    u_xlat35_ = exp2(_e644);
    let _e646 = u_xlat8_;
    let _e648 = u_xlat1_;
    let _e650 = u_xlat35_;
    let _e652 = (_e648.xyz * vec3(_e650));
    u_xlat8_.x = _e652.x;
    u_xlat8_.y = _e652.y;
    u_xlat8_.z = _e652.z;
    let _e659 = u_xlat6_;
    let _e661 = u_xlat6_;
    let _e663 = u_xlat8_;
    let _e665 = (_e661.xyz * _e663.xyz);
    u_xlat6_.x = _e665.x;
    u_xlat6_.y = _e665.y;
    u_xlat6_.z = _e665.z;
    let _e672 = u_xlat6_;
    let _e674 = u_xlat7_;
    let _e676 = u_xlat0_;
    let _e679 = u_xlat6_;
    let _e681 = ((_e674.xyz * _e676.yzw) + _e679.xyz);
    u_xlat6_.x = _e681.x;
    u_xlat6_.y = _e681.y;
    u_xlat6_.z = _e681.z;
    let _e691 = _f_buffer0_.f_cb0_[10];
    let _e696 = _f_buffer2_.f_cb2_[11];
    u_xlat35_ = min(_e691.x, _e696.y);
    let _e699 = u_xlat35_;
    u_xlatu35_ = u32(i32(_e699));
    u_xlat7_.x = 0f;
    u_xlat7_.y = 0f;
    u_xlat7_.z = 0f;
    loop {
        let _e713 = u_xlatu_loop_1_;
        let _e714 = u_xlatu35_;
        if !((_e713 < _e714)) {
            break;
        }
        {
            let _e720 = u_xlatu_loop_1_;
            u_xlatu38_ = (_e720 >> 2u);
            let _e723 = u_xlatu_loop_1_;
            u_xlati39_ = i32((_e723 & 3u));
            let _e727 = u_xlatu38_;
            let _e733 = _f_buffer2_.f_cb2_[(i32(_e727) + 12i)];
            let _e734 = u_xlati39_;
            let _e738 = local_3[_e734];
            u_xlat38_ = dot(_e733, bitcast<vec4<f32>>(_e738));
            let _e741 = u_xlat38_;
            u_xlati38_ = i32(_e741);
            let _e743 = u_xlat8_;
            let _e745 = vs_TEXCOORD1_1;
            let _e748 = u_xlati38_;
            let _e751 = _f_buffer1_.f_cb1_[_e748];
            let _e754 = u_xlati38_;
            let _e757 = _f_buffer1_.f_cb1_[_e754];
            let _e759 = ((-(_e745.xyz) * _e751.www) + _e757.xyz);
            u_xlat8_.x = _e759.x;
            u_xlat8_.y = _e759.y;
            u_xlat8_.z = _e759.z;
            let _e766 = u_xlat8_;
            let _e768 = u_xlat8_;
            u_xlat39_ = dot(_e766.xyz, _e768.xyz);
            let _e771 = u_xlat39_;
            u_xlat39_ = max(_e771, 0.000061035156f);
            let _e774 = u_xlat39_;
            u_xlat40_ = inverseSqrt(_e774);
            let _e776 = u_xlat8_;
            let _e778 = u_xlat40_;
            let _e780 = u_xlat8_;
            let _e782 = (vec3(_e778) * _e780.xyz);
            u_xlat8_.x = _e782.x;
            u_xlat8_.y = _e782.y;
            u_xlat8_.z = _e782.z;
            let _e791 = u_xlat39_;
            u_xlat40_ = (1f / _e791);
            let _e793 = u_xlat39_;
            let _e794 = u_xlati38_;
            let _e799 = _f_buffer1_.f_cb1_[(_e794 + 512i)];
            u_xlat39_ = (_e793 * _e799.x);
            let _e802 = u_xlat39_;
            let _e804 = u_xlat39_;
            u_xlat39_ = ((-(_e802) * _e804) + 1f);
            let _e808 = u_xlat39_;
            u_xlat39_ = max(_e808, 0f);
            let _e811 = u_xlat39_;
            let _e812 = u_xlat39_;
            u_xlat39_ = (_e811 * _e812);
            let _e814 = u_xlat39_;
            let _e815 = u_xlat40_;
            u_xlat39_ = (_e814 * _e815);
            let _e817 = u_xlati38_;
            let _e822 = _f_buffer1_.f_cb1_[(_e817 + 768i)];
            let _e824 = u_xlat8_;
            u_xlat40_ = dot(_e822.xyz, _e824.xyz);
            let _e827 = u_xlat40_;
            let _e828 = u_xlati38_;
            let _e833 = _f_buffer1_.f_cb1_[(_e828 + 512i)];
            let _e836 = u_xlati38_;
            let _e841 = _f_buffer1_.f_cb1_[(_e836 + 512i)];
            u_xlat40_ = ((_e827 * _e833.z) + _e841.w);
            let _e844 = u_xlat40_;
            u_xlat40_ = clamp(_e844, 0f, 1f);
            let _e848 = u_xlat40_;
            let _e849 = u_xlat40_;
            u_xlat40_ = (_e848 * _e849);
            let _e851 = u_xlat39_;
            let _e852 = u_xlat40_;
            u_xlat39_ = (_e851 * _e852);
            let _e854 = u_xlat9_;
            let _e856 = u_xlat39_;
            let _e858 = u_xlati38_;
            let _e863 = _f_buffer1_.f_cb1_[(_e858 + 256i)];
            let _e865 = (vec3(_e856) * _e863.xyz);
            u_xlat9_.x = _e865.x;
            u_xlat9_.y = _e865.y;
            u_xlat9_.z = _e865.z;
            let _e872 = u_xlat2_;
            let _e874 = u_xlat8_;
            u_xlat38_ = dot(_e872.xyz, _e874.xyz);
            let _e877 = u_xlat38_;
            u_xlat38_ = clamp(_e877, 0f, 1f);
            let _e881 = u_xlat10_;
            let _e883 = u_xlat38_;
            let _e885 = u_xlat9_;
            let _e887 = (vec3(_e883) * _e885.xyz);
            u_xlat10_.x = _e887.x;
            u_xlat10_.y = _e887.y;
            u_xlat10_.z = _e887.z;
            let _e894 = u_xlat8_;
            let _e896 = u_xlat4_;
            let _e898 = u_xlat36_;
            let _e901 = u_xlat8_;
            let _e903 = ((_e896.xyz * vec3(_e898)) + _e901.xyz);
            u_xlat8_.x = _e903.x;
            u_xlat8_.y = _e903.y;
            u_xlat8_.z = _e903.z;
            let _e910 = u_xlat8_;
            let _e912 = u_xlat8_;
            u_xlat38_ = dot(_e910.xyz, _e912.xyz);
            let _e915 = u_xlat38_;
            u_xlat38_ = max(_e915, 0.000000000000000000000000000000000000011754944f);
            let _e918 = u_xlat38_;
            u_xlat38_ = inverseSqrt(_e918);
            let _e920 = u_xlat8_;
            let _e922 = u_xlat38_;
            let _e924 = u_xlat8_;
            let _e926 = (vec3(_e922) * _e924.xyz);
            u_xlat8_.x = _e926.x;
            u_xlat8_.y = _e926.y;
            u_xlat8_.z = _e926.z;
            let _e933 = u_xlat2_;
            let _e935 = u_xlat8_;
            u_xlat38_ = dot(_e933.xyz, _e935.xyz);
            let _e938 = u_xlat38_;
            u_xlat38_ = clamp(_e938, 0f, 1f);
            let _e942 = u_xlat38_;
            u_xlat38_ = log2(_e942);
            let _e944 = u_xlat34_;
            let _e945 = u_xlat38_;
            u_xlat38_ = (_e944 * _e945);
            let _e947 = u_xlat38_;
            u_xlat38_ = exp2(_e947);
            let _e949 = u_xlat8_;
            let _e951 = u_xlat1_;
            let _e953 = u_xlat38_;
            let _e955 = (_e951.xyz * vec3(_e953));
            u_xlat8_.x = _e955.x;
            u_xlat8_.y = _e955.y;
            u_xlat8_.z = _e955.z;
            let _e962 = u_xlat8_;
            let _e964 = u_xlat8_;
            let _e966 = u_xlat9_;
            let _e968 = (_e964.xyz * _e966.xyz);
            u_xlat8_.x = _e968.x;
            u_xlat8_.y = _e968.y;
            u_xlat8_.z = _e968.z;
            let _e975 = u_xlat8_;
            let _e977 = u_xlat10_;
            let _e979 = u_xlat0_;
            let _e982 = u_xlat8_;
            let _e984 = ((_e977.xyz * _e979.yzw) + _e982.xyz);
            u_xlat8_.x = _e984.x;
            u_xlat8_.y = _e984.y;
            u_xlat8_.z = _e984.z;
            let _e991 = u_xlat7_;
            let _e993 = u_xlat7_;
            let _e995 = u_xlat8_;
            let _e997 = (_e993.xyz + _e995.xyz);
            u_xlat7_.x = _e997.x;
            u_xlat7_.y = _e997.y;
            u_xlat7_.z = _e997.z;
        }
        continuing {
            let _e717 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e717 + 1u);
        }
    }
    let _e1004 = u_xlat11_;
    let _e1006 = u_xlat5_;
    let _e1008 = u_xlat0_;
    let _e1011 = u_xlat6_;
    let _e1013 = ((_e1006.xyz * _e1008.yzw) + _e1011.xyz);
    u_xlat11_.x = _e1013.x;
    u_xlat11_.y = _e1013.y;
    u_xlat11_.z = _e1013.z;
    let _e1020 = u_xlat11_;
    let _e1022 = u_xlat7_;
    let _e1024 = u_xlat11_;
    let _e1026 = (_e1022.xyz + _e1024.xyz);
    u_xlat11_.x = _e1026.x;
    u_xlat11_.y = _e1026.y;
    u_xlat11_.z = _e1026.z;
    let _e1033 = SV_Target0_;
    let _e1035 = u_xlat3_;
    let _e1040 = _f_buffer3_.f_cb3_[4];
    let _e1043 = u_xlat11_;
    let _e1045 = ((_e1035.xyz * _e1040.xyz) + _e1043.xyz);
    SV_Target0_.x = _e1045.x;
    SV_Target0_.y = _e1045.y;
    SV_Target0_.z = _e1045.z;
    let _e1055 = _f_buffer3_.f_cb3_[5];
    u_xlatb11_ = (_e1055.y == 1f);
    let _e1060 = u_xlatb11_;
    if _e1060 {
        let _e1061 = u_xlat0_;
        local_4 = _e1061.x;
    } else {
        local_4 = 1f;
    }
    let _e1065 = local_4;
    SV_Target0_.w = _e1065;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec3<f32>, @location(2) vs_TEXCOORD2_: vec4<f32>, @location(3) vs_TEXCOORD3_: vec4<f32>, @location(4) vs_TEXCOORD4_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_TEXCOORD2_1 = vs_TEXCOORD2_;
    vs_TEXCOORD3_1 = vs_TEXCOORD3_;
    vs_TEXCOORD4_1 = vs_TEXCOORD4_;
    main_1();
    let _e56 = SV_Target0_;
    return FragmentOutput(_e56);
}
