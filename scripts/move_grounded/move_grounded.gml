///@func move_grounded()
///@desc Calls both the move_x_grounded and the move_y functions. Also does the fractions.
function move_grounded() {
	Speed_Fraction();
	move_x_grounded(sprite_get_width(mask_index));
	move_y();
}