function sss_ui_sfx_button_step() {
	ui_button_step();

	text = "Sound Effects Volume - " + string(setting().volume_sound_effects * 100) + "%";

	if (ui_clicked)
		{
		if (setting().volume_sound_effects == 1)
			{
			setting().volume_sound_effects = 0;
			}
		else if (setting().volume_sound_effects == 0)
			{
			setting().volume_sound_effects = 0.5;
			}
		else
			{
			setting().volume_sound_effects = 1;
			}
		}


}
