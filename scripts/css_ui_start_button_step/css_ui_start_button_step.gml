function css_ui_start_button_step() {
	ui_button_step();

	if (ui_clicked)
		{
		with(obj_css_ui)
			{
			if (state == CSS_STATE.normal)
				{
				css_start_game();
				}
			}
		}
	
	//Colors
	if (obj_css_ui.state == CSS_STATE.normal && css_number_of_players() >= 2)
		{
		color_normal = make_color_hsv(105, 138 + (sin(current_time / 100) * 10), 178 + (sin(current_time / 200) * 5));
		color_hover = make_color_hsv(105, 200 + (sin(current_time / 100) * 10), 200 + (sin(current_time / 200) * 10));
		color_clicked = $7FB252;
		}
	else
		{
		color_normal = $444444;
		color_hover = $666666;
		color_clicked = $888888;
		}


}
