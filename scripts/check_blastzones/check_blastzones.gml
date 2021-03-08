///@func check_blastzones(x1,y1,x2,y2)
///@param x1
///@param y1
///@param x2
///@param y2
function check_blastzones(argument0, argument1, argument2, argument3) {
	//If you are completely outside the blastzone on the left, right, or bottom
	if (bbox_left < argument0 ||
		bbox_right > argument2 ||
		bbox_bottom > argument3)
		{
		return true;
		}

	//If you are in hitstun and outside the blastzone on the top
	if (state == PLAYER_STATE.in_hitstun || state == PLAYER_STATE.in_balloon || is_dead())
		{
		if (bbox_top < argument1)
			{
			return true;
			}
		}
	return false;


}
