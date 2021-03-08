///@func fastfall_try()
///@desc Allows a character to fastfall
function fastfall_try() {
	//If you flick down on the stick and are already falling, fastfall.
	//Fastfalling cannot be done right after a plat drop
	if (can_fastfall)
		{
		if (vsp >= 0 && vsp != fast_fall_speed)
			{
			if (stick_flicked(Lstick, DIR.down, fastfall_buffer))
				{
				fastfall();
				}
			}
		}


}
