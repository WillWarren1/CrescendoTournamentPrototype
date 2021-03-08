/// @description
#region Buttons
//Clear variables
with(obj_ui_button)
	{
	ui_clicked = false;
	ui_hovered = false;
	ui_click_hold = false;
	ui_cursor_index = -1;
	}

//Cursor collisions
for(var i = 0; i < ds_list_size(cursors); i++)
	{
	var _cursor = cursors[| i];
	var _x = _cursor[UI_CURSOR.x];
	var _y = _cursor[UI_CURSOR.y];
	var _clicked = _cursor[UI_CURSOR.clicked];
	var _held = _cursor[UI_CURSOR.held_time];
	var _index = _cursor[UI_CURSOR.index];
	
	ds_list_clear(ui_col_list);
	if (collision_point_list(_x, _y, obj_ui_button, false, true, ui_col_list, false))
		{
		//Object with the lowest depth counts as being hovered
		var _lowest = ui_col_list[| 0];
		var _lowest_depth = _lowest.ui_depth;
		for(var m = 1; m < ds_list_size(ui_col_list); m++)
			{
			var _ui = ui_col_list[| i];
			if (_ui.ui_depth <= _lowest_depth)
				{
				_lowest_depth = _ui.ui_depth;
				_lowest = _ui;
				}
			}
			
		//Cursor Number Check
		with(_lowest)
			{
			ui_cursor_index = _index;
			
			if (ui_cursor_index == index || ui_cursor_index == -1 || anyone_can_interact)
				{
				//Hover script
				ui_hovered = true;
			
				//Click script
				if (_clicked)
					{
					ui_clicked = true;
					}
				if (_held > 0)
					{
					ui_click_hold = true;
					}
				}
			}
		}
	}
#endregion
//Step script
with(obj_ui_parent)
	{
	if (script_exists(ui_script_step)) then script_execute(ui_script_step);
	}