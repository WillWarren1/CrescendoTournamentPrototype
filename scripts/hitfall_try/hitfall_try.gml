///@func hitfall_try()
///@desc Allows you to fastfall if you hit the opponent
function hitfall_try() {
	if (can_hitfall)
		{
		//If you have hit an attack
		if (attack_has_hit())
			{
			if (stick_flicked(Lstick, DIR.down))
				{
				fastfall();
				}
			}
		}


}
