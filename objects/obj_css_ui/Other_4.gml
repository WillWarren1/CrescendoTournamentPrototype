/// @description
cursors = ds_list_create();
tokens = ds_list_create();
controller_connected = array_create(number_of_devices, false);
keyboard_connected = array_create(number_of_keyboards, false);

group_start_number = 10; //make sure the UI group doesn't overlap with anything else!
index_counter = 0;

state = CSS_STATE.normal;
state_timer = 0;

replay_list_x = room_width;
replay_list = Replays_Scan();
replay_current = 0;
replay_scroll = 0;
replay_list_display_size = 19;
replay_selector = noone;

match_settings_y = -288;
match_settings_length = 5;
match_settings_current = 0;
match_settings_selector = noone;

cpu_type = CPU_TYPE.attack;

stamina_index = 0;
possible_stamina_values = [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 150, 200, 250, 300, 400, 500, 600, 700, 800, 900, 999];

vc = Virtual_Controllers_Create();

Voronoi_Change_Color([0.32, 0.32], [0.698, 0.698], [0.498, 0.498]);

css_debug_mode = false;

//Menu music
if (!audio_is_playing(song_menu)) {
	audio_stop_all();
	audio_play_sound(song_menu, 0, true);
}

#region Replay Mode
if (setting().replay_mode)
	{
	//Clear the data
	setting().replay_mode = false;
	setting().replay_record = true;
	engine().number_of_players = 0;
	Profile_Clean_Auto();
	}
#endregion
#region Load in Player data from the last match
if (engine().number_of_players > 0)
	{
	for(var i = 0; i < engine().number_of_players; i++)
		{
		var _play = engine().players[i];
		var _is_cpu = _play[PLAYER_DATA.is_cpu];
		var _cpu_type = _play[PLAYER_DATA.cpu_type];
		var _device = _play[PLAYER_DATA.device];
		var _device_type = _play[PLAYER_DATA.device_type];
		var _color = _play[PLAYER_DATA.color];
		var _profile = _play[PLAYER_DATA.profile];
		//Add the player to the CSS Data
		css_player_add
			(
			index_counter, 
			_is_cpu, 
			_device,
			_device_type,
			_profile,
			);
		css_player_set(index_counter, CSS_PLAYER.color, _color);
		css_player_set(index_counter, CSS_PLAYER.profile, _profile);
		css_player_set(index_counter, CSS_PLAYER.cpu_type, _cpu_type);
		//Random Character
		if (_play[PLAYER_DATA.is_random])
			{
			for(var m = 0; m < character_count(); m++)
				{
				if (character_data_get(m, CHARACTER_DATA.name) == "Random")
					{
					css_player_set(index_counter, CSS_PLAYER.character, m);
					break;
					}
				}
			}
		else
			{
			css_player_set(index_counter, CSS_PLAYER.character, _play[PLAYER_DATA.character]);
			}
		//Connect device / Cursors
		if (!_is_cpu)
			{
			var _x = room_width div 2;
			var _y = room_height div 2;
			if (_device_type == DEVICE.controller)
				{
				controller_connected[@ _device] = true;
				//Add the CSS cursor
				css_ui_cursor_add(index_counter, _x, _y, _device, _device_type, false, false);
				}
			else if (_device_type == DEVICE.keyboard)
				{
				//log("Device :", _device);
				keyboard_connected[@ _device] = true;
				//Add the CSS cursor
				css_ui_cursor_add(index_counter, _x, _y, _device, _device_type, false, false);
				}
			}
		//Token position
		var _position = engine().css_token_positions[i];
		css_ui_token_add(index_counter, _position[0], _position[1], _is_cpu);
		index_counter++;
		}
	//Refresh the UI
	css_ui_refresh();
	}
#endregion