///@func hitbox_group_reset_all([hitbox_groups_array])
///@param [hitbox_groups_array]
function hitbox_group_reset_all() {
	//Loops through all nested arrays and clears them
	var _groups = argument_count > 0 ? argument[0] : hitbox_groups;
	for(var i = 0; i < array_length( _groups); i++)
		{
		array_resize(_groups[@ i], 0);
		}


}
