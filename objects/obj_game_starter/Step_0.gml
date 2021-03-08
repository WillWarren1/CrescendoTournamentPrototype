/// @description
if (image_index > 16 && !played_sound)
	{
	played_sound = true;
	audio_play_sound(snd_logo_click, 0, false);
	}

//if (keyboard_check_pressed(vk_anykey)) then image_speed = 1;