///@func array_contains(array,value)
///@param array
///@param value
///@desc Returns true if the value is in the array.
function array_contains(_a, _v) {
	for(var i = 0; i < array_length(_a); i++)
		{
		if (_a[i] == _v)
			{
			return true;
			}
		}
	return false;
}