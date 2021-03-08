///@func check_wall_jump()
///@desc Checks if the player is able to wall jump
function check_wall_jump() {
	switch(wall_jump_type)
		{
		case WALL_JUMP_TYPE.rivals:
			{
			if (wall_jumps > 0 && wall_jump_timeout == 0)
				{
				if (!on_ground())
					{
					if (stick_tilted(Lstick, DIR.right) && collision(x + wall_jump_check_distance, y, flags_create(FLAG.solid)) && 
						button(INPUT.jump, buff))
						{
						state_set(PLAYER_STATE.wall_jump);
						speed_set(0, 0, false, false);
						facing = -1;
						state_frame = wall_jump_startup;
						wall_jumps--;
						jump_is_midair_jump = false;
						jump_is_dash_jump = false;
						var _fx = fx_create(spr_dust_wall_jump, 1, 0, 17, bbox_right, y, 2, 0);
						_fx.fx_xscale = -2;
						return true;
						}
					if (stick_tilted(Lstick, DIR.left) && collision(x - wall_jump_check_distance, y, flags_create(FLAG.solid)) && 
						button(INPUT.jump, buff))
						{
						state_set(PLAYER_STATE.wall_jump);
						speed_set(0, 0, false, false);
						facing = 1;
						state_frame = wall_jump_startup;
						wall_jumps--;
						jump_is_midair_jump = false;
						jump_is_dash_jump = false;
						var _fx = fx_create(spr_dust_wall_jump, 1, 0, 17, bbox_left, y, 2, 0);
						_fx.fx_xscale = 2;
						return true;
						}
					}
				}
			break;
			}
		case WALL_JUMP_TYPE.smash:
			{
			if (can_wall_jump)
				{
				if (!on_ground())
					{
					if (stick_flicked(Lstick, DIR.left) && collision(x + wall_jump_check_distance, y, flags_create(FLAG.solid)))
						{
						state_set(PLAYER_STATE.wall_jump);
						speed_set(0, 0, false, false);
						facing = -1;
						state_frame = wall_jump_startup;
						wall_jumps--;
						jump_is_midair_jump = false;
						jump_is_dash_jump = false;
						return true;
						}
					if (stick_flicked(Lstick, DIR.right) && collision(x - wall_jump_check_distance, y, flags_create(FLAG.solid)))
						{
						state_set(PLAYER_STATE.wall_jump);
						speed_set(0, 0, false, false);
						facing = 1;
						state_frame = wall_jump_startup;
						wall_jumps--;
						jump_is_midair_jump = false;
						jump_is_dash_jump = false;
						return true;
						}
					}
				}
			break;
			}
		}
	return false;


}
