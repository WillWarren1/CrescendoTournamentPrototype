///Checks for grounded upward attacks
function check_upward_grounds() {
	//If the player is on the ground
	if (on_ground())
		{
		if (scs_smash_stick)
			{
			//Up Smash
			if (stick_flicked(Lstick, DIR.up) && button(INPUT.attack, buff))
				{
				attack_start(my_attacks[? "Usmash"]);
				return true;
				}
			}
		
		var _stick = stick_choose_by_input(INPUT.smash);
		if (stick_tilted(_stick, DIR.up))
			{
			//Up Smash
			if (button(INPUT.smash, buff) ||
				(scs_AB_smash && button(INPUT.attack, buff, false) && button(INPUT.special, buff, false)))
				{
				if (_stick == Rstick)
					{
					//Change direction
					var _frame = stick_find_frame(Rstick, false, true, DIR.horizontal, undefined, undefined, buff, false);
					if (_frame == -1) then _frame = 0;
					change_facing(Rstick, _frame);
					}
				else
					{
					change_facing(Lstick);
					}
				attack_start(my_attacks[? "Usmash"]);
				return true;
				}
			}
		
		var _stick = stick_choose_by_input(INPUT.special);
		if (stick_tilted(_stick, DIR.up))
			{
			//Up Special
			if (button(INPUT.special, buff))
				{
				if (_stick == Rstick)
					{
					//Change direction
					var _frame = stick_find_frame(Rstick, false, true, DIR.horizontal, undefined, undefined, buff, false);
					if (_frame == -1) then _frame = 0;
					change_facing(Rstick, _frame);
					}
				else
					{
					change_facing(Lstick);
					}
				attack_start(my_attacks[? "Uspec"]);
				return true;
				}
			}
		}
	return false;


}
