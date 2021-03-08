///@func cancel_ground_check()
///@desc Cancels an attack if you are on the ground
function cancel_ground_check() {
	//Applies landing lag
	if (on_ground())
		{
		attack_stop(PLAYER_STATE.in_lag);
		state_frame = landing_lag;
		vsp = 0;
		vsp_frac = 0;
		//VFX
		fx_create(spr_dust_land, 1, 0, 25, x, bbox_bottom - 1, 2, 0, "FX_Layer_Below");
		return true;
		}
	return false;
}
