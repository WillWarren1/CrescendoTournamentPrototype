///@func UI_Cursor_Delete_All
function UI_Cursor_Delete_All() {

	with(obj_ui_runner)
		{
		ds_list_clear(cursors);
		return true;
		}
	return false;


}
