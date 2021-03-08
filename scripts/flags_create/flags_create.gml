///@func flag_create(flags...)
///@param flags...
function flags_create() {
	var _f = 0;
	for(var i = 0; i < argument_count; i++)
		{
		_f = _f | (1 << argument[i]);
		}
	return _f;


}
