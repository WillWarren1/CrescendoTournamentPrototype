///Standard_Wall_Cling
function Standard_Wall_Cling() {
	//Contains the standard actions for the wall cling state.
	var run = true;
	switch(wall_jump_type)
		{
		case WALL_JUMP_TYPE.rivals:
			{
			if (run && !button_hold(INPUT.jump) && wall_jumps > 0 && wall_jump_timeout == 0)
				{
				state_set(PLAYER_STATE.wall_jump);
				speed_set(0, 0, false, false);
				state_frame = wall_jump_startup;
				wall_jumps--;
				jump_is_midair_jump = false;
				jump_is_dash_jump = false;
		
				wall_cling_timeout = wall_cling_normal_timeout;
				
				//VFX
				if (collision(x + wall_jump_check_distance, y, flags_create(FLAG.solid)))
					{
					var _fx = fx_create(spr_dust_wall_jump, 1, 0, 17, bbox_right, y, 2, 0);
					_fx.fx_xscale = -2;
					}
				else if (collision(x - wall_jump_check_distance, y, flags_create(FLAG.solid)))
					{
					var _fx = fx_create(spr_dust_wall_jump, 1, 0, 17, bbox_left, y, 2, 0);
					_fx.fx_xscale = 2;
					}
		
				run = false;
				}
			//If the time ran out or if you are not holding the button
			if (run && (state_time == wall_cling_max_time || !button_hold(INPUT.jump)))
				{
				state_set(PLAYER_STATE.aerial);
				wall_cling_timeout = wall_cling_normal_timeout;
				}
			break;
			}
		case WALL_JUMP_TYPE.smash:
			{
			if (run && check_wall_jump()) run = false;
			if (run && (state_time == wall_cling_max_time ||
				(!stick_tilted(Lstick, DIR.right) && collision(x + wall_cling_check_distance, y, flags_create(FLAG.solid))) ||
				(!stick_tilted(Lstick, DIR.left) && collision(x - wall_cling_check_distance, y, flags_create(FLAG.solid)))))
				{
				state_set(PLAYER_STATE.aerial);
				wall_cling_timeout = wall_cling_normal_timeout;
				}
			break;
			}
		}


}
