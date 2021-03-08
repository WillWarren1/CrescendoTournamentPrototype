///@func hitbox_create_magnetbox(rel_x,rel_y,xscale,yscale,damage,hitlag,goal_x,goal_y,magnet_time,lifetime,shape,hitbox_group,[relative]);
///@param rel_x
///@param rel_y
///@param xscale
///@param yscale
///@param damage
///@param hitlag
///@param goal_x
///@param goal_y
///@param magnet_time
///@param lifetime
///@param shape
///@param hitbox_group
///@param [relative]
function hitbox_create_magnetbox() {
	assert(argument_count >= 12, "Wrong number of arguments for hitbox_create_magnetbox! (", argument_count, ")");
	var _newhitbox = instance_create_layer(x + argument[0] * facing, y + argument[1], layer, obj_hitbox_magnetbox);
	with(_newhitbox)
		{
		image_xscale = argument[2];
		image_yscale = argument[3];
		damage = argument[4];
		base_hitlag = argument[5];
		magnet_goal_x = argument[6] * other.facing;
		magnet_goal_y = argument[7]
		state_frame = argument[8];
		lifetime = argument[9];
		hitbox_set_shape(id, argument[10]);
		owner = other.id;
		owner_xstart = other.x;
		owner_ystart = other.y;
		hitbox_group = argument[11];
		magnet_relative = argument_count > 12 ? argument[12] : false;
		facing = other.facing;
		}
	ds_list_add(my_hitboxes, _newhitbox);
	return _newhitbox;


}
