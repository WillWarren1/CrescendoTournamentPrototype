///Checks for grounded attacks (Jab, Tilts, Taunt)
function check_grounds() {
	//If one stick is set to attack it overrides the direction of the other stick
	var _stick = stick_choose_by_input(INPUT.attack);
	//If the player is on the ground
	if (on_ground())
		{
		//If the attack button has been pressed
		if (button(INPUT.attack, buff))
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
					attack_start(my_attacks[? "Utilt"]);
					}
				else
				//Dtilt
				if (stick_flicked(Rstick, DIR.down, buff, true, STICK_CHECK_TYPE.backwards))
					{
					attack_start(my_attacks[? "Dtilt"]);
					}
				else
				//Ftilt
				if (stick_flicked(Rstick, DIR.horizontal, buff, true, STICK_CHECK_TYPE.backwards))
					{
					attack_start(my_attacks[? "Ftilt"]);
					}
				else
				//Jab
					{
					attack_start(my_attacks[? "Jab"]);
					}
				}
			else
			//Left stick has to check for the special control setting "smash stick"
			if (scs_smash_stick && stick_flicked(Lstick))
				{
				//Change direction
				change_facing(Lstick);
				//Usmash
				if (stick_tilted(Lstick, DIR.up))
					{
					attack_start(my_attacks[? "Usmash"]);
					}
				else
				//Dsmash
				if (stick_tilted(Lstick, DIR.down))
					{
					attack_start(my_attacks[? "Dsmash"]);
					}
				else
				//Fsmash
					{
					attack_start(my_attacks[? "Fsmash"]);
					}
				}
			else
				{
				//Change direction
				change_facing(Lstick);
				//Utilt
				if (stick_tilted(Lstick, DIR.up))
					{
					attack_start(my_attacks[? "Utilt"]);
					}
				else
				//Dtilt
				if (stick_tilted(Lstick, DIR.down))
					{
					attack_start(my_attacks[? "Dtilt"]);
					}
				else
				//Ftilt
				if (stick_tilted(Lstick, DIR.horizontal))
					{
					attack_start(my_attacks[? "Ftilt"]);
					}
				else
				//Jab
					{
					attack_start(my_attacks[? "Jab"]);
					}
				}
			return true;
			}
		else
			{
			//Taunt
			if (button(INPUT.taunt, buff))
				{
				attack_start(my_attacks[? "Taunt"]);
				return true;
				}
			}
		}
	return false;


}
