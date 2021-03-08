///@func fastfall()
///@desc Causes a character to fastfall
function fastfall() {
	//Fastfall
	vsp = fast_fall_speed;
	vsp_frac = 0;
	//VFX
	fx_create(spr_shine_fastfall, 1, 0, 13, x + irandom_range(-5, 5), y + irandom_range(-5, 5), 2, 0);


}
