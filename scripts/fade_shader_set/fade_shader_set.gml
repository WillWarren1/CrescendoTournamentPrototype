///@func fade_shader_set()
///@desc Sets up the fade shader. Requires obj_stage_manager to be in the room.
function fade_shader_set() {
	if (instance_exists(obj_stage_manager))
		{
		shader_set(shd_fade);
		shader_set_uniform_f(obj_stage_manager.uni_black, (1 - obj_stage_manager.background_clear_amount));
		return true;
		}
	return false;
}