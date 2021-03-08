/// @description
if (obj_game.state == GAME_STATE.startup) then exit;

if (next_point != noone && instance_exists(next_point))
	{
	time++;
	var _next_x = round(lerp(start_x, next_point.x, time / next_point.travel_time));
	var _next_y = round(lerp(start_y, next_point.y, time / next_point.travel_time));
	var _hsp = (_next_x - x);
	var _vsp = (_next_y - y);
	ds_list_clear(pull_list);
	var _pull = (instance_place_list(x, y - 1, obj_player, pull_list, false) > 0);
	//Movement
	repeat(abs(_hsp))
		{
		x += sign(_hsp);
		//Pulling
		if (_pull)
			{
			for(var m = 0; m < ds_list_size(pull_list); m++)
				{
				with(pull_list[| m])
					{
					move_x(sign(_hsp));
					}
				}
			}
		//Pushing
		ds_list_clear(get_temp_list());
		if (instance_place_list(x, y, obj_player, get_temp_list(), false) > 0)
			{
			for(var i = 0; i < ds_list_size(get_temp_list()); i++)
				{
				with(get_temp_list()[| i])
					{
					move_x(sign(_hsp));
					}
				}
			}
		}
	repeat(abs(_vsp))
		{
		y += sign(_vsp);
		//Pulling
		if (_pull && _vsp > 0)
			{
			for(var m = 0; m < ds_list_size(pull_list); m++)
				{
				with(pull_list[| m])
					{
					move_y(false, sign(_vsp));
					}
				}
			}
		//Pushing
		ds_list_clear(get_temp_list());
		if (instance_place_list(x, y, obj_player, get_temp_list(), false) > 0)
			{
			for(var i = 0; i < ds_list_size(get_temp_list()); i++)
				{
				with(get_temp_list()[| i])
					{
					move_y(true, sign(_vsp));
					}
				}
			}
		}
	//Move all players out of blocks just in case
	with(obj_player)
		{
		move_out_of_blocks(point_direction(0, 0, _hsp, _vsp));
		}
	//Next point
	if (time >= next_point.travel_time)
		{
		x = next_point.x;
		y = next_point.y;
		next_point = next_point.next_point;
		time = 0;
		start_x = x;
		start_y = y;
		}
	}