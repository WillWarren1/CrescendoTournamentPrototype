///@func collision(x, y, [flags], [array], [obj])
///@param x
///@param y
///@param [flags]
///@param [array]
///@param [obj]
function collision() {
	var _x = argument[0];
	var _y = argument[1];
	var _f = argument_count > 2 ? argument[2] : 0;
	var _a = argument_count > 3 ? argument[3] : false;
	var _o = argument_count > 4 ? argument[4] : obj_collidable;
	var _list = get_temp_list();

	//Clear the list
	ds_list_clear(_list);

	//Populate the list with instance ids
	var _size = instance_place_list(_x, _y, _o, _list, true);
	if (_size > 0)
		{
		if (_a)
			{
			if (_f == 0)
				{
				var _array = array_create(_size, noone);
				//Make an array of the list
				for(var i = 0; i < _size; i++)
					{
					_array[i] = _list[| i];
					}
				return _array;
				}
			else
				{
				var _array = [];
				//Make an array of the items in the list that have the correct flags
				for(var i = 0; i < _size; i++)
					{
					var _inst = _list[| i];
					if (_f & _inst.flags == _f)
						{
						_array[array_length(_array)] = _inst;
						}
					}
				return _array;
				}
			}
		else
			{
			if (_f == 0)
				{
				//Return one of the instances from the list
				var _inst = _list[| 0];
				return _inst;
				}
			else
				{
				//Return the first instance to have the correct flags
				for(var i = 0; i < _size; i++)
					{
					var _inst = _list[| i];
					if (_f & _inst.flags == _f)
						{
						return _inst;
						}
					}
				return noone;
				}
			}
		}
	else
		{
		//Return either a blank array or noone
		return _a ? [] : noone;
		}


}
