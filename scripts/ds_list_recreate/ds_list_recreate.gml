///@func ds_list_recreate(list,array_of_values)
///@param list
///@param array_of_values
function ds_list_recreate(argument0, argument1) {

	var _list = argument0;
	var _array = argument1;

	ds_list_clear(_list);

	for(var i = 0; i < array_length(_array); i++)
		{
		ds_list_add(_list, _array[i]);
		}


}
