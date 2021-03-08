function sss_ui_back_button_step() {
	ui_button_step();

	if (ui_clicked)
		{
		room_goto_previous();
		}


}
