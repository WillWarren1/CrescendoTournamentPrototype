///@func ds_list_re_add(id,value,[start])
///@param id
///@param value
///@param [start]
///@desc Deletes a value from the list and adds it back to the end or the start.
function ds_list_re_add() {
	var _id = argument[0],
		_value = argument[1],
		_start = argument_count > 2 ? argument[0] : false;

	ds_list_delete(_id, ds_list_find_index(_id, _value));
	if (_start)
		{
		ds_list_insert(_id, 0, _value);
		}
	else
		{
		ds_list_add(_id, _value);
		}


}
