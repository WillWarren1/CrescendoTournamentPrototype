///@func speed_set(hsp,vsp,[hrelative],[vrelative])
///@param hsp
///@param vsp
///@param [hrelative]
///@param [vrelative]
///@desc Sets the speed of the player using horizontal and vertical components
function speed_set() {
	//You can set it relative to the current speed (+=) or to an absolute value (=)
	if (argument_count > 2 && argument[2])
		{
		hsp += argument[0];
		}
	else
		{
		hsp = argument[0];
		hsp_frac = 0;
		}
	if (argument_count > 3 && argument[3])
		{
		vsp += argument[1];
		}
	else
		{
		vsp = argument[1];
		vsp_frac = 0;
		}


}
