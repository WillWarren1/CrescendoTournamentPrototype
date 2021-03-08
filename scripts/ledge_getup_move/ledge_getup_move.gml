///@func ledge_getup()
///@desc To be called by a player. Changes their x and y to get up from a ledge
function ledge_getup_move() {

	//Snap to getup position
	if ((ledge_getup_check_collision && 
		!collision(x + ledge_getup_finish_x * facing, y + ledge_getup_finish_y, flags_create(FLAG.solid))) ||
		!ledge_getup_check_collision)
		{
		x += ledge_getup_finish_x * facing;
		y += ledge_getup_finish_y;
		move_out_of_blocks(90);
		}
}