struct FragmentOutput {
    @location(0) SV_TARGET0_: f32,
}

var<private> SV_TARGET0_: f32;
var<private> gl_FragCoord_1: vec4<f32>;

fn main_1() {
    var hlslcc_FragCoord: vec4<f32>;

    let _e2 = gl_FragCoord_1;
    let _e3 = _e2.xyz;
    let _e5 = gl_FragCoord_1;
    hlslcc_FragCoord = vec4<f32>(_e3.x, _e3.y, _e3.z, (1f / _e5.w));
    let _e13 = hlslcc_FragCoord;
    SV_TARGET0_ = _e13.z;
    return;
}

@fragment 
fn main(@builtin(position) gl_FragCoord: vec4<f32>) -> FragmentOutput {
    gl_FragCoord_1 = gl_FragCoord;
    main_1();
    let _e5 = SV_TARGET0_;
    return FragmentOutput(_e5);
}
