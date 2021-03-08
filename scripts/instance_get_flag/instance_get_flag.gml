///@func instance_get_flag(id,flag_index)
///@param id
///@param flag_index
function instance_get_flag(argument0, argument1) {
	if (instance_exists(argument0))
		{
		return argument0.flags & (1 << argument1);
		}
	return false;


}
