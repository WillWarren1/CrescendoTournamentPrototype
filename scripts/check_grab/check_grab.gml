///Checks for normal grab
function check_grab() {
	//If one stick is set to grab it overrides the direction of the other stick
	var _stick = stick_choose_by_input(INPUT.grab);
	//If the grab button has been pressed OR if the player is shielding and pressing the attack button
	if (button(INPUT.grab, buff) || (state == PLAYER_STATE.shielding && button(INPUT.attack, buff)))
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
		attack_start(my_attacks[? "Grab"]);
		return true;
		}
	return false;


}
