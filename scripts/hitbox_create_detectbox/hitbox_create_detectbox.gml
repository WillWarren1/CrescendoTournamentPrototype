///@func hitbox_create_detectbox(rel_x,rel_y,xscale,yscale,lifetime,shape,hitbox_group,[detect_script]);
///@param rel_x
///@param rel_y
///@param xscale
///@param yscale
///@param lifetime
///@param shape
///@param hitbox_group
///@param [detect_script]
function hitbox_create_detectbox() {
	assert(argument_count >= 7, "Wrong number of arguments for hitbox_create_detectbox! (", argument_count, ")");
	var _newhitbox = instance_create_layer(x + argument[0] * facing, y + argument[1], layer, obj_hitbox_detectbox);
	with(_newhitbox)
		{
		image_xscale = argument[2];
		image_yscale = argument[3];
		lifetime = argument[4];
		hitbox_set_shape(_newhitbox, argument[5]);
		owner = other.id;
		owner_xstart = other.x;
		owner_ystart = other.y;
		hitbox_group = argument[6];
		facing = other.facing;
		detect_script = argument_count > 7 ? argument[7] : -1;
		}
	ds_list_add(my_hitboxes, _newhitbox);
	return _newhitbox;
}