///@func UI_Cursor_Add
///@param index
///@param x
///@param y
function UI_Cursor_Add(argument0, argument1, argument2) {

	var _new = [];
	_new[UI_CURSOR.index] = argument0;
	_new[UI_CURSOR.x] = argument1;
	_new[UI_CURSOR.y] = argument2;
	_new[UI_CURSOR.clicked] = false; //clicked
	_new[UI_CURSOR.held_time] = 0; //held time

	with(obj_ui_runner)
		{
		ds_list_add(cursors, _new);
		return (ds_list_size(cursors) - 1);
		}


}
