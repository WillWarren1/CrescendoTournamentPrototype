///@func check_rolling()
///@desc Transition to roll state if you are pressing shield and flick the control stick left or right
function check_rolling() {
	//If you are pressing a direction and the dodge buttons
	if (button(INPUT.shield, buff, false))
		{
		var _frame = stick_find_frame(Lstick, false, true, DIR.horizontal);
		if (_frame != -1)
			{
			//Reset shield button
			button_reset(INPUT.shield);
			state_set(PLAYER_STATE.rolling);
			//Facing
			change_facing(Lstick, _frame);
			//Set the rolling direction
			state_facing = facing;
			return true;
			}
		}
	return false;
}