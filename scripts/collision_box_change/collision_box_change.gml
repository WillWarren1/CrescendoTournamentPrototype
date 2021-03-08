///@func collision_box_change([mask_sprite])
///@param [mask_sprite]
///@desc Change the collision mask of a player
function collision_box_change() {
	mask_index = argument_count > 0 ? argument[0] : collision_box;
	move_out_of_blocks(90);


}
