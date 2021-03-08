///@func check_jump()
///@desc Allows jumping
function check_jump() {
	//If the jump button is pressed
	if (on_ground())
		{
		if (button(INPUT.jump, buff))
			{
			//Change state to jump state, set jumpsquat, and exit the script.
			state_set(PLAYER_STATE.jumpsquat);
			state_frame = jumpsquat_time;
			jump_is_midair_jump = false;
			//Dash jump (higher speed cap)
			jump_is_dash_jump = false;
			//Special variables for SCS
			jump_is_shorthop = false;
			return true;
			}
		}
	return false;
}