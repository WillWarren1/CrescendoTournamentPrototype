///@func cancel_jump_check()
///@desc Cancels an attack if you can jump
function cancel_jump_check() {
	if (button(INPUT.jump, buff))
		{
		if (on_ground())
			{
			attack_stop(PLAYER_STATE.jumpsquat);
			jump_is_midair_jump = false;
			state_frame = jumpsquat_time;
			jump_is_dash_jump = false;
			return true;
			}
		else
		if (double_jumps > 0)
			{
			attack_stop(PLAYER_STATE.aerial);
			double_jump();
			return true;
			}
		}
	return false;
}