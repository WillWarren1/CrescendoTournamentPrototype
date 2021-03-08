///The HUD script for adding a limit gauge
///@args x,y,player,alpha
function hud_limit_gauge() {
	var _x = argument[0];
	var _y = argument[1];
	var _player = argument[2];
	var _alpha = argument[3];
	var _limit_gauge = _player.custom_script_struct.limit_gauge;
	var _limit_gauge_max = 500;
	draw_set_alpha(_alpha);
	draw_set_color(c_dkgray);
	draw_rectangle(_x - 60, _y - 60, _x + 30, _y - 52, false);
	if (_limit_gauge > 0)
		{
		draw_set_color(_limit_gauge == _limit_gauge_max ? $FFFF00 : $8934eb);
		draw_rectangle(_x - 60, _y - 60, _x - 60 + (90 * (_limit_gauge / _limit_gauge_max)), _y - 52, false);
		}
	draw_set_alpha(1);
	return;


}
