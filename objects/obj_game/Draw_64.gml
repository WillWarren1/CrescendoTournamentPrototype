/// @description HUD, Timer, Debug
//Draw player status
var _fade = background_get_clear_amount();

if (setting().show_hud)
	{
	for(var i = 0; i < ds_list_size(ordered_player_list); i++)
		{
		//Get accent color
		var _accent = c_white;
		var _player = ordered_player_list[| i];
		_accent = palette_color_get(_player.palette, 0);
	
		//X and Y positions
		var _x = status_bar_space * (i + 1);
		var _y = player_status_y;
	
		//Fade out status bars if any players are under them
		var _collide_fade = 0;
		if (collision_rectangle(cam_x + _x - 64, cam_y + _y - 32, cam_x + _x + 64, cam_y + _y + 32, obj_player, false, true))
			{
			_collide_fade = 0.5;
			}
	
		//Status bar back
		draw_sprite_ext
			(
			spr_player_status,
			0,
			_x, 
			_y, 
			2,
			2,
			0,
			_accent,
			_fade - _collide_fade
			);
		
		palette_shader_simple_rgb_set(_player.palette_sprite, _player.player_color);
	
		//Portrait sprite
		draw_sprite_ext
			(
			_player.portrait,
			0,
			_x, 
			_y, 
			2,
			2,
			0,
			c_white,
			_fade - _collide_fade
			);
		
		//Stocks
		if (_player.stock <= 5)
			{
			for(var m = 0; m < _player.stock; m++)
				{
				draw_sprite_ext
					(
					_player.stock_sprite,
					0,
					_x + (m * 18) + 48,
					_y - 48,
					2,
					2,
					0,
					c_white,
					_fade - _collide_fade 
					);
				}
			}
		//Abbreviated stock
		else
			{
			draw_sprite_ext
				(
				_player.stock_sprite,
				0,
				_x + 66,
				_y - 48,
				2,
				2,
				0,
				c_white,
				_fade - _collide_fade
				);
			//Text
			shader_reset();
			draw_set_font(fnt_consolas);
			draw_set_halign(fa_left);
			draw_set_valign(fa_center);
			draw_set_alpha(round(_fade));
			draw_text_outline_simple(status_bar_space * (i + 1) + 80, player_status_y - 48, to_string("- ", _player.stock));
			draw_set_alpha(1);
			}
	
		shader_reset();
	
		//Status bar front
		draw_sprite_ext
			(
			spr_player_status,
			1,
			_x,
			_y,
			2,
			2,
			0,
			_accent,
			_fade - _collide_fade
			);
		
		//Damage
		var _percent = match_has_stamina_set() ? _player.stamina : _player.damage;
		draw_damage_text
			(
			46 + _x,
			_y,
			_percent,
			spr_damage_font,
			34,
			_player.damage_text_x,
			_player.damage_text_y,
			2,
			calculate_damage_color(_player.damage),
			_fade - _collide_fade
			);
		
		//Run the character HUD script
		if (script_exists(_player.hud_script))
			{
			script_execute(_player.hud_script, _x, _y, _player, (_fade - _collide_fade));
			}
		}
	}

//Timer
if (match_has_time_set() && countdown <= count_time)
	{
	var _time = (setting().match_time - (game_time / game_get_speed(gamespeed_fps) / 60));
	var _time_left = string_format(floor(_time), 3, 0);
	var _time_right = string_replace_all(string_format(floor(frac(_time) * 100 * (60 / 100)), 2, 0), " ", "0");
	draw_set_font(fnt_time);
	draw_set_valign(fa_top);
	draw_set_color(c_black);
	draw_set_halign(fa_right);
	draw_text_outline_simple(center_x, 16, _time_left + " ");
	draw_set_halign(fa_center);
	draw_text_outline_simple(center_x, 16, ":");
	draw_set_halign(fa_left);
	draw_text_outline_simple(center_x, 16, " " + _time_right);
	}

//Startup sequence
if (countdown > 0)
	{
	//Countdown
	var _frame = countdown div count_time;
	var _scale = lerp(2.2, 2, (countdown % count_time) / count_time);
	var _alpha = lerp(0, 1, (countdown % count_time) / count_time);
	draw_sprite_ext(spr_countdown, _frame, center_x, center_y, _scale, _scale, 0, c_white, _alpha);
	}
	
