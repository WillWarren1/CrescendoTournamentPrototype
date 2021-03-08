///@func check_crouch()
///@desc Transition to crouching state if you are holding down on the stick
function check_crouch() {
	//If control stick is below an amount
	if (stick_tilted(Lstick,DIR.down))
		{
		//Set the state to crouching and stop the script.
		state_set(PLAYER_STATE.crouching);
		return true;
		}
	return false;


}
