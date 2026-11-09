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
    f_cb3_: array<vec4<f32>, 13>,
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
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
@group(3) @binding(4) 
var f_t2_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec4<f32>;
var<private> vs_TEXCOORD4_1: vec3<f32>;
var<private> vs_TEXCOORD5_1: vec3<f32>;
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
    var u_xlati6_: i32 = 0i;
    var u_xlat7_: vec3<f32> = vec3(0f);
    var u_xlat11_: f32 = 0f;
    var u_xlat24_: f32 = 0f;
    var u_xlat27_: f32 = 0f;
    var u_xlatu27_: u32 = 0u;
    var u_xlatu28_: u32 = 0u;
    var u_xlat29_: f32 = 0f;
    var u_xlati29_: i32 = 0i;
    var u_xlatu29_: u32 = 0u;
    var u_xlatb29_: bool = false;
    var u_xlat30_: f32 = 0f;
    var u_xlatu_loop_1_: u32 = 0u;
    var local: array<vec4<u32>, 4> = ImmCB_0_;
    var local_1: vec3<f32>;
    var local_2: vec3<f32>;

    let _e97 = vs_TEXCOORD0_1;
    let _e102 = _f_buffer0_.f_cb0_[4];
    let _e107 = hscard_bias.values[0];
    let _e110 = textureSampleBias(f_t0_, samplerf_s0_, _e97.xy, (_e102.x + _e107.x));
    u_xlat0_ = _e110;
    let _e111 = vs_TEXCOORD0_1;
    let _e116 = _f_buffer0_.f_cb0_[4];
    let _e121 = hscard_bias.values[1];
    let _e124 = textureSampleBias(f_t1_, samplerf_s1_, _e111.xy, (_e116.x + _e121.x));
    u_xlat1_ = _e124;
    let _e125 = vs_TEXCOORD0_1;
    let _e130 = _f_buffer0_.f_cb0_[4];
    let _e135 = hscard_bias.values[2];
    let _e138 = textureSampleBias(f_t2_, samplerf_s2_, _e125.zw, (_e130.x + _e135.x));
    u_xlat2_ = _e138;
    let _e139 = vs_NORMAL0_1;
    let _e141 = vs_NORMAL0_1;
    u_xlat24_ = dot(_e139.xyz, _e141.xyz);
    let _e144 = u_xlat24_;
    u_xlat24_ = inverseSqrt(_e144);
    let _e146 = u_xlat3_;
    let _e148 = u_xlat24_;
    let _e150 = vs_NORMAL0_1;
    let _e152 = (vec3(_e148) * _e150.xyz);
    u_xlat3_.x = _e152.x;
    u_xlat3_.y = _e152.y;
    u_xlat3_.z = _e152.z;
    let _e159 = u_xlat4_;
    let _e164 = _f_buffer0_.f_cb0_[6];
    let _e169 = _f_buffer2_.f_cb2_[11];
    let _e171 = (_e164.xyz * _e169.zzz);
    u_xlat4_.x = _e171.x;
    u_xlat4_.y = _e171.y;
    u_xlat4_.z = _e171.z;
    let _e178 = u_xlat3_;
    let _e183 = _f_buffer0_.f_cb0_[5];
    u_xlat24_ = dot(_e178.xyz, _e183.xyz);
    let _e186 = u_xlat24_;
    u_xlat24_ = clamp(_e186, 0f, 1f);
    let _e193 = _f_buffer0_.f_cb0_[10];
    let _e198 = _f_buffer2_.f_cb2_[11];
    u_xlat27_ = min(_e193.x, _e198.y);
    let _e201 = u_xlat27_;
    u_xlatu27_ = u32(i32(_e201));
    u_xlat5_.x = 0f;
    u_xlat5_.y = 0f;
    u_xlat5_.z = 0f;
    loop {
        let _e215 = u_xlatu_loop_1_;
        let _e216 = u_xlatu27_;
        if !((_e215 < _e216)) {
            break;
        }
        {
            let _e222 = u_xlatu_loop_1_;
            u_xlatu29_ = (_e222 >> 2u);
            let _e225 = u_xlatu_loop_1_;
            u_xlati6_ = i32((_e225 & 3u));
            let _e229 = u_xlatu29_;
            let _e235 = _f_buffer2_.f_cb2_[(i32(_e229) + 12i)];
            let _e236 = u_xlati6_;
            let _e240 = local[_e236];
            u_xlat29_ = dot(_e235, bitcast<vec4<f32>>(_e240));
            let _e243 = u_xlat29_;
            u_xlati29_ = i32(_e243);
            let _e245 = u_xlat6_;
            let _e247 = vs_TEXCOORD1_1;
            let _e250 = u_xlati29_;
            let _e253 = _f_buffer1_.f_cb1_[_e250];
            let _e256 = u_xlati29_;
            let _e259 = _f_buffer1_.f_cb1_[_e256];
            let _e261 = ((-(_e247.xyz) * _e253.www) + _e259.xyz);
            u_xlat6_.x = _e261.x;
            u_xlat6_.y = _e261.y;
            u_xlat6_.z = _e261.z;
            let _e268 = u_xlat6_;
            let _e270 = u_xlat6_;
            u_xlat30_ = dot(_e268.xyz, _e270.xyz);
            let _e273 = u_xlat30_;
            u_xlat30_ = max(_e273, 0.000061035156f);
            let _e277 = u_xlat30_;
            u_xlat7_.x = inverseSqrt(_e277);
            let _e279 = u_xlat6_;
            let _e281 = u_xlat6_;
            let _e283 = u_xlat7_;
            let _e285 = (_e281.xyz * _e283.xxx);
            u_xlat6_.x = _e285.x;
            u_xlat6_.y = _e285.y;
            u_xlat6_.z = _e285.z;
            let _e295 = u_xlati29_;
            let _e300 = _f_buffer1_.f_cb1_[(_e295 + 512i)];
            u_xlat7_.x = (1f / _e300.x);
            let _e303 = u_xlat30_;
            u_xlat30_ = (_e303 * 25f);
            let _e306 = u_xlat30_;
            let _e307 = u_xlat7_;
            u_xlat30_ = (_e306 / _e307.x);
            let _e310 = u_xlat30_;
            u_xlat30_ = (_e310 + 1f);
            let _e315 = u_xlat30_;
            u_xlat30_ = (1f / _e315);
            let _e318 = u_xlati29_;
            let _e323 = _f_buffer1_.f_cb1_[(_e318 + 768i)];
            let _e325 = u_xlat6_;
            u_xlat7_.x = dot(_e323.xyz, _e325.xyz);
            let _e329 = u_xlat7_;
            let _e331 = u_xlati29_;
            let _e336 = _f_buffer1_.f_cb1_[(_e331 + 512i)];
            let _e339 = u_xlati29_;
            let _e344 = _f_buffer1_.f_cb1_[(_e339 + 512i)];
            u_xlat7_.x = ((_e329.x * _e336.z) + _e344.w);
            let _e348 = u_xlat7_;
            u_xlat7_.x = clamp(_e348.x, 0f, 1f);
            let _e354 = u_xlat7_;
            let _e356 = u_xlat7_;
            u_xlat7_.x = (_e354.x * _e356.x);
            let _e359 = u_xlat30_;
            let _e360 = u_xlat7_;
            u_xlat30_ = (_e359 * _e360.x);
            let _e363 = u_xlat7_;
            let _e365 = u_xlat30_;
            let _e367 = u_xlati29_;
            let _e372 = _f_buffer1_.f_cb1_[(_e367 + 256i)];
            let _e374 = (vec3(_e365) * _e372.xyz);
            u_xlat7_.x = _e374.x;
            u_xlat7_.y = _e374.y;
            u_xlat7_.z = _e374.z;
            let _e381 = u_xlat3_;
            let _e383 = u_xlat6_;
            u_xlat29_ = dot(_e381.xyz, _e383.xyz);
            let _e386 = u_xlat29_;
            u_xlat29_ = clamp(_e386, 0f, 1f);
            let _e390 = u_xlat5_;
            let _e392 = u_xlat7_;
            let _e394 = u_xlat29_;
            let _e397 = u_xlat5_;
            let _e399 = ((_e392.xyz * vec3(_e394)) + _e397.xyz);
            u_xlat5_.x = _e399.x;
            u_xlat5_.y = _e399.y;
            u_xlat5_.z = _e399.z;
        }
        continuing {
            let _e219 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e219 + 1u);
        }
    }
    let _e406 = u_xlat3_;
    let _e408 = u_xlat4_;
    let _e410 = u_xlat24_;
    let _e413 = u_xlat5_;
    let _e415 = ((_e408.xyz * vec3(_e410)) + _e413.xyz);
    u_xlat3_.x = _e415.x;
    u_xlat3_.y = _e415.y;
    u_xlat3_.z = _e415.z;
    let _e426 = _f_buffer2_.f_cb2_[27];
    u_xlat4_.x = abs(_e426.w);
    let _e433 = _f_buffer2_.f_cb2_[28];
    u_xlat4_.y = abs(_e433.w);
    let _e440 = _f_buffer2_.f_cb2_[29];
    u_xlat4_.z = abs(_e440.w);
    let _e443 = u_xlat4_;
    let _e445 = u_xlat4_;
    let _e447 = log2(_e445.xyz);
    u_xlat4_.x = _e447.x;
    u_xlat4_.y = _e447.y;
    u_xlat4_.z = _e447.z;
    let _e454 = u_xlat4_;
    let _e456 = u_xlat4_;
    let _e462 = (_e456.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat4_.x = _e462.x;
    u_xlat4_.y = _e462.y;
    u_xlat4_.z = _e462.z;
    let _e469 = u_xlat4_;
    let _e471 = u_xlat4_;
    let _e473 = exp2(_e471.xyz);
    u_xlat4_.x = _e473.x;
    u_xlat4_.y = _e473.y;
    u_xlat4_.z = _e473.z;
    let _e480 = u_xlat4_;
    let _e482 = u_xlat4_;
    let _e496 = ((_e482.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat4_.x = _e496.x;
    u_xlat4_.y = _e496.y;
    u_xlat4_.z = _e496.z;
    let _e503 = u_xlat4_;
    let _e505 = u_xlat4_;
    let _e511 = clamp(_e505.xyz, vec3(0f), vec3(1f));
    u_xlat4_.x = _e511.x;
    u_xlat4_.y = _e511.y;
    u_xlat4_.z = _e511.z;
    let _e518 = u_xlat3_;
    let _e520 = u_xlat3_;
    let _e522 = u_xlat4_;
    let _e524 = (_e520.xyz + _e522.xyz);
    u_xlat3_.x = _e524.x;
    u_xlat3_.y = _e524.y;
    u_xlat3_.z = _e524.z;
    let _e531 = u_xlat4_;
    let _e533 = u_xlat0_;
    let _e535 = u_xlat3_;
    let _e537 = (_e533.xyz * _e535.xyz);
    u_xlat4_.x = _e537.x;
    u_xlat4_.y = _e537.y;
    u_xlat4_.z = _e537.z;
    let _e544 = vs_TEXCOORD5_1;
    let _e546 = vs_TEXCOORD4_1;
    u_xlat24_ = dot(_e544.xyz, _e546.xyz);
    let _e549 = u_xlat24_;
    u_xlat24_ = clamp(_e549, 0f, 1f);
    let _e553 = u_xlat24_;
    u_xlat24_ = (-(_e553) + 1f);
    let _e557 = u_xlat24_;
    u_xlat24_ = log2(_e557);
    let _e559 = u_xlat24_;
    let _e563 = _f_buffer3_.f_cb3_[7];
    u_xlat24_ = (_e559 * _e563.x);
    let _e566 = u_xlat24_;
    u_xlat24_ = exp2(_e566);
    let _e568 = u_xlat1_;
    let _e572 = _f_buffer3_.f_cb3_[6];
    u_xlat27_ = dot(_e568, _e572);
    let _e574 = u_xlat27_;
    u_xlat27_ = min(_e574, 1f);
    let _e577 = u_xlat24_;
    let _e578 = u_xlat27_;
    u_xlat24_ = (_e577 * _e578);
    let _e580 = u_xlat24_;
    let _e584 = _f_buffer3_.f_cb3_[7];
    u_xlat24_ = (_e580 * _e584.y);
    let _e587 = u_xlat24_;
    u_xlat24_ = clamp(_e587, 0f, 1f);
    let _e591 = u_xlat0_;
    let _e593 = u_xlat0_;
    let _e596 = u_xlat3_;
    let _e602 = _f_buffer3_.f_cb3_[5];
    let _e604 = ((-(_e593.xyz) * _e596.xyz) + _e602.xyz);
    u_xlat0_.x = _e604.x;
    u_xlat0_.y = _e604.y;
    u_xlat0_.z = _e604.z;
    let _e611 = u_xlat0_;
    let _e613 = u_xlat24_;
    let _e615 = u_xlat0_;
    let _e618 = u_xlat4_;
    let _e620 = ((vec3(_e613) * _e615.xyz) + _e618.xyz);
    u_xlat0_.x = _e620.x;
    u_xlat0_.y = _e620.y;
    u_xlat0_.z = _e620.z;
    let _e631 = _f_buffer0_.f_cb0_[5];
    let _e636 = _f_buffer0_.f_cb0_[5];
    u_xlat3_.x = dot(_e631.xyz, _e636.xyz);
    let _e640 = u_xlat3_;
    u_xlat3_.x = inverseSqrt(_e640.x);
    let _e643 = u_xlat3_;
    let _e645 = u_xlat3_;
    let _e650 = _f_buffer0_.f_cb0_[5];
    let _e652 = (_e645.xxx * _e650.xyz);
    u_xlat3_.x = _e652.x;
    u_xlat3_.y = _e652.y;
    u_xlat3_.z = _e652.z;
    let _e660 = u_xlat3_;
    let _e662 = vs_NORMAL0_1;
    u_xlat3_.x = dot(_e660.xyz, _e662.xyz);
    let _e665 = u_xlat1_;
    let _e669 = _f_buffer3_.f_cb3_[3];
    u_xlat11_ = dot(_e665, _e669);
    let _e671 = u_xlat11_;
    u_xlat11_ = min(_e671, 1f);
    let _e675 = u_xlat11_;
    let _e676 = u_xlat3_;
    u_xlat3_.x = (_e675 * _e676.x);
    let _e680 = u_xlat3_;
    let _e685 = _f_buffer3_.f_cb3_[4];
    u_xlat3_.x = (_e680.x * _e685.x);
    let _e689 = u_xlat3_;
    u_xlat3_.x = clamp(_e689.x, 0f, 1f);
    let _e694 = u_xlat0_;
    let _e699 = _f_buffer3_.f_cb3_[2];
    let _e701 = u_xlat3_;
    let _e704 = u_xlat0_;
    let _e706 = ((_e699.xyz * _e701.xxx) + _e704.xyz);
    u_xlat0_.x = _e706.x;
    u_xlat0_.y = _e706.y;
    u_xlat0_.z = _e706.z;
    let _e714 = u_xlat1_;
    let _e718 = _f_buffer3_.f_cb3_[8];
    u_xlat3_.x = dot(_e714, _e718);
    let _e721 = u_xlat3_;
    u_xlat3_.x = min(_e721.x, 1f);
    let _e728 = _f_buffer3_.f_cb3_[9];
    let _e734 = _f_buffer3_.f_cb3_[9];
    u_xlat11_ = (-(_e728.x) + _e734.y);
    let _e738 = u_xlat3_;
    let _e740 = u_xlat11_;
    let _e745 = _f_buffer3_.f_cb3_[9];
    u_xlat3_.x = ((_e738.x * _e740) + _e745.x);
    let _e748 = u_xlat3_;
    let _e754 = _f_buffer3_.f_cb3_[9];
    u_xlat11_ = (-(_e748.x) + _e754.y);
    let _e757 = u_xlat24_;
    let _e758 = u_xlat11_;
    u_xlat24_ = (_e757 * _e758);
    let _e764 = _f_buffer3_.f_cb3_[7];
    let _e766 = u_xlat24_;
    let _e768 = u_xlat3_;
    SV_Target0_.w = ((_e764.z * _e766) + _e768.x);
    let _e771 = u_xlat1_;
    let _e775 = _f_buffer3_.f_cb3_[11];
    u_xlat24_ = dot(_e771, _e775);
    let _e777 = u_xlat24_;
    u_xlat24_ = min(_e777, 1f);
    let _e780 = u_xlat2_;
    let _e785 = _f_buffer3_.f_cb3_[10];
    u_xlat1_ = (_e780.wxyz * _e785.wxyz);
    let _e788 = u_xlatb3_;
    let _e798 = _f_buffer3_.f_cb3_[12];
    let _e801 = (vec4<f32>(0f, 0f, 0f, 0f) < _e798.wzww).xy;
    u_xlatb3_.x = _e801.x;
    u_xlatb3_.y = _e801.y;
    let _e807 = u_xlat1_;
    let _e812 = _f_buffer3_.f_cb3_[12];
    u_xlat1_.x = (_e807.x * _e812.w);
    let _e816 = u_xlat1_;
    u_xlat1_.x = _e816.x;
    let _e819 = u_xlat1_;
    u_xlat1_.x = clamp(_e819.x, 0f, 1f);
    let _e824 = u_xlat4_;
    let _e826 = u_xlat2_;
    let _e831 = _f_buffer3_.f_cb3_[10];
    let _e834 = u_xlat0_;
    let _e837 = ((_e826.xyz * _e831.xyz) + -(_e834.xyz));
    u_xlat4_.x = _e837.x;
    u_xlat4_.y = _e837.y;
    u_xlat4_.z = _e837.z;
    let _e844 = u_xlat4_;
    let _e846 = u_xlat1_;
    let _e848 = u_xlat4_;
    let _e851 = u_xlat0_;
    let _e853 = ((_e846.xxx * _e848.xyz) + _e851.xyz);
    u_xlat4_.x = _e853.x;
    u_xlat4_.y = _e853.y;
    u_xlat4_.z = _e853.z;
    let _e860 = u_xlat3_;
    let _e862 = u_xlatb3_;
    if _e862.x {
        let _e864 = u_xlat4_;
        local_1 = _e864.xyz;
    } else {
        let _e866 = u_xlat0_;
        local_1 = _e866.xyz;
    }
    let _e869 = local_1;
    u_xlat3_.x = _e869.x;
    u_xlat3_.z = _e869.y;
    u_xlat3_.w = _e869.z;
    let _e876 = u_xlat4_;
    let _e878 = u_xlat1_;
    let _e880 = u_xlat3_;
    let _e882 = (_e878.yzw * _e880.xzw);
    u_xlat4_.x = _e882.x;
    u_xlat4_.y = _e882.y;
    u_xlat4_.z = _e882.z;
    let _e889 = u_xlat3_;
    let _e891 = u_xlat4_;
    let _e896 = _f_buffer3_.f_cb3_[12];
    let _e899 = u_xlat3_;
    let _e901 = ((_e891.xyz * _e896.yyy) + _e899.xzw);
    u_xlat3_.x = _e901.x;
    u_xlat3_.z = _e901.y;
    u_xlat3_.w = _e901.z;
    let _e908 = u_xlat3_;
    let _e913 = _f_buffer3_.f_cb3_[12];
    let _e915 = u_xlat1_;
    let _e918 = u_xlat3_;
    let _e920 = ((_e913.xxx * _e915.yzw) + _e918.xzw);
    u_xlat3_.x = _e920.x;
    u_xlat3_.z = _e920.y;
    u_xlat3_.w = _e920.z;
    let _e927 = u_xlat4_;
    let _e929 = u_xlat3_;
    let _e931 = u_xlat3_;
    let _e933 = (_e929.xzw + _e931.xzw);
    u_xlat4_.x = _e933.x;
    u_xlat4_.y = _e933.y;
    u_xlat4_.z = _e933.z;
    let _e940 = u_xlat5_;
    let _e942 = u_xlat1_;
    let _e944 = u_xlat4_;
    let _e946 = (_e942.yzw * _e944.xyz);
    u_xlat5_.x = _e946.x;
    u_xlat5_.y = _e946.y;
    u_xlat5_.z = _e946.z;
    let _e953 = u_xlat6_;
    let _e955 = u_xlat3_;
    let _e962 = (-(_e955.xzw) + vec3<f32>(1f, 1f, 1f));
    u_xlat6_.x = _e962.x;
    u_xlat6_.y = _e962.y;
    u_xlat6_.z = _e962.z;
    let _e969 = u_xlat6_;
    let _e971 = u_xlat6_;
    let _e973 = u_xlat6_;
    let _e975 = (_e971.xyz + _e973.xyz);
    u_xlat6_.x = _e975.x;
    u_xlat6_.y = _e975.y;
    u_xlat6_.z = _e975.z;
    let _e982 = u_xlat2_;
    let _e984 = u_xlat2_;
    let _e990 = _f_buffer3_.f_cb3_[10];
    let _e997 = ((-(_e984.xyz) * _e990.xyz) + vec3<f32>(1f, 1f, 1f));
    u_xlat2_.x = _e997.x;
    u_xlat2_.y = _e997.y;
    u_xlat2_.z = _e997.z;
    let _e1004 = u_xlat2_;
    let _e1006 = u_xlat6_;
    let _e1009 = u_xlat2_;
    let _e1016 = ((-(_e1006.xyz) * _e1009.xyz) + vec3<f32>(1f, 1f, 1f));
    u_xlat2_.x = _e1016.x;
    u_xlat2_.y = _e1016.y;
    u_xlat2_.z = _e1016.z;
    let _e1023 = u_xlat6_;
    let _e1025 = u_xlat4_;
    let _e1027 = floor(_e1025.xyz);
    u_xlat6_.x = _e1027.x;
    u_xlat6_.y = _e1027.y;
    u_xlat6_.z = _e1027.z;
    let _e1034 = u_xlat6_;
    let _e1036 = u_xlat6_;
    let _e1042 = min(_e1036.xyz, vec3<f32>(1f, 1f, 1f));
    u_xlat6_.x = _e1042.x;
    u_xlat6_.y = _e1042.y;
    u_xlat6_.z = _e1042.z;
    let _e1049 = u_xlat1_;
    let _e1051 = u_xlat4_;
    let _e1054 = u_xlat1_;
    let _e1057 = u_xlat2_;
    let _e1059 = ((-(_e1051.xyz) * _e1054.yzw) + _e1057.xyz);
    u_xlat1_.x = _e1059.x;
    u_xlat1_.y = _e1059.y;
    u_xlat1_.z = _e1059.z;
    let _e1066 = u_xlat1_;
    let _e1068 = u_xlat6_;
    let _e1070 = u_xlat1_;
    let _e1073 = u_xlat5_;
    let _e1075 = ((_e1068.xyz * _e1070.xyz) + _e1073.xyz);
    u_xlat1_.x = _e1075.x;
    u_xlat1_.y = _e1075.y;
    u_xlat1_.z = _e1075.z;
    let _e1082 = u_xlat1_;
    let _e1084 = u_xlat0_;
    let _e1087 = u_xlat1_;
    let _e1089 = (-(_e1084.xyz) + _e1087.xyz);
    u_xlat1_.x = _e1089.x;
    u_xlat1_.y = _e1089.y;
    u_xlat1_.z = _e1089.z;
    let _e1096 = u_xlat1_;
    let _e1101 = _f_buffer3_.f_cb3_[12];
    let _e1103 = u_xlat1_;
    let _e1106 = u_xlat0_;
    let _e1108 = ((_e1101.zzz * _e1103.xyz) + _e1106.xyz);
    u_xlat1_.x = _e1108.x;
    u_xlat1_.y = _e1108.y;
    u_xlat1_.z = _e1108.z;
    let _e1115 = u_xlat1_;
    let _e1117 = u_xlatb3_;
    if _e1117.y {
        let _e1119 = u_xlat1_;
        local_2 = _e1119.xyz;
    } else {
        let _e1121 = u_xlat3_;
        local_2 = _e1121.xzw;
    }
    let _e1124 = local_2;
    u_xlat1_.x = _e1124.x;
    u_xlat1_.y = _e1124.y;
    u_xlat1_.z = _e1124.z;
    let _e1131 = u_xlat1_;
    let _e1133 = u_xlat0_;
    let _e1136 = u_xlat1_;
    let _e1138 = (-(_e1133.xyz) + _e1136.xyz);
    u_xlat1_.x = _e1138.x;
    u_xlat1_.y = _e1138.y;
    u_xlat1_.z = _e1138.z;
    let _e1145 = SV_Target0_;
    let _e1147 = u_xlat24_;
    let _e1149 = u_xlat1_;
    let _e1152 = u_xlat0_;
    let _e1154 = ((vec3(_e1147) * _e1149.xyz) + _e1152.xyz);
    SV_Target0_.x = _e1154.x;
    SV_Target0_.y = _e1154.y;
    SV_Target0_.z = _e1154.z;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(4) vs_TEXCOORD4_: vec3<f32>, @location(5) vs_TEXCOORD5_: vec3<f32>, @location(12) vs_NORMAL0_: vec3<f32>, @location(1) vs_TEXCOORD1_: vec3<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD4_1 = vs_TEXCOORD4_;
    vs_TEXCOORD5_1 = vs_TEXCOORD5_;
    vs_NORMAL0_1 = vs_NORMAL0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    main_1();
    let _e52 = SV_Target0_;
    return FragmentOutput(_e52);
}
