struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 1024>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 30>,
}

struct v_buffer3_ {
    v_cb3_: vec4<f32>,
}

struct VertexOutput {
    @location(12) vs_NORMAL0_: vec3<f32>,
    @location(0) vs_TEXCOORD0_: vec2<f32>,
    @location(1) vs_TEXCOORD1_: vec3<f32>,
    @location(2) vs_TEXCOORD2_: vec3<f32>,
    @builtin(position) gl_Position: vec4<f32>,
}

const ImmCB_0_: array<vec4<u32>, 4> = array<vec4<u32>, 4>(vec4<u32>(1065353216u, 0u, 0u, 0u), vec4<u32>(0u, 1065353216u, 0u, 0u), vec4<u32>(0u, 0u, 1065353216u, 0u), vec4<u32>(0u, 0u, 0u, 1065353216u));

@group(0) @binding(0) 
var<uniform> _v_buffer0_: v_buffer0_;
@group(0) @binding(1) 
var<uniform> _v_buffer1_: v_buffer1_;
@group(0) @binding(2) 
var<uniform> _v_buffer2_: v_buffer2_;
@group(0) @binding(3) 
var<uniform> _v_buffer3_: v_buffer3_;
var<private> in_POSITION0_1: vec4<f32>;
var<private> in_NORMAL0_1: vec3<f32>;
var<private> in_TEXCOORD0_1: vec2<f32>;
var<private> in_COLOR0_1: vec4<f32>;
var<private> vs_NORMAL0_: vec3<f32>;
var<private> vs_TEXCOORD0_: vec2<f32>;
var<private> vs_TEXCOORD1_: vec3<f32>;
var<private> vs_TEXCOORD2_: vec3<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec3<f32> = vec3(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlat5_: vec3<f32> = vec3(0f);
    var u_xlat6_: vec3<f32> = vec3(0f);
    var u_xlat12_: f32 = 0f;
    var u_xlat18_: f32 = 0f;
    var u_xlatu18_: u32 = 0u;
    var u_xlatu19_: u32 = 0u;
    var u_xlat20_: f32 = 0f;
    var u_xlati20_: i32 = 0i;
    var u_xlatu20_: u32 = 0u;
    var u_xlatb20_: bool = false;
    var u_xlat21_: f32 = 0f;
    var u_xlati21_: i32 = 0i;
    var u_xlat22_: f32 = 0f;
    var u_xlatu_loop_1_: u32 = 0u;
    var local: array<vec4<u32>, 4> = ImmCB_0_;

    let _e86 = _v_buffer0_.v_cb0_[15];
    let _e88 = _v_buffer3_;
    u_xlat0_.x = (_e86.x * _e88.v_cb3_.z);
    let _e93 = u_xlat0_;
    u_xlat0_.x = sin(_e93.x);
    let _e97 = u_xlat0_;
    u_xlat0_.x = (_e97.x + 2f);
    let _e102 = u_xlat0_;
    let _e104 = _v_buffer3_;
    u_xlat0_.x = (_e102.x * _e104.v_cb3_.x);
    let _e109 = u_xlat0_;
    u_xlat0_.x = (_e109.x * 0.2f);
    let _e113 = u_xlat6_;
    let _e115 = in_POSITION0_1;
    let _e117 = _v_buffer3_;
    let _e120 = (_e115.xz * _e117.v_cb3_.yy);
    u_xlat6_.x = _e120.x;
    u_xlat6_.y = _e120.y;
    let _e125 = u_xlat6_;
    let _e130 = _v_buffer0_.v_cb0_[15];
    let _e136 = u_xlat6_;
    let _e138 = ((_e130.xx * vec2<f32>(30f, 42f)) + _e136.xy);
    u_xlat6_.x = _e138.x;
    u_xlat6_.y = _e138.y;
    let _e144 = u_xlat6_;
    u_xlat6_.x = sin(_e144.x);
    let _e148 = u_xlat0_;
    let _e150 = u_xlat6_;
    u_xlat0_.y = (_e148.x * _e150.x);
    let _e153 = u_xlat6_;
    u_xlat12_ = cos(_e153.y);
    let _e157 = u_xlat0_;
    let _e159 = u_xlat12_;
    u_xlat0_.x = (_e157.x * _e159);
    let _e161 = u_xlat0_;
    let _e163 = u_xlat0_;
    let _e168 = (_e163.xy * vec2<f32>(0.02f, 0.01f));
    u_xlat0_.x = _e168.x;
    u_xlat0_.y = _e168.y;
    let _e173 = u_xlat0_;
    let _e175 = u_xlat0_;
    let _e177 = in_COLOR0_1;
    let _e179 = (_e175.xy * _e177.xx);
    u_xlat0_.x = _e179.x;
    u_xlat0_.y = _e179.y;
    let _e184 = u_xlat6_;
    let _e186 = u_xlat0_;
    let _e194 = in_POSITION0_1;
    let _e196 = ((_e186.yyy * vec3<f32>(-0.5f, 0f, 0.25f)) + _e194.xyz);
    u_xlat6_.x = _e196.x;
    u_xlat6_.y = _e196.y;
    u_xlat6_.z = _e196.z;
    let _e203 = u_xlat0_;
    let _e205 = u_xlat0_;
    let _e214 = u_xlat6_;
    let _e216 = ((_e205.xxx * vec3<f32>(-0.3f, 0f, -0.5f)) + _e214.xyz);
    u_xlat0_.x = _e216.x;
    u_xlat0_.y = _e216.y;
    u_xlat0_.z = _e216.z;
    let _e223 = u_xlat0_;
    let _e228 = _v_buffer2_.v_cb2_[1];
    u_xlat1_ = (_e223.yyyy * _e228);
    let _e233 = _v_buffer2_.v_cb2_[0];
    let _e234 = u_xlat0_;
    let _e237 = u_xlat1_;
    u_xlat1_ = ((_e233 * _e234.xxxx) + _e237);
    let _e242 = _v_buffer2_.v_cb2_[2];
    let _e243 = u_xlat0_;
    let _e246 = u_xlat1_;
    u_xlat0_ = ((_e242 * _e243.zzzz) + _e246);
    let _e248 = u_xlat0_;
    let _e252 = _v_buffer2_.v_cb2_[3];
    u_xlat0_ = (_e248 + _e252);
    let _e254 = u_xlat0_;
    let _e259 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e254.yyyy * _e259);
    let _e264 = _v_buffer0_.v_cb0_[79];
    let _e265 = u_xlat0_;
    let _e268 = u_xlat1_;
    u_xlat1_ = ((_e264 * _e265.xxxx) + _e268);
    let _e273 = _v_buffer0_.v_cb0_[81];
    let _e274 = u_xlat0_;
    let _e277 = u_xlat1_;
    u_xlat1_ = ((_e273 * _e274.zzzz) + _e277);
    let _e283 = _v_buffer0_.v_cb0_[82];
    let _e284 = u_xlat0_;
    let _e287 = u_xlat1_;
    gl_Position = ((_e283 * _e284.wwww) + _e287);
    let _e290 = in_NORMAL0_1;
    let _e295 = _v_buffer2_.v_cb2_[4];
    u_xlat0_.x = dot(_e290.xyz, _e295.xyz);
    let _e299 = in_NORMAL0_1;
    let _e304 = _v_buffer2_.v_cb2_[5];
    u_xlat0_.y = dot(_e299.xyz, _e304.xyz);
    let _e308 = in_NORMAL0_1;
    let _e313 = _v_buffer2_.v_cb2_[6];
    u_xlat0_.z = dot(_e308.xyz, _e313.xyz);
    let _e316 = u_xlat0_;
    let _e318 = u_xlat0_;
    u_xlat18_ = dot(_e316.xyz, _e318.xyz);
    let _e321 = u_xlat18_;
    u_xlat18_ = max(_e321, 0.000000000000000000000000000000000000011754944f);
    let _e324 = u_xlat18_;
    u_xlat18_ = inverseSqrt(_e324);
    let _e326 = u_xlat0_;
    let _e328 = u_xlat18_;
    let _e330 = u_xlat0_;
    let _e332 = (vec3(_e328) * _e330.xyz);
    u_xlat0_.x = _e332.x;
    u_xlat0_.y = _e332.y;
    u_xlat0_.z = _e332.z;
    let _e339 = u_xlat1_;
    let _e341 = in_POSITION0_1;
    let _e346 = _v_buffer2_.v_cb2_[1];
    let _e348 = (_e341.yyy * _e346.xyz);
    u_xlat1_.x = _e348.x;
    u_xlat1_.y = _e348.y;
    u_xlat1_.z = _e348.z;
    let _e355 = u_xlat1_;
    let _e360 = _v_buffer2_.v_cb2_[0];
    let _e362 = in_POSITION0_1;
    let _e365 = u_xlat1_;
    let _e367 = ((_e360.xyz * _e362.xxx) + _e365.xyz);
    u_xlat1_.x = _e367.x;
    u_xlat1_.y = _e367.y;
    u_xlat1_.z = _e367.z;
    let _e374 = u_xlat1_;
    let _e379 = _v_buffer2_.v_cb2_[2];
    let _e381 = in_POSITION0_1;
    let _e384 = u_xlat1_;
    let _e386 = ((_e379.xyz * _e381.zzz) + _e384.xyz);
    u_xlat1_.x = _e386.x;
    u_xlat1_.y = _e386.y;
    u_xlat1_.z = _e386.z;
    let _e393 = u_xlat1_;
    let _e395 = u_xlat1_;
    let _e400 = _v_buffer2_.v_cb2_[3];
    let _e402 = (_e395.xyz + _e400.xyz);
    u_xlat1_.x = _e402.x;
    u_xlat1_.y = _e402.y;
    u_xlat1_.z = _e402.z;
    let _e413 = _v_buffer2_.v_cb2_[27];
    u_xlat2_.x = abs(_e413.w);
    let _e420 = _v_buffer2_.v_cb2_[28];
    u_xlat2_.y = abs(_e420.w);
    let _e427 = _v_buffer2_.v_cb2_[29];
    u_xlat2_.z = abs(_e427.w);
    let _e430 = u_xlat2_;
    let _e432 = u_xlat2_;
    let _e434 = log2(_e432.xyz);
    u_xlat2_.x = _e434.x;
    u_xlat2_.y = _e434.y;
    u_xlat2_.z = _e434.z;
    let _e441 = u_xlat2_;
    let _e443 = u_xlat2_;
    let _e449 = (_e443.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat2_.x = _e449.x;
    u_xlat2_.y = _e449.y;
    u_xlat2_.z = _e449.z;
    let _e456 = u_xlat2_;
    let _e458 = u_xlat2_;
    let _e460 = exp2(_e458.xyz);
    u_xlat2_.x = _e460.x;
    u_xlat2_.y = _e460.y;
    u_xlat2_.z = _e460.z;
    let _e467 = u_xlat2_;
    let _e469 = u_xlat2_;
    let _e483 = ((_e469.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat2_.x = _e483.x;
    u_xlat2_.y = _e483.y;
    u_xlat2_.z = _e483.z;
    let _e490 = u_xlat2_;
    let _e492 = u_xlat2_;
    let _e498 = clamp(_e492.xyz, vec3(0f), vec3(1f));
    u_xlat2_.x = _e498.x;
    u_xlat2_.y = _e498.y;
    u_xlat2_.z = _e498.z;
    let _e508 = _v_buffer0_.v_cb0_[10];
    let _e513 = _v_buffer2_.v_cb2_[11];
    u_xlat18_ = min(_e508.x, _e513.y);
    let _e516 = u_xlat18_;
    u_xlatu18_ = u32(i32(_e516));
    u_xlat3_.x = 0f;
    u_xlat3_.y = 0f;
    u_xlat3_.z = 0f;
    loop {
        let _e530 = u_xlatu_loop_1_;
        let _e531 = u_xlatu18_;
        if !((_e530 < _e531)) {
            break;
        }
        {
            let _e537 = u_xlatu_loop_1_;
            u_xlatu20_ = (_e537 >> 2u);
            let _e540 = u_xlatu_loop_1_;
            u_xlati21_ = i32((_e540 & 3u));
            let _e544 = u_xlatu20_;
            let _e550 = _v_buffer2_.v_cb2_[(i32(_e544) + 12i)];
            let _e551 = u_xlati21_;
            let _e555 = local[_e551];
            u_xlat20_ = dot(_e550, bitcast<vec4<f32>>(_e555));
            let _e558 = u_xlat20_;
            u_xlati20_ = i32(_e558);
            let _e560 = u_xlat4_;
            let _e562 = u_xlat1_;
            let _e565 = u_xlati20_;
            let _e568 = _v_buffer1_.v_cb1_[_e565];
            let _e571 = u_xlati20_;
            let _e574 = _v_buffer1_.v_cb1_[_e571];
            let _e576 = ((-(_e562.xyz) * _e568.www) + _e574.xyz);
            u_xlat4_.x = _e576.x;
            u_xlat4_.y = _e576.y;
            u_xlat4_.z = _e576.z;
            let _e583 = u_xlat4_;
            let _e585 = u_xlat4_;
            u_xlat21_ = dot(_e583.xyz, _e585.xyz);
            let _e588 = u_xlat21_;
            u_xlat21_ = max(_e588, 0.000061035156f);
            let _e591 = u_xlat21_;
            u_xlat22_ = inverseSqrt(_e591);
            let _e593 = u_xlat4_;
            let _e595 = u_xlat22_;
            let _e597 = u_xlat4_;
            let _e599 = (vec3(_e595) * _e597.xyz);
            u_xlat4_.x = _e599.x;
            u_xlat4_.y = _e599.y;
            u_xlat4_.z = _e599.z;
            let _e608 = u_xlati20_;
            let _e613 = _v_buffer1_.v_cb1_[(_e608 + 512i)];
            u_xlat22_ = (1f / _e613.x);
            let _e616 = u_xlat21_;
            u_xlat21_ = (_e616 * 25f);
            let _e619 = u_xlat21_;
            let _e620 = u_xlat22_;
            u_xlat21_ = (_e619 / _e620);
            let _e622 = u_xlat21_;
            u_xlat21_ = (_e622 + 1f);
            let _e627 = u_xlat21_;
            u_xlat21_ = (1f / _e627);
            let _e629 = u_xlati20_;
            let _e634 = _v_buffer1_.v_cb1_[(_e629 + 768i)];
            let _e636 = u_xlat4_;
            u_xlat22_ = dot(_e634.xyz, _e636.xyz);
            let _e639 = u_xlat22_;
            let _e640 = u_xlati20_;
            let _e645 = _v_buffer1_.v_cb1_[(_e640 + 512i)];
            let _e648 = u_xlati20_;
            let _e653 = _v_buffer1_.v_cb1_[(_e648 + 512i)];
            u_xlat22_ = ((_e639 * _e645.z) + _e653.w);
            let _e656 = u_xlat22_;
            u_xlat22_ = clamp(_e656, 0f, 1f);
            let _e660 = u_xlat22_;
            let _e661 = u_xlat22_;
            u_xlat22_ = (_e660 * _e661);
            let _e663 = u_xlat21_;
            let _e664 = u_xlat22_;
            u_xlat21_ = (_e663 * _e664);
            let _e666 = u_xlat5_;
            let _e668 = u_xlat21_;
            let _e670 = u_xlati20_;
            let _e675 = _v_buffer1_.v_cb1_[(_e670 + 256i)];
            let _e677 = (vec3(_e668) * _e675.xyz);
            u_xlat5_.x = _e677.x;
            u_xlat5_.y = _e677.y;
            u_xlat5_.z = _e677.z;
            let _e684 = u_xlat0_;
            let _e686 = u_xlat4_;
            u_xlat20_ = dot(_e684.xyz, _e686.xyz);
            let _e689 = u_xlat20_;
            u_xlat20_ = clamp(_e689, 0f, 1f);
            let _e693 = u_xlat3_;
            let _e695 = u_xlat5_;
            let _e697 = u_xlat20_;
            let _e700 = u_xlat3_;
            let _e702 = ((_e695.xyz * vec3(_e697)) + _e700.xyz);
            u_xlat3_.x = _e702.x;
            u_xlat3_.y = _e702.y;
            u_xlat3_.z = _e702.z;
        }
        continuing {
            let _e534 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e534 + 1u);
        }
    }
    let _e709 = vs_TEXCOORD2_;
    let _e711 = u_xlat2_;
    let _e713 = u_xlat3_;
    let _e715 = (_e711.xyz + _e713.xyz);
    vs_TEXCOORD2_.x = _e715.x;
    vs_TEXCOORD2_.y = _e715.y;
    vs_TEXCOORD2_.z = _e715.z;
    let _e722 = vs_NORMAL0_;
    let _e724 = u_xlat0_;
    let _e725 = _e724.xyz;
    vs_NORMAL0_.x = _e725.x;
    vs_NORMAL0_.y = _e725.y;
    vs_NORMAL0_.z = _e725.z;
    let _e732 = vs_TEXCOORD1_;
    let _e734 = u_xlat1_;
    let _e735 = _e734.xyz;
    vs_TEXCOORD1_.x = _e735.x;
    vs_TEXCOORD1_.y = _e735.y;
    vs_TEXCOORD1_.z = _e735.z;
    let _e742 = vs_TEXCOORD0_;
    let _e744 = in_TEXCOORD0_1;
    let _e745 = _e744.xy;
    vs_TEXCOORD0_.x = _e745.x;
    vs_TEXCOORD0_.y = _e745.y;
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(1) in_NORMAL0_: vec3<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(3) in_COLOR0_: vec4<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_NORMAL0_1 = in_NORMAL0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_COLOR0_1 = in_COLOR0_;
    main_1();
    let _e39 = vs_NORMAL0_;
    let _e41 = vs_TEXCOORD0_;
    let _e43 = vs_TEXCOORD1_;
    let _e45 = vs_TEXCOORD2_;
    let _e47 = gl_Position;
    return VertexOutput(_e39, _e41, _e43, _e45, _e47);
}
