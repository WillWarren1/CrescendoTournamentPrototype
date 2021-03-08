///@func hitbox_group_reset(group_number,[hitbox_groups_array])
///@param group_number
///@param [hitbox_groups_array]
function hitbox_group_reset() {
	//Clears a single hitbox group array
	var _groups = argument_count > 1 ? argument[1] : hitbox_groups;
	array_resize(_groups[@ argument[0]], 0);


}
