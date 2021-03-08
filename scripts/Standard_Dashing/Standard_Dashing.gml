///Standard_Dashing
function Standard_Dashing() {
	//Contains the standard actions for the dashing state.
	var run = true;
	#region Dashing
	//Accelerate in one direction
	hsp += dash_accel * facing;
	//Maximums
	hsp = clamp(hsp, -dash_speed, dash_speed);
	#endregion
	#region Change to Aerial State
	if run && check_aerial() run = false;
	#endregion
	#region Jumping
	if (run && check_jump())
		{
		jump_is_dash_jump = true;
		run = false;
		}
	#endregion
	#region Attacking
	if run && check_smashes() run = false;
	if run && check_dash_attack() run = false;
	if run && check_specials() run = false;
	if run && check_dash_grab() run = false;
	#endregion
	#region Drop Throughs
	if run && check_drop_through() run = false;
	#endregion
	#region Rolling
	if run && check_rolling() exit;
	#endregion
	#region Dash Dancing
	//If the control stick is past a threshold in the other direction and the dash frame is not expired
	var _stick_value = sign(stick_get_value(Lstick, DIR.horizontal));
	if (run && abs(stick_get_value(Lstick, DIR.horizontal)) > stick_flick_amount && _stick_value != 0 && _stick_value != sign(hsp) && state_frame > 0)
		{
		change_facing();
		//Reset dash time
		state_frame = dash_time;
		//Change momentum
		hsp = -hsp;
		//VFX
		var _fx = fx_create(spr_dust_dash, 1, 0, 33, x, bbox_bottom - 1, 2, 0, "FX_Layer_Below");
		_fx.fx_xscale = 2 * facing;
		}
	#endregion
	#region Transition to Running / Idle
	//If the dash frame has reached zero (you have dashed for enough time)
	//and the control stick is still being pressed enough
	if (run)
		{
		if (state_frame == 0)
			{
			if (stick_tilted(Lstick))
				{
				//Change state
				state_set(PLAYER_STATE.running);
				}
			else
				{
				//Stop dashing.
				state_set(PLAYER_STATE.idle);
				}
			run = false;
			}
		}
	#endregion
	jostle_players();
	move();
}