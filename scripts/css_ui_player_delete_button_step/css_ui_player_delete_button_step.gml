function css_ui_player_delete_button_step() {
	ui_button_step();

	if (ui_clicked)
		{
		with(obj_css_ui)
			{
			var _index = other.index;
			if (css_debug_mode) then log("Index: ", _index);
			var _device = css_player_get(_index, CSS_PLAYER.device);
			var _device_type = css_player_get(_index, CSS_PLAYER.device_type);
			if (css_debug_mode) then log("Device:", _device);
			//Delete the player
			css_player_delete(_index);
			//Delete player UI
			ui_group_delete(other.group);
			//Disconnect the controller
			if (_device != -1)
				{
				if (_device_type == DEVICE.controller)
					{
					controller_connected[@ _device] = false;
					}
				if (_device_type == DEVICE.keyboard)
					{
					keyboard_connected[@ _device] = false;
					}
				}
			//Delete CSS Cursor
			css_ui_cursor_delete(_index);
			//Delete UI Cursor
			UI_Cursor_Delete(_index);
			//Delete UI Token
			css_ui_token_delete(_index);
			//Refresh the UI
			css_ui_refresh();
			}
		}
}