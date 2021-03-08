///Standard_Flinch
function Standard_Flinch() {
	//Contains the standard actions for the flinch state.
	var run = true;
#region No vertical movement
	speed_set(0, 0, true, false);
#endregion
#region Friction / Gravity
	friction_gravity(hard_landing_friction, grav, max_fall_speed);
#endregion
#region Cancel into hitstun when in the air
	if (run && !on_ground())
		{
		var _frame = state_frame;
		state_set(PLAYER_STATE.in_hitstun);
		state_frame = _frame;
		run = false;
		}
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
