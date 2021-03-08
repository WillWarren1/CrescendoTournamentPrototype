function sss_ui_music_button_step() {
	ui_button_step();

	text = "Music Volume - " + string(setting().volume_music * 100) + "%";

	if (ui_clicked)
		{
		if (setting().volume_music == 1)
			{
			setting().volume_music = 0;
			}
		else if (setting().volume_music == 0)
			{
			setting().volume_music = 0.5;
			}
		else
			{
			setting().volume_music = 1;
			}
		}
}