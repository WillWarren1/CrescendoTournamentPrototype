///@func hitbox_attached_group_has_hit(group,[hitbox_list],[count_blocked],[only_blocked])
///@desc Checks if any hitbox in the group has collided
///@param group
///@param [hitbox_list]
///@param [count_blocked]
///@param [only_blocked]
function hitbox_attached_group_has_hit() {
	//Loop through all attached hitbox instances
	var _list = argument_count > 1 ? argument[1] : my_hitboxes;
	var _count_blocked = argument_count > 2 ? argument[2] : false;
	var _only_blocked = argument_count > 3 ? true : false;

	for(var i = 0; i < ds_list_size(_list); i++)
		{
		var _hitbox = _list[|i];
		if (_hitbox.hitbox_group == argument[0])
			{
			if (_count_blocked)
				{
				if (_only_blocked) then return _hitbox.has_been_blocked;
				else return _hitbox.has_hit || _hitbox.has_been_blocked;
				}
			else return _hitbox.has_hit;
			}
		}


}
