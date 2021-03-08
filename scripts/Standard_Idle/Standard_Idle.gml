///Standard_Idle
function Standard_Idle() {
	//Contains the standard actions for the idle state.
	var run = true;
	#region Friction & Gravity
	friction_gravity(ground_friction, grav, max_fall_speed);
	#endregion
	#region Change to Aerial State
	if (run && check_aerial()) run = false;
	#endregion
	#region Jumping
	if (run && check_jump()) run = false;
	#endregion
	#region Attacking
	if run && check_smashes() run = false;
	if run && check_grounds() run = false;
	if run && check_specials() run = false;
	if run && check_grab() run = false;
	#endregion
	#region Drop Throughs
	if (run && check_drop_through()) run = false;
	#endregion
	#region Crouching
	if (run && check_crouch()) run = false;
	#endregion
	#region Rolling
	if (run && check_rolling()) run = false;
	#endregion
	#region Shielding
	if (run && !stick_tilted(Lstick,DIR.horizontal) && check_shield()) run = false;
	#endregion
	#region Dashing
	if (run && check_dash()) run = false;
	#endregion
	#region Walking
	if (run && check_walk()) run = false;
	#endregion
	jostle_players();
	move();
}