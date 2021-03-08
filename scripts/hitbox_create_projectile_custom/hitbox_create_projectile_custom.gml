///@func hitbox_create_projectile_custom(object,rel_x,rel_y,xscale,yscale,damage,knockback,scaling,angle,lifetime,shape,hsp,vsp,[flipper]);
///@param object
///@param rel_x
///@param rel_y
///@param xscale
///@param yscale
///@param damage
///@param knockback
///@param scaling
///@param angle
///@param lifetime
///@param shape
///@param hsp
///@param vsp
///@param [flipper]
///@desc Creates a custom object but initializes it like a projectile.
function hitbox_create_projectile_custom() {
	assert(argument_count >= 13, "Wrong number of arguments for hitbox_create_projectile_custom! (", argument_count, ")");
	var _newhitbox = instance_create_layer(x + argument[1] * facing, y + argument[2], layer, argument[0]);
	with(_newhitbox)
		{
		image_xscale = argument[3];
		image_yscale = argument[4];
		damage = argument[5];
		base_knockback = argument[6];
		knockback_scaling = argument[7];
		angle = argument[8];
		grounded_angle = angle;
		lifetime = argument[9];
		shape = argument[10];
		owner = other.id;
		facing = other.facing;
		hsp = argument[11] * other.facing;
		vsp = argument[12];
		angle_flipper = argument_count > 13 ? argument[13] : FLIPPER.standard;
		drawing_angle = owner.facing == -1 ? 180 - angle : angle;
		}
	return _newhitbox;


}
