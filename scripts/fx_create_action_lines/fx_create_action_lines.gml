///@func fx_create_action_lines(lifetime,x,y,rand,[layer])
///@param lifetime
///@param x
///@param y
///@param rand
///@param [layer]
function fx_create_action_lines() {
	var _fx = instance_create_layer(argument[1], argument[2], (argument_count > 4 ? argument[4] : "FX_Layer"), obj_action_lines);
	with(_fx)
		{
		lifetime = argument[0];
		rand = argument[3];
		total_life = lifetime;
		}
	return _fx;


}
