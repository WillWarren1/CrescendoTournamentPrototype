/// @description
if (surface_exists(obj_game.game_surface))
	{
	if (game_surface_enable) surface_set_target(obj_game.game_surface);
	
	if (fx_allow_fade)
		{
		fade_shader_set();
		}
		
	var _alpha = fade ? lerp(0, fx_alpha, lifetime / total_life) : fx_alpha;
	draw_sprite_ext(fx_sprite, fx_frame, floor(x), floor(y), fx_xscale, fx_yscale, fx_angle, fx_blend, _alpha);
	
	if (fx_allow_fade)
		{
		shader_reset();
		}

	if (game_surface_enable) surface_reset_target();
	}