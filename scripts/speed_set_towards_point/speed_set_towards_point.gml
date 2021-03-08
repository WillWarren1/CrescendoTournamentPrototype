///@func speed_set_towards_point(px,py,speed)
///@desc Set the player's speed to move toward a point
///@param px
///@param py
///@param speed
function speed_set_towards_point() {
	var _px = argument[0],
		_py = argument[1],
		_spd = argument[2];
	
	var _dist = min(point_distance(x, y, _px, _py), _spd),
		_dir = point_direction(x, y, _px, _py);

	speed_set(lengthdir_x(_dist, _dir), lengthdir_y(_dist, _dir), false, false);
}