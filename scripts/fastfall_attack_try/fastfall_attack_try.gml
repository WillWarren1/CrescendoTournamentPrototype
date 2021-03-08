///@func fastfall_attack_try()
///@desc Allows a character to fastfall during an attack
function fastfall_attack_try() {
	//In this version, you only need to hold down on the stick (you don't need to flick)
	//If you hold down on the stick and are already falling, fastfall.
	if (stick_get_value(Lstick, DIR.down) > stick_flick_amount)
		{
		//Fastfalling cannot be done right after a plat drop
		if (can_fastfall)
			{
			if (vsp >= 0 && vsp != fast_fall_speed)
				{
				fastfall();
				}
			}
		}
}