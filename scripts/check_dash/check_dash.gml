///@func check_dash()
///@desc Transition to dash state (which then goes to the running state)
function check_dash() {
	//If the control stick was previously flicked horizontally
	var _frame = stick_find_frame(Lstick, false, true, DIR.horizontal, undefined, undefined, buff, false);
	if (_frame != -1)
		{
		//Change the facing direction
		change_facing(Lstick, _frame);
		//Set the state to dashing and stop the script.
		state_set(PLAYER_STATE.dashing);
		//VFX
		var _fx = fx_create(spr_dust_dash, 1, 0, 33, x, bbox_bottom - 1, 2, 0, "FX_Layer_Below");
		_fx.fx_xscale = 2 * facing;
		return true;
		}
	return false;
}