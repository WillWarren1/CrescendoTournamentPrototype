///@change_facing([stick],[frame])
///@param [stick]
///@param [frame]
function change_facing() {
	//Change the facing based on the control stick.
	//If it is neutral, there is no change.
	//You can pass in a certain stick as an argument
	var _stick = (argument_count > 0) ? argument[0] : Lstick;
	var _frame = (argument_count > 1) ? argument[1] : 0;
	if (stick_check(_stick, true, false, DIR.right, undefined, undefined, _frame, true))
		{
		facing = 1;
		}
	else if (stick_check(_stick, true, false, DIR.left, undefined, undefined, _frame, true))
		{
		facing = -1;
		}  
}