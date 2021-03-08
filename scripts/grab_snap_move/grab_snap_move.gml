///@args [grabbed_id]
///@desc Move the player you grabbed toward the grab_hold coordinates.
function grab_snap_move() {
	var _grabbed_id = argument_count > 0 ? argument[0] : grabbed_id;
	with(_grabbed_id)
		{
		if (grab_hold_enable)
			{
			speed_set_towards_point
				(
				grab_hold_id.x + (grab_hold_x * grab_hold_id.facing),
				grab_hold_id.y + grab_hold_y,
				grab_snap_speed
				);
			move();
			speed_set(0, 0, false, false);
			}
		}
}