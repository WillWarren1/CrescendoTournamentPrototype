/// @description
image_speed = 1;
image_xscale = 2;
image_yscale = 2;

//Flush all loaded textures
draw_texture_flush();
gc_collect();
gc_target_frame_time(250);

textures_needed = [];
current_texture = 0;
load_time = 15;

//Game textures
array_push(textures_needed, "texture_gameplay");
array_push(textures_needed, "texture_vfx");

//Characters
array_push(textures_needed, "texture_moves");
for(var i = 0; i < engine().number_of_players; i++)
	{
	var _char = Player_Data_Get(i, PLAYER_DATA.character);
	var _textures = character_data_get(_char, CHARACTER_DATA.texture_groups);
	if (!is_undefined(_textures) && is_array(_textures))
		{
		for(var m = 0; m < array_length(_textures); m++)
			{
			if (!array_contains(textures_needed, _textures[@ m]))
				{
				array_push(textures_needed, _textures[@ m]);
				}
			}
		}
	}

//Stage textures
switch(setting().match_stage)
	{
	case rm_Campground:
	case rm_Large_Campground:
		array_push(textures_needed, "texture_campgrounds");
		break;
	case rm_Battlefield:
		array_push(textures_needed, "texture_battlefield");
		break;
	case rm_Peak:
		array_push(textures_needed, "texture_peak");
		break;
	}
	
//Stop sounds
audio_stop_all();