///@func draw_action_lines(x,y,w,h,[number],[width],[deadzone],[variation],[color],[rand])
///@param x
///@param y
///@param w
///@param h
///@param [number]
///@param [width]
///@param [deadzone]
///@param [variation]
///@param [color]
///@param [rand]
function draw_action_lines() {
	var _x = argument[0];
	var _y = argument[1];
	var _w = argument[2];
	var _h = argument[3];
	var _n = argument_count > 4 ? argument[4] : 20;
	var _s = argument_count > 5 ? argument[5] : 30;
	var _d = argument_count > 6 ? argument[6] : 200;
	var _v = argument_count > 7 ? argument[7] : 100;
	var _c = argument_count > 8 ? argument[8] : c_white;
	var _r = argument_count > 9 ? argument[9] : 1;
	var _dir = 0;
	var _inc = 360 / _n;
	var _length = sqrt((_w * _w) + (_h * _h));
	//var _hw = _w / 2;
	//var _hh = _h / 2;

	draw_set_color(_c);
	draw_primitive_begin(pr_trianglelist);
	for(var i = 0; i < _n; i++)
		{
		var _rand = sin(i + _r);
		var _ix = _x + lengthdir_x(_length, _dir);
		var _iy = _y + lengthdir_y(_length, _dir);
		var _dlength = _d + _rand * _v;
		var _ex = _x + lengthdir_x(_dlength, _dir);
		var _ey = _y + lengthdir_y(_dlength, _dir);
		var _rlen = _rand * _s;
		var _vx = _ix + lengthdir_x(_rlen, _dir + 90);
		var _vy = _iy + lengthdir_y(_rlen, _dir + 90);
		draw_vertex(_ix, _iy);
		draw_vertex(_ex, _ey);
		draw_vertex(_vx, _vy);
		_dir += _inc;
		}
	draw_primitive_end();
}