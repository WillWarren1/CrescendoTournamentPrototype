///@func check_wall_cling()
///@desc Checks if the player is able to wall cling
function check_wall_cling() {
	switch(wall_jump_type)
		{
		case WALL_JUMP_TYPE.rivals:
			{
			if (can_wall_cling && wall_cling_timeout == 0 && wall_jumps > 0)
				{
				if (!on_ground())
					{
					if (button_hold(INPUT.jump, 1))
						{
						if (stick_tilted(Lstick, DIR.right) && collision(x + wall_cling_check_distance, y, flags_create(FLAG.solid)))
							{
							state_set(PLAYER_STATE.wall_cling);
							speed_set(0, 0, false, false);
							facing = -1;
							return true;
							}
						if (stick_tilted(Lstick, DIR.left) && collision(x - wall_cling_check_distance, y, flags_create(FLAG.solid)))
							{
							state_set(PLAYER_STATE.wall_cling);
							speed_set(0, 0, false, false);
							facing = 1;
							return true;
							}
						}
					}
				}
			break;
			}
		case WALL_JUMP_TYPE.smash:
			{
			if (can_wall_cling && wall_cling_timeout == 0)
				{
				if (!on_ground())
					{
					if (stick_tilted(Lstick, DIR.right) && collision(x + wall_cling_check_distance, y, flags_create(FLAG.solid)))
						{
						state_set(PLAYER_STATE.wall_cling);
						speed_set(0, 0, false, false);
						facing = -1;
						return true;
						}
					if (stick_tilted(Lstick, DIR.left) && collision(x - wall_cling_check_distance, y, flags_create(FLAG.solid)))
						{
						state_set(PLAYER_STATE.wall_cling);
						speed_set(0, 0, false, false);
						facing = 1;
						return true;
						}
					}
				}
			break;
			}
		}
	return false;


}
