///Standard_Grabbing
function Standard_Grabbing() {
	//Contains the standard actions for the grabbing state.
	//"Grabbing" refers to the state when a player is holding an opponent after connecting a grab hitbox
	var run = true;
	#region Friction & Gravity
	friction_gravity(ground_friction, grav, max_fall_speed);
	#endregion
	#region Change to Aerial State
	if run && check_aerial() run = false;
	#endregion
	#region Attacking
	if (run && (grabbed_id.state == PLAYER_STATE.is_grabbed || grabbed_id.state == PLAYER_STATE.in_hitlag))
		{
		//Throw stick reset
		if (!stick_tilted(Lstick))
			{
			throw_stick_has_reset = true;
			}

		#region Throw
		if (run)
			{
			//You can throw opponents if the stick has been reset or if the grab is ending
			if (throw_stick_has_reset)
				{
				if (check_throws()) then run = false;
				}
			else if (state_frame <= 0)
				{
				if (check_throws()) then run = false;
				}
			}
		#endregion
		#region Pummel
		if (run && state_frame > 0)
			{
			var _grab_frame = state_frame;
			if (check_pummel())
				{
				state_frame = _grab_frame;
				run = false;
				}
			}
		#endregion
		}
	#endregion
	#region Grab Interrupt
	//If the grabbed player is no longer being grabbed, the grab releases
	if (run && ((grabbed_id.state != PLAYER_STATE.is_grabbed && 
		grabbed_id.state != PLAYER_STATE.in_hitlag) ||
		grabbed_id.grab_hold_id != id))
		{
		grab_release();
		run = false;
		}
	#endregion
	#region Grab Release
	//Grabs end automatically when the grab frame times out without a throw
	if (run && state_frame == 0)
		{
		grab_release();
		run = false;
		}
	#endregion
	#region Grab Snap
	if (run)
		{
		grab_snap_move();
		}
	#endregion
	move_grounded();
}