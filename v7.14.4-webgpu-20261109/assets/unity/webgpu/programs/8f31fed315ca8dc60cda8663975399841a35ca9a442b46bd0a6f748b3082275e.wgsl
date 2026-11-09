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
    f_cb2_: array<vec4<f32>, 30>,
}

struct f_buffer3_ {
    f_cb3_: array<vec4<f32>, 28>,
}

struct f_buffer4_ {
    f_cb4_: array<vec4<f32>, 13>,
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
@group(1) @binding(4) 
var<uniform> _f_buffer4_: f_buffer4_;
@group(3) @binding(1) 
var samplerf_s0_: sampler_comparison;
@group(3) @binding(3) 
var samplerf_s1_: sampler;
@group(3) @binding(5) 
var samplerf_s2_: sampler;
@group(3) @binding(7) 
var samplerf_s3_: sampler;
@group(3) @binding(0) 
var f_t0_: texture_depth_2d;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
@group(3) @binding(4) 
var f_t2_: texture_2d<f32>;
@group(3) @binding(6) 
var f_t3_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec4<f32>;
var<private> vs_TEXCOORD4_1: vec3<f32>;
var<private> vs_TEXCOORD5_1: vec3<f32>;
var<private> vs_NORMAL0_1: vec3<f32>;
var<private> vs_TEXCOORD1_1: vec3<f32>;
var<private> vs_TEXCOORDindex3_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec4<f32> = vec4(0f);
    var u_xlatb3_: vec2<bool> = vec2(false);
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlatb4_: bool = false;
    var u_xlat5_: vec3<f32> = vec3(0f);
    var u_xlat6_: vec3<f32> = vec3(0f);
    var u_xlati6_: i32 = 0i;
    var u_xlat7_: vec3<f32> = vec3(0f);
    var u_xlat11_: f32 = 0f;
    var u_xlat24_: f32 = 0f;
    var u_xlat27_: f32 = 0f;
    var u_xlatu27_: u32 = 0u;
    var u_xlatb27_: bool = false;
    var u_xlatu28_: u32 = 0u;
    var u_xlat29_: f32 = 0f;
    var u_xlati29_: i32 = 0i;
    var u_xlatu29_: u32 = 0u;
    var u_xlatb29_: bool = false;
    var u_xlat30_: f32 = 0f;
    var txVec0_: vec3<f32>;
    var local: f32;
    var u_xlatu_loop_1_: u32 = 0u;
    var local_1: array<vec4<u32>, 4> = ImmCB_0_;
    var local_2: vec3<f32>;
    var local_3: vec3<f32>;

