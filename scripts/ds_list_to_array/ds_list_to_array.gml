///@func ds_list_to_array(list)
///@param list
function ds_list_to_array() {
	var _l = argument[0];
	var _a = array_create(ds_list_size(_l));
	for(var i = 0; i < ds_list_size(_l); i++)
		{
		_a[@ i] = _l[| i];
		}
	return _a;


}
