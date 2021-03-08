/// @description
if (surface_exists(obj_game.game_surface))
	{
	var _s = custom_fx_struct;

	if (game_surface_enable) surface_set_target(obj_game.game_surface);
	
	var _alpha = fade ? lerp(0, image_alpha, lifetime / total_life) : image_alpha;
	
	shader_set(shd_dust_cloud);
	shader_set_uniform_f(_s.uni_c, _s.color[0], _s.color[1], _s.color[2]);
	draw_sprite_ext(fx_sprite, fx_frame, floor(x), floor(y), fx_xscale, fx_yscale, fx_angle, c_white, _alpha);
	shader_reset();
	
	if (game_surface_enable) surface_reset_target();
	}