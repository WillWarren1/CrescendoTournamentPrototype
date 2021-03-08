///@func daynight_set()
///@desc Turns on the day night shader
function daynight_set() {
	if (setting().daynight_cycle_enable)
		{
		if (instance_exists(obj_game))
			{
			shader_set(shd_daynight);
			shader_set_uniform_f(obj_game.uni_red,   obj_game.daynight_r);
			shader_set_uniform_f(obj_game.uni_green, obj_game.daynight_g);
			shader_set_uniform_f(obj_game.uni_blue,  obj_game.daynight_b);
			}
		}


}
