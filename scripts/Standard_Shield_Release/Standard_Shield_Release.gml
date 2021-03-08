///Standard_Shield_Release
function Standard_Shield_Release() {
	//Contains the standard actions for the shield release state.
	var run = true;
#region No vertical movement
	vsp = 0;
	vsp_frac = 0;
#endregion
#region Friction
	friction_gravity(hard_landing_friction);
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
	move_grounded();


}
