///@func check_run_stop()
///@desc Allows the player to stop running
function check_run_stop() {
	//The player enters the run stop state when they are no longer tilting the control stick
	if (!stick_tilted(Lstick,DIR.horizontal))
		{
		state_set(PLAYER_STATE.run_stop);
		state_frame=run_stop_time;
		return true;
		}
	return false;


}
