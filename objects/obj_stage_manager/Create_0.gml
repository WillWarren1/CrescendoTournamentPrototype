/// @description Stage Features
if (only_one()) then exit;

#region Initialize variables
background = [back_clear];
stage_script = -1;
BPM = -1;
music = -1;
music_intro_pos = 0;
music_loop_pos = 0;
setting().daynight_cycle_enable = false;
setting().daynight_cycle_outline_change = false;
setting().slope_collisions_enable = true;
audio_stop_all();
#endregion

//Stage-specific values
switch(room)
	{
	case rm_Campground:
		background = 
			[
			background_define_script(back_campground_distant, 0, 0, 2, 0, 0, 0, 0, false, 0, stage_campground_distant_draw),		
			background_define(back_campground_trees1, 0, 32, 2, 0.3, 0.3),
			background_define(back_campground_trees2, 0, 96, 2, 0.5, 0.5),
			background_define(back_campground_trees3, 0, 132, 2, 0.7, 0.7),
			back_clear,
			];
		stage_script = -1;
		stage_set_music(song_forest);
		setting().daynight_cycle_enable = true;
		setting().daynight_cycle_outline_change = true;
		setting().slope_collisions_enable = false;
		break;
		
	case rm_Large_Campground:
		background = 
			[
			background_define_script(back_campground_distant, 0, 0, 2, 0, 0, 0, 0, false, 0, stage_campground_distant_draw),
			background_define(back_campground_trees1, 0, 64, 2, 0.1, 0.1),
			background_define(back_campground_trees2, 0, 118, 2, 0.2, 0.3),
			background_define(back_campground_trees3, 0, 158, 2, 0.5, 0.5),
			back_clear,
			background_define(back_campground_flowers, 856, 704, 2, 0, 0, 0, 0, true, 0.1),
			];
		stage_script = -1;
		stage_set_music(song_forest);
		setting().daynight_cycle_enable = true;
		setting().daynight_cycle_outline_change = true;
		setting().slope_collisions_enable = false;
		break;
		
	case rm_Peak:
		background = 
			[
			background_define(back_peak_distant, 0, 0, 2, 0, 0),
			background_define(back_peak_moon, 0, 0, 2, 0.1, 0.1),
			background_define(back_peak_mountains, 0, 0, 2, 0.2, 0.2),
			background_define(back_peak_clouds, 0, 0, 2, 0.3, 0.3),
			background_define(back_peak_crystals, 0, 75, 2, 0.4, 0.4),
			background_define(back_peak_ice, 0, 75, 2, 0.5, 0.4),
			back_clear,
			];
		stage_script = stage_peak_snow;
		stage_set_music(song_snow, 25.425, 94.588);
		setting().slope_collisions_enable = false;
		break;
		
	case rm_Battlefield:
		background = 
			[
			background_define(back_battlefield_distant, 0, 0, 2, 0, 0),
			background_define(back_battlefield_stone, 0, 50, 2, 0.3, 0.2),
			background_define(back_battlefield_clouds, 0, 75, 2, 0.5, 0.3),
			back_clear,
			];
		stage_script = -1;
		BPM = 180
		//instance_create_layer()
		stage_set_music(song_battlefield, 56.0, 120.0);
		break;
		
	default:
		log("The current stage does not have any stage specific values in obj_stage_manager.");
		break;
	}
	
half_room_width = room_width / 2;
half_room_height = room_height / 2;

//Special Effects
background_clear_frame = 0;
background_clear_amount = 0;
background_clear_fade_speed = 1;
background_clear_color = c_white;
uni_black = shader_get_uniform(shd_fade, "fade_amount");

//Layer fade for all layers that start with "asset"
var _lay = layer_get_all();
for(var i = 0; i < array_length(_lay); i++)
	{
	if (string_count("Asset", layer_get_name(_lay[i])) > 0)
		{
		layer_script_begin(_lay[i], Layer_Fade_Begin);
		layer_script_end(_lay[i], Layer_Fade_End);
		}
	}