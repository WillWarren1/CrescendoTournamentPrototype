/// @description
if (state == CSS_STATE.normal)
	{
	#region Device Management
	//Controllers
	for(var i = 0; i < number_of_devices; i++)
		{
		//Connect players
		if (gamepad_is_connected(i))
			{
			if (controller_any_input(i, stick_tilt_amount, true))
				{
				//Add it as a connected device
				var _number = css_number_of_players();
				if (_number < max_players && !controller_connected[i])
					{
					if (css_debug_mode) then log("Num: ", _number, " Index: ", index_counter);
					//Mark the controller as being connected
					controller_connected[@ i] = true;
					//Add the player to the CSS Data
					css_player_add(index_counter, false, i, DEVICE.controller);
					//Add the CSS cursor
					var _x = room_width div 2;
					var _y = room_height div 2;
					css_ui_cursor_add(index_counter, _x, _y, i, DEVICE.controller, false);
					//Add the token
					css_ui_token_add(index_counter, _x, _y, false);
					//Create the necessary UI
					css_ui_refresh();
					index_counter++;
					}
				}
			}
		}
	
	//Keyboards (does not support multiple keyboards without extension!)
	for(var i = 0; i < number_of_keyboards; i++)
		{
		//Connect players
		if (keyboard_check_pressed(vk_anykey))
			{
			//Add it as a connected device
			var _number = css_number_of_players();
			if (_number < max_players && !keyboard_connected[i])
				{
				if (css_debug_mode) then log("Num: ", _number, " Index: ", index_counter);
				//Mark the controller as being connected
				keyboard_connected[@ i] = true;
				//Add the player to the CSS Data
				css_player_add(index_counter, false, i, DEVICE.keyboard);
				//Add the CSS cursor
				var _x = room_width div 2;
				var _y = room_height div 2;
				css_ui_cursor_add(index_counter, _x, _y, i, DEVICE.keyboard, false);
				//Add the token
				css_ui_token_add(index_counter, _x, _y, false);
				//Create the necessary UI
				css_ui_refresh();
				index_counter++;
				}
			}
		}
	#endregion
	#region Updating Cursors / Actions
	for(var i = 0; i < ds_list_size(cursors); i++)
		{
		#region Cursors
		var _entry = cursors[| i];
		
		var _active = _entry[CSS_CURSOR.active];
		if (!_active) then continue;
		
		var _index = _entry[CSS_CURSOR.index];
		var _device = _entry[CSS_CURSOR.device];
		var _device_type = _entry[CSS_CURSOR.device_type];
		var _x = UI_Cursor_X(_index);
		var _y = UI_Cursor_Y(_index);
		var _gx, _gy;
		var _rl;
		var _confirm_press = false;
		var _confirm = false;
		var _cancel = false;
		var _delete = false;
		var _option = false;
		var _ready = false;
	
		//Controllers
		if (_device_type == DEVICE.controller)
			{
			_gx = gamepad_axis_value(_device, gp_axislh);
			_gy = gamepad_axis_value(_device, gp_axislv);
			if (point_distance(0, 0, _gx, _gy) > stick_tilt_amount)
				{
				_gx *= CSS_cursor_speed;
				_gy *= CSS_cursor_speed;
				}
			else
				{
				_gx = 0;
				_gy = 0;
				}
			_rl = sign(gamepad_button_check_pressed(_device, gp_shoulderr) - gamepad_button_check_pressed(_device, gp_shoulderl));
			_confirm_press = gamepad_button_check_pressed(_device, menu_confirm_button);
			_confirm = gamepad_button_check(_device, menu_confirm_button);
			_cancel = gamepad_button_check(_device, menu_cancel_button);
			_delete = gamepad_button_check(_device, menu_delete_button);
			_option = gamepad_button_check(_device, menu_option_button);
			_ready = gamepad_button_check_pressed(_device, menu_ready_button);
			}
		//Keyboards
		else if (_device_type == DEVICE.keyboard)
			{
			_gx = (keyboard_check(menu_right_key) - keyboard_check(menu_left_key)) * CSS_cursor_speed;
			_gy = (keyboard_check(menu_down_key) - keyboard_check(menu_up_key)) * CSS_cursor_speed;
			_rl = sign(keyboard_check_pressed(menu_option_key));
			_confirm_press = keyboard_check_pressed(menu_confirm_key);
			_confirm = keyboard_check(menu_confirm_key);
			_cancel = keyboard_check(menu_cancel_key);
			_delete = keyboard_check(menu_delete_key);
			_option = keyboard_check(menu_option_key);
			_ready = keyboard_check_pressed(menu_ready_key);
			}
		
		//Update Cursor
		UI_Cursor_Update
			(
			_index,
			modulo(_x + _gx, room_width),
			modulo(_y + _gy, room_height),
			false,
			_confirm,
			);
		#endregion
		#region Tokens
		var _cx = UI_Cursor_X(_index);
		var _cy = UI_Cursor_Y(_index);
	
		//If you're not holding a token
		if (_entry[CSS_CURSOR.holding] == noone)
			{
			for(var m = 0; m < ds_list_size(tokens); m++)
				{
				var _token = tokens[| m];
				//Pick up the token
				if (_confirm_press)
					{
					var _index = css_player_index(i);
					log(_index, " ", css_player_index(i));
					if (_token[CSS_TOKEN.is_cpu] || _token[CSS_TOKEN.index] == _index)
						{
						if (point_distance(_cx, _cy, _token[CSS_TOKEN.x], _token[CSS_TOKEN.y]) < 40)
							{
							_entry[@ CSS_CURSOR.holding] = _token[CSS_TOKEN.index];
							break;
							}
						}
					}
				}
			}
		//If you're holding a token
		else
			{
			//Find the token with the correct index
			var _token;
			var _token_index;
			for(var j = 0; j < ds_list_size(tokens); j++)
				{
				_token_index = css_player_index(j);
				if (_token_index == _entry[CSS_CURSOR.holding])
					{
					_token = tokens[| j];
					break;
					}
				}
			//Put down the token
			if (_confirm_press)
				{
				_entry[@ CSS_CURSOR.holding] = noone;
			
				//Selecting characters
				var _zone = instance_position(_cx, _cy, obj_css_zone);
				if (_zone != noone)
					{
					css_player_set(_token_index, CSS_PLAYER.character, _zone.character);
				
					//Change CPU color
					if (_token[CSS_TOKEN.is_cpu])
						{
						css_player_set
							(
							_token_index, 
							CSS_PLAYER.color, 
							css_get_next_character_color
								(
								_token_index, 
								css_player_get(_token_index, CSS_PLAYER.character), 
								css_player_get(_token_index, CSS_PLAYER.color), 
								1,
								),
							);
						}
					}
				}
			//Restrict cursor movement
			UI_Cursor_Update
				(
				_index,
				clamp(UI_Cursor_X(_index), 80, 926),
				clamp(UI_Cursor_Y(_index), 64, 300),
				false,
				_confirm,
				);
			//Update Token position
			if (_entry[CSS_CURSOR.holding] != noone)
				{
				_token[@ CSS_TOKEN.x] = UI_Cursor_X(_index);
				_token[@ CSS_TOKEN.y] = UI_Cursor_Y(_index);
				}
			}
		#endregion
		#region Changing Colors
		if (_rl != 0)
			{
			css_player_set
				(
				_index, 
				CSS_PLAYER.color, 
				css_get_next_character_color
					(
					_index, 
					css_player_get(_index, CSS_PLAYER.character), 
					css_player_get(_index, CSS_PLAYER.color), 
					_rl,
					),
				);
			}
		#endregion
		#region Ready Up (Shortcut)
		if (_ready)
			{
			css_start_game();
			}
		#endregion
		}
	#endregion
	#region Animations
	//Replay list animation
	replay_list_x = lerp(replay_list_x, room_width + 32, 0.2);
	ui_set_position(noone, replay_list_x, 32, 1);
	
	//Match settings animation
	match_settings_y = lerp(match_settings_y, -192, 0.2);
	ui_set_position(noone, 320, match_settings_y, 0);
	
	//Fade
	obj_ui_fade.fade_goal = 0;
	#endregion
	}
