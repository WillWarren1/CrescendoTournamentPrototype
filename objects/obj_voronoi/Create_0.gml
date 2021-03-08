/// @description
if (only_one()) then exit;

#region Voronoi Init
length = 250;
uni_arx = shader_get_uniform(shd_voronoi, "point_x");
uni_ary = shader_get_uniform(shd_voronoi, "point_y");
uni_r = shader_get_uniform(shd_voronoi, "point_r");
uni_g = shader_get_uniform(shd_voronoi, "point_g");
uni_b = shader_get_uniform(shd_voronoi, "point_b");
uni_t = shader_get_uniform(shd_voronoi, "time");
uni_f = shader_get_uniform(shd_voronoi, "fade");

point_x = [];
point_y = [];
point_hsp = [];
point_vsp = [];
point_r = [];
point_g = [];
point_b = [];

repeat(length)
	{
	point_x[array_length(point_x)] = irandom_range(0, screen_width);
	point_y[array_length(point_y)] = irandom_range(0, screen_height);
	point_hsp[array_length(point_hsp)] = random_range(-0.5, 0.5);
	point_vsp[array_length(point_vsp)] = random_range(-0.5, 0.5);
	point_r[array_length(point_r)] = random_range(0.0, 1.0);
	point_g[array_length(point_g)] = random_range(0.0, 1.0);
	point_b[array_length(point_b)] = random_range(0.0, 1.0);
	}
#endregion