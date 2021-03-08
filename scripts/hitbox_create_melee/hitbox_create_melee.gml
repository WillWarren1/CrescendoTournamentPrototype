///@func hitbox_create_melee(rel_x,rel_y,xscale,yscale,damage,knockback,scaling,hitlag,angle,lifetime,shape,hitbox_group,[flipper]);
///@param rel_x
///@param rel_y
///@param xscale
///@param yscale
///@param damage
///@param knockback
///@param scaling
///@param hitlag
///@param angle
///@param lifetime
///@param shape
///@param hitbox_group
///@param [flipper]
function hitbox_create_melee() {
	assert(argument_count >= 12, "Wrong number of arguments for hitbox_create_grab! (", argument_count, ")");
	var _newhitbox = instance_create_layer(x + argument[0] * facing, y + argument[1], layer, obj_hitbox_melee);
	with(_newhitbox)
		{
		image_xscale = argument[2];
		image_yscale = argument[3];
		damage = argument[4];
		base_knockback = argument[5];
		knockback_scaling = argument[6];
		base_hitlag = argument[7];
		angle = argument[8];
		grounded_angle = angle;
		lifetime = argument[9];
		hitbox_set_shape(_newhitbox, argument[10]);
		owner = other.id;
		owner_xstart = other.x;
		owner_ystart = other.y;
		hitbox_group = argument[11];
		angle_flipper = argument_count > 12 ? argument[12] : FLIPPER.standard;
		drawing_angle = owner.facing == -1 ? 180 - angle : angle;
		facing = other.facing;
		}
	ds_list_add(my_hitboxes, _newhitbox);
	return _newhitbox;


}