//Ending sequence
if (state == GAME_STATE.ending)
	{
	draw_set_alpha(0.5);
	draw_rectangle_color(0, 0, room_width, room_height, c_white, c_white, c_white, c_white, false);
	draw_set_alpha(1);
	var _scale = 2;
	var _alpha = lerp(0, 2, endcount / end_time);
	draw_sprite_ext(spr_finish, 0, center_x, center_y, _scale, _scale, 0, c_white, _alpha);
	}

//Pause Menu
if (state == GAME_STATE.paused)
	{
	//Frame Advance
	if (frame_advance_active)
		{
		draw_set_font(fnt_consolas);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_set_color(c_black);
		draw_text(32, 16, "Controlling Player: " + string(pause_menu_owner.player_number));
		draw_text(32, 32, "Total Frames: " + string(current_frame));
		draw_text(32, 48, "Frame Number: " + string(frames_advanced));
		draw_text(32, 64, "Press Start/Enter to go to the next frame");
		draw_text(32, 80, "Press Select/Backspace to exit frame advance");
		}
	else
		{
		//Menu
		var _size = 350;
		draw_set_alpha(0.5);
		draw_rectangle_color(screen_width - _size, 0, screen_width, screen_height, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		draw_set_font(fnt_time);
		draw_set_halign(fa_right);
		draw_set_valign(fa_center);
		draw_set_color(c_white);
		for(var i = 0; i < array_length(pause_menu_choices); i++)
			{
			var _x = screen_width - 32;
			var _y = 64 + (i * 64);
			//Current choice
			if (pause_menu_current == i)
				{
				var _c = $90d460;
				draw_rectangle_color(screen_width - _size + 8, _y - 24, screen_width - 8, _y + 24, _c, _c, _c, _c, false);
				draw_set_color($262320);
				}
			else
				{
				draw_set_color($eeeeee);
				}
			draw_text(_x, _y, pause_menu_choices[i]);
			}
		}
	}
	
//Debugging
if (debug)
	{
	draw_set_font(fnt_consolas);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	
	//Dynamic resources
	if (debug_menus.resources)
		{
		draw_set_color(c_black);
		draw_rectangle(0, 16, 128, 32 * 10, false);
		draw_set_color(c_white);
		draw_text(16, 32 * 1, "GRIDS: " + string(resource_counts.grid));
		draw_text(16, 32 * 2, "LISTS: " + string(resource_counts.list));
		draw_text(16, 32 * 3, "MAPS: " + string(resource_counts.map));
		draw_text(16, 32 * 4, "PRIORITES: " + string(resource_counts.priority));
		draw_text(16, 32 * 5, "QUEUES: " + string(resource_counts.queue));
		draw_text(16, 32 * 6, "STACKS: " + string(resource_counts.stack));
		draw_text(16, 32 * 7, "BUFFERS: " + string(resource_counts.buffer));
		draw_text(16, 32 * 8, "SURFACES: " + string(resource_counts.surface));
		draw_text(16, 32 * 9, "INSTANCES: " + string(resource_counts.instance));
		}
		
	//Overlay
	if (debug_menus.overlay)
		{
		draw_set_color(c_ltgray);
		draw_rectangle(0, 0, room_width, 24, false);
		}
		
	//Player input buffers
	if (debug_menus.inputs)
		{
		with(obj_player)
			{
			var start_x = player_number * (ds_list_size(input_buffer) * 5);
			var c = c_white;
			for(var i = 0; i < (INPUT.length * 2); i++)
				{
				c = make_color_hsv((i mod INPUT.length) * INPUT.length * 4, 255, 255);
				draw_rectangle_color(start_x + i * 5, 0, start_x + 4 + i * 5, input_buffer[| i] * 2, c, c, c, c, false);
				draw_rectangle_color(start_x + i * 5, input_buffer[| i] * 2, start_x + 4 + i * 5, 3 + input_buffer[| i] * 2, c_black, c_black, c_black, c_black, false);
				}
			}
		}
	}
	
//FPS
if (setting().debug_fps)
	{
	draw_set_font(fnt_consolas);
	draw_set_color(c_black);
	draw_set_halign(fa_right);
	draw_set_valign(fa_top);
	draw_text(screen_width - 8, 8, to_string("FPS Avg: ", fps_avg, " Min: ", fps_min, " Max: ", fps_max));
	}