///@func camera_shake(h,[v])
///@param h
///@param [v]
function camera_shake() {

	with(obj_game)
		{
		cam_shake_h = max(cam_shake_h, argument[0]);
		cam_shake_v = max(cam_shake_v, argument_count > 1 ? argument[1] : argument[0]);
		}


}
