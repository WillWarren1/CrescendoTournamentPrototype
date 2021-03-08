///@func Voronoi_Change_Color(r_range,g_range,b_range)
///@param r_range
///@param g_range
///@param b_range
function Voronoi_Change_Color(argument0, argument1, argument2) {
	if (instance_exists(obj_voronoi))
		{
		with(obj_voronoi)
			{
			for(var i = 0; i < length; i++)
				{
				point_r[@ i] = random_range(argument0[0], argument0[1]);
				point_g[@ i] = random_range(argument1[0], argument1[1]);
				point_b[@ i] = random_range(argument2[0], argument2[1]);
				}
			}
		return true;
		}
	return false;
}