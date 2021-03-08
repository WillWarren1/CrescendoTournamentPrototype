///@func fx_create_color(sprite,image_speed,index,lifetime,x,y,scale,angle,[layer])
///@param sprite
///@param image_speed
///@param index
///@param lifetime
///@param x
///@param y
///@param scale
///@param angle
///@param [layer]
function fx_create_color() {
	var _fx = instance_create_layer(argument[4], argument[5], (argument_count > 8 ? argument[8] : "FX_Layer"), obj_fx_color);
	with(_fx)
		{
		fx_sprite = argument[0];
		fx_speed = argument[1];
		fx_frame = argument[2];
		lifetime = argument[3];
		fx_xscale = argument[6];
		fx_yscale = argument[6];
		fx_angle = argument[7];
		total_life = lifetime;
		owner = other.id;
		}
	return _fx;


}
