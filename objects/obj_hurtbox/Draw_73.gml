/// @description
if (surface_exists(obj_game.game_surface))
	{
	if (game_surface_enable) surface_set_target(obj_game.game_surface);
	
	if (setting().show_hurtboxes)
		{
		draw_self();
		}
		
	if (game_surface_enable)surface_reset_target();
	}