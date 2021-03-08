///Checks for special attacks
function check_specials() {
	//If one stick is set to attack it overrides the direction of the other stick
	var _stick = stick_choose_by_input(INPUT.special);
	//Special Attacks (ground or aerial)
	if (button(INPUT.special, buff))
		{
		if (_stick == Rstick)
			{
			//Change direction
			var _frame = stick_find_frame(Rstick, false, true, DIR.horizontal, undefined, undefined, buff, false);
			if (_frame == -1) then _frame = 0;
			change_facing(Rstick, _frame);
			//Utilt
			if (stick_flicked(Rstick, DIR.up, buff, true, STICK_CHECK_TYPE.backwards))
				{
				attack_start(my_attacks[? "Uspec"]);
				}
			else
			//Dtilt
			if (stick_flicked(Rstick, DIR.down, buff, true, STICK_CHECK_TYPE.backwards))
				{
				attack_start(my_attacks[? "Dspec"]);
				}
			else
			//Ftilt
			if (stick_flicked(Rstick, DIR.horizontal, buff, true, STICK_CHECK_TYPE.backwards))
				{
				attack_start(my_attacks[? "Fspec"]);
				}
			else
			//Jab
				{
				attack_start(my_attacks[? "Nspec"]);
				}
			}
		else
			{
			//Change direction
			change_facing(Lstick);	
			//Uspec
			if (stick_tilted(Lstick, DIR.up))
				{
				attack_start(my_attacks[? "Uspec"]);
				}
			else
			//Dspec
			if (stick_tilted(Lstick, DIR.down))
				{
				attack_start(my_attacks[? "Dspec"]);
				}
			else
			//Fspec
			if (stick_tilted(Lstick, DIR.horizontal))
				{
				attack_start(my_attacks[? "Fspec"]);
				}
			else
			//Nspec
				{
				attack_start(my_attacks[? "Nspec"]);
			}
			}
		return true;
		}
	return false;


}
