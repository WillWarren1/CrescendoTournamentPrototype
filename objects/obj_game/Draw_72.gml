/// @description Clear the surface
if (!surface_exists(game_surface))
	{
	game_surface = surface_create(room_width, room_height);
	}
	
surface_set_target(game_surface);
draw_clear(c_ltgray);
surface_reset_target();