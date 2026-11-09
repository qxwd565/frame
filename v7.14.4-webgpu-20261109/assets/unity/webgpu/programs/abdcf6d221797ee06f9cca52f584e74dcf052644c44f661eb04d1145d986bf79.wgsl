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
    f_cb4_: array<vec4<f32>, 3>,
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
@group(3) @binding(0) 
var f_t0_: texture_depth_2d;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
@group(3) @binding(4) 
var f_t2_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD1_1: vec3<f32>;
var<private> vs_TEXCOORD4_1: vec4<f32>;
var<private> vs_NORMAL0_1: vec3<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlati1_: i32 = 0i;
    var u_xlatu1_: u32 = 0u;
    var u_xlatb1_: vec4<bool> = vec4(false);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlati4_: i32 = 0i;
    var u_xlatu4_: u32 = 0u;
    var u_xlatb4_: bool = false;
    var u_xlat5_: vec3<f32> = vec3(0f);
    var u_xlat7_: vec3<f32> = vec3(0f);
    var u_xlatb7_: bool = false;
    var u_xlat8_: f32 = 0f;
    var u_xlat10_: vec3<f32> = vec3(0f);
    var u_xlati10_: i32 = 0i;
    var u_xlat11_: f32 = 0f;
    var u_xlatb13_: bool = false;
    var u_xlat19_: f32 = 0f;
    var u_xlat20_: f32 = 0f;
    var u_xlatu20_: u32 = 0u;
    var u_xlatu21_: u32 = 0u;
    var local: f32;
    var local_1: f32;
    var local_2: f32;
    var local_3: f32;
    var local_4: f32;
    var local_5: f32;
    var local_6: f32;
    var txVec0_: vec3<f32>;
    var local_7: f32;
    var u_xlatu_loop_1_: u32 = 0u;
    var local_8: array<vec4<u32>, 4> = ImmCB_0_;

    let _e108 = vs_TEXCOORD0_1;
    let _e113 = _f_buffer0_.f_cb0_[4];
    let _e118 = hscard_bias.values[1];
    let _e121 = textureSampleBias(f_t1_, samplerf_s1_, _e108.xy, (_e113.x + _e118.x));
    u_xlat0_ = _e121;
    let _e122 = vs_TEXCOORD0_1;
    let _e127 = _f_buffer0_.f_cb0_[4];
    let _e132 = hscard_bias.values[2];
    let _e135 = textureSampleBias(f_t2_, samplerf_s2_, _e122.xy, (_e127.x + _e132.x));
    u_xlat1_ = _e135;
    let _e137 = vs_TEXCOORD4_1;
    let _e142 = _f_buffer4_.f_cb4_[2];
    u_xlat2_.x = (_e137.z + _e142.x);
    let _e146 = u_xlat2_;
    let _e151 = _f_buffer4_.f_cb4_[2];
    u_xlat2_.x = (_e146.x + _e151.y);
    let _e157 = _f_buffer4_.f_cb4_[2];
    let _e162 = _f_buffer4_.f_cb4_[2];
    u_xlat8_ = (_e157.y + _e162.y);
    let _e166 = u_xlat2_;
    let _e168 = u_xlat8_;
    u_xlat2_.x = (_e166.x / _e168);
    let _e171 = u_xlat2_;
    u_xlat2_.x = clamp(_e171.x, 0f, 1f);
    let _e176 = u_xlat2_;
    u_xlat8_ = (-(_e176.x) + 1f);
    let _e181 = u_xlat1_;
    let _e182 = u_xlat2_;
    u_xlat1_ = (_e181 * _e182.xxxx);
    let _e185 = u_xlat0_;
    let _e186 = u_xlat8_;
    let _e189 = u_xlat1_;
    u_xlat0_ = ((_e185 * vec4(_e186)) + _e189);
    let _e191 = u_xlat1_;
    let _e193 = vs_TEXCOORD1_1;
    let _e198 = _f_buffer3_.f_cb3_[20];
    let _e201 = (_e193.xyz + -(_e198.xyz));
    u_xlat1_.x = _e201.x;
    u_xlat1_.y = _e201.y;
    u_xlat1_.z = _e201.z;
    let _e208 = u_xlat2_;
    let _e210 = vs_TEXCOORD1_1;
    let _e215 = _f_buffer3_.f_cb3_[21];
    let _e218 = (_e210.xyz + -(_e215.xyz));
    u_xlat2_.x = _e218.x;
    u_xlat2_.y = _e218.y;
    u_xlat2_.z = _e218.z;
    let _e225 = u_xlat3_;
    let _e227 = vs_TEXCOORD1_1;
    let _e232 = _f_buffer3_.f_cb3_[22];
    let _e235 = (_e227.xyz + -(_e232.xyz));
    u_xlat3_.x = _e235.x;
    u_xlat3_.y = _e235.y;
    u_xlat3_.z = _e235.z;
    let _e242 = u_xlat4_;
    let _e244 = vs_TEXCOORD1_1;
    let _e249 = _f_buffer3_.f_cb3_[23];
    let _e252 = (_e244.xyz + -(_e249.xyz));
    u_xlat4_.x = _e252.x;
    u_xlat4_.y = _e252.y;
    u_xlat4_.z = _e252.z;
    let _e260 = u_xlat1_;
    let _e262 = u_xlat1_;
    u_xlat1_.x = dot(_e260.xyz, _e262.xyz);
    let _e266 = u_xlat2_;
    let _e268 = u_xlat2_;
    u_xlat1_.y = dot(_e266.xyz, _e268.xyz);
    let _e272 = u_xlat3_;
    let _e274 = u_xlat3_;
    u_xlat1_.z = dot(_e272.xyz, _e274.xyz);
    let _e278 = u_xlat4_;
    let _e280 = u_xlat4_;
    u_xlat1_.w = dot(_e278.xyz, _e280.xyz);
    let _e283 = u_xlat1_;
    let _e287 = _f_buffer3_.f_cb3_[24];
    u_xlatb1_ = (_e283 < _e287);
    let _e290 = u_xlatb1_;
    if _e290.x {
        local = 1f;
    } else {
        local = 0f;
    }
    let _e296 = local;
    u_xlat2_.x = _e296;
    let _e298 = u_xlatb1_;
    if _e298.y {
        local_1 = 1f;
    } else {
        local_1 = 0f;
    }
    let _e304 = local_1;
    u_xlat2_.y = _e304;
    let _e306 = u_xlatb1_;
    if _e306.z {
        local_2 = 1f;
    } else {
        local_2 = 0f;
    }
    let _e312 = local_2;
    u_xlat2_.z = _e312;
    let _e314 = u_xlatb1_;
    if _e314.w {
        local_3 = 1f;
    } else {
        local_3 = 0f;
    }
    let _e320 = local_3;
    u_xlat2_.w = _e320;
    let _e322 = u_xlatb1_;
    if _e322.x {
        local_4 = -1f;
    } else {
        local_4 = -0f;
    }
    let _e331 = local_4;
    u_xlat1_.x = _e331;
    let _e333 = u_xlatb1_;
    if _e333.y {
        local_5 = -1f;
    } else {
        local_5 = -0f;
    }
    let _e342 = local_5;
    u_xlat1_.y = _e342;
    let _e344 = u_xlatb1_;
    if _e344.z {
        local_6 = -1f;
    } else {
        local_6 = -0f;
    }
    let _e353 = local_6;
    u_xlat1_.z = _e353;
    let _e354 = u_xlat1_;
    let _e356 = u_xlat1_;
    let _e358 = u_xlat2_;
    let _e360 = (_e356.xyz + _e358.yzw);
    u_xlat1_.x = _e360.x;
    u_xlat1_.y = _e360.y;
    u_xlat1_.z = _e360.z;
    let _e367 = u_xlat2_;
    let _e369 = u_xlat1_;
    let _e375 = max(_e369.xyz, vec3<f32>(0f, 0f, 0f));
    u_xlat2_.y = _e375.x;
    u_xlat2_.z = _e375.y;
    u_xlat2_.w = _e375.z;
    let _e383 = u_xlat2_;
    u_xlat1_.x = dot(_e383, vec4<f32>(4f, 3f, 2f, 1f));
    let _e391 = u_xlat1_;
    u_xlat1_.x = (-(_e391.x) + 4f);
    let _e396 = u_xlat1_;
    u_xlatu1_ = u32(_e396.x);
    let _e399 = u_xlatu1_;
    u_xlati1_ = (i32(_e399) << 2u);
    let _e404 = u_xlat7_;
    let _e406 = vs_TEXCOORD1_1;
    let _e408 = u_xlati1_;
    let _e413 = _f_buffer3_.f_cb3_[(_e408 + 1i)];
    let _e415 = (_e406.yyy * _e413.xyz);
    u_xlat7_.x = _e415.x;
    u_xlat7_.y = _e415.y;
    u_xlat7_.z = _e415.z;
    let _e422 = u_xlat7_;
    let _e424 = u_xlati1_;
    let _e427 = _f_buffer3_.f_cb3_[_e424];
    let _e429 = vs_TEXCOORD1_1;
    let _e432 = u_xlat7_;
    let _e434 = ((_e427.xyz * _e429.xxx) + _e432.xyz);
    u_xlat7_.x = _e434.x;
    u_xlat7_.y = _e434.y;
    u_xlat7_.z = _e434.z;
    let _e441 = u_xlat7_;
    let _e443 = u_xlati1_;
    let _e448 = _f_buffer3_.f_cb3_[(_e443 + 2i)];
    let _e450 = vs_TEXCOORD1_1;
    let _e453 = u_xlat7_;
    let _e455 = ((_e448.xyz * _e450.zzz) + _e453.xyz);
    u_xlat7_.x = _e455.x;
    u_xlat7_.y = _e455.y;
    u_xlat7_.z = _e455.z;
    let _e462 = u_xlat1_;
    let _e464 = u_xlat7_;
    let _e466 = u_xlati1_;
    let _e471 = _f_buffer3_.f_cb3_[(_e466 + 3i)];
    let _e473 = (_e464.xyz + _e471.xyz);
    u_xlat1_.x = _e473.x;
    u_xlat1_.y = _e473.y;
    u_xlat1_.z = _e473.z;
    let _e480 = vs_NORMAL0_1;
    let _e482 = vs_NORMAL0_1;
    u_xlat19_ = dot(_e480.xyz, _e482.xyz);
    let _e485 = u_xlat19_;
    u_xlat19_ = inverseSqrt(_e485);
    let _e487 = u_xlat2_;
    let _e489 = u_xlat19_;
    let _e491 = vs_NORMAL0_1;
    let _e493 = (vec3(_e489) * _e491.xyz);
    u_xlat2_.x = _e493.x;
    u_xlat2_.y = _e493.y;
    u_xlat2_.z = _e493.z;
    let _e500 = u_xlat1_;
    let _e501 = _e500.xy;
    let _e502 = u_xlat1_;
    txVec0_ = vec3<f32>(_e501.x, _e501.y, _e502.z);
    let _e509 = txVec0_;
    let _e513 = textureSampleCompareLevel(f_t0_, samplerf_s0_, _e509.xy, _e509.z);
    u_xlat1_.x = _e513;
    let _e518 = _f_buffer3_.f_cb3_[27];
    u_xlat7_.x = (-(_e518.x) + 1f);
    let _e524 = u_xlat1_;
    let _e529 = _f_buffer3_.f_cb3_[27];
    let _e532 = u_xlat7_;
    u_xlat1_.x = ((_e524.x * _e529.x) + _e532.x);
    let _e536 = u_xlat1_;
    u_xlatb7_ = (0f >= _e536.z);
    let _e539 = u_xlat1_;
    u_xlatb13_ = (_e539.z >= 1f);
    let _e543 = u_xlatb13_;
    let _e544 = u_xlatb7_;
    u_xlatb7_ = (_e543 || _e544);
    let _e547 = u_xlatb7_;
    if _e547 {
        local_7 = 1f;
    } else {
        let _e549 = u_xlat1_;
        local_7 = _e549.x;
    }
    let _e552 = local_7;
    u_xlat1_.x = _e552;
    let _e554 = u_xlat1_;
    let _e559 = _f_buffer2_.f_cb2_[11];
    u_xlat1_.x = (_e554.x * _e559.z);
    let _e562 = u_xlat1_;
    let _e564 = u_xlat1_;
    let _e569 = _f_buffer0_.f_cb0_[6];
    let _e571 = (_e564.xxx * _e569.xyz);
    u_xlat1_.x = _e571.x;
    u_xlat1_.y = _e571.y;
    u_xlat1_.z = _e571.z;
    let _e578 = u_xlat2_;
    let _e583 = _f_buffer0_.f_cb0_[5];
    u_xlat19_ = dot(_e578.xyz, _e583.xyz);
    let _e586 = u_xlat19_;
    u_xlat19_ = clamp(_e586, 0f, 1f);
    let _e593 = _f_buffer0_.f_cb0_[10];
    let _e598 = _f_buffer2_.f_cb2_[11];
    u_xlat20_ = min(_e593.x, _e598.y);
    let _e601 = u_xlat20_;
    u_xlatu20_ = u32(i32(_e601));
    u_xlat3_.x = 0f;
    u_xlat3_.y = 0f;
    u_xlat3_.z = 0f;
    loop {
        let _e616 = u_xlatu_loop_1_;
        let _e617 = u_xlatu20_;
        if !((_e616 < _e617)) {
            break;
        }
        {
            let _e623 = u_xlatu_loop_1_;
            u_xlatu4_ = (_e623 >> 2u);
            let _e626 = u_xlatu_loop_1_;
            u_xlati10_ = i32((_e626 & 3u));
            let _e631 = u_xlatu4_;
            let _e637 = _f_buffer2_.f_cb2_[(i32(_e631) + 12i)];
            let _e638 = u_xlati10_;
            let _e642 = local_8[_e638];
            u_xlat4_.x = dot(_e637, bitcast<vec4<f32>>(_e642));
            let _e645 = u_xlat4_;
            u_xlati4_ = i32(_e645.x);
            let _e648 = u_xlat10_;
            let _e650 = vs_TEXCOORD1_1;
            let _e653 = u_xlati4_;
            let _e656 = _f_buffer1_.f_cb1_[_e653];
            let _e659 = u_xlati4_;
            let _e662 = _f_buffer1_.f_cb1_[_e659];
            let _e664 = ((-(_e650.xyz) * _e656.www) + _e662.xyz);
            u_xlat10_.x = _e664.x;
            u_xlat10_.y = _e664.y;
            u_xlat10_.z = _e664.z;
            let _e672 = u_xlat10_;
            let _e674 = u_xlat10_;
            u_xlat5_.x = dot(_e672.xyz, _e674.xyz);
            let _e678 = u_xlat5_;
            u_xlat5_.x = max(_e678.x, 0.000061035156f);
            let _e682 = u_xlat5_;
            u_xlat11_ = inverseSqrt(_e682.x);
            let _e685 = u_xlat10_;
            let _e687 = u_xlat10_;
            let _e689 = u_xlat11_;
            let _e691 = (_e687.xyz * vec3(_e689));
            u_xlat10_.x = _e691.x;
            u_xlat10_.y = _e691.y;
            u_xlat10_.z = _e691.z;
            let _e700 = u_xlati4_;
            let _e705 = _f_buffer1_.f_cb1_[(_e700 + 512i)];
            u_xlat11_ = (1f / _e705.x);
            let _e709 = u_xlat5_;
            u_xlat5_.x = (_e709.x * 25f);
            let _e714 = u_xlat5_;
            let _e716 = u_xlat11_;
            u_xlat5_.x = (_e714.x / _e716);
            let _e719 = u_xlat5_;
            u_xlat5_.x = (_e719.x + 1f);
            let _e726 = u_xlat5_;
            u_xlat5_.x = (1f / _e726.x);
            let _e729 = u_xlati4_;
            let _e734 = _f_buffer1_.f_cb1_[(_e729 + 768i)];
            let _e736 = u_xlat10_;
            u_xlat11_ = dot(_e734.xyz, _e736.xyz);
            let _e739 = u_xlat11_;
            let _e740 = u_xlati4_;
            let _e745 = _f_buffer1_.f_cb1_[(_e740 + 512i)];
            let _e748 = u_xlati4_;
            let _e753 = _f_buffer1_.f_cb1_[(_e748 + 512i)];
            u_xlat11_ = ((_e739 * _e745.z) + _e753.w);
            let _e756 = u_xlat11_;
            u_xlat11_ = clamp(_e756, 0f, 1f);
            let _e760 = u_xlat11_;
            let _e761 = u_xlat11_;
            u_xlat11_ = (_e760 * _e761);
            let _e764 = u_xlat11_;
            let _e765 = u_xlat5_;
            u_xlat5_.x = (_e764 * _e765.x);
            let _e768 = u_xlat5_;
            let _e770 = u_xlat5_;
            let _e772 = u_xlati4_;
            let _e777 = _f_buffer1_.f_cb1_[(_e772 + 256i)];
            let _e779 = (_e770.xxx * _e777.xyz);
            u_xlat5_.x = _e779.x;
            u_xlat5_.y = _e779.y;
            u_xlat5_.z = _e779.z;
            let _e787 = u_xlat2_;
            let _e789 = u_xlat10_;
            u_xlat4_.x = dot(_e787.xyz, _e789.xyz);
            let _e793 = u_xlat4_;
            u_xlat4_.x = clamp(_e793.x, 0f, 1f);
            let _e798 = u_xlat3_;
            let _e800 = u_xlat5_;
            let _e802 = u_xlat4_;
            let _e805 = u_xlat3_;
            let _e807 = ((_e800.xyz * _e802.xxx) + _e805.xyz);
            u_xlat3_.x = _e807.x;
            u_xlat3_.y = _e807.y;
            u_xlat3_.z = _e807.z;
        }
        continuing {
            let _e620 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e620 + 1u);
        }
    }
    let _e814 = u_xlat1_;
    let _e816 = u_xlat1_;
    let _e818 = u_xlat19_;
    let _e821 = u_xlat3_;
    let _e823 = ((_e816.xyz * vec3(_e818)) + _e821.xyz);
    u_xlat1_.x = _e823.x;
    u_xlat1_.y = _e823.y;
    u_xlat1_.z = _e823.z;
    let _e834 = _f_buffer2_.f_cb2_[27];
    u_xlat2_.x = abs(_e834.w);
    let _e841 = _f_buffer2_.f_cb2_[28];
    u_xlat2_.y = abs(_e841.w);
    let _e848 = _f_buffer2_.f_cb2_[29];
    u_xlat2_.z = abs(_e848.w);
    let _e851 = u_xlat2_;
    let _e853 = u_xlat2_;
    let _e855 = log2(_e853.xyz);
    u_xlat2_.x = _e855.x;
    u_xlat2_.y = _e855.y;
    u_xlat2_.z = _e855.z;
    let _e862 = u_xlat2_;
    let _e864 = u_xlat2_;
    let _e870 = (_e864.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat2_.x = _e870.x;
    u_xlat2_.y = _e870.y;
    u_xlat2_.z = _e870.z;
    let _e877 = u_xlat2_;
    let _e879 = u_xlat2_;
    let _e881 = exp2(_e879.xyz);
    u_xlat2_.x = _e881.x;
    u_xlat2_.y = _e881.y;
    u_xlat2_.z = _e881.z;
    let _e888 = u_xlat2_;
    let _e890 = u_xlat2_;
    let _e904 = ((_e890.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat2_.x = _e904.x;
    u_xlat2_.y = _e904.y;
    u_xlat2_.z = _e904.z;
    let _e911 = u_xlat2_;
    let _e913 = u_xlat2_;
    let _e919 = clamp(_e913.xyz, vec3(0f), vec3(1f));
    u_xlat2_.x = _e919.x;
    u_xlat2_.y = _e919.y;
    u_xlat2_.z = _e919.z;
    let _e926 = u_xlat1_;
    let _e928 = u_xlat1_;
    let _e930 = u_xlat2_;
    let _e932 = (_e928.xyz + _e930.xyz);
    u_xlat1_.x = _e932.x;
    u_xlat1_.y = _e932.y;
    u_xlat1_.z = _e932.z;
    let _e939 = SV_Target0_;
    let _e941 = u_xlat0_;
    let _e943 = u_xlat1_;
    let _e945 = (_e941.xyz * _e943.xyz);
    SV_Target0_.x = _e945.x;
    SV_Target0_.y = _e945.y;
    SV_Target0_.z = _e945.z;
    let _e953 = u_xlat0_;
    SV_Target0_.w = _e953.w;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec3<f32>, @location(4) vs_TEXCOORD4_: vec4<f32>, @location(12) vs_NORMAL0_: vec3<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_TEXCOORD4_1 = vs_TEXCOORD4_;
    vs_NORMAL0_1 = vs_NORMAL0_;
    main_1();
    let _e51 = SV_Target0_;
    return FragmentOutput(_e51);
}
