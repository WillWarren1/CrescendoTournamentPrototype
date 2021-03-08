/// @description
if (surface_exists(obj_game.game_surface))
	{
	var _s = custom_fx_struct;

	if (game_surface_enable) surface_set_target(obj_game.game_surface);
	
	fade_shader_set();
	draw_action_lines(x, y, screen_width, screen_height, 15, 30, lerp(400, 100, lifetime / total_life), 100, c_white, _s.rand);
	shader_reset();

	if (game_surface_enable) surface_reset_target();
	}