///@func hitbox_move_attached_group(group_number,relative_x,relative_y,[hitbox_list])
///@param group_number
///@param relative_x
///@param relative_y
///@param [hitbox_list]
function hitbox_move_attached_group() {
	//Moves all hitboxes within the given group relative to their positions.
	//It also moves the hitboxes' "my_xstart" and "my_ystart" so the hitboxes don't snap back to the player
	//Loop through all hitbox instances
	var _list = argument_count > 3 ? argument[3] : my_hitboxes;
	for(var i = 0; i < ds_list_size(_list); i++)
		{
		var _hitbox = _list[|i];
		if (_hitbox.hitbox_group == argument[0])
			{
			with(_hitbox)
				{
				x += argument[1];
				y += argument[2];
				owner_xstart -= argument[1];
				owner_ystart -= argument[2];
				}
			}
		}
	
	/*
	with(obj_hitbox_attached)
		{
		if (hitbox_group==argument0 && owner==argument1)
			{
			x+=argument2;
			y+=argument3;
			owner_xstart+=argument2;
			owner_xstart+=argument3;
			}
		}
	//*/


}
