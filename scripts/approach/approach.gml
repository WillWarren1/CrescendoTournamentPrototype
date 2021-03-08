///@func approach(current,target,amount)
///@desc approach(current, target, amount)
///@param current
///@param target
///@param amount
function approach() {
	var c = argument[0];
	var t = argument[1];
	var a = argument[2];
	if (c < t)
		{
	    c = min(c + a, t); 
		}
	else
		{
	    c = max(c - a, t);
		}
	return c;


}
