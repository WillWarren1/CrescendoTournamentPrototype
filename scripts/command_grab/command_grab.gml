///@func command_grab(target,hold_x,hold_y)
///@param target
///@param hold_x
///@param hold_y
///@desc Allows you to grab another player during an attack.
function command_grab() {

	var _target = argument[0];
	var _x = argument[1];
	var _y = argument[2];

	with(_target)
		{
		attack_stop(PLAYER_STATE.is_grabbed);
		grab_hold_id = other.id;
		other.grabbed_id = id;
		grab_hold_x = _x;
		grab_hold_y = _y;
		grab_hold_enable = true;
		speed_set(0, 0, false, false);
		return true;
		}
	return false;
}