///Checks for smash attacks or aerials
function check_smashes() {
	//If one stick is set to attack it overrides the direction of the other stick
	var _stick = stick_choose_by_input(INPUT.smash);
	var _smash_button = button(INPUT.smash, buff);
	var _ab_smash = (scs_AB_smash && button(INPUT.attack, buff, false) && button(INPUT.special, buff, false));
	var _smash_stick = (scs_smash_stick && stick_flicked(Lstick, DIR.any, buff, false) && button(INPUT.attack, buff));
	//Smash stick override
	if (_smash_stick) then _stick = Lstick;
	//Check for all possible smash inputs
	if (_smash_button || _ab_smash || _smash_stick)
		{
		//If the player is on the ground
		if (on_ground())
			{
			if (_stick == Rstick)
				{
				if (stick_flicked(Rstick, DIR.up, buff, true, STICK_CHECK_TYPE.backwards))
					{
					attack_start(my_attacks[? "Usmash"]);
					}
				else
				if (stick_flicked(Rstick, DIR.down, buff, true, STICK_CHECK_TYPE.backwards))
					{
					attack_start(my_attacks[? "Dsmash"]);
					}
				else
					{
					//Change direction 
					var _frame = stick_find_frame(Rstick, false, true, DIR.horizontal, undefined, undefined, buff, false);
					if (_frame == -1) then _frame = 0;
					change_facing(Rstick, _frame);
					attack_start(my_attacks[? "Fsmash"]);
					}
				}
			else
				{
				if (stick_tilted(Lstick, DIR.up))
					{
					attack_start(my_attacks[? "Usmash"]);
					}
				else
				if (stick_tilted(Lstick, DIR.down))
					{
					attack_start(my_attacks[? "Dsmash"]);
					}
				else
					{
					//Change direction 
					change_facing(Lstick);
					attack_start(my_attacks[? "Fsmash"]);
					}
				}
			return true;
			}
		else
		//If the player is in the air
			{
			if (_stick == Rstick)
				{
				if (stick_flicked(Rstick, DIR.up, buff, true, STICK_CHECK_TYPE.backwards))
					{
					attack_start(my_attacks[? "Uair"]);
					}
				else
				if (stick_flicked(Rstick, DIR.down, buff, true, STICK_CHECK_TYPE.backwards))
					{
					attack_start(my_attacks[? "Dair"]);
					}
				else
					{
					var _frame = stick_find_frame(Rstick, false, true, DIR.horizontal, undefined, undefined, buff, false);
					if (_frame == -1) then _frame = 0;
					if (stick_flicked(Rstick, DIR.horizontal, buff, true, STICK_CHECK_TYPE.backwards))
						{
						//Is the control stick in the direction the player is facing?
						if (sign(stick_get_value(Rstick, DIR.horizontal, _frame)) == sign(facing))
							{
							attack_start(my_attacks[? "Fair"]);
							}
						else
							{
							attack_start(my_attacks[? "Bair"]);
							}
						}
					else
						{
						attack_start(my_attacks[? "Nair"]);
						}
					}
				}
			else
				{
				if (stick_tilted(Lstick, DIR.up))
					{
					attack_start(my_attacks[? "Uair"]);
					}
				else
				if (stick_tilted(Lstick, DIR.down))
					{
					attack_start(my_attacks[? "Dair"]);
					}
				else
				if (stick_tilted(Lstick, DIR.horizontal))
					{
					//Is the control stick in the direction the player is facing?
					if (sign(stick_get_value(Lstick, DIR.horizontal)) == sign(facing))
						{
						attack_start(my_attacks[? "Fair"]);
						}
					else
						{
						attack_start(my_attacks[? "Bair"]);
						}
					}
				else
					{
					attack_start(my_attacks[? "Nair"]);
					}
				}
			return true;
			}
		}
	return false;
}