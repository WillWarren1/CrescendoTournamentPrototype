/// @description Draw Backgrounds
if (surface_exists(obj_game.game_surface))
	{
	if (game_surface_enable) surface_set_target(obj_game.game_surface);
	//Local vars
	var _fade = false;
	var _shader = false;
	var _w = camera_get_view_width(obj_game.cam);
	var _h = camera_get_view_height(obj_game.cam);
	var _cam_center_x = obj_game.cam_x + (_w / 2);
	var _cam_center_y = obj_game.cam_y + (_h / 2);
	var _player_dist_x = (half_room_width - obj_game.cam_x - (_w / 2));
	var _player_dist_y = (half_room_height- obj_game.cam_y - (_h / 2));

	//Loop through the layers of the background and draw each
	for(var i = 0; i < array_length(background); i++)
		{
		var _layer = background[i];
	
		if (_layer[BACK.sprite] != -1)
			{
			//Fade layers above the clear layer
			if (_fade && !_shader)
				{
				_shader = true;
				shader_set(shd_fade);
				shader_set_uniform_f(uni_black, 1 - background_clear_amount);
				}
		
			//If it has a special script, use that instead
			var _abs = _layer[BACK.absolute];
			var _draw_x = _abs ? 0 : _cam_center_x;
			var _draw_y = _abs ? 0 : _cam_center_y;
			if (_layer[BACK.script] != -1 && script_exists(_layer[BACK.script]))
				{
				script_execute(_layer[BACK.script], _layer, _draw_x, _draw_y, _player_dist_x, _player_dist_y);
				}
			else
				{
				//Draw according to properties
				draw_sprite_ext
					(
					_layer[BACK.sprite],
					_layer[BACK.frame],
					_draw_x + _layer[BACK.x] + (_player_dist_x * _layer[BACK.parallax_x]),
					_draw_y + _layer[BACK.y] + (_player_dist_y * _layer[BACK.parallax_y]),
					_layer[BACK.scale],
					_layer[BACK.scale],
					0,
					c_white,
					1
					);
				}
			}
		else
			{
			_fade = true;
			//Draw the cutoff background layer
			draw_set_alpha(background_clear_amount);
			draw_rectangle_color
				(
				obj_game.cam_x, obj_game.cam_y,
				obj_game.cam_x + _w, obj_game.cam_y + _h,
				background_clear_color,
				background_clear_color,
				background_clear_color,
				background_clear_color,
				false
				);
			draw_set_alpha(1);
			}
		}

	//Reset shader
	if (_fade)
		{
		shader_reset();
		}
	if (game_surface_enable) surface_reset_target();
	}