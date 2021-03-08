function css_ui_player_name_button_step() {
	ui_button_step();

	if (ui_clicked)
		{
		with(obj_css_player_window)
			{
			if (index == other.index)
				{
				state = CSS_PLAYER_WINDOW_STATE.select_profile;
			
				//The cursor that clicked on the button gets reset
				UI_Cursor_Set(index, UI_CURSOR.clicked, false);
			
				//Make the cursor inactive
				css_ui_cursor_set_active(index, false);
				break;
				}
			}
		}


}
