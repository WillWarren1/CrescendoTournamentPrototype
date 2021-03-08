///@func aerial_drift();
function aerial_drift() {
	//Allows a character to drift in the air
	var _max_speed = jump_is_dash_jump ? max_air_speed_dash : max_air_speed;

	if (stick_tilted(Lstick, DIR.horizontal))
		{
		var _dir = sign(stick_get_value(Lstick, DIR.horizontal));
		hsp += air_accel * _dir;
		}
	
	hsp = clamp(hsp, -_max_speed, _max_speed);


}
