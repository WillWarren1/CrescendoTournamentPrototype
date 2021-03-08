///@func instance_set_flag(id,flag_index,bool)
///@param id
///@param flag_index
///@param bool
function instance_set_flag() {
	var _id = argument[0];
	var _f = argument[1];
	var _b = argument[2];
	with(_id)
		{
		flags = _b ? flags | (1 << _f) : flags & ~(1 << _f);
		}


}
