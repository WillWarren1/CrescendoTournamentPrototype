///@func b_reverse()
///@desc Changes the user's direction
function b_reverse() {
	if (stick_tilted(Lstick, DIR.horizontal) && sign(stick_get_value(Lstick, DIR.horizontal)) != facing)
		{
		hsp *= -1;
		facing *= -1;
		}


}
