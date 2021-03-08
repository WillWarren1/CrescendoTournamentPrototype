///Checks for dash grabs
function check_dash_grab() {
	//If the grab button has been pressed
	var _stick = stick_choose_by_input(INPUT.grab);
	if (button(INPUT.grab, buff))
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
		attack_start(my_attacks[? "DashG"]);
		return true;
		}
	return false;


}
