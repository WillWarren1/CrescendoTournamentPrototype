///@func background_define(sprite,xoff,yoff,scale,move_x,move_y,[xspd],[yspd],[absolute],[img_speed])
///@param sprite
///@param xoff
///@param yoff
///@param scale
///@param move_x
///@param move_y
///@param [xspd]
///@param [yspd]
///@param [absolute]
///@param [img_speed]
function background_define() {

	var _new = array_create(BACK.length);

	_new[BACK.sprite] = argument[0];
	_new[BACK.x] = argument[1];
	_new[BACK.y] = argument[2];
	_new[BACK.scale] = argument[3];
	_new[BACK.parallax_x] = argument[4];
	_new[BACK.parallax_y] = argument[5];
	_new[BACK.xspd] = argument_count > 6 ? argument[6] : 0;
	_new[BACK.yspd] = argument_count > 7 ? argument[7] : 0;
	_new[BACK.absolute] = argument_count > 8 ? argument[8] : false;
	_new[BACK.imgspeed] = argument_count > 9 ? argument[9] : 0;
	_new[BACK.frame] = 0;
	_new[BACK.script] = -1;

	return _new;


}
