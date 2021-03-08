///@func UI_Cursor_Delete(index)
///@param index
function UI_Cursor_Delete(argument0) {

	with(obj_ui_runner)
		{
		for(var i = 0; i < ds_list_size(cursors); i++)
			{
			var _cursor = cursors[| i];
			if (_cursor[UI_CURSOR.index] == argument0)
				{
				ds_list_delete(cursors, i);
				return true;
				}
			}
		}
	return false;


}
