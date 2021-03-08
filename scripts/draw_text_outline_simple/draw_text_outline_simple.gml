///@func draw_text_outline_simple(x,y,string)
///@param x
///@param y
///@param string
function draw_text_outline_simple() {
	var _x = round(argument[0]);
	var _y = round(argument[1]);
	var _s = argument[2];
	draw_set_color(c_black);

	draw_text(_x + 1, _y, _s);
	draw_text(_x - 1, _y, _s);
	draw_text(_x, _y + 1, _s);
	draw_text(_x, _y - 1, _s);

	draw_set_color(c_white);

	draw_text(_x, _y, _s);


}
