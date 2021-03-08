///@func speed_set_towards_point_accel(px,py,accel,max)
///@desc Set the player's speed to move toward a point
///@param px
///@param py
///@param accel
///@param max
function speed_set_towards_point_accel() {
	var _px = argument[0],
		_py = argument[1],
		_acc = argument[2],
		_max = argument[3];
	
	var _dist = min(point_distance(x ,y, _px, _py), _max),
		_dir = point_direction(x, y, _px, _py);

	speed_set
		(
		approach(hsp,lengthdir_x(_dist, _dir),_acc),
		approach(vsp,lengthdir_y(_dist, _dir),_acc),
		false, false
		);


}
