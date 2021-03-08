///@func css_ui_cursor_add(index,x,y,device,device_type,is_cpu,[is_holding])
///@param index
///@param x
///@param y
///@param device
///@param device_type
///@param is_cpu
///@param [is_holding]
function css_ui_cursor_add() {

	var _new = [];
	_new[CSS_CURSOR.index] = argument[0];
	_new[CSS_CURSOR.device] = argument[3];
	_new[CSS_CURSOR.device_type] = argument[4];
	_new[CSS_CURSOR.holding] = (argument_count > 6 && !argument[6] ? noone : argument[0]);
	_new[CSS_CURSOR.is_cpu] = argument[5];
	_new[CSS_CURSOR.active] = true;
	if (!argument[5])
		{
		UI_Cursor_Add(argument[0], argument[1], argument[2]);
		}
	ds_list_add(obj_css_ui.cursors, _new);
	return (ds_list_size(obj_css_ui.cursors) - 1);
}