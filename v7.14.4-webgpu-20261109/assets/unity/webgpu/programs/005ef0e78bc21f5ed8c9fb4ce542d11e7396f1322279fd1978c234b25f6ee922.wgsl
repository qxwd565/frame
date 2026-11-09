struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 4>,
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
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD5_1: vec2<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlatb1_: bool = false;
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec4<f32> = vec4(0f);
    var u_xlat4_: vec4<f32> = vec4(0f);
    var u_xlat5_: vec4<f32> = vec4(0f);
    var u_xlat7_: f32 = 0f;
    var local: f32;

    let _e47 = vs_TEXCOORD0_1;
    let _e52 = _f_buffer0_.f_cb0_[4];
    let _e57 = hscard_bias.values[0];
    let _e60 = textureSampleBias(f_t0_, samplerf_s0_, _e47.xy, (_e52.x + _e57.x));
    u_xlat0_ = _e60;
    let _e62 = vs_TEXCOORD0_1;
    let _e64 = dpdx(_e62.x);
    u_xlat1_.x = _e64;
    let _e65 = vs_TEXCOORD0_1;
    let _e67 = dpdy(_e65.x);
    u_xlat7_ = _e67;
    let _e69 = u_xlat7_;
    let _e71 = u_xlat1_;
    u_xlat1_.x = (abs(_e69) + abs(_e71.x));
    let _e76 = u_xlat1_;
    u_xlat2_.x = (_e76.x * 0.5f);
    u_xlat2_.y = 0f;
    let _e82 = u_xlat2_;
    let _e84 = vs_TEXCOORD0_1;
    u_xlat2_ = (_e82.xyxx + _e84.xyxy);
    let _e87 = u_xlat2_;
    let _e92 = _f_buffer0_.f_cb0_[4];
    let _e97 = hscard_bias.values[0];
    let _e100 = textureSampleBias(f_t0_, samplerf_s0_, _e87.xy, (_e92.x + _e97.x));
    u_xlat3_ = _e100;
    let _e101 = u_xlat0_;
    let _e102 = u_xlat3_;
    u_xlat0_ = (_e101 + _e102);
    u_xlat1_.y = 0f;
    let _e106 = u_xlat1_;
    let _e108 = vs_TEXCOORD0_1;
    u_xlat3_ = (_e106.xyyx + _e108.xyxy);
    let _e111 = u_xlat3_;
    let _e116 = _f_buffer0_.f_cb0_[4];
    let _e121 = hscard_bias.values[0];
    let _e124 = textureSampleBias(f_t0_, samplerf_s0_, _e111.xy, (_e116.x + _e121.x));
    u_xlat4_ = _e124;
    let _e125 = u_xlat0_;
    let _e126 = u_xlat4_;
    u_xlat0_ = (_e125 + _e126);
    let _e128 = u_xlat1_;
    let _e130 = u_xlat1_;
    let _e135 = (_e130.xx * vec2<f32>(0.5f, 0.5f));
    u_xlat1_.z = _e135.x;
    u_xlat1_.w = _e135.y;
    let _e140 = u_xlat1_;
    let _e142 = vs_TEXCOORD0_1;
    u_xlat4_ = (_e140.yzxz + _e142.xyxy);
    let _e145 = u_xlat4_;
    let _e150 = _f_buffer0_.f_cb0_[4];
    let _e155 = hscard_bias.values[0];
    let _e158 = textureSampleBias(f_t0_, samplerf_s0_, _e145.xy, (_e150.x + _e155.x));
    u_xlat5_ = _e158;
    let _e159 = u_xlat0_;
    let _e160 = u_xlat5_;
    u_xlat0_ = (_e159 + _e160);
    let _e162 = u_xlat2_;
    let _e167 = _f_buffer0_.f_cb0_[4];
    let _e172 = hscard_bias.values[0];
    let _e175 = textureSampleBias(f_t0_, samplerf_s0_, _e162.zw, (_e167.x + _e172.x));
    u_xlat2_ = _e175;
    let _e176 = u_xlat0_;
    let _e177 = u_xlat2_;
    u_xlat0_ = (_e176 + _e177);
    let _e179 = u_xlat4_;
    let _e184 = _f_buffer0_.f_cb0_[4];
    let _e189 = hscard_bias.values[0];
    let _e192 = textureSampleBias(f_t0_, samplerf_s0_, _e179.zw, (_e184.x + _e189.x));
    u_xlat2_ = _e192;
    let _e193 = u_xlat0_;
    let _e194 = u_xlat2_;
    u_xlat0_ = (_e193 + _e194);
    let _e196 = u_xlat3_;
    let _e201 = _f_buffer0_.f_cb0_[4];
    let _e206 = hscard_bias.values[0];
    let _e209 = textureSampleBias(f_t0_, samplerf_s0_, _e196.zw, (_e201.x + _e206.x));
    u_xlat2_ = _e209;
    let _e210 = u_xlat0_;
    let _e211 = u_xlat2_;
    u_xlat0_ = (_e210 + _e211);
    let _e213 = u_xlat1_;
    let _e215 = vs_TEXCOORD0_1;
    u_xlat1_ = (_e213.wxxx + _e215.xyxy);
    let _e218 = u_xlat1_;
    let _e223 = _f_buffer0_.f_cb0_[4];
    let _e228 = hscard_bias.values[0];
    let _e231 = textureSampleBias(f_t0_, samplerf_s0_, _e218.xy, (_e223.x + _e228.x));
    u_xlat2_ = _e231;
    let _e232 = u_xlat0_;
    let _e233 = u_xlat2_;
    u_xlat0_ = (_e232 + _e233);
    let _e235 = u_xlat1_;
    let _e240 = _f_buffer0_.f_cb0_[4];
    let _e245 = hscard_bias.values[0];
    let _e248 = textureSampleBias(f_t0_, samplerf_s0_, _e235.zw, (_e240.x + _e245.x));
    u_xlat1_ = _e248;
    let _e249 = u_xlat0_;
    let _e250 = u_xlat1_;
    u_xlat0_ = (_e249 + _e250);
    let _e252 = u_xlat0_;
    u_xlat0_ = (_e252 * vec4<f32>(0.11111111f, 0.11111111f, 0.11111111f, 0.11111111f));
    let _e263 = _f_buffer1_.f_cb1_[1];
    u_xlatb1_ = (0f < _e263.x);
    let _e266 = u_xlatb1_;
    if _e266 {
        {
            let _e267 = vs_TEXCOORD5_1;
            let _e272 = _f_buffer0_.f_cb0_[4];
            let _e277 = hscard_bias.values[1];
            let _e280 = textureSampleBias(f_t1_, samplerf_s1_, _e267.xy, (_e272.x + _e277.x));
            u_xlat1_ = _e280;
            let _e284 = _f_buffer1_.f_cb1_[3];
            let _e286 = u_xlat1_;
            u_xlatb1_ = (_e284.x < _e286.x);
            let _e290 = u_xlatb1_;
            if _e290 {
                local = 1f;
            } else {
                local = 0f;
            }
            let _e295 = local;
            u_xlat1_.x = _e295;
            let _e297 = u_xlat0_;
            let _e299 = u_xlat1_;
            SV_Target0_.w = (_e297.w * _e299.x);
        }
    } else {
        {
            let _e303 = u_xlat0_;
            SV_Target0_.w = _e303.w;
        }
    }
    let _e305 = SV_Target0_;
    let _e307 = u_xlat0_;
    let _e309 = vs_COLOR0_1;
    let _e311 = (_e307.xyz * _e309.xyz);
    SV_Target0_.x = _e311.x;
    SV_Target0_.y = _e311.y;
    SV_Target0_.z = _e311.z;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(5) vs_TEXCOORD5_: vec2<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD5_1 = vs_TEXCOORD5_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e32 = SV_Target0_;
    return FragmentOutput(_e32);
}
