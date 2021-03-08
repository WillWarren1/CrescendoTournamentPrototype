///Sets up the game state
function Game_Init() {
	//Randomize the Seed
	randomize();

	//Handle Saved Profiles
	Profile_Load_All();
	Profile_Clean_Auto();
	
	//Add in a Buffer for each Player
	for(var i = 0; i < max_players; i++)
		{
		var _buffer = buffer_create(1, buffer_grow, 1);
		ds_list_add(get_game_replay_list(), _buffer);
		}
	
	//Add the Replay List to the Data
	ds_map_add_list(get_replay_data(), "DATA", get_game_replay_list());

	//Global Particle System
	Part_System_Init();

	//Game Resizing
	surface_resize(application_surface, screen_width, screen_height);
	window_set_size(screen_width, screen_height);
	window_center();

	//Game Camera
	view_enabled[0] = true;
	view_visible[0] = true;
	view_wport[0] = screen_width;
	view_hport[0] = screen_height;
	view_camera[0] = get_game_camera();

	//Sound Volume
	audio_group_load(audiogroup_music);
	audio_group_load(audiogroup_sound_effects);
	audio_group_set_gain(audiogroup_music, setting().volume_music, 0);
	audio_group_set_gain(audiogroup_sound_effects, setting().volume_sound_effects, 0);
}