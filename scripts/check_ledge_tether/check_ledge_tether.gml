///@func check_ledge_tether(distance,[x],[y])
///@desc Allows the player to tether to a distant ledge (read conditions listed below)
///@param distance
///@param [x]
///@param [y]
function check_ledge_tether() {
	var _dist = argument[0];
	if (instance_number(obj_ledge) > 0)
		{
		if (ledge_grab_timeout == 0)
			{
			var _x = argument_count > 1 ? argument[1] : x;
			var _y = argument_count > 2 ? argument[2] : y;
			var _nearest = instance_nearest(_x, _y, obj_ledge);
	
			/*
			Ledge tether conditions:
				The player cannot be on the opposite side of the ledge
				The player must be close enough to the ledge
				The player must be facing the ledge
			*/
	
			if (sign(_nearest.x - _x) != -_nearest.ledge_direction && 
				//bbox_bottom > _nearest.y &&
				point_distance(_x, _y, _nearest.x, _nearest.y) < _dist &&
				facing == _nearest.ledge_direction)
				{
				state_set(PLAYER_STATE.ledge_tether);
				ledge_id = _nearest;
				state_frame = ledge_tether_snap_time;
				facing = _nearest.ledge_direction;
				return true;
				}
			}
		}
	return false;


}
