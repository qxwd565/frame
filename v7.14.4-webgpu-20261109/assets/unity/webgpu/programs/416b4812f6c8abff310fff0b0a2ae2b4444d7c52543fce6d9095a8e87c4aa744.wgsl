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
    f_cb3_: array<vec4<f32>, 12>,
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
var<private> vs_TEXCOORD0_1: vec4<f32>;
var<private> vs_TEXCOORD4_1: vec3<f32>;
var<private> vs_NORMAL0_1: vec3<f32>;
var<private> vs_TEXCOORD1_1: vec3<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec4<f32> = vec4(0f);
    var u_xlatb3_: vec2<bool> = vec2(false);
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlat5_: vec3<f32> = vec3(0f);
    var u_xlat6_: vec3<f32> = vec3(0f);
    var u_xlat7_: vec3<f32> = vec3(0f);
    var u_xlat8_: vec3<f32> = vec3(0f);
    var u_xlat12_: f32 = 0f;
    var u_xlat27_: f32 = 0f;
    var u_xlat30_: f32 = 0f;
    var u_xlatu30_: u32 = 0u;
    var u_xlatu31_: u32 = 0u;
    var u_xlat32_: f32 = 0f;
    var u_xlati32_: i32 = 0i;
    var u_xlatu32_: u32 = 0u;
    var u_xlatb32_: bool = false;
    var u_xlat33_: f32 = 0f;
    var u_xlati33_: i32 = 0i;
    var u_xlat34_: f32 = 0f;
    var u_xlatu_loop_1_: u32 = 0u;
    var local: array<vec4<u32>, 4> = ImmCB_0_;
    var local_1: vec3<f32>;
    var local_2: vec3<f32>;

    let _e105 = vs_TEXCOORD0_1;
    let _e110 = _f_buffer0_.f_cb0_[4];
    let _e115 = hscard_bias.values[0];
    let _e118 = textureSampleBias(f_t0_, samplerf_s0_, _e105.xy, (_e110.x + _e115.x));
    u_xlat0_ = _e118;
    let _e119 = vs_TEXCOORD0_1;
    let _e124 = _f_buffer0_.f_cb0_[4];
    let _e129 = hscard_bias.values[1];
    let _e132 = textureSampleBias(f_t1_, samplerf_s1_, _e119.xy, (_e124.x + _e129.x));
    u_xlat1_ = _e132;
    let _e133 = vs_TEXCOORD0_1;
    let _e138 = _f_buffer0_.f_cb0_[4];
    let _e143 = hscard_bias.values[2];
    let _e146 = textureSampleBias(f_t2_, samplerf_s2_, _e133.zw, (_e138.x + _e143.x));
    u_xlat2_ = _e146;
    let _e147 = vs_TEXCOORD4_1;
    let _e152 = _f_buffer0_.f_cb0_[4];
    let _e157 = hscard_bias.values[3];
    let _e160 = textureSampleBias(f_t3_, samplerf_s3_, _e147.xy, (_e152.x + _e157.x));
    u_xlat3_ = _e160;
    let _e161 = vs_NORMAL0_1;
    let _e163 = vs_NORMAL0_1;
    u_xlat27_ = dot(_e161.xyz, _e163.xyz);
    let _e166 = u_xlat27_;
    u_xlat27_ = inverseSqrt(_e166);
    let _e168 = u_xlat4_;
    let _e170 = u_xlat27_;
    let _e172 = vs_NORMAL0_1;
    let _e174 = (vec3(_e170) * _e172.xyz);
    u_xlat4_.x = _e174.x;
    u_xlat4_.y = _e174.y;
    u_xlat4_.z = _e174.z;
    let _e181 = u_xlat5_;
    let _e186 = _f_buffer0_.f_cb0_[6];
    let _e191 = _f_buffer2_.f_cb2_[11];
    let _e193 = (_e186.xyz * _e191.zzz);
    u_xlat5_.x = _e193.x;
    u_xlat5_.y = _e193.y;
    u_xlat5_.z = _e193.z;
    let _e200 = u_xlat4_;
    let _e205 = _f_buffer0_.f_cb0_[5];
    u_xlat27_ = dot(_e200.xyz, _e205.xyz);
    let _e208 = u_xlat27_;
    u_xlat27_ = clamp(_e208, 0f, 1f);
    let _e215 = _f_buffer0_.f_cb0_[10];
    let _e220 = _f_buffer2_.f_cb2_[11];
    u_xlat30_ = min(_e215.x, _e220.y);
    let _e223 = u_xlat30_;
    u_xlatu30_ = u32(i32(_e223));
    u_xlat6_.x = 0f;
    u_xlat6_.y = 0f;
    u_xlat6_.z = 0f;
    loop {
        let _e237 = u_xlatu_loop_1_;
        let _e238 = u_xlatu30_;
        if !((_e237 < _e238)) {
            break;
        }
        {
            let _e244 = u_xlatu_loop_1_;
            u_xlatu32_ = (_e244 >> 2u);
            let _e247 = u_xlatu_loop_1_;
            u_xlati33_ = i32((_e247 & 3u));
            let _e251 = u_xlatu32_;
            let _e257 = _f_buffer2_.f_cb2_[(i32(_e251) + 12i)];
            let _e258 = u_xlati33_;
            let _e262 = local[_e258];
            u_xlat32_ = dot(_e257, bitcast<vec4<f32>>(_e262));
            let _e265 = u_xlat32_;
            u_xlati32_ = i32(_e265);
            let _e267 = u_xlat7_;
            let _e269 = vs_TEXCOORD1_1;
            let _e272 = u_xlati32_;
            let _e275 = _f_buffer1_.f_cb1_[_e272];
            let _e278 = u_xlati32_;
            let _e281 = _f_buffer1_.f_cb1_[_e278];
            let _e283 = ((-(_e269.xyz) * _e275.www) + _e281.xyz);
            u_xlat7_.x = _e283.x;
            u_xlat7_.y = _e283.y;
            u_xlat7_.z = _e283.z;
            let _e290 = u_xlat7_;
            let _e292 = u_xlat7_;
            u_xlat33_ = dot(_e290.xyz, _e292.xyz);
            let _e295 = u_xlat33_;
            u_xlat33_ = max(_e295, 0.000061035156f);
            let _e298 = u_xlat33_;
            u_xlat34_ = inverseSqrt(_e298);
            let _e300 = u_xlat7_;
            let _e302 = u_xlat34_;
            let _e304 = u_xlat7_;
            let _e306 = (vec3(_e302) * _e304.xyz);
            u_xlat7_.x = _e306.x;
            u_xlat7_.y = _e306.y;
            u_xlat7_.z = _e306.z;
            let _e315 = u_xlati32_;
            let _e320 = _f_buffer1_.f_cb1_[(_e315 + 512i)];
            u_xlat34_ = (1f / _e320.x);
            let _e323 = u_xlat33_;
            u_xlat33_ = (_e323 * 25f);
            let _e326 = u_xlat33_;
            let _e327 = u_xlat34_;
            u_xlat33_ = (_e326 / _e327);
            let _e329 = u_xlat33_;
            u_xlat33_ = (_e329 + 1f);
            let _e334 = u_xlat33_;
            u_xlat33_ = (1f / _e334);
            let _e336 = u_xlati32_;
            let _e341 = _f_buffer1_.f_cb1_[(_e336 + 768i)];
            let _e343 = u_xlat7_;
            u_xlat34_ = dot(_e341.xyz, _e343.xyz);
            let _e346 = u_xlat34_;
            let _e347 = u_xlati32_;
            let _e352 = _f_buffer1_.f_cb1_[(_e347 + 512i)];
            let _e355 = u_xlati32_;
            let _e360 = _f_buffer1_.f_cb1_[(_e355 + 512i)];
            u_xlat34_ = ((_e346 * _e352.z) + _e360.w);
            let _e363 = u_xlat34_;
            u_xlat34_ = clamp(_e363, 0f, 1f);
            let _e367 = u_xlat34_;
            let _e368 = u_xlat34_;
            u_xlat34_ = (_e367 * _e368);
            let _e370 = u_xlat33_;
            let _e371 = u_xlat34_;
            u_xlat33_ = (_e370 * _e371);
            let _e373 = u_xlat8_;
            let _e375 = u_xlat33_;
            let _e377 = u_xlati32_;
            let _e382 = _f_buffer1_.f_cb1_[(_e377 + 256i)];
            let _e384 = (vec3(_e375) * _e382.xyz);
            u_xlat8_.x = _e384.x;
            u_xlat8_.y = _e384.y;
            u_xlat8_.z = _e384.z;
            let _e391 = u_xlat4_;
            let _e393 = u_xlat7_;
            u_xlat32_ = dot(_e391.xyz, _e393.xyz);
            let _e396 = u_xlat32_;
            u_xlat32_ = clamp(_e396, 0f, 1f);
            let _e400 = u_xlat6_;
            let _e402 = u_xlat8_;
            let _e404 = u_xlat32_;
            let _e407 = u_xlat6_;
            let _e409 = ((_e402.xyz * vec3(_e404)) + _e407.xyz);
            u_xlat6_.x = _e409.x;
            u_xlat6_.y = _e409.y;
            u_xlat6_.z = _e409.z;
        }
        continuing {
            let _e241 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e241 + 1u);
        }
    }
    let _e416 = u_xlat4_;
    let _e418 = u_xlat5_;
    let _e420 = u_xlat27_;
    let _e423 = u_xlat6_;
    let _e425 = ((_e418.xyz * vec3(_e420)) + _e423.xyz);
    u_xlat4_.x = _e425.x;
    u_xlat4_.y = _e425.y;
    u_xlat4_.z = _e425.z;
    let _e436 = _f_buffer2_.f_cb2_[27];
    u_xlat5_.x = abs(_e436.w);
    let _e443 = _f_buffer2_.f_cb2_[28];
    u_xlat5_.y = abs(_e443.w);
    let _e450 = _f_buffer2_.f_cb2_[29];
    u_xlat5_.z = abs(_e450.w);
    let _e453 = u_xlat5_;
    let _e455 = u_xlat5_;
    let _e457 = log2(_e455.xyz);
    u_xlat5_.x = _e457.x;
    u_xlat5_.y = _e457.y;
    u_xlat5_.z = _e457.z;
    let _e464 = u_xlat5_;
    let _e466 = u_xlat5_;
    let _e472 = (_e466.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat5_.x = _e472.x;
    u_xlat5_.y = _e472.y;
    u_xlat5_.z = _e472.z;
    let _e479 = u_xlat5_;
    let _e481 = u_xlat5_;
    let _e483 = exp2(_e481.xyz);
    u_xlat5_.x = _e483.x;
    u_xlat5_.y = _e483.y;
    u_xlat5_.z = _e483.z;
    let _e490 = u_xlat5_;
    let _e492 = u_xlat5_;
    let _e506 = ((_e492.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat5_.x = _e506.x;
    u_xlat5_.y = _e506.y;
    u_xlat5_.z = _e506.z;
    let _e513 = u_xlat5_;
    let _e515 = u_xlat5_;
    let _e521 = clamp(_e515.xyz, vec3(0f), vec3(1f));
    u_xlat5_.x = _e521.x;
    u_xlat5_.y = _e521.y;
    u_xlat5_.z = _e521.z;
    let _e528 = u_xlat4_;
    let _e530 = u_xlat4_;
    let _e532 = u_xlat5_;
    let _e534 = (_e530.xyz + _e532.xyz);
    u_xlat4_.x = _e534.x;
    u_xlat4_.y = _e534.y;
    u_xlat4_.z = _e534.z;
    let _e541 = u_xlat0_;
    let _e543 = u_xlat0_;
    let _e545 = u_xlat4_;
    let _e547 = (_e543.xyz * _e545.xyz);
    u_xlat0_.x = _e547.x;
    u_xlat0_.y = _e547.y;
    u_xlat0_.z = _e547.z;
    let _e554 = u_xlat3_;
    let _e556 = u_xlat3_;
    let _e561 = _f_buffer3_.f_cb3_[5];
    let _e563 = (_e556.zxy * _e561.zxy);
    u_xlat3_.x = _e563.x;
    u_xlat3_.y = _e563.y;
    u_xlat3_.z = _e563.z;
    let _e570 = u_xlat1_;
    let _e574 = _f_buffer3_.f_cb3_[3];
    u_xlat27_ = dot(_e570, _e574);
    let _e576 = u_xlat27_;
    u_xlat27_ = min(_e576, 1f);
    let _e579 = u_xlat27_;
    let _e580 = u_xlat3_;
    u_xlat27_ = (_e579 * _e580.z);
    let _e583 = u_xlat4_;
    let _e585 = u_xlat27_;
    let _e590 = _f_buffer3_.f_cb3_[2];
    let _e592 = (vec3(_e585) * _e590.xyz);
    u_xlat4_.x = _e592.x;
    u_xlat4_.y = _e592.y;
    u_xlat4_.z = _e592.z;
    let _e599 = u_xlat0_;
    let _e601 = u_xlat0_;
    let _e603 = u_xlat3_;
    let _e606 = u_xlat4_;
    let _e608 = ((_e601.xyz * _e603.yyy) + _e606.xyz);
    u_xlat0_.x = _e608.x;
    u_xlat0_.y = _e608.y;
    u_xlat0_.z = _e608.z;
    let _e615 = u_xlat0_;
    let _e617 = u_xlat3_;
    let _e622 = _f_buffer3_.f_cb3_[4];
    let _e625 = u_xlat0_;
    let _e627 = ((_e617.xxx * _e622.xyz) + _e625.xyz);
    u_xlat0_.x = _e627.x;
    u_xlat0_.y = _e627.y;
    u_xlat0_.z = _e627.z;
    let _e634 = u_xlat1_;
    let _e638 = _f_buffer3_.f_cb3_[7];
    u_xlat27_ = dot(_e634, _e638);
    let _e640 = u_xlat27_;
    u_xlat27_ = min(_e640, 1f);
    let _e646 = _f_buffer3_.f_cb3_[8];
    let _e652 = _f_buffer3_.f_cb3_[8];
    u_xlat12_ = (-(_e646.x) + _e652.y);
    let _e655 = u_xlat27_;
    let _e656 = u_xlat12_;
    let _e661 = _f_buffer3_.f_cb3_[8];
    u_xlat27_ = ((_e655 * _e656) + _e661.x);
    let _e665 = u_xlat3_;
    u_xlat3_.x = _e665.x;
    let _e668 = u_xlat3_;
    u_xlat3_.x = clamp(_e668.x, 0f, 1f);
    let _e673 = u_xlat27_;
    let _e678 = _f_buffer3_.f_cb3_[8];
    u_xlat12_ = (-(_e673) + _e678.y);
    let _e682 = u_xlat12_;
    let _e683 = u_xlat3_;
    u_xlat3_.x = (_e682 * _e683.x);
    let _e690 = _f_buffer3_.f_cb3_[6];
    let _e692 = u_xlat3_;
    let _e695 = u_xlat27_;
    SV_Target0_.w = ((_e690.x * _e692.x) + _e695);
    let _e697 = u_xlat1_;
    let _e701 = _f_buffer3_.f_cb3_[10];
    u_xlat27_ = dot(_e697, _e701);
    let _e703 = u_xlat27_;
    u_xlat27_ = min(_e703, 1f);
    let _e706 = u_xlat2_;
    let _e711 = _f_buffer3_.f_cb3_[9];
    u_xlat1_ = (_e706.wxyz * _e711.wxyz);
    let _e714 = u_xlatb3_;
    let _e724 = _f_buffer3_.f_cb3_[11];
    let _e727 = (vec4<f32>(0f, 0f, 0f, 0f) < _e724.wzww).xy;
    u_xlatb3_.x = _e727.x;
    u_xlatb3_.y = _e727.y;
    let _e733 = u_xlat1_;
    let _e738 = _f_buffer3_.f_cb3_[11];
    u_xlat1_.x = (_e733.x * _e738.w);
    let _e742 = u_xlat1_;
    u_xlat1_.x = _e742.x;
    let _e745 = u_xlat1_;
    u_xlat1_.x = clamp(_e745.x, 0f, 1f);
    let _e750 = u_xlat4_;
    let _e752 = u_xlat2_;
    let _e757 = _f_buffer3_.f_cb3_[9];
    let _e760 = u_xlat0_;
    let _e763 = ((_e752.xyz * _e757.xyz) + -(_e760.xyz));
    u_xlat4_.x = _e763.x;
    u_xlat4_.y = _e763.y;
    u_xlat4_.z = _e763.z;
    let _e770 = u_xlat4_;
    let _e772 = u_xlat1_;
    let _e774 = u_xlat4_;
    let _e777 = u_xlat0_;
    let _e779 = ((_e772.xxx * _e774.xyz) + _e777.xyz);
    u_xlat4_.x = _e779.x;
    u_xlat4_.y = _e779.y;
    u_xlat4_.z = _e779.z;
    let _e786 = u_xlat3_;
    let _e788 = u_xlatb3_;
    if _e788.x {
        let _e790 = u_xlat4_;
        local_1 = _e790.xyz;
    } else {
        let _e792 = u_xlat0_;
        local_1 = _e792.xyz;
    }
    let _e795 = local_1;
    u_xlat3_.x = _e795.x;
    u_xlat3_.z = _e795.y;
    u_xlat3_.w = _e795.z;
    let _e802 = u_xlat4_;
    let _e804 = u_xlat1_;
    let _e806 = u_xlat3_;
    let _e808 = (_e804.yzw * _e806.xzw);
    u_xlat4_.x = _e808.x;
    u_xlat4_.y = _e808.y;
    u_xlat4_.z = _e808.z;
    let _e815 = u_xlat3_;
    let _e817 = u_xlat4_;
    let _e822 = _f_buffer3_.f_cb3_[11];
    let _e825 = u_xlat3_;
    let _e827 = ((_e817.xyz * _e822.yyy) + _e825.xzw);
    u_xlat3_.x = _e827.x;
    u_xlat3_.z = _e827.y;
    u_xlat3_.w = _e827.z;
    let _e834 = u_xlat3_;
    let _e839 = _f_buffer3_.f_cb3_[11];
    let _e841 = u_xlat1_;
    let _e844 = u_xlat3_;
    let _e846 = ((_e839.xxx * _e841.yzw) + _e844.xzw);
    u_xlat3_.x = _e846.x;
    u_xlat3_.z = _e846.y;
    u_xlat3_.w = _e846.z;
    let _e853 = u_xlat4_;
    let _e855 = u_xlat3_;
    let _e857 = u_xlat3_;
    let _e859 = (_e855.xzw + _e857.xzw);
    u_xlat4_.x = _e859.x;
    u_xlat4_.y = _e859.y;
    u_xlat4_.z = _e859.z;
    let _e866 = u_xlat5_;
    let _e868 = u_xlat1_;
    let _e870 = u_xlat4_;
    let _e872 = (_e868.yzw * _e870.xyz);
    u_xlat5_.x = _e872.x;
    u_xlat5_.y = _e872.y;
    u_xlat5_.z = _e872.z;
    let _e879 = u_xlat6_;
    let _e881 = u_xlat3_;
    let _e888 = (-(_e881.xzw) + vec3<f32>(1f, 1f, 1f));
    u_xlat6_.x = _e888.x;
    u_xlat6_.y = _e888.y;
    u_xlat6_.z = _e888.z;
    let _e895 = u_xlat6_;
    let _e897 = u_xlat6_;
    let _e899 = u_xlat6_;
    let _e901 = (_e897.xyz + _e899.xyz);
    u_xlat6_.x = _e901.x;
    u_xlat6_.y = _e901.y;
    u_xlat6_.z = _e901.z;
    let _e908 = u_xlat2_;
    let _e910 = u_xlat2_;
    let _e916 = _f_buffer3_.f_cb3_[9];
    let _e923 = ((-(_e910.xyz) * _e916.xyz) + vec3<f32>(1f, 1f, 1f));
    u_xlat2_.x = _e923.x;
    u_xlat2_.y = _e923.y;
    u_xlat2_.z = _e923.z;
    let _e930 = u_xlat2_;
    let _e932 = u_xlat6_;
    let _e935 = u_xlat2_;
    let _e942 = ((-(_e932.xyz) * _e935.xyz) + vec3<f32>(1f, 1f, 1f));
    u_xlat2_.x = _e942.x;
    u_xlat2_.y = _e942.y;
    u_xlat2_.z = _e942.z;
    let _e949 = u_xlat6_;
    let _e951 = u_xlat4_;
    let _e953 = floor(_e951.xyz);
    u_xlat6_.x = _e953.x;
    u_xlat6_.y = _e953.y;
    u_xlat6_.z = _e953.z;
    let _e960 = u_xlat6_;
    let _e962 = u_xlat6_;
    let _e968 = min(_e962.xyz, vec3<f32>(1f, 1f, 1f));
    u_xlat6_.x = _e968.x;
    u_xlat6_.y = _e968.y;
    u_xlat6_.z = _e968.z;
    let _e975 = u_xlat1_;
    let _e977 = u_xlat4_;
    let _e980 = u_xlat1_;
    let _e983 = u_xlat2_;
    let _e985 = ((-(_e977.xyz) * _e980.yzw) + _e983.xyz);
    u_xlat1_.x = _e985.x;
    u_xlat1_.y = _e985.y;
    u_xlat1_.z = _e985.z;
    let _e992 = u_xlat1_;
    let _e994 = u_xlat6_;
    let _e996 = u_xlat1_;
    let _e999 = u_xlat5_;
    let _e1001 = ((_e994.xyz * _e996.xyz) + _e999.xyz);
    u_xlat1_.x = _e1001.x;
    u_xlat1_.y = _e1001.y;
    u_xlat1_.z = _e1001.z;
    let _e1008 = u_xlat1_;
    let _e1010 = u_xlat0_;
    let _e1013 = u_xlat1_;
    let _e1015 = (-(_e1010.xyz) + _e1013.xyz);
    u_xlat1_.x = _e1015.x;
    u_xlat1_.y = _e1015.y;
    u_xlat1_.z = _e1015.z;
    let _e1022 = u_xlat1_;
    let _e1027 = _f_buffer3_.f_cb3_[11];
    let _e1029 = u_xlat1_;
    let _e1032 = u_xlat0_;
    let _e1034 = ((_e1027.zzz * _e1029.xyz) + _e1032.xyz);
    u_xlat1_.x = _e1034.x;
    u_xlat1_.y = _e1034.y;
    u_xlat1_.z = _e1034.z;
    let _e1041 = u_xlat1_;
    let _e1043 = u_xlatb3_;
    if _e1043.y {
        let _e1045 = u_xlat1_;
        local_2 = _e1045.xyz;
    } else {
        let _e1047 = u_xlat3_;
        local_2 = _e1047.xzw;
    }
    let _e1050 = local_2;
    u_xlat1_.x = _e1050.x;
    u_xlat1_.y = _e1050.y;
    u_xlat1_.z = _e1050.z;
    let _e1057 = u_xlat1_;
    let _e1059 = u_xlat0_;
    let _e1062 = u_xlat1_;
    let _e1064 = (-(_e1059.xyz) + _e1062.xyz);
    u_xlat1_.x = _e1064.x;
    u_xlat1_.y = _e1064.y;
    u_xlat1_.z = _e1064.z;
    let _e1071 = SV_Target0_;
    let _e1073 = u_xlat27_;
    let _e1075 = u_xlat1_;
    let _e1078 = u_xlat0_;
    let _e1080 = ((vec3(_e1073) * _e1075.xyz) + _e1078.xyz);
    SV_Target0_.x = _e1080.x;
    SV_Target0_.y = _e1080.y;
    SV_Target0_.z = _e1080.z;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(4) vs_TEXCOORD4_: vec3<f32>, @location(12) vs_NORMAL0_: vec3<f32>, @location(1) vs_TEXCOORD1_: vec3<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD4_1 = vs_TEXCOORD4_;
    vs_NORMAL0_1 = vs_NORMAL0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    main_1();
    let _e52 = SV_Target0_;
    return FragmentOutput(_e52);
}
