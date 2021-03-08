///@func reverse_b()
///@desc Changes the user's direction
function reverse_b() {
	var _reverse = facing == 1 ? DIR.left : DIR.right;
	if (stick_check(Lstick, false, true, _reverse, undefined, undefined, buff))
		{
		facing *= -1;
		}


}
