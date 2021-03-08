function css_ui_add_cpu_button_step() {
	ui_button_step();

	if (ui_clicked)
		{
		if (css_number_of_players() < max_players)
			{
			with(obj_css_ui)
				{
				var _index = index_counter;
				var _x = room_width div 2;
				var _y = room_height div 2;
				css_player_add(_index, true);
				css_player_set(_index, CSS_PLAYER.cpu_type, cpu_type);
				_x = 840 + irandom_range(-20, 20);
				_y = 184 + irandom_range(-20, 20);
				css_ui_token_add(index_counter, _x, _y, true);
				css_ui_refresh();
				index_counter++;
				}
			}
		}


}
