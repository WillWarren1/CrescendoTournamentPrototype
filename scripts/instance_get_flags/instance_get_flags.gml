///@func instance_get_flags(id)
///@param id
function instance_get_flags(argument0) {
	if (instance_exists(argument0))
		{
		return argument0.flags;
		}
	return 0;


}
