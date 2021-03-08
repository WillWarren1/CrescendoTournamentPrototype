/// @description
if (surface_exists(obj_game.game_surface))
	{
	if (game_surface_enable) surface_set_target(obj_game.game_surface);
	
	fade_shader_set();
	draw_sprite_ext(fx_sprite, fx_frame, floor(x), floor(y), fx_xscale, fx_yscale, fx_angle, image_blend, image_alpha);
	shader_reset();

	if (game_surface_enable) surface_reset_target();
	}