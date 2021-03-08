///Standard_Helpless
function Standard_Helpless() {
	//Contains the standard actions for the helpless state.
	var run = true;
#region Friction / Gravity
	friction_gravity(air_friction, grav, max_fall_speed);
#endregion
#region Helpless Drift
	//If stick is past threshold
	if (stick_tilted(Lstick))
		{
		//Drift cannot be used to speed up knockback to high speeds
		var _val = sign(stick_get_value(Lstick, DIR.horizontal));
		if (_val == sign(hsp))
			{
			if (abs(hsp + helpless_accel * _val) < helpless_max_speed)
				{
				hsp += helpless_accel * _val;
				}
			}
		else
			{
			hsp += helpless_accel * _val;
			}
		}
#endregion
#region Hard Landing
	if (run && on_ground())
		{
		state_set(PLAYER_STATE.in_lag);
		state_frame = landing_lag;
		//VFX
		fx_create(spr_dust_land, 1, 0, 25, x, bbox_bottom - 1, 2, 0, "FX_Layer_Below");
		run = false;
		}
#endregion
#region Ledge
	if run && check_ledge_grab() run = false;
#endregion
#region Wall Jumping
	if (run)
		{
		if (wall_jump_type == WALL_JUMP_TYPE.rivals)
			{
			if run && check_wall_cling() run = false;
			if run && check_wall_jump() run = false;
			}
		}
#endregion
#region Fastfalling
	if (run) fastfall_try();
#endregion
	move();


}
