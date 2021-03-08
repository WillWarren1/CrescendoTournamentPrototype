///Checks for aerial attacks
function check_aerials() {
	//If one stick is set to attack it overrides the direction of the other stick
	var _stick = stick_choose_by_input(INPUT.attack);
	//If the attack button was pressed
	if (button(INPUT.attack,buff))
		{
		//If the player is in the air
		if (!on_ground())
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
	//Tether Aerial
	else if (button(INPUT.grab, buff))
		{
		if (!on_ground())
			{
			attack_start(my_attacks[? "Zair"]);
			return true;
			}
		}
	return false;


}
