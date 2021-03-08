/*
- This script does not need to be run
*/
#region Constant
/*
- Cannot be changed during gameplay
*/
//Version Number
#macro version							"Beta 0.7.1"

//Savefiles
#macro profiles_save					"profiles.sav"

//Replays
#macro replay_sync_mode					true //whether to save extra data in replays to catch desyncs or not

//Profile Names
#macro profile_name_max_length			12

//Number of Gamepads Supported
#macro number_of_devices				14

//Number of Keyboards Supported (you need an extension to support more than 1!)
#macro number_of_keyboards				1

//Hitbox Groups
#macro hitbox_groups_max				4

//Global Collision List
function get_temp_list() {
	static _list = ds_list_create();
	return _list;
}

//Global Replay Data
function get_replay_data() {
	static _map = ds_map_create();
	return _map;
}

//Global Game Replay List
function get_game_replay_list() {
	static _list = ds_list_create();
	return _list;
}

//Global Game Camera
function get_game_camera() {
	static _cam = camera_create_view(0, 0, camera_start_width, camera_start_height);
	return _cam;
}

#endregion

#region Variable
/*
- Can be changed during gameplay
- Values here are the DEFAULT values ONLY
- Access using engine().property syntax
*/
function engine() {
	static _properties = {
		profiles :						ds_list_create(),
		win_screen_player :				-1, //Number of the player who won		
		players :						array_create(max_players),
		number_of_players :				0,
		css_token_positions :			array_create(max_players),
	};
	return _properties;
}

#endregion

#region (DO NOT CHANGE)
/*
- There should be no reason to change these values
*/
//Background
#macro back_clear						[-1]

//Control Stick
#macro Lstick							0
#macro Rstick							1

//Events
#macro Game_Event_Step					0
#macro Game_Event_Paused				1
#macro Game_Event_Draw					2

//Buffer Customs
#macro buffer_custom_undefined			-1
#macro buffer_custom_array				-2
#macro buffer_custom_list				-3
#macro buffer_custom_map				-4
#macro buffer_custom_struct				-5

#endregion