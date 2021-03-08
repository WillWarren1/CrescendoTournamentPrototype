///Standard_Crouching
function Standard_Crouching() {
	//Contains the standard actions for the crouching state.
	var run = true;
#region Hurtbox
	hurtbox_anim_set(hurtbox_crouch_sprite, round(anim_frame), facing, 1, 0);
#endregion
#region Friction / Gravity
	friction_gravity(crouch_friction, grav, max_fall_speed);
#endregion
#region Change to Aerial State
	if run && check_aerial() run = false;
#endregion
#region Cancel into normal grounded states
	//If the control stick is not down
	if (run && !stick_tilted(Lstick, DIR.down))
		{
	#region Dashing
		if run && check_dash() run = false;
	#endregion
	#region Walking
		if run && check_walk() run = false;
	#endregion
	#region Idle
		if (run)
			{
			//Change the state to idle and exit the script.
			state_set(PLAYER_STATE.idle);
			run = false;
			}
	#endregion
		}
#endregion
#region Jumping
	//Standard jump. Goes into jumpsquat first.
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
	if run && check_shield() run = false;
#endregion
	move();


}
