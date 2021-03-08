///@func css_ui_cursor_delete
///@param index
function css_ui_cursor_delete(argument0) {

	with(obj_css_ui)
		{
		for(var i = 0; i < ds_list_size(cursors); i++)
			{
			var _cursor = cursors[| i];
			if (_cursor[CSS_CURSOR.index] == argument0)
				{
				ds_list_delete(cursors, i);
				return true;
				}
			}
		}
	return false;


}
