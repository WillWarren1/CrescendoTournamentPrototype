/// @description
if (surface_exists(obj_game.game_surface))
	{
	if (game_surface_enable) surface_set_target(obj_game.game_surface);
	
	var _s = custom_entity_struct;
	
	//Fade value
	var _f = background_get_clear_amount();
	
	//Set up the shader and draw
	palette_shader_set(_s.palette_sprite, _s.player_color, 0.0, 1.0, _f, entity_outline, c_black);
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, _s.angle, image_blend, image_alpha);
	shader_reset();
	
	if (game_surface_enable) surface_reset_target();
	}