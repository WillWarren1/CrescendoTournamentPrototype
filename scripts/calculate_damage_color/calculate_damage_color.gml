///@func calculate_damage_color(damage)
///@param damage
function calculate_damage_color() {
	var d = argument[0];
	if (d < 15)
		{
		return c_white;
		}
	if (d < 40)
		{
		return merge_color(c_white, c_yellow, (d - 15) / 40);
		}
	if (d < 80)
		{
		return merge_color(c_yellow, c_orange, (d - 40) / 80);
		}
	if (d < 140)
		{
		return merge_color(c_orange, c_red, (d - 80) / 140);
		}
	else
		{
		return merge_color(c_red, c_black, min((d - 140) / 300, 1));
		}


}
