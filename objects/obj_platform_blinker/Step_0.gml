/// @description
if (obj_game.game_time % timer == 0)
	{
	if (!swapped)
		{
		swapped = true;
		instance_set_flag(id, FLAG.plat, !instance_get_flag(id, FLAG.plat));
		on = !on;
		}
	}
else
	{
	swapped = false;
	}