struct FragmentOutput {
    @location(0) SV_Target0_: vec4<f32>,
}

var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    let _e2 = vs_COLOR0_1;
    SV_Target0_ = _e2;
    return;
}

@fragment 
fn main(@location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e7 = SV_Target0_;
    return FragmentOutput(_e7);
}
