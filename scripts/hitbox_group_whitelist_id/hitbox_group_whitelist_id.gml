///@func hitbox_group_whitelist_id(id, group, [hitbox_groups_array])
///@param id
///@param group
///@param [hitbox_groups_array]
function hitbox_group_whitelist_id() {

	var _id = argument[0];
	var _group = argument[1];
	var _array = argument_count > 2 ? argument[2] : hitbox_groups;

	array_push(_array[@ _group], _id);


}
