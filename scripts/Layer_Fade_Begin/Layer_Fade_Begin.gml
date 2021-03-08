///@func Layer_Fade_Begin()
///@desc The layer start script for the asset layers
function Layer_Fade_Begin() {
	fade_shader_set();

	if (surface_exists(obj_game.game_surface))
		{
		if (game_surface_enable) surface_set_target(obj_game.game_surface);
		}


}