else if (state == CSS_STATE.replays)
	{
	#region Replays
	var _number_of_replays = array_length(replay_list);
	
	//Replay list animation
	replay_list_x = lerp(replay_list_x, 608, 0.2);
	ui_set_position(noone, replay_list_x, 32, 1);
	
	//Fade
	obj_ui_fade.fade_goal = 0.75;
	
	//Inputs
	var _cursor = cursors[| replay_selector];
	var _position = css_player_list_position(_cursor[CSS_CURSOR.index]);
	var _device = _cursor[CSS_CURSOR.device];
	var _device_type = _cursor[CSS_CURSOR.device_type];
	var _sticklv, _ud, _confirm, _cancel;
	
	if (_device_type == DEVICE.controller)
		{
		_sticklv = abs(gamepad_axis_value(_device, gp_axislv)) > stick_tilt_amount;
		_confirm = gamepad_button_check_pressed(_device, menu_confirm_button);
		_cancel = gamepad_button_check_pressed(_device, menu_cancel_button);
		_ud = sign(gamepad_axis_value(_device, gp_axislv));
		}
	else if (_device_type == DEVICE.keyboard)
		{
		_sticklv = sign(keyboard_check(menu_down_key) + keyboard_check(menu_up_key));
		_confirm = keyboard_check_pressed(menu_confirm_key);
		_cancel = keyboard_check_pressed(menu_cancel_key);
		_ud = keyboard_check(menu_down_key) - keyboard_check(menu_up_key);
		}
	
	//Scrolling
	if (_sticklv != 0 && Virtual_Button_Hold(vc, _position, VB.sticklv) && _number_of_replays > 0)
		{
		replay_current = modulo(replay_current + _ud, _number_of_replays);
		
		while(replay_current > replay_scroll + replay_list_display_size - 1) 
			{
			replay_scroll++;
			}
		while(replay_current < replay_scroll) 
			{
			replay_scroll--;
			}
		}
		
	//Selecting a replay
	if (_confirm && _number_of_replays > 0)
		{
		setting().replay_mode = true;
		setting().replay_record = false;
		Replay_Load(replay_list[replay_current]);
		Match_Begin();
		exit;
		}
	//Cancel
	else if (_cancel)
		{
		state = CSS_STATE.normal;
		state_timer = 0;
		replay_current = 0;
		replay_scroll = 0;
		replay_selector = noone;
		}
	#endregion
	}
else if (state == CSS_STATE.match_settings)
	{
	#region Match Settings
	//Match settings animation
	match_settings_y = lerp(match_settings_y, 160, 0.2);
	ui_set_position(noone, 320, match_settings_y, 0);
	
	//Fade
	obj_ui_fade.fade_goal = 0.75;
	
	//Inputs
	var _cursor = cursors[| match_settings_selector];
	var _position = css_player_list_position(_cursor[CSS_CURSOR.index]);
	var _device = _cursor[CSS_CURSOR.device];
	var _device_type = _cursor[CSS_CURSOR.device_type];
	var _sticklh, _sticklv, _rl, _ud, _confirm, _cancel;
	
	if (_device_type == DEVICE.controller)
		{
		_sticklh = abs(gamepad_axis_value(_device, gp_axislh)) > stick_flick_amount;
		_sticklv = abs(gamepad_axis_value(_device, gp_axislv)) > stick_flick_amount;
		_confirm = gamepad_button_check_pressed(_device, menu_confirm_button);
		_cancel = gamepad_button_check_pressed(_device, menu_cancel_button);
		_rl = sign(gamepad_axis_value(_device, gp_axislh));
		_ud = sign(gamepad_axis_value(_device, gp_axislv));
		}
	else if (_device_type == DEVICE.keyboard)
		{
		_sticklh = sign(keyboard_check(menu_right_key) + keyboard_check(menu_left_key));
		_sticklv = sign(keyboard_check(menu_down_key) + keyboard_check(menu_up_key));
		_confirm = keyboard_check_pressed(menu_confirm_key);
		_cancel = keyboard_check_pressed(menu_cancel_key);
		_rl = keyboard_check(menu_right_key) - keyboard_check(menu_left_key);
		_ud = keyboard_check(menu_down_key) - keyboard_check(menu_up_key);
		}
	
	//Scrolling
	if (_sticklv != 0 && Virtual_Button_Hold(vc, _position, VB.sticklv))
		{
		match_settings_current = modulo(match_settings_current + _ud, match_settings_length);
		}
	
	//Changing the settings
	if (_sticklh != 0 && Virtual_Button_Hold(vc, _position, VB.sticklh))
		{
		if (match_settings_current == 0)
			{
			setting().match_stock = modulo(setting().match_stock + _rl, 100);
			}
		else if (match_settings_current == 1)
			{
			setting().match_time = modulo(setting().match_time + _rl, 61);
			}
		else if (match_settings_current == 2)
			{
			stamina_index = modulo(stamina_index + _rl, array_length(possible_stamina_values));
			setting().match_stamina = possible_stamina_values[@ stamina_index];
			}
		}
		
	//Cancel
	if (_cancel || _confirm)
		{
		state = CSS_STATE.normal;
		state_timer = 0;
		match_settings_current = 0;
		match_settings_selector = noone;
		}
	#endregion
	}
	
//Virtual controllers
Virtual_Controllers_Update(vc);

state_timer++;