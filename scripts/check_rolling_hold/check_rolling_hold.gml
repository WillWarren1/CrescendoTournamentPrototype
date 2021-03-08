///@func check_rolling_hold()
///@desc Transition to roll state if you are holding shield and flick the control stick left or right
function check_rolling_hold() {
	//If you are pressing a direction and the dodge buttons
	if (button_hold(INPUT.shield, buff))
		{
		var _frame = stick_find_frame(Lstick, false, true, DIR.horizontal);
		if (_frame != -1)
			{
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