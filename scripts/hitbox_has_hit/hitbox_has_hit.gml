///@func hitbox_has_hit(id,[count_blocked],[only_blocked])
///@desc Checks if the given hitbox has hit something yet or not
///@param id
///@param [count_blocked]
///@param [only_blocked]
function hitbox_has_hit() {
	//Find the hitbox
	var _count_blocked = argument_count > 1 ? argument[1] : false;
	var _only_blocked = argument_count > 2 ? true : false;

	if (instance_exists(argument[0]))
		{
		if (_count_blocked)
			{
			if (_only_blocked) then return argument[0].has_been_blocked;
			else return argument[0].has_hit || argument[0].has_been_blocked;
			}
		else return argument[0].has_hit;
		}
	return false;


}
