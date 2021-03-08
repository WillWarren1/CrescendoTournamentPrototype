///@func hitbox_create_windbox(rel_x,rel_y,xscale,yscale,damage,knockback,angle,lifetime,shape,hitbox_group,[flipper],[multihit],[accelerate],[push],[max_speed],[lift]);
///@param rel_x
///@param rel_y
///@param xscale
///@param yscale
///@param damage
///@param knockback
///@param angle
///@param lifetime
///@param shape
///@param hitbox_group
///@param [flipper]
///@param [multihit]
///@param [accelerate]
///@param [push]
///@param [max_speed]
///@param [lift]
function hitbox_create_windbox() {
	assert(argument_count >= 10, "Wrong number of arguments for hitbox_create_windbox! (", argument_count, ")");
	var _newhitbox = instance_create_layer(x + argument[0] * facing, y + argument[1], layer, obj_hitbox_windbox);
	with(_newhitbox)
		{
		image_xscale = argument[2];
		image_yscale = argument[3];
		damage = argument[4];
		base_knockback = argument[5];
		angle = argument[6];
		grounded_angle = angle;
		lifetime = argument[7];
		hitbox_set_shape(_newhitbox, argument[8]);
		owner = other.id;
		owner_xstart = other.x;
		owner_ystart = other.y;
		hitbox_group = argument[9];
		angle_flipper = argument_count > 10 ? argument[10] : FLIPPER.standard;
		drawing_angle = owner.facing == -1 ? 180 - angle : angle;
		windbox_multihit = argument_count > 11 ? argument[11] : false;
		windbox_accelerate = argument_count > 12 ? argument[12] : true;
		windbox_push = argument_count > 13 ? argument[13] : false;
		windbox_max_speed = argument_count > 14 ? argument[14] : 5;
		windbox_lift = argument_count > 15 ? argument[15] : false;
		facing = other.facing;
		}
	ds_list_add(my_hitboxes, _newhitbox);
	return _newhitbox;


}
