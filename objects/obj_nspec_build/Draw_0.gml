/// @description
if (surface_exists(obj_game.game_surface))
	{
	if (game_surface_enable) surface_set_target(obj_game.game_surface);
	
	//Set up the shader and draw
	fade_shader_set();
	draw_self();
	shader_reset();
	
	if (game_surface_enable) surface_reset_target();
	}