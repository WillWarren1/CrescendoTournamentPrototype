///@func UI_Cursor_Clicked
///@param index
function UI_Cursor_Clicked(argument0) {

	with(obj_ui_runner)
		{
		for(var i = 0; i < ds_list_size(cursors); i++)
			{
			var _cursor = cursors[| i];
			if (_cursor[UI_CURSOR.index] == argument0)
				{
				return _cursor[UI_CURSOR.clicked];
				}
			}
		}
	return undefined;


}
