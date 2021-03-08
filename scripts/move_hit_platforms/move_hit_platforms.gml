///@func move_hit_platforms()
///@desc Calls both the move_x and the move_y functions and does the fractions.
function move_hit_platforms() {
	Speed_Fraction();
	move_x();
	move_y(false);
}