///@func UI_Cursor_Update
///@param index
///@param x
///@param y
///@param relative
///@param held
function UI_Cursor_Update(argument0, argument1, argument2, argument3, argument4) {

	with(obj_ui_runner)
		{
		for(var i = 0; i < ds_list_size(cursors); i++)
			{
			var _cursor = cursors[| i];
			if (_cursor[UI_CURSOR.index] == argument0)
				{
				//Position
				if (argument3)
					{
					_cursor[@ UI_CURSOR.x] = (_cursor[UI_CURSOR.x] + argument1);
					_cursor[@ UI_CURSOR.y] = (_cursor[UI_CURSOR.y] + argument2);
					}
				else
					{
					_cursor[@ UI_CURSOR.x] = argument1;
					_cursor[@ UI_CURSOR.y] = argument2;
					}
	
				//Clicked / Held
				if (argument4)
					{
					if (_cursor[UI_CURSOR.held_time] == 0)
						{
						_cursor[@ UI_CURSOR.clicked] = true;
						}
					else
						{
						_cursor[@ UI_CURSOR.clicked] = false;
						}
					_cursor[@ UI_CURSOR.held_time] = _cursor[UI_CURSOR.held_time] + 1;
					}
				else
					{
					_cursor[@ UI_CURSOR.clicked] = false;
					_cursor[@ UI_CURSOR.held_time] = 0;
					}
				}
			}
		}
}