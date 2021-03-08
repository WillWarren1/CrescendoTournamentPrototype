///Standard_Grab_Release
function Standard_Grab_Release() {
	//Contains the standard actions for the grab release state.
	var run = true;
#region No vertical movement
	vsp = 0;
	vsp_frac = 0;
#endregion
#region Friction / Gravity
	friction_gravity(hard_landing_friction, grav, max_fall_speed);
#endregion
#region Aerial
	if run && check_aerial() run = false;
#endregion
#region When the lag is done
	if (run && state_frame == 0)
		{
		//Return to idle state
		state_set(PLAYER_STATE.idle);
		run = false;
		}
#endregion
	move();


}