    let _e109 = vs_TEXCOORD0_1;
    let _e114 = _f_buffer0_.f_cb0_[4];
    let _e119 = hscard_bias.values[1];
    let _e122 = textureSampleBias(f_t1_, samplerf_s1_, _e109.xy, (_e114.x + _e119.x));
    u_xlat0_ = _e122;
    let _e123 = vs_TEXCOORD0_1;
    let _e128 = _f_buffer0_.f_cb0_[4];
    let _e133 = hscard_bias.values[2];
    let _e136 = textureSampleBias(f_t2_, samplerf_s2_, _e123.xy, (_e128.x + _e133.x));
    u_xlat1_ = _e136;
    let _e137 = vs_TEXCOORD0_1;
    let _e142 = _f_buffer0_.f_cb0_[4];
    let _e147 = hscard_bias.values[3];
    let _e150 = textureSampleBias(f_t3_, samplerf_s3_, _e137.zw, (_e142.x + _e147.x));
    u_xlat2_ = _e150;
    let _e151 = vs_NORMAL0_1;
    let _e153 = vs_NORMAL0_1;
    u_xlat24_ = dot(_e151.xyz, _e153.xyz);
    let _e156 = u_xlat24_;
    u_xlat24_ = inverseSqrt(_e156);
    let _e158 = u_xlat3_;
    let _e160 = u_xlat24_;
    let _e162 = vs_NORMAL0_1;
    let _e164 = (vec3(_e160) * _e162.xyz);
    u_xlat3_.x = _e164.x;
    u_xlat3_.y = _e164.y;
    u_xlat3_.z = _e164.z;
    let _e171 = vs_TEXCOORDindex3_1;
    let _e172 = _e171.xy;
    let _e173 = vs_TEXCOORDindex3_1;
    txVec0_ = vec3<f32>(_e172.x, _e172.y, _e173.z);
    let _e179 = txVec0_;
    let _e183 = textureSampleCompareLevel(f_t0_, samplerf_s0_, _e179.xy, _e179.z);
    u_xlat24_ = _e183;
    let _e187 = _f_buffer3_.f_cb3_[27];
    u_xlat27_ = (-(_e187.x) + 1f);
    let _e192 = u_xlat24_;
    let _e196 = _f_buffer3_.f_cb3_[27];
    let _e199 = u_xlat27_;
    u_xlat24_ = ((_e192 * _e196.x) + _e199);
    let _e202 = vs_TEXCOORDindex3_1;
    u_xlatb27_ = (0f >= _e202.z);
    let _e205 = vs_TEXCOORDindex3_1;
    u_xlatb4_ = (_e205.z >= 1f);
    let _e209 = u_xlatb27_;
    let _e210 = u_xlatb4_;
    u_xlatb27_ = (_e209 || _e210);
    let _e212 = u_xlatb27_;
    if _e212 {
        local = 1f;
    } else {
        let _e214 = u_xlat24_;
        local = _e214;
    }
    let _e216 = local;
    u_xlat24_ = _e216;
    let _e217 = u_xlat24_;
    let _e221 = _f_buffer2_.f_cb2_[11];
    u_xlat24_ = (_e217 * _e221.z);
    let _e224 = u_xlat4_;
    let _e226 = u_xlat24_;
    let _e231 = _f_buffer0_.f_cb0_[6];
    let _e233 = (vec3(_e226) * _e231.xyz);
    u_xlat4_.x = _e233.x;
    u_xlat4_.y = _e233.y;
    u_xlat4_.z = _e233.z;
    let _e240 = u_xlat3_;
    let _e245 = _f_buffer0_.f_cb0_[5];
    u_xlat24_ = dot(_e240.xyz, _e245.xyz);
    let _e248 = u_xlat24_;
    u_xlat24_ = clamp(_e248, 0f, 1f);
    let _e255 = _f_buffer0_.f_cb0_[10];
    let _e260 = _f_buffer2_.f_cb2_[11];
    u_xlat27_ = min(_e255.x, _e260.y);
    let _e263 = u_xlat27_;
    u_xlatu27_ = u32(i32(_e263));
    u_xlat5_.x = 0f;
    u_xlat5_.y = 0f;
    u_xlat5_.z = 0f;
    loop {
        let _e277 = u_xlatu_loop_1_;
        let _e278 = u_xlatu27_;
        if !((_e277 < _e278)) {
            break;
        }
        {
            let _e284 = u_xlatu_loop_1_;
            u_xlatu29_ = (_e284 >> 2u);
            let _e287 = u_xlatu_loop_1_;
            u_xlati6_ = i32((_e287 & 3u));
            let _e291 = u_xlatu29_;
            let _e297 = _f_buffer2_.f_cb2_[(i32(_e291) + 12i)];
            let _e298 = u_xlati6_;
            let _e302 = local_1[_e298];
            u_xlat29_ = dot(_e297, bitcast<vec4<f32>>(_e302));
            let _e305 = u_xlat29_;
            u_xlati29_ = i32(_e305);
            let _e307 = u_xlat6_;
            let _e309 = vs_TEXCOORD1_1;
            let _e312 = u_xlati29_;
            let _e315 = _f_buffer1_.f_cb1_[_e312];
            let _e318 = u_xlati29_;
            let _e321 = _f_buffer1_.f_cb1_[_e318];
            let _e323 = ((-(_e309.xyz) * _e315.www) + _e321.xyz);
            u_xlat6_.x = _e323.x;
            u_xlat6_.y = _e323.y;
            u_xlat6_.z = _e323.z;
            let _e330 = u_xlat6_;
            let _e332 = u_xlat6_;
            u_xlat30_ = dot(_e330.xyz, _e332.xyz);
            let _e335 = u_xlat30_;
            u_xlat30_ = max(_e335, 0.000061035156f);
            let _e339 = u_xlat30_;
            u_xlat7_.x = inverseSqrt(_e339);
            let _e341 = u_xlat6_;
            let _e343 = u_xlat6_;
            let _e345 = u_xlat7_;
            let _e347 = (_e343.xyz * _e345.xxx);
            u_xlat6_.x = _e347.x;
            u_xlat6_.y = _e347.y;
            u_xlat6_.z = _e347.z;
            let _e357 = u_xlati29_;
            let _e362 = _f_buffer1_.f_cb1_[(_e357 + 512i)];
            u_xlat7_.x = (1f / _e362.x);
            let _e365 = u_xlat30_;
            u_xlat30_ = (_e365 * 25f);
            let _e368 = u_xlat30_;
            let _e369 = u_xlat7_;
            u_xlat30_ = (_e368 / _e369.x);
            let _e372 = u_xlat30_;
            u_xlat30_ = (_e372 + 1f);
            let _e377 = u_xlat30_;
            u_xlat30_ = (1f / _e377);
            let _e380 = u_xlati29_;
            let _e385 = _f_buffer1_.f_cb1_[(_e380 + 768i)];
            let _e387 = u_xlat6_;
            u_xlat7_.x = dot(_e385.xyz, _e387.xyz);
            let _e391 = u_xlat7_;
            let _e393 = u_xlati29_;
            let _e398 = _f_buffer1_.f_cb1_[(_e393 + 512i)];
            let _e401 = u_xlati29_;
            let _e406 = _f_buffer1_.f_cb1_[(_e401 + 512i)];
            u_xlat7_.x = ((_e391.x * _e398.z) + _e406.w);
            let _e410 = u_xlat7_;
            u_xlat7_.x = clamp(_e410.x, 0f, 1f);
            let _e416 = u_xlat7_;
            let _e418 = u_xlat7_;
            u_xlat7_.x = (_e416.x * _e418.x);
            let _e421 = u_xlat30_;
            let _e422 = u_xlat7_;
            u_xlat30_ = (_e421 * _e422.x);
            let _e425 = u_xlat7_;
            let _e427 = u_xlat30_;
            let _e429 = u_xlati29_;
            let _e434 = _f_buffer1_.f_cb1_[(_e429 + 256i)];
            let _e436 = (vec3(_e427) * _e434.xyz);
            u_xlat7_.x = _e436.x;
            u_xlat7_.y = _e436.y;
            u_xlat7_.z = _e436.z;
            let _e443 = u_xlat3_;
            let _e445 = u_xlat6_;
            u_xlat29_ = dot(_e443.xyz, _e445.xyz);
            let _e448 = u_xlat29_;
            u_xlat29_ = clamp(_e448, 0f, 1f);
            let _e452 = u_xlat5_;
            let _e454 = u_xlat7_;
            let _e456 = u_xlat29_;
            let _e459 = u_xlat5_;
            let _e461 = ((_e454.xyz * vec3(_e456)) + _e459.xyz);
            u_xlat5_.x = _e461.x;
            u_xlat5_.y = _e461.y;
            u_xlat5_.z = _e461.z;
        }
        continuing {
            let _e281 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e281 + 1u);
        }
    }
    let _e468 = u_xlat3_;
    let _e470 = u_xlat4_;
    let _e472 = u_xlat24_;
    let _e475 = u_xlat5_;
    let _e477 = ((_e470.xyz * vec3(_e472)) + _e475.xyz);
    u_xlat3_.x = _e477.x;
    u_xlat3_.y = _e477.y;
    u_xlat3_.z = _e477.z;
    let _e488 = _f_buffer2_.f_cb2_[27];
    u_xlat4_.x = abs(_e488.w);
    let _e495 = _f_buffer2_.f_cb2_[28];
    u_xlat4_.y = abs(_e495.w);
    let _e502 = _f_buffer2_.f_cb2_[29];
    u_xlat4_.z = abs(_e502.w);
    let _e505 = u_xlat4_;
    let _e507 = u_xlat4_;
    let _e509 = log2(_e507.xyz);
    u_xlat4_.x = _e509.x;
    u_xlat4_.y = _e509.y;
    u_xlat4_.z = _e509.z;
    let _e516 = u_xlat4_;
    let _e518 = u_xlat4_;
    let _e524 = (_e518.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat4_.x = _e524.x;
    u_xlat4_.y = _e524.y;
    u_xlat4_.z = _e524.z;
    let _e531 = u_xlat4_;
    let _e533 = u_xlat4_;
    let _e535 = exp2(_e533.xyz);
    u_xlat4_.x = _e535.x;
    u_xlat4_.y = _e535.y;
    u_xlat4_.z = _e535.z;
    let _e542 = u_xlat4_;
    let _e544 = u_xlat4_;
    let _e558 = ((_e544.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat4_.x = _e558.x;
    u_xlat4_.y = _e558.y;
    u_xlat4_.z = _e558.z;
    let _e565 = u_xlat4_;
    let _e567 = u_xlat4_;
    let _e573 = clamp(_e567.xyz, vec3(0f), vec3(1f));
    u_xlat4_.x = _e573.x;
    u_xlat4_.y = _e573.y;
    u_xlat4_.z = _e573.z;
    let _e580 = u_xlat3_;
    let _e582 = u_xlat3_;
    let _e584 = u_xlat4_;
    let _e586 = (_e582.xyz + _e584.xyz);
    u_xlat3_.x = _e586.x;
    u_xlat3_.y = _e586.y;
    u_xlat3_.z = _e586.z;
    let _e593 = u_xlat4_;
    let _e595 = u_xlat0_;
    let _e597 = u_xlat3_;
    let _e599 = (_e595.xyz * _e597.xyz);
    u_xlat4_.x = _e599.x;
    u_xlat4_.y = _e599.y;
    u_xlat4_.z = _e599.z;
    let _e606 = vs_TEXCOORD5_1;
    let _e608 = vs_TEXCOORD4_1;
    u_xlat24_ = dot(_e606.xyz, _e608.xyz);
    let _e611 = u_xlat24_;
    u_xlat24_ = clamp(_e611, 0f, 1f);
    let _e615 = u_xlat24_;
    u_xlat24_ = (-(_e615) + 1f);
    let _e619 = u_xlat24_;
    u_xlat24_ = log2(_e619);
    let _e621 = u_xlat24_;
    let _e625 = _f_buffer4_.f_cb4_[7];
    u_xlat24_ = (_e621 * _e625.x);
    let _e628 = u_xlat24_;
    u_xlat24_ = exp2(_e628);
    let _e630 = u_xlat1_;
    let _e634 = _f_buffer4_.f_cb4_[6];
    u_xlat27_ = dot(_e630, _e634);
    let _e636 = u_xlat27_;
    u_xlat27_ = min(_e636, 1f);
    let _e639 = u_xlat24_;
    let _e640 = u_xlat27_;
    u_xlat24_ = (_e639 * _e640);
    let _e642 = u_xlat24_;
    let _e646 = _f_buffer4_.f_cb4_[7];
    u_xlat24_ = (_e642 * _e646.y);
    let _e649 = u_xlat24_;
    u_xlat24_ = clamp(_e649, 0f, 1f);
    let _e653 = u_xlat0_;
    let _e655 = u_xlat0_;
    let _e658 = u_xlat3_;
    let _e664 = _f_buffer4_.f_cb4_[5];
    let _e666 = ((-(_e655.xyz) * _e658.xyz) + _e664.xyz);
    u_xlat0_.x = _e666.x;
    u_xlat0_.y = _e666.y;
    u_xlat0_.z = _e666.z;
    let _e673 = u_xlat0_;
    let _e675 = u_xlat24_;
    let _e677 = u_xlat0_;
    let _e680 = u_xlat4_;
    let _e682 = ((vec3(_e675) * _e677.xyz) + _e680.xyz);
    u_xlat0_.x = _e682.x;
    u_xlat0_.y = _e682.y;
    u_xlat0_.z = _e682.z;
    let _e693 = _f_buffer0_.f_cb0_[5];
    let _e698 = _f_buffer0_.f_cb0_[5];
    u_xlat3_.x = dot(_e693.xyz, _e698.xyz);
    let _e702 = u_xlat3_;
    u_xlat3_.x = inverseSqrt(_e702.x);
    let _e705 = u_xlat3_;
    let _e707 = u_xlat3_;
    let _e712 = _f_buffer0_.f_cb0_[5];
    let _e714 = (_e707.xxx * _e712.xyz);
    u_xlat3_.x = _e714.x;
    u_xlat3_.y = _e714.y;
    u_xlat3_.z = _e714.z;
    let _e722 = u_xlat3_;
    let _e724 = vs_NORMAL0_1;
    u_xlat3_.x = dot(_e722.xyz, _e724.xyz);
    let _e727 = u_xlat1_;
    let _e731 = _f_buffer4_.f_cb4_[3];
    u_xlat11_ = dot(_e727, _e731);
    let _e733 = u_xlat11_;
    u_xlat11_ = min(_e733, 1f);
    let _e737 = u_xlat11_;
    let _e738 = u_xlat3_;
    u_xlat3_.x = (_e737 * _e738.x);
    let _e742 = u_xlat3_;
    let _e747 = _f_buffer4_.f_cb4_[4];
    u_xlat3_.x = (_e742.x * _e747.x);
    let _e751 = u_xlat3_;
    u_xlat3_.x = clamp(_e751.x, 0f, 1f);
    let _e756 = u_xlat0_;
    let _e761 = _f_buffer4_.f_cb4_[2];
    let _e763 = u_xlat3_;
    let _e766 = u_xlat0_;
    let _e768 = ((_e761.xyz * _e763.xxx) + _e766.xyz);
    u_xlat0_.x = _e768.x;
    u_xlat0_.y = _e768.y;
    u_xlat0_.z = _e768.z;
    let _e776 = u_xlat1_;
    let _e780 = _f_buffer4_.f_cb4_[8];
    u_xlat3_.x = dot(_e776, _e780);
    let _e783 = u_xlat3_;
    u_xlat3_.x = min(_e783.x, 1f);
    let _e790 = _f_buffer4_.f_cb4_[9];
    let _e796 = _f_buffer4_.f_cb4_[9];
    u_xlat11_ = (-(_e790.x) + _e796.y);
    let _e800 = u_xlat3_;
    let _e802 = u_xlat11_;
    let _e807 = _f_buffer4_.f_cb4_[9];
    u_xlat3_.x = ((_e800.x * _e802) + _e807.x);
    let _e810 = u_xlat3_;
    let _e816 = _f_buffer4_.f_cb4_[9];
    u_xlat11_ = (-(_e810.x) + _e816.y);
    let _e819 = u_xlat24_;
    let _e820 = u_xlat11_;
    u_xlat24_ = (_e819 * _e820);
    let _e826 = _f_buffer4_.f_cb4_[7];
    let _e828 = u_xlat24_;
    let _e830 = u_xlat3_;
    SV_Target0_.w = ((_e826.z * _e828) + _e830.x);
    let _e833 = u_xlat1_;
    let _e837 = _f_buffer4_.f_cb4_[11];
    u_xlat24_ = dot(_e833, _e837);
    let _e839 = u_xlat24_;
    u_xlat24_ = min(_e839, 1f);
    let _e842 = u_xlat2_;
    let _e847 = _f_buffer4_.f_cb4_[10];
    u_xlat1_ = (_e842.wxyz * _e847.wxyz);
    let _e850 = u_xlatb3_;
    let _e860 = _f_buffer4_.f_cb4_[12];
    let _e863 = (vec4<f32>(0f, 0f, 0f, 0f) < _e860.wzww).xy;
    u_xlatb3_.x = _e863.x;
    u_xlatb3_.y = _e863.y;
    let _e869 = u_xlat1_;
    let _e874 = _f_buffer4_.f_cb4_[12];
    u_xlat1_.x = (_e869.x * _e874.w);
    let _e878 = u_xlat1_;
    u_xlat1_.x = _e878.x;
    let _e881 = u_xlat1_;
    u_xlat1_.x = clamp(_e881.x, 0f, 1f);
    let _e886 = u_xlat4_;
    let _e888 = u_xlat2_;
    let _e893 = _f_buffer4_.f_cb4_[10];
    let _e896 = u_xlat0_;
    let _e899 = ((_e888.xyz * _e893.xyz) + -(_e896.xyz));
    u_xlat4_.x = _e899.x;
    u_xlat4_.y = _e899.y;
    u_xlat4_.z = _e899.z;
    let _e906 = u_xlat4_;
    let _e908 = u_xlat1_;
    let _e910 = u_xlat4_;
    let _e913 = u_xlat0_;
    let _e915 = ((_e908.xxx * _e910.xyz) + _e913.xyz);
    u_xlat4_.x = _e915.x;
    u_xlat4_.y = _e915.y;
    u_xlat4_.z = _e915.z;
    let _e922 = u_xlat3_;
    let _e924 = u_xlatb3_;
    if _e924.x {
        let _e926 = u_xlat4_;
        local_2 = _e926.xyz;
    } else {
        let _e928 = u_xlat0_;
        local_2 = _e928.xyz;
    }
    let _e931 = local_2;
    u_xlat3_.x = _e931.x;
    u_xlat3_.z = _e931.y;
    u_xlat3_.w = _e931.z;
    let _e938 = u_xlat4_;
    let _e940 = u_xlat1_;
    let _e942 = u_xlat3_;
    let _e944 = (_e940.yzw * _e942.xzw);
    u_xlat4_.x = _e944.x;
    u_xlat4_.y = _e944.y;
    u_xlat4_.z = _e944.z;
    let _e951 = u_xlat3_;
    let _e953 = u_xlat4_;
    let _e958 = _f_buffer4_.f_cb4_[12];
    let _e961 = u_xlat3_;
    let _e963 = ((_e953.xyz * _e958.yyy) + _e961.xzw);
    u_xlat3_.x = _e963.x;
    u_xlat3_.z = _e963.y;
    u_xlat3_.w = _e963.z;
    let _e970 = u_xlat3_;
    let _e975 = _f_buffer4_.f_cb4_[12];
    let _e977 = u_xlat1_;
    let _e980 = u_xlat3_;
    let _e982 = ((_e975.xxx * _e977.yzw) + _e980.xzw);
    u_xlat3_.x = _e982.x;
    u_xlat3_.z = _e982.y;
    u_xlat3_.w = _e982.z;
    let _e989 = u_xlat4_;
    let _e991 = u_xlat3_;
    let _e993 = u_xlat3_;
    let _e995 = (_e991.xzw + _e993.xzw);
    u_xlat4_.x = _e995.x;
    u_xlat4_.y = _e995.y;
    u_xlat4_.z = _e995.z;
    let _e1002 = u_xlat5_;
    let _e1004 = u_xlat1_;
    let _e1006 = u_xlat4_;
    let _e1008 = (_e1004.yzw * _e1006.xyz);
    u_xlat5_.x = _e1008.x;
    u_xlat5_.y = _e1008.y;
    u_xlat5_.z = _e1008.z;
    let _e1015 = u_xlat6_;
    let _e1017 = u_xlat3_;
    let _e1024 = (-(_e1017.xzw) + vec3<f32>(1f, 1f, 1f));
    u_xlat6_.x = _e1024.x;
    u_xlat6_.y = _e1024.y;
    u_xlat6_.z = _e1024.z;
    let _e1031 = u_xlat6_;
    let _e1033 = u_xlat6_;
    let _e1035 = u_xlat6_;
    let _e1037 = (_e1033.xyz + _e1035.xyz);
    u_xlat6_.x = _e1037.x;
    u_xlat6_.y = _e1037.y;
    u_xlat6_.z = _e1037.z;
    let _e1044 = u_xlat2_;
    let _e1046 = u_xlat2_;
    let _e1052 = _f_buffer4_.f_cb4_[10];
    let _e1059 = ((-(_e1046.xyz) * _e1052.xyz) + vec3<f32>(1f, 1f, 1f));
    u_xlat2_.x = _e1059.x;
    u_xlat2_.y = _e1059.y;
    u_xlat2_.z = _e1059.z;
    let _e1066 = u_xlat2_;
    let _e1068 = u_xlat6_;
    let _e1071 = u_xlat2_;
    let _e1078 = ((-(_e1068.xyz) * _e1071.xyz) + vec3<f32>(1f, 1f, 1f));
    u_xlat2_.x = _e1078.x;
    u_xlat2_.y = _e1078.y;
    u_xlat2_.z = _e1078.z;
    let _e1085 = u_xlat6_;
    let _e1087 = u_xlat4_;
    let _e1089 = floor(_e1087.xyz);
    u_xlat6_.x = _e1089.x;
    u_xlat6_.y = _e1089.y;
    u_xlat6_.z = _e1089.z;
    let _e1096 = u_xlat6_;
    let _e1098 = u_xlat6_;
    let _e1104 = min(_e1098.xyz, vec3<f32>(1f, 1f, 1f));
    u_xlat6_.x = _e1104.x;
    u_xlat6_.y = _e1104.y;
    u_xlat6_.z = _e1104.z;
    let _e1111 = u_xlat1_;
    let _e1113 = u_xlat4_;
    let _e1116 = u_xlat1_;
    let _e1119 = u_xlat2_;
    let _e1121 = ((-(_e1113.xyz) * _e1116.yzw) + _e1119.xyz);
    u_xlat1_.x = _e1121.x;
    u_xlat1_.y = _e1121.y;
    u_xlat1_.z = _e1121.z;
    let _e1128 = u_xlat1_;
    let _e1130 = u_xlat6_;
    let _e1132 = u_xlat1_;
    let _e1135 = u_xlat5_;
    let _e1137 = ((_e1130.xyz * _e1132.xyz) + _e1135.xyz);
    u_xlat1_.x = _e1137.x;
    u_xlat1_.y = _e1137.y;
    u_xlat1_.z = _e1137.z;
    let _e1144 = u_xlat1_;
    let _e1146 = u_xlat0_;
    let _e1149 = u_xlat1_;
    let _e1151 = (-(_e1146.xyz) + _e1149.xyz);
    u_xlat1_.x = _e1151.x;
    u_xlat1_.y = _e1151.y;
    u_xlat1_.z = _e1151.z;
    let _e1158 = u_xlat1_;
    let _e1163 = _f_buffer4_.f_cb4_[12];
    let _e1165 = u_xlat1_;
    let _e1168 = u_xlat0_;
    let _e1170 = ((_e1163.zzz * _e1165.xyz) + _e1168.xyz);
    u_xlat1_.x = _e1170.x;
    u_xlat1_.y = _e1170.y;
    u_xlat1_.z = _e1170.z;
    let _e1177 = u_xlat1_;
    let _e1179 = u_xlatb3_;
    if _e1179.y {
        let _e1181 = u_xlat1_;
        local_3 = _e1181.xyz;
    } else {
        let _e1183 = u_xlat3_;
        local_3 = _e1183.xzw;
    }
    let _e1186 = local_3;
    u_xlat1_.x = _e1186.x;
    u_xlat1_.y = _e1186.y;
    u_xlat1_.z = _e1186.z;
    let _e1193 = u_xlat1_;
    let _e1195 = u_xlat0_;
    let _e1198 = u_xlat1_;
    let _e1200 = (-(_e1195.xyz) + _e1198.xyz);
    u_xlat1_.x = _e1200.x;
    u_xlat1_.y = _e1200.y;
    u_xlat1_.z = _e1200.z;
    let _e1207 = SV_Target0_;
    let _e1209 = u_xlat24_;
    let _e1211 = u_xlat1_;
    let _e1214 = u_xlat0_;
    let _e1216 = ((vec3(_e1209) * _e1211.xyz) + _e1214.xyz);
    SV_Target0_.x = _e1216.x;
    SV_Target0_.y = _e1216.y;
    SV_Target0_.z = _e1216.z;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(4) vs_TEXCOORD4_: vec3<f32>, @location(5) vs_TEXCOORD5_: vec3<f32>, @location(12) vs_NORMAL0_: vec3<f32>, @location(1) vs_TEXCOORD1_: vec3<f32>, @location(3) vs_TEXCOORDindex3_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD4_1 = vs_TEXCOORD4_;
    vs_TEXCOORD5_1 = vs_TEXCOORD5_;
    vs_NORMAL0_1 = vs_NORMAL0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_TEXCOORDindex3_1 = vs_TEXCOORDindex3_;
    main_1();
    let _e63 = SV_Target0_;
    return FragmentOutput(_e63);
}
