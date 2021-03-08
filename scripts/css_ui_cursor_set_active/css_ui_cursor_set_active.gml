///@func css_ui_cursor_set_active(index,active)
///@param index
///@param active
function css_ui_cursor_set_active(argument0, argument1) {

	with(obj_css_ui)
		{
		for(var i = 0; i < ds_list_size(cursors); i++)
			{
			var _cursor = cursors[| i];
			if (_cursor[CSS_CURSOR.index] == argument0)
				{
				_cursor[@ CSS_CURSOR.active] = argument1;
				return true;
				}
			}
		}
	return false;
}