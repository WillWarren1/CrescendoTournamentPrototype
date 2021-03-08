///@func allow_hitfall([unallow])
///@param [unallow]
function allow_hitfall() {
	if (argument_count > 0)
		{
		can_hitfall = !argument[0];
		}
	else
		{
		can_hitfall = true;
		}


}
