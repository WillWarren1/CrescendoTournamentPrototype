/// @description
offset = 100;

character = Player_Data_Get(engine().win_screen_player, PLAYER_DATA.character);
name = character_data_get(character, CHARACTER_DATA.name);
palette = character_data_get(character, CHARACTER_DATA.palette);
color_index = Player_Data_Get(engine().win_screen_player, PLAYER_DATA.color);
color = palette_color_get(character_data_get(character, CHARACTER_DATA.palette_data), 0, color_index);
render = character_data_get(character, CHARACTER_DATA.render);

palette_shader_simple_init();

//Replays
can_save_replay = setting().replay_record;

//Voronoi
var _r = color_get_red	(color) / $FF;
var _g = color_get_green(color) / $FF;
var _b = color_get_blue	(color) / $FF;
var _d = 0.3;

Voronoi_Change_Color
	(
	[_r - random(_d), _r + random(_d)],
	[_g - random(_d), _g + random(_d)], 
	[_b - random(_d), _b + random(_d)],
	);
	
//Play the victory theme
audio_stop_all();
audio_play_sound(character_data_get(character, CHARACTER_DATA.music), 0, false);