///@func Layer_Fade_End()
function Layer_Fade_End() {
	shader_reset();

	if (surface_exists(obj_game.game_surface))
		{
		if (game_surface_enable) surface_reset_target();
		}


}
