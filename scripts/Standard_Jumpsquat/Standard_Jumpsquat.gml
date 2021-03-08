///Standard_Jumpsquat
function Standard_Jumpsquat() {
	//Contains the standard actions for the jumpsquat state.
	/* NOTE - If you fall off a ledge while in jumpsquat, you will still jump.*/
	var run = true;
	#region Gravity
	friction_gravity(0, grav, max_fall_speed);
	#endregion
	#region Airdodge out of jumpsquat (wavedash)
	if (airdodge_type == AIRDODGE_TYPE.rivals)
		{
		if (run && check_airdodge()) run = false;
		}
	#endregion
	#region Upwards attacks out of jumpsquat
	if (run && check_upward_grounds()) run = false;
	#endregion
	#region Jumping
	if (run)
		{
		//If jumpsquat timer is done
		if (state_frame == 0)
			{
			//Change state to aerial state, set speed, and exit the script.
			state_set(PLAYER_STATE.aerial);
		
			//VFX
			fx_create(spr_dust_jump, 1, 0, 17, x, bbox_bottom - 1, 2, 0);
		
			#region Short Hop Aerial
			if (run && scs_short_hop_aerial && button(INPUT.attack, buff, false))
				{
				jump_is_shorthop = true;
				run = false;
				}
			#endregion
		
			//Check for shorthops (if you're not holding the jump button when jumping happens)
			if (!button_hold(INPUT.jump, 0) || jump_is_shorthop)
				{
				vsp = -shorthop_speed;
				vsp_frac = 0;
				jump_is_shorthop = false;
				}
			//Full jumps
			else
				{
				vsp = -jump_speed;
				vsp_frac = 0;
				}
			
			//Change horizontal speed
			if (stick_tilted(Lstick, DIR.horizontal))
				{
				hsp = clamp(hsp + (sign(stick_get_value(Lstick, DIR.horizontal)) * jump_horizontal_accel), -max_air_speed, max_air_speed);
				}
		
			run = false;
			}
		}
	#endregion
	move();
}