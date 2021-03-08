/// @description
#region Voronoi Render
shader_set(shd_voronoi);
shader_set_uniform_f_array(uni_arx, point_x);
shader_set_uniform_f_array(uni_ary, point_y);
shader_set_uniform_f_array(uni_r, point_r);
shader_set_uniform_f_array(uni_g, point_g);
shader_set_uniform_f_array(uni_b, point_b);
shader_set_uniform_f(uni_t, current_time / 20);
shader_set_uniform_f(uni_f, 0.0);
draw_rectangle(0, 0, screen_width, screen_height, false);
shader_reset();
#endregion