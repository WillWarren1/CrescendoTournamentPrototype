///@func aerial_drift_momentum();
function aerial_drift_momentum() {
	//Allows a character to drift in the air
	//Allows characters to drift at higher speeds than the normal limit
	var _max_speed = jump_is_dash_jump ? max_air_speed_dash : max_air_speed;

	if (stick_tilted(Lstick, DIR.horizontal))
		{
		var _dir = sign(stick_get_value(Lstick, DIR.horizontal));
		if (_dir == 1 && hsp < _max_speed)
			{
			hsp += air_accel;
			hsp = min(hsp, _max_speed);
			}
		if (_dir == -1 && hsp > -_max_speed)
			{
			hsp -= air_accel;
			hsp = max(hsp, -_max_speed);
			}
		}


}
