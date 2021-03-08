///@func hitbox_create_projectile(rel_x,rel_y,xscale,yscale,damage,base_kb,kb_scaling,angle,lifetime,shape,hsp,vsp,[flipper]);
///@param rel_x
///@param rel_y
///@param xscale
///@param yscale
///@param damage
///@param base_kb
///@param kb_scaling
///@param angle
///@param lifetime
///@param shape
///@param hsp
///@param vsp
///@param [flipper]
function hitbox_create_projectile() {
	assert(argument_count >= 12, "Wrong number of arguments for hitbox_create_projectile! (", argument_count, ")");
	var _newhitbox = instance_create_layer(x + argument[0] * facing, y + argument[1], layer, obj_hitbox_projectile);
	with(_newhitbox)
		{
		image_xscale = argument[2];
		image_yscale = argument[3];
		damage = argument[4];
		base_knockback = argument[5];
		knockback_scaling = argument[6];
		angle = argument[7];
		grounded_angle = angle;
		lifetime = argument[8];
		hitbox_set_shape(id, argument[9]);
		owner = other.id;
		facing = other.facing;
		hsp = argument[10] * other.facing;
		vsp = argument[11];
		angle_flipper = argument_count > 12 ? argument[12] : FLIPPER.standard;
		drawing_angle = owner.facing == -1 ? 180 - angle : angle;
		}
	return _newhitbox;


}
