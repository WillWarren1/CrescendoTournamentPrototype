function css_ui_player_playtest_button_step() {
	ui_button_step();

	if (ui_clicked)
		{
		with(obj_css_player_window)
			{
			if (index == other.index)
				{
				state = CSS_PLAYER_WINDOW_STATE.playtesting;
				break;
				}
			}
		}


}
