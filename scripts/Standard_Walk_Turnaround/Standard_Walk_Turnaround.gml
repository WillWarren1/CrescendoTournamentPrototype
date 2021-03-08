///Standard_Walk_Turnaround
function Standard_Walk_Turnaround() {
	//Contains the standard actions for the walk turnaround state.
	var run = true;
	#region Facing
	facing = state_facing;
	#endregion
	#region Walking
	//Move based on input
	//Acceleration
	hsp += walk_accel * state_facing;
	//Maximums
	hsp = clamp(hsp, -walk_speed, walk_speed);
	#endregion
	#region Transition back to walking
	if (state_frame == 0)
		{
		state_set(PLAYER_STATE.walking);
		run = false;
		}
	#endregion
	#region Transition to run turnaround
	if (run && stick_flicked(Lstick))
		{
		state_set(PLAYER_STATE.run_turnaround);
		state_frame = max(run_turn_time - state_frame, 0);
		state_facing = state_facing;
		run = false;
		}
	#endregion
	#region Change to Aerial State
	if run && check_aerial() run = false;
	#endregion
	#region Jumping (RAR)
	if run && check_jump() run = false;
	#endregion
	#region Attacking
	if run && check_smashes() run = false;
	if run && check_grounds() run = false;
	if run && check_specials() run = false;
	if run && check_grab() run = false;
	#endregion
	#region Drop Throughs
	if run && check_drop_through() run = false;
	#endregion
	#region Rolling
	if run && check_rolling() run = false;
	#endregion
	#region Shielding
	if (run && check_shield()) run = false;
	#endregion
	jostle_players();
	move_grounded();
}