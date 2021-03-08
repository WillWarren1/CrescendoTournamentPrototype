function css_ui_replays_button_step() {
	ui_button_step();

	if (ui_clicked)
		{
		with(obj_css_ui)
			{
			if (state == CSS_STATE.normal)
				{
				state = CSS_STATE.replays;
				state_timer = 0;
				replay_current = 0;
				replay_scroll = 0;
				var _selector;
				for(var i = 0; i < ds_list_size(cursors); i++)
					{
					var _cursor = cursors[| i];
					var _index = _cursor[CSS_CURSOR.index];
					if (_index == other.ui_cursor_index)
						{
						_selector = i;
					
						//The cursor that clicked on the button gets reset
						UI_Cursor_Set(_index, UI_CURSOR.clicked, false);
						break;
						}
					}
				replay_selector = _selector;
				}
			}
		}


}
