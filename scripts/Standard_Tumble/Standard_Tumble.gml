///Standard_Tumble
function Standard_Tumble() {
	//Contains the standard actions for the tumble state.
	var run = true;
#region Friction / Gravity
	friction_gravity(air_friction, grav, max_fall_speed);
#endregion
#region Hard Landing
	var _current_speed = point_distance(x, y, x + hsp, y + vsp);
	if (run && on_ground() && vsp >= 0 && _current_speed < bounce_minimum_speed)
		{
		state_set(PLAYER_STATE.in_lag);
		state_frame = hard_landing_lag;
		run = false;
		}
#endregion
#region Ledge
	if run && check_ledge_grab_falling() run = false;
#endregion
#region Drift DI
	//If stick is past threshold
	if (stick_tilted(Lstick, DIR.horizontal))
		{
		//Drift DI cannot be used to speed up knockback to high speeds
		if (sign(stick_get_value(Lstick, DIR.horizontal)) == sign(hsp))
			{
			if (abs(hsp + drift_DI_accel * sign(stick_get_value(Lstick, DIR.horizontal))) < drift_DI_max * drift_di_multiplier)
				{
				hsp += drift_DI_accel * sign(stick_get_value(Lstick, DIR.horizontal));
				}
			}
		else
			{
			hsp += drift_DI_accel * sign(stick_get_value(Lstick, DIR.horizontal));
			}
		}
#endregion
#region Airdodge Cancel
	if run && check_airdodge() run = false;
#endregion
#region Jump Cancel (not a normal double jump)
	if (run && button(INPUT.jump, buff))
		{
		if (double_jumps > 0)
			{
			state_set(PLAYER_STATE.aerial);
			double_jumps--;
			vsp = -double_jump_speed;
			vsp_frac = 0;
			jump_is_midair_jump = true;
			jump_is_dash_jump = false;
			/*No horizontal speed change*/
			//VFX
			fx_create(spr_dust_air_jump, 1, 0, 7, x, y, 2, 0);
			run = false;
			}
		}
#endregion
#region Attack Cancel
	if run && check_smashes() run = false;
	if run && check_aerials() run = false;
	if run && check_specials() run = false;
#endregion
	move();


}
