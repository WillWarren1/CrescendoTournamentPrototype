/// @description Draw the surface
//Make sure the surface exists first
if (!surface_exists(game_surface))
	{
	game_surface = surface_create(room_width, room_height);
	}
	
//Particle System Draw
if (game_surface_enable) surface_set_target(game_surface);

fade_shader_set();
part_system_drawit(Particle_System());
shader_reset();

if (game_surface_enable) surface_reset_target();

//Draw the new surface
if (game_surface_enable)
	{
	gpu_set_blendenable(false);
	daynight_set();
	draw_surface(game_surface, 0, 0);
	daynight_reset();
	gpu_set_blendenable(true);
	}