///@func move()
///@desc Calls the x and y moving functions for obj_player
function move() {
	Speed_Fraction();
	move_x();
	move_y(stick_tilted(Lstick, DIR.down));
}