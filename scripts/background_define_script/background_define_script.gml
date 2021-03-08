///@func background_define_script(sprite,xoff,yoff,scale,move_x,move_y,xspd,yspd,absolute,img_speed,script)
///@param sprite
///@param xoff
///@param yoff
///@param scale
///@param move_x
///@param move_y
///@param xspd
///@param yspd
///@param absolute
///@param img_speed
///@param script
function background_define_script() {

	var _new = array_create(BACK.length);

	_new[BACK.sprite] = argument[0];
	_new[BACK.x] = argument[1];
	_new[BACK.y] = argument[2];
	_new[BACK.scale] = argument[3];
	_new[BACK.parallax_x] = argument[4];
	_new[BACK.parallax_y] = argument[5];
	_new[BACK.xspd] = argument[6];
	_new[BACK.yspd] = argument[7];
	_new[BACK.absolute] = argument[8];
	_new[BACK.imgspeed] = argument[9];
	_new[BACK.frame] = 0;
	_new[BACK.script] = argument[10];

	return _new;


}
