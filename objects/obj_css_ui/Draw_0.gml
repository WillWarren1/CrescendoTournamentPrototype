/// @description
if (state == CSS_STATE.normal)
	{
	#region Tokens
	for(var i = 0; i < ds_list_size(tokens); i++)
		{
		//Draw token
		var _token = tokens[| i];
		var _x = _token[CSS_TOKEN.x];
		var _y = _token[CSS_TOKEN.y];
		var _is_cpu = _token[CSS_TOKEN.is_cpu];
		var _index = _token[CSS_TOKEN.index];
		draw_sprite_ext(spr_css_token, 0, _x, _y, 1, 1, 0, css_ui_color_get(css_player_list_position(_index), _is_cpu), 1);
		}
	#endregion
	#region Cursors
	for(var i = 0; i < ds_list_size(cursors); i++)
		{
		//Draw Cursor
		var _entry = cursors[| i];
		
		var _active = _entry[CSS_CURSOR.active];
		if (!_active) then continue;
		
		var _cursor = _entry[CSS_CURSOR.index];
		var _holding = _entry[CSS_CURSOR.holding];
		var _frame = (UI_Cursor_Held_Time(_cursor) > 0 || _holding != noone) ? 1 : 0;
		draw_sprite_ext(spr_css_cursor, _frame, UI_Cursor_X(_cursor), UI_Cursor_Y(_cursor), 1, 1, 0, css_ui_color_get(css_player_list_position(_cursor)), 1);
		}
	#endregion
	}
else if (state == CSS_STATE.replays)
	{
	#region Replay Menu
	var _length = array_length(replay_list);
	draw_set_halign(fa_left);
	draw_set_valign(fa_center);
	draw_set_font(fnt_consolas);
	draw_set_color(c_white);
	draw_set_alpha(1);
	for(var i = 0; i < min(replay_list_display_size, _length); i++)
		{
		var _replay = (i + replay_scroll);
		if (replay_current == _replay)
			{
			var _c = $7FB252;
			draw_rectangle_color(replay_list_x, 68 + (24 * i), room_width, 92 + (24 * i), _c, _c, _c, _c, false);
			}
		draw_text(replay_list_x + 8, 80 + (24 * i), replay_list[_replay]);
		}
		
	//Scroll bar
	var _c = $444444;
	draw_rectangle_color(replay_list_x + 336, 64, replay_list_x + 352, 527, _c, _c, _c, _c, false);
	var _c = $666666;
	var _percent = (replay_scroll / min(_length - replay_list_display_size, _length));
	var _bar_y = 64 + 16 + (432 * _percent);
	draw_rectangle_color(replay_list_x + 336, _bar_y - 16, replay_list_x + 352, _bar_y + 15, _c, _c, _c, _c, false);
	#endregion
	}
else if (state == CSS_STATE.match_settings)
	{
	#region Match Settings Menu
	draw_set_halign(fa_left);
	draw_set_valign(fa_center);
	draw_set_font(fnt_consolas);
	draw_set_color(c_white);
	draw_set_alpha(1);
	
	//Current
	var _c = $7FB252;
	var _y = match_settings_y;
	var i = match_settings_current;
	draw_rectangle_color(320, _y + 36 + (24 * i), 639, _y + 60 + (24 * i), _c, _c, _c, _c, false);
	draw_sprite(spr_icon_arrows, 0, 530, _y + 48 + (24 * i));
	draw_sprite(spr_icon_arrows, 1, 590, _y + 48 + (24 * i));
		
	//Scroll bar
	draw_text(386, _y + 48 + (24 * 0), "Stock");
	draw_text(386, _y + 48 + (24 * 1), "Time");
	draw_text(386, _y + 48 + (24 * 2), "Stamina");
	draw_text(386, _y + 48 + (24 * 3), "Teams");
	draw_text(386, _y + 48 + (24 * 4), "Team Attack");
		
	draw_set_halign(fa_center);
	draw_text(560, _y + 48 + (24 * 0), setting().match_stock);
	draw_text(560, _y + 48 + (24 * 1), setting().match_time);
	draw_text(560, _y + 48 + (24 * 2), setting().match_stamina);
	draw_text(560, _y + 48 + (24 * 3), "OFF");
	draw_text(560, _y + 48 + (24 * 4), "OFF");
	
	draw_sprite(spr_icon_stock		, 0, 356, _y + 48 + (24 * 0));
	draw_sprite(spr_icon_time		, 0, 356, _y + 48 + (24 * 1));
	draw_sprite(spr_icon_stamina	, 0, 356, _y + 48 + (24 * 2));
	draw_sprite(spr_icon_teams		, 0, 356, _y + 48 + (24 * 3));
	draw_sprite(spr_icon_team_attack, 0, 356, _y + 48 + (24 * 4));
	
	var _c = $444444;
	draw_rectangle_color(replay_list_x + 336, 64, replay_list_x + 352, 527, _c, _c, _c, _c, false);
	var _c = $666666;
	var _percent = (replay_scroll / min(array_length(replay_list) - replay_list_display_size, array_length(replay_list)));
	var _bar_y = 64 + 16 + (432 * _percent);
	draw_rectangle_color(replay_list_x + 336, _bar_y - 16, replay_list_x + 352, _bar_y + 15, _c, _c, _c, _c, false);
	#endregion
	}
#region Debug Mode
if (css_debug_mode)
	{
	draw_set_font(fnt_consolas);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color($0000FF);
	//CSS Player Data
	for(var i = 0; i < css_number_of_players(); i++)
		{
		var _array = obj_css_data.players[| i];
		draw_text(30, 15 + (i * 25), to_string("Player ", i, ": ", _array));
		}
	draw_set_color($FF0000);
	//CSS UI Cursor Data
	for(var i = 0; i < ds_list_size(cursors); i++)
		{
		var _array = cursors[| i];
		draw_text(30, 200 + (i * 25), to_string("CSS Cursor ", i, ": ", _array));
		}
	draw_set_color($00FF00);
	//UI Cursor Data
	for(var i = 0; i < ds_list_size(obj_ui_runner.cursors); i++)
		{
		var _array = obj_ui_runner.cursors[| i];
		draw_text(30, 400 + (i * 25), to_string("UI Cursor ", i, ": ", _array));
		}
	}
#endregion